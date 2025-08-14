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

/// class_member_section ::= '{' class_member_list? '}'
///  summary=S&?&S
///  type=group
///  not=0
Method ClassMemberSection(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
	If ..isStringSingle("{",.value)=0 Quit 0
	$$$DEBUGMethodBegin
	$$$BNFPATH
	;;$$$DEBUG("%path="_%path)
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

/// one_classMember ::= class_class_method
/// | class_ForeignKey
/// | class_index
/// | class_method
/// | class_property
/// | class_parameter
/// | class_projection
/// | class_query
/// | class_relationship
/// | class_storage
/// | class_trigger
/// | class_view
/// | class_xdata
/// | class_client_method
///  summary=F|F|F|F|F|F|F|F|F|F|F|F|F|F
///  type=group
///  not=0
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

/// xdata_json ::= xdata_json_object | xdata_json_array | xdata_json_prim
///  summary=F|F|F
///  type=group
///  not=0
Method XdataJson(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
    Set ok=##super(ParentElement,.subElement)
   
    If ok=0 {
        Set ok=..recover(ParentElement,.recSub,"{}","")
    }

    Quit ok
}

/// xdata_json_array_items ::= xdata_json (',' xdata_json)*
///  summary=F&(S&F)
///  type=group
///  not=0
Method XdataJsonArrayItems(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
    ; if empty array just quit (OK)
    If ..isStringSingle("]") Quit 1

	Set ok=##super(ParentElement,.subElement)
    Quit ok
}

/// class_language_name ::= 'cache' | 'basic' |  'javascript' | 'java' | 'mvbasic' | 'tsql' | 'cpp'
///  summary=S|S|S|S|S|S|S
///  type=group
///  not=0
Method ClassLanguageName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
	Set ok=##super(ParentElement,.subElement)
    If ok=1 {
        Set ..language=subElement.ToString(0)
    }
    Quit ok
}

/// attribute_CodeModeType ::= 'call' | 'code' | 'expression' | 'objectgenerator' | 'generator'
///  summary=S|S|S|S|S
///  type=group
///  not=0
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

/// cos_code_block ::= 'NEEDS COS CODE BLOCK'
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

/// cos_code_block ::= 'NEEDS COS SQL CODE BLOCK'
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

/// cos_code_block ::= 'NEEDS COS SQL CODE BLOCK'
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

/// cos_code_block ::= 'NEEDS COS CODE BLOCK'
Method JavascriptCodeBlock(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean [ ProcedureBlock = 1 ]
{
 	#dim atom as PXW.DEV.Atom
 	;$$$BNFPATH
	$$$BNFSTART(subElement)
    Set atom=..newAtom("JavascriptCodeBlock Begin","")
    Do ParentElement.AddPart(atom)

	Set parser=##class(PXW.DEV.BNF.Run.JS).%New()
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

/// expression ::= 'NEEDS EXPRESSION'
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

/// filename ::= 'NEEDS FILE NAME'
///  summary=S
///  type=group
///  not=0
Method Filename(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
    Do:..needsWScheck ..skipWhiteSpaceAndComments()

    Set value=""
    Set ch=..peek(1)
    While (ch?1A) || (ch?1N) || (ch=".") || (ch="/") {
        Set value=value_..next()
        Set ch=..peek(1)
    }
 
    Set atom=..newAtom("FileName",value)
    Do ParentElement.AddPart(atom)
    ;$$$DEBUG("checking identifier, ok=1")
    ;zw atom
    Quit 1
}

/// identifier ::= 'regexp:(((\%[a-zA-Z0-9])|(\$[a-zA-Z])|[a-zA-Z])[a-zA-Z0-9\.]*)'
Method Identifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
    $$$BNFPATH
	;;$$$DEBUG("%path="_%path)

    Do:..needsWScheck ..skipWhiteSpaceAndComments()

    Set value=""
    If ..peek(1)="%" Set value=..next()
    If ..peek(1)="%" Set value=..next() ; EG %%OID
    ; not a letter (or number)
    Set ch=..peek(1)
    ; no % so must start with a letter
    If value="",ch?1A Set value=..next()
    
    If value="" {
        $$$DEBUG("checking identifier, ok=0")
        Quit 0
    }
    Set ch=..peek(1)
    While (ch?1A) || (ch?1N) || (ch=".")  {
        Set value=value_..next()
        Set ch=..peek(1)
    }
 
    Set atom=..newAtom(ParentElement.type,value)
    Do ParentElement.AddPart(atom)
    $$$DEBUG("checking identifier, ok=1")
    Quit 1
}

/// class_item_identifier ::= string | identifier
///  summary=F|F
///  type=group
///  not=0
Method ClassItemIdentifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
	Set ok=##super(ParentElement,.subElement)
    If ok {
        Set atom=subElement.FirstAtom()
        If $PIECE(atom.type,":",1)="String" Set atom.type="ClassItemIdentifier"
    }
    Quit ok
}

