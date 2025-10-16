Class PXW.DEV.BNF.Run.COS Extends PXW.DEV.BNF.GEN.COS
{

Property codemode As %String;

Property bracketStack As %String [ MultiDimensional ];

Property bracketDepth As %Integer;

/* Overrides of the main super class that normally does the interaction with the input stream */
/// Skip over the next set of comments, return 1 if something was done or 0
Method skipComments(ch10 As %String) As %Boolean
{
    Set ch=$EXTRACT(ch10,1)
    If ch=";" Set ..comment=..readLineComment(";") Quit 1
    Set ch2=$EXTRACT(ch10,1,2)
    If ch2="/*" Set ..comment=..readBlockComment() Quit 1
    If ch2="//" Set ..comment=..readLineComment("//") Quit 1
    If ch2="#;" Set ..comment=..readLineComment("#;") Quit 1
    Set ch3=$EXTRACT(ch10,1,3)
    If ch3="##;" Set ..comment=..readLineComment("##;") Quit 1
    Quit 0
}

Method peekKeyword() As %String
{
    $$$DEBUGMethodBegin
    If ..keyword="" {
        Set word=""
        ;Set ch50=..peek(50)
        Set ch50=$EXTRACT(..streaminput,..stream.pos,..stream.pos+50)
        ; starts with a letter
        If $EXTRACT(ch50,1)?1A {
            Set i=2
            ; carries on with a letter or number
            While $EXTRACT(ch50,i)?1AN {
                Set i=i+1
            }
            Set word=$EXTRACT(ch50,1,i-1)
        } 
        Set ..keyword=" "_word ; so that even null counts as being found
    } Else {
        Set word=$EXTRACT(..keyword,2,*) ; remove the space from the start so null is null
    }
    $$$DEBUGMethodEnd
	Quit word
}

/***********************************************************
 IDENTIFIERS
***********************************************************/
Method VariableIdentifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
    /*$$$DEBUGMethodBegin
    if '$isobject(..matcher) {
        s ..matcher=##class(%Regex.Matcher).%New("(\%|[a-zA-Z])[a-zA-Z0-9]*")
        s ..matcher.Text=..streaminput
    }
    Do:..needsWScheck ..skipWhiteSpaceAndComments()
    if ..matcher.LookingAt(..stream.pos)=1 {
        set pos=..matcher.End
        Set atom=..newAtom(ParentElement.type,..nextNotEOL(pos-..stream.pos))
        Do ParentElement.AddPart(.atom)
        Set ok=1
    } else {
        set ok=0
    }
    $$$DEBUGMethodEnd
    Quit ok
    */
    If ..codemode["SQL" Quit ..VariableIdentifierSQL(ParentElement)

    $$$DEBUGMethodBegin
    Do:..needsWScheck ..skipWhiteSpaceAndComments()
    
    Set ch50=..stream.PeekToEol()
    Set pos=1
    If $EXTRACT(ch50,pos,pos)="%" Set pos=pos+1
    If $EXTRACT(ch50,pos,pos)?1A Set pos=pos+1
    If pos>1 {
        While ($EXTRACT(ch50,pos,pos)?1AN) {
            Set pos=pos+1
        }
        Set atom=..newAtom(ParentElement.type,..nextNotEOL(pos-1))
        Do ParentElement.AddPart(.atom)
        Set ok=1
    } Else {
        Set ok=0
    }
    $$$DEBUGMethodEnd
    Quit ok
}

/// This is more complicated than the normal variable SQL, putting in a separate routine so that we can optimize them separately 
/// (don't mind losing a bit of speed here as it will be called less often)
Method VariableIdentifierSQL(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
    $$$DEBUGMethodBegin
    $$$BNFPATH
	;;$$$DEBUG("%path="_%path)
    ;d ..skipWhiteSpaceAndComments()
    $$$BNFSTART(subElement)

    Do:..needsWScheck ..skipWhiteSpaceAndComments()

    Set value=""

    ; we need to allow:
    ; s x={*}
    ; s x={field}
    ; s x={field*C} (or *N or *O)
    ; 
    ; we need to block
    ; s x={"json":444}
    ; the json will be picked up by the json handler
    Set done=0,curly=0
    Set ch50=..stream.PeekToEol()
    Set pos=1
    If $EXTRACT(ch50,pos,pos+2)="{*}" {
        Set curly=1
        Set atom=..newAtom(subElement.type,..nextNotEOL(3))
        Do subElement.AddPart(atom)
        Set done=1
    } ElseIf $EXTRACT(ch50,pos)="{" {
        Set curly=1
        Set pos=pos+1
        Do:..needsWScheck ..skipWhiteSpaceAndComments() 
        ; maybe we should split this up a bit, so that the field name has its own element (atom) we can deal with?
        While ($EXTRACT(ch50,pos)?1AN) || ($EXTRACT(ch50,pos)="%") || ($EXTRACT(ch50,pos)="*")  || ($EXTRACT(ch50,pos)="_") || ($EXTRACT(ch50,pos)="."){
            Set pos=pos+1
        }
        If $EXTRACT(ch50,pos)="}" {
            Set pos=pos+1
            If pos>3 {
                ; added at least {x}
                Set atom=..newAtom(subElement.type,..nextNotEOL(pos-1))
                Do subElement.AddPart(atom)
                Set done=1
            }
        }
    } Else {
        ; now we do the same as for a normal variable 
        If $EXTRACT(ch50,pos)="%" Set pos=pos+1
        If $EXTRACT(ch50,pos)?1A Set pos=pos+1
        If pos>1 {
            While ($EXTRACT(ch50,pos)?1AN) {
                Set pos=pos+1
            }
            Set atom=..newAtom(ParentElement.type,..nextNotEOL(pos-1))
            Do ParentElement.AddPart(atom)
            Set done=1
        } Else {
            Set done=0
        }
    }
    ; {field} becomes a new element so we can do something with it later
    If curly {
        If done {
            $$$BNFCOMMIT(subElement,ParentElement)
        } Else {
            $$$BNFROLLBACK(subElement)
        }
    }
    $$$DEBUGMethodEnd
    Quit done
}

Method ClassIdentifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
    $$$DEBUGMethodBegin

    Do:..needsWScheck ..skipWhiteSpaceAndComments()
    ;d ..skipWhiteSpaceAndComments()
    Set ch50=..stream.PeekToEol()
    Set pos=1
    Set retok=0
    ; IN COSSQL mode (on property definitions and maybe trigger, not tested triggers) 
    ; you can put {%%CLASSNAME}, you may be able to put other properties by I cannot make 
    ; any others work, so hard coding CLASSNAME only
    ;property RawContent As %String(MAXLEN = 10000) [ Calculated, ReadOnly, SqlComputeCode = { Set {RawContent}=##class({%%CLASSNAME}).getContentAsString({ID}) }, SqlComputed, Transient ];    
    If $EXTRACT(ch50,1,13)="{%%CLASSNAME}" {
        Set atom=..newAtom(ParentElement.type,..nextNotEOL(13))
        Do ParentElement.AddPart(atom)
        Set retok=1
    } ElseIf $EXTRACT(ch50,pos)="""" {
        ; "name in quote"
        Set quote1=..nextNotEOL(1)
        Set value=""
        While ..peek(1)'="""" {
            Set value=value_..nextNotEOL(1)
        }
        Set quote2=..nextNotEOL(1)
        Set atom=..newAtom(ParentElement.type,value)
        Set atom.start=quote1
        Set atom.end=quote2
        Do ParentElement.AddPart(atom)
        Set retok=1
    } Else {
        ; regular name %a.b.c
        Set hasLetter=0
        If $EXTRACT(ch50,pos)="%" Set pos=pos+1
        If $EXTRACT(ch50,pos)?1A Set pos=pos+1,hasLetter=1        
        If hasLetter {
            While ($EXTRACT(ch50,pos)?1AN) || ($EXTRACT(ch50,pos)=".")  {
                Set pos=pos+1
            }        
            Set atom=..newAtom(ParentElement.type,..nextNotEOL(pos-1))
            Do ParentElement.AddPart(atom)
            Set retok=1
        }
    } 
    $$$DEBUGMethodEnd
    Quit retok
}

