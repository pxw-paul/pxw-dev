/// Created: 2024-09-25 19:34:22 PXW.DEV.BNF.Compilers.Compiler1
Class PXW.DEV.BNF.GEN.ClassDefinition Extends PXW.DEV.BNF.super [ ProcedureBlock ]
{

Parameter KeywordPattern = "1.A.(1""/"".A)";

Parameter Keywords = "ABSTRACT,ACCESSTYPE,ACCESSVAR,AFTER,ALIASES,ALPHAUP,ARRAY,AS,ATTRIBUTE,AVERAGEFIELDSIZE,BASIC,BEFORE,BIGINT,BINARY,BINARYSTREAM,BIT,BITMAP,BITSLICE,BLOCKCOUNT,BOOLEAN,BYREF,BYVAL,CACHE,CALCULATED,CALL,CARDINALITY,CASCADE,CHARACTERSTREAM,CHILDREN,CLASS,CLASSMETHOD,CLASSTYPE,CLIENTDATATYPE,CLIENTMETHOD,CLIENTNAME,CODE,CODEMODE,COLLATEDKEY,COMPILEAFTER,CONDITION,CONSTRAINT,COSEXPRESSION,COUNTERLOCATION,CPP,CURRENCY,DATA,DATAACCESS,DATALOCATION,DATATYPE,DATE,DDLALLOWED,DECIMAL,DEFAULTDATA,DELETE,DELIMITED,DELIMITER,DEPENDSON,DEPRECATED,DESCRIPTION,DOCUMENT,DONOTUSE,DOUBLE,DYNAMIC,E,EMBEDDEDCLASS,ENCODED,ENUM,ENUMEDIT,EVENT,EXACT,EXPRESSION,EXTENDS,EXTENT,EXTENTLOCATION,EXTENTSIZE,EXTERNALPROCNAME,FALSE,FDATE,FIELD,FINAL,FLAGS,FMDATE,FMTIMESTAMP,FORCEGENERATE,FOREACH,FOREIGNKEY,FTIMESTAMP,GENERATEAFTER,GENERATEDBY,GENERATOR,GLOBAL,GUID,HANDLE,HIDDEN,HISTOGRAM,IDENTITY,IDFUNCTION,IDKEY,IDLOCATION,IMPORT,INCLUDE,INCLUDEGENERATOR,INDEX,INDEXLOCATION,INHERITANCE,INITIALEXPRESSION,INSERT,INSERT/DELETE,INSERT/UPDATE,INSERT/UPDATE/DELETE,INTEGER,INTERNAL,INVALIDCONDITION,INVERSE,JAVA,JAVASCRIPT,KEY,LANGUAGE,LEFT,LEGACYINSTANCECONTEXT,LIST,LITERAL,LOCATION,LONGVARBINARY,LONGVARCHAR,LOOPINITVALUE,MANY,MEMBERSUPER,METHOD,MIMETYPE,MINUS,MULTIDIMENSIONAL,MVBASIC,MVDATE,MVR,NAME,NEWTABLE,NEXTCODE,NOACTION,NOCHECK,NOCONTEXT,NODE,NOEXTENT,NOT,NOTINHERITABLE,NULL,NUMERIC,OBJECTGENERATOR,OBJECTSCRIPT,ODBCTYPE,OF,OLDTABLE,ON,ONDELETE,ONE,ONUPDATE,ORDER,OUTLIERSELECTIVITY,OUTPUT,OWNER,PARAMETER,PARENT,PERSISTENT,PIECE,PLACEAFTER,PLUS,POPULATIONTYPE,POSIXTIME,POSIXTS,PRIMARYKEY,PRIVATE,PROCEDUREBLOCK,PROJECTION,PROPERTY,PROPERTYCLASS,PUBLICLIST,PYTHON,QUERY,RCP,READONLY,REFERENCES,RELATIONSHIP,REQUIRED,RESULTSET,RETRIEVALCODE,RETURNRESULTSETS,RIGHT,ROW,ROW/OBJECT,ROWIDSPEC,SCHEMASPEC,SELECTIVITY,SEQUENCE,SERIAL,SERVERONLY,SETDEFAULT,SETNULL,SMALLINT,SOAPACTION,SOAPBINDINGSTYLE,SOAPBODYUSE,SOAPMESSAGENAME,SOAPNAMESPACE,SOAPREQUESTMESSAGE,SOAPTYPENAMESPACE,SPACE,SQLCATEGORY,SQLCOLUMNNUMBER,SQLCOMPUTECODE,SQLCOMPUTED,SQLCOMPUTEONCHANGE,SQLFIELDNAME,SQLLISTDELIMITER,SQLLISTTYPE,SQLMAP,SQLNAME,SQLPROC,SQLROWIDNAME,SQLROWIDPRIVATE,SQLSTRING,SQLTABLENAME,SQLUPPER,SQLVIEW,SQLVIEWNAME,STATE,STATEMENT,STATUS,STORAGE,STORAGESTRATEGY,STREAM,STREAMLOCATION,STRING,STRUCT,STRUCTURE,SUBNODE,SUBSCRIPT,SYSTEM,TIME,TIMESTAMP,TINYINT,TRANSIENT,TRIGGER,TRUE,TRUNCATE,TSQL,TYPE,UNIQUE,UPDATE,UPDATE/DELETE,UPDATECOLUMNLIST,UPPER,VALUE,VARBINARY,VARCHAR,VARIABLE,VIEW,VIEWQUERY,WEBMETHOD,XDATA,XMLNAMESPACE,ZENMETHOD";

///  alias_identifier ::= 'NEED ALIAS IDENT'
/// summary values:NEED ALIAS IDENT
Method AliasIdentifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("NEED ALIAS IDENT",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"NEED ALIAS IDENT")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  as_type_class_reference ::= 'as' type_class_reference
/// summary values:AS
Method AsTypeClassReference(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("AS"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"AS")  {
		if ..TypeClassReference(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_Abstract ::= 'abstract'
/// summary values:ABSTRACT
Method AttributeAbstract(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeywordInList($lb("ABSTRACT"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"ABSTRACT")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_Aliases ::= 'aliases' '=' '{' attribute_AliasList '}'
/// summary values:ALIASES
Method AttributeAliases(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&P&?1Rule?&P
	; first rule summary K
	if '(..isKeywordInList($lb("ALIASES"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"ALIASES")  {
		if ..addPunctuation(subElement,"=")  {
			if ..addPunctuation(subElement,"{")  {
				if ..AttributeAliaslist(subElement,.addedElement)  {
					if ..addPunctuation(subElement,"}")  {
						set done=1 ; end compileRules
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_AliasList ::= attribute_OneAlias ( ',' attribute_OneAlias )*
Method AttributeAliaslist(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..AttributeOnealias(subElement,.addedElement)  {
		if ..AttributeAliaslist122RepZero(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  ( ',' attribute_OneAlias )*
Method AttributeAliaslist122RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..AttributeAliaslist123Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' attribute_OneAlias
/// summary values:,
Method AttributeAliaslist123Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..AttributeOnealias(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_Calculated ::= 'calculated'
/// summary values:CALCULATED
Method AttributeCalculated(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeywordInList($lb("CALCULATED"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"CALCULATED")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_Cardinality ::= 'cardinality' '=' attribute_Cardinality_type
/// summary values:CARDINALITY
Method AttributeCardinality(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("CARDINALITY"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"CARDINALITY")  {
		if ..addPunctuation(subElement,"=")  {
			if ..AttributeCardinalityType(subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_Cardinality_type ::= 'one' | 'many' | 'parent' | 'children'
/// summary values:ONE,MANY,PARENT,CHILDREN
Method AttributeCardinalityType(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K|K|K
	if '(..isKeywordInList($lb("ONE","MANY","PARENT","CHILDREN"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"ONE")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"MANY")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"PARENT")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"CHILDREN")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_ClassType ::= 'classtype' '=' class_type_name
/// summary values:CLASSTYPE
Method AttributeClasstype(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("CLASSTYPE"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"CLASSTYPE")  {
		if ..addPunctuation(subElement,"=")  {
			if ..ClassTypeName(subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_ClientDataType ::= 'clientdatatype' '=' client_data_type_name
/// summary values:CLIENTDATATYPE
Method AttributeClientdatatype(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("CLIENTDATATYPE"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"CLIENTDATATYPE")  {
		if ..addPunctuation(subElement,"=")  {
			if ..ClientDataTypeName(subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_ClientName ::= 'clientname' '=' attribute_ClientName_value
/// summary values:CLIENTNAME
Method AttributeClientname(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("CLIENTNAME"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"CLIENTNAME")  {
		if ..addPunctuation(subElement,"=")  {
			if ..AttributeClientnameValue(subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_ClientName_value ::= client_identifier
Method AttributeClientnameValue(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ClientIdentifier(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_CodeMode ::= 'codemode' '=' attribute_CodeModeType
/// summary values:CODEMODE
Method AttributeCodemode(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("CODEMODE"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"CODEMODE")  {
		if ..addPunctuation(subElement,"=")  {
			if ..AttributeCodemodetype(subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_CodeModeType ::= 'call' | 'code' | 'expression' | 'objectgenerator' | 'generator'
/// summary values:CALL,CODE,EXPRESSION,OBJECTGENERATOR,GENERATOR
Method AttributeCodemodetype(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K|K|K|K
	if '(..isKeywordInList($lb("CALL","CODE","EXPRESSION","OBJECTGENERATOR","GENERATOR"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"CALL")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"CODE")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"EXPRESSION")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"OBJECTGENERATOR")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"GENERATOR")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_CompileAfter ::= 'compileafter' '=' [class_reference_list | class_reference]
/// summary values:COMPILEAFTER
Method AttributeCompileafter(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?4?
	; first rule summary K
	if '(..isKeywordInList($lb("COMPILEAFTER"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"COMPILEAFTER")  {
		if ..addPunctuation(subElement,"=")  {
			if ..AttributeCompileafter125OptGrp(subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method AttributeCompileafter125OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ClassReferenceList(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ClassReference(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=1 /* failure rollsback but returns OK */
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_Condition ::= 'condition' '=' '{' expression '}'
/// summary values:CONDITION
Method AttributeCondition(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&P&?1Rule?&P
	; first rule summary K
	if '(..isKeywordInList($lb("CONDITION"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"CONDITION")  {
		if ..addPunctuation(subElement,"=")  {
			if ..addPunctuation(subElement,"{")  {
				if ..Expression(subElement,.addedElement)  {
					if ..addPunctuation(subElement,"}")  {
						set done=1 ; end compileRules
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_Constraint ::= 'constraint' '=' (number | string | identifier)
/// summary values:CONSTRAINT
Method AttributeConstraint(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("CONSTRAINT"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"CONSTRAINT")  {
		if ..addPunctuation(subElement,"=")  {
			if ..AttributeConstraint124Sub(subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// number | string | identifier
Method AttributeConstraint124Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Number(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..String(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Identifier(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_Data ::= 'data' '=' ( one_data_attribute_value | ( '(' one_data_attribute_value ( ',' one_data_attribute_value )* ')' ) )
/// summary values:DATA
Method AttributeData(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("DATA"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"DATA")  {
		if ..addPunctuation(subElement,"=")  {
			if ..AttributeData126Sub(subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  one_data_attribute_value | ( '(' one_data_attribute_value ( ',' one_data_attribute_value )* ')' )
Method AttributeData126Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OneDataAttributeValue(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeData127Sub(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  '(' one_data_attribute_value ( ',' one_data_attribute_value )* ')'
/// summary values:(
Method AttributeData127Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&(?4?)*&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"(")  {
		if ..OneDataAttributeValue(subElement,.addedElement)  {
			if ..AttributeData128RepZero(subElement,.addedElement)  {
				if ..addPunctuation(subElement,")")  {
					set done=1 ; end compileRules
				}
			}
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  ( ',' one_data_attribute_value )*
Method AttributeData128RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..AttributeData129Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' one_data_attribute_value
/// summary values:,
Method AttributeData129Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..OneDataAttributeValue(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_DDLAllowed ::= 'ddlallowed'
/// summary values:DDLALLOWED
Method AttributeDdlallowed(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeywordInList($lb("DDLALLOWED"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"DDLALLOWED")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_DependsOn ::= 'dependson' '=' ( class_reference_list | class_reference )
/// summary values:DEPENDSON
Method AttributeDependson(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("DEPENDSON"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"DEPENDSON")  {
		if ..addPunctuation(subElement,"=")  {
			if ..AttributeDependson131Sub(subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  class_reference_list | class_reference
Method AttributeDependson131Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ClassReferenceList(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ClassReference(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_Deprecated ::= 'deprecated'
/// summary values:DEPRECATED
Method AttributeDeprecated(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeywordInList($lb("DEPRECATED"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"DEPRECATED")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_EmbeddedClass ::= 'EmbeddedClass' '=' class_reference
/// summary values:EMBEDDEDCLASS
Method AttributeEmbeddedclass(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("EMBEDDEDCLASS"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"EMBEDDEDCLASS")  {
		if ..addPunctuation(subElement,"=")  {
			if ..ClassReference(subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_Event ::= 'event' '=' event_keyword
/// summary values:EVENT
Method AttributeEvent(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("EVENT"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"EVENT")  {
		if ..addPunctuation(subElement,"=")  {
			if ..EventKeyword(subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_Extent ::= 'extent'
/// summary values:EXTENT
Method AttributeExtent(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeywordInList($lb("EXTENT"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"EXTENT")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_ExternalProcName ::= 'externalprocname' '=' text
/// summary values:EXTERNALPROCNAME
Method AttributeExternalprocname(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("EXTERNALPROCNAME"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"EXTERNALPROCNAME")  {
		if ..addPunctuation(subElement,"=")  {
			if ..Text(subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_Final ::= 'final'
/// summary values:FINAL
Method AttributeFinal(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeywordInList($lb("FINAL"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"FINAL")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_Flags ::= 'flags' '=' ( 'enumedit' | 'enum' | 'list' )
/// summary values:FLAGS
Method AttributeFlags(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("FLAGS"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"FLAGS")  {
		if ..addPunctuation(subElement,"=")  {
			if ..AttributeFlags132Sub(subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  'enumedit' | 'enum' | 'list'
/// summary values:ENUMEDIT,ENUM,LIST
Method AttributeFlags132Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K|K
	if '(..isKeywordInList($lb("ENUMEDIT","ENUM","LIST"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	s subElement=ParentElement
	if ..addKeyword(subElement,"ENUMEDIT")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"ENUM")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"LIST")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  attribute_ForceGenerate ::= 'forcegenerate'
/// summary values:FORCEGENERATE
Method AttributeForcegenerate(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeywordInList($lb("FORCEGENERATE"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"FORCEGENERATE")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_ForEach ::= 'foreach' '=' foreach_type
/// summary values:FOREACH
Method AttributeForeach(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("FOREACH"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"FOREACH")  {
		if ..addPunctuation(subElement,"=")  {
			if ..ForeachType(subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_GenerateAfter ::= 'generateafter' '=' ( method_reference | ( '(' method_reference ( ',' method_reference )* ')' ) )
/// summary values:GENERATEAFTER
Method AttributeGenerateafter(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("GENERATEAFTER"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"GENERATEAFTER")  {
		if ..addPunctuation(subElement,"=")  {
			if ..AttributeGenerateafter133Sub(subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  method_reference | ( '(' method_reference ( ',' method_reference )* ')' )
Method AttributeGenerateafter133Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..MethodReference(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeGenerateafter134Sub(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  '(' method_reference ( ',' method_reference )* ')'
/// summary values:(
Method AttributeGenerateafter134Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&(?4?)*&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"(")  {
		if ..MethodReference(subElement,.addedElement)  {
			if ..AttributeGenerateafter135RepZero(subElement,.addedElement)  {
				if ..addPunctuation(subElement,")")  {
					set done=1 ; end compileRules
				}
			}
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  ( ',' method_reference )*
Method AttributeGenerateafter135RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..AttributeGenerateafter136Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' method_reference
/// summary values:,
Method AttributeGenerateafter136Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..MethodReference(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_GeneratedBy ::= 'generatedby' '=' (class_reference | string | filename)
/// summary values:GENERATEDBY
Method AttributeGeneratedby(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("GENERATEDBY"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"GENERATEDBY")  {
		if ..addPunctuation(subElement,"=")  {
			if ..AttributeGeneratedby137Sub(subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// class_reference | string | filename
Method AttributeGeneratedby137Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ClassReference(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..String(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Filename(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_Hidden ::= 'hidden'
/// summary values:HIDDEN
Method AttributeHidden(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeywordInList($lb("HIDDEN"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"HIDDEN")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_Identity ::= 'identity'
/// summary values:IDENTITY
Method AttributeIdentity(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeywordInList($lb("IDENTITY"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"IDENTITY")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_IdKey ::= 'idkey'
/// summary values:IDKEY
Method AttributeIdkey(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeywordInList($lb("IDKEY"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"IDKEY")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_Inheritance ::= 'inheritance' '=' inheritance_direction
/// summary values:INHERITANCE
Method AttributeInheritance(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("INHERITANCE"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"INHERITANCE")  {
		if ..addPunctuation(subElement,"=")  {
			if ..InheritanceDirection(subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_InitialExpression ::= 'initialexpression' '=' initialexpression_value
/// summary values:INITIALEXPRESSION
Method AttributeInitialexpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("INITIALEXPRESSION"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"INITIALEXPRESSION")  {
		if ..addPunctuation(subElement,"=")  {
			if ..InitialexpressionValue(subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_Internal ::= 'internal'
/// summary values:INTERNAL
Method AttributeInternal(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeywordInList($lb("INTERNAL"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"INTERNAL")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_Inverse ::= 'inverse' '=' identifier
/// summary values:INVERSE
Method AttributeInverse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("INVERSE"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"INVERSE")  {
		if ..addPunctuation(subElement,"=")  {
			if ..Identifier(subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_Language ::= 'language' '=' class_language_name
/// summary values:LANGUAGE
Method AttributeLanguage(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("LANGUAGE"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"LANGUAGE")  {
		if ..addPunctuation(subElement,"=")  {
			if ..ClassLanguageName(subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_LegacyInstanceContext ::= 'legacyinstancecontext'
/// summary values:LEGACYINSTANCECONTEXT
Method AttributeLegacyinstancecontext(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeywordInList($lb("LEGACYINSTANCECONTEXT"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"LEGACYINSTANCECONTEXT")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_MemberSuper ::= 'MemberSuper' '=' ( ( '(' class_reference ( ',' class_reference )*')' ) | class_reference )
/// summary values:MEMBERSUPER
Method AttributeMembersuper(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("MEMBERSUPER"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"MEMBERSUPER")  {
		if ..addPunctuation(subElement,"=")  {
			if ..AttributeMembersuper138Sub(subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  ( '(' class_reference ( ',' class_reference )*')' ) | class_reference
Method AttributeMembersuper138Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..AttributeMembersuper139Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ClassReference(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  '(' class_reference ( ',' class_reference )*')'
/// summary values:(
Method AttributeMembersuper139Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&(?4?)*&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"(")  {
		if ..ClassReference(subElement,.addedElement)  {
			if ..AttributeMembersuper140RepZero(subElement,.addedElement)  {
				if ..addPunctuation(subElement,")")  {
					set done=1 ; end compileRules
				}
			}
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  ( ',' class_reference )*
Method AttributeMembersuper140RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..AttributeMembersuper141Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' class_reference
/// summary values:,
Method AttributeMembersuper141Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..ClassReference(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_MimeType ::= 'mimetype' '=' identifier ('/' identifier)*
/// summary values:MIMETYPE
Method AttributeMimetype(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?&(?4?)*
	; first rule summary K
	if '(..isKeywordInList($lb("MIMETYPE"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"MIMETYPE")  {
		if ..addPunctuation(subElement,"=")  {
			if ..Identifier(subElement,.addedElement)  {
				if ..AttributeMimetype142RepZero(subElement,.addedElement)  {
					set done=1 ; end compileRules
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  ('/' identifier)*
Method AttributeMimetype142RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..AttributeMimetype143Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

/// '/' identifier
/// summary values:/
Method AttributeMimetype143Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle("/",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"/")  {
		if ..Identifier(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_MultiDimensional ::= 'multidimensional'
/// summary values:MULTIDIMENSIONAL
Method AttributeMultidimensional(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeywordInList($lb("MULTIDIMENSIONAL"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"MULTIDIMENSIONAL")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_NewTable ::= 'newtable' '=' tablename
/// summary values:NEWTABLE
Method AttributeNewtable(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("NEWTABLE"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"NEWTABLE")  {
		if ..addPunctuation(subElement,"=")  {
			if ..Tablename(subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_NoCheck ::= 'nocheck'
/// summary values:NOCHECK
Method AttributeNocheck(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeywordInList($lb("NOCHECK"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"NOCHECK")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_NoContext ::= 'nocontext'
/// summary values:NOCONTEXT
Method AttributeNocontext(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeywordInList($lb("NOCONTEXT"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"NOCONTEXT")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_NoExtent ::= 'noextent'
/// summary values:NOEXTENT
Method AttributeNoextent(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeywordInList($lb("NOEXTENT"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"NOEXTENT")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_Not ::= 'not' ( attribute_Abstract | attribute_DDLAllowed | attribute_Deprecated | attribute_Final | attribute_Hidden | attribute_Internal | attribute_LegacyInstanceContext | attribute_NoExtent | attribute_Private | attribute_ProcedureBlock | attribute_ReadOnly | attribute_Required | attribute_ServerOnly | attribute_SQLComputed | attribute_Transient | attribute_Unique )
/// summary values:NOT
Method AttributeNot(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("NOT"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"NOT")  {
		if ..AttributeNot29Sub(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_Abstract | attribute_DDLAllowed | attribute_Deprecated | attribute_Final | attribute_Hidden | attribute_Internal | attribute_LegacyInstanceContext | attribute_NoExtent | attribute_Private | attribute_ProcedureBlock | attribute_ReadOnly | attribute_Required | attribute_ServerOnly | attribute_SQLComputed | attribute_Transient | attribute_Unique
Method AttributeNot29Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..AttributeAbstract(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeDdlallowed(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeDeprecated(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeFinal(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeHidden(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeInternal(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeLegacyinstancecontext(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeNoextent(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributePrivate(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeProcedureblock(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeReadonly(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeRequired(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeServeronly(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeSqlcomputed(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeTransient(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeUnique(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_NotInheritable ::= 'notinheritable'
/// summary values:NOTINHERITABLE
Method AttributeNotinheritable(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeywordInList($lb("NOTINHERITABLE"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"NOTINHERITABLE")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_ODBCType ::= 'odbctype' '=' ( 'bigint' | 'bit' | 'date' | 'double' | 'integer' | 'longvarbinary' | 'longvarchar' | 'numeric' | 'resultset' | 'smallint' | 'struct' | 'time' | 'timestamp' | 'tinyint' | 'varbinary' | 'varchar' | 'guid' | 'POSIXTIME')
/// summary values:ODBCTYPE
Method AttributeOdbctype(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("ODBCTYPE"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"ODBCTYPE")  {
		if ..addPunctuation(subElement,"=")  {
			if ..AttributeOdbctype144Sub(subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  'bigint' | 'bit' | 'date' | 'double' | 'integer' | 'longvarbinary' | 'longvarchar' | 'numeric' | 'resultset' | 'smallint' | 'struct' | 'time' | 'timestamp' | 'tinyint' | 'varbinary' | 'varchar' | 'guid' | 'POSIXTIME'
/// summary values:BIGINT,BIT,DATE,DOUBLE,INTEGER,LONGVARBINARY,LONGVARCHAR,NUMERIC,RESULTSET,SMALLINT,STRUCT,TIME,TIMESTAMP,TINYINT,VARBINARY,VARCHAR,GUID,POSIXTIME
Method AttributeOdbctype144Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K
	if '(..isKeywordInList($lb("BIGINT","BIT","DATE","DOUBLE","INTEGER","LONGVARBINARY","LONGVARCHAR","NUMERIC","RESULTSET","SMALLINT","STRUCT","TIME","TIMESTAMP","TINYINT","VARBINARY","VARCHAR","GUID","POSIXTIME"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	s subElement=ParentElement
	if ..addKeyword(subElement,"BIGINT")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"BIT")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"DATE")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"DOUBLE")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"INTEGER")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"LONGVARBINARY")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"LONGVARCHAR")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"NUMERIC")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"RESULTSET")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"SMALLINT")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"STRUCT")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"TIME")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"TIMESTAMP")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"TINYINT")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"VARBINARY")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"VARCHAR")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"GUID")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"POSIXTIME")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  attribute_OldTable ::= 'oldtable' '=' tablename
/// summary values:OLDTABLE
Method AttributeOldtable(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("OLDTABLE"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"OLDTABLE")  {
		if ..addPunctuation(subElement,"=")  {
			if ..Tablename(subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_OnAction_type ::= 'cascade' | 'noaction' | 'setdefault' | 'setnull'
/// summary values:CASCADE,NOACTION,SETDEFAULT,SETNULL
Method AttributeOnactionType(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K|K|K
	if '(..isKeywordInList($lb("CASCADE","NOACTION","SETDEFAULT","SETNULL"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"CASCADE")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"NOACTION")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"SETDEFAULT")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"SETNULL")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_OnDelete ::= 'ondelete' '=' attribute_OnAction_type
/// summary values:ONDELETE
Method AttributeOndelete(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("ONDELETE"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"ONDELETE")  {
		if ..addPunctuation(subElement,"=")  {
			if ..AttributeOnactionType(subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_OneAlias ::= alias_identifier
Method AttributeOnealias(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..AliasIdentifier(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_OnUpdate ::= 'onupdate' '=' attribute_OnAction_type
/// summary values:ONUPDATE
Method AttributeOnupdate(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("ONUPDATE"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"ONUPDATE")  {
		if ..addPunctuation(subElement,"=")  {
			if ..AttributeOnactionType(subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_Order ::= 'order' '=' expression
/// summary values:ORDER
Method AttributeOrder(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("ORDER"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"ORDER")  {
		if ..addPunctuation(subElement,"=")  {
			if ..Expression(subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_Owner ::= 'owner' '=' ( string | number | '{' text_in_curly '}' )
/// summary values:OWNER
Method AttributeOwner(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("OWNER"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"OWNER")  {
		if ..addPunctuation(subElement,"=")  {
			if ..AttributeOwner145Sub(subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  string | number | '{' text_in_curly '}'
Method AttributeOwner145Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?|P&?1Rule?&P
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..String(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Number(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"{")  {
		if ..TextInCurly(subElement,.addedElement)  {
			if ..addPunctuation(subElement,"}")  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_PlaceAfter ::= 'placeafter' '=' method_reference ('(' ',' method_reference ')')*
/// summary values:PLACEAFTER
Method AttributePlaceafter(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?&(?4?)*
	; first rule summary K
	if '(..isKeywordInList($lb("PLACEAFTER"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"PLACEAFTER")  {
		if ..addPunctuation(subElement,"=")  {
			if ..MethodReference(subElement,.addedElement)  {
				if ..AttributePlaceafter146RepZero(subElement,.addedElement)  {
					set done=1 ; end compileRules
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  ('(' ',' method_reference ')')*
Method AttributePlaceafter146RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..AttributePlaceafter147Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

/// '(' ',' method_reference ')'
/// summary values:(
Method AttributePlaceafter147Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&P&?1Rule?&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"(")  {
		if ..addPunctuation(subElement,",")  {
			if ..MethodReference(subElement,.addedElement)  {
				if ..addPunctuation(subElement,")")  {
					set done=1 ; end compileRules
				}
			}
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_PrimaryKey ::= 'primarykey'
/// summary values:PRIMARYKEY
Method AttributePrimarykey(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeywordInList($lb("PRIMARYKEY"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"PRIMARYKEY")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_Private ::= 'private'
/// summary values:PRIVATE
Method AttributePrivate(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeywordInList($lb("PRIVATE"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"PRIVATE")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_ProcedureBlock ::= 'procedureblock' [ '=' ( '0' | '1' ) ]
/// summary values:PROCEDUREBLOCK
Method AttributeProcedureblock(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?4?
	; first rule summary K
	if '(..isKeywordInList($lb("PROCEDUREBLOCK"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"PROCEDUREBLOCK")  {
		if ..AttributeProcedureblock148OptGrp(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// 
/// summary values:=
Method AttributeProcedureblock148OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle("=",.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"=")  {
		if ..AttributeProcedureblock149Sub(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=1 /* failure rollsback but returns OK */
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  '0' | '1'
/// summary values:0,1
Method AttributeProcedureblock149Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|P
	if '(..isStringInList($lb("0","1"),1,.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	s subElement=ParentElement
	if ..addPunctuation(subElement,"0")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"1")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  attribute_PropertyClass ::= 'propertyclass' '=' class_reference ('(' ',' class_reference ')')*
/// summary values:PROPERTYCLASS
Method AttributePropertyclass(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?&(?4?)*
	; first rule summary K
	if '(..isKeywordInList($lb("PROPERTYCLASS"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"PROPERTYCLASS")  {
		if ..addPunctuation(subElement,"=")  {
			if ..ClassReference(subElement,.addedElement)  {
				if ..AttributePropertyclass150RepZero(subElement,.addedElement)  {
					set done=1 ; end compileRules
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  ('(' ',' class_reference ')')*
Method AttributePropertyclass150RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..AttributePropertyclass151Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

/// '(' ',' class_reference ')'
/// summary values:(
Method AttributePropertyclass151Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&P&?1Rule?&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"(")  {
		if ..addPunctuation(subElement,",")  {
			if ..ClassReference(subElement,.addedElement)  {
				if ..addPunctuation(subElement,")")  {
					set done=1 ; end compileRules
				}
			}
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_PublicList ::= 'publiclist' '=' ( ('(' identifier (',' identifier )* ')' ) | identifier)
/// summary values:PUBLICLIST
Method AttributePubliclist(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("PUBLICLIST"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"PUBLICLIST")  {
		if ..addPunctuation(subElement,"=")  {
			if ..AttributePubliclist152Sub(subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  ('(' identifier (',' identifier )* ')' ) | identifier
Method AttributePubliclist152Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..AttributePubliclist153Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Identifier(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// '(' identifier (',' identifier )* ')'
/// summary values:(
Method AttributePubliclist153Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&(?4?)*&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"(")  {
		if ..Identifier(subElement,.addedElement)  {
			if ..AttributePubliclist154RepZero(subElement,.addedElement)  {
				if ..addPunctuation(subElement,")")  {
					set done=1 ; end compileRules
				}
			}
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  (',' identifier )*
Method AttributePubliclist154RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..AttributePubliclist155Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

/// ',' identifier
/// summary values:,
Method AttributePubliclist155Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..Identifier(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_ReadOnly ::= 'readonly'
/// summary values:READONLY
Method AttributeReadonly(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeywordInList($lb("READONLY"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"READONLY")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_Required ::= 'required'
/// summary values:REQUIRED
Method AttributeRequired(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeywordInList($lb("REQUIRED"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"REQUIRED")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_ReturnResultSets ::= 'returnresultsets'
/// summary values:RETURNRESULTSETS
Method AttributeReturnresultsets(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeywordInList($lb("RETURNRESULTSETS"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"RETURNRESULTSETS")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_SchemaSpec ::= 'schemaspec' '=' string
/// summary values:SCHEMASPEC
Method AttributeSchemaspec(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("SCHEMASPEC"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"SCHEMASPEC")  {
		if ..addPunctuation(subElement,"=")  {
			if ..String(subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_ServerOnly ::= 'serveronly' '=' ( '0' | '1' )
/// summary values:SERVERONLY
Method AttributeServeronly(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("SERVERONLY"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"SERVERONLY")  {
		if ..addPunctuation(subElement,"=")  {
			if ..AttributeServeronly156Sub(subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  '0' | '1'
/// summary values:0,1
Method AttributeServeronly156Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|P
	if '(..isStringInList($lb("0","1"),1,.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	s subElement=ParentElement
	if ..addPunctuation(subElement,"0")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"1")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  attribute_SOAPAction ::= 'soapaction' '=' (identifier | string)
/// summary values:SOAPACTION
Method AttributeSoapaction(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("SOAPACTION"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"SOAPACTION")  {
		if ..addPunctuation(subElement,"=")  {
			if ..AttributeSoapaction157Sub(subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// identifier | string
Method AttributeSoapaction157Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Identifier(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..String(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_SOAPBindingStyle ::= 'SoapBindingStyle' '=' ( 'document' | 'rcp' )
/// summary values:SOAPBINDINGSTYLE
Method AttributeSoapbindingstyle(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("SOAPBINDINGSTYLE"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"SOAPBINDINGSTYLE")  {
		if ..addPunctuation(subElement,"=")  {
			if ..AttributeSoapbindingstyle158Sub(subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  'document' | 'rcp'
/// summary values:DOCUMENT,RCP
Method AttributeSoapbindingstyle158Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K
	if '(..isKeywordInList($lb("DOCUMENT","RCP"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	s subElement=ParentElement
	if ..addKeyword(subElement,"DOCUMENT")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"RCP")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  attribute_SOAPBodyuse ::= 'soapbodyuse' '=' ( 'literal' | 'encoded' )
/// summary values:SOAPBODYUSE
Method AttributeSoapbodyuse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("SOAPBODYUSE"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"SOAPBODYUSE")  {
		if ..addPunctuation(subElement,"=")  {
			if ..AttributeSoapbodyuse159Sub(subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  'literal' | 'encoded'
/// summary values:LITERAL,ENCODED
Method AttributeSoapbodyuse159Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K
	if '(..isKeywordInList($lb("LITERAL","ENCODED"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	s subElement=ParentElement
	if ..addKeyword(subElement,"LITERAL")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"ENCODED")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  attribute_SOAPMessageName ::= 'soapmessagename' '=' ( string | soap_identifier )
/// summary values:SOAPMESSAGENAME
Method AttributeSoapmessagename(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("SOAPMESSAGENAME"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"SOAPMESSAGENAME")  {
		if ..addPunctuation(subElement,"=")  {
			if ..AttributeSoapmessagename160Sub(subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  string | soap_identifier
Method AttributeSoapmessagename160Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..String(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SoapIdentifier(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_SOAPNameSpace ::= 'soapnamespace' '=' ( string | soap_identifier)
/// summary values:SOAPNAMESPACE
Method AttributeSoapnamespace(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("SOAPNAMESPACE"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"SOAPNAMESPACE")  {
		if ..addPunctuation(subElement,"=")  {
			if ..AttributeSoapnamespace161Sub(subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  string | soap_identifier
Method AttributeSoapnamespace161Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..String(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SoapIdentifier(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_SOAPRequestMessage ::= 'soaprequestmessage' '=' ( string | soap_identifier )
/// summary values:SOAPREQUESTMESSAGE
Method AttributeSoaprequestmessage(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("SOAPREQUESTMESSAGE"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"SOAPREQUESTMESSAGE")  {
		if ..addPunctuation(subElement,"=")  {
			if ..AttributeSoaprequestmessage162Sub(subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  string | soap_identifier
Method AttributeSoaprequestmessage162Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..String(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SoapIdentifier(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_SOAPTypeNamespace ::= 'soaptypenamespace' '=' ( string | soap_identifier )
/// summary values:SOAPTYPENAMESPACE
Method AttributeSoaptypenamespace(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("SOAPTYPENAMESPACE"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"SOAPTYPENAMESPACE")  {
		if ..addPunctuation(subElement,"=")  {
			if ..AttributeSoaptypenamespace163Sub(subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  string | soap_identifier
Method AttributeSoaptypenamespace163Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..String(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SoapIdentifier(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_SQLCategory ::= 'sqlcategory' '=' ( 'date' | 'double' | 'fmdate' | 'fmtimestamp' | 'integer' | 'mvdate' | 'name' | 'numeric' | 'string' | 'time' | 'timestamp' | 'POSIXTS' )
/// summary values:SQLCATEGORY
Method AttributeSqlcategory(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("SQLCATEGORY"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"SQLCATEGORY")  {
		if ..addPunctuation(subElement,"=")  {
			if ..AttributeSqlcategory164Sub(subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  'date' | 'double' | 'fmdate' | 'fmtimestamp' | 'integer' | 'mvdate' | 'name' | 'numeric' | 'string' | 'time' | 'timestamp' | 'POSIXTS'
/// summary values:DATE,DOUBLE,FMDATE,FMTIMESTAMP,INTEGER,MVDATE,NAME,NUMERIC,STRING,TIME,TIMESTAMP,POSIXTS
Method AttributeSqlcategory164Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K|K|K|K|K|K|K|K|K|K|K
	if '(..isKeywordInList($lb("DATE","DOUBLE","FMDATE","FMTIMESTAMP","INTEGER","MVDATE","NAME","NUMERIC","STRING","TIME","TIMESTAMP","POSIXTS"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	s subElement=ParentElement
	if ..addKeyword(subElement,"DATE")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"DOUBLE")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"FMDATE")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"FMTIMESTAMP")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"INTEGER")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"MVDATE")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"NAME")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"NUMERIC")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"STRING")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"TIME")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"TIMESTAMP")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"POSIXTS")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  attribute_SQLColumnNumber ::= 'SqlColumnNumber' '=' number
/// summary values:SQLCOLUMNNUMBER
Method AttributeSqlcolumnnumber(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("SQLCOLUMNNUMBER"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"SQLCOLUMNNUMBER")  {
		if ..addPunctuation(subElement,"=")  {
			if ..Number(subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_SQLComputeCode ::= 'sqlcomputecode' '=' '{' cos_code_block_sql '}'
/// summary values:SQLCOMPUTECODE
Method AttributeSqlcomputecode(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&P&?1Rule?&P
	; first rule summary K
	if '(..isKeywordInList($lb("SQLCOMPUTECODE"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"SQLCOMPUTECODE")  {
		if ..addPunctuation(subElement,"=")  {
			if ..addPunctuation(subElement,"{")  {
				if ..CosCodeBlockSql(subElement,.addedElement)  {
					if ..addPunctuation(subElement,"}")  {
						set done=1 ; end compileRules
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_SQLComputed ::= 'sqlcomputed'
/// summary values:SQLCOMPUTED
Method AttributeSqlcomputed(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeywordInList($lb("SQLCOMPUTED"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"SQLCOMPUTED")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_SQLComputeOnChange ::= 'sqlcomputeonchange' '=' property_reference | ('(' property_reference (',' property_reference )* ')')
/// summary values:SQLCOMPUTEONCHANGE
Method AttributeSqlcomputeonchange(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?|?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("SQLCOMPUTEONCHANGE"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"SQLCOMPUTEONCHANGE")  {
		if ..addPunctuation(subElement,"=")  {
			if ..PropertyReference(subElement,.addedElement)  {
				set done=1 ; or
			} elseif ..AttributeSqlcomputeonchange165Sub(subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// '(' property_reference (',' property_reference )* ')'
/// summary values:(
Method AttributeSqlcomputeonchange165Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&(?4?)*&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"(")  {
		if ..PropertyReference(subElement,.addedElement)  {
			if ..AttributeSqlcomputeonchange166RepZero(subElement,.addedElement)  {
				if ..addPunctuation(subElement,")")  {
					set done=1 ; end compileRules
				}
			}
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  (',' property_reference )*
Method AttributeSqlcomputeonchange166RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..AttributeSqlcomputeonchange167Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

/// ',' property_reference
/// summary values:,
Method AttributeSqlcomputeonchange167Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..PropertyReference(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_SQLFieldname ::= 'sqlfieldname' '=' sql_field_name
/// summary values:SQLFIELDNAME
Method AttributeSqlfieldname(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("SQLFIELDNAME"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"SQLFIELDNAME")  {
		if ..addPunctuation(subElement,"=")  {
			if ..SqlFieldName(subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_SQLListDelimiter ::= 'sqllistdelimiter' '=' expression
/// summary values:SQLLISTDELIMITER
Method AttributeSqllistdelimiter(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("SQLLISTDELIMITER"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"SQLLISTDELIMITER")  {
		if ..addPunctuation(subElement,"=")  {
			if ..Expression(subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_SQLListType ::= 'sqllisttype' '=' ( 'list' | 'delimited' | 'subnode' )
/// summary values:SQLLISTTYPE
Method AttributeSqllisttype(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("SQLLISTTYPE"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"SQLLISTTYPE")  {
		if ..addPunctuation(subElement,"=")  {
			if ..AttributeSqllisttype168Sub(subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  'list' | 'delimited' | 'subnode'
/// summary values:LIST,DELIMITED,SUBNODE
Method AttributeSqllisttype168Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K|K
	if '(..isKeywordInList($lb("LIST","DELIMITED","SUBNODE"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	s subElement=ParentElement
	if ..addKeyword(subElement,"LIST")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"DELIMITED")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"SUBNODE")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  attribute_SQLName ::= 'sqlname' '=' (sql_table_name | string )
/// summary values:SQLNAME
Method AttributeSqlname(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("SQLNAME"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"SQLNAME")  {
		if ..addPunctuation(subElement,"=")  {
			if ..AttributeSqlname169Sub(subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// sql_table_name | string
Method AttributeSqlname169Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SqlTableName(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..String(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_SQLProc ::= 'sqlproc'
/// summary values:SQLPROC
Method AttributeSqlproc(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeywordInList($lb("SQLPROC"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"SQLPROC")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_SQLRowidName ::= 'sqlrowidname' '=' ( '""' | string | sql_table_name )
/// summary values:SQLROWIDNAME
Method AttributeSqlrowidname(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("SQLROWIDNAME"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"SQLROWIDNAME")  {
		if ..addPunctuation(subElement,"=")  {
			if ..AttributeSqlrowidname170Sub(subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  '""' | string | sql_table_name
Method AttributeSqlrowidname170Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"""""")  {
		set done=1 ; or
	} elseif ..String(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlTableName(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_SQLRowidPrivate ::= 'sqlrowidprivate'
/// summary values:SQLROWIDPRIVATE
Method AttributeSqlrowidprivate(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeywordInList($lb("SQLROWIDPRIVATE"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"SQLROWIDPRIVATE")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_SQLTableName ::= 'sqltablename' '=' ( '""' | sql_table_name )
/// summary values:SQLTABLENAME
Method AttributeSqltablename(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("SQLTABLENAME"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"SQLTABLENAME")  {
		if ..addPunctuation(subElement,"=")  {
			if ..AttributeSqltablename171Sub(subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  '""' | sql_table_name
Method AttributeSqltablename171Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"""""")  {
		set done=1 ; or
	} elseif ..SqlTableName(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_SQLView ::= 'sqlview'
/// summary values:SQLVIEW
Method AttributeSqlview(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeywordInList($lb("SQLVIEW"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"SQLVIEW")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_SQLViewname ::= 'sqlviewname' '=' ( string | sql_table_name )
/// summary values:SQLVIEWNAME
Method AttributeSqlviewname(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("SQLVIEWNAME"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"SQLVIEWNAME")  {
		if ..addPunctuation(subElement,"=")  {
			if ..AttributeSqlviewname172Sub(subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  string | sql_table_name
Method AttributeSqlviewname172Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..String(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlTableName(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_StorageStrategy ::= 'storagestrategy' '=' ('""' | class_item_identifier)
/// summary values:STORAGESTRATEGY
Method AttributeStoragestrategy(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("STORAGESTRATEGY"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"STORAGESTRATEGY")  {
		if ..addPunctuation(subElement,"=")  {
			if ..AttributeStoragestrategy173Sub(subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// '""' | class_item_identifier
Method AttributeStoragestrategy173Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"""""")  {
		set done=1 ; or
	} elseif ..ClassItemIdentifier(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_System ::= 'system' '=' ( '0' | '1' | '2' | '3' | '4' )
/// summary values:SYSTEM
Method AttributeSystem(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("SYSTEM"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"SYSTEM")  {
		if ..addPunctuation(subElement,"=")  {
			if ..AttributeSystem174Sub(subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  '0' | '1' | '2' | '3' | '4'
/// summary values:0,1,2,3,4
Method AttributeSystem174Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|P|P|P|P
	if '(..isStringInList($lb("0","1","2","3","4"),1,.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	s subElement=ParentElement
	if ..addPunctuation(subElement,"0")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"1")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"2")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"3")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"4")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  attribute_Time ::= 'time' '=' time_value
/// summary values:TIME
Method AttributeTime(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("TIME"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"TIME")  {
		if ..addPunctuation(subElement,"=")  {
			if ..TimeValue(subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_Transient ::= 'transient'
/// summary values:TRANSIENT
Method AttributeTransient(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeywordInList($lb("TRANSIENT"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"TRANSIENT")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_Type ::= 'type' '=' ( 'bitmap' | 'bitslice' | 'index' |'key' | 'collatedkey' )
/// summary values:TYPE
Method AttributeType(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("TYPE"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"TYPE")  {
		if ..addPunctuation(subElement,"=")  {
			if ..AttributeType175Sub(subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  'bitmap' | 'bitslice' | 'index' |'key' | 'collatedkey'
/// summary values:BITMAP,BITSLICE,INDEX,KEY,COLLATEDKEY
Method AttributeType175Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K|K|K|K
	if '(..isKeywordInList($lb("BITMAP","BITSLICE","INDEX","KEY","COLLATEDKEY"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	s subElement=ParentElement
	if ..addKeyword(subElement,"BITMAP")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"BITSLICE")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"INDEX")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"KEY")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"COLLATEDKEY")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  attribute_Unique ::= 'unique'
/// summary values:UNIQUE
Method AttributeUnique(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeywordInList($lb("UNIQUE"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"UNIQUE")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_UpdateColumnList ::= 'updatecolumnlist' '=' ( one_column_name | ( '(' one_column_name ( ',' one_column_name )* ')' ) )
/// summary values:UPDATECOLUMNLIST
Method AttributeUpdatecolumnlist(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("UPDATECOLUMNLIST"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"UPDATECOLUMNLIST")  {
		if ..addPunctuation(subElement,"=")  {
			if ..AttributeUpdatecolumnlist176Sub(subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  one_column_name | ( '(' one_column_name ( ',' one_column_name )* ')' )
Method AttributeUpdatecolumnlist176Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OneColumnName(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeUpdatecolumnlist177Sub(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  '(' one_column_name ( ',' one_column_name )* ')'
/// summary values:(
Method AttributeUpdatecolumnlist177Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&(?4?)*&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"(")  {
		if ..OneColumnName(subElement,.addedElement)  {
			if ..AttributeUpdatecolumnlist178RepZero(subElement,.addedElement)  {
				if ..addPunctuation(subElement,")")  {
					set done=1 ; end compileRules
				}
			}
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  ( ',' one_column_name )*
Method AttributeUpdatecolumnlist178RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..AttributeUpdatecolumnlist179Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' one_column_name
/// summary values:,
Method AttributeUpdatecolumnlist179Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..OneColumnName(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_ViewQuery ::= 'viewquery' '=' '{' class_query_body '}'
/// summary values:VIEWQUERY
Method AttributeViewquery(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&P&?1Rule?&P
	; first rule summary K
	if '(..isKeywordInList($lb("VIEWQUERY"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"VIEWQUERY")  {
		if ..addPunctuation(subElement,"=")  {
			if ..addPunctuation(subElement,"{")  {
				if ..ClassQueryBody(subElement,.addedElement)  {
					if ..addPunctuation(subElement,"}")  {
						set done=1 ; end compileRules
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_WebMethod ::= 'webmethod'
/// summary values:WEBMETHOD
Method AttributeWebmethod(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeywordInList($lb("WEBMETHOD"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"WEBMETHOD")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_XMLNamespace ::= 'xmlnamespace' '=' (string | identifier)
/// summary values:XMLNAMESPACE
Method AttributeXmlnamespace(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("XMLNAMESPACE"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"XMLNAMESPACE")  {
		if ..addPunctuation(subElement,"=")  {
			if ..AttributeXmlnamespace180Sub(subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// string | identifier
Method AttributeXmlnamespace180Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..String(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Identifier(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attribute_ZenMethod ::= 'zenmethod'
/// summary values:ZENMETHOD
Method AttributeZenmethod(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeywordInList($lb("ZENMETHOD"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"ZENMETHOD")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  class_attribute ::= attribute_Abstract | attribute_ClassType | attribute_ClientDataType | attribute_ClientName | attribute_CompileAfter | attribute_DDLAllowed | attribute_DependsOn | attribute_Deprecated | attribute_Embeddedclass | attribute_Final | attribute_GeneratedBy | attribute_Hidden | attribute_Inheritance | attribute_Language | attribute_LegacyInstanceContext | attribute_MemberSuper | attribute_NoContext | attribute_NoExtent | attribute_Not | attribute_ODBCType | attribute_Owner | attribute_ProcedureBlock | attribute_PropertyClass | attribute_ServerOnly | attribute_SOAPBindingStyle | attribute_SOAPBodyuse | attribute_SQLCategory | attribute_SQLRowidName | attribute_SQLRowidPrivate | attribute_SQLTableName | attribute_StorageStrategy | attribute_System | attribute_ViewQuery
Method ClassAttribute(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..AttributeAbstract(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeClasstype(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeClientdatatype(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeClientname(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeCompileafter(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeDdlallowed(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeDependson(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeDeprecated(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeEmbeddedclass(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeFinal(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeGeneratedby(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeHidden(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeInheritance(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeLanguage(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeLegacyinstancecontext(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeMembersuper(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeNocontext(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeNoextent(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeNot(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeOdbctype(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeOwner(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeProcedureblock(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributePropertyclass(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeServeronly(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeSoapbindingstyle(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeSoapbodyuse(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeSqlcategory(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeSqlrowidname(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeSqlrowidprivate(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeSqltablename(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeStoragestrategy(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeSystem(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeViewquery(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  class_attribute_list ::= class_attribute ( ',' class_attribute )*
Method ClassAttributeList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ClassAttribute(subElement,.addedElement)  {
		if ..ClassAttributeList15RepZero(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  ( ',' class_attribute )*
Method ClassAttributeList15RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ClassAttributeList16Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' class_attribute
/// summary values:,
Method ClassAttributeList16Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..ClassAttribute(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  class_attributes ::= '[' class_attribute_list ']'
/// summary values:[
Method ClassAttributes(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&P
	; first rule summary P
	if '(..isStringSingle("[",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"[")  {
		if ..ClassAttributeList(subElement,.addedElement)  {
			if ..addPunctuation(subElement,"]")  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  class_class_method ::= 'classmethod' method_name '(' [ formal_spec_list ] ')' [ 'as' return_type_class_reference ] [ method_attribute_list ] '{' method_body '}'
/// summary values:CLASSMETHOD
Method ClassClassMethod(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?&P&?4?&P&?4?&?4?&P&?1Rule?&P
	; first rule summary K
	if '(..isKeywordInList($lb("CLASSMETHOD"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"CLASSMETHOD")  {
		if ..MethodName(subElement,.addedElement)  {
			if ..addPunctuation(subElement,"(")  {
				if $S(..FormalSpecList(subElement,.addedElement) :1,1:1) {
					if ..addPunctuation(subElement,")")  {
						if ..ClassClassMethod30OptGrp(subElement,.addedElement)  {
							if $S(..MethodAttributeList(subElement,.addedElement) :1,1:1) {
								if ..addPunctuation(subElement,"{")  {
									if ..MethodBody(subElement,.addedElement)  {
										if ..addPunctuation(subElement,"}")  {
											set done=1 ; end compileRules
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// 
/// summary values:AS
Method ClassClassMethod30OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("AS"),.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"AS")  {
		if ..ReturnTypeClassReference(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=1 /* failure rollsback but returns OK */
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  class_client_method ::= 'clientmethod' method_name '(' [ formal_spec_list ] ')' [ 'as' type_class_reference ] [ method_attribute_list ] '{' javascript_code_block '}'
/// summary values:CLIENTMETHOD
Method ClassClientMethod(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?&P&?4?&P&?4?&?4?&P&?1Rule?&P
	; first rule summary K
	if '(..isKeywordInList($lb("CLIENTMETHOD"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"CLIENTMETHOD")  {
		if ..MethodName(subElement,.addedElement)  {
			if ..addPunctuation(subElement,"(")  {
				if $S(..FormalSpecList(subElement,.addedElement) :1,1:1) {
					if ..addPunctuation(subElement,")")  {
						if ..ClassClientMethod36OptGrp(subElement,.addedElement)  {
							if $S(..MethodAttributeList(subElement,.addedElement) :1,1:1) {
								if ..addPunctuation(subElement,"{")  {
									if ..JavascriptCodeBlock(subElement,.addedElement)  {
										if ..addPunctuation(subElement,"}")  {
											set done=1 ; end compileRules
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// 
/// summary values:AS
Method ClassClientMethod36OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("AS"),.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"AS")  {
		if ..TypeClassReference(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=1 /* failure rollsback but returns OK */
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  class_definition ::= 'class' class_name [ 'extends' ( class_reference_list | class_reference ) ] [class_attributes] class_member_section
/// summary values:CLASS
Method ClassDefinition(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?&?4?&?4?&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("CLASS"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"CLASS")  {
		if ..ClassName(subElement,.addedElement)  {
			if ..ClassDefinition11OptGrp(subElement,.addedElement)  {
				if $S(..ClassAttributes(subElement,.addedElement) :1,1:1) {
					if ..ClassMemberSection(subElement,.addedElement)  {
						set done=1 ; end compileRules
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// 
/// summary values:EXTENDS
Method ClassDefinition11OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("EXTENDS"),.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"EXTENDS")  {
		if ..ClassDefinition12Sub(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=1 /* failure rollsback but returns OK */
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  class_reference_list | class_reference
Method ClassDefinition12Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ClassReferenceList(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ClassReference(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  class_ForeignKey ::= 'foreignkey' foreignkey_name [ '(' key_props ')' ] 'references' class_reference [ '(' [ref_props] ')' ] [ foreignKey_attribute_list ] ';'
/// summary values:FOREIGNKEY
Method ClassForeignkey(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?&?4?&K&?1Rule?&?4?&?4?&P
	; first rule summary K
	if '(..isKeywordInList($lb("FOREIGNKEY"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"FOREIGNKEY")  {
		if ..ForeignkeyName(subElement,.addedElement)  {
			if ..ClassForeignkey38OptGrp(subElement,.addedElement)  {
				if ..addKeyword(subElement,"REFERENCES")  {
					if ..ClassReference(subElement,.addedElement)  {
						if ..ClassForeignkey39OptGrp(subElement,.addedElement)  {
							if $S(..ForeignkeyAttributeList(subElement,.addedElement) :1,1:1) {
								if ..addPunctuation(subElement,";")  {
									set done=1 ; end compileRules
								}
							}
						}
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// 
/// summary values:(
Method ClassForeignkey38OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"(")  {
		if ..KeyProps(subElement,.addedElement)  {
			if ..addPunctuation(subElement,")")  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=1 /* failure rollsback but returns OK */
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// 
/// summary values:(
Method ClassForeignkey39OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?4?&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"(")  {
		if $S(..RefProps(subElement,.addedElement) :1,1:1) {
			if ..addPunctuation(subElement,")")  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=1 /* failure rollsback but returns OK */
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  class_identifier ::= 'regexp:(((\%[a-zA-Z0-9])|(\$[a-zA-Z])|[a-zA-Z])[a-zA-Z0-9\.]*)'
/// summary values:REGEXP:(((\%[A-ZA-Z0-9])|(\$[A-ZA-Z])|[A-ZA-Z])[A-ZA-Z0-9\.]*)
Method ClassIdentifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("REGEXP:(((\%[A-ZA-Z0-9])|(\$[A-ZA-Z])|[A-ZA-Z])[A-ZA-Z0-9\.]*)",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"regexp:(((\%[a-zA-Z0-9])|(\$[a-zA-Z])|[a-zA-Z])[a-zA-Z0-9\.]*)")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  class_index ::= 'index' index_name [ 'on' index_property_expression_list ] [ index_attributes ] [ 'as' type_class_reference ]';'
/// summary values:INDEX
Method ClassIndex(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?&?4?&?4?&?4?&P
	; first rule summary K
	if '(..isKeywordInList($lb("INDEX"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"INDEX")  {
		if ..IndexName(subElement,.addedElement)  {
			if ..ClassIndex112OptGrp(subElement,.addedElement)  {
				if $S(..IndexAttributes(subElement,.addedElement) :1,1:1) {
					if ..ClassIndex113OptGrp(subElement,.addedElement)  {
						if ..addPunctuation(subElement,";")  {
							set done=1 ; end compileRules
						}
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// 
/// summary values:ON
Method ClassIndex112OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("ON"),.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"ON")  {
		if ..IndexPropertyExpressionList(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=1 /* failure rollsback but returns OK */
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// 
/// summary values:AS
Method ClassIndex113OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("AS"),.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"AS")  {
		if ..TypeClassReference(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=1 /* failure rollsback but returns OK */
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  class_item_identifier ::= string | identifier
Method ClassItemIdentifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..String(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Identifier(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  class_language_name ::= 'cache' | 'basic' | 'javascript' | 'java' | 'mvbasic' | 'tsql' | 'cpp' | 'objectscript' | 'python'
/// summary values:CACHE,BASIC,JAVASCRIPT,JAVA,MVBASIC,TSQL,CPP,OBJECTSCRIPT,PYTHON
Method ClassLanguageName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K|K|K|K|K|K|K|K
	if '(..isKeywordInList($lb("CACHE","BASIC","JAVASCRIPT","JAVA","MVBASIC","TSQL","CPP","OBJECTSCRIPT","PYTHON"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"CACHE")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"BASIC")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"JAVASCRIPT")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"JAVA")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"MVBASIC")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"TSQL")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"CPP")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"OBJECTSCRIPT")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"PYTHON")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  class_member_list ::= one_classMember ( one_classMember )*
Method ClassMemberList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OneClassmember(subElement,.addedElement)  {
		if ..ClassMemberList17RepZero(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  ( one_classMember )*
Method ClassMemberList17RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ClassMemberList18Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  one_classMember
Method ClassMemberList18Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OneClassmember(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  class_member_section ::= '{' class_member_list? '}'
/// summary values:{
Method ClassMemberSection(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?4?&P
	; first rule summary P
	if '(..isStringSingle("{",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"{")  {
		if $s(..ClassMemberList(subElement,.addedElement) :1,1:1)  {
			if ..addPunctuation(subElement,"}")  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  class_method ::= 'method' method_name '(' [ formal_spec_list ] ')' [ 'as' return_type_class_reference ] [ method_attribute_list ] '{' method_body '}'
/// summary values:METHOD
Method ClassMethod(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?&P&?4?&P&?4?&?4?&P&?1Rule?&P
	; first rule summary K
	if '(..isKeywordInList($lb("METHOD"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"METHOD")  {
		if ..MethodName(subElement,.addedElement)  {
			if ..addPunctuation(subElement,"(")  {
				if $S(..FormalSpecList(subElement,.addedElement) :1,1:1) {
					if ..addPunctuation(subElement,")")  {
						if ..ClassMethod31OptGrp(subElement,.addedElement)  {
							if $S(..MethodAttributeList(subElement,.addedElement) :1,1:1) {
								if ..addPunctuation(subElement,"{")  {
									if ..MethodBody(subElement,.addedElement)  {
										if ..addPunctuation(subElement,"}")  {
											set done=1 ; end compileRules
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// 
/// summary values:AS
Method ClassMethod31OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("AS"),.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"AS")  {
		if ..ReturnTypeClassReference(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=1 /* failure rollsback but returns OK */
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  class_name ::= class_identifier
Method ClassName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ClassIdentifier(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  class_parameter ::= 'parameter' class_parameter_name [ 'as' class_parameter_type ] [ class_parameter_attribute_list ] [ '=' class_parameter_value ] ';'
/// summary values:PARAMETER
Method ClassParameter(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?&?4?&?4?&?4?&P
	; first rule summary K
	if '(..isKeywordInList($lb("PARAMETER"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"PARAMETER")  {
		if ..ClassParameterName(subElement,.addedElement)  {
			if ..ClassParameter45OptGrp(subElement,.addedElement)  {
				if $S(..ClassParameterAttributeList(subElement,.addedElement) :1,1:1) {
					if ..ClassParameter46OptGrp(subElement,.addedElement)  {
						if ..addPunctuation(subElement,";")  {
							set done=1 ; end compileRules
						}
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// 
/// summary values:AS
Method ClassParameter45OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("AS"),.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"AS")  {
		if ..ClassParameterType(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=1 /* failure rollsback but returns OK */
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// 
/// summary values:=
Method ClassParameter46OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle("=",.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"=")  {
		if ..ClassParameterValue(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=1 /* failure rollsback but returns OK */
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  class_parameter_attribute ::= attribute_Abstract | attribute_Constraint | attribute_Final | attribute_Flags | attribute_Internal | attribute_Deprecated
Method ClassParameterAttribute(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..AttributeAbstract(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeConstraint(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeFinal(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeFlags(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeInternal(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeDeprecated(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  class_parameter_attribute_list ::= '[' class_parameter_attribute ( ',' class_parameter_attribute )* ']'
/// summary values:[
Method ClassParameterAttributeList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&(?4?)*&P
	; first rule summary P
	if '(..isStringSingle("[",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"[")  {
		if ..ClassParameterAttribute(subElement,.addedElement)  {
			if ..ClassParameterAttributeList48RepZero(subElement,.addedElement)  {
				if ..addPunctuation(subElement,"]")  {
					set done=1 ; end compileRules
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  ( ',' class_parameter_attribute )*
Method ClassParameterAttributeList48RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ClassParameterAttributeList49Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' class_parameter_attribute
/// summary values:,
Method ClassParameterAttributeList49Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..ClassParameterAttribute(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  class_parameter_name ::= class_item_identifier
Method ClassParameterName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ClassItemIdentifier(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  class_parameter_type ::= class_reference | 'COSEXPRESSION'
Method ClassParameterType(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|K
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ClassReference(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"COSEXPRESSION")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  class_parameter_value ::= string | number | ( '{' expression '}' )
Method ClassParameterValue(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..String(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Number(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ClassParameterValue47Sub(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  '{' expression '}'
/// summary values:{
Method ClassParameterValue47Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&P
	; first rule summary P
	if '(..isStringSingle("{",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"{")  {
		if ..Expression(subElement,.addedElement)  {
			if ..addPunctuation(subElement,"}")  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  class_projection ::= 'projection' projection_name [ class_projection_type ] [ class_property_attributes ] ';'
/// summary values:PROJECTION
Method ClassProjection(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?&?4?&?4?&P
	; first rule summary K
	if '(..isKeywordInList($lb("PROJECTION"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"PROJECTION")  {
		if ..ProjectionName(subElement,.addedElement)  {
			if $S(..ClassProjectionType(subElement,.addedElement) :1,1:1) {
				if $S(..ClassPropertyAttributes(subElement,.addedElement) :1,1:1) {
					if ..addPunctuation(subElement,";")  {
						set done=1 ; end compileRules
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  class_projection_type ::= 'as' type_class_reference
/// summary values:AS
Method ClassProjectionType(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("AS"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"AS")  {
		if ..TypeClassReference(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  class_property ::= 'property' property_name [ class_property_type ] [ class_property_attributes ] ';'
/// summary values:PROPERTY
Method ClassProperty(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?&?4?&?4?&P
	; first rule summary K
	if '(..isKeywordInList($lb("PROPERTY"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"PROPERTY")  {
		if ..PropertyName(subElement,.addedElement)  {
			if $S(..ClassPropertyType(subElement,.addedElement) :1,1:1) {
				if $S(..ClassPropertyAttributes(subElement,.addedElement) :1,1:1) {
					if ..addPunctuation(subElement,";")  {
						set done=1 ; end compileRules
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  class_property_attribute ::= attribute_Aliases | attribute_Calculated | attribute_Cardinality | attribute_ClientName | attribute_Deprecated | attribute_Final | attribute_Identity | attribute_InitialExpression | attribute_Internal | attribute_Inverse | attribute_MultiDimensional | attribute_OnDelete | attribute_Private | attribute_ReadOnly | attribute_Required | attribute_ServerOnly | attribute_SQLColumnNumber | attribute_SQLComputeCode | attribute_SQLComputed | attribute_SQLComputeOnChange | attribute_SQLFieldname | attribute_SQLListDelimiter | attribute_SQLListType | attribute_Transient | attribute_Not
Method ClassPropertyAttribute(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..AttributeAliases(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeCalculated(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeCardinality(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeClientname(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeDeprecated(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeFinal(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeIdentity(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeInitialexpression(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeInternal(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeInverse(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeMultidimensional(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeOndelete(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributePrivate(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeReadonly(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeRequired(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeServeronly(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeSqlcolumnnumber(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeSqlcomputecode(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeSqlcomputed(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeSqlcomputeonchange(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeSqlfieldname(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeSqllistdelimiter(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeSqllisttype(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeTransient(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeNot(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  class_property_attribute_list ::= class_property_attribute ( ',' class_property_attribute )*
Method ClassPropertyAttributeList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ClassPropertyAttribute(subElement,.addedElement)  {
		if ..ClassPropertyAttributeList25RepZero(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  ( ',' class_property_attribute )*
Method ClassPropertyAttributeList25RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ClassPropertyAttributeList26Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' class_property_attribute
/// summary values:,
Method ClassPropertyAttributeList26Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..ClassPropertyAttribute(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  class_property_attributes ::= '[' class_property_attribute_list ']'
/// summary values:[
Method ClassPropertyAttributes(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&P
	; first rule summary P
	if '(..isStringSingle("[",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"[")  {
		if ..ClassPropertyAttributeList(subElement,.addedElement)  {
			if ..addPunctuation(subElement,"]")  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  class_property_type ::= ('as' [ ( 'array' | 'list' ) 'of' ] type_class_reference ) | type_parameters
Method ClassPropertyType(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ClassPropertyType22Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..TypeParameters(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// 'as' [ ( 'array' | 'list' ) 'of' ] type_class_reference
/// summary values:AS
Method ClassPropertyType22Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?4?&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("AS"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"AS")  {
		if ..ClassPropertyType23OptGrp(subElement,.addedElement)  {
			if ..TypeClassReference(subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method ClassPropertyType23OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&K
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ClassPropertyType24Sub(subElement,.addedElement)  {
		if ..addKeyword(subElement,"OF")  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=1 /* failure rollsback but returns OK */
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  'array' | 'list'
/// summary values:ARRAY,LIST
Method ClassPropertyType24Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K
	if '(..isKeywordInList($lb("ARRAY","LIST"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	s subElement=ParentElement
	if ..addKeyword(subElement,"ARRAY")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"LIST")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  class_query ::= 'query' query_name '(' [ formal_spec_list ] ')' [ 'as' type_class_reference ] [ class_query_attributes ] '{' class_query_body '}'
/// summary values:QUERY
Method ClassQuery(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?&P&?4?&P&?4?&?4?&P&?1Rule?&P
	; first rule summary K
	if '(..isKeywordInList($lb("QUERY"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"QUERY")  {
		if ..QueryName(subElement,.addedElement)  {
			if ..addPunctuation(subElement,"(")  {
				if $S(..FormalSpecList(subElement,.addedElement) :1,1:1) {
					if ..addPunctuation(subElement,")")  {
						if ..ClassQuery87OptGrp(subElement,.addedElement)  {
							if $S(..ClassQueryAttributes(subElement,.addedElement) :1,1:1) {
								if ..addPunctuation(subElement,"{")  {
									if ..ClassQueryBody(subElement,.addedElement)  {
										if ..addPunctuation(subElement,"}")  {
											set done=1 ; end compileRules
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// 
/// summary values:AS
Method ClassQuery87OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("AS"),.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"AS")  {
		if ..TypeClassReference(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=1 /* failure rollsback but returns OK */
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  class_query_attribute ::= attribute_ClientName | attribute_Deprecated | attribute_Final | attribute_Internal | attribute_Private | attribute_SOAPBindingStyle | attribute_SOAPBodyuse | attribute_SOAPNameSpace | attribute_SQLName | attribute_SQLProc | attribute_SQLView | attribute_SQLViewname | attribute_WebMethod
Method ClassQueryAttribute(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..AttributeClientname(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeDeprecated(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeFinal(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeInternal(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributePrivate(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeSoapbindingstyle(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeSoapbodyuse(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeSoapnamespace(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeSqlname(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeSqlproc(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeSqlview(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeSqlviewname(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeWebmethod(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  class_query_attributes ::= '[' class_query_attribute ( ',' class_query_attribute )* ']'
/// summary values:[
Method ClassQueryAttributes(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&(?4?)*&P
	; first rule summary P
	if '(..isStringSingle("[",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"[")  {
		if ..ClassQueryAttribute(subElement,.addedElement)  {
			if ..ClassQueryAttributes88RepZero(subElement,.addedElement)  {
				if ..addPunctuation(subElement,"]")  {
					set done=1 ; end compileRules
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  ( ',' class_query_attribute )*
Method ClassQueryAttributes88RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ClassQueryAttributes89Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' class_query_attribute
/// summary values:,
Method ClassQueryAttributes89Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..ClassQueryAttribute(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  class_query_body ::= text_brace_block
Method ClassQueryBody(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..TextBraceBlock(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  class_reference ::= class_identifier
Method ClassReference(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ClassIdentifier(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  class_reference_list ::= '(' [class_reference] ( ',' class_reference )* ')'
/// summary values:(
Method ClassReferenceList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?4?&(?4?)*&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"(")  {
		if $S(..ClassReference(subElement,.addedElement) :1,1:1) {
			if ..ClassReferenceList13RepZero(subElement,.addedElement)  {
				if ..addPunctuation(subElement,")")  {
					set done=1 ; end compileRules
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  ( ',' class_reference )*
Method ClassReferenceList13RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ClassReferenceList14Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' class_reference
/// summary values:,
Method ClassReferenceList14Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..ClassReference(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  class_relationship ::= 'relationship' property_name [ class_property_type ] class_property_attributes ';'
/// summary values:RELATIONSHIP
Method ClassRelationship(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?&?4?&?1Rule?&P
	; first rule summary K
	if '(..isKeywordInList($lb("RELATIONSHIP"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"RELATIONSHIP")  {
		if ..PropertyName(subElement,.addedElement)  {
			if $S(..ClassPropertyType(subElement,.addedElement) :1,1:1) {
				if ..ClassPropertyAttributes(subElement,.addedElement)  {
					if ..addPunctuation(subElement,";")  {
						set done=1 ; end compileRules
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  class_storage ::= 'storage' storage_name '{' storage_xml '}'
/// summary values:STORAGE
Method ClassStorage(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?&P&?1Rule?&P
	; first rule summary K
	if '(..isKeywordInList($lb("STORAGE"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"STORAGE")  {
		if ..StorageName(subElement,.addedElement)  {
			if ..addPunctuation(subElement,"{")  {
				if ..StorageXml(subElement,.addedElement)  {
					if ..addPunctuation(subElement,"}")  {
						set done=1 ; end compileRules
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  class_trigger ::= 'trigger' trigger_name [ trigger_attribute_list ] '{' [ trigger_code_block ] '}'
/// summary values:TRIGGER
Method ClassTrigger(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?&?4?&P&?4?&P
	; first rule summary K
	if '(..isKeywordInList($lb("TRIGGER"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"TRIGGER")  {
		if ..TriggerName(subElement,.addedElement)  {
			if $S(..TriggerAttributeList(subElement,.addedElement) :1,1:1) {
				if ..addPunctuation(subElement,"{")  {
					if $S(..TriggerCodeBlock(subElement,.addedElement) :1,1:1) {
						if ..addPunctuation(subElement,"}")  {
							set done=1 ; end compileRules
						}
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  class_type_name ::= 'datatype' | 'persistent' | 'serial' | 'stream' | 'view' | 'index' | 'donotuse' | 'dynamic' | '""'
Method ClassTypeName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K|K|K|K|K|K|K|P
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"DATATYPE")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"PERSISTENT")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"SERIAL")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"STREAM")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"VIEW")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"INDEX")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"DONOTUSE")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"DYNAMIC")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"""""")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  class_xdata ::= 'xdata' xdata_name [ '[' (xdata_attributes)* ']' ] '{' (xdata_text | xdata_xml | xdata_json ) '}'
/// summary values:XDATA
Method ClassXdata(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?&?4?&P&?1Rule?&P
	; first rule summary K
	if '(..isKeywordInList($lb("XDATA"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"XDATA")  {
		if ..XdataName(subElement,.addedElement)  {
			if ..ClassXdata90OptGrp(subElement,.addedElement)  {
				if ..addPunctuation(subElement,"{")  {
					if ..ClassXdata93Sub(subElement,.addedElement)  {
						if ..addPunctuation(subElement,"}")  {
							set done=1 ; end compileRules
						}
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// 
/// summary values:[
Method ClassXdata90OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&(?4?)*&P
	; first rule summary P
	if '(..isStringSingle("[",.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"[")  {
		if ..ClassXdata91RepZero(subElement,.addedElement)  {
			if ..addPunctuation(subElement,"]")  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=1 /* failure rollsback but returns OK */
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  (xdata_attributes)*
Method ClassXdata91RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ClassXdata92Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

/// xdata_attributes
Method ClassXdata92Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XdataAttributes(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// xdata_text | xdata_xml | xdata_json
Method ClassXdata93Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XdataText(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..XdataXml(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..XdataJson(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  client_data_type_name ::= 'bigint' | 'binary' | 'binarystream' | 'boolean' | 'characterstream' | 'currency' | 'date' | 'decimal' | 'double' | 'fdate' | 'ftimestamp' | 'handle' | 'integer' | 'list' | 'longvarchar' | 'numeric' | 'status' | 'timestamp' | 'time' | 'varchar' | 'MVDATE'
/// summary values:BIGINT,BINARY,BINARYSTREAM,BOOLEAN,CHARACTERSTREAM,CURRENCY,DATE,DECIMAL,DOUBLE,FDATE,FTIMESTAMP,HANDLE,INTEGER,LIST,LONGVARCHAR,NUMERIC,STATUS,TIMESTAMP,TIME,VARCHAR,MVDATE
Method ClientDataTypeName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K
	if '(..isKeywordInList($lb("BIGINT","BINARY","BINARYSTREAM","BOOLEAN","CHARACTERSTREAM","CURRENCY","DATE","DECIMAL","DOUBLE","FDATE","FTIMESTAMP","HANDLE","INTEGER","LIST","LONGVARCHAR","NUMERIC","STATUS","TIMESTAMP","TIME","VARCHAR","MVDATE"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"BIGINT")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"BINARY")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"BINARYSTREAM")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"BOOLEAN")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"CHARACTERSTREAM")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"CURRENCY")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"DATE")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"DECIMAL")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"DOUBLE")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"FDATE")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"FTIMESTAMP")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"HANDLE")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"INTEGER")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"LIST")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"LONGVARCHAR")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"NUMERIC")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"STATUS")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"TIMESTAMP")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"TIME")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"VARCHAR")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"MVDATE")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  client_identifier ::= 'NEEDS CLIENT IDENTIFIER'
/// summary values:NEEDS CLIENT IDENTIFIER
Method ClientIdentifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("NEEDS CLIENT IDENTIFIER",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"NEEDS CLIENT IDENTIFIER")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  collation_type ::= 'exact' | 'mvr' | 'sqlstring' | ('sqlupper' [ '(' number ')' ] )| 'truncate' | 'plus' | 'minus' | 'alphaup' | 'string' | 'upper' | 'space'
Method CollationType(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K|K|?1Rule?|K|K|K|K|K|K|K
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"EXACT")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"MVR")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"SQLSTRING")  {
		set done=1 ; or
	} elseif ..CollationType118Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"TRUNCATE")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"PLUS")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"MINUS")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"ALPHAUP")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"STRING")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"UPPER")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"SPACE")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// 'sqlupper' [ '(' number ')' ]
/// summary values:SQLUPPER
Method CollationType118Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?4?
	; first rule summary K
	if '(..isKeywordInList($lb("SQLUPPER"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"SQLUPPER")  {
		if ..CollationType119OptGrp(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// 
/// summary values:(
Method CollationType119OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"(")  {
		if ..Number(subElement,.addedElement)  {
			if ..addPunctuation(subElement,")")  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=1 /* failure rollsback but returns OK */
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  cos_code_block ::= 'NEEDS COS CODE BLOCK'
/// summary values:NEEDS COS CODE BLOCK
Method CosCodeBlock(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("NEEDS COS CODE BLOCK",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"NEEDS COS CODE BLOCK")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  cos_code_block_sql ::= 'NEEDS COS SQL CODE BLOCK'
/// summary values:NEEDS COS SQL CODE BLOCK
Method CosCodeBlockSql(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("NEEDS COS SQL CODE BLOCK",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"NEEDS COS SQL CODE BLOCK")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  cos_code_block_sql_storage ::= 'NEEDS COS SQL CODE BLOCK'
/// summary values:NEEDS COS SQL CODE BLOCK
Method CosCodeBlockSqlStorage(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("NEEDS COS SQL CODE BLOCK",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"NEEDS COS SQL CODE BLOCK")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  cos_code_block_storage ::= ('<!' '[CDATA[' cos_code_block_sql_storage ']]' '>') | cos_code_block_sql_storage
Method CosCodeBlockStorage(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CosCodeBlockStorage190Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CosCodeBlockSqlStorage(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// '<!' '[CDATA[' cos_code_block_sql_storage ']]' '>'
/// summary values:<!
Method CosCodeBlockStorage190Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&P&?1Rule?&P&P
	; first rule summary P
	if '(..isStringSingle("<!",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"<!")  {
		if ..addPunctuation(subElement,"[CDATA[")  {
			if ..CosCodeBlockSqlStorage(subElement,.addedElement)  {
				if ..addPunctuation(subElement,"]]")  {
					if ..addPunctuation(subElement,">")  {
						set done=1 ; end compileRules
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  cos_code_block_trigger ::= 'NEEDS COS SQL CODE BLOCK'
/// summary values:NEEDS COS SQL CODE BLOCK
Method CosCodeBlockTrigger(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("NEEDS COS SQL CODE BLOCK",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"NEEDS COS SQL CODE BLOCK")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  cos_expression_sql ::= 'NEEDS COS EXPRESSION SQL'
/// summary values:NEEDS COS EXPRESSION SQL
Method CosExpressionSql(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("NEEDS COS EXPRESSION SQL",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"NEEDS COS EXPRESSION SQL")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  cos_expression_storage ::= ('<!' '[CDATA[' cos_expression_sql ']]' '>') | cos_expression_sql
Method CosExpressionStorage(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CosExpressionStorage189Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CosExpressionSql(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// '<!' '[CDATA[' cos_expression_sql ']]' '>'
/// summary values:<!
Method CosExpressionStorage189Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&P&?1Rule?&P&P
	; first rule summary P
	if '(..isStringSingle("<!",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"<!")  {
		if ..addPunctuation(subElement,"[CDATA[")  {
			if ..CosExpressionSql(subElement,.addedElement)  {
				if ..addPunctuation(subElement,"]]")  {
					if ..addPunctuation(subElement,">")  {
						set done=1 ; end compileRules
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  event_keyword ::= 'insert/update/delete' | 'insert/update' | 'insert/delete' | 'update/delete' | 'delete' | 'insert' | 'update'
/// summary values:INSERT/UPDATE/DELETE,INSERT/UPDATE,INSERT/DELETE,UPDATE/DELETE,DELETE,INSERT,UPDATE
Method EventKeyword(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K|K|K|K|K|K
	if '(..isKeywordInList($lb("INSERT/UPDATE/DELETE","INSERT/UPDATE","INSERT/DELETE","UPDATE/DELETE","DELETE","INSERT","UPDATE"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"INSERT/UPDATE/DELETE")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"INSERT/UPDATE")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"INSERT/DELETE")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"UPDATE/DELETE")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"DELETE")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"INSERT")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"UPDATE")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  expression ::= 'NEEDS EXPRESSION'
/// summary values:NEEDS EXPRESSION
Method Expression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("NEEDS EXPRESSION",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"NEEDS EXPRESSION")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  fieldname ::= property_reference
Method Fieldname(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..PropertyReference(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  filename ::= 'NEEDS FILE NAME'
/// summary values:NEEDS FILE NAME
Method Filename(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("NEEDS FILE NAME",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"NEEDS FILE NAME")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  foreach_type ::= 'row' | 'row/object' | 'statement'
/// summary values:ROW,ROW/OBJECT,STATEMENT
Method ForeachType(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K|K
	if '(..isKeywordInList($lb("ROW","ROW/OBJECT","STATEMENT"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"ROW")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"ROW/OBJECT")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"STATEMENT")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  foreignKey_attribute_list ::= '[' one_foreignkey_atttribute ( ',' one_foreignkey_atttribute )* ']'
/// summary values:[
Method ForeignkeyAttributeList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&(?4?)*&P
	; first rule summary P
	if '(..isStringSingle("[",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"[")  {
		if ..OneForeignkeyAtttribute(subElement,.addedElement)  {
			if ..ForeignkeyAttributeList43RepZero(subElement,.addedElement)  {
				if ..addPunctuation(subElement,"]")  {
					set done=1 ; end compileRules
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  ( ',' one_foreignkey_atttribute )*
Method ForeignkeyAttributeList43RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ForeignkeyAttributeList44Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' one_foreignkey_atttribute
/// summary values:,
Method ForeignkeyAttributeList44Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..OneForeignkeyAtttribute(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  foreignkey_name ::= class_item_identifier
Method ForeignkeyName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ClassItemIdentifier(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  formal_spec_item ::= [ formal_spec_mode ] variable_set ['...'] [ as_type_class_reference ] [ parameter_default_value ]
Method FormalSpecItem(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?&?1Rule?&?4?&?4?&?4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..FormalSpecMode(subElement,.addedElement) :1,1:1) {
		if ..VariableSet(subElement,.addedElement)  {
			if $S(..addPunctuation(subElement,"...") :1,1:1) {
				if $S(..AsTypeClassReference(subElement,.addedElement) :1,1:1) {
					if $S(..ParameterDefaultValue(subElement,.addedElement) :1,1:1) {
						set done=1 ; end compileRules
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  formal_spec_list ::= formal_spec_item( ',' formal_spec_item )*
Method FormalSpecList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..FormalSpecItem(subElement,.addedElement)  {
		if ..FormalSpecList32RepZero(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// ( ',' formal_spec_item )*
Method FormalSpecList32RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..FormalSpecList33Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' formal_spec_item
/// summary values:,
Method FormalSpecList33Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..FormalSpecItem(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  formal_spec_mode ::= 'byref' | 'output' | 'byval'
/// summary values:BYREF,OUTPUT,BYVAL
Method FormalSpecMode(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K|K
	if '(..isKeywordInList($lb("BYREF","OUTPUT","BYVAL"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"BYREF")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"OUTPUT")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"BYVAL")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  global ::= cos_expression_sql
Method Global(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CosExpressionSql(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  identifier ::= 'regexp:(((\%[a-zA-Z0-9])|(\$[a-zA-Z])|[a-zA-Z])[a-zA-Z0-9\.]*)'
/// summary values:REGEXP:(((\%[A-ZA-Z0-9])|(\$[A-ZA-Z])|[A-ZA-Z])[A-ZA-Z0-9\.]*)
Method Identifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("REGEXP:(((\%[A-ZA-Z0-9])|(\$[A-ZA-Z])|[A-ZA-Z])[A-ZA-Z0-9\.]*)",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"regexp:(((\%[a-zA-Z0-9])|(\$[a-zA-Z])|[a-zA-Z])[a-zA-Z0-9\.]*)")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  import_definition ::= 'import' ( package_name | ( '(' package_list ')' ) )
/// summary values:IMPORT
Method ImportDefinition(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("IMPORT"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"IMPORT")  {
		if ..ImportDefinition3Sub(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  package_name | ( '(' package_list ')' )
Method ImportDefinition3Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..PackageName(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ImportDefinition4Sub(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  '(' package_list ')'
/// summary values:(
Method ImportDefinition4Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"(")  {
		if ..PackageList(subElement,.addedElement)  {
			if ..addPunctuation(subElement,")")  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  include_definition ::= 'include' ( include_list | include_name )
/// summary values:INCLUDE
Method IncludeDefinition(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("INCLUDE"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"INCLUDE")  {
		if ..IncludeDefinition6Sub(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  include_list | include_name
Method IncludeDefinition6Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..IncludeList(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..IncludeName(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  include_generator_definition ::= 'includegenerator' ( include_list | include_name )
/// summary values:INCLUDEGENERATOR
Method IncludeGeneratorDefinition(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("INCLUDEGENERATOR"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"INCLUDEGENERATOR")  {
		if ..IncludeGeneratorDefinition5Sub(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  include_list | include_name
Method IncludeGeneratorDefinition5Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..IncludeList(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..IncludeName(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  include_list ::= '(' include_name ( ',' include_name )* ')'
/// summary values:(
Method IncludeList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&(?4?)*&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"(")  {
		if ..IncludeName(subElement,.addedElement)  {
			if ..IncludeList9RepZero(subElement,.addedElement)  {
				if ..addPunctuation(subElement,")")  {
					set done=1 ; end compileRules
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  ',' include_name
/// summary values:,
Method IncludeList10Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..IncludeName(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  ( ',' include_name )*
Method IncludeList9RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..IncludeList10Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  include_name ::= identifier
Method IncludeName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Identifier(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  index_attribute ::= attribute_Condition | attribute_Data | attribute_Extent | attribute_IdKey | attribute_Internal | attribute_PrimaryKey | attribute_SQLName | attribute_Type | attribute_Unique
Method IndexAttribute(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..AttributeCondition(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeData(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeExtent(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeIdkey(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeInternal(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributePrimarykey(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeSqlname(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeType(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeUnique(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  index_attributes ::= '[' index_attribute ( ',' index_attribute )* ']'
/// summary values:[
Method IndexAttributes(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&(?4?)*&P
	; first rule summary P
	if '(..isStringSingle("[",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"[")  {
		if ..IndexAttribute(subElement,.addedElement)  {
			if ..IndexAttributes120RepZero(subElement,.addedElement)  {
				if ..addPunctuation(subElement,"]")  {
					set done=1 ; end compileRules
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  ( ',' index_attribute )*
Method IndexAttributes120RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..IndexAttributes121Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' index_attribute
/// summary values:,
Method IndexAttributes121Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..IndexAttribute(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  index_name ::= class_item_identifier
Method IndexName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ClassItemIdentifier(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  index_property ::= fieldname ['(ELEMENTS)' | '(KEYS)' ] [ 'as' collation_type]
Method IndexProperty(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?&?4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Fieldname(subElement,.addedElement)  {
		if ..IndexProperty116OptGrp(subElement,.addedElement)  {
			if ..IndexProperty117OptGrp(subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// 
/// summary values:(ELEMENTS),(KEYS)
Method IndexProperty116OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|P
	if '(..isStringInList($lb("(ELEMENTS)","(KEYS)"),10,.value)) { quit 1 /* not found is OK */ }
	set subElement=ParentElement
	set done=0 ; method start
	s subElement=ParentElement
	if ..addPunctuation(subElement,"(ELEMENTS)")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"(KEYS)")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=1 /* failure rollsback but returns OK */
	}
	quit ret
}

/// 
/// summary values:AS
Method IndexProperty117OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("AS"),.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"AS")  {
		if ..CollationType(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=1 /* failure rollsback but returns OK */
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  index_property_expression_list ::= index_property | index_property_list
Method IndexPropertyExpressionList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..IndexProperty(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..IndexPropertyList(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  index_property_list ::= '(' index_property ( ',' index_property )* ')'
/// summary values:(
Method IndexPropertyList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&(?4?)*&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"(")  {
		if ..IndexProperty(subElement,.addedElement)  {
			if ..IndexPropertyList114RepZero(subElement,.addedElement)  {
				if ..addPunctuation(subElement,")")  {
					set done=1 ; end compileRules
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  ( ',' index_property )*
Method IndexPropertyList114RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..IndexPropertyList115Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' index_property
/// summary values:,
Method IndexPropertyList115Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..IndexProperty(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  inheritance_direction ::= 'left' | 'right'
/// summary values:LEFT,RIGHT
Method InheritanceDirection(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K
	if '(..isKeywordInList($lb("LEFT","RIGHT"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"LEFT")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"RIGHT")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  initial_expression_complex ::= '{' expression '}'
/// summary values:{
Method InitialExpressionComplex(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&P
	; first rule summary P
	if '(..isStringSingle("{",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"{")  {
		if ..Expression(subElement,.addedElement)  {
			if ..addPunctuation(subElement,"}")  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  initial_expression_simple ::= string | number
Method InitialExpressionSimple(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..String(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Number(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  initialexpression_value ::= initial_expression_complex | initial_expression_simple
Method InitialexpressionValue(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..InitialExpressionComplex(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..InitialExpressionSimple(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  javascript_code_block ::= 'NEEDS JS CODE BLOCK'
/// summary values:NEEDS JS CODE BLOCK
Method JavascriptCodeBlock(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("NEEDS JS CODE BLOCK",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"NEEDS JS CODE BLOCK")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  json_string ::= 'NEED JSON STRING'
/// summary values:NEED JSON STRING
Method JsonString(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("NEED JSON STRING",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"NEED JSON STRING")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  key_props ::= name_value_pair_list
Method KeyProps(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..NameValuePairList(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  method_attribute ::= attribute_Abstract | attribute_ClientName | attribute_CodeMode | attribute_Deprecated | attribute_ExternalProcName | attribute_Final | attribute_ForceGenerate | attribute_GenerateAfter | attribute_Internal | attribute_Language | attribute_NoContext | attribute_NotInheritable | attribute_PlaceAfter | attribute_Private | attribute_ProcedureBlock | attribute_PublicList | attribute_ReturnResultSets | attribute_ServerOnly | attribute_SOAPAction | attribute_SOAPBindingStyle | attribute_SOAPBodyuse | attribute_SOAPMessageName | attribute_SOAPNameSpace | attribute_SOAPRequestMessage | attribute_SOAPTypeNamespace | attribute_SQLName | attribute_SQLProc | attribute_WebMethod | attribute_ZenMethod
Method MethodAttribute(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..AttributeAbstract(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeClientname(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeCodemode(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeDeprecated(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeExternalprocname(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeFinal(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeForcegenerate(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeGenerateafter(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeInternal(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeLanguage(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeNocontext(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeNotinheritable(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributePlaceafter(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributePrivate(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeProcedureblock(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributePubliclist(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeReturnresultsets(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeServeronly(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeSoapaction(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeSoapbindingstyle(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeSoapbodyuse(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeSoapmessagename(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeSoapnamespace(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeSoaprequestmessage(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeSoaptypenamespace(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeSqlname(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeSqlproc(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeWebmethod(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeZenmethod(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  method_attribute_list ::= '[' method_attribute ( ',' method_attribute )* ']'
/// summary values:[
Method MethodAttributeList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&(?4?)*&P
	; first rule summary P
	if '(..isStringSingle("[",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"[")  {
		if ..MethodAttribute(subElement,.addedElement)  {
			if ..MethodAttributeList34RepZero(subElement,.addedElement)  {
				if ..addPunctuation(subElement,"]")  {
					set done=1 ; end compileRules
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  ( ',' method_attribute )*
Method MethodAttributeList34RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..MethodAttributeList35Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' method_attribute
/// summary values:,
Method MethodAttributeList35Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..MethodAttribute(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  method_body ::= cos_code_block
Method MethodBody(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CosCodeBlock(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  method_name ::= class_item_identifier
Method MethodName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ClassItemIdentifier(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  method_reference ::= class_item_identifier
Method MethodReference(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ClassItemIdentifier(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  mime_type ::= 'regex:[a-zA-Z][a-zA-Z0-9]*\/[a-zA-Z][a-zA-Z0-9]*'
/// summary values:REGEX:[A-ZA-Z][A-ZA-Z0-9]*\/[A-ZA-Z][A-ZA-Z0-9]*
Method MimeType(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("REGEX:[A-ZA-Z][A-ZA-Z0-9]*\/[A-ZA-Z][A-ZA-Z0-9]*",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"regex:[a-zA-Z][a-zA-Z0-9]*\/[a-zA-Z][a-zA-Z0-9]*")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  name_value_pair_list ::= one_name_value_pair ( ',' one_name_value_pair )*
Method NameValuePairList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OneNameValuePair(subElement,.addedElement)  {
		if ..NameValuePairList40RepZero(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  ( ',' one_name_value_pair )*
Method NameValuePairList40RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..NameValuePairList41Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' one_name_value_pair
/// summary values:,
Method NameValuePairList41Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..OneNameValuePair(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  number ::= ['-'] ('regexp:[0-9]*' [ '.' 'regexp:[0-9]+'] [ ('e' | 'E') 'regexp:[0-9]+']) | ('.' 'regexp:[0-9]+' [ ('e' | 'E') 'regexp:[0-9]+'])
Method Number(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?&?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..addPunctuation(subElement,"-") :1,1:1) {
		if ..Number181Sub(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..Number185Sub(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// 'regexp:[0-9]*' [ '.' 'regexp:[0-9]+'] [ ('e' | 'E') 'regexp:[0-9]+']
/// summary values:REGEXP:[0-9]*
Method Number181Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?4?&?4?
	; first rule summary P
	if '(..isStringSingle("REGEXP:[0-9]*",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"regexp:[0-9]*")  {
		if ..Number182OptGrp(subElement,.addedElement)  {
			if ..Number183OptGrp(subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// 
/// summary values:.
Method Number182OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&P
	; first rule summary P
	if '(..isStringSingle(".",.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,".")  {
		if ..addPunctuation(subElement,"regexp:[0-9]+")  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=1 /* failure rollsback but returns OK */
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method Number183OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&P
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Number184Sub(subElement,.addedElement)  {
		if ..addPunctuation(subElement,"regexp:[0-9]+")  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=1 /* failure rollsback but returns OK */
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// 'e' | 'E'
/// summary values:E,E
Method Number184Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K
	if '(..isKeywordInList($lb("E","E"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	s subElement=ParentElement
	if ..addKeyword(subElement,"E")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"E")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

/// '.' 'regexp:[0-9]+' [ ('e' | 'E') 'regexp:[0-9]+']
/// summary values:.
Method Number185Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&P&?4?
	; first rule summary P
	if '(..isStringSingle(".",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,".")  {
		if ..addPunctuation(subElement,"regexp:[0-9]+")  {
			if ..Number186OptGrp(subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method Number186OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&P
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Number187Sub(subElement,.addedElement)  {
		if ..addPunctuation(subElement,"regexp:[0-9]+")  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=1 /* failure rollsback but returns OK */
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// 'e' | 'E'
/// summary values:E,E
Method Number187Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K
	if '(..isKeywordInList($lb("E","E"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	s subElement=ParentElement
	if ..addKeyword(subElement,"E")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"E")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  one_classMember ::= class_class_method | class_ForeignKey | class_index | class_method | class_property | class_parameter | class_projection | class_query | class_relationship | class_storage | class_trigger | class_xdata | class_client_method
Method OneClassmember(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ClassClassMethod(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ClassForeignkey(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ClassIndex(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ClassMethod(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ClassProperty(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ClassParameter(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ClassProjection(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ClassQuery(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ClassRelationship(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ClassStorage(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ClassTrigger(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ClassXdata(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ClassClientMethod(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  one_column_name ::= string | text
Method OneColumnName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..String(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Text(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  one_data_attribute_value ::= property_reference ['(ELEMENTS)' | '(KEYS)' ]
Method OneDataAttributeValue(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..PropertyReference(subElement,.addedElement)  {
		if ..OneDataAttributeValue130OptGrp(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// 
/// summary values:(ELEMENTS),(KEYS)
Method OneDataAttributeValue130OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|P
	if '(..isStringInList($lb("(ELEMENTS)","(KEYS)"),10,.value)) { quit 1 /* not found is OK */ }
	set subElement=ParentElement
	set done=0 ; method start
	s subElement=ParentElement
	if ..addPunctuation(subElement,"(ELEMENTS)")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"(KEYS)")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=1 /* failure rollsback but returns OK */
	}
	quit ret
}

///  one_foreignkey_atttribute ::= attribute_Internal | attribute_NoCheck | attribute_OnDelete | attribute_OnUpdate | attribute_SQLName
Method OneForeignkeyAtttribute(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..AttributeInternal(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeNocheck(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeOndelete(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeOnupdate(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeSqlname(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  one_name_value_pair ::= class_item_identifier [ '=' expression ]
Method OneNameValuePair(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ClassItemIdentifier(subElement,.addedElement)  {
		if ..OneNameValuePair42OptGrp(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// 
/// summary values:=
Method OneNameValuePair42OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle("=",.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"=")  {
		if ..Expression(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=1 /* failure rollsback but returns OK */
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  package_list ::= package_name ( ',' package_name )*
Method PackageList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..PackageName(subElement,.addedElement)  {
		if ..PackageList7RepZero(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  ( ',' package_name )*
Method PackageList7RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..PackageList8Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' package_name
/// summary values:,
Method PackageList8Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..PackageName(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  package_name ::= identifier
Method PackageName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Identifier(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  parameter_default_expression ::= '{' expression '}'
/// summary values:{
Method ParameterDefaultExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&P
	; first rule summary P
	if '(..isStringSingle("{",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"{")  {
		if ..Expression(subElement,.addedElement)  {
			if ..addPunctuation(subElement,"}")  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  parameter_default_simple ::= [ '+' ] number | string
Method ParameterDefaultSimple(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?&?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..addPunctuation(subElement,"+") :1,1:1) {
		if ..Number(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..String(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  parameter_default_value ::= '=' ( 'NULL' | parameter_default_simple | parameter_default_expression )
/// summary values:=
Method ParameterDefaultValue(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle("=",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"=")  {
		if ..ParameterDefaultValue37Sub(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  'NULL' | parameter_default_simple | parameter_default_expression
Method ParameterDefaultValue37Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"NULL")  {
		set done=1 ; or
	} elseif ..ParameterDefaultSimple(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ParameterDefaultExpression(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  projection_name ::= string | identifier
Method ProjectionName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..String(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Identifier(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  property_name ::= class_item_identifier
Method PropertyName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ClassItemIdentifier(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  property_reference ::= class_item_identifier
Method PropertyReference(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ClassItemIdentifier(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  query_name ::= class_item_identifier
Method QueryName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ClassItemIdentifier(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  ref_props ::= name_value_pair_list
Method RefProps(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..NameValuePairList(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  relationship_attribute ::= attribute_Cardinality | attribute_Final | attribute_Internal | attribute_Inverse | attribute_Required | attribute_SQLFieldname | attribute_Private | attribute_OnDelete
Method RelationshipAttribute(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..AttributeCardinality(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeFinal(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeInternal(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeInverse(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeRequired(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeSqlfieldname(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributePrivate(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeOndelete(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  relationship_attributes ::= '[' relationship_attribute ( ',' relationship_attribute )* ']'
/// summary values:[
Method RelationshipAttributes(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&(?4?)*&P
	; first rule summary P
	if '(..isStringSingle("[",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"[")  {
		if ..RelationshipAttribute(subElement,.addedElement)  {
			if ..RelationshipAttributes27RepZero(subElement,.addedElement)  {
				if ..addPunctuation(subElement,"]")  {
					set done=1 ; end compileRules
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  ( ',' relationship_attribute )*
Method RelationshipAttributes27RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..RelationshipAttributes28Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' relationship_attribute
/// summary values:,
Method RelationshipAttributes28Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..RelationshipAttribute(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  return_type_class_reference ::= class_reference [ type_parameters ]
Method ReturnTypeClassReference(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ClassReference(subElement,.addedElement)  {
		if $S(..TypeParameters(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  soap_identifier ::= identifier
Method SoapIdentifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Identifier(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  sql_field_name ::= text
Method SqlFieldName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Text(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  sql_table_name ::= 'NEEDS SQL TABLE NAME'
/// summary values:NEEDS SQL TABLE NAME
Method SqlTableName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("NEEDS SQL TABLE NAME",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"NEEDS SQL TABLE NAME")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  storage_name ::= class_item_identifier
Method StorageName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ClassItemIdentifier(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  storage_xml ::= (xml_data)*
Method StorageXml(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (?4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..StorageXml50RepZero(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  (xml_data)*
Method StorageXml50RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..StorageXml51Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

/// xml_data
Method StorageXml51Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlData(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  storage_xml_attribute ::= xml_tag_s_a 'Attribute' xml_tag_s_b identifier xml_tag_e_a 'Attribute' xml_tag_e_b
Method StorageXmlAttribute(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&K&?1Rule?&?1Rule?&?1Rule?&K&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(subElement,.addedElement)  {
		if ..addKeyword(subElement,"ATTRIBUTE")  {
			if ..XmlTagSB(subElement,.addedElement)  {
				if ..Identifier(subElement,.addedElement)  {
					if ..XmlTagEA(subElement,.addedElement)  {
						if ..addKeyword(subElement,"ATTRIBUTE")  {
							if ..XmlTagEB(subElement,.addedElement)  {
								set done=1 ; end compileRules
							}
						}
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  storage_xml_complex ::= ( storage_xml_data | storage_xml_data_location | storage_xml_default_data | storage_xml_description | storage_xml_extent_location | storage_xml_extent_size | storage_xml_id_function | storage_xml_id_location | storage_xml_index_location | storage_xml_index | storage_xml_stream_location | storage_xml_state | storage_xml_type | storage_xml_property | storage_xml_sqlmap | storage_xml_counterlocation )*
Method StorageXmlComplex(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (?4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..StorageXmlComplex52RepZero(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  ( storage_xml_data | storage_xml_data_location | storage_xml_default_data | storage_xml_description | storage_xml_extent_location | storage_xml_extent_size | storage_xml_id_function | storage_xml_id_location | storage_xml_index_location | storage_xml_index | storage_xml_stream_location | storage_xml_state | storage_xml_type | storage_xml_property | storage_xml_sqlmap | storage_xml_counterlocation )*
Method StorageXmlComplex52RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..StorageXmlComplex53Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  storage_xml_data | storage_xml_data_location | storage_xml_default_data | storage_xml_description | storage_xml_extent_location | storage_xml_extent_size | storage_xml_id_function | storage_xml_id_location | storage_xml_index_location | storage_xml_index | storage_xml_stream_location | storage_xml_state | storage_xml_type | storage_xml_property | storage_xml_sqlmap | storage_xml_counterlocation
Method StorageXmlComplex53Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..StorageXmlData(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlDataLocation(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlDefaultData(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlDescription(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlExtentLocation(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlExtentSize(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlIdFunction(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlIdLocation(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlIndexLocation(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlIndex(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlStreamLocation(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlState(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlType(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlProperty(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlSqlmap(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlCounterlocation(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  storage_xml_counterlocation ::= xml_tag_s_a 'CounterLocation' xml_tag_s_b global xml_tag_e_a 'CounterLocation' xml_tag_e_b
Method StorageXmlCounterlocation(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&K&?1Rule?&?1Rule?&?1Rule?&K&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(subElement,.addedElement)  {
		if ..addKeyword(subElement,"COUNTERLOCATION")  {
			if ..XmlTagSB(subElement,.addedElement)  {
				if ..Global(subElement,.addedElement)  {
					if ..XmlTagEA(subElement,.addedElement)  {
						if ..addKeyword(subElement,"COUNTERLOCATION")  {
							if ..XmlTagEB(subElement,.addedElement)  {
								set done=1 ; end compileRules
							}
						}
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  storage_xml_data ::= xml_tag_s_a 'Data' 'name' '=' string ( xml_tag_s_c | (xml_tag_s_b (storage_xml_dataelement)* xml_tag_e_a 'Data' xml_tag_e_b) )
Method StorageXmlData(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&K&K&P&?1Rule?&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(subElement,.addedElement)  {
		if ..addKeyword(subElement,"DATA")  {
			if ..addKeyword(subElement,"NAME")  {
				if ..addPunctuation(subElement,"=")  {
					if ..String(subElement,.addedElement)  {
						if ..StorageXmlData54Sub(subElement,.addedElement)  {
							set done=1 ; end compileRules
						}
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  xml_tag_s_c | (xml_tag_s_b (storage_xml_dataelement)* xml_tag_e_a 'Data' xml_tag_e_b)
Method StorageXmlData54Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSC(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlData55Sub(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// xml_tag_s_b (storage_xml_dataelement)* xml_tag_e_a 'Data' xml_tag_e_b
Method StorageXmlData55Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*&?1Rule?&K&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSB(subElement,.addedElement)  {
		if ..StorageXmlData56RepZero(subElement,.addedElement)  {
			if ..XmlTagEA(subElement,.addedElement)  {
				if ..addKeyword(subElement,"DATA")  {
					if ..XmlTagEB(subElement,.addedElement)  {
						set done=1 ; end compileRules
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  (storage_xml_dataelement)*
Method StorageXmlData56RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..StorageXmlData57Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

/// storage_xml_dataelement
Method StorageXmlData57Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..StorageXmlDataelement(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  storage_xml_data_delimiter ::= xml_tag_s_a 'Delimiter' xml_tag_s_b cos_expression_storage xml_tag_e_a 'Delimiter' xml_tag_e_b
Method StorageXmlDataDelimiter(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&K&?1Rule?&?1Rule?&?1Rule?&K&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(subElement,.addedElement)  {
		if ..addKeyword(subElement,"DELIMITER")  {
			if ..XmlTagSB(subElement,.addedElement)  {
				if ..CosExpressionStorage(subElement,.addedElement)  {
					if ..XmlTagEA(subElement,.addedElement)  {
						if ..addKeyword(subElement,"DELIMITER")  {
							if ..XmlTagEB(subElement,.addedElement)  {
								set done=1 ; end compileRules
							}
						}
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  storage_xml_data_location ::= xml_tag_s_a 'DataLocation'xml_tag_s_b (expression | ('{%%PARENT}' ['(' string ')'])) xml_tag_e_a 'DataLocation' xml_tag_e_b
Method StorageXmlDataLocation(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&K&?1Rule?&?1Rule?&?1Rule?&K&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(subElement,.addedElement)  {
		if ..addKeyword(subElement,"DATALOCATION")  {
			if ..XmlTagSB(subElement,.addedElement)  {
				if ..StorageXmlDataLocation64Sub(subElement,.addedElement)  {
					if ..XmlTagEA(subElement,.addedElement)  {
						if ..addKeyword(subElement,"DATALOCATION")  {
							if ..XmlTagEB(subElement,.addedElement)  {
								set done=1 ; end compileRules
							}
						}
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// expression | ('{%%PARENT}' ['(' string ')'])
Method StorageXmlDataLocation64Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlDataLocation65Sub(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// '{%%PARENT}' ['(' string ')']
/// summary values:{%%PARENT}
Method StorageXmlDataLocation65Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?4?
	; first rule summary P
	if '(..isStringSingle("{%%PARENT}",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"{%%PARENT}")  {
		if ..StorageXmlDataLocation66OptGrp(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// 
/// summary values:(
Method StorageXmlDataLocation66OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"(")  {
		if ..String(subElement,.addedElement)  {
			if ..addPunctuation(subElement,")")  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=1 /* failure rollsback but returns OK */
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  storage_xml_data_node ::= xml_tag_s_a 'Node' xml_tag_s_b (number | string) xml_tag_e_a 'Node' xml_tag_e_b
Method StorageXmlDataNode(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&K&?1Rule?&?1Rule?&?1Rule?&K&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(subElement,.addedElement)  {
		if ..addKeyword(subElement,"NODE")  {
			if ..XmlTagSB(subElement,.addedElement)  {
				if ..StorageXmlDataNode68Sub(subElement,.addedElement)  {
					if ..XmlTagEA(subElement,.addedElement)  {
						if ..addKeyword(subElement,"NODE")  {
							if ..XmlTagEB(subElement,.addedElement)  {
								set done=1 ; end compileRules
							}
						}
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// number | string
Method StorageXmlDataNode68Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Number(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..String(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  storage_xml_data_piece ::= xml_tag_s_a 'Piece' xml_tag_s_b number [ ',' number ] xml_tag_e_a 'Piece' xml_tag_e_b
Method StorageXmlDataPiece(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&K&?1Rule?&?1Rule?&?4?&?1Rule?&K&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(subElement,.addedElement)  {
		if ..addKeyword(subElement,"PIECE")  {
			if ..XmlTagSB(subElement,.addedElement)  {
				if ..Number(subElement,.addedElement)  {
					if ..StorageXmlDataPiece67OptGrp(subElement,.addedElement)  {
						if ..XmlTagEA(subElement,.addedElement)  {
							if ..addKeyword(subElement,"PIECE")  {
								if ..XmlTagEB(subElement,.addedElement)  {
									set done=1 ; end compileRules
								}
							}
						}
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// 
/// summary values:,
Method StorageXmlDataPiece67OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..Number(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=1 /* failure rollsback but returns OK */
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  storage_xml_data_position ::= xml_tag_s_a 'Value' 'name' '=' string xml_tag_s_b (storage_xml_data_position_field)* xml_tag_e_a 'Value' xml_tag_e_b
Method StorageXmlDataPosition(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&K&K&P&?1Rule?&?1Rule?&(?4?)*&?1Rule?&K&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(subElement,.addedElement)  {
		if ..addKeyword(subElement,"VALUE")  {
			if ..addKeyword(subElement,"NAME")  {
				if ..addPunctuation(subElement,"=")  {
					if ..String(subElement,.addedElement)  {
						if ..XmlTagSB(subElement,.addedElement)  {
							if ..StorageXmlDataPosition61RepZero(subElement,.addedElement)  {
								if ..XmlTagEA(subElement,.addedElement)  {
									if ..addKeyword(subElement,"VALUE")  {
										if ..XmlTagEB(subElement,.addedElement)  {
											set done=1 ; end compileRules
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  (storage_xml_data_position_field)*
Method StorageXmlDataPosition61RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..StorageXmlDataPosition62Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

/// storage_xml_data_position_field
Method StorageXmlDataPosition62Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..StorageXmlDataPositionField(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  storage_xml_data_position_field ::= xml_tag_s_a 'Value' xml_tag_s_b (identifier) xml_tag_e_a 'Value' xml_tag_e_b
Method StorageXmlDataPositionField(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&K&?1Rule?&?1Rule?&?1Rule?&K&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(subElement,.addedElement)  {
		if ..addKeyword(subElement,"VALUE")  {
			if ..XmlTagSB(subElement,.addedElement)  {
				if ..StorageXmlDataPositionField63Sub(subElement,.addedElement)  {
					if ..XmlTagEA(subElement,.addedElement)  {
						if ..addKeyword(subElement,"VALUE")  {
							if ..XmlTagEB(subElement,.addedElement)  {
								set done=1 ; end compileRules
							}
						}
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// identifier
Method StorageXmlDataPositionField63Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Identifier(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  storage_xml_data_retrieval_code ::= xml_tag_s_a 'RetrievalCode' xml_tag_s_b cos_code_block_storage xml_tag_e_a 'RetrievalCode' xml_tag_e_b
Method StorageXmlDataRetrievalCode(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&K&?1Rule?&?1Rule?&?1Rule?&K&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(subElement,.addedElement)  {
		if ..addKeyword(subElement,"RETRIEVALCODE")  {
			if ..XmlTagSB(subElement,.addedElement)  {
				if ..CosCodeBlockStorage(subElement,.addedElement)  {
					if ..XmlTagEA(subElement,.addedElement)  {
						if ..addKeyword(subElement,"RETRIEVALCODE")  {
							if ..XmlTagEB(subElement,.addedElement)  {
								set done=1 ; end compileRules
							}
						}
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  storage_xml_dataelement ::= storage_xml_attribute | storage_xml_structure | storage_xml_subscript | storage_xml_data_position | storage_xml_data_piece | storage_xml_data_node | storage_xml_data_delimiter | storage_xml_data_retrieval_code
Method StorageXmlDataelement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..StorageXmlAttribute(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlStructure(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlSubscript(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlDataPosition(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlDataPiece(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlDataNode(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlDataDelimiter(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlDataRetrievalCode(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  storage_xml_default_data ::= xml_tag_s_a 'DefaultData' xml_tag_s_b cos_expression_storage xml_tag_e_a 'DefaultData' xml_tag_e_b
Method StorageXmlDefaultData(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&K&?1Rule?&?1Rule?&?1Rule?&K&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(subElement,.addedElement)  {
		if ..addKeyword(subElement,"DEFAULTDATA")  {
			if ..XmlTagSB(subElement,.addedElement)  {
				if ..CosExpressionStorage(subElement,.addedElement)  {
					if ..XmlTagEA(subElement,.addedElement)  {
						if ..addKeyword(subElement,"DEFAULTDATA")  {
							if ..XmlTagEB(subElement,.addedElement)  {
								set done=1 ; end compileRules
							}
						}
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  storage_xml_description ::= xml_tag_s_a 'Description' xml_tag_s_b (xml_cdata | xml_content) xml_tag_e_a 'Description' xml_tag_e_b
Method StorageXmlDescription(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&K&?1Rule?&?1Rule?&?1Rule?&K&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(subElement,.addedElement)  {
		if ..addKeyword(subElement,"DESCRIPTION")  {
			if ..XmlTagSB(subElement,.addedElement)  {
				if ..StorageXmlDescription58Sub(subElement,.addedElement)  {
					if ..XmlTagEA(subElement,.addedElement)  {
						if ..addKeyword(subElement,"DESCRIPTION")  {
							if ..XmlTagEB(subElement,.addedElement)  {
								set done=1 ; end compileRules
							}
						}
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// xml_cdata | xml_content
Method StorageXmlDescription58Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlCdata(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..XmlContent(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  storage_xml_extent_location ::= xml_tag_s_a 'ExtentLocation' xml_tag_s_b global xml_tag_e_a 'ExtentLocation' xml_tag_e_b
Method StorageXmlExtentLocation(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&K&?1Rule?&?1Rule?&?1Rule?&K&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(subElement,.addedElement)  {
		if ..addKeyword(subElement,"EXTENTLOCATION")  {
			if ..XmlTagSB(subElement,.addedElement)  {
				if ..Global(subElement,.addedElement)  {
					if ..XmlTagEA(subElement,.addedElement)  {
						if ..addKeyword(subElement,"EXTENTLOCATION")  {
							if ..XmlTagEB(subElement,.addedElement)  {
								set done=1 ; end compileRules
							}
						}
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  storage_xml_extent_size ::= xml_tag_s_a 'ExtentSize' xml_tag_s_b number xml_tag_e_a 'ExtentSize' xml_tag_e_b
Method StorageXmlExtentSize(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&K&?1Rule?&?1Rule?&?1Rule?&K&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(subElement,.addedElement)  {
		if ..addKeyword(subElement,"EXTENTSIZE")  {
			if ..XmlTagSB(subElement,.addedElement)  {
				if ..Number(subElement,.addedElement)  {
					if ..XmlTagEA(subElement,.addedElement)  {
						if ..addKeyword(subElement,"EXTENTSIZE")  {
							if ..XmlTagEB(subElement,.addedElement)  {
								set done=1 ; end compileRules
							}
						}
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  storage_xml_global ::= xml_tag_s_a 'Global' xml_tag_s_b global xml_tag_e_a 'Global' xml_tag_e_b
Method StorageXmlGlobal(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&K&?1Rule?&?1Rule?&?1Rule?&K&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(subElement,.addedElement)  {
		if ..addKeyword(subElement,"GLOBAL")  {
			if ..XmlTagSB(subElement,.addedElement)  {
				if ..Global(subElement,.addedElement)  {
					if ..XmlTagEA(subElement,.addedElement)  {
						if ..addKeyword(subElement,"GLOBAL")  {
							if ..XmlTagEB(subElement,.addedElement)  {
								set done=1 ; end compileRules
							}
						}
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  storage_xml_id_function ::= xml_tag_s_a 'IdFunction' xml_tag_s_b ( 'sequence' )xml_tag_e_a 'IdFunction' xml_tag_e_b
Method StorageXmlIdFunction(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&K&?1Rule?&?1Rule?&?1Rule?&K&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(subElement,.addedElement)  {
		if ..addKeyword(subElement,"IDFUNCTION")  {
			if ..XmlTagSB(subElement,.addedElement)  {
				if ..StorageXmlIdFunction69Sub(subElement,.addedElement)  {
					if ..XmlTagEA(subElement,.addedElement)  {
						if ..addKeyword(subElement,"IDFUNCTION")  {
							if ..XmlTagEB(subElement,.addedElement)  {
								set done=1 ; end compileRules
							}
						}
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  'sequence'
/// summary values:SEQUENCE
Method StorageXmlIdFunction69Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeywordInList($lb("SEQUENCE"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	s subElement=ParentElement
	if ..addKeyword(subElement,"SEQUENCE")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  storage_xml_id_location ::= xml_tag_s_a 'IdLocation' xml_tag_s_b ( ('{%%PARENT}' ['(' string ')']) | (expression [ '(' string ')' ]) ) xml_tag_e_a 'IdLocation' xml_tag_e_b
Method StorageXmlIdLocation(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&K&?1Rule?&?1Rule?&?1Rule?&K&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(subElement,.addedElement)  {
		if ..addKeyword(subElement,"IDLOCATION")  {
			if ..XmlTagSB(subElement,.addedElement)  {
				if ..StorageXmlIdLocation70Sub(subElement,.addedElement)  {
					if ..XmlTagEA(subElement,.addedElement)  {
						if ..addKeyword(subElement,"IDLOCATION")  {
							if ..XmlTagEB(subElement,.addedElement)  {
								set done=1 ; end compileRules
							}
						}
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  ('{%%PARENT}' ['(' string ')']) | (expression [ '(' string ')' ])
Method StorageXmlIdLocation70Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..StorageXmlIdLocation71Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlIdLocation73Sub(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// '{%%PARENT}' ['(' string ')']
/// summary values:{%%PARENT}
Method StorageXmlIdLocation71Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?4?
	; first rule summary P
	if '(..isStringSingle("{%%PARENT}",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"{%%PARENT}")  {
		if ..StorageXmlIdLocation72OptGrp(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// 
/// summary values:(
Method StorageXmlIdLocation72OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"(")  {
		if ..String(subElement,.addedElement)  {
			if ..addPunctuation(subElement,")")  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=1 /* failure rollsback but returns OK */
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// expression [ '(' string ')' ]
Method StorageXmlIdLocation73Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(subElement,.addedElement)  {
		if ..StorageXmlIdLocation74OptGrp(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// 
/// summary values:(
Method StorageXmlIdLocation74OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"(")  {
		if ..String(subElement,.addedElement)  {
			if ..addPunctuation(subElement,")")  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=1 /* failure rollsback but returns OK */
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  storage_xml_index ::= xml_tag_s_a 'Index' 'name' '=' string xml_tag_s_b (storage_xml_index_sublocation)* xml_tag_e_a 'Index' xml_tag_e_b
Method StorageXmlIndex(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&K&K&P&?1Rule?&?1Rule?&(?4?)*&?1Rule?&K&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(subElement,.addedElement)  {
		if ..addKeyword(subElement,"INDEX")  {
			if ..addKeyword(subElement,"NAME")  {
				if ..addPunctuation(subElement,"=")  {
					if ..String(subElement,.addedElement)  {
						if ..XmlTagSB(subElement,.addedElement)  {
							if ..StorageXmlIndex75RepZero(subElement,.addedElement)  {
								if ..XmlTagEA(subElement,.addedElement)  {
									if ..addKeyword(subElement,"INDEX")  {
										if ..XmlTagEB(subElement,.addedElement)  {
											set done=1 ; end compileRules
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  (storage_xml_index_sublocation)*
Method StorageXmlIndex75RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..StorageXmlIndex76Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

/// storage_xml_index_sublocation
Method StorageXmlIndex76Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..StorageXmlIndexSublocation(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  storage_xml_index_location ::= xml_tag_s_a 'IndexLocation' xml_tag_s_b expression xml_tag_e_a 'IndexLocation' xml_tag_e_b
Method StorageXmlIndexLocation(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&K&?1Rule?&?1Rule?&?1Rule?&K&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(subElement,.addedElement)  {
		if ..addKeyword(subElement,"INDEXLOCATION")  {
			if ..XmlTagSB(subElement,.addedElement)  {
				if ..Expression(subElement,.addedElement)  {
					if ..XmlTagEA(subElement,.addedElement)  {
						if ..addKeyword(subElement,"INDEXLOCATION")  {
							if ..XmlTagEB(subElement,.addedElement)  {
								set done=1 ; end compileRules
							}
						}
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  storage_xml_index_sublocation ::= xml_tag_s_a 'Location' xml_tag_s_b (expression)xml_tag_e_a 'Location' xml_tag_e_b
Method StorageXmlIndexSublocation(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&K&?1Rule?&?1Rule?&?1Rule?&K&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(subElement,.addedElement)  {
		if ..addKeyword(subElement,"LOCATION")  {
			if ..XmlTagSB(subElement,.addedElement)  {
				if ..StorageXmlIndexSublocation77Sub(subElement,.addedElement)  {
					if ..XmlTagEA(subElement,.addedElement)  {
						if ..addKeyword(subElement,"LOCATION")  {
							if ..XmlTagEB(subElement,.addedElement)  {
								set done=1 ; end compileRules
							}
						}
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// expression
Method StorageXmlIndexSublocation77Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  storage_xml_property ::= storage_xml_property_empty | storage_xml_property_full
Method StorageXmlProperty(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..StorageXmlPropertyEmpty(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlPropertyFull(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  storage_xml_property_empty ::= xml_tag_s_a 'Property' 'name' '=' string xml_tag_s_b (storage_xml_property_selectivity | storage_xml_property_outlier_selectivity | storage_xml_property_fieldsize | storage_xml_property_histogram)* xml_tag_e_a 'Property' xml_tag_e_b
Method StorageXmlPropertyEmpty(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&K&K&P&?1Rule?&?1Rule?&(?4?)*&?1Rule?&K&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(subElement,.addedElement)  {
		if ..addKeyword(subElement,"PROPERTY")  {
			if ..addKeyword(subElement,"NAME")  {
				if ..addPunctuation(subElement,"=")  {
					if ..String(subElement,.addedElement)  {
						if ..XmlTagSB(subElement,.addedElement)  {
							if ..StorageXmlPropertyEmpty78RepZero(subElement,.addedElement)  {
								if ..XmlTagEA(subElement,.addedElement)  {
									if ..addKeyword(subElement,"PROPERTY")  {
										if ..XmlTagEB(subElement,.addedElement)  {
											set done=1 ; end compileRules
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  (storage_xml_property_selectivity | storage_xml_property_outlier_selectivity | storage_xml_property_fieldsize | storage_xml_property_histogram)*
Method StorageXmlPropertyEmpty78RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..StorageXmlPropertyEmpty79Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

/// storage_xml_property_selectivity | storage_xml_property_outlier_selectivity | storage_xml_property_fieldsize | storage_xml_property_histogram
Method StorageXmlPropertyEmpty79Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?|?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..StorageXmlPropertySelectivity(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlPropertyOutlierSelectivity(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlPropertyFieldsize(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlPropertyHistogram(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  storage_xml_property_fieldsize ::= xml_tag_s_a 'AverageFieldSize' xml_tag_s_b number xml_tag_e_a 'AverageFieldSize' xml_tag_e_b
Method StorageXmlPropertyFieldsize(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&K&?1Rule?&?1Rule?&?1Rule?&K&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(subElement,.addedElement)  {
		if ..addKeyword(subElement,"AVERAGEFIELDSIZE")  {
			if ..XmlTagSB(subElement,.addedElement)  {
				if ..Number(subElement,.addedElement)  {
					if ..XmlTagEA(subElement,.addedElement)  {
						if ..addKeyword(subElement,"AVERAGEFIELDSIZE")  {
							if ..XmlTagEB(subElement,.addedElement)  {
								set done=1 ; end compileRules
							}
						}
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  storage_xml_property_full ::= xml_tag_s_a 'Property' 'name' '=' string xml_tag_s_c
Method StorageXmlPropertyFull(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&K&K&P&?1Rule?&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(subElement,.addedElement)  {
		if ..addKeyword(subElement,"PROPERTY")  {
			if ..addKeyword(subElement,"NAME")  {
				if ..addPunctuation(subElement,"=")  {
					if ..String(subElement,.addedElement)  {
						if ..XmlTagSC(subElement,.addedElement)  {
							set done=1 ; end compileRules
						}
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  storage_xml_property_histogram ::= xml_tag_s_a 'Histogram' xml_tag_s_b expression xml_tag_e_a 'Histogram' xml_tag_e_b
Method StorageXmlPropertyHistogram(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&K&?1Rule?&?1Rule?&?1Rule?&K&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(subElement,.addedElement)  {
		if ..addKeyword(subElement,"HISTOGRAM")  {
			if ..XmlTagSB(subElement,.addedElement)  {
				if ..Expression(subElement,.addedElement)  {
					if ..XmlTagEA(subElement,.addedElement)  {
						if ..addKeyword(subElement,"HISTOGRAM")  {
							if ..XmlTagEB(subElement,.addedElement)  {
								set done=1 ; end compileRules
							}
						}
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  storage_xml_property_outlier_selectivity ::= xml_tag_s_a 'OutlierSelectivity' xml_tag_s_b number ':' number xml_tag_e_a 'OutlierSelectivity' xml_tag_e_b
Method StorageXmlPropertyOutlierSelectivity(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&K&?1Rule?&?1Rule?&P&?1Rule?&?1Rule?&K&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(subElement,.addedElement)  {
		if ..addKeyword(subElement,"OUTLIERSELECTIVITY")  {
			if ..XmlTagSB(subElement,.addedElement)  {
				if ..Number(subElement,.addedElement)  {
					if ..addPunctuation(subElement,":")  {
						if ..Number(subElement,.addedElement)  {
							if ..XmlTagEA(subElement,.addedElement)  {
								if ..addKeyword(subElement,"OUTLIERSELECTIVITY")  {
									if ..XmlTagEB(subElement,.addedElement)  {
										set done=1 ; end compileRules
									}
								}
							}
						}
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  storage_xml_property_selectivity ::= xml_tag_s_a 'Selectivity' xml_tag_s_b number ['%'] xml_tag_e_a 'Selectivity' xml_tag_e_b
Method StorageXmlPropertySelectivity(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&K&?1Rule?&?1Rule?&?4?&?1Rule?&K&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(subElement,.addedElement)  {
		if ..addKeyword(subElement,"SELECTIVITY")  {
			if ..XmlTagSB(subElement,.addedElement)  {
				if ..Number(subElement,.addedElement)  {
					if $S(..addPunctuation(subElement,"%") :1,1:1) {
						if ..XmlTagEA(subElement,.addedElement)  {
							if ..addKeyword(subElement,"SELECTIVITY")  {
								if ..XmlTagEB(subElement,.addedElement)  {
									set done=1 ; end compileRules
								}
							}
						}
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  storage_xml_sqlmap ::= xml_tag_s_a 'SQLMap' 'name' '=' string xml_tag_s_b (storage_xml_sqlmap_blockcount | storage_xml_data | storage_xml_global | storage_xml_sqlmap_condition | storage_xml_sqlmap_population | storage_xml_sqlmap_type | storage_xml_sqlmap_structure | storage_xml_sqlmap_subscript | storage_xml_sqlmap_rowidspec )* xml_tag_e_a 'SQLMap' xml_tag_e_b
Method StorageXmlSqlmap(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&K&K&P&?1Rule?&?1Rule?&(?4?)*&?1Rule?&K&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(subElement,.addedElement)  {
		if ..addKeyword(subElement,"SQLMAP")  {
			if ..addKeyword(subElement,"NAME")  {
				if ..addPunctuation(subElement,"=")  {
					if ..String(subElement,.addedElement)  {
						if ..XmlTagSB(subElement,.addedElement)  {
							if ..StorageXmlSqlmap80RepZero(subElement,.addedElement)  {
								if ..XmlTagEA(subElement,.addedElement)  {
									if ..addKeyword(subElement,"SQLMAP")  {
										if ..XmlTagEB(subElement,.addedElement)  {
											set done=1 ; end compileRules
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  (storage_xml_sqlmap_blockcount | storage_xml_data | storage_xml_global | storage_xml_sqlmap_condition | storage_xml_sqlmap_population | storage_xml_sqlmap_type | storage_xml_sqlmap_structure | storage_xml_sqlmap_subscript | storage_xml_sqlmap_rowidspec )*
Method StorageXmlSqlmap80RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..StorageXmlSqlmap81Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

/// storage_xml_sqlmap_blockcount | storage_xml_data | storage_xml_global | storage_xml_sqlmap_condition | storage_xml_sqlmap_population | storage_xml_sqlmap_type | storage_xml_sqlmap_structure | storage_xml_sqlmap_subscript | storage_xml_sqlmap_rowidspec
Method StorageXmlSqlmap81Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..StorageXmlSqlmapBlockcount(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlData(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlGlobal(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlSqlmapCondition(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlSqlmapPopulation(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlSqlmapType(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlSqlmapStructure(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlSqlmapSubscript(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlSqlmapRowidspec(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  storage_xml_sqlmap_blockcount ::= xml_tag_s_a 'BlockCount' xml_tag_s_b number xml_tag_e_a 'BlockCount' xml_tag_e_b
Method StorageXmlSqlmapBlockcount(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&K&?1Rule?&?1Rule?&?1Rule?&K&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(subElement,.addedElement)  {
		if ..addKeyword(subElement,"BLOCKCOUNT")  {
			if ..XmlTagSB(subElement,.addedElement)  {
				if ..Number(subElement,.addedElement)  {
					if ..XmlTagEA(subElement,.addedElement)  {
						if ..addKeyword(subElement,"BLOCKCOUNT")  {
							if ..XmlTagEB(subElement,.addedElement)  {
								set done=1 ; end compileRules
							}
						}
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  storage_xml_sqlmap_condition ::= xml_tag_s_a 'Condition' xml_tag_s_b cos_expression_storage xml_tag_e_a 'Condition' xml_tag_e_b
Method StorageXmlSqlmapCondition(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&K&?1Rule?&?1Rule?&?1Rule?&K&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(subElement,.addedElement)  {
		if ..addKeyword(subElement,"CONDITION")  {
			if ..XmlTagSB(subElement,.addedElement)  {
				if ..CosExpressionStorage(subElement,.addedElement)  {
					if ..XmlTagEA(subElement,.addedElement)  {
						if ..addKeyword(subElement,"CONDITION")  {
							if ..XmlTagEB(subElement,.addedElement)  {
								set done=1 ; end compileRules
							}
						}
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  storage_xml_sqlmap_population ::= xml_tag_s_a 'PopulationType' xml_tag_s_b identifier xml_tag_e_a 'PopulationType' xml_tag_e_b
Method StorageXmlSqlmapPopulation(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&K&?1Rule?&?1Rule?&?1Rule?&K&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(subElement,.addedElement)  {
		if ..addKeyword(subElement,"POPULATIONTYPE")  {
			if ..XmlTagSB(subElement,.addedElement)  {
				if ..Identifier(subElement,.addedElement)  {
					if ..XmlTagEA(subElement,.addedElement)  {
						if ..addKeyword(subElement,"POPULATIONTYPE")  {
							if ..XmlTagEB(subElement,.addedElement)  {
								set done=1 ; end compileRules
							}
						}
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  storage_xml_sqlmap_row_expression ::= xml_tag_s_a 'Expression' xml_tag_s_b cos_expression_storage xml_tag_e_a 'Expression' xml_tag_e_b
Method StorageXmlSqlmapRowExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&K&?1Rule?&?1Rule?&?1Rule?&K&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(subElement,.addedElement)  {
		if ..addKeyword(subElement,"EXPRESSION")  {
			if ..XmlTagSB(subElement,.addedElement)  {
				if ..CosExpressionStorage(subElement,.addedElement)  {
					if ..XmlTagEA(subElement,.addedElement)  {
						if ..addKeyword(subElement,"EXPRESSION")  {
							if ..XmlTagEB(subElement,.addedElement)  {
								set done=1 ; end compileRules
							}
						}
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  storage_xml_sqlmap_row_field ::= xml_tag_s_a 'Field' xml_tag_s_b identifier xml_tag_e_a 'Field' xml_tag_e_b
Method StorageXmlSqlmapRowField(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&K&?1Rule?&?1Rule?&?1Rule?&K&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(subElement,.addedElement)  {
		if ..addKeyword(subElement,"FIELD")  {
			if ..XmlTagSB(subElement,.addedElement)  {
				if ..Identifier(subElement,.addedElement)  {
					if ..XmlTagEA(subElement,.addedElement)  {
						if ..addKeyword(subElement,"FIELD")  {
							if ..XmlTagEB(subElement,.addedElement)  {
								set done=1 ; end compileRules
							}
						}
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  storage_xml_sqlmap_rowidspec ::= xml_tag_s_a 'RowIdSpec' 'name' '=' string xml_tag_s_b (storage_xml_sqlmap_row_expression | storage_xml_sqlmap_row_field)* xml_tag_e_a 'RowIdSpec' xml_tag_e_b
Method StorageXmlSqlmapRowidspec(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&K&K&P&?1Rule?&?1Rule?&(?4?)*&?1Rule?&K&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(subElement,.addedElement)  {
		if ..addKeyword(subElement,"ROWIDSPEC")  {
			if ..addKeyword(subElement,"NAME")  {
				if ..addPunctuation(subElement,"=")  {
					if ..String(subElement,.addedElement)  {
						if ..XmlTagSB(subElement,.addedElement)  {
							if ..StorageXmlSqlmapRowidspec85RepZero(subElement,.addedElement)  {
								if ..XmlTagEA(subElement,.addedElement)  {
									if ..addKeyword(subElement,"ROWIDSPEC")  {
										if ..XmlTagEB(subElement,.addedElement)  {
											set done=1 ; end compileRules
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  (storage_xml_sqlmap_row_expression | storage_xml_sqlmap_row_field)*
Method StorageXmlSqlmapRowidspec85RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..StorageXmlSqlmapRowidspec86Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

/// storage_xml_sqlmap_row_expression | storage_xml_sqlmap_row_field
Method StorageXmlSqlmapRowidspec86Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..StorageXmlSqlmapRowExpression(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlSqlmapRowField(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  storage_xml_sqlmap_structure ::= xml_tag_s_a 'Structure' xml_tag_s_b identifier xml_tag_e_a 'Structure' xml_tag_e_b
Method StorageXmlSqlmapStructure(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&K&?1Rule?&?1Rule?&?1Rule?&K&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(subElement,.addedElement)  {
		if ..addKeyword(subElement,"STRUCTURE")  {
			if ..XmlTagSB(subElement,.addedElement)  {
				if ..Identifier(subElement,.addedElement)  {
					if ..XmlTagEA(subElement,.addedElement)  {
						if ..addKeyword(subElement,"STRUCTURE")  {
							if ..XmlTagEB(subElement,.addedElement)  {
								set done=1 ; end compileRules
							}
						}
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  storage_xml_sqlmap_sub_accesstype ::= xml_tag_s_a 'AccessType' xml_tag_s_b identifier xml_tag_e_a 'AccessType' xml_tag_e_b
Method StorageXmlSqlmapSubAccesstype(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&K&?1Rule?&?1Rule?&?1Rule?&K&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(subElement,.addedElement)  {
		if ..addKeyword(subElement,"ACCESSTYPE")  {
			if ..XmlTagSB(subElement,.addedElement)  {
				if ..Identifier(subElement,.addedElement)  {
					if ..XmlTagEA(subElement,.addedElement)  {
						if ..addKeyword(subElement,"ACCESSTYPE")  {
							if ..XmlTagEB(subElement,.addedElement)  {
								set done=1 ; end compileRules
							}
						}
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  storage_xml_sqlmap_sub_accessvar ::= xml_tag_s_a 'Accessvar' 'name' '=' string xml_tag_s_b (storage_xml_sqlmap_sub_code storage_xml_sqlmap_sub_variable) xml_tag_e_a 'Accessvar' xml_tag_e_b
Method StorageXmlSqlmapSubAccessvar(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&K&K&P&?1Rule?&?1Rule?&?1Rule?&?1Rule?&K&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(subElement,.addedElement)  {
		if ..addKeyword(subElement,"ACCESSVAR")  {
			if ..addKeyword(subElement,"NAME")  {
				if ..addPunctuation(subElement,"=")  {
					if ..String(subElement,.addedElement)  {
						if ..XmlTagSB(subElement,.addedElement)  {
							if ..StorageXmlSqlmapSubAccessvar84Sub(subElement,.addedElement)  {
								if ..XmlTagEA(subElement,.addedElement)  {
									if ..addKeyword(subElement,"ACCESSVAR")  {
										if ..XmlTagEB(subElement,.addedElement)  {
											set done=1 ; end compileRules
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// storage_xml_sqlmap_sub_code storage_xml_sqlmap_sub_variable
Method StorageXmlSqlmapSubAccessvar84Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..StorageXmlSqlmapSubCode(subElement,.addedElement)  {
		if ..StorageXmlSqlmapSubVariable(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  storage_xml_sqlmap_sub_code ::= xml_tag_s_a 'Code' xml_tag_s_b cos_code_block_storage xml_tag_e_a 'Code' xml_tag_e_b
Method StorageXmlSqlmapSubCode(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&K&?1Rule?&?1Rule?&?1Rule?&K&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(subElement,.addedElement)  {
		if ..addKeyword(subElement,"CODE")  {
			if ..XmlTagSB(subElement,.addedElement)  {
				if ..CosCodeBlockStorage(subElement,.addedElement)  {
					if ..XmlTagEA(subElement,.addedElement)  {
						if ..addKeyword(subElement,"CODE")  {
							if ..XmlTagEB(subElement,.addedElement)  {
								set done=1 ; end compileRules
							}
						}
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  storage_xml_sqlmap_sub_dataaccess ::= xml_tag_s_a 'DataAccess' xml_tag_s_b cos_expression_storage xml_tag_e_a 'DataAccess' xml_tag_e_b
Method StorageXmlSqlmapSubDataaccess(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&K&?1Rule?&?1Rule?&?1Rule?&K&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(subElement,.addedElement)  {
		if ..addKeyword(subElement,"DATAACCESS")  {
			if ..XmlTagSB(subElement,.addedElement)  {
				if ..CosExpressionStorage(subElement,.addedElement)  {
					if ..XmlTagEA(subElement,.addedElement)  {
						if ..addKeyword(subElement,"DATAACCESS")  {
							if ..XmlTagEB(subElement,.addedElement)  {
								set done=1 ; end compileRules
							}
						}
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  storage_xml_sqlmap_sub_expression ::= xml_tag_s_a 'Expression' xml_tag_s_b cos_expression_storage xml_tag_e_a 'Expression' xml_tag_e_b
Method StorageXmlSqlmapSubExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&K&?1Rule?&?1Rule?&?1Rule?&K&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(subElement,.addedElement)  {
		if ..addKeyword(subElement,"EXPRESSION")  {
			if ..XmlTagSB(subElement,.addedElement)  {
				if ..CosExpressionStorage(subElement,.addedElement)  {
					if ..XmlTagEA(subElement,.addedElement)  {
						if ..addKeyword(subElement,"EXPRESSION")  {
							if ..XmlTagEB(subElement,.addedElement)  {
								set done=1 ; end compileRules
							}
						}
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  storage_xml_sqlmap_sub_invcond ::= xml_tag_s_a 'InvalidCondition' 'name' '=' string xml_tag_s_b storage_xml_sqlmap_sub_expression xml_tag_e_a 'Invalidcondition' xml_tag_e_b
Method StorageXmlSqlmapSubInvcond(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&K&K&P&?1Rule?&?1Rule?&?1Rule?&?1Rule?&K&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(subElement,.addedElement)  {
		if ..addKeyword(subElement,"INVALIDCONDITION")  {
			if ..addKeyword(subElement,"NAME")  {
				if ..addPunctuation(subElement,"=")  {
					if ..String(subElement,.addedElement)  {
						if ..XmlTagSB(subElement,.addedElement)  {
							if ..StorageXmlSqlmapSubExpression(subElement,.addedElement)  {
								if ..XmlTagEA(subElement,.addedElement)  {
									if ..addKeyword(subElement,"INVALIDCONDITION")  {
										if ..XmlTagEB(subElement,.addedElement)  {
											set done=1 ; end compileRules
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  storage_xml_sqlmap_sub_loopinitval ::= xml_tag_s_a 'LoopInitValue' xml_tag_s_b cos_expression_storage xml_tag_e_a 'LoopInitValue' xml_tag_e_b
Method StorageXmlSqlmapSubLoopinitval(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&K&?1Rule?&?1Rule?&?1Rule?&K&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(subElement,.addedElement)  {
		if ..addKeyword(subElement,"LOOPINITVALUE")  {
			if ..XmlTagSB(subElement,.addedElement)  {
				if ..CosExpressionStorage(subElement,.addedElement)  {
					if ..XmlTagEA(subElement,.addedElement)  {
						if ..addKeyword(subElement,"LOOPINITVALUE")  {
							if ..XmlTagEB(subElement,.addedElement)  {
								set done=1 ; end compileRules
							}
						}
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  storage_xml_sqlmap_sub_next_code ::= xml_tag_s_a 'NextCode' xml_tag_s_b cos_code_block_storage xml_tag_e_a 'NextCode' xml_tag_e_b
Method StorageXmlSqlmapSubNextCode(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&K&?1Rule?&?1Rule?&?1Rule?&K&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(subElement,.addedElement)  {
		if ..addKeyword(subElement,"NEXTCODE")  {
			if ..XmlTagSB(subElement,.addedElement)  {
				if ..CosCodeBlockStorage(subElement,.addedElement)  {
					if ..XmlTagEA(subElement,.addedElement)  {
						if ..addKeyword(subElement,"NEXTCODE")  {
							if ..XmlTagEB(subElement,.addedElement)  {
								set done=1 ; end compileRules
							}
						}
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  storage_xml_sqlmap_sub_variable ::= xml_tag_s_a 'Variable' xml_tag_s_b cos_expression_storage xml_tag_e_a 'Variable' xml_tag_e_b
Method StorageXmlSqlmapSubVariable(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&K&?1Rule?&?1Rule?&?1Rule?&K&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(subElement,.addedElement)  {
		if ..addKeyword(subElement,"VARIABLE")  {
			if ..XmlTagSB(subElement,.addedElement)  {
				if ..CosExpressionStorage(subElement,.addedElement)  {
					if ..XmlTagEA(subElement,.addedElement)  {
						if ..addKeyword(subElement,"VARIABLE")  {
							if ..XmlTagEB(subElement,.addedElement)  {
								set done=1 ; end compileRules
							}
						}
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  storage_xml_sqlmap_subscript ::= xml_tag_s_a 'Subscript' 'name' '=' string xml_tag_s_b (storage_xml_sqlmap_sub_expression | storage_xml_sqlmap_sub_accessvar | storage_xml_sqlmap_sub_accesstype | storage_xml_sqlmap_sub_invcond | storage_xml_data_delimiter | storage_xml_sqlmap_sub_loopinitval | storage_xml_sqlmap_sub_dataaccess | storage_xml_sqlmap_sub_next_code )* xml_tag_e_a 'Subscript' xml_tag_e_b
Method StorageXmlSqlmapSubscript(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&K&K&P&?1Rule?&?1Rule?&(?4?)*&?1Rule?&K&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(subElement,.addedElement)  {
		if ..addKeyword(subElement,"SUBSCRIPT")  {
			if ..addKeyword(subElement,"NAME")  {
				if ..addPunctuation(subElement,"=")  {
					if ..String(subElement,.addedElement)  {
						if ..XmlTagSB(subElement,.addedElement)  {
							if ..StorageXmlSqlmapSubscript82RepZero(subElement,.addedElement)  {
								if ..XmlTagEA(subElement,.addedElement)  {
									if ..addKeyword(subElement,"SUBSCRIPT")  {
										if ..XmlTagEB(subElement,.addedElement)  {
											set done=1 ; end compileRules
										}
									}
								}
							}
						}
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  (storage_xml_sqlmap_sub_expression | storage_xml_sqlmap_sub_accessvar | storage_xml_sqlmap_sub_accesstype | storage_xml_sqlmap_sub_invcond | storage_xml_data_delimiter | storage_xml_sqlmap_sub_loopinitval | storage_xml_sqlmap_sub_dataaccess | storage_xml_sqlmap_sub_next_code )*
Method StorageXmlSqlmapSubscript82RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..StorageXmlSqlmapSubscript83Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

/// storage_xml_sqlmap_sub_expression | storage_xml_sqlmap_sub_accessvar | storage_xml_sqlmap_sub_accesstype | storage_xml_sqlmap_sub_invcond | storage_xml_data_delimiter | storage_xml_sqlmap_sub_loopinitval | storage_xml_sqlmap_sub_dataaccess | storage_xml_sqlmap_sub_next_code
Method StorageXmlSqlmapSubscript83Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..StorageXmlSqlmapSubExpression(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlSqlmapSubAccessvar(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlSqlmapSubAccesstype(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlSqlmapSubInvcond(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlDataDelimiter(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlSqlmapSubLoopinitval(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlSqlmapSubDataaccess(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlSqlmapSubNextCode(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  storage_xml_sqlmap_type ::= xml_tag_s_a 'Type' xml_tag_s_b identifier xml_tag_e_a 'Type' xml_tag_e_b
Method StorageXmlSqlmapType(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&K&?1Rule?&?1Rule?&?1Rule?&K&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(subElement,.addedElement)  {
		if ..addKeyword(subElement,"TYPE")  {
			if ..XmlTagSB(subElement,.addedElement)  {
				if ..Identifier(subElement,.addedElement)  {
					if ..XmlTagEA(subElement,.addedElement)  {
						if ..addKeyword(subElement,"TYPE")  {
							if ..XmlTagEB(subElement,.addedElement)  {
								set done=1 ; end compileRules
							}
						}
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  storage_xml_state ::= xml_tag_s_a 'State' xml_tag_s_b identifier xml_tag_e_a 'State' xml_tag_e_b
Method StorageXmlState(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&K&?1Rule?&?1Rule?&?1Rule?&K&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(subElement,.addedElement)  {
		if ..addKeyword(subElement,"STATE")  {
			if ..XmlTagSB(subElement,.addedElement)  {
				if ..Identifier(subElement,.addedElement)  {
					if ..XmlTagEA(subElement,.addedElement)  {
						if ..addKeyword(subElement,"STATE")  {
							if ..XmlTagEB(subElement,.addedElement)  {
								set done=1 ; end compileRules
							}
						}
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  storage_xml_stream_location ::= xml_tag_s_a 'StreamLocation' xml_tag_s_b expression xml_tag_e_a 'StreamLocation' xml_tag_e_b
Method StorageXmlStreamLocation(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&K&?1Rule?&?1Rule?&?1Rule?&K&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(subElement,.addedElement)  {
		if ..addKeyword(subElement,"STREAMLOCATION")  {
			if ..XmlTagSB(subElement,.addedElement)  {
				if ..Expression(subElement,.addedElement)  {
					if ..XmlTagEA(subElement,.addedElement)  {
						if ..addKeyword(subElement,"STREAMLOCATION")  {
							if ..XmlTagEB(subElement,.addedElement)  {
								set done=1 ; end compileRules
							}
						}
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  storage_xml_structure ::= xml_tag_s_a 'Structure' xml_tag_s_b ( 'subnode' | 'node') xml_tag_e_a 'Structure' xml_tag_e_b
Method StorageXmlStructure(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&K&?1Rule?&?1Rule?&?1Rule?&K&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(subElement,.addedElement)  {
		if ..addKeyword(subElement,"STRUCTURE")  {
			if ..XmlTagSB(subElement,.addedElement)  {
				if ..StorageXmlStructure59Sub(subElement,.addedElement)  {
					if ..XmlTagEA(subElement,.addedElement)  {
						if ..addKeyword(subElement,"STRUCTURE")  {
							if ..XmlTagEB(subElement,.addedElement)  {
								set done=1 ; end compileRules
							}
						}
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  'subnode' | 'node'
/// summary values:SUBNODE,NODE
Method StorageXmlStructure59Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K
	if '(..isKeywordInList($lb("SUBNODE","NODE"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	s subElement=ParentElement
	if ..addKeyword(subElement,"SUBNODE")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"NODE")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  storage_xml_subscript ::= xml_tag_s_a 'Subscript' xml_tag_s_b (string | number) xml_tag_e_a 'Subscript' xml_tag_e_b
Method StorageXmlSubscript(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&K&?1Rule?&?1Rule?&?1Rule?&K&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(subElement,.addedElement)  {
		if ..addKeyword(subElement,"SUBSCRIPT")  {
			if ..XmlTagSB(subElement,.addedElement)  {
				if ..StorageXmlSubscript60Sub(subElement,.addedElement)  {
					if ..XmlTagEA(subElement,.addedElement)  {
						if ..addKeyword(subElement,"SUBSCRIPT")  {
							if ..XmlTagEB(subElement,.addedElement)  {
								set done=1 ; end compileRules
							}
						}
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// string | number
Method StorageXmlSubscript60Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..String(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Number(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  storage_xml_type ::= xml_tag_s_a 'Type' xml_tag_s_b class_reference xml_tag_e_a 'Type' xml_tag_e_b
Method StorageXmlType(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&K&?1Rule?&?1Rule?&?1Rule?&K&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(subElement,.addedElement)  {
		if ..addKeyword(subElement,"TYPE")  {
			if ..XmlTagSB(subElement,.addedElement)  {
				if ..ClassReference(subElement,.addedElement)  {
					if ..XmlTagEA(subElement,.addedElement)  {
						if ..addKeyword(subElement,"TYPE")  {
							if ..XmlTagEB(subElement,.addedElement)  {
								set done=1 ; end compileRules
							}
						}
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  string ::= '""' | ('"' 'regexp:[^\"\r\n]*' '"')
Method String(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"""""")  {
		set done=1 ; or
	} elseif ..String188Sub(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// '"' 'regexp:[^\"\r\n]*' '"'
/// summary values:""
Method String188Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&P&P
	; first rule summary P
	if '(..isStringSingle("""",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"""")  {
		if ..addPunctuation(subElement,"regexp:[^\""\r\n]*")  {
			if ..addPunctuation(subElement,"""")  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  tablename ::= identifier
Method Tablename(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Identifier(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  text ::= 'regexp:.*'
/// summary values:REGEXP:.*
Method Text(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("REGEXP:.*",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"regexp:.*")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  text_brace_block ::= '{' text '}'
/// summary values:{
Method TextBraceBlock(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&P
	; first rule summary P
	if '(..isStringSingle("{",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"{")  {
		if ..Text(subElement,.addedElement)  {
			if ..addPunctuation(subElement,"}")  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  text_in_curly ::= 'NEEDS TEXT IN CURLY'
/// summary values:NEEDS TEXT IN CURLY
Method TextInCurly(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("NEEDS TEXT IN CURLY",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"NEEDS TEXT IN CURLY")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  time_value ::= 'after' | 'before'
/// summary values:AFTER,BEFORE
Method TimeValue(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K
	if '(..isKeywordInList($lb("AFTER","BEFORE"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"AFTER")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"BEFORE")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  trigger_attribute ::= attribute_CodeMode | attribute_Event | attribute_Final | attribute_ForEach | attribute_Internal | attribute_Language | attribute_NewTable | attribute_OldTable | attribute_Order | attribute_SQLName | attribute_Time | attribute_UpdateColumnList
Method TriggerAttribute(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..AttributeCodemode(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeEvent(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeFinal(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeForeach(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeInternal(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeLanguage(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeNewtable(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeOldtable(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeOrder(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeSqlname(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeTime(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeUpdatecolumnlist(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  trigger_attribute_list ::= '[' trigger_attribute ( ',' trigger_attribute )* ']'
/// summary values:[
Method TriggerAttributeList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&(?4?)*&P
	; first rule summary P
	if '(..isStringSingle("[",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"[")  {
		if ..TriggerAttribute(subElement,.addedElement)  {
			if ..TriggerAttributeList110RepZero(subElement,.addedElement)  {
				if ..addPunctuation(subElement,"]")  {
					set done=1 ; end compileRules
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  ( ',' trigger_attribute )*
Method TriggerAttributeList110RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..TriggerAttributeList111Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' trigger_attribute
/// summary values:,
Method TriggerAttributeList111Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..TriggerAttribute(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  trigger_code_block ::= cos_code_block_trigger
Method TriggerCodeBlock(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CosCodeBlockTrigger(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  trigger_name ::= class_item_identifier
Method TriggerName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ClassItemIdentifier(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  type_class_reference ::= class_reference [ type_parameters ]
Method TypeClassReference(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ClassReference(subElement,.addedElement)  {
		if $S(..TypeParameters(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  type_parameter_item ::= class_item_identifier '=' ( string | number )
Method TypeParameterItem(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&P&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ClassItemIdentifier(subElement,.addedElement)  {
		if ..addPunctuation(subElement,"=")  {
			if ..TypeParameterItem21Sub(subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  string | number
Method TypeParameterItem21Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..String(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Number(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  type_parameters ::= '(' type_parameters_list ')'
/// summary values:(
Method TypeParameters(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"(")  {
		if ..TypeParametersList(subElement,.addedElement)  {
			if ..addPunctuation(subElement,")")  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  type_parameters_list ::= type_parameter_item (',' type_parameter_item)*
Method TypeParametersList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..TypeParameterItem(subElement,.addedElement)  {
		if ..TypeParametersList19RepZero(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  (',' type_parameter_item)*
Method TypeParametersList19RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..TypeParametersList20Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

/// ',' type_parameter_item
/// summary values:,
Method TypeParametersList20Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..TypeParameterItem(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  udl_program ::= udl_statement
Method UdlProgram(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..UdlStatement(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  udl_statement ::= ( import_definition | include_generator_definition | include_definition )* class_definition
Method UdlStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (?4?)*&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..UdlStatement1RepZero(subElement,.addedElement)  {
		if ..ClassDefinition(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  ( import_definition | include_generator_definition | include_definition )*
Method UdlStatement1RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..UdlStatement2Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  import_definition | include_generator_definition | include_definition
Method UdlStatement2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ImportDefinition(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..IncludeGeneratorDefinition(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..IncludeDefinition(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  variable ::= variable_identifier
Method Variable(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..VariableIdentifier(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  variable_identifier ::= 'regexp:(((\%[a-zA-Z0-9])|(\$[a-zA-Z])|[a-zA-Z])[a-zA-Z0-9\.]*)'
/// summary values:REGEXP:(((\%[A-ZA-Z0-9])|(\$[A-ZA-Z])|[A-ZA-Z])[A-ZA-Z0-9\.]*)
Method VariableIdentifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("REGEXP:(((\%[A-ZA-Z0-9])|(\$[A-ZA-Z])|[A-ZA-Z])[A-ZA-Z0-9\.]*)",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"regexp:(((\%[a-zA-Z0-9])|(\$[a-zA-Z])|[a-zA-Z])[a-zA-Z0-9\.]*)")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  variable_set ::= variable_identifier
Method VariableSet(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..VariableIdentifier(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  xdata_attributes ::= attribute_Internal | attribute_MimeType | attribute_SchemaSpec | attribute_XMLNamespace
Method XdataAttributes(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?|?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..AttributeInternal(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeMimetype(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeSchemaspec(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeXmlnamespace(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  xdata_json ::= xdata_json_object | xdata_json_array | xdata_json_prim
Method XdataJson(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XdataJsonObject(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..XdataJsonArray(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..XdataJsonPrim(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  xdata_json_array ::= '[' [ xdata_json_array_items ] ']'
/// summary values:[
Method XdataJsonArray(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?4?&P
	; first rule summary P
	if '(..isStringSingle("[",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"[")  {
		if $S(..XdataJsonArrayItems(subElement,.addedElement) :1,1:1) {
			if ..addPunctuation(subElement,"]")  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  xdata_json_array_items ::= xdata_json (',' xdata_json)*
Method XdataJsonArrayItems(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XdataJson(subElement,.addedElement)  {
		if ..XdataJsonArrayItems108RepZero(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  (',' xdata_json)*
Method XdataJsonArrayItems108RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..XdataJsonArrayItems109Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

/// ',' xdata_json
/// summary values:,
Method XdataJsonArrayItems109Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..XdataJson(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  xdata_json_object ::= '{' [ xdata_json_pair ( ',' xdata_json_pair )*] '}'
/// summary values:{
Method XdataJsonObject(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?4?&P
	; first rule summary P
	if '(..isStringSingle("{",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"{")  {
		if ..XdataJsonObject105OptGrp(subElement,.addedElement)  {
			if ..addPunctuation(subElement,"}")  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method XdataJsonObject105OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XdataJsonPair(subElement,.addedElement)  {
		if ..XdataJsonObject106RepZero(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=1 /* failure rollsback but returns OK */
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  ( ',' xdata_json_pair )*
Method XdataJsonObject106RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..XdataJsonObject107Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' xdata_json_pair
/// summary values:,
Method XdataJsonObject107Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..XdataJsonPair(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  xdata_json_pair ::= json_string ':' xdata_json
Method XdataJsonPair(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&P&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..JsonString(subElement,.addedElement)  {
		if ..addPunctuation(subElement,":")  {
			if ..XdataJson(subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  xdata_json_prim ::= number | json_string | 'true' | 'false' | 'null'
Method XdataJsonPrim(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?|K|K|K
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Number(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..JsonString(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"TRUE")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"FALSE")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"NULL")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  xdata_name ::= class_item_identifier
Method XdataName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ClassItemIdentifier(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  xdata_text ::= text
Method XdataText(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Text(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  xdata_xml ::= [xml_xml] xml_data
Method XdataXml(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..XmlXml(subElement,.addedElement) :1,1:1) {
		if ..XmlData(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  xml_attribute ::= [ xml_schema ':' ] xml_attribute_name '=' xml_attribute_value
Method XmlAttribute(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?&?1Rule?&P&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlAttribute102OptGrp(subElement,.addedElement)  {
		if ..XmlAttributeName(subElement,.addedElement)  {
			if ..addPunctuation(subElement,"=")  {
				if ..XmlAttributeValue(subElement,.addedElement)  {
					set done=1 ; end compileRules
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method XmlAttribute102OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&P
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlSchema(subElement,.addedElement)  {
		if ..addPunctuation(subElement,":")  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=1 /* failure rollsback but returns OK */
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  xml_attribute_name ::= xml_identifier
Method XmlAttributeName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlIdentifier(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  xml_attribute_value ::= string | number
Method XmlAttributeValue(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..String(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Number(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  xml_cdata ::= '<' '!' '[CDATA[' xml_cdata_text ']]' '>'
/// summary values:<
Method XmlCdata(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&P&P&?1Rule?&P&P
	; first rule summary P
	if '(..isStringSingle("<",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"<")  {
		if ..addPunctuation(subElement,"!")  {
			if ..addPunctuation(subElement,"[CDATA[")  {
				if ..XmlCdataText(subElement,.addedElement)  {
					if ..addPunctuation(subElement,"]]")  {
						if ..addPunctuation(subElement,">")  {
							set done=1 ; end compileRules
						}
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  xml_cdata_text ::= 'NEED XML CDATA TEXT THAT READS UP TO END OF CDATA'
/// summary values:NEED XML CDATA TEXT THAT READS UP TO END OF CDATA
Method XmlCdataText(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("NEED XML CDATA TEXT THAT READS UP TO END OF CDATA",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"NEED XML CDATA TEXT THAT READS UP TO END OF CDATA")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  xml_content ::= text
Method XmlContent(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Text(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  xml_data ::= xml_cdata | ( xml_start_tag ( xml_data | xml_content)* xml_end_tag) | xml_empty_tag
Method XmlData(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlCdata(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..XmlData94Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..XmlEmptyTag(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  xml_start_tag ( xml_data | xml_content)* xml_end_tag
Method XmlData94Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlStartTag(subElement,.addedElement)  {
		if ..XmlData95RepZero(subElement,.addedElement)  {
			if ..XmlEndTag(subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  ( xml_data | xml_content)*
Method XmlData95RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..XmlData96Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  xml_data | xml_content
Method XmlData96Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlData(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..XmlContent(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  xml_empty_tag ::= xml_tag_s_a xml_tag_ns_name (xml_attribute)* xml_tag_s_c
Method XmlEmptyTag(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?1Rule?&(?4?)*&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(subElement,.addedElement)  {
		if ..XmlTagNsName(subElement,.addedElement)  {
			if ..XmlEmptyTag99RepZero(subElement,.addedElement)  {
				if ..XmlTagSC(subElement,.addedElement)  {
					set done=1 ; end compileRules
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// xml_attribute
Method XmlEmptyTag100Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlAttribute(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  (xml_attribute)*
Method XmlEmptyTag99RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..XmlEmptyTag100Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  xml_end_tag ::= xml_tag_e_a xml_tag_ns_name xml_tag_e_b
Method XmlEndTag(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?1Rule?&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagEA(subElement,.addedElement)  {
		if ..XmlTagNsName(subElement,.addedElement)  {
			if ..XmlTagEB(subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  xml_identifier ::= 'NEEDS XML identifier'
/// summary values:NEEDS XML IDENTIFIER
Method XmlIdentifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("NEEDS XML IDENTIFIER",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"NEEDS XML identifier")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  xml_schema ::= xml_identifier
Method XmlSchema(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlIdentifier(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  xml_start_tag ::= xml_tag_s_a xml_tag_ns_name (xml_attribute)* xml_tag_s_b
Method XmlStartTag(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?1Rule?&(?4?)*&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(subElement,.addedElement)  {
		if ..XmlTagNsName(subElement,.addedElement)  {
			if ..XmlStartTag97RepZero(subElement,.addedElement)  {
				if ..XmlTagSB(subElement,.addedElement)  {
					set done=1 ; end compileRules
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  (xml_attribute)*
Method XmlStartTag97RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..XmlStartTag98Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

/// xml_attribute
Method XmlStartTag98Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlAttribute(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  xml_tag_e_a ::= '</'
/// summary values:</
Method XmlTagEA(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("</",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"</")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  xml_tag_e_b ::= '>'
/// summary values:>
Method XmlTagEB(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle(">",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,">")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  xml_tag_name ::= xml_identifier
Method XmlTagName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlIdentifier(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  xml_tag_ns_name ::= [ xml_schema ':'] xml_tag_name
Method XmlTagNsName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagNsName101OptGrp(subElement,.addedElement)  {
		if ..XmlTagName(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method XmlTagNsName101OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&P
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlSchema(subElement,.addedElement)  {
		if ..addPunctuation(subElement,":")  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=1 /* failure rollsback but returns OK */
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  xml_tag_s_a ::= '<'
/// summary values:<
Method XmlTagSA(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("<",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"<")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  xml_tag_s_b ::= '>'
/// summary values:>
Method XmlTagSB(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle(">",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,">")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  xml_tag_s_c ::= '/>'
/// summary values:/>
Method XmlTagSC(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("/>",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"/>")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  xml_xml ::= xml_tag_s_a '?xml' (xml_attribute)* '?' xml_tag_s_b
Method XmlXml(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&P&(?4?)*&P&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(subElement,.addedElement)  {
		if ..addPunctuation(subElement,"?xml")  {
			if ..XmlXml103RepZero(subElement,.addedElement)  {
				if ..addPunctuation(subElement,"?")  {
					if ..XmlTagSB(subElement,.addedElement)  {
						set done=1 ; end compileRules
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  (xml_attribute)*
Method XmlXml103RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..XmlXml104Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

/// xml_attribute
Method XmlXml104Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlAttribute(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method newElement(Type As %String) As PXW.DEV.BNF.Elements.ClassDefinition
{
	quit ##class(PXW.DEV.BNF.Elements.ClassDefinition).%New(Type)
}

}
