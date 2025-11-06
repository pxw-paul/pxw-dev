Class PXW.DEV.BNF.Run.CSP Extends PXW.DEV.BNF.GEN.CSP
{

/// Set to CDEF, COS
Property commentMode As %String [ InitialExpression = "XML" ];

/// xml_content ::= text
///  summary=F
///  type=group
Method Text(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
    $$$DEBUGMethodBegin
    $$$BNFSTART(subElement)
    Do:..needsWScheck ..skipWhiteSpaceAndComments()
    
    ; reached a mismatched > so at the end?
    If ..peek(1)=">" Quit 0

	;$$$BNFPATH
	;;$$$DEBUG("%path="_%path)
    Set ok=0,n=""
    While ('..eof()) && (..peek(1)'="<") && (..peek(1)'=">") {
        Set cos=0
        While ('..eof()) && (..peek(1)'="<") && (..peek(1)'=">") && ('cos) {
            Set ch2=..peek(2)
            If ch2="#(" {
                Set cos=1
            } Else {
                Set n=n_..next()
            }
            Set ok=1
        }
        Set o=..newAtom(subElement.type,n)
        Do subElement.AddPart(o)
        If cos {
            Do ..CosExpression(subElement,.cosSubElement)
        }
    }
    $$$BNFCOMMIT(subElement,ParentElement)
    $$$DEBUGMethodEnd
    Quit ok
}

Method TextNoSpace(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
    $$$DEBUGMethodBegin
    $$$BNFSTART(subElement)
    Do:..needsWScheck ..skipWhiteSpaceAndComments()
    
    If $ISOBJECT(..whitespace) Quit 0
    
    ; reached a mismatched > so at the end?
    If ..peek(1)=">" Quit 0

	;$$$BNFPATH
	;;$$$DEBUG("%path="_%path)
    Set ok=0,n=""
    While ('..eof()) && (..peek(1)'="<") && (..peek(1)'=">")  && (..peek(1)'=" ") {
        Set cos=0
        While ('..eof()) && (..peek(1)'="<") && (..peek(1)'=">") && (..peek(1)'=" ") && ('cos) {
            Set ch2=..peek(2)
            If ch2="#(" {
                Set cos=1
            } Else {
                Set n=n_..next()
            }
            Set ok=1
        }
        Set o=..newAtom(subElement.type,n)
        Do subElement.AddPart(o)
        If cos {
            Do ..CosExpression(subElement,.cosSubElement)
        }
    }
    $$$BNFCOMMIT(subElement,ParentElement)
    $$$DEBUGMethodEnd
    Quit ok
}

Method CspElement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
	Set oldmode=..commentMode
    Set ..commentMode="XML"
    Set ok=##super(ParentElement,.subElement)
    Set ..commentMode=oldmode
  
    Quit ok
}

Method Identifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
    $$$DEBUGMethodBegin
    $$$BNFSTART(subElement)
    $$$BNFPATH
	;$$$DEBUG("%path="_%path)

    ;d ..skipWhiteSpaceAndComments()
    Do:..needsWScheck ..skipWhiteSpaceAndComments()

    Set value=""
    Set ok=0
    ;i ..peek(1)="%" s value=..next()
    ;i ..peek(1)="%" s value=..next()
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
        While (ch?1A) || (ch?1N) || (ch=".") || (ch="-")  {
            Set value=value_..next()
            Set ch=..peek(1)
        }
    
        Set atom=..newAtom(subElement.type,value)
        Do subElement.AddPart(atom)
        Do ParentElement.AddPart(subElement)
    }
    ;$$$DEBUG("checking identifier, ok=1")
    ;zw atom
    $$$DEBUGMethodEnd
    Quit ok
}