Method GlobalIdentifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
    $$$DEBUGMethodBegin
    $$$BNFPATH
	Do:..needsWScheck ..skipWhiteSpaceAndComments()
    
    Set ch50=..stream.PeekToEol()
    Set pos=1
    If $EXTRACT(ch50,pos)="%" Set pos=pos+1
    If $EXTRACT(ch50,pos)="$" Set pos=pos+1 ; ^$LOCK
    If $EXTRACT(ch50,pos)?1A Set pos=pos+1
    
    If pos>1 {
        While ($EXTRACT(ch50,pos)?1AN) || ($EXTRACT(ch50,pos)=".")  {
            Set pos=pos+1
        }    
        Set atom=..newAtom(ParentElement.type,..nextNotEOL(pos-1))
        Do ParentElement.AddPart(atom)
        Set ok=1
    } Else {
        Set ok=0
    }

    $$$DEBUGMethodEnd
    Quit ok
}

Method IncludeIdentifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
    $$$DEBUGMethodBegin
    Do:..needsWScheck ..skipWhiteSpaceAndComments()
    Set ch50=..stream.PeekToEol()
    Set pos=1
    If $EXTRACT(ch50,pos)="%" Set pos=pos+1 ; starts with %
    If $EXTRACT(ch50,pos)?1A Set pos=pos+1 ; or letter 
    If pos>1 {
        Set ok=1
        While ($EXTRACT(ch50,pos)?1AN) || ($EXTRACT(ch50,pos)="."){
            Set pos=pos+1
        }
        Set atom=..newAtom(ParentElement.type,..nextNotEOL(pos-1))
        Do ParentElement.AddPart(atom)
    } Else {
        Set ok=0
    }
    $$$DEBUGMethodEnd
    Quit ok
}

Method LabelIdentifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
    $$$DEBUGMethodBegin
    ;$$$BNFPATH

    Do:..needsWScheck ..skipWhiteSpaceAndComments()

    Set ch50=..stream.PeekToEol()
    Set pos=1
    If $EXTRACT(ch50,pos)="%" Set pos=pos+1
    If $EXTRACT(ch50,pos)?1AN Set pos=pos+1
    
    If pos>1 {
        While $EXTRACT(ch50,pos)?1AN {
            Set pos=pos+1
        }    
        Set atom=..newAtom(ParentElement.type,..nextNotEOL(pos-1))
        Do ParentElement.AddPart(atom)
        Set ok=1
    } Else {
        Set ok=0
    }
    $$$DEBUGMethodEnd
    Quit ok
}

