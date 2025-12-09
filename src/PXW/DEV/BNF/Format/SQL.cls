Class PXW.DEV.BNF.Format.SQL Extends %RegisteredObject
{

Property indent As %Integer [ InitialExpression = 2 ];

Property currentLine As %Integer [ InitialExpression = 1 ];

/// d ##class(PXW.DEV.BNF.Format.SQL).writetest(a)
ClassMethod writetest(element As PXW.DEV.Element)
{
    Set formatter=##class(PXW.DEV.BNF.Format.SQL).%New()
    Do formatter.formatElement(element)
    Set str=element.ToString()
    Write !,"---------",!,str,!,"--------------"
}

/// This only expects SQL things into it, passing in other language elements may produce some strange results
Method formatElement(element As PXW.DEV.Element)
{
    #dim a as PXW.DEV.Atom

    Do ..resetAll(element)
    Do ..setAll(element)
}

Method resetAll(element As PXW.DEV.Element)
{
 	For  {
		Set a=element.partsGetNext(.akey)
		Quit:akey=""
		
	    If a.%IsA("PXW.DEV.Element") {
			Do ..resetAll(a)
		} ElseIf a.%IsA("PXW.DEV.Atom") {
            Set type=$$$UPPER($PIECE(a.type,":",1))
            ; this is the word "method" or "property" etc
            If type="KEYWORD" {
            }
            Do ..resetWhitespace(a)     
		}
	}
}

/// If there is NO whitespace leave alone, otherwise make it a single space.
/// Whitespace on Comments is untouched. - WHICH IS NOT QUITE RIGHT FOR LINECOMMENTS (--)
Method resetWhitespace(Atom As PXW.DEV.Atom)
{
    If $ISOBJECT(Atom.whitespace) {
        If Atom.whitespace.value'="" {
            Set Atom.whitespace.value=" "
        }
        Do ..resetWhitespace(Atom.whitespace)
    }
}

Method setAll(element As PXW.DEV.Element, indent As %Integer = 0, flags As %String = "")
{
    If element.type="SelectCommand" {
        Do ..setWhitespaceNewLineElement(element,indent)
        ; need to do the froms and joins to the same indent?
        Set indent=indent+1 
    }

    If element.type="SqlCaseExpression" {
        Set indent=indent+1
    }

    If element.type="SqlCaseWhen" {
        Do ..setWhitespaceNewLineElement(element,indent)
    }
    If element.type="SqlCaseElse" {
        Do ..setWhitespaceNewLineElement(element,indent)
    }
    If element.type="SqlCaseEnd" {
        Do ..setWhitespaceNewLineElement(element,indent-1)
    }

    If element.type="FromClause" {
        Do ..setWhitespaceNewLineElement(element,indent)
    }

    If element.type="Join" {
        Do ..setWhitespaceNewLineElement(element,indent)
        Set indent=indent+1
    }

    If element.type="JoinOn" {
        Do ..setWhitespaceNewLineElement(element,indent)
        set flags="CONDITION"
    }

    If element.type="WhereClause" {
        Do ..setWhitespaceNewLineElement(element,indent)
        set flags="CONDITION"
        Set indent=indent+1
    }

    ; put each AND on a new line, only applies to certain types of conditions (eg JOIN ON, WHERE)
    if flags["CONDITION" {
        if element.type="SqlDyadicop",$$$UPPER(element.ToString(0))="AND" {
            Do ..setWhitespaceNewLineElement(element,indent)
        }
    }

    If element.type="WithCommand" {
        Do ..setWhitespaceNewLineElement(element,indent)
        Set indent=indent+1
    }

    If element.type="WithClause" {
        Do ..setWhitespaceNewLineElement(element,indent)
        Set indent=indent+1
    }

    If element.type="SelectSublist" {
        Do ..setWhitespaceNewLineElement(element,indent)
    }

    if element.type="Union" {
        Do ..setWhitespaceNewLineElement(element,indent)
    }

   	For  {
		Set a=element.partsGetNext(.akey)
		Quit:akey=""
		
	    If a.%IsA("PXW.DEV.Element") {
			Do ..setAll(a,indent,flags)
		} else {
            set a.line=..currentLine
        }
	}

    ;i element.type="SelectCommand" {
     ;   s ..indent=..indent-1 
    ;}
}

Method setWhitespaceNewLineElement(Element As PXW.DEV.Element, indent As %Integer)
{
    Set a=Element.FirstAtom()
    Do ..setWhitespaceNewLine(a,indent)
}

Method setWhitespaceNewLine(Atom As PXW.DEV.Atom, indent As %Integer)
{
    ;w !,"moving "_Atom.value_" onto new line with "_..indent_" tabs"
    Set cr=$CHAR(13,10)
    Set tabs=$CHAR(9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9,9)
    ;s tabs="..................."
    Set ..currentLine=..currentLine+1
    Set Atom.whitespace=##class(PXW.DEV.Atom).%New()
    Set Atom.whitespace.value=cr_$EXTRACT(tabs,1,indent)
    Set Atom.line=..currentLine
}

}