/// identifier ::= 'regexp:(((\%[a-zA-Z0-9])|(\$[a-zA-Z])|[a-zA-Z])[a-zA-Z0-9\.]*)'
Method ClientIdentifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
    $$$BNFPATH
	;;$$$DEBUG("%path="_%path)

    ;d ..skipWhiteSpaceAndComments()
    Do:..needsWScheck ..skipWhiteSpaceAndComments()

    Set value=""
    If ..peek(1)="%" Set value=..next()
    If ..peek(1)="%" Set value=..next() ; EG %%OID
    If ..peek(1)="_" Set value=..next()
    ; not a letter (or number)
    Set ch=..peek(1)
    ; no % so must start with a letter
    If value="",ch?1A Set value=..next()
    
    If value="" {
        $$$DEBUG("checking identifier, ok=0")
        Quit 0
    }
    Set ch=..peek(1)
    While (ch?1A) || (ch?1N) || (ch=".") || (ch="_") {
        Set value=value_..next()
        Set ch=..peek(1)
    }
 
    Set atom=..newAtom("ClientIdentifier",value)
    Do ParentElement.AddPart(atom)
    $$$DEBUG("checking identifier, ok=1")
    Quit 1
}

/// identifier ::= 'regexp:(((\%[a-zA-Z0-9])|(\$[a-zA-Z])|[a-zA-Z])[a-zA-Z0-9\.]*)'
Method XmlIdentifier(ParentElement As PXW.DEV.BNF.Element, Output subElement As PXW.DEV.BNF.Element) As %Boolean
{
    $$$BNFPATH
	;;$$$DEBUG("%path="_%path)

    ;d ..skipWhiteSpaceAndComments()
    Do:..needsWScheck ..skipWhiteSpaceAndComments()

    Set value=""
    If ..peek(1)="_" Set value=..next()
    ; not a letter (or number)
    Set ch=..peek(1)
    ; no % so must start with a letter
    If value="",ch?1A Set value=..next()
    
    If value="" {
        $$$DEBUG("checking identifier, ok=0")
        Quit 0
    }
    Set ch=..peek(1)
    While (ch?1A) || (ch?1N) || (ch="-") || (ch="_") || (ch=".")  {
        Set value=value_..next()
        Set ch=..peek(1)
    }
 
    Set atom=..newAtom("XmlIdentifier",value)
    Do ParentElement.AddPart(atom)
    ;$$$DEBUG("checking identifier, ok=1")
    ;zw atom
    Quit 1
}

Method SqlFieldName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
    $$$BNFPATH
	;;$$$DEBUG("%path="_%path)

    Do:..needsWScheck ..skipWhiteSpaceAndComments()
    If ..peek(1)="""" {
        Set value=""      
        Set value=value_..next()
        While ..peek(1)'="""" {
            Set value=value_..next()
        }
        Set value=value_..next()
        Set atom=..newAtom("SqlFieldName",value)
        Do ParentElement.AddPart(atom)
    } Else {

        Set value=""
        If ..peek(1)="%" Set value=..next()
        If ..peek(1)="%" Set value=..next() ; EG %%OID
        If ..peek(1)="_" Set value=..next()
        ; not a letter (or number)
        Set ch=..peek(1)
        ; no % so must start with a letter
        If value="",ch?1A Set value=..next()
        
        If value="" {
            $$$DEBUG("checking identifier, ok=0")
            Quit 0
        }
        Set ch=..peek(1)
        While (ch?1A) || (ch?1N) || (ch="_")  {
            Set value=value_..next()
            Set ch=..peek(1)
        }
    
        Set atom=..newAtom("SqlFieldName",value)
        Do ParentElement.AddPart(atom)
        $$$DEBUG("checking identifier, ok=1")
    }
    Quit 1
}