Method MacroIdentifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
    $$$DEBUGMethodBegin
    Do:..needsWScheck ..skipWhiteSpaceAndComments()
    Set ch50=..stream.PeekToEol()
    Set pos=1
    If $EXTRACT(ch50,pos)="%" Set pos=pos+1 ; starts with %
    If $EXTRACT(ch50,pos)?1AN Set pos=pos+1 ; or letter or number
    If pos>1 {
        Set ok=1
        While ($EXTRACT(ch50,pos)?1AN) {
            Set pos=pos+1
        }
        Set atom=..newAtom(ParentElement.type,..nextNotEOL(pos-1))
        Do ParentElement.AddPart(atom)
    } Else {
        Set ok=0
    }
    $$$DEBUGMethodEnd
    Quit ok
}

Method ObjectMemberIdentifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
    $$$DEBUGMethodBegin
    ;$$$BNFPATH

    Do:..needsWScheck ..skipWhiteSpaceAndComments()
    Set ch50=..stream.PeekToEol()
    Set ok=0,pos=1
    If $EXTRACT(ch50,pos)="""" {
        Set pos=pos+1
        Set instring=1
        While $EXTRACT(ch50,pos)'="" && instring {
            Set ch=$EXTRACT(ch50,pos),ch2=$EXTRACT(ch50,pos+1)
            ; embedded quotes or end of string?
            If ch="""" {
                If ch2="""" {
                    Set pos=pos+2
                } Else {
                    Set instring=0
                    Set pos=pos+1
                }
            } Else {
                Set pos=pos+1
            }
        }
        Set value=..nextNotEOL(pos-1)
        Set ok=1
    } Else {
        Set hasStarted=0
        If $EXTRACT(ch50,pos)="#" Set pos=pos+1
        If $EXTRACT(ch50,pos)="%" Set pos=pos+1,hasStarted=1
        If $EXTRACT(ch50,pos)?1A Set pos=pos+1,hasStarted=1
        
        If hasStarted {
            While $EXTRACT(ch50,pos)?1AN {
                Set pos=pos+1
            }
            Set value=..nextNotEOL(pos-1)
            Set ok=1
        }
    }
 
    If ok {
        Set atom=..newAtom(ParentElement.type,value)
        Do ParentElement.AddPart(atom)
    }
    $$$DEBUGMethodEnd
    Quit ok
}

Method RoutineIdentifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
    $$$DEBUGMethodBegin
    ;$$$BNFPATH

    Do:..needsWScheck ..skipWhiteSpaceAndComments()
 
    Set ch50=..stream.PeekToEol()
    Set pos=1
    If $EXTRACT(ch50,pos)="%" Set pos=pos+1
    If $EXTRACT(ch50,pos)?1A Set pos=pos+1
    
    If pos>1 {
        While ($EXTRACT(ch50,pos)?1AN) || ($EXTRACT(ch50,pos)=".")   {
            Set pos=pos+1
        }
    
        Set atom=..newAtom(ParentElement.type,..nextNotEOL(pos-1))
        Do ParentElement.AddPart(atom)
        Set ok=1
    } Else {
        Set ok=0
    }
    $$$DEBUGMethodEnd
    Quit ok
}

/// This is left over from the initial build, the general purpose Identifier needs to be replaced by more specific
/// types for each case.
Method Identifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
    $$$DEBUGMethodBegin
    ;$$$BNFPATH
	;;$$$DEBUG("%path="_%path)

    ;d ..skipWhiteSpaceAndComments()
    Do:..needsWScheck ..skipWhiteSpaceAndComments()

    Set value=""
    Set ok=0
    If ..peek(2)="i%" {
        Set value=value_..next(2)
        If ..peek(1)="""" {
            Set value=value_..nextNotEOL(1)
            While ..peek(1)'="""" {
                Set value=value_..nextNotEOL(1)
            }
            Set value=value_..nextNotEOL(1)
            Set atom=..newAtom(ParentElement.type,value)
            Do ParentElement.AddPart(atom)
            Set ok=1
        }
    } Else {
        If ..peek(1)="%" Set value=..nextNotEOL(1)
        If ..peek(1)="%" Set value=..nextNotEOL(1)
        ; not a letter (or number)
        Set ch=..peek(1)
        ; no % so must start with a letter
        If value="",ch?1A Set value=..nextNotEOL(1)

        Set ok=1    
        If value="" {
            $$$DEBUG("checking identifier, ok=0")
            Set ok=0
        }
    }
    If ok {

        Set ch=..peek(1)
        While (ch?1A) || (ch?1N) || (ch=".")  {
            Set value=value_..nextNotEOL(1)
            Set ch=..peek(1)
        }
    
        Set atom=..newAtom("identifier",value)
        Do ParentElement.AddPart(atom)
    }
    ;$$$DEBUG("checking identifier, ok=1")
    ;zw atom
    $$$DEBUGMethodEnd
    Quit ok
}

