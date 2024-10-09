Class PXW.DEV.BNF.Run.JS Extends PXW.DEV.BNF.GEN.JS
{

/// Set to CDEF, COS
Property commentMode As %String [ InitialExpression = "JS" ];

/// eos ::= SemiColon
/// | end_of_file
/// /*| {this.lineTerminatorAhead()}?
/// | {this.closeBrace()}?
/// */
///  summary=F|F 
///  type=group
///  not=0 
Method Eos(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
    If ..needsWScheck Do ..skipWhiteSpaceAndComments()

    If $ISOBJECT(..whitespace),..whitespace[$CHAR(13) Quit 1
    If ..peek(1)="}" Quit 1 ; do not consume

	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	Set done=0
	If ..Semicolon(subElement,.addedElement) {
	 Set done=1 
	} ElseIf ..eof()	 {
		Set done=1 
	}  
	If done {
		$$$BNFCOMMIT(subElement,ParentElement)
		Set ret=1
	} Else {
		$$$BNFROLLBACK(subElement)
		Set ret=0
	} 
	$$$DEBUGMethodEnd
	Quit ret
}

/*
IDENTIFIER_NAME ::= 'NEED IDENTIFIER NAME'
STRING_LITERAL ::= 'NEED STRING LITERAL'
DECIMAL_LITERAL ::= 'NEED DECIMAL LITERAL'
HEX_INTEGER_LITERAL ::= 'NEED HEX INTEGER LITERAL'
*/
Method Identifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
    Quit ..IdentifierName(ParentElement,.subElement)
}

/// IDENTIFIER_NAME ::= 'NEED IDENTIFIER NAME'
///  summary=S
///  type=group
///  not=0
Method IdentifierName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
	    $$$DEBUGMethodBegin
    ;$$$BNFPATH
	;;$$$DEBUG("%path="_%path)

    ;d ..skipWhiteSpaceAndComments()
    Do:..needsWScheck ..skipWhiteSpaceAndComments()

    Set value=""
    Set ok=0
  
    ;i ..peek(1)="%" s value=..nextNotEOL(1)
    If ..peek(1)="_" Set value=..nextNotEOL(1)
    ; not a letter (or number)
    Set ch=..peek(1)
    ; no % so must start with a letter
    If value="",ch?1A Set value=..nextNotEOL(1)

    Set ok=1    
    If value="" {
        $$$DEBUG("checking identifier, ok=0")
        Set ok=0
    }
    If ok {

        Set ch=..peek(1)
        While (ch?1A) || (ch?1N)  {
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

/// DECIMAL_LITERAL ::= 'NEED DECIMAL LITERAL'
///  summary=S
///  type=group
///  not=0
Method DecimalLiteral(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	;$$$DEBUG("%path="_%path)
	$$$BNFSTART(subElement)
	Set done=0

    Set n=""
    ; -
    While (..peek(1)="-") || (..peek(1)="+") {
        Set n=n_..nextNotEOL(1)
    }

    ; -123
    While (..peek(1)?1N) {
        Set n=n_..nextNotEOL(1)
    }

    ; start with a .
    If ..peek(2)?1"."1N {
        Set n=n_..next(2)
    }
    
    If n'="" {

        ; -123.456
        While (..peek(1)?1N) || (..peek(1)=".") {
            Set n=n_..nextNotEOL(1)
        }

        ; -123.456E
        If (..peek(1)="E") || (..peek(1)="e") {
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

        If n'="" {
            Set atom=..newAtom("Number",n)
            Do subElement.AddPart(atom)
            Set done=1
        }
        If done {
            $$$BNFCOMMIT(subElement,ParentElement)
            Set ret=1
        } Else {
            $$$BNFROLLBACK(subElement)
            Set ret=0
        }
    } Else {
        Set ret=0
    }
	$$$DEBUGMethodEnd
	Quit ret
}

/// HEX_INTEGER_LITERAL ::= 'NEED HEX INTEGER LITERAL'
///  summary=S
///  type=group
///  not=0
Method HexIntegerLiteral(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	;$$$DEBUG("%path="_%path)
	$$$BNFSTART(subElement)
	Set done=0

    If ..peek(2)="0x" {
        Set n=..nextNotEOL(2) 
        ; -123
        While (..peek(1)'=""), ("0123456789ABCDEF"[..peek(1)) {
            Set n=n_..nextNotEOL(1)
        }

        If n'="" {
            Set atom=..newAtom("Number",n)
            Do subElement.AddPart(atom)
            Set done=1
        }

        If done {
            $$$BNFCOMMIT(subElement,ParentElement)
            Set ret=1
        } Else {
            $$$BNFROLLBACK(subElement)
            Set ret=0
        }
    } Else {
        Set ret=0
    }
	$$$DEBUGMethodEnd
	Quit ret
}

/// STRING_LITERAL ::= 'NEED STRING LITERAL'
///  summary=S
///  type=group
///  not=0
Method StringLiteral(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
		#dim o as PXW.DEV.Atom

    $$$DEBUGMethodBegin
	;$$$BNFPATH
	;;$$$DEBUG("%path="_%path)
    Do:..needsWScheck ..skipWhiteSpaceAndComments()

    Set ok=0
    If ..peek(1)'="","""'"[..peek(1) {
        Set ok=1
    }

    If ok {
        $$$BNFSTART(subElement)

        Set q1=..nextNotEOL(1)
        Set n=""
        Set instring=1
        While '..eof() && instring {
            Set chs=..peek(2)
            Set ch=$EXTRACT(chs,1),ch2=$EXTRACT(chs,2)
            ; embedded quotes
            If ch="\" {
                If ch2=q1 {
                    Set n=n_..nextNotEOL(2)
                } Else {
                    Set n=n_..nextNotEOL(1)
                }
            } ElseIf ch=q1 {
                    Set instring=0
                    Set q2=..nextNotEOL(1)
            } Else {
                Set n=n_..nextNotEOL(1)
            }
        }
        Set o=..newAtom("String",n)
        Set o.start=q1
        Set o.end=q2
        Do subElement.AddPart(o)
        $$$BNFCOMMIT(subElement,ParentElement)
    }
    $$$DEBUGMethodEnd
    Quit ok
}

Method skipComments(ch10 As %String) As %Boolean
{
    If $EXTRACT(ch10,1,2)="//" Set ..comment=..readLineComment("//") Quit 1
    If $EXTRACT(ch10,1,2)="/*" Set ..comment=..readBlockComment() Quit 1
    Quit 0
}

}
