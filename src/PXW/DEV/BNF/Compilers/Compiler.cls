Include PXW.DEV.BNF.Compilers.macros

Class PXW.DEV.BNF.Compilers.Compiler Extends %RegisteredObject [ DependsOn = PXW.DEV.BNF.super ]
{

Property Loader As PXW.DEV.BNF.Compilers.loader;

Property CurrentClass As %Dictionary.ClassDefinition;

Property CurrentMethod As %Dictionary.MethodDefinition;

Property UniqueMethodId As %Integer;

Property parser As PXW.DEV.BNF.super;

Property keywords As %String [ MultiDimensional ];

Method %OnNew(inputText As %String) As %Status
{
    Set ..parser=..parserNewObject()
    Set ..parser.stream=##class(PXW.DEV.InputStream).NewString(inputText)
    Quit $$$OK
}

// d ##class(PXW.DEV.BNF.Compiler).goload("PXW.DEV.BNF.DEF.COS","PXW.DEV.BNF.GEN.COSauto")

ClassMethod goload(DEFClass As %String = "", DestinationClass As %String, forceVersion As %Integer = "") As %Status
{
    #dim compiler as PXW.DEV.BNF.Compilers.Compiler

    Set input=..load(DEFClass_"||"_"file",.arr,.version)
    If forceVersion'="" Set version=forceVersion
    If version=3 {
        ;Set compiler=##class(PXW.DEV.BNF.Compilers.Compiler3).%New(input)
     } ElseIf version=2 {
        Set compiler=##class(PXW.DEV.BNF.Compilers.Compiler2).%New(input)
    } Else {
        Set compiler=##class(PXW.DEV.BNF.Compilers.Compiler1).%New(input)
        ; /*************************************************** TEMP CODE ***************************/
        ;s compiler.parser=##class(PXW.DEV.BNF.Run.BNF2).%New()
        ;s compiler.parser.stream=##class(PXW.DEV.InputStream).NewString(input)
        ;s compiler.parser.EqualsChars="::="
        ; /*************************************************** TEMP CODE ***************************/
    }
    Set subElement=##class(PXW.DEV.Element).%New()
    Set compiler.Loader=$SYSTEM.OBJ.New(DEFClass)
    Set elementtype=$PARAMETER(compiler.Loader,"SubElementType")
    Set KeywordPattern=$PARAMETER(compiler.Loader,"KeywordPattern")
    If compiler.parser.File(subElement,.fileElement) {
        Set sc=compiler.compile(fileElement,DestinationClass,elementtype,KeywordPattern) 
        If $$$ISOK(sc) {
            Set sc=$SYSTEM.OBJ.Compile(DestinationClass,"ckb")
        } Else {
            Set sc1=$$$ERROR("5001","Code generate problem")
            Set sc=$$$ADDSC(sc1,sc)
        }
    } Else {
        Set sc=$$$ERROR(5001,"Code parse problem")
    }
    Quit sc
}

Method compile(Element As PXW.DEV.Element, ToClassName As %String, elementtype As %String, KeywordPattern As %String) As %Status
{
    #dim class as %Dictionary.ClassDefinition
    #dim method as %Dictionary.MethodDefinition

    Set class=##class(%Dictionary.ClassDefinition).%OpenId(ToClassName) 
    If '$ISOBJECT(class) {
        Set class=##class(%Dictionary.ClassDefinition).%New()
        Set class.Name=ToClassName
    }
    Set class.Super=##class(PXW.DEV.BNF.super).%ClassName(1)
    Do class.Methods.Clear()
    Set class.ProcedureBlock=1
    Set class.Description="Created: "_$ZDATETIME($HOROLOG,3)_" "_..%ClassName(1)

     Do class.Parameters.Clear()
    Set parameter=##class(%Dictionary.ParameterDefinition).%New()
    Set parameter.Name="KeywordPattern"
    Set parameter.parent=class
    Set parameter.Default=KeywordPattern

    Set newmethod=##class(%Dictionary.MethodDefinition).%New()
    Set newmethod.Name="newElement"
    Set newmethod.FormalSpec="Type:%String"
    Set newmethod.parent=class
    Set newmethod.ReturnType=elementtype
    Do newmethod.Implementation.Write($CHAR(9)_"quit ##class("_elementtype_").%New(Type)")

    Set ..CurrentClass=class
    Set pkey=""
    For  {
        Set def=Element.partsGetNext(.pkey)
        Quit:pkey=""

        If def.type="Definition" {
            ;w !!
            ;w def.ToString(" ")
            ;w !
            Do ..compileDefinition(def)
        } Else {
            ;w !,"**** UNKNOWN ******"
            ;break
            ;d def.write()
            ;w !,"**** UNKNOWN ******"_def.type
        }

    }

    Set words="",sep=""
    Set w="" For  { Set w=$ORDER(..keywords(w)) Quit:w=""  Set words=words_sep_w,sep="," }
    Set parameter=##class(%Dictionary.ParameterDefinition).%New()
    Set parameter.Name="Keywords"
    Set parameter.parent=class
    Set parameter.Default=words
   
    Set sc=class.%Save()
    Quit sc
}

