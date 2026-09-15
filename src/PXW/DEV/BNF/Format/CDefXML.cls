Class PXW.DEV.BNF.Format.CDefXML Extends %RegisteredObject
{

Property indent As %Integer [ InitialExpression = 0 ];

Property flags As %String;

Property currentLine As %Integer [ InitialExpression = 1 ];

Method formatElement(element As PXW.DEV.Element)
{
    #dim a as PXW.DEV.Atom
    Do ..resetAll(element)
    Do ..setAll(element)
}

Method resetAll(element As PXW.DEV.Element)
{
    set akey=""
 	For  {
		Set part=element.partsGetNext(.akey)
		Quit:akey=""
		
	    If part.IsElement {
			Do ..resetAll(part)
		} ElseIf part.IsAtom {
            Set type=$$$UPPER($PIECE(part.type,":",1))
            ; this is the word "method" or "property" etc
            If type="KEYWORD" {
            }
            Do ..resetWhitespace(part)
		}
	}
}

/// If there is NO whitespace leave alone, otherwise make it a single space.
Method resetWhitespace(Atom As PXW.DEV.Atom)
{
    If $ISOBJECT(Atom.whitespace) {
        If Atom.whitespace.value'="" {
            Set Atom.whitespace.value=" "
        }
        Do ..resetWhitespace(Atom.whitespace)
    }
}

Method setAll(element As PXW.DEV.Element)
{
    #dim atom as PXW.DEV.Atom

    ;s type=element.type
    ;zw type,flags
    If element.type="XmlStartTag" {
        Do ..setWhitespaceNewLineElement(element,..indent)
        Set ..indent=..indent+1 
        set ..flags=""
    } elseIf element.type="XmlEndTag" {
        Set ..indent=..indent-1
        if ..flags="XmlContent" {
            ; the last thing was content so stay on same line
        } else {
            Do ..setWhitespaceNewLineElement(element,..indent)
        }
        set ..flags=""
   } elseif element.type="XmlContent" {
        set ..flags=element.type
    }


    set akey=""
   	For  {
		Set atom=element.partsGetNext(.akey)
		Quit:akey=""
		
	    If atom.IsElement {
			Do ..setAll(atom)
		} else {
            set atom.line=..currentLine
        }
	}
}

Method setWhitespaceNewLineElement(Element As PXW.DEV.Element, indent As %Integer)
{
    Set a=Element.FirstAtom()
    Do ..setWhitespaceNewLine(a,indent)
}

Method setWhitespaceNewLine(Atom As PXW.DEV.Atom, indent As %Integer)
{
    ;w "moving "_Atom.value_" onto new line with "_indent_" tabs",!
    Set cr=$CHAR(13,10)
    Set tabs=$CHAR(9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9)
    ;s tabs="..................."
    Set ..currentLine=..currentLine+1
    Set Atom.whitespace=##class(PXW.DEV.Atom).%New()
    Set Atom.whitespace.value=cr_$EXTRACT(tabs,1,indent)
    Set Atom.line=..currentLine
}

}