Method SqlTableName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
    ;$$$BNFPATH
	;;$$$DEBUG("%path="_%path)

    Do:..needsWScheck ..skipWhiteSpaceAndComments()
    If ..peek(1)="""" {
        Set value=""
        Set value=value_..next()
        While ..peek(1)'="""" {
            Set value=value_..next()
        }
        Set value=value_..next()
        Set atom=..newAtom("SqlTableName",value)
        Do ParentElement.AddPart(atom)
    } Else {
        Set value=""
        If ..peek(1)="%" Set value=..next()
        If ..peek(1)="%" Set value=..next() ; EG %%OID
        If ..peek(1)="_" Set value=..next()
        ; not a letter (or number)
        Set ch=..peek(1)
        ; no % so must start with a letter
        If value="",ch?1A Set value=..next()
        
        If value="" {
            $$$DEBUG("checking identifier, ok=0")
            Quit 0
        }
        Set ch=..peek(1)
        While (ch?1A) || (ch?1N) || (ch="_")  {
            Set value=value_..next()
            Set ch=..peek(1)
        }
    
        Set atom=..newAtom("SqlTableName",value)
        Do ParentElement.AddPart(atom)
    }
    Quit 1
}

Method AliasIdentifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
    Do:..needsWScheck ..skipWhiteSpaceAndComments()

    Set value=""
    Set done=1
    If ..peek(1)="""" {
        Set value=value_..next(1)
        While ..peek(1)'="""" {
            Set value=value_..next(1)
        }
        Set value=value_..next(1)
        Set done=1
    } Else {

        If ..peek(1)="%" Set value=..next()
        ; not a letter (or number)
        Set ch=..peek(1)
        ; no % so must start with a letter
        If value="",ch?1A Set value=..next()
        
        If value'="" {
            Set ch=..peek(1)
            While (ch?1A) || (ch?1N) || (ch=".") ||(ch="_")  {
                Set value=value_..next()
                ;zw value,..stream.pos
                Set ch=..peek(1)
            }
            Set done=1
        }
    }
    If done {
        Set atom=..newAtom(ParentElement.type,value)
        Do ParentElement.AddPart(atom)
    }
    Quit done
}

/// identifier ::= 'regexp:(((\%[a-zA-Z0-9])|(\$[a-zA-Z])|[a-zA-Z])[a-zA-Z0-9\.]*)'
Method ClassIdentifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
    ;$$$BNFPATH
	;;$$$DEBUG("%path="_%path)

    Do:..needsWScheck ..skipWhiteSpaceAndComments()

    Set value=""
    If ..peek(1)="%" Set value=..next()
    ; not a letter (or number)
    Set ch=..peek(1)
    ; no % so must start with a letter
    If value="",ch?1A Set value=..next()
    
    If value="" {
        $$$DEBUG("checking identifier, ok=0")
        Quit 0
    }
    Set ch=..peek(1)
    While (ch?1A) || (ch?1N) || (ch=".")  {
        Set value=value_..next()
		;zw value,..stream.pos
        Set ch=..peek(1)
    }
 
    Set atom=..newAtom(ParentElement.type,value)
    Do ParentElement.AddPart(atom)

    Quit 1
}

/// identifier ::= 'regexp:(((\%[a-zA-Z0-9])|(\$[a-zA-Z])|[a-zA-Z])[a-zA-Z0-9\.]*)'
Method VariableIdentifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
    $$$DEBUGMethodBegin
    ;$$$BNFPATH
	;;$$$DEBUG("%path="_%path)

    Do:..needsWScheck ..skipWhiteSpaceAndComments()

    Set value=""
    If ..peek(1)="%" Set value=..next()
    ; not a letter (or number)
    Set ch=..peek(1)
    ; no % so must start with a letter
    If value="",ch?1A Set value=..next()
    
    Set ok=1
    If value="" {
        ;$$$DEBUG("checking identifier, ok=0")
        Set ok=0
    }
    If ok {
        Set ch=..peek(1)
        While (ch?1A) || (ch?1N)   {
            Set value=value_..next()
            Set ch=..peek(1)
        }
    
        Set atom=..newAtom(ParentElement.type,value)
        Do ParentElement.AddPart(atom)
    }
    $$$DEBUGMethodEnd
    Quit ok
}