/***********************************************************
 OVERRIDES FOR PERFORMANCE 
***********************************************************/
Method Dyadicop(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	;$$$DEBUG("%path="_%path)
	$$$BNFSTART(subElement)
	Set done=0
	If ..addPunctuationInList(subElement,$LISTBUILD("'<=","']]","'>="),3)
        || ..addPunctuationInList(subElement,$LISTBUILD("\\",">=","'>","<=","'<","'=","**","&&","]]","']","'[","||"),2)
        || ..addPunctuationInList(subElement,$LISTBUILD("+","-","/","\",">","<","=","*","]","[","!","_"),1)
    	 || ..HashOp(subElement,.addedElement)
		 || ..AmpOp(subElement,.addedElement)	 {
		Set done=1
	}
	If done {
		$$$BNFCOMMIT(subElement,ParentElement)
		Set retok=1
	} Else {
		$$$BNFROLLBACK(subElement)
		Set retok=0
	}
	$$$DEBUGMethodEnd
	Quit retok
}

/***********************************************************
 LITERAL NUMBERS AND STRINGS 
***********************************************************/
Method Number(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
    Do:..needsWScheck ..skipWhiteSpaceAndComments()
    Set ch50=..stream.PeekToEol()
    Set i=1,hasDigits=0
    ; -
    While ($EXTRACT(ch50,i)="-") || ($EXTRACT(ch50,i)="+") {
        Set i=i+1
    }

    ; -123
    While ($EXTRACT(ch50,i)?1N) {
        Set i=i+1,hasDigits=1
    }

    ; start with a .
    If $EXTRACT(ch50,i,i+1)?1"."1N {
        Set i=i+2 ; . and number
        Set hasDigits=1
    }
    
    If hasDigits {
    	$$$BNFSTART(subElement)
    
        ; -123.456
        While ($EXTRACT(ch50,i)?1N) {
            Set i=i+1
        }

        ; -123.456E
        If ($EXTRACT(ch50,i)="E") || ($EXTRACT(ch50,i)="e") {
            Set i=i+1
            ; 123.456E-
            If $EXTRACT(ch50,i)="-"{
                Set i=i+1
            }

            ; -123.456E-789
            While ($EXTRACT(ch50,i)?1N) {
                Set i=i+1
            }
        }

        Set atom=..newAtom("Number",..nextNotEOL(i-1))
        Do subElement.AddPart(atom)
        $$$BNFCOMMIT(subElement,ParentElement)
        Set retok=1
    } Else {
        Set retok=0
    }
	$$$DEBUGMethodEnd
	Quit retok
}

Method String(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
    $$$DEBUGMethodBegin
    Do:..needsWScheck ..skipWhiteSpaceAndComments()
	#dim o as PXW.DEV.Atom
    Set ok=0
    If ..peek(1)="""" {
        Set ok=0
        $$$BNFSTART(subElement)

        ; consume the quotes
        Set q1=..nextNotEOL(1)
        Set ch50=..stream.PeekToEol()
        Set pos=1
        Set instring=1
        While $EXTRACT(ch50,pos)'="" && instring {
            Set ch=$EXTRACT(ch50,pos),ch2=$EXTRACT(ch50,pos+1)
            ; embedded quotes or end of string?
            If ch="""" {
                If ch2="""" {
                    Set pos=pos+2 ; both sets of quotes
                } Else {
                    Set instring=0
                }
            } Else {
                Set pos=pos+1
            }
        }
        Set o=..newAtom("String",..nextNotEOL(pos-1))
        Set o.start=q1
        Set o.end=..nextNotEOL(1) ; final quote
        Do subElement.AddPart(o)
        $$$BNFCOMMIT(subElement,ParentElement)
        Set ok=1
    
    }
    $$$DEBUGMethodEnd
    Quit ok
}

Method JsonString(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
    $$$DEBUGMethodBegin
    Do:..needsWScheck ..skipWhiteSpaceAndComments()
    If ..peek(1)="""" {
        $$$BNFSTART(subElement)

        Set q1=..nextNotEOL(1)
        Set ch50=..stream.PeekToEol()
        Set pos=1
        Set instring=1
        While $EXTRACT(ch50,pos)'="" && instring {
            If $EXTRACT(ch50,pos,pos+1)="\""" {
                ; embedded quotes
                Set pos=pos+2
            } ElseIf $EXTRACT(ch50,pos)="""" {
                ; last quote
                Set instring=0
            } Else {
                Set pos=pos+1
            }
        }
        Set atom=..newAtom("String",..nextNotEOL(pos-1))
        Set atom.start=q1
        Set atom.end=..nextNotEOL(1) ; q2
        Do subElement.AddPart(atom)
        $$$BNFCOMMIT(subElement,ParentElement)
        Set ok=1
    } Else {
        Set ok=0
    }
    $$$DEBUGMethodEnd
    Quit ok
}

/// Trying to just get to the end of the match, not working out what it actually does or anything
Method PatternMatch(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
	#dim atom as PXW.DEV.Atom
    #dim c as %CSP.Documatic

    Do:..needsWScheck ..skipWhiteSpaceAndComments()
    Set peek=..peek(2)
    If $EXTRACT(peek,1)'="?",peek'="'?" Quit 0

	$$$DEBUGMethodBegin
    $$$BNFPATH
    $$$BNFSTART(subElement)
    
    Set pat=""
    If peek="'?" {
        Set atom=..newAtom("punctuation",..nextNotEOL(2))
    } Else {
        Set atom=..newAtom("punctuation",..nextNotEOL(1))
    }
    Do subElement.AddPart(atom)
    
    ; allowed spaces directly after ?
    Do ..skipWhiteSpaceAndComments()

	Set ok=1,bracket=0,patternN=0,instring=0,indirection=0,retok=1

    ; ?@indirect is special case
    If ..peek(1)="@" Set ok=0,indirection=1
    
    Set ch50=..stream.PeekToEol()
    Set pos=1
	While $EXTRACT(ch50,pos)'="" && ok {
		Set ok=0
		Set peek=$EXTRACT(ch50,pos)

        If peek="""" {
            If instring {
                Set peek2=$EXTRACT(ch50,pos,pos+1)
                If peek2="""""" {
                    Set pos=pos+2
                } Else {
                    Set pos=pos+1
                    Set instring=0
                }
            } Else {
                Set instring=1
                Set pos=pos+1
            }
            Set ok=1
            Continue
        }
        If instring {
            Set pos=pos+1
            Set ok=1
            Continue
        }

		If peek="(" {
			Set bracket=bracket+1
			Set pos=pos+1
			Set ok=1
			Continue
		}
		If bracket>0,peek=")" {
			Set bracket=bracket-1
			Set pos=pos+1
			Set ok=1
			Continue
		}

		If bracket=0,peek=")" {
			Set ok=0
			Continue
		}

		If bracket>0,peek="," {
			Set pos=pos+1
			Set ok=1
			Continue
		}

		If bracket=0,peek="," {
			Set ok=0
			Continue
		}

        If $LISTFIND($LISTBUILD(":","|","&","{"," ",$CHAR(9)),peek) {
            Set ok=0
            Continue
        } 
        
        ; anything else (eg 1 or A)
        Set pos=pos+1
        Set ok=1
        Continue  
    }
    If pos>1 {
        Set atom=..newAtom("PatternMatch",..nextNotEOL(pos-1))
        Do subElement.AddPart(atom)
        $$$BNFCOMMITCOPY(subElement,ParentElement)
    } 
  
    If indirection {
        Set retok=..SimpleIndirection(subElement,.indirectSubElement)
        $$$BNFCOMMITCOPY(subElement,ParentElement)
        $$$DEBUG("pattern indirection result="_retok)
    }

	$$$DEBUGMethodEnd
	Quit retok
}

