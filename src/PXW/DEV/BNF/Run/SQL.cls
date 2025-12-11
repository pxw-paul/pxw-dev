Class PXW.DEV.BNF.Run.SQL Extends PXW.DEV.BNF.GEN.SQL
{

/// Set to CDEF, COS
Property commentMode As %String [ InitialExpression = "SQL" ];

/// alias_name ::= identifier
///  summary=F
///  type=group
Method AliasName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	;$$$DEBUG("%path="_%path)
	$$$BNFSTART(subElement)
	Set done=0
	If ..Identifier(subElement,.addedAtom) {
        Set string=$$$UPPER(subElement.ToString(0))
        ; an alias must not be any of the following
        $$$DEBUG("Alias name found:"_string)
        If $LISTFIND($LISTBUILD("LEFT","RIGHT","INNER","OUTER","CROSS","JOIN","FROM","WHERE","UNION","ON","INTO","SET","HAVING"),string)>0 {
            Set done=0
        } Else {
            ; it may be ORDER unless its followed by BY
            If $LISTFIND($LISTBUILD("ORDER","GROUP"),string) {
                Do ..skipWhiteSpaceAndComments()
                Set peek=$$$UPPER(..peek(2))
                If peek="BY" {
                    Set done=0
                } Else {
                    Set done=1
                }
            } Else {
		        Set done=1
            }
        }
	}
	If done {
		$$$BNFCOMMIT(subElement,ParentElement)
		Set ok=1
	} Else {
		$$$BNFROLLBACK(subElement)
		Set ok=0
	}
	$$$DEBUGMethodEnd
	Quit ok
}

/// column_name ::= identifier
///  summary=F
///  type=group
Method ColumnName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Elements.SQL) As %Library.Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	;$$$DEBUG("%path="_%path)
	$$$BNFSTART(subElement)
	Set done=0
    If ..addPunctuation(subElement,"*") {
        Set done=1
    } ElseIf ..Identifier(subElement,.addedElement)	 {
        Set string=$$$UPPER(subElement.ToString(0))
        ; an alias must not be any of the following
        If $LISTFIND($LISTBUILD("LEFT","RIGHT","INNER","OUTER","CROSS","JOIN","FROM","WHERE","UNION","ON","INTO"),string)>0 {
            Set done=0
        } Else {
            ; it may be ORDER unless its followed by BY
            If string="ORDER" {
                Do ..skipWhiteSpaceAndComments()
                Set peek=$$$UPPER(..peek(2))
                If peek="BY" {
                    Set done=0
                } Else {
                    Set done=1
                }
            } Else {
		        Set done=1
            }
        }
    }
	If done {
		$$$BNFCOMMIT(subElement,ParentElement)
		Set ok=1
	} Else {
		$$$BNFROLLBACK(subElement)
		Set ok=0
	}
	$$$DEBUGMethodEnd
	Quit ok
}

Method Identifier(ParentElement As PXW.DEV.BNF.Element) As %Boolean
{
    $$$DEBUGMethodBegin
    $$$BNFPATH
	;$$$DEBUG("%path="_%path)

    ;d ..skipWhiteSpaceAndComments()
    Do:('..whitespace&&'..comment) ..skipWhiteSpaceAndComments()

    Set value=""
    Set ok=0

    ; identifiers in SQL can be in ""
    If ..peek(1)="""" {
        
        Set q1=..next()
        Set ok=1
        While ok {
            Set ch2=..peek(2)
            If ch2="""""" {
                Set value=value_..next(2)
            } ElseIf ..peek(1)'="""" {
                Set value=value_..next()
            } Else {
                Set ok=0
            }
        }
        Set q2=..next()
        Set atom=..newAtom(ParentElement.type,value)
        Set atom.start=q1
        Set atom.end=q2
        Do ParentElement.AddPart(atom)
        Set ok=1
    } Else {

        If ..peek(1)="%" Set value=..next()
        If ..peek(1)="%" Set value=..next()
        If ..peek(1)="_" Set value=..next()
        ; not a letter (or number)
        Set ch=..peek(1)
        ; no % so must start with a letter
        If value="",ch?1A Set value=..next()

        Set ok=1    
        If value="" {
            $$$DEBUG("checking identifier, ok=0")
            Set ok=0
        }
    
        If ok {

            Set ch=..peek(1)
            While (ch?1A) || (ch?1N) || (ch="_")  {
                Set value=value_..next()
                Set ch=..peek(1)
            }
        
            Set atom=..newAtom(ParentElement.type,value)
            Do ParentElement.AddPart(atom)
        }
    }
    ;$$$DEBUG("checking identifier, ok=1")
    ;zw atom
    $$$DEBUGMethodEnd
    Quit ok
}

