Class PXW.DEV.BNF.Run.JS Extends PXW.DEV.BNF.GEN.JS
{

/// Set to CDEF, COS
Property commentMode As %String [ InitialExpression = "JS" ];

Property codeMode As %String [ InitialExpression = "CSP" ];

///  statement_List ::= statement*
/// summary=(?4Call:4?)*
Method Statement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
    Do:..needsWScheck ..skipWhiteSpaceAndComments()
    ; if the code is embedded then we need to stop at:
    If ..peek(1)="<" Quit 0 ; </script>?
    If ..peek(1)=">" Quit 0 ; &js<  >
    If ..peek(1)="}" Quit 0 ; } end of method
    Set ok=##super(ParentElement,.subElement)
    If 'ok {
        Do ..recover(ParentElement,.recsub,"{}",$LISTBUILD($CHAR(13)))
        Set ok=1
    }

	Quit ok
}

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
    If $ISOBJECT(..whitespace),..whitespace.ToString(0)[$CHAR(13) {
        Quit 1
    }
    If ..peek(1)="}" {
        Quit 1 ; do not consume
    }

    ; > counts as end of file if embedded
    If ..peek(1)=">" {
        Quit 1
    }

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
		Set ok=1
	} Else {
		$$$BNFROLLBACK(subElement)
		Set ok=0
	} 
	$$$DEBUGMethodEnd
	Quit ok
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
    ;Set ok=0
  
    ;If ..peek(1)="_" Set value=..nextNotEOL(1)
    ;Set ch=..peek(1)
    ;If value="",ch?1A Set value=..nextNotEOL(1)

    ;Set ok=1    
    ;If value="" {
    ;    $$$DEBUG("checking identifier, ok=0")
    ;    Set ok=0
    ;}

    Set ok=0

    Set ch=..peek(1)
    While (ch?1A) || (ch?1N) || (ch="_") || (ch="$") {
        Set value=value_..nextNotEOL(1)
        Set ch=..peek(1)
    }
    If value'="" {
        Set ok=1
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
            Set ok=1
        } Else {
            $$$BNFROLLBACK(subElement)
            Set ok=0
        }
    } Else {
        Set ok=0
    }
	$$$DEBUGMethodEnd
	Quit ok
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
            Set ok=1
        } Else {
            $$$BNFROLLBACK(subElement)
            Set ok=0
        }
    } Else {
        Set ok=0
    }
	$$$DEBUGMethodEnd
	Quit ok
}

/// STRING_LITERAL ::= 'NEED STRING LITERAL'
///  summary=S
///  type=group
///  not=0
Method oldStringLiteral(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
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

Method StringLiteral(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
    i ..codeMode="ClientMethod" q ..ClientMethodStringLiteral(ParentElement,.subElement)

    $$$DEBUGMethodBegin
    $$$BNFSTART(subElement)
    $$$BNFPATH
	;$$$DEBUG("%path="_%path)

    ;d ..skipWhiteSpaceAndComments()
    Do:..needsWScheck ..skipWhiteSpaceAndComments()
    Set ok=0
    Set char=..peek(1)
    If char="""" Set ok=1
    If char="'" Set ok=1

    Set instring=1 ; 1 means started, 2=continuation (after code expression)
    If ok {
        While '..eof() && instring {
            Set o=..newAtom("String")
            Set n=""
            If instring=1 {
                Set o.start=..next()
                ;Set n=""
                Set marker=o.start
                Set instring=2
            }
            Set cos=0
            While '..eof() && instring && 'cos {
                Set ch=..peek(1),ch2=$EXTRACT(..peek(2),2)
                
                If ch="\" {
                    ; escaped marker (' or ")
                    If ch2=marker {
                        Set n=n_..next(2) ; \"
                    } ElseIf ch2="\" {
                        Set n=n_..next(2) ; \\
                    } Else {
                        Set n=n_..next()
                    }
                } ElseIf ch="#",ch2="(" { 
                    ; what if we have '#(' ? thats annoying
                    If $EXTRACT(..peek(3),3)=marker {
                        ; not in cos!
                        Set n=n_..next(2)
                    } Else {
                        Set cos=1
                    }
                } ElseIf ch=marker {
                    Set instring=0
                    Set o.end=..next()
                } Else {
                    Set n=n_..next()
                }
            }
            Set o.value=n
            Do subElement.AddPart(o)
            If cos {
                Do ..CosExpression(subElement,.cosSubElement) 
            }
        }
    }
    If ok {
 
        Do ParentElement.AddPart(subElement)
    }
    
    ;$$$DEBUG("checking identifier, ok=1")
    ;zw atom
    $$$DEBUGMethodEnd
    Quit ok
}

Method ClientMethodStringLiteral(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
    $$$DEBUGMethodBegin
    $$$BNFSTART(subElement)
    $$$BNFPATH
	;$$$DEBUG("%path="_%path)

    ;d ..skipWhiteSpaceAndComments()
    Do:..needsWScheck ..skipWhiteSpaceAndComments()
    Set ok=0
    Set char=..peek(1)
    If char="""" Set ok=1
    If char="'" Set ok=1

    Set instring=1 ; 1 means started, 2=continuation (after code expression)
    If ok {
        While '..eof() && instring {
            Set o=..newAtom("String")
            Set n=""
            If instring=1 {
                Set o.start=..next()
                ;Set n=""
                Set marker=o.start
                Set instring=2
            }
            Set cos=0
            While '..eof() && instring && 'cos {
                Set ch=..peek(1),ch2=$EXTRACT(..peek(2),2)
                
                If ch="\" {
                    ; escaped marker (' or ")
                    If ch2=marker {
                        Set n=n_..next(2) ; \"
                    } ElseIf ch2="\" {
                        Set n=n_..next(2) ; \\
                    } Else {
                        Set n=n_..next()
                    }
                } ElseIf ch=marker {
                    Set instring=0
                    Set o.end=..next()
                } Else {
                    Set n=n_..next()
                }
            }
            Set o.value=n
            Do subElement.AddPart(o)
            If cos {
                Do ..CosExpression(subElement,.cosSubElement) 
            }
        }
    }
    If ok {
 
        Do ParentElement.AddPart(subElement)
    }
    
    ;$$$DEBUG("checking identifier, ok=1")
    ;zw atom
    $$$DEBUGMethodEnd
    Quit ok
}