Method Number(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	;$$$DEBUG("%path="_%path)
	$$$BNFSTART(subElement)
	Set done=0

    Do:..needsWScheck ..skipWhiteSpaceAndComments()

    Set n=""
    ; -
    While (..peek(1)="-") || (..peek(1)="+") {
        Set n=n_..next()
    }

    ; -123
    While (..peek(1)?1N) {
        Set n=n_..next()
    }

    ; start with a .
    If ..peek(2)?1"."1N {
        Set n=n_..next(2)
    }
    
    If n'="" {

        ; -123.456
        While (..peek(1)?1N) {
            Set n=n_..next()
        }

        ; -123.456E
        If (..peek(1)="E") || (..peek(1)="e") {
            Set n=n_..next()
            ; 123.456E-
            If ..peek(1)="-"{
                Set n=n_..next()
            }

            ; -123.456E-789
            While (..peek(1)?1N) {
                Set n=n_..next()
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

Method String(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
    $$$DEBUGMethodBegin
     Do:..needsWScheck ..skipWhiteSpaceAndComments()
   
	;$$$BNFPATH
	;;$$$DEBUG("%path="_%path)
    Set ok=1
    Set openquote=..peek(1)
    If openquote'="""",openquote'="'" {
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
            ; I am not sure how these get encoded so sticking with COS "" for quotes in quotes
            If ch=openquote {
                If ch2=openquote {
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

Method JsonString(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
    $$$DEBUGMethodBegin
     Do:..needsWScheck ..skipWhiteSpaceAndComments()
   
	;$$$BNFPATH
	;;$$$DEBUG("%path="_%path)
    Set ok=1
    Set openquote=..peek(1)
    If openquote'="""" {
        Set ok=0
    }

    If ok {
        $$$BNFSTART(subElement)

        Set n=..next()
        Set instring=1
        While '..eof() && instring {
            Set chs=..peek(2)
            Set ch=$EXTRACT(chs,1),ch2=$EXTRACT(chs,1,2)
            ; embedded quotes or end of string?
            ; I am not sure how these get encoded so sticking with COS "" for quotes in quotes
            If ch2="\""" {
                Set n=n_..next()_..next()
                Continue
            }
            If ch="""" {
                Set instring=0
                Set n=n_..next()
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

/// class_query_body ::= text_brace_block
///  summary=F
///  type=group
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

/// xml_content ::= text
///  summary=F
///  type=group
Method XmlContent(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
    $$$DEBUGMethodBegin
    $$$BNFSTART(subElement)
    Do:..needsWScheck ..skipWhiteSpaceAndComments()
    
    Set ok=0,n=""
    While ('..eof()) && (..peek(1)'="<") {
        Set n=n_..next()
        Set ok=1
    }
    Set o=..newAtom(subElement.type,n)
    Do subElement.AddPart(o)
    $$$BNFCOMMIT(subElement,ParentElement)
    $$$DEBUGMethodEnd
    Quit ok
}

// xml_content ::= text

///  summary=F
///  type=group
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

/// class_xdata ::= 'xdata' xdata_name [ '[' (xdata_attributes)* ']' ] '{' (xdata_text | xdata_xml | xdata_json )   /* ([xml_xml] [xml_data] [xdata_json] */ '}'
///  summary=S&F&[S&(F)*&S]&S&(F|F|F)&S
///  type=group
///  not=0
Method ClassXdata(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
	Set ..mimetype=""
    Set ok=##super(ParentElement,.subElement)
    
    Quit ok
}

Method XmlCdataText(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
    $$$DEBUGMethodBegin
    $$$BNFSTART(subElement)
    
    Set ok=1,n=""
    While ('..eof()) && (..peek(3)'="]]>") {
        Set n=n_..next()
        Set ok=1
    }
 
    Set o=..newAtom(subElement.type,n)
    Do subElement.AddPart(o)
   
    $$$BNFCOMMIT(subElement,ParentElement)
    $$$DEBUGMethodEnd
    Quit ok
}

/// xml_data ::= xml_tag_s_a xml_tag_ns_name (xml_attribute)* xml_tag_s_b ( (xml_data)* | xml_content ) xml_tag_e_a xml_tag_ns_name xml_tag_e_b
///  summary=F&F&(F)&F&((F)|F)&F&F&F
///  type=group
Method XmlData(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
	Set oldmode=..commentMode
    Set ..commentMode="XML"
    Set ok=##super(ParentElement,.subElement)
    Set ..commentMode=oldmode
    Quit ok
}

Method TextInCurly(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
    $$$DEBUGMethodBegin
    $$$BNFSTART(subElement)
    Do:..needsWScheck ..skipWhiteSpaceAndComments()
    
	;$$$BNFPATH
	;;$$$DEBUG("%path="_%path)
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

Method skipComments(ch10 As %String) As %Boolean
{
    If ..commentMode="XML" {
        If $EXTRACT(ch10,1,4)="<!--" Set ..comment=..readXMLBlockComment() Quit 1
    } Else {
        If $EXTRACT(ch10,1,3)="///" Set ..comment=..readLineComment("///") Quit 1
        If $EXTRACT(ch10,1,2)="//" Set ..comment=..readLineComment("//") Quit 1
        If $EXTRACT(ch10,1,2)="/*" Set ..comment=..readBlockComment() Quit 1
    }
    Quit 0
}

}
