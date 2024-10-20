Include PXW.Debuggers.Macros

Class PXW.DEV.BNF.Compilers.Compiler3 Extends PXW.DEV.BNF.Compilers.Compiler
{

Property parser As PXW.DEV.BNF.Compilers.BNF3safe;

/// Attempt to remove all the nonsense element structure 
/// its not really working so turning off!
Parameter COMPACT = 0;

Method methodName(text As %String) As %String
{
    Set s1=$TRANSLATE(text,"_-/\:","     ")
    Set s1=$ZCONVERT(s1,"W")
    Set s1=$TRANSLATE(s1," ","")
    if $e(s1,1)?1N set s1="mn"_s1
    Quit s1
}

Method compileDefinition(Element As PXW.DEV.Element)
{
    #dim nameE,eqE,rulesE as PXW.DEV.Element
    #define WRITE(%code) $$$WRITENOLINE(method,%code)
    #define WRITECR(%code) $$$WRITELINE(method,%code)
    #dim method as %Dictionary.MethodDefinition

    Set pkey=""
    Set nameE=Element.partsGetNext(.pkey)
    Set eqE=Element.partsGetNext(.pkey)
    Set rulesE=Element.partsGetNext(.pkey)

    Set mname=..methodName(nameE.ToString(0))
   
    ;if $$$LOWER(nameE.ToString(0))=$$$LOWER("CobolVariableDefinition") $$$DEBUGNew("")
    ;if $$$LOWER(mname)=$$$LOWER("CobolVariableDefinition") $$$DEBUGNew("")
     zw mname
    $$$DEBUGBreak
    Set method=..NewMethod(mname)
    Set method.Description=Element.ToString(" ")
    Set ..CurrentMethod=method
    
    ; simple check to look for recursion (the rules contains the name
    If $$$UPPER(" "_rulesE.ToString(" ")_" ")[$$$UPPER(" "_nameE.ToString(0)_" ") {
        Set indent=1,transaction=0,path=0
        ; recursive function
        ; create a new method containing the basics
        Set recmethod=..NewMethod(..SubMethodName(..CurrentMethod.Name,"Recurse"))
        Do ..compileQuickCheck(recmethod,rulesE,indent)
        Do ..compileMethodStart(recmethod,indent,path,transaction)
        Do ..compileRules(recmethod,rulesE,indent)
        Do ..compileMethodEnd(recmethod,indent,,transaction)

        ; ideas from https://medium.com/@gvanrossum_83706/left-recursive-peg-grammars-65dab3c580e1
        $$$WRITECR($$$Tab(indent)_"$$$DEBUGMethodBegin")
        $$$WRITECR($$$Tab(indent)_"$$$BNFPATH")
        $$$WRITECR($$$Tab(indent)_"set done=0,ok=1,pos=..stream.pos,lastpos=pos")
        $$$WRITECR($$$Tab(indent)_"if $$$BNFMEMOExists(pos) {")
        $$$WRITECR($$$Tab(indent+1)_"$$$BNFMEMOGET(pos,subElement)")
        $$$WRITECR($$$Tab(indent+1)_"set ret=($isobject(subElement))")
        $$$WRITECR($$$Tab(indent+1)_"if ret $$$BNFCOMMITCOPY(subElement,ParentElement)")
        $$$WRITECR($$$Tab(indent+1)_"quit ret")
        $$$WRITECR($$$Tab(indent)_"}")
        $$$WRITECR($$$Tab(indent)_"$$$BNFMEMOSET(pos,"""")")
        $$$WRITECR($$$Tab(indent)_"do ..getBookmark(.bm)")
        $$$WRITECR($$$Tab(indent)_"while ok {")
        $$$WRITECR($$$Tab(indent)_"$$$BNFSTART(subElement)")
        $$$WRITECR($$$Tab(indent+1)_"do ..gotoBookmark(.bm)")
        ;$$$WRITECR($$$Tab(indent+1)_"set rec=.."_recmethod.Name_"(ParentElement,.addedElement)")
        $$$WRITECR($$$Tab(indent+1)_"set rec=.."_recmethod.Name_"(subElement,.addedElement)")
        $$$WRITECR($$$Tab(indent+1)_"if rec,..stream.pos>lastpos {")
        $$$WRITECR($$$Tab(indent+2)_"$$$BNFMEMOSET(pos,addedElement)")
        $$$WRITECR($$$Tab(indent+2)_"set done=1,lastpos=..stream.pos")
        $$$WRITECR($$$Tab(indent+1)_"} else {")
        $$$WRITECR($$$Tab(indent+2)_"set ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best ") 
        $$$WRITECR($$$Tab(indent+1)_"}")
        $$$WRITECR($$$Tab(indent)_"}")
        $$$WRITECR($$$Tab(indent)_"if done {")
            If '..#COMPACT {
                $$$WRITECR($$$Tab(indent+1)_"$$$BNFCOMMIT(subElement,ParentElement)")
            } Else {
                $$$WRITECR($$$Tab(indent+1)_"if subElement.partsCount()=1,subElement.partsGetAt(1).%IsA(""PXW.DEV.Atom"") {")
                $$$WRITECR($$$Tab(indent+2)_"$$$BNFCOMMITCOPY(subElement,ParentElement)")
                $$$WRITECR($$$Tab(indent+1)_"} elseif subElement.partsCount()=1,subElement.partsGetAt(1).type'="""_mname_""" {")
                $$$WRITECR($$$Tab(indent+2)_"$$$BNFCOMMITCOPY(subElement,ParentElement)")
                $$$WRITECR($$$Tab(indent+1)_"} else {")
                $$$WRITECR($$$Tab(indent+2)_"$$$BNFCOMMIT(subElement,ParentElement)")
                $$$WRITECR($$$Tab(indent+1)_"}")
            }
        $$$WRITECR($$$Tab(indent+1)_"set ret=1")
        $$$WRITECR($$$Tab(indent)_"} else {")
        $$$WRITECR($$$Tab(indent+1)_"if $isobject(subElement) $$$BNFROLLBACK(subElement)")
        $$$WRITECR($$$Tab(indent+1)_"set ret=0")
        $$$WRITECR($$$Tab(indent)_"}")
        $$$WRITECR($$$Tab(indent)_"$$$DEBUGMethodEnd")
        $$$WRITECR($$$Tab(indent)_"quit ret")
    } elseif rulesE.type="SingleChar" {
        Set indent=1
        Do ..compileQuickCheck(method,rulesE,indent)
        Do ..compileMethodStart(method,indent,1)
        $$$WRITECR($$$Tab(indent)_"if ..addPunctuation(subElement,"""_$replace(rulesE.ToString(0),"""","""""")_""") "_$$$OpenCurly)
        $$$WRITECR($$$Tab(indent+1)_"set done=1")
        $$$WRITECR($$$Tab(indent)_$$$CloseCurly)
        ;$$$WRITECR($$$Tab(indent)_"if done "_$$$OpenCurly)
        ;$$$WRITECR($$$Tab(indent+1)_"$$$BNFCOMMIT(subElement,ParentElement)")
        ;$$$WRITECR($$$Tab(indent+1)_"set ret=1")
        ;$$$WRITECR($$$Tab(indent)_$$$CloseCurly_" else "_$$$OpenCurly)
        ;$$$WRITECR($$$Tab(indent+1)_"if $isobject(subElement) $$$BNFROLLBACK(subElement)")
        ;$$$WRITECR($$$Tab(indent+1)_"set ret=0")
        ;$$$WRITECR($$$Tab(indent)_$$$CloseCurly)
        
        Do ..compileMethodEnd(method,indent)
    }  elseif rulesE.type="Omitted" {
        Set indent=1
        Do ..compileQuickCheck(method,rulesE,indent)
        $$$WRITECR($$$Tab(indent)_"quit 0 ; omitted rule never true")
    } Else {
        Set rkey=""
        Set indent=1
        Do ..compileQuickCheck(method,rulesE,indent)
        Do ..compileMethodStart(method,indent,1)
        If 1 {
            $$$WRITECR($$$Tab(indent)_"set pos=..stream.pos")
            $$$WRITECR($$$Tab(indent)_"if $$$BNFMEMOExists(pos) {")
            $$$WRITECR($$$Tab(indent+1)_"$$$BNFMEMOGET(pos,subElement)")
            $$$WRITECR($$$Tab(indent+1)_"set done=$isobject(subElement)")
            ;$$$WRITECR($$$Tab(indent+1)_"$$$BNFCOMMIT(subElement,ParentElement)")
            ;$$$WRITECR($$$Tab(indent+1)_"quit ret")
            $$$WRITECR($$$Tab(indent)_$$$CloseCurly_" else "_$$$OpenCurly)
            Set indent=indent+1

        }
        Do ..compileRules(method,rulesE,indent)
        $$$WRITECR("")
        If 1 {
            Set indent=indent-1
            $$$WRITECR($$$Tab(indent)_$$$CloseCurly)
            $$$WRITECR($$$Tab(indent)_"if done "_$$$OpenCurly)
            $$$WRITECR($$$Tab(indent+1)_"$$$BNFMEMOSET(pos,subElement)")
            $$$WRITECR($$$Tab(indent)_$$$CloseCurly_" else "_$$$OpenCurly)
            ;$$$WRITECR($$$Tab(indent+1)_"$$$BNFMEMOKILL(pos,subElement)")
            $$$WRITECR($$$Tab(indent)_$$$CloseCurly)
        }
        Do ..compileMethodEnd(method,indent)
    }
}

Method compileRules(Method As %Dictionary.MethodDefinition, Element As PXW.DEV.Element, indent As %Integer)
{
    #dim ruleE as PXW.DEV.Element
    #define WRITE(%code) $$$WRITENOLINE(Method,%code) 
    #define WRITECR(%code) $$$WRITELINE(Method,%code) 

    Set summary=..summariseRules(Element)
    ;s Method.Description=Method.Description_$c(13,10)_"summary="_summary    
    
    Set initialIndent=indent
    Set first=1
    For  {
        Set ruleE=Element.findNextElement(.rkey)
        Quit:rkey=""
        If first {
            $$$WRITE($$$Tab(indent)_"if ")
            If ruleE.type="Rule" {
                Do ..compileRule(Method,ruleE,indent)
            } ElseIf ruleE.type="OrRules" {
                Do ..compileOrRules(Method,ruleE,indent)
            } Else {
                $$$WRITE("unexpected "_ruleE.type_", expected Rule,OrRules")
            }
        } ElseIf (ruleE.type="Rule") {
            $$$WRITE(" && ")
            Do ..compileRule(Method,ruleE,indent)
        } ElseIf (ruleE.type="OrRules") {
            $$$WRITECR(" "_$$$OpenCurly)
            $$$WRITECR($$$Tab(indent+1)_"set done=1 ; or")
            $$$WRITE($$$Tab(indent)_$$$CloseCurly_" elseif ")
            ;do ruleE.write()
            Do ..compileOrRules(Method,ruleE,indent)
        } Else {
            $$$WRITECR(" ; don't know what to do Rules"_ruleE.Type)
        }

        Set first=0
    }
    $$$WRITECR(" "_$$$OpenCurly)
    $$$WRITECR($$$Tab(indent+1)_"set done=1 ; end compileRules")
    $$$WRITE($$$Tab(indent)_$$$CloseCurly)
    For indent=indent-1:-1:initialIndent {
        $$$WRITECR($$$Tab(indent)_$$$CloseCurly) 
    }
    $$$WRITECR("")
}

Method compileQuickCheck(Method As %Dictionary.MethodDefinition, RulesElement As PXW.DEV.Element, indent As %Integer, returnValue As %String = "0 /* normal */")
{
	Quit
}

Method compileOrRules(Method As %Dictionary.MethodDefinition, Element As PXW.DEV.Element, indent As %Integer)
{
    #dim ruleE as PXW.DEV.Element
    #define WRITE(%code) $$$WRITENOLINE(Method,%code) 
    #define WRITECR(%code) $$$WRITELINE(Method,%code) 

    Set rkey=""
    Set copy=1
    Set elementcount=Element.countElements()
    If elementcount=1 {
        Set ruleE=Element.findNextElement(.rkey)
        Do ..compileRule(Method,ruleE,indent)
    } Else {
        Set subMethod=..NewMethod(..SubMethodName(..CurrentMethod.Name,"Or"))
        Do ..compileMethodStart(subMethod,indent,0,1,1)
        Do ..compileRules(subMethod,Element,indent)
        Do ..compileMethodEnd(subMethod,indent,0,1,1,copy)
        $$$WRITE(".."_subMethod.Name_"(subElement,.addedElement) ") 
    }
}

Method compileRule(Method As %Dictionary.MethodDefinition, Element As PXW.DEV.Element, indent As %Integer, subElementVar As %String = "subElement")
{
    #dim atom as PXW.DEV.Atom
    #dim subelement as PXW.DEV.Element
    #dim rulesE as PXW.DEV.Element

    #define WRITE(%code) $$$WRITENOLINE(Method,%code)
    $$$DEBUGBreak

    Set subelement=Element.findNextElement("") ; get the first thing, atoms are not interesting
    If subelement.type="Keyword" {
        Set atom=subelement.FirstAtom()
        Set word=atom.value
        Set word=$REPLACE(word,"""","""""") ; sort out quote in quotes
        If ..Loader.isKeyword(atom.value) {
            If atom.start="'" {
                Set ..keywords($$$UPPER(atom.value))=1
            } Else {
                ; keywords in double quotes are "soft" and should not be in the keyword check
            }
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
        Set subMethod=..NewMethod(..SubMethodName(..CurrentMethod.Name,"Not"))
        Set subMethod.Description=ruleE.ToString(" ")
        Do ..compileNotRule(subMethod,ruleE,indent)
        $$$WRITE(".."_subMethod.Name_"("_subElementVar_",.addedElement) ")
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
    } ElseIf subelement.type="Force" {
        $$$WRITE("1 /* force means? */")
    } Else {

        $$$WRITE("; don't know what to do with "_subelement.type)
    }
}

Method compileNotRule(Method As %Dictionary.MethodDefinition, Element As PXW.DEV.Element, indentOfParent As %Integer)
{
    #define WRITE(%code) $$$WRITENOLINE(Method,%code)
    #define WRITECR(%code) $$$WRITELINE(Method,%code)

    Set indent=1
    Set path=0
    Set transaction=1,debug=1
    ;s summary=..summariseRules(Element)
    ; this is just one or more calls to other things, those things will be in transactions so no need here
    ;i summary?1"C"0."|C" s transaction=0,debug=0
    ; this is just one or more checks of keywords, no need to be in a transaction
    ;i summary?1"K"0."|K" s transaction=0,debug=0
    ;i summary?1"P"0."|P" s transaction=0,debug=0
    ;$$$WRITECR($$$Tab(indent)_"; sub summary="_summary_", transaction="_transaction)
    ;d ..compileQuickCheck(Method,Element,indent)
    Do ..compileMethodStart(Method,indent,path,transaction,debug)
    If 'transaction $$$WRITECR($$$Tab(indent)_"set subElement=ParentElement")
    $$$WRITE($$$Tab(indent)_"if ")
    Do ..compileRule(Method,Element,indent)
    $$$WRITECR(" "_$$$OpenCurly_" set done=1 "_$$$CloseCurly)
    ;d ..compileMethodEnd(Method,indent,,transaction,debug)

	$$$WRITECR($$$Tab(indent)_"$$$BNFROLLBACK(subElement)") ; always rollback

    $$$WRITECR($$$Tab(indent)_"if done {")
	$$$WRITECR($$$Tab(indent+1)_"set ret=0") ; reverse for NOT
	$$$WRITECR($$$Tab(indent)_"} else {")
	$$$WRITECR($$$Tab(indent+1)_"set ret=1") ; reverse for NOT
	$$$WRITECR($$$Tab(indent)_"}")
	$$$WRITECR($$$Tab(indent)_"$$$DEBUGMethodEnd")
	$$$WRITECR($$$Tab(indent)_"quit ret")
}

Method compileMethodEnd(Method As %Dictionary.MethodDefinition, indent As %Integer, rollbackReturns As %String = "0 ; normal rollback", needsTransation As %Boolean = 1, needsDebug As %Boolean = 1, copyMode As %Boolean = 0)
{
   #define WRITE(%code) $$$WRITENOLINE(Method,%code)
    #define WRITECR(%code) $$$WRITELINE(Method,%code)

    $$$WRITECR($$$Tab(indent)_"if done {")
	If needsTransation {
        If copyMode=0 {
            If ..#COMPACT {
                $$$WRITECR($$$Tab(indent+1)_"; if the only thing is an atom then the element is adding no value so copy to parent")
                $$$WRITECR($$$Tab(indent+1)_"i subElement.partsCount()=1,subElement.partsGetAt(1).%IsA(""PXW.DEV.Atom"") {")
                $$$WRITECR($$$Tab(indent+2)_"$$$BNFCOMMITCOPY(subElement,ParentElement)")
                $$$WRITECR($$$Tab(indent+1)_"} else {")
                $$$WRITECR($$$Tab(indent+2)_"$$$BNFCOMMIT(subElement,ParentElement)")
                $$$WRITECR($$$Tab(indent+1)_"}")
            } Else {
                $$$WRITECR($$$Tab(indent+2)_"$$$BNFCOMMIT(subElement,ParentElement)")
            }
        }
        If copyMode=1 $$$WRITECR($$$Tab(indent+1)_"$$$BNFCOMMITCOPY(subElement,ParentElement)")
    }
	$$$WRITECR($$$Tab(indent+1)_"set ret=1")
	$$$WRITECR($$$Tab(indent)_"} else {")
	If needsTransation $$$WRITECR($$$Tab(indent+1)_"$$$BNFROLLBACK(subElement)")
	$$$WRITECR($$$Tab(indent+1)_"set ret="_rollbackReturns)
	$$$WRITECR($$$Tab(indent)_"}")
	If needsDebug $$$WRITECR($$$Tab(indent)_"$$$DEBUGMethodEnd")
	$$$WRITECR($$$Tab(indent)_"quit ret")
}

}
