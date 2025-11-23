Class PXW.DEV.BNF.Run.SQLShowPlan Extends PXW.DEV.BNF.GEN.SQLShowPlan
{

Property StartedNewLine As %Boolean;

Property NewLineIndent As %Integer;

Method getBookmark(ByRef bookmark As %String)
{
    ;$$$DEBUGMethodBegin
    d ##super(.bookmark)
    s bookmark("newline")=..StartedNewLine   
    s bookmark("newlineindent")=..NewLineIndent
    ;$$$DEBUGMethodEnd
}

Method gotoBookmark(ByRef bookmark As %String)
{
    d ##super(.bookmark)
    s ..StartedNewLine=bookmark("newline")
    s ..NewLineIndent=bookmark("newlineindent")
}

Method Nospace(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
    ; IF THERE IS NO WHITESPACE QUIT 1
    do:..needsWScheck ..skipWhiteSpaceAndComments()
    i '$isobject(..whitespace) q 1
    q 0
}

///  for_each_content ::= INDENT (!OUTDENT content)*
/// summary=C&(?4punctuation:4?)*
Method ForEachContent(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	n %ForEachDepth
    q ##super(.ParentElement,.subElement)
}

Method Newline(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
    $$$DEBUGMethodBegin
    $$$BNFPATH
    Do:..needsWScheck ..skipWhiteSpaceAndComments()

    set ..StartedNewLine=0
    set ..NewLineIndent=0
    if $isobject(..whitespace) {
        if ..whitespace.value[..stream.eolChar {
            set ..NewLineIndent=$length($piece(..whitespace.value,..stream.eolChar,*))
            set ..StartedNewLine=1
            $$$BNFSTART(subElement)
            set atom=..newAtom("newline","")
            do subElement.AddPart(subElement)
            $$$BNFCOMMIT(subElement,ParentElement)
        }
    }    
    $$$DEBUG("NEWLINE="_..StartedNewLine_", INDENT="_..NewLineIndent)

    $$$DEBUGMethodEnd
    q ..StartedNewLine
}

///  INDENT ::= 'CODE THIS TAKE NOTE OF CURRENT INDENT'
/// summary values:CODE THIS TAKE NOTE OF CURRENT INDENT
/// summary=P
Method Indent(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
    i ..eof() q 0

    $$$DEBUGMethodBegin
    Do:..needsWScheck ..skipWhiteSpaceAndComments()

    i ..StartedNewLine {    
        s depth=..NewLineIndent
        s %ForEachDepth=depth
        $$$DEBUG("Set %ForEachDepth="_depth_", peek="_..peek(30))
    } else {
        $$$DEBUG("Indent not on new line")
    }
    $$$DEBUGMethodEnd
    quit 1
}

///  OUTDENT ::= 'CODE THIS TAKE NOTE OF CURRENT INDENT'
/// summary values:CODE THIS TAKE NOTE OF CURRENT INDENT
/// summary=P
Method Outdent(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
    i ..eof() q 1
    $$$DEBUGMethodBegin

    ; no depth already so it IS NOT an outdent
    if '$d(%ForEachDepth) q 0

    Do:..needsWScheck ..skipWhiteSpaceAndComments()

    s isoutdent=0
    i ..StartedNewLine {    
        s depth=..NewLineIndent
        s isoutdent=(depth<%ForEachDepth)
        $$$DEBUG("depth="_depth_",%ForEachDepth="_%ForEachDepth_", peek="_..peek(30))
    } else {
        $$$DEBUG("Not on a new line")
    }
    $$$DEBUGMethodEnd
	q isoutdent
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