/***********************************************************
 CALL TO OTHER PARSERS (embedded languages etc) 
***********************************************************/
Method HtmlBody(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
    ; make sure there is something on the page
    Do:..needsWScheck ..skipWhiteSpaceAndComments()
    If ..peek(1)=">" Quit 1

	$$$DEBUGMethodBegin
	$$$BNFPATH
	;$$$DEBUG("%path="_%path)

   	#dim atom as PXW.DEV.Atom
	;$$$BNFPATH
	$$$BNFSTART(subElement)
    Set atom=..newAtom("CSPCodeBlock Begin","")
    Do ParentElement.AddPart(atom)

	Set parser=##class(PXW.DEV.BNF.Run.CSP).%New()
	Set parser.stream=..stream
    Do parser.skipWhiteSpaceAndComments()
    ;$$$DEBUG("COS CODE BLOCK peeked "_parser.peek(1))
	If parser.CspPageMandatory(subElement) {
        Set ..whitespace=parser.whitespace
        Set ..comment=parser.comment
        Set atom=..newAtom("CSPCodeBlock End","")
        Do subElement.AddPart(atom)
        $$$BNFCOMMIT(subElement,ParentElement)
        Set retok=1
	} Else {
         Set recretok=..recover(ParentElement,.recsub,"<>","")
        $$$DEBUG("RECOVERED htmlbody:"_recretok)
        Set retok=1
    }
    $$$DEBUGMethodEnd
    Quit retok
}

/// js_body ::= 'NEED JS BODY'
///  summary=S
///  type=group
Method JsBody(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
    #dim atom as PXW.DEV.Atom

   ; make sure there is something on the page
    Do:..needsWScheck ..skipWhiteSpaceAndComments()
    If ..peek(1)=">" Quit 1
    
    $$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
    Set atom=..newAtom("JavascriptCodeBlock Begin","")
    Do ParentElement.AddPart(atom)

	Set parser=##class(PXW.DEV.BNF.Run.JS).%New()
	Set parser.stream=..stream
    Do parser.skipWhiteSpaceAndComments()

    $$$DEBUG("Javascript language normal")
    If parser.StatementList(subElement) {
        Set ..whitespace=parser.whitespace
        Set ..comment=parser.comment
        Set atom=..newAtom("JavascriptCodeBlock End","")
        Do subElement.AddPart(atom)
        $$$BNFCOMMIT(subElement,ParentElement)
        Set retok=1
    } Else {
        Do ..recover(ParentElement,.recsub,"<>","")
        Set retok=1
    }
    $$$DEBUGMethodBegin
    Quit retok
}