/*
rule::=KEYWORD|or|subrule|optional-group|call
Element=Definition PXW.DEV.BNF.Element @216
.type=Definition:
. rule
.Element=Equals PXW.DEV.BNF.Element @202
..type=Keyword:
.. ::=
.Element=Rules PXW.DEV.BNF.Element @201
..Element=Rule PXW.DEV.BNF.Element @198
...Element=Call PXW.DEV.BNF.Element @197
....type=Call:
.... KEYWORD
..Element=Rule PXW.DEV.BNF.Element @187
...Element=Or PXW.DEV.BNF.Element @173
....type=Or:
.... |
..Element=Rule PXW.DEV.BNF.Element @168
...Element=Call PXW.DEV.BNF.Element @167
....type=Call:
.... or
..Element=Rule PXW.DEV.BNF.Element @165
...Element=Or PXW.DEV.BNF.Element @160
....type=Or:
.... |
..Element=Rule PXW.DEV.BNF.Element @159
...Element=Call PXW.DEV.BNF.Element @148
....type=Call:
.... subrule
..Element=Rule PXW.DEV.BNF.Element @134
...Element=Or PXW.DEV.BNF.Element @133
....type=Or:
.... |
..Element=Rule PXW.DEV.BNF.Element @124
...Element=Call PXW.DEV.BNF.Element @119
....type=Call:
.... optional-group
..Element=Rule PXW.DEV.BNF.Element @118
...Element=Or PXW.DEV.BNF.Element @116
....type=Or:
.... |
..Element=Rule PXW.DEV.BNF.Element @104
...Element=Call PXW.DEV.BNF.Element @103
....type=Call:
.... call
*/
Method compileDefinition(Element As PXW.DEV.Element)
{

    #dim nameE,eqE,rulesE as PXW.DEV.Element
    #define WRITE(%code) $$$WRITENOLINE(method,%code)
    #define WRITECR(%code) $$$WRITELINE(method,%code)
    #dim method as %Dictionary.MethodDefinition

    ; 1    2   3
    ; name ::= rules
    Set nameE=Element.partsGetAt(1)
    ;Set eqE=Element.partsGetNext(.pkey)
    Set rulesE=Element.partsGetAt(3)

    Set mname=..methodName(nameE.ToString(0))
    ;w !,mname_" compiling",!
    ;d rulesE.write()
    
    Set method=..NewMethod(mname)
    Set method.Description=Element.ToString(" ")
    Set ..CurrentMethod=method
    
    Set indent=1
    Do ..compileQuickCheck(method,rulesE,indent)
    Do ..compileMethodStart(method,indent,1)
    Do ..compileRules(method,rulesE,indent)
    Do ..compileMethodEnd(method,indent)
 	;$$$WRITE($$$Tab(indent)_"quit done")
}