/// cos_expression_body ::= 'NEEDS COS EXPRESSION BODY'
///  summary=S
///  type=group
///  not=0
Method CosExpressionBody(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
	#dim atom as PXW.DEV.Atom
	$$$DEBUGMethodBegin
    $$$BNFPATH
	$$$BNFSTART(subElement)
    Set atom=..newAtom("CosCodeExpression Begin","")
    Do ParentElement.AddPart(atom)

	Set parser=##class(PXW.DEV.BNF.Run.COS).%New()
	Set parser.stream=..stream
    Do parser.skipWhiteSpaceAndComments()
    ;$$$DEBUG("COS CODE BLOCK peeked "_parser.peek(1))
	Set done=0
    If parser.peek(2)=")#" {
		; its empty 
		Set ..whitespace=parser.whitespace
		Set ..comment=parser.comment
		Set atom=..newAtom("CosCodeExpression Empty","")
		Do ParentElement.AddPart(atom)
        Set done=1
	} ElseIf parser.Expression(subElement) {
		$$$BNFCOMMIT(subElement,ParentElement)
		Set ..whitespace=parser.whitespace
		Set ..comment=parser.comment
		Set atom=..newAtom("CosCodeBlock End","")
		Do ParentElement.AddPart(atom)
		Set done=1
	} Else {
        $$$BNFROLLBACK(subElement)
        Set done=0
    }
    $$$DEBUGMethodEnd
    Quit done
}

Method CosMethodReference(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
	#dim atom as PXW.DEV.Atom
	$$$DEBUGMethodBegin
    $$$BNFPATH
	$$$BNFSTART(subElement)

    ; read all up to the (
    set mref=..stream.PeekToString("(")
    set atom=..newAtom(subElement.type,..nextNotEOL($l(mref)))
    do subElement.AddPart(atom)
    do ParentElement.AddPart(subElement)
    set done=1 
    $$$DEBUGMethodEnd
    Quit done
}

///  regular_expression_literal ::= 'NEED regex literal'
/// summary values:NEED REGEX LITERAL
/// summary=P
Method RegularExpressionLiteral(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	#dim o as PXW.DEV.Atom

    $$$DEBUGMethodBegin
	;$$$BNFPATH
	;;$$$DEBUG("%path="_%path)
    Do:..needsWScheck ..skipWhiteSpaceAndComments()

    Set ok=0
    If ..peek(1)'="","/"[..peek(1) {
        Set ok=1
    }

    If ok {
        $$$BNFSTART(subElement)

        Set q1="/"
        Set n=..nextNotEOL(1)
        Set instring=1
        While '..eof() && instring {
            Set chs=..peek(2)
            Set ch=$EXTRACT(chs,1),ch2=$EXTRACT(chs,2)
            ; embedded quotes
            If ch="/" {
                If ch2=q1 {
                    Set n=n_..nextNotEOL(2)
                } Else {
                    Set instring=0
                    Set n=n_..nextNotEOL(1)
                } 
            }  ElseIf ch="\",ch2="\" {
                Set n=n_..nextNotEOL(2)   
            } ElseIf ch="\",ch2="/" {
                Set n=n_..nextNotEOL(2)   
            } Else {
                Set n=n_..nextNotEOL(1)
            }
        }
        ; reg ex can end with an extra letter on the end "/abc/i"
        While ..peek(1)?1a {
            Set n=n_..nextNotEOL(1)
        }
        Set o=..newAtom("RegEx",n)

        Do subElement.AddPart(o)
        $$$BNFCOMMIT(subElement,ParentElement)
    }
    $$$DEBUGMethodEnd
    Quit ok
}

///  is_not_Line_Terminator ::= 'NEEDS is_not_Line_Terminator'
/// summary values:NEEDS IS_NOT_LINE_TERMINATOR
/// summary=P
Method IsNotLineTerminator(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
    #dim x as %DeepSee.Component.Widget.widget
    Do:..needsWScheck ..skipWhiteSpaceAndComments()

    Set isTerminator=0
    If $ISOBJECT(..whitespace),..whitespace.ToString(0)[$CHAR(13) {
        Set isTerminator=1
    }
    Quit 'isTerminator
}

}
