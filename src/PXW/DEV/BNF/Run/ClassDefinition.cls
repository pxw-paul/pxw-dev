Class PXW.DEV.BNF.Run.ClassDefinition Extends PXW.DEV.BNF.GEN.ClassDefinition
{

/// Set to CDEF, COS
Property commentMode As %String [ InitialExpression = "CDEF" ];

/* properties that are reset on every member */
Property language As %String;

Property codemode As %String;

Property mimetype As %String;

/// When this runs in lowmem mode you are expected to handle some of the stuff in the caller
Property lowmem As %Boolean [ InitialExpression = 1 ];

Property nextStage As %Integer [ InitialExpression = 0 ];

Parameter keywordAtomType = "CDEFKeyword";

/**********************************************************************
 Performance fiddles, to break the class definition (which can be huge)
 into smaller bits (ie a single property or method)
**********************************************************************/
Method cheese(element As PXW.DEV.Element) As %Boolean
{

    If ..nextStage=0 {
         Set ok=..UdlStatement(element)
         Set ..nextStage=1
    } ElseIf ..nextStage=1 {
        Set ok=..OneClassmember(element)
        ; when we get past the memebers ok=0 so THEN move on
        If ok=0 {
            Set ok=..addPunctuation(element,"}")
            If ok {
                Do:..needsWScheck ..skipWhiteSpaceAndComments()
                Set ..nextStage=2
            }
        } 
    } Else {
        Set ok=0
    }

    Quit ok
}

Method full(element As PXW.DEV.Element) As %Boolean
{
    Set ..lowmem=0
    Set retval=..ClassDefinition(element)
    Quit retval
}

Method ClassMemberSection(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
	If ..isStringSingle("{",.value)=0 Quit 0
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	Set done=0
	; type=group, check=if, skip=1, skipall=0
	Set gotVal=..next($LENGTH(value)),atom=..newAtom("punctuation",gotVal)
	Do subElement.AddPart(atom)
   
    If ..lowmem { 
        Set done=1
    } Else {
        If $SELECT(..ClassMemberList(subElement,.addedElement):1,1:1) {
            If ..addPunctuation(subElement,"}")	 {
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

/***************************************************************************************
 override stuff from super (not generated code)
***************************************************************************************/
Method skipComments(ch10 As %String) As %Boolean
{
    If ..commentMode="XML" {
        If $EXTRACT(ch10,1,4)="<!--" Set ..comment=..readBlockComment("<!--","-->") Quit 1
    } Else {
        If $EXTRACT(ch10,1,3)="///" Set ..comment=..readLineComment("///") Quit 1
        If $EXTRACT(ch10,1,2)="//" Set ..comment=..readLineComment("//") Quit 1
        If $EXTRACT(ch10,1,2)="/*" Set ..comment=..readBlockComment("/*","*/") Quit 1
    }
    Quit 0
}

/***************************************************************************************
 Rules that can be recovered if necessary (eg try to go to next class member
***************************************************************************************/
Method OneClassmember(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
    Set ..language="objectscript"
    Set ..codemode=""

	Set ok=##super(ParentElement,.subElement)

    If ok=0 {
        Set peek=..peek(1)
        ; not eol or end of block
        If peek'=$CHAR(13),peek'="}" {
            Set ok=..recover(ParentElement,.recSub,"{}",$LISTBUILD($CHAR(13)))
        }
    }

    Quit ok
}

Method XdataJson(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
    Set ok=##super(ParentElement,.subElement)
   
    If ok=0 {
        Set ok=..recover(ParentElement,.recSub,"{}","")
    }

    Quit ok
}

/***************************************************************************************
 Calls to other parsers (methods, queries etc)
***************************************************************************************/
Method ClassQueryBody(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
   	#dim atom as PXW.DEV.Atom
	$$$BNFPATH
	$$$BNFSTART(subElement)
    Set atom=..newAtom("SQLCodeBlock Begin","")
    Do ParentElement.AddPart(atom)

	Set parser=##class(PXW.DEV.BNF.Run.SQL).%New()
	Set parser.stream=..stream
    Do parser.skipWhiteSpaceAndComments()
    ;$$$DEBUG("COS CODE BLOCK peeked "_parser.peek(1))
	If parser.peek(1)="}" {
		; its empty 
		Set ..whitespace=parser.whitespace
		Set ..comment=parser.comment
		Set atom=..newAtom("SQLCodeBlock Empty","")
		Do ParentElement.AddPart(atom)
		Quit 1
	}
	If parser.QuerySpecification(subElement) {
		Set ..whitespace=parser.whitespace
		Set ..comment=parser.comment
		Set atom=..newAtom("SQLCodeBlock End","")
		Do subElement.AddPart(atom)
		$$$BNFCOMMIT(subElement,ParentElement)
        If ..peek(1)'="}" {
            Do ..recover(ParentElement,.recsub,"{}","")
        }
 
		Quit 1
	} Else {
        $$$BNFROLLBACK(subElement)
        Quit 0
    }
}

Method CosCodeBlock(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean [ ProcedureBlock = 1 ]
{
	#dim atom as PXW.DEV.Atom
	;$$$BNFPATH
	$$$BNFSTART(subElement)
    Set atom=..newAtom("CosCodeBlock Begin","")
    Do ParentElement.AddPart(atom)

    If $$$UPPER(..language)="PYTHON" {
        ;$$$DEBUGNew("")
        Set subElement.type="PythonBody"
        Set pyparser=##class(PXW.DEV.BNF.Run.Python).%New()
        Set pyparser.stream=..stream
        Do pyparser.skipWhiteSpaceAndComments()
        If pyparser.peek(1)="}" {
            ; its empty 
            Set ..whitespace=pyparser.whitespace
            Set ..comment=pyparser.comment
            Set atom=..newAtom("CosCodeBlock Empty","")
            Do ParentElement.AddPart(atom)
            Quit 1
        }
        If pyparser.File(subElement) {
             $$$BNFCOMMIT(subElement,ParentElement)
            Set ..whitespace=pyparser.whitespace
            Set ..comment=pyparser.comment
            Set atom=..newAtom("CosCodeBlock End","")
            Do ParentElement.AddPart(atom)
		    Quit 1
        } Else {
            Do ..recover(ParentElement,.subElement,"{}","") ; NOT WORKING AS EXPECTED!
            ;;$$$BNFROLLBACK(subElement)
            ;Quit 1
        }
    }

    If $$$UPPER(..language)="MVBASIC" {
        ; NOT CODED YET
            Do ..recover(ParentElement,.subElement,"{}","") ; NOT WORKING AS EXPECTED!
            Quit 1
    }

	Set parser=##class(PXW.DEV.BNF.Run.COS).%New()
	Set parser.stream=..stream
    Do parser.skipWhiteSpaceAndComments()
    ;$$$DEBUG("COS CODE BLOCK peeked "_parser.peek(1))
	If parser.peek(1)="}" {
		; its empty 
		Set ..whitespace=parser.whitespace
		Set ..comment=parser.comment
		Set atom=..newAtom("CosCodeBlock Empty","")
		Do ParentElement.AddPart(atom)
		Quit 1
	}

    ; the only example of a call I have seen looked like an expression and not what was documented
    ; 
	If (..codemode="expression") || (..codemode="call") {
        $$$DEBUG("COS language EXPRESSION")
        If parser.Expression(subElement) {
            ; maybe its codemode=expression (need to check specifically)
            $$$BNFCOMMIT(subElement,ParentElement)
            Set ..whitespace=parser.whitespace
            Set ..comment=parser.comment
            Set atom=..newAtom("CosCodeBlock End","")
            Do ParentElement.AddPart(atom)
		    Quit 1
        } Else {
            $$$BNFROLLBACK(subElement)
            Quit 0
        }
    } Else {
        $$$DEBUG("COS language normal")
        If parser.CosCodeBlock(subElement) {
            $$$BNFCOMMIT(subElement,ParentElement)
            Set ..whitespace=parser.whitespace
            Set ..comment=parser.comment
            Set atom=..newAtom("CosCodeBlock End","")
            Do ParentElement.AddPart(atom)
            Quit 1
        } Else {
            $$$BNFROLLBACK(subElement)
            Quit 0
        }
	}
}

Method CosCodeBlockSql(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean [ ProcedureBlock = 1 ]
{
	#dim atom as PXW.DEV.Atom
	;$$$BNFPATH
	$$$BNFSTART(subElement)
    Set atom=..newAtom("CosCodeBlock Begin","")
    Do ParentElement.AddPart(atom)

	Set parser=##class(PXW.DEV.BNF.Run.COS).%New()
 	Set parser.stream=..stream
    Do parser.skipWhiteSpaceAndComments()
    ;$$$DEBUG("COS CODE BLOCK peeked "_parser.peek(1))
	If parser.peek(1)="}" {
		; its empty 
		Set ..whitespace=parser.whitespace
		Set ..comment=parser.comment
		Set atom=..newAtom("CosCodeBlock Empty","")
		Do ParentElement.AddPart(atom)
		Quit 1
	}
    
	If ..codemode="expression" {
        $$$DEBUG("COS language EXPRESSION")
        If parser.Expression(subElement) {
            ; maybe its codemode=expression (need to check specifically)
            $$$BNFCOMMIT(subElement,ParentElement)
            Set ..whitespace=parser.whitespace
            Set ..comment=parser.comment
            Set atom=..newAtom("CosCodeBlock End","")
            Do ParentElement.AddPart(atom)
		    Quit 1
        } Else {
            $$$BNFROLLBACK(subElement)
            Quit 0
        }
    } Else {
        $$$DEBUG("COS language normal")
        If parser.CosCodeBlockSql(subElement) {
            $$$BNFCOMMIT(subElement,ParentElement)
            Set ..whitespace=parser.whitespace
            Set ..comment=parser.comment
            Set atom=..newAtom("CosCodeBlock End","")
            Do ParentElement.AddPart(atom)
            Quit 1
        } Else {
            $$$BNFROLLBACK(subElement)
            Quit 0
        }
	}
}

Method CosCodeBlockSqlStorage(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean [ ProcedureBlock = 1 ]
{
	#dim atom as PXW.DEV.Atom
	;$$$BNFPATH
	$$$BNFSTART(subElement)
    Set atom=..newAtom("CosCodeBlock Begin","")
    Do ParentElement.AddPart(atom)

	Set parser=##class(PXW.DEV.BNF.Run.COS).%New()
 	Set parser.stream=..stream
    Do parser.skipWhiteSpaceAndComments()
    ;$$$DEBUG("COS CODE BLOCK peeked "_parser.peek(1))
	If parser.peek(1)="}" {
		; its empty 
		Set ..whitespace=parser.whitespace
		Set ..comment=parser.comment
		Set atom=..newAtom("CosCodeBlock Empty","")
		Do ParentElement.AddPart(atom)
		Quit 1
	}
    
	If ..codemode="expression" {
        $$$DEBUG("COS language EXPRESSION")
        If parser.Expression(subElement) {
            ; maybe its codemode=expression (need to check specifically)
            $$$BNFCOMMIT(subElement,ParentElement)
            Set ..whitespace=parser.whitespace
            Set ..comment=parser.comment
            Set atom=..newAtom("CosCodeBlock End","")
            Do ParentElement.AddPart(atom)
		    Quit 1
        } Else {
            $$$BNFROLLBACK(subElement)
            Quit 0
        }
    } Else {
        $$$DEBUG("COS language normal")
        If parser.CosCodeBlockSqlStorage(subElement) {
            $$$BNFCOMMIT(subElement,ParentElement)
            Set ..whitespace=parser.whitespace
            Set ..comment=parser.comment
            Set atom=..newAtom("CosCodeBlock End","")
            Do ParentElement.AddPart(atom)
            Quit 1
        } Else {
            $$$BNFROLLBACK(subElement)
            Quit 0
        }
	}
}

Method CosCodeBlockTrigger(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean [ ProcedureBlock = 1 ]
{
	#dim atom as PXW.DEV.Atom
	;$$$BNFPATH
	$$$BNFSTART(subElement)
    Set atom=..newAtom("CosCodeBlockTrigger Begin","")
    Do ParentElement.AddPart(atom)
 	Set parser=##class(PXW.DEV.BNF.Run.COS).%New()
	Set parser.stream=..stream
    Do parser.skipWhiteSpaceAndComments()
    ;$$$DEBUG("COS CODE BLOCK peeked "_parser.peek(1))
	If parser.peek(1)="}" {
		; its empty 
		Set ..whitespace=parser.whitespace
		Set ..comment=parser.comment
		Set atom=..newAtom("CosCodeBlockTrigger Empty","")
		Do ParentElement.AddPart(atom)
		Quit 1
	}
    
	If ..codemode="expression" {
        $$$DEBUG("COS language EXPRESSION")
        If parser.Expression(subElement) {
            ; maybe its codemode=expression (need to check specifically)
            $$$BNFCOMMIT(subElement,ParentElement)
            Set ..whitespace=parser.whitespace
            Set ..comment=parser.comment
            Set atom=..newAtom("CosCodeBlockTigger End","")
            Do ParentElement.AddPart(atom)
		    Quit 1
        } Else {
            $$$BNFROLLBACK(subElement)
            Quit 0
        }
    } Else {
        $$$DEBUG("COS language normal")
        If parser.CosCodeBlockTrigger(subElement) {
            $$$BNFCOMMIT(subElement,ParentElement)
            Set ..whitespace=parser.whitespace
            Set ..comment=parser.comment
            Set atom=..newAtom("CosCodeBlockTrigger End","")
            Do ParentElement.AddPart(atom)
            Quit 1
        } Else {
            $$$BNFROLLBACK(subElement)
            Quit 0
        }
	}
}

Method JavascriptCodeBlock(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean [ ProcedureBlock = 1 ]
{
 	#dim atom as PXW.DEV.Atom
 	;$$$BNFPATH
	$$$BNFSTART(subElement)
    Set atom=..newAtom("JavascriptCodeBlock Begin","")
    Do ParentElement.AddPart(atom)

	Set parser=##class(PXW.DEV.BNF.Run.JS).%New()
    Set parser.codeMode="ClientMethod"
	Set parser.stream=..stream
    Do parser.skipWhiteSpaceAndComments()
    ;$$$DEBUG("COS CODE BLOCK peeked "_parser.peek(1))
	If parser.peek(1)="}" {
		; its empty 
		Set ..whitespace=parser.whitespace
		Set ..comment=parser.comment
		Set atom=..newAtom("JavascriptCodeBlock Empty","")
		Do ParentElement.AddPart(atom)
		Set retok=1
	} Else {
        $$$DEBUG("Javascript language normal")
       If parser.StatementListMandatory(subElement) {
            $$$BNFCOMMIT(subElement,ParentElement)
            Set ..whitespace=parser.whitespace
            Set ..comment=parser.comment
            Set atom=..newAtom("JavascriptCodeBlock End","")
            Do ParentElement.AddPart(atom)
            Set retok=1
        } Else {
 
            Do ..recover(ParentElement,.recElement,"{}","")
            Set retok=1
        }
    }
    Quit retok
}

Method Expression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
	#dim atom as PXW.DEV.Atom
	;$$$BNFPATH
 	$$$BNFSTART(subElement)
    Set ok=0
    
    ;s atom=..newAtom("Expression Begin","")
    ; d subElement.AddPart(atom)

    Set parser=##class(PXW.DEV.BNF.Run.COS).%New()
    Set parser.stream=..stream
    ;d parser.skipWhiteSpaceAndComments()
    Do:..needsWScheck ..skipWhiteSpaceAndComments()
    If parser.peek(1)="}" {
        ; its empty 
        ;s ..whitespace=parser.whitespace
        ;s ..comment=parser.comment
        ;s atom=..newAtom("CosCodeBlock Empty","")
        ;d ParentElement.AddPart(atom)

        Set ok=1
    } ElseIf parser.Expression(subElement) {
        Set ok=1
    } 
    If ok=1 {
		Set ..whitespace=parser.whitespace
		Set ..comment=parser.comment
		Set atom=..newAtom("CosCodeBlock End","")
		Do subElement.AddPart(atom)
		$$$BNFCOMMIT(subElement,ParentElement)
	} Else {
		$$$BNFROLLBACK(subElement)
	}
    Quit ok
}

Method CosExpressionSql(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
    $$$DEBUGMethodBegin
	#dim atom as PXW.DEV.Atom
	;$$$BNFPATH
 	$$$BNFSTART(subElement)
    Set ok=0
    
    ;s atom=..newAtom("Expression Begin","")
    ; d subElement.AddPart(atom)

    Set parser=##class(PXW.DEV.BNF.Run.COS).%New()
    Set parser.stream=..stream
    Set parser.codemode="COSSQL"
    ;d parser.skipWhiteSpaceAndComments()
    Do:..needsWScheck ..skipWhiteSpaceAndComments()
    If parser.peek(1)="}" {
        ; its empty 
        ;s ..whitespace=parser.whitespace
        ;s ..comment=parser.comment
        ;s atom=..newAtom("CosCodeBlock Empty","")
        ;d ParentElement.AddPart(atom)

        Set ok=1
    } ElseIf parser.Expression(subElement) {
        Set ok=1
    } 
    If ok=1 {
		Set ..whitespace=parser.whitespace
		Set ..comment=parser.comment
		Set atom=..newAtom("CosCodeBlock End","")
		Do subElement.AddPart(atom)
		$$$BNFCOMMIT(subElement,ParentElement)
	} Else {
		$$$BNFROLLBACK(subElement)
	}
    $$$DEBUGMethodEnd
    Quit ok
}

Method XdataText(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
    ; is this really XML or JSON?
    ; the recovery in json means that we need to do the check twice and since this is overridden anyway its simple to plug in here
    If ..isPunctuationInList($LISTBUILD("<","{","["),1)'=0 Quit 0
    If ..peek(1)="}" Quit 1 ; lets count empty block as text

    $$$DEBUGMethodBegin
    $$$BNFSTART(subElement)
    Do:..needsWScheck ..skipWhiteSpaceAndComments()

    Set ok=0,n="",curly=0
    While ('..eof()) && ((curly>0)||(..peek(1)'="}")) {
        If ..peek(1)="{" {
            Set curly=curly+1
        }
        If ..peek(1)="}" {
            Set curly=curly-1
        }
        Set n=n_..next()
        Set ok=1
    }

    If ..mimetype="application/sql" {
        Set parser=##class(PXW.DEV.BNF.Run.SQL).%New()
	    Set parser.stream=##class(PXW.DEV.InputStream).NewString(n)
        Set parser.stream.line=..stream.line
        Set parser.whitespace=..whitespace
        Set parser.comment=..comment
        Set sqlElement=..newElement("XdataSql")
       	If parser.QuerySpecification(sqlElement) {
            $$$BNFCOMMIT(sqlElement,subElement)
        } 
        Set ..whitespace=parser.whitespace
        Set ..comment=parser.comment
        ;d sqlElement.write()
    } Else {
        Set o=..newAtom(subElement.type,n)
        Do subElement.AddPart(o)
    }
    $$$BNFCOMMIT(subElement,ParentElement)
    $$$DEBUGMethodEnd
    Quit ok
}

/***************************************************************************************
 IDENTIFIERS
***************************************************************************************/
Method AliasIdentifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
    $$$DEBUGMethodBegin
    Do:..needsWScheck ..skipWhiteSpaceAndComments()

    Set ch50=..stream.PeekToEol()
    Set done=1
    Set pos=1
    If $EXTRACT(ch50,pos)="""" {
        Set pos=pos+1
        While $EXTRACT(ch50,pos)'="""" {
            Set pos=pos+1
        }
        Set pos=pos+1 ; final " is all part of the alias
        Set done=1
    } Else {
        ; An alias can be anything including space!
        ; Keep going until we reach a comma or close curly
        ;If $EXTRACT(ch50,pos)="%" Set pos=pos+1
        ;If $EXTRACT(ch50,pos)?1A Set pos=pos+1
        ;
        ;If pos>1 {
        ;    While ($EXTRACT(ch50,pos)?1AN) || ($EXTRACT(ch50,pos)=".") ||($EXTRACT(ch50,pos)="_")  {
        ;        Set pos=pos+1
        ;    }
        ;    Set done=1
        ;}
        while $EXTRACT(ch50,pos)'="", $EXTRACT(ch50,pos)'=",", $EXTRACT(ch50,pos)'="}" {
            s pos=pos+1
        }
        set done=1
    }
    If done {
        Set atom=..newAtom(ParentElement.type,..nextNotEOL(pos-1))
        Do ParentElement.AddPart(atom)
    }
    $$$DEBUGMethodEnd
    Quit done
}

Method ClassIdentifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
    $$$DEBUGMethodBegin
    Do:..needsWScheck ..skipWhiteSpaceAndComments()

    Set ch50=..stream.PeekToEol()
    Set pos=1
    If $EXTRACT(ch50,pos)="%" Set pos=pos+1
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

Method ClientIdentifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
    $$$DEBUGMethodBegin
 
    Do:..needsWScheck ..skipWhiteSpaceAndComments()

    Set ch50=..stream.PeekToEol()
    Set pos=1

    If $EXTRACT(ch50,pos)="%" Set pos=pos+1
    If $EXTRACT(ch50,pos)="%" Set pos=pos+1 ;EG %%OID
    If $EXTRACT(ch50,pos)="_" Set pos=pos+1
    If $EXTRACT(ch50,pos)?1A Set pos=pos+1
    
    If pos>1 {
        While ($EXTRACT(ch50,pos)?1AN) || ($EXTRACT(ch50,pos)=".") || ($EXTRACT(ch50,pos)="_")  {
            Set pos=pos+1
        }
        Set atom=..newAtom(ParentElement.type,..nextNotEOL(pos-1))
        Do ParentElement.AddPart(atom)
        Set ok=1
    }Else {
        Set ok=0
    }
    $$$DEBUGMethodEnd
    Quit ok
}

Method Filename(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
    $$$DEBUGMethodBegin
    Do:..needsWScheck ..skipWhiteSpaceAndComments()

    Set ch50=..stream.PeekToEol()
    Set pos=1
    While ($EXTRACT(ch50,pos)?1AN) || ($EXTRACT(ch50,pos)=".") || ($EXTRACT(ch50,pos)="/") {
        Set pos=pos+1
    }
 
    Set atom=..newAtom("FileName",..nextNotEOL(pos-1))
    Do ParentElement.AddPart(atom)

    $$$DEBUGMethodEnd

    Quit 1
}

/// Very general purpose should there be a different identifier method
/// for each thing that is an identifier?
Method Identifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
    $$$DEBUGMethodBegin
 
    Do:..needsWScheck ..skipWhiteSpaceAndComments()

    Set ch50=..stream.PeekToEol()
    Set pos=1

    If $EXTRACT(ch50,pos)="%" Set pos=pos+1
    If $EXTRACT(ch50,pos)="%" Set pos=pos+1 ; EG %%OID
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

Method VariableIdentifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
    $$$DEBUGMethodBegin
 
    Do:..needsWScheck ..skipWhiteSpaceAndComments()

    Set ch50=..stream.PeekToEol()
    Set pos=1

    If $EXTRACT(ch50,pos)="%" Set pos=pos+1
    If $EXTRACT(ch50,pos)="%" Set pos=pos+1 ; EG %%OID
    If $EXTRACT(ch50,pos)?1A Set pos=pos+1
    
    If pos>1 {
        While ($EXTRACT(ch50,pos)?1AN) {
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

Method XmlIdentifier(ParentElement As PXW.DEV.BNF.Element, Output subElement As PXW.DEV.BNF.Element) As %Boolean
{
    $$$DEBUGMethodBegin
 
    Do:..needsWScheck ..skipWhiteSpaceAndComments()

    Set ch50=..stream.PeekToEol()
    Set pos=1

    If $EXTRACT(ch50,pos)="_" Set pos=pos+1
    If $EXTRACT(ch50,pos)?1A Set pos=pos+1
    
    If pos>1 {
        While ($EXTRACT(ch50,pos)?1AN) || ($EXTRACT(ch50,pos)="-") || ($EXTRACT(ch50,pos)="_")  || ($EXTRACT(ch50,pos)=".") {
            Set pos=pos+1
        }
 
        Set atom=..newAtom("XmlIdentifier",..nextNotEOL(pos-1))
        Do ParentElement.AddPart(atom)
        Set ok=1
    } Else {
        Set ok=0
    }
    $$$DEBUGMethodEnd
    Quit ok
}

Method SqlFieldName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
    $$$DEBUGMethodBegin
    Do:..needsWScheck ..skipWhiteSpaceAndComments()
    Set ch50=..stream.PeekToEol()
    Set pos=1
    If $EXTRACT(ch50,pos)="""" {
        Set pos=pos+1
        While $EXTRACT(ch50,pos)'="""" {
            Set pos=pos+1
        }
        Set pos=pos+1 ; last ", both sets of quotes end up being in the name, should we split those off?
        Set ok=1
    } Else {
        If $EXTRACT(ch50,pos)="%" Set pos=pos+1
        If $EXTRACT(ch50,pos)="%" Set pos=pos+1 ; EG %%OID
        If $EXTRACT(ch50,pos)="_" Set pos=pos+1
        If $EXTRACT(ch50,pos)?1A Set pos=pos+1
        
        If pos>1 {
            While ($EXTRACT(ch50,pos)?1AN) || ($EXTRACT(ch50,pos)="_")  {
                Set pos=pos+1
            }
            Set ok=1
        } Else {
            Set ok=0
        }
    }
    If ok {
        Set atom=..newAtom("SqlFieldName",..nextNotEOL(pos-1))
        Do ParentElement.AddPart(atom)
    }
    $$$DEBUGMethodEnd
    Quit ok
}

Method SqlTableName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{

    $$$DEBUGMethodBegin
    Do:..needsWScheck ..skipWhiteSpaceAndComments()
    Set ch50=..stream.PeekToEol()
    Set pos=1
    If $EXTRACT(ch50,pos)="""" {
        Set pos=pos+1
        While $EXTRACT(ch50,pos)'="""" {
            Set pos=pos+1
        }
        Set pos=pos+1 ; last ", both sets of quotes end up being in the name, should we split those off?
        Set ok=1
    } Else {
        If $EXTRACT(ch50,pos)="%" Set pos=pos+1
        If $EXTRACT(ch50,pos)="%" Set pos=pos+1 ; EG %%OID
        If $EXTRACT(ch50,pos)="_" Set pos=pos+1
        If $EXTRACT(ch50,pos)?1A Set pos=pos+1
        
        If pos>1 {
            While ($EXTRACT(ch50,pos)?1AN) || ($EXTRACT(ch50,pos)="_")  {
                Set pos=pos+1
            }
            Set ok=1
        } Else {
            Set ok=0
        }
    }
    If ok {
        Set atom=..newAtom("SqlTableName",..nextNotEOL(pos-1))
        Do ParentElement.AddPart(atom)
    }
    $$$DEBUGMethodEnd
    Quit ok
}