Method compileQuickCheck(Method As %Dictionary.MethodDefinition, RulesElement As PXW.DEV.Element, indent As %Integer, returnValue As %String = "0 /* normal */")
{
    #define WRITE(%code) $$$WRITENOLINE(Method,%code)
    #define WRITECR(%code) $$$WRITELINE(Method,%code)

    #dim rule1E as PXW.DEV.Element

    ; check keywords before anything else (based on the entire set of rules passed in)
    Set summary=..summariseRules(RulesElement,.listOfValues)
    $$$WRITECR($$$Tab(indent)_"; rules summary "_summary)
    If (summary?1"(K"0."|K"1")") || (summary?1"K"0."|K") {
        ; Keyword list (K|K|K) or K|K|K
        Set Method.Description=Method.Description_$CHAR(13,10)_"summary values:"_$LISTTOSTRING(listOfValues)
        Set wordlist="",sep=""
        For i=1:1:$LISTLENGTH(listOfValues) Set wordlist=wordlist_sep_""""_$LISTGET(listOfValues,i)_"""",sep=","
        $$$WRITECR($$$Tab(indent)_"if '(..isKeywordInList($lb("_wordlist_"),.value)) { quit "_returnValue_" }")
    } ElseIf (summary="P") {
        ; Punctuation single (eg ,)
        Set Method.Description=Method.Description_$CHAR(13,10)_"summary values:"_$LISTTOSTRING(listOfValues)
        ; only 1 but doing the same as a list
        Set wordlist="",sep=""
        For i=1:1:$LISTLENGTH(listOfValues) Set wordlist=wordlist_sep_""""_$LISTGET(listOfValues,i)_"""",sep=","
        $$$WRITECR($$$Tab(indent)_"if '(..isStringSingle("_wordlist_",.value)) { quit "_returnValue_" }")
    } ElseIf (summary?1"(P"0."|P"1")") || (summary?1"P"0."|P") {
        ; Punctuation list (P|P|P) or P|P|P
        Set Method.Description=Method.Description_$CHAR(13,10)_"summary values:"_$LISTTOSTRING(listOfValues)
        Set wordlist="",sep="",longest=0
        For i=1:1:$LISTLENGTH(listOfValues) Set word=$LISTGET(listOfValues,i),wordlist=wordlist_sep_""""_word_"""",sep="," If $LENGTH(word)>longest Set longest=$LENGTH(word)
        $$$WRITECR($$$Tab(indent)_"if '(..isStringInList($lb("_wordlist_"),"_longest_",.value)) { quit "_returnValue_" }")
    } ElseIf (summary?1"P&".E) || (summary?1"K&".E) || (summary?1"(K"0."|K"1")&".E) {   
        ; if cannot summarize the entire set of rules, then can we do the first one?
        ; IE - its a simple thing AND something else
        Set rule1E=RulesElement.partsGetAt(1)
        If $ISOBJECT(rule1E) {
            Set listOfValues=""
            Set summary=..summariseRule(rule1E,.listOfValues)
            $$$WRITECR($$$Tab(indent)_"; first rule summary "_summary)
            If (summary?1"(K"0."|K"1")") || (summary?1"K"0."|K") {
                ; Keyword list (K|K|K) or K|K|K
                Set Method.Description=Method.Description_$CHAR(13,10)_"summary values:"_$LISTTOSTRING(listOfValues)
                Set wordlist="",sep=""
                For i=1:1:$LISTLENGTH(listOfValues) Set wordlist=wordlist_sep_""""_$LISTGET(listOfValues,i)_"""",sep=","
                $$$WRITECR($$$Tab(indent)_"if '(..isKeywordInList($lb("_wordlist_"),.value)) { quit "_returnValue_" }")
            } ElseIf (summary="P") {
                ; Punctuation single (eg ,)
                Set Method.Description=Method.Description_$CHAR(13,10)_"summary values:"_$LISTTOSTRING(listOfValues)
                ; only 1 but doing the same as a list
                Set wordlist="",sep=""
                For i=1:1:$LISTLENGTH(listOfValues) Set wordlist=wordlist_sep_""""_$LISTGET(listOfValues,i)_"""",sep=","
                $$$WRITECR($$$Tab(indent)_"if '(..isStringSingle("_wordlist_",.value)) { quit "_returnValue_" }")
            } ElseIf (summary?1"(P"0."|P"1")") || (summary?1"P"0."|P") {
                ; Punctuation list (P|P|P) or P|P|P
                Set Method.Description=Method.Description_$CHAR(13,10)_"summary values:"_$LISTTOSTRING(listOfValues)
                Set wordlist="",sep="",longest=0
                For i=1:1:$LISTLENGTH(listOfValues) Set word=$LISTGET(listOfValues,i),wordlist=wordlist_sep_""""_word_"""",sep="," If $LENGTH(word)>longest Set longest=$LENGTH(word)
                $$$WRITECR($$$Tab(indent)_"if '(..isStringInList($lb("_wordlist_"),"_longest_",.value)) { quit "_returnValue_" }")
            }
        }
        ;*/
    }
}

Method compileMethodStart(Method As %Dictionary.MethodDefinition, indent As %Integer, needsPath As %Boolean = 0, needsTransation As %Boolean = 1, needsDebug As %Boolean = 1)
{
    #define WRITE(%code) $$$WRITENOLINE(Method,%code)
    #define WRITECR(%code) $$$WRITELINE(Method,%code)
    
    If needsDebug $$$WRITECR($$$Tab(indent)_"$$$DEBUGMethodBegin")
    If needsPath $$$WRITECR($$$Tab(indent)_"$$$BNFPATH")
	If needsTransation {
        $$$WRITECR($$$Tab(indent)_"$$$BNFSTART(subElement)")
    } Else {
        $$$WRITECR($$$Tab(indent)_"set subElement=ParentElement")
    }

    $$$WRITECR($$$Tab(indent)_"set done=0 ; method start")
}