Method String(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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
            If instring=1 {
                Set o.start=..next()
                Set n=""
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
                    Set cos=1                
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

Method Number(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
    $$$DEBUGMethodBegin
    $$$BNFSTART(subElement)
    $$$BNFPATH
	;$$$DEBUG("%path="_%path)

    ;d ..skipWhiteSpaceAndComments()
    Do:..needsWScheck ..skipWhiteSpaceAndComments()

    Set value=""
    Set ok=0

    Set ch=..peek(1)
    While (ch?1N) || (ch=".")  {
        Set value=value_..next()
        Set ch=..peek(1)
        Set ok=1
    }
    If ok {
        Set atom=..newAtom(subElement.type,value)
        Do subElement.AddPart(atom)
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

Method JavascriptBody(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
    #dim atom as PXW.DEV.Atom
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
        $$$BNFCOMMIT(subElement,ParentElement)
        Set ..whitespace=parser.whitespace
        Set ..comment=parser.comment
        Set atom=..newAtom("JavascriptCodeBlock End","")
        Do ParentElement.AddPart(atom)
        Set ok=1
    } Else {
        $$$BNFROLLBACK(subElement)
        Set ok=0
    }
    $$$DEBUGMethodBegin
    Quit ok
   	/*#dim tokenstream as PXW.DEV.TokenStream

	$$$DEBUGMethodBegin
	$$$BNFPATH
	;$$$DEBUG("%path="_%path)

	s parser=##class(PXW.DEV.JS.Parser).%New()
	d parser.inputNewObject()
	s parser.input.input=..stream
    s parser.EndEmbeddedChar="</SCRIPT>"

	s imp=##class(PXW.DEV.Element).%New()
    ;s imp.This=..This 
    ;s imp.ThisMethod=..ThisMethod
    ;s imp.Parser=parser.%ClassName(1)
    set next=parser.Next(.scratch)
    while next {
        d imp.AddPart(next)
        s next=parser.Next(.scratch)
    }
    d ParentElement.AddPart(imp)

    ; the tokeniser will have the last thing in it which should be a ">" so go back
    s ..stream.pos=..stream.pos-1

    ;w "<pre>" w "peek2="_..peek((10)) d ..getBookmark(.bookMark) zw bookMark w "</pre>"
    $$$DEBUGMethodEnd
    q 1
    */


    /*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	;$$$DEBUG("%path="_%path)

   	#dim atom as PXW.DEV.Atom
	;$$$BNFPATH
	$$$BNFSTART(subElement)
    s atom=..newAtom("JSCodeBlock Begin","")
    d ParentElement.AddPart(atom)

	s parser=##class(PXW.DEV.BNF.Run.JS).%New()
	s parser.stream=..stream
    d parser.skipWhiteSpaceAndComments()
    ;$$$DEBUG("COS CODE BLOCK peeked "_parser.peek(1))
	i parser.CspPage(subElement) {
		$$$BNFCOMMIT(subElement,ParentElement)
		s ..whitespace=parser.whitespace
		s ..comment=parser.comment
    	s atom=..newAtom("CSPCodeBlock End","")
		d ParentElement.AddPart(atom)
		quit 1
	} else {
        $$$BNFROLLBACK(subElement)
        quit 0
    }*/
}

///  js_expression ::= 'NEEDS JS EXPRESSION'
/// summary values:NEEDS JS EXPRESSION
/// summary=P
Method JsExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
    #dim atom as PXW.DEV.Atom
    $$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)

	Set parser=##class(PXW.DEV.BNF.Run.JS).%New()
	Set parser.stream=..stream
    Do parser.skipWhiteSpaceAndComments()

    $$$DEBUG("Javascript Expression:"_parser.peek(50))
    If parser.SingleExpression(subElement) {
        $$$BNFCOMMIT(subElement,ParentElement)
        Set ..whitespace=parser.whitespace
        Set ..comment=parser.comment
        Set ok=1
    } Else {
        $$$BNFROLLBACK(subElement)
        Set ok=0
    }
    $$$DEBUGMethodBegin
    Quit ok
}

/// Skip over the next set of comments, return 1 if something was done or 0
Method skipComments(ch10 As %String) As %Boolean
{
    Set ch4=$EXTRACT(ch10,1,4)
    If ch4="<!--" Set ..comment=..readBlockComment("<!--","-->") Quit 1
    Quit 0
}

}