/// sql_number ::= 'NEED NUMBER'
///  summary=S
///  type=group
Method SqlNumber(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Elements.SQL) As %Library.Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	;$$$DEBUG("%path="_%path)
    Set digits="01234567890."
	Set n="",done=0
	While ('..eof()) && (digits[..peek(1)) {
		Set n=n_..next()
        Set done=1
	}
    ; -123.456E
    If done,((..peek(1)="E") || (..peek(1)="e")) {
        Set n=n_..nextNotEOL(1)
        ; 123.456E-
        If ..peek(1)="-"{
            Set n=n_..nextNotEOL(1)
        }

        ; -123.456E-789
        While (..peek(1)?1N) {
            Set n=n_..nextNotEOL(1)
        }
    }
    
	If done {
        Set atom=..newAtom("Number",n)
        Do ParentElement.AddPart(atom)
		Set ok=1
	} Else {
		Set ok=0
	}
	$$$DEBUGMethodEnd
	Quit ok
}

/// sql_string ::= 'NEED STRING'
///  summary=S
///  type=group
Method SqlString(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Elements.SQL) As %Library.Boolean
{
    $$$DEBUGMethodBegin
	$$$BNFPATH
	;$$$DEBUG("%path="_%path)
    Do:('..whitespace&&'..comment) ..skipWhiteSpaceAndComments()

    Set ok=1
    Set quote=..peek(1)
    If quote'="'" {
        Set ok=0
    }

    If ok {
        $$$BNFSTART(subElement)

        Set n=..next()
        Set instring=1
        While '..eof() && instring {
            Set chs=..peek(2)
            Set ch=$EXTRACT(chs,1),ch2=$EXTRACT(chs,2)
            ; embedded quotes or end of string?
            If ch=quote {
                If ch2=quote {
                    Set n=n_..next()_..next()
                } Else {
                    Set instring=0
                    Set n=n_..next()
                }
            } Else {
                Set n=n_..next()
            }
        }
        Set o=..newAtom("String",n)
        Do subElement.AddPart(o)
        $$$BNFCOMMIT(subElement,ParentElement)
    }
    $$$DEBUGMethodEnd
    Quit ok
}

Method SqlCosVariable(ParentElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
	#dim atom as PXW.DEV.Atom
    $$$DEBUGMethodBegin
	$$$BNFPATH
 	$$$BNFSTART(subElement)
    Set ok=0
 
    Set parser=##class(PXW.DEV.BNF.Run.COS).%New()
    Set parser.stream=..stream
    Set parser.codemode="COSSQL" ; not really true, should only be set for TRIGGERS but at this point we don't know where we are! and we should treat these as field names
    Set parser.whitespace=..whitespace
    Set parser.comment=..comment
    ;d parser.skipWhiteSpaceAndComments()
    if parser.ThisObjectDirectProperty(subElement) {
        set ok=1
    } elseIf parser.Variable(subElement) {
        Set ok=1
    } 
    If ok=1 {
        Set ..whitespace=parser.whitespace
        Set ..comment=parser.comment
        $$$BNFCOMMIT(subElement,ParentElement)
    } Else {
        $$$BNFROLLBACK(subElement)
    }
    $$$DEBUGMethodEnd
    Quit ok
}

Method skipComments(ch10 As %String) As %Boolean
{
    If $EXTRACT(ch10,1,2)="--" Set ..comment=..readLineComment("--") Quit 1
    If $EXTRACT(ch10,1,2)="/*" Set ..comment=..readBlockComment() Quit 1
    Quit 0
}

}