Method SqlBody(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	;$$$DEBUG("%path="_%path)

   	#dim atom as PXW.DEV.Atom
	;$$$BNFPATH
	$$$BNFSTART(subElement)
    Set atom=..newAtom("SQLCodeBlock Begin","")
    Do ParentElement.AddPart(atom)
	Set parser=##class(PXW.DEV.BNF.Run.SQL).%New()
	Set parser.stream=..stream
    Do parser.skipWhiteSpaceAndComments()
    ;$$$DEBUG("COS CODE BLOCK peeked "_parser.peek(1))
	If parser.SqlProgram(subElement) {
		Set ..whitespace=parser.whitespace
		Set ..comment=parser.comment
    	Set atom=..newAtom("SQLCodeBlock End","")
		Do subElement.AddPart(atom)
		$$$BNFCOMMIT(subElement,ParentElement)
		Set retok=1
	} Else {
        Set recretok=..recover(ParentElement,.recsub,"()","")
        If recretok=0 {
            $$$BNFROLLBACK(subElement)
            Set retok=0
        } Else {
            Set retok=1
        }
    }
    $$$DEBUGMethodEnd
    Quit retok
}

/*********************************************************************************************************************
 Things that need special processing because they cannot be defined in the simple BNF files 
*********************************************************************************************************************/
/// label_definition ::= label [ label_formal_specification ] [ label_scope ]
Method LabelDefinition(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
    ;$$$DEBUGMethodBegin
    Do:..needsWScheck ..skipWhiteSpaceAndComments()
    
    ; labels only defined in first column (0)
    ;$$$DEBUG("LabelDefinition col="_..stream.col)
	If ..stream.col'=0 Quit 0

    ; there may be a macro on the first column
    If ..peek(3)="$$$" Quit ..Macrocall(ParentElement,.subElement)

    ; if the first thing is a # then do not consume it but leave it to be consumed by #dim etc
    If ..peek(1)="#" Quit 0

    Set res=##super(ParentElement,.subElement)
    ;$$$DEBUGMethodEnd
    Quit res
}

/// hash_op ::= '#'
/// special case where it mus NOT be the first thing on the line
/// eg this is valid
///     s x=var # 2 
/// but this is not valid
///     s x=var 
///          # 2
/// this does not apply to other operators, # is special becasue it also starts special commands
Method HashOp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{

    $$$BNFPATH
    ;$$$DEBUG("%path="_%path)
    ;d ..skipWhiteSpaceAndComments()
    Do:..needsWScheck ..skipWhiteSpaceAndComments()
    
    Set hash=..peek(1)
    If hash'="#" Quit 0

    ; if it is at the start of line then its NOT an operation but IS start of #dim #define etc
    If ..whitespace,..whitespace.value[$CHAR(13) Quit 0

    Set hash=..nextNotEOL(1)
    Set atom=..newAtom("punctuation",hash)
    Do ParentElement.AddPart(atom)
    Quit 1
}

/// amp_op ::= '&'
/// special case where it can signal &html, &sql, &js
Method AmpOp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
    $$$BNFPATH
    ;$$$DEBUG("%path="_%path)
    ;d ..skipWhiteSpaceAndComments()
    Do:..needsWScheck ..skipWhiteSpaceAndComments()
    
    Set peek=$$$UPPER(..peek(20))
    If $EXTRACT(peek,1)'="&" Quit 0

    If $EXTRACT(peek,1,6)="&HTML<" Quit 0
    If $EXTRACT(peek,1,5)="&SQL(" Quit 0
    If $EXTRACT(peek,1,4)="&JS<" Quit 0
    If $EXTRACT(peek,1,12)="&JAVASCRIPT<" Quit 0

    Set amp=..nextNotEOL(1)
    Set atom=..newAtom("punctuation",amp)
    Do ParentElement.AddPart(atom)
    Quit 1
}

/// one_cos_statement ::= [ label_definition ] cos_command
Method OneCosStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean [ ProcedureBlock = 1 ]
{
    $$$DEBUGMethodBegin
	;$$$BNFPATH
	$$$BNFSTART(subElement)

    Set label=..LabelDefinition(subElement)
    ; check to see if the label is on a line on its own
    Do:..needsWScheck ..skipWhiteSpaceAndComments()

    Set dots=0
   	While (..isString(subElement,".")) { Set dots=1 }

    Set directive=0,command=0
    If ..stream.col=0 {
        Set directive=..CosDirective(subElement)
    } Else {
        If ..stream.col>0 Set command=..CosCommand(subElement)
    }
    If label || dots || directive || command {
        $$$BNFCOMMIT(subElement,ParentElement)
        Set retok=1
    } Else {
        $$$BNFROLLBACK(subElement)
        Set retok=0
    }

    $$$DEBUGMethodEnd
    Quit retok
}

/// object_chain ::= '.' object_chain_item ( '.' object_chain_item )*
Method ObjectChain(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
    ; an object.method should not have white spaces
    Do:..needsWScheck ..skipWhiteSpaceAndComments()
	If ..whitespace Quit 0
    Quit ##super(ParentElement)
}