Method compileMethodEnd(Method As %Dictionary.MethodDefinition, indent As %Integer, rollbackReturns As %String = "0 ; normal rollback", needsTransation As %Boolean = 1, needsDebug As %Boolean = 1, copyMode As %Boolean = 0)
{
    #define WRITE(%code) $$$WRITENOLINE(Method,%code)
    #define WRITECR(%code) $$$WRITELINE(Method,%code)

    $$$WRITECR($$$Tab(indent)_"if done {")
	If needsTransation {
        If copyMode=0 $$$WRITECR($$$Tab(indent+1)_"$$$BNFCOMMIT(subElement,ParentElement)")
        If copyMode=1 $$$WRITECR($$$Tab(indent+1)_"$$$BNFCOMMITCOPY(subElement,ParentElement)")
    }
	$$$WRITECR($$$Tab(indent+1)_"set ok=1")
	$$$WRITECR($$$Tab(indent)_"} else {")
	If needsTransation $$$WRITECR($$$Tab(indent+1)_"$$$BNFROLLBACK(subElement)")
	$$$WRITECR($$$Tab(indent+1)_"set ok="_rollbackReturns)
	$$$WRITECR($$$Tab(indent)_"}")
	If needsDebug $$$WRITECR($$$Tab(indent)_"$$$DEBUGMethodEnd")
	$$$WRITECR($$$Tab(indent)_"quit ok")
}

Method NewMethod(Name As %String, Element As PXW.DEV.Element) As %Dictionary.MethodDefinition
{
    Set method=##class(%Dictionary.MethodDefinition).%New()
    Set method.Name=Name
    Set method.parent=..CurrentClass
    Set method.FormalSpec="ParentElement:PXW.DEV.BNF.Element,&subElement:PXW.DEV.BNF.Element"
    Set method.ReturnType="%Boolean"
    If $ISOBJECT($GET(Element)) Set method.Description=Element.ToString(" ")
    Quit method
}

Method SubMethodName(BaseName As %String, Suffix As %String = "") As %String
{
    Set ..UniqueMethodId=..UniqueMethodId+1
    Quit BaseName_..UniqueMethodId_Suffix
}

Method compileRules(Method As %Dictionary.MethodDefinition, Element As PXW.DEV.Element, indent As %Integer)
{
    #dim ruleE as PXW.DEV.Element
    #define WRITE(%code) $$$WRITENOLINE(Method,%code)
    #define WRITECR(%code) $$$WRITELINE(Method,%code)

    Set summary=..summariseRules(Element)
    Set Method.Description=Method.Description_$CHAR(13,10)_"summary="_summary
    
    Set firstRuleE=Element.partsGetNext(.nkey)
    If $ISOBJECT(firstRuleE) {
        If firstRuleE.ToString(0)="|" {
            Set andor="OR",rkey=nkey
        } Else {
            Set andor="AND"
        }
    }
    Set first=1
    For  {
        Set ruleE=Element.partsGetNext(.rkey)
        Quit:rkey=""
        ;d ruleE.write()
        ;i andor="AND" s indent=indent+1
        If first {
            $$$WRITE($$$Tab(indent)_"if ")
            Do ..compileRule(Method,ruleE,indent)
            $$$WRITECR(" "_$$$OpenCurly)
        } ElseIf (andor="AND") {
            $$$WRITE($$$Tab(indent)_"if ")
            Do ..compileRule(Method,ruleE,indent)
            $$$WRITECR(" "_$$$OpenCurly)
        } Else {
            $$$WRITE($$$Tab(indent)_$$$CloseCurly_" elseif ")
            Do ..compileRule(Method,ruleE,indent)
            $$$WRITECR(" "_$$$OpenCurly)
        }

        Set first=0

        Set nkey=rkey
        Set nextRuleE=Element.partsGetNext(.nkey)
        If $ISOBJECT(nextRuleE) {
            If nextRuleE.ToString(0)="|" {
                Set andor="OR",rkey=nkey
                $$$WRITECR($$$Tab(indent+1)_"set done=1 ; or")
            } Else {
                Set andor="AND"
                Set indent=indent+1
            }
        }
    }

    $$$WRITECR($$$Tab(indent+1)_"set done=1 ; end compileRules")
    For indent=indent:-1:1 {
        $$$WRITECR($$$Tab(indent)_$$$CloseCurly) 
    }
    $$$WRITECR("")
}