/***************************************************************************************
 Numbers and strings
***************************************************************************************/
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
    Set ch=..peek(1)
    If (ch="""") || (ch="'") {
        Set ok=0
        $$$BNFSTART(subElement)
        ; consume the quotes
        Set q1=..nextNotEOL(1)
        Set ch50=..stream.PeekToEoF() ; strings can be multi line
        Set pos=1
        Set instring=1
        While $EXTRACT(ch50,pos)'="" && instring {
            Set ch=$EXTRACT(ch50,pos),ch2=$EXTRACT(ch50,pos+1)
            ; embedded quotes or end of string?
            If ch=q1 {
                If ch2=q1 {
                    Set pos=pos+2 ; both sets of quotes
                } Else {
                    Set instring=0
                }
            } Else {
                Set pos=pos+1
            }
        }
        Set o=..newAtom("String",..next(pos-1))
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

/***************************************************************************************
 Things that cannot be properly defined in BNF
***************************************************************************************/
Method XdataJsonArrayItems(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
    ; if empty array just quit (OK)
    If ..isStringSingle("]") Quit 1

	Set ok=##super(ParentElement,.subElement)
    Quit ok
}

Method ClassItemIdentifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
	Set ok=##super(ParentElement,.subElement)
    If ok {
        Set atom=subElement.FirstAtom()
        If $PIECE(atom.type,":",1)="String" Set atom.type="ClassItemIdentifier"
    }
    Quit ok
}

Method TextInCurly(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
    $$$DEBUGMethodBegin
    $$$BNFSTART(subElement)
    Do:..needsWScheck ..skipWhiteSpaceAndComments()
    
    Set ok=1,n=""
    While ('..eof()) && (..peek(1)'="}") {
        Set n=n_..next()
    }
    Set o=..newAtom(subElement.type,n)
    Do subElement.AddPart(o)
    $$$BNFCOMMIT(subElement,ParentElement)
    $$$DEBUGMethodEnd
    Quit ok
}

Method XmlContent(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
    $$$DEBUGMethodBegin
    $$$BNFSTART(subElement)
    Do:..needsWScheck ..skipWhiteSpaceAndComments()
    
    Set ch500=..stream.PeekToEoF()
    Set pos=1
    While ($EXTRACT(ch500,pos)'="") && ($EXTRACT(ch500,pos)'="<") {
        Set pos=pos+1
    }
    If pos>1 {
        Set o=..newAtom(subElement.type,..next(pos-1))
        Do subElement.AddPart(o)
        $$$BNFCOMMIT(subElement,ParentElement)
        Set ok=1
    } Else {
        Set ok=0
    }
    $$$DEBUGMethodEnd
    Quit ok
}

Method XmlCdataText(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
    $$$DEBUGMethodBegin
    $$$BNFSTART(subElement)
    
    Set ch500=..stream.PeekToEoF()
    Set pos=1    
    Set ok=1
    While ($EXTRACT(ch500,pos)'="") && ($EXTRACT(ch500,pos,pos+2)'="]]>") {
        Set pos=pos+1
    }
 
    Set o=..newAtom(subElement.type,..next(pos-1))
    Do subElement.AddPart(o)
   
    $$$BNFCOMMIT(subElement,ParentElement)
    $$$DEBUGMethodEnd
    Quit ok
}

/***************************************************************************************
 Things that alter the state of the parser as we go
***************************************************************************************/
Method ClassLanguageName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
	Set ok=##super(ParentElement,.subElement)
    If ok=1 {
        Set ..language=subElement.ToString(0)
    }
    Quit ok
}

Method AttributeCodemodetype(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
	Set ok=##super(ParentElement,.subElement)
    If ok=1 {
        Set ..codemode=subElement.ToString(0)
    }
    Quit ok
}

Method AttributeMimetype(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
	Set ok=##super(ParentElement,.subElement)
    If ok=1 {
        Set ..mimetype=$PIECE(subElement.ToString(0),"=",2,*)
    }
    Quit ok
}

Method ClassXdata(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
	Set ..mimetype=""
    Set ok=##super(ParentElement,.subElement)
    
    Quit ok
}

Method XmlData(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
	Set oldmode=..commentMode
    Set ..commentMode="XML"
    Set ok=##super(ParentElement,.subElement)
    Set ..commentMode=oldmode
    Quit ok
}

}