/// naked ::= ' ' /* this is going to need some special code to recognise naked commands */
Method Naked(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean [ ProcedureBlock = 1 ]
{
    $$$DEBUGMethodBegin
    Do:..needsWScheck ..skipWhiteSpaceAndComments()

    ; in single line mode and no white space found then we must be at the end of line
    ; eg: f x=1:1:10 d
    ; and therefore IS naked
    If ..stopAtEOL,'$ISOBJECT(..whitespace) {
        Set retok=1
    } ElseIf  ..stopAtEOL,$ISOBJECT(..whitespace),..peek(1)=$CHAR(13) {
        Set retok=1
    } ElseIf ..peek(1)="{" {
        ; code block does not count as naked
        Set retok=0
    } ElseIf ..peek(1)="}" {
        ; immediate end to code block does count as naked
        Set retok=1
    } Else {
        Set ch=$EXTRACT(..whitespace.value,1,2)
        Set chspc=$TRANSLATE(ch,$CHAR(9)," ") ; turn tabs into spaces for checking
        Set retok=0
        If chspc="  " {
            Set retok=1 ; is naked
        } ElseIf chspc=(" "_$CHAR(13)) {
            Set retok=1 ; is naked
        } Else {
            If $EXTRACT(ch,1)=$CHAR(13) Set retok=1 ; naked
        }
    }
    ;$$$DEBUG("Naked="_retok)
    $$$DEBUGMethodEnd
    Quit retok
}

/// array_parameter_list ::= '('  expression ( ',' expression )*  ')'
///  summary=S&F&(S&F)&S
///  type=group
///  not=0
Method ArrayParameterList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
	; make sure there is NO leading space
    Set ..needsWScheck=0
    Set retok=##super(ParentElement,.subElement)
    Set ..needsWScheck=1
    Quit retok
}

/// any_text_upto_close_bracket ::= 'code this'
///  summary=S
///  type=group
Method AnyTextUptoCloseBracket(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
    $$$DEBUGMethodBegin
	$$$BNFPATH
    $$$BNFSTART(subElement)
    Do:..needsWScheck ..skipWhiteSpaceAndComments()

    Set ch50=..stream.PeekToEol()
    Set pos=1
    Set ok=1
    Set bracket=1
    While $EXTRACT(ch50,pos)'="" && (bracket>0) {
        Set ch=$EXTRACT(ch50,pos)
        If ch="(" {
            Set pos=pos+1
            Set bracket=bracket+1
        } ElseIf ch=")" {
            If bracket>1 {
                Set pos=pos+1
            }
            Set bracket=bracket-1
        } Else {
            Set pos=pos+1
        }
    }
    Set o=..newAtom(subElement.type,..nextNotEOL(pos-1))
    Do subElement.AddPart(o)
    $$$BNFCOMMIT(subElement,ParentElement)
    $$$DEBUGMethodEnd
    Quit ok
}

Method CosDirective(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
    Do:..needsWScheck ..skipWhiteSpaceAndComments()
    ; looing for #
    If ..peek(1)'="#" Quit 0
    ; but NOT ##
    If ..peek(2)="##" Quit 0
    
    Set oldmode=..stopAtEOL
    Set ..stopAtEOL=1
    Set retok=##super(ParentElement,.subElement)
    If retok=0 {
        Set retok=..recover(ParentElement,.recsub,"{}",$LISTBUILD($CHAR(13)))
    }
    Set ..stopAtEOL=oldmode
    Set ..needsWScheck=1
    Quit retok
}

/// command_list_eol ::= cos_command ( cos_command )* /* needs to stop at end of line */
///  summary=F&(F)
///  type=group
///  not=0
Method CommandListEol(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
    Set oldmode=..stopAtEOL
    Set ..stopAtEOL=1
    Set retok=##super(ParentElement,.subElement)
    Set ..stopAtEOL=oldmode
    Set ..needsWScheck=1
    Quit retok
}

/// sub_expression ::= '(' expression ')'
///  summary=S&F&S
///  type=group
///  not=0
Method SubExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
    Set oldmode=..stopAtWhitespace
    Set ..stopAtWhitespace=0
    Set retok=##super(ParentElement,.subElement)
    Set ..stopAtWhitespace=oldmode
    Set ..needsWScheck=1
    Quit retok
}

/// close_bracket ::= ')'
///  summary=S
///  type=group
///  not=0
Method CloseBracket(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
    ;If ..isStringSingle(")",.value)=0 Quit 0
    If ..peek(1)'=")" Quit 0
    $$$DEBUGMethodBegin
    Set atom=..newAtom("punctuation",..nextNotEOL(1))
    Do ParentElement.AddPart(atom)
    Set data=..bracketStack(..bracketDepth)
    Kill ..bracketStack(..bracketDepth)
    Set ..bracketDepth=..bracketDepth-1
    Set ..stopAtEOL=$LISTGET(data,1)
    Set ..stopAtWhitespace=$LISTGET(data,2)
    $$$DEBUGMethodEnd
    Quit 1
}

/// open_bracket ::= '('
///  summary=S
///  type=group
///  not=0
Method OpenBracket(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
    ; THIS MUST NOT REMOVE WHITESPACE, it is used for things like ARRAY() and $PIECE() where the ( ) must come DIRECTLY after the function name
	If ..peek(1)'="(" Quit 0
    $$$DEBUGMethodBegin
    Set atom=..newAtom("punctuation",..nextNotEOL(1))
    Do ParentElement.AddPart(atom)
    Set ..bracketDepth=..bracketDepth+1
    Set ..bracketStack(..bracketDepth)=$LISTBUILD(..stopAtEOL,..stopAtWhitespace)
    Set ..stopAtEOL=0
    Set ..stopAtWhitespace=0
    $$$DEBUGMethodEnd
    Quit 1
}

