Class PXW.DEV.BNF.Run.SQLShowPlan Extends PXW.DEV.BNF.GEN.SQLShowPlan
{

Property StartedNewLine As %Boolean;

Property NewLineIndent As %Integer;

Method getBookmark(ByRef bookmark As %String)
{
    ;$$$DEBUGMethodBegin
    Do ##super(.bookmark)
    Set bookmark("newline")=..StartedNewLine   
    Set bookmark("newlineindent")=..NewLineIndent
    ;$$$DEBUGMethodEnd
}

Method gotoBookmark(ByRef bookmark As %String)
{
    Do ##super(.bookmark)
    Set ..StartedNewLine=bookmark("newline")
    Set ..NewLineIndent=bookmark("newlineindent")
}

Method Nospace(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
    ; IF THERE IS NO WHITESPACE QUIT 1
    Do:..needsWScheck ..skipWhiteSpaceAndComments()
    If '$ISOBJECT(..whitespace) Quit 1
    Quit 0
}

///  for_each_content ::= INDENT (!OUTDENT content)*
/// summary=C&(?4punctuation:4?)*
Method ForEachContent(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	New %ForEachDepth
    Quit ##super(.ParentElement,.subElement)
}

Method Newline(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
    $$$DEBUGMethodBegin
    $$$BNFPATH
    Do:..needsWScheck ..skipWhiteSpaceAndComments()

    Set ..StartedNewLine=0
    Set ..NewLineIndent=0
    If $ISOBJECT(..whitespace) {
        If ..whitespace.value[..stream.eolChar {
            Set ..NewLineIndent=$LENGTH($PIECE(..whitespace.value,..stream.eolChar,*))
            Set ..StartedNewLine=1
            $$$BNFSTART(subElement)
            Set atom=..newAtom("newline","")
            Do subElement.AddPart(atom)
            $$$BNFCOMMIT(subElement,ParentElement)
        }
    }    
    $$$DEBUG("NEWLINE="_..StartedNewLine_", INDENT="_..NewLineIndent)

    $$$DEBUGMethodEnd
    Quit ..StartedNewLine
}

///  INDENT ::= 'CODE THIS TAKE NOTE OF CURRENT INDENT'
/// summary values:CODE THIS TAKE NOTE OF CURRENT INDENT
/// summary=P
Method Indent(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
    If ..eof() Quit 0

    $$$DEBUGMethodBegin
    Do:..needsWScheck ..skipWhiteSpaceAndComments()

    If ..StartedNewLine {    
        Set depth=..NewLineIndent
        Set %ForEachDepth=depth
        $$$DEBUG("Set %ForEachDepth="_depth_", peek="_..peek(30))
    } Else {
        $$$DEBUG("Indent not on new line")
    }
    $$$DEBUGMethodEnd
    Quit 1
}

///  OUTDENT ::= 'CODE THIS TAKE NOTE OF CURRENT INDENT'
/// summary values:CODE THIS TAKE NOTE OF CURRENT INDENT
/// summary=P
Method Outdent(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
    If ..eof() Quit 1
    $$$DEBUGMethodBegin

    ; no depth already so it IS NOT an outdent
    If '$DATA(%ForEachDepth) Quit 0

    Do:..needsWScheck ..skipWhiteSpaceAndComments()

    Set isoutdent=0
    If ..StartedNewLine {    
        Set depth=..NewLineIndent
        Set isoutdent=(depth<%ForEachDepth)
        $$$DEBUG("depth="_depth_",%ForEachDepth="_%ForEachDepth_", peek="_..peek(30))
    } Else {
        $$$DEBUG("Not on a new line")
    }
    $$$DEBUGMethodEnd
	Quit isoutdent
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

}