Method compileRule(Method As %Dictionary.MethodDefinition, Element As PXW.DEV.Element, indent As %Integer, subElementVar As %String = "subElement")
{
    #dim atom as PXW.DEV.Atom
    #dim subelement as PXW.DEV.Element
    #dim rulesE as PXW.DEV.Element

    #define WRITE(%code) $$$WRITENOLINE(Method,%code)

    Set subelement=Element.partsGetNext("") ; get the first thing
    If subelement.type="Keyword" {
        Set atom=subelement.FirstAtom()
        Set word=atom.value
        Set word=$REPLACE(word,"""","""""") ; sort out quote in quotes
        If ..Loader.isKeyword(atom.value) {
            ;i word="class" break
            Set ..keywords($$$UPPER(atom.value))=1
            $$$WRITE("..addKeyword("_subElementVar_","""_$$$UPPER(word)_""") ")
        } Else {
            $$$WRITE("..addPunctuation("_subElementVar_","""_word_""") ")
        }
    } ElseIf subelement.type="Call" {
        Set mnameA=Element.FirstAtom()
        Set mname=..methodName(mnameA.ToString(0))
        $$$WRITE(".."_mname_"("_subElementVar_",.addedElement) ")
    } ElseIf subelement.type="Subrule" {
        Set rulesE=subelement.findFirstElementByType("rules",0)
        Set subMethod=..NewMethod(..SubMethodName(..CurrentMethod.Name,"Sub"))
        Set subMethod.Description=rulesE.ToString(" ")
        Do ..compileSubRule(subMethod,rulesE,indent)
        $$$WRITE(".."_subMethod.Name_"("_subElementVar_",.addedElement) ")
    } ElseIf subelement.type="OptionalGroup" {
        Set rulesE=subelement.findFirstElementByType("Rules",0)
        If rulesE.partsCount()=1 {
            $$$WRITE("$S(")
            Set ruleE=rulesE.partsGetAt(1)
            Do ..compileRule(Method,ruleE,indent)
            $$$WRITE(":1,1:1)")
        } Else {
            Set subMethod=..NewMethod(..SubMethodName(..CurrentMethod.Name,"OptGrp"))
            Do ..compileOptionalGroup(subMethod,rulesE,indent)
            $$$WRITE(".."_subMethod.Name_"("_subElementVar_",.addedElement) ") 
        }
    } ElseIf subelement.type="NotRule" {
        Set ruleE=subelement.findFirstElementByType("NotableRule",0)
        $$$WRITE("'") ; NOT
        Do ..compileRule(Method,ruleE,indent)
    } ElseIf subelement.type="RepeatSep" {
        Set subMethod=..NewMethod(..SubMethodName(..CurrentMethod.Name,"RepSep"))
        Do ..compileRepeatSep(subMethod,subelement,indent)
        $$$WRITE(".."_subMethod.Name_"("_subElementVar_",.addedElement) ") 
    } ElseIf subelement.type="LookAhead" {
        Set subMethod=..NewMethod(..SubMethodName(..CurrentMethod.Name,"Peek"))
        Do ..compilePeek(subMethod,subelement,indent)
        $$$WRITE(".."_subMethod.Name_"("_subElementVar_",.addedElement) ") 
    } ElseIf subelement.type="RepeatOne" { 
        Set subMethod=..NewMethod(..SubMethodName(..CurrentMethod.Name,"RepOne"))
        Do ..compileRepeatOne(subMethod,subelement,indent)
        $$$WRITE(".."_subMethod.Name_"("_subElementVar_",.addedElement) ") 
    } ElseIf subelement.type="RepeatZero" { 
        Set subMethod=..NewMethod(..SubMethodName(..CurrentMethod.Name,"RepZero"))
        Do ..compileRepeatZero(subMethod,subelement,indent)
        $$$WRITE(".."_subMethod.Name_"("_subElementVar_",.addedElement) ") 
    } ElseIf subelement.type="OptionalSingle" { 
        Set ruleE=subelement.findFirstElementByType("OptionalableRule",0)
        $$$WRITE("$s(")
        Do ..compileRule(Method,ruleE)
        $$$WRITE(":1,1:1) ") 
    } Else {
        $$$WRITE("; don't know what to do with "_subelement.type)
    }
}

Method compileRepeatSep(Method As %Dictionary.MethodDefinition, Element As PXW.DEV.Element, indentOfParent As %Integer, CallThisMethod As %String)
{
    #define WRITE(%code) $$$WRITENOLINE(Method,%code)
    #define WRITECR(%code) $$$WRITELINE(Method,%code)
    Set indent=1
    Set path=1
    Set transaction=1,debug=1
    Set copy=1
    Set Method.Description=Element.ToString(" ")
    Set sepE=Element.findFirstElementByType("RepeatSepSeparator",0)
    Set ruleE=Element.findFirstElementByType("RepeatSepRule",0)
    Do ..compileQuickCheck(Method,sepE,indent)
    Do ..compileMethodStart(Method,indent,path,transaction)
    $$$WRITECR($$$Tab(indent)_"set done=0 ; must be at least 1")

    $$$WRITE($$$Tab(indent)_"if ")
    Do ..compileRule(Method,ruleE,indent)
    $$$WRITECR($$$OpenCurly)
    Set indent=indent+1
            $$$WRITECR($$$Tab(indent)_"set done=1,ok=1 ; found 1")
            $$$WRITECR($$$Tab(indent)_"do "_$$$OpenCurly)
            Set indent=indent+1
            $$$WRITECR($$$Tab(indent)_"$$$BNFSTART(repElement)")
            $$$WRITE($$$Tab(indent)_"set ok=(")
            Do ..compileRule(Method,sepE,indent,"repElement")
            $$$WRITE(" && ")
            Do ..compileRule(Method,ruleE,indent,"repElement")
            $$$WRITECR(")")
            $$$WRITECR($$$Tab(indent)_"if ok "_$$$OpenCurly)
            $$$WRITECR($$$Tab(indent+1)_"$$$BNFCOMMITCOPY(repElement,subElement)")
            $$$WRITECR($$$Tab(indent)_$$$CloseCurly_" else "_$$$OpenCurly)
            $$$WRITECR($$$Tab(indent+1)_"$$$BNFROLLBACK(repElement)")
            $$$WRITECR($$$Tab(indent)_$$$CloseCurly)
        Set indent=indent-1
        $$$WRITECR($$$Tab(indent)_$$$CloseCurly_" while ok")
    Set indent=indent-1
    $$$WRITECR($$$Tab(indent)_$$$CloseCurly_"")
    Do ..compileMethodEnd(Method,indent,,transaction,debug,copy)
    /*
		do {
			$$$BNFSTART(repElement)
			s ok=(..addPunctuation(repElement,",")  && ..Args332Sub(repElement,.addedElement) ) 
			i ok {
				$$$BNFCOMMIT(repElement,subElement)
			} else {
				$$$BNFROLLBACK(repElement)
			}
		} while ok
    */
}

Method compileSubRule(Method As %Dictionary.MethodDefinition, Element As PXW.DEV.Element, indentOfParent As %Integer)
{
    #define WRITE(%code) $$$WRITENOLINE(Method,%code)
    #define WRITECR(%code) $$$WRITELINE(Method,%code)

    Set indent=1
    Set path=0
    If Element.type="Rules" {
        Set transaction=1,debug=1,copy=1
        Set summary=..summariseRules(Element)
        ; this is just one or more calls to other things, those things will be in transactions so no need here
        If summary?1"C"0."|C" Set transaction=0,debug=0
        ; this is just one or more checks of keywords, no need to be in a transaction
        If summary?1"K"0."|K" Set transaction=0,debug=0
        If summary?1"P"0."|P" Set transaction=0,debug=0
        ;$$$WRITECR($$$Tab(indent)_"; sub summary="_summary_", transaction="_transaction)
        Do ..compileQuickCheck(Method,Element,indent)
        Do ..compileMethodStart(Method,indent,path,transaction,debug)
        If 'transaction $$$WRITECR($$$Tab(indent)_"Set subElement=ParentElement")
        Do ..compileRules(Method,Element,indent)
        Do ..compileMethodEnd(Method,indent,,transaction,debug,copy)
    }
}

Method compileOptionalGroup(Method As %Dictionary.MethodDefinition, Element As PXW.DEV.Element, indentOfParent As %Integer)
{
    #define WRITE(%code) $$$WRITENOLINE(Method,%code)
    #define WRITECR(%code) $$$WRITELINE(Method,%code)

    Set indent=1
    If Element.type="Rules" {
        Set transaction=1,debug=1,copy=1
        Set summary=..summariseRules(Element)
        ; this is just one or more calls to other things, those things will be in transactions so no need here
        If summary?1"C"0."|C" Set transaction=0,debug=0
        ; this is just one or more checks of keywords, no need to be in a transaction
        If summary?1"K"0."|K" Set transaction=0,debug=0
        If summary?1"P"0."|P" Set transaction=0,debug=0
        Do ..compileQuickCheck(Method,Element,indent,"1 /* not found is OK */")
        Do ..compileMethodStart(Method,indent,,transaction,debug)
        If 'transaction $$$WRITECR($$$Tab(indent)_"Set subElement=ParentElement")
        Do ..compileRules(Method,Element,indent)
        Do ..compileMethodEnd(Method,indent,"1 /* failure rollsback but returns OK */",transaction,debug,copy)
    }
}

Method compileRepeatOne(Method As %Dictionary.MethodDefinition, Element As PXW.DEV.Element, indentOfParent As %Integer, CallThisMethod As %String)
{
    #define WRITE(%code) $$$WRITENOLINE(Method,%code)
    #define WRITECR(%code) $$$WRITELINE(Method,%code)
    Set indent=1
    Set path=0
    Set transaction=0,debug=0
    Set Method.Description=Element.ToString(" ")
    Set ruleE=Element.findFirstElementByType("RepeatableRule")
    Do ..compileQuickCheck(Method,ruleE,indent)
    Do ..compileMethodStart(Method,indent,path,transaction,debug)
    $$$WRITECR($$$Tab(indent)_"set done=0 ; must be at least 1")
    $$$WRITE($$$Tab(indent)_"while ") 
    Do ..compileRule(Method,ruleE,indent)
    $$$WRITECR(" "_$$$OpenCurly)
    $$$WRITECR($$$Tab(indent+1)_"set done=1")
    $$$WRITECR($$$Tab(indent)_$$$CloseCurly)
    Do ..compileMethodEnd(Method,indent,,transaction,debug)
}

Method compileRepeatZero(Method As %Dictionary.MethodDefinition, Element As PXW.DEV.Element, indentOfParent As %Integer, CallThisMethod As %String)
{
    #define WRITE(%code) $$$WRITENOLINE(Method,%code)
    #define WRITECR(%code) $$$WRITELINE(Method,%code)
    Set indent=1
    Set path=0
    Set transaction=0,debug=0
    Set Method.Description=Element.ToString(" ")
    Set ruleE=Element.findFirstElementByType("RepeatableRule")
    Do ..compileQuickCheck(Method,ruleE,indent,"1 /* not found is OK in RZ */")
    Do ..compileMethodStart(Method,indent,path,transaction,debug)

    $$$WRITE($$$Tab(indent)_"while ") 
    Do ..compileRule(Method,ruleE,indent)
    $$$WRITECR(" "_$$$OpenCurly)
    
    $$$WRITECR($$$Tab(indent+1)_"set done=1")
    $$$WRITECR($$$Tab(indent)_$$$CloseCurly)
    Do ..compileMethodEnd(Method,indent,"1 /* nothing found is ok in RZ */",transaction,debug)
}

Method compilePeek(Method As %Dictionary.MethodDefinition, Element As PXW.DEV.Element, indentOfParent As %Integer, CallThisMethod As %String)
{
    #define WRITE(%code) $$$WRITENOLINE(Method,%code)
    #define WRITECR(%code) $$$WRITELINE(Method,%code)
    Set indent=1
    Set path=1
    Set transaction=1,debug=1
    Set Method.Description=Element.ToString(" ")
    Set ruleE=Element.findFirstElementByType("LookAheadRule")
    $$$WRITECR($$$Tab(indent)_"; ruleE="_ruleE.type_" :"_ruleE.ToString(" "))
    Set transaction=1,debug=1
    Do ..compileQuickCheck(Method,ruleE,indent)
    Do ..compileMethodStart(Method,indent,path,transaction,debug)
    $$$WRITE($$$Tab(indent)_"if ")
    Do ..compileRule(Method,ruleE,indent)
    $$$WRITECR(" "_$$$OpenCurly)
    $$$WRITECR($$$Tab(indent+1)_"set done=1")
    $$$WRITECR($$$Tab(indent)_$$$CloseCurly)

    ; for lookahead we ALWAYS rollback even if we are returning 0 - this is a Peek only
    ;d ..compileMethodEnd(Method,indent,,transaction,debug)
    $$$WRITECR($$$Tab(indent)_"if done {")
	$$$WRITECR($$$Tab(indent+1)_"set ok=1")
	$$$WRITECR($$$Tab(indent+1)_"$$$BNFROLLBACK(subElement)")
    $$$WRITECR($$$Tab(indent)_"} else {")
	$$$WRITECR($$$Tab(indent+1)_"$$$BNFROLLBACK(subElement)")
	$$$WRITECR($$$Tab(indent+1)_"set ok=0")
	$$$WRITECR($$$Tab(indent)_"}")
	If debug $$$WRITECR($$$Tab(indent)_"$$$DEBUGMethodEnd")
	$$$WRITECR($$$Tab(indent)_"quit ok")
}

Method findModifier(Element As PXW.DEV.Element) As %String
{
    Set modE=Element.findFirstElementByType("Modifier",0)
    If $ISOBJECT(modE) {        
        ;i ..CurrentMethod.Name="SetItem" d Element.write() break
        Set subelement=Element.findFirstElementByType("Optionalsingle",0)
        If $ISOBJECT(subelement) Quit $$$UPPER(subelement.type)
        Set subelement=Element.findFirstElementByType("Repeat",1)
        If $ISOBJECT(subelement) {
            Set rsub=subelement.findFirstElementByType("RepeatZero",0)
            ;i ..CurrentMethod.Name="UdlStatement" break
            If $ISOBJECT(rsub) Quit $$$UPPER(rsub.type)
            Set rsub=subelement.findFirstElementByType("RepeatOne",0)
            If $ISOBJECT(rsub) Quit $$$UPPER(rsub.type)
        }
    }
   Quit ""
}

Method methodName(text As %String) As %String
{
  
    Set s1=$TRANSLATE(text,"_-"," ")
    Set s1=$ZCONVERT(s1,"W")
    Set s1=$TRANSLATE(s1," ","")
    Quit s1
}

ClassMethod load(XDATAname As %String, Output array As %String, ByRef version As %String) As %String
{
    #define strip(%x) $ZSTRIP($tr(%x,$c(9,160)," "),"<>W")
    Set xdata=##class(%Dictionary.XDataDefinition).%OpenId(XDATAname)
    Do xdata.Data.Rewind()
    Set alltext=xdata.Data.Read()
    Set cdata=$PIECE($PIECE(alltext,"<![CDATA[",2),"]]>",1)
    Set bnf=$PIECE($PIECE(alltext,"<bnf",2),">",1)
    Set version=$PIECE(bnf,"version=",2)
    Set version=$TRANSLATE(version,"'""","")
    Quit cdata
}

/// The summary of the rules could be used to look for patterns that could be optimised in some way.
/// EG if the summary says something like "P|P|P|P" then its searching for a list of punctuation
///    which could be done in some clever fast way.
Method summariseRules(Element As PXW.DEV.Element, ByRef listOfValues As %List) As %String
{
    Set summary=""
    Set andor=""
    For  {
        Set ruleE=Element.partsGetNext(.rkey)
        Quit:rkey=""
        Set summary=summary_andor_..summariseRule(ruleE,.listOfValues)
        Set nkey=rkey
        Set nextRuleE=Element.partsGetNext(.nkey)
        If $ISOBJECT(nextRuleE) {
            If nextRuleE.ToString(0)="|" {
                Set andor="|",rkey=nkey
            } Else {
                Set andor="&"
            }
        }
    }  
    Quit summary
}

Method summariseRule(Element As PXW.DEV.Element, listOfValues As %List = "") As %String
{
    #dim atom as PXW.DEV.Atom
    #dim subelement as PXW.DEV.Element
    #dim rulesE as PXW.DEV.Element

    If Element.%IsA("PXW.DEV.Element") {
        Set summary="?1"_Element.type_"1?"
        Set subelement=Element.partsGetNext("") ; get the first thing

        If subelement.type="Keyword" {
            Set atom=subelement.FirstAtom()
            Set word=atom.value
            Set word=$REPLACE(word,"""","""""") ; sort out quote in quotes
            If ..Loader.isKeyword(atom.value) {
                ;i word="class" break
                Set summary="K" ; keyword
                Set listOfValues=listOfValues_$LISTBUILD($$$UPPER(word))
            } Else {
                Set summary="P" ; punctuation
                Set listOfValues=listOfValues_$LISTBUILD($$$UPPER(word)) ; needs to be upper because of things like i%
            }
        } ElseIf subelement.type="Call" {
            ;Set mnameA=Element.FirstAtom()
            ;Set mname=..methodName(mnameA.ToString(0))
            Set summary="C"
        } ElseIf subelement.type="Subrule" {
            Set rulesE=subelement.findFirstElementByType("rules",0)
            Set subsumm=..summariseRules(rulesE,.listOfValues)
            Set summary=""_subsumm
        } ElseIf subelement.type="Optionalgroup" {
            Set rulesE=subelement.findFirstElementByType("rules",0)
            Set summary="["_..summariseRules(rulesE,.listOfValues)_"]"
        } ElseIf subelement.type="OptionalGroup" {
            Set rulesE=subelement.findFirstElementByType("rules",0)
            Set summary="["_..summariseRules(rulesE,.listOfValues)_"]"
        } ElseIf subelement.type="RepeatOne" {
            Set ruleE=subelement.findFirstElementByType("RepeatableRule") 
            Set summary="("_..summariseRules(ruleE,.listOfValues)_")+"
        } ElseIf subelement.type="RepeatZero" {
            Set ruleE=subelement.findFirstElementByType("RepeatableRule") 
            Set summary="("_..summariseRules(ruleE,.listOfValues)_")*"
        } Else {
            Set summary="?4"_subelement.type_"4?"
        }
    } Else {
        Set summary=""
    }
    Quit summary
}

}