/// post_conditional ::= ':' expression
///  summary=S&F
///  type=group
///  not=0
Method PostConditional(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
    Set oldmode=..stopAtWhitespace
    Set ..stopAtWhitespace=1
    Set retok=##super(ParentElement,.subElement)
    Set ..stopAtWhitespace=oldmode
    Set ..needsWScheck=1
    Quit retok
}

/// write_format_expression ::= write_bang_expression
/// | write_hash_expression
/// | write_pos_expression
/// | write_mnemonic_expression
///  summary=F|F|F|F
///  type=group
///  not=0
Method WriteFormatExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
    Set oldmode=..stopAtWhitespace
    Set ..stopAtWhitespace=1
    Set ..needsWScheck=0
    Set retok=##super(ParentElement,.subElement)
    Set ..stopAtWhitespace=oldmode
    Set ..needsWScheck=1
    Quit retok
}

/// This is used by SQL compute, it does NOT allow line labels, it does allow {*} variables
Method CosCodeBlockSql(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
    Set oldmode=..codemode
    Set ..codemode="COSSQL"
    Set retok=##super(ParentElement,.subElement)
    Set ..codemode=oldmode
    Quit retok
}

/// This is used by SQL compute, it does NOT allow line labels, it does allow {*} variables
Method CosCodeBlockSqlStorage(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
    Set oldmode=..codemode
    Set ..codemode="COSSQLSTORAGE"
    Set retok=##super(ParentElement,.subElement)
    Set ..codemode=oldmode
    Quit retok
}

/// This is used by SQL compute, it does allow line labels, it does allow {*} variables
Method CosCodeBlockTrigger(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
    Set oldmode=..codemode
    Set ..codemode="COSSQL"
    Set retok=##super(ParentElement,.subElement)
    Set ..codemode=oldmode
    Quit retok
}

/// cos_directive_define_subst ::= [cos_command | expression ] text_to_eol_continue
///  summary=[F|F]&F
///  type=group
///  not=0
Method CosDirectiveDefineSubst(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
	Set oldmode=..codemode
    Set ..codemode="DEFINE" 
    Set retok=##super(ParentElement,.subElement)
    Set ..codemode=oldmode
    Quit retok
}

Method CosCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
	Set retok=##super(ParentElement,.subElement)
    
    If retok=0 {
        If ..codemode="DEFINE" {
            ; in DEFINE mode, just let it fail, do not attempt recovery
        } ElseIf ..codemode["STORAGE" {
            ; in storge we want to stop at the end tag (<) or if in a cdata:]]> 
            ; we can only allow 1 letter in each item in the list
            Set retok=..recover(ParentElement,.recSub,"{}",$LISTBUILD($CHAR(13),"<","]"))
        } Else {
            Set retok=..recover(ParentElement,.recSub,"{}",$LISTBUILD($CHAR(9)," ",$CHAR(13)))
        }
    }
    ;i retok=0 break
    Quit retok
}

/// text_to_eol_continue ::= 'regexp:[^\r\n]*'
///  summary=R
///  type=group
///  not=0
Method TextToEolContinue(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
    $$$DEBUGMethodBegin
    ; this is used in situations like below, where set x=2 and set y=2 are in the macro
    ;#define x set x=2 ##continue
    ;            set y=3
    
    ; note that the continue is valid only until the next line, so don't skip all white space
    Set n=""
    While '..eof(),..peek(1)'=$CHAR(13) {
        ; at continue directive read the word and then the eol char
        If $$$UPPER(..peek(10))="##CONTINUE" {
            ; add what we have so far
            Set atom=..newAtom("text",n)
            Do ParentElement.AddPart(atom)
            
            Set n=..next(10) ; the ##continue directive
            Set atom=..newAtom("keyword",n)
            Do ParentElement.AddPart(atom)

            Set n=""
            While ..peek(1)'=$CHAR(13) { Set n=n_..nextNotEOL(1) } ; add trailing whitespace (after the ##continue)
            Set n=n_..next(1)   ; the next line
            Set ..whitespace=..newAtom("whitespace",n)
            Set n=""

            Continue
        }
        Set n=n_..nextNotEOL(1)
    } 
    If n'="" {
        Set atom=..newAtom(ParentElement.type,n)
        Do ParentElement.AddPart(atom)
    }
    $$$DEBUGMethodEnd
    Quit 1
}

/// any_keyword ::= 'need any keyword'
///  summary=S
///  type=group
///  not=0
Method AnyKeyword(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
    Set keyword=..peekKeyword()
    If keyword'="" {
        Set next=..nextNotEOL($LENGTH(keyword))
        Do ParentElement.AddPart(..newAtom("keyword",next))
        Set retok=1
    } Else {
        Set retok=0
    }
    Quit retok
}

Method ZzCommandWord(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	;if '(..isKeywordInList($lb("ZZ"),.value)) { quit 0 /* normal */ }
    Do:..needsWScheck ..skipWhiteSpaceAndComments()
    Set keyword=..peekKeyword()
    Set UPP=$$$UPPER(keyword)
    $$$DEBUG("keyword="_keyword)
	If UPP'?1"ZZ".AN Quit 0
	
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	Set done=0 ; method start
	If ..addKeyword(.subElement,UPP) {
		Set done=1 ; end compileRules
	}

	If done {
		$$$BNFCOMMIT(subElement,ParentElement)
		Set ok=1
	} Else {
		$$$BNFROLLBACK(subElement)
		Set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	Quit ok
}

}
