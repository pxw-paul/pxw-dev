/// Created: 2025-10-31 09:11:53 PXW.DEV.BNF.Compilers.Compiler1
Class PXW.DEV.BNF.GEN.ClassDefinition Extends PXW.DEV.BNF.super [ ProcedureBlock ]
{

Parameter KeywordPattern = "1.A.(1""/"".A)";

Parameter Keywords = "ABSTRACT,ACCESSTYPE,ACCESSVAR,AFTER,ALIASES,ALPHAUP,ARRAY,AS,ATTRIBUTE,AVERAGEFIELDSIZE,BASIC,BEFORE,BIGINT,BINARY,BINARYSTREAM,BIT,BITMAP,BITSLICE,BLOCKCOUNT,BOOLEAN,BYREF,BYVAL,CACHE,CALCULATED,CALL,CARDINALITY,CASCADE,CHARACTERSTREAM,CHILDREN,CLASS,CLASSMETHOD,CLASSTYPE,CLIENTDATATYPE,CLIENTMETHOD,CLIENTNAME,CODE,CODEMODE,COLLATEDKEY,COMPILEAFTER,CONDITION,CONFIGVALUE,CONSTRAINT,COSEXPRESSION,COUNTERLOCATION,CPP,CURRENCY,DATA,DATAACCESS,DATALOCATION,DATATYPE,DATE,DDLALLOWED,DECIMAL,DEFAULTDATA,DELETE,DELIMITED,DELIMITER,DEPENDSON,DEPRECATED,DESCRIPTION,DOCUMENT,DONOTUSE,DOUBLE,DYNAMIC,E,EMBEDDEDCLASS,ENCODED,ENUM,ENUMEDIT,EVENT,EXACT,EXPRESSION,EXTENDS,EXTENT,EXTENTLOCATION,EXTENTSIZE,EXTERNALPROCNAME,FALSE,FDATE,FIELD,FINAL,FLAGS,FMDATE,FMTIMESTAMP,FORCEGENERATE,FOREACH,FOREIGNKEY,FTIMESTAMP,GENERATEAFTER,GENERATEDBY,GENERATOR,GLOBAL,GUID,HANDLE,HIDDEN,HISTOGRAM,IDENTITY,IDFUNCTION,IDKEY,IDLOCATION,IMPORT,INCLUDE,INCLUDEGENERATOR,INDEX,INDEXLOCATION,INHERITANCE,INITIALEXPRESSION,INSERT,INSERT/DELETE,INSERT/UPDATE,INSERT/UPDATE/DELETE,INTEGER,INTERNAL,INVALIDCONDITION,INVERSE,JAVA,JAVASCRIPT,KEY,LANGUAGE,LEFT,LEGACYINSTANCECONTEXT,LIST,LITERAL,LOCATION,LONGVARBINARY,LONGVARCHAR,LOOPINITVALUE,MANY,MEMBERSUPER,METHOD,MIMETYPE,MINUS,MULTIDIMENSIONAL,MVBASIC,MVDATE,MVR,NAME,NEWTABLE,NEXTCODE,NOACTION,NOCHECK,NOCONTEXT,NODE,NOEXTENT,NOT,NOTINHERITABLE,NULL,NUMERIC,OBJECTGENERATOR,OBJECTSCRIPT,ODBCTYPE,OF,OLDTABLE,ON,ONDELETE,ONE,ONUPDATE,ORDER,OUTLIERSELECTIVITY,OUTPUT,OWNER,PARAMETER,PARENT,PERSISTENT,PIECE,PLACEAFTER,PLUS,POPULATIONTYPE,POSIXTIME,POSIXTS,PRIMARYKEY,PRIVATE,PROCEDUREBLOCK,PROJECTION,PROPERTY,PROPERTYCLASS,PUBLICLIST,PYTHON,QUERY,RCP,READONLY,REFERENCES,RELATIONSHIP,REQUIRED,RESULTSET,RETRIEVALCODE,RETURNRESULTSETS,RIGHT,ROW,ROW/OBJECT,ROWIDSPEC,SCHEMASPEC,SELECTIVITY,SEQUENCE,SERIAL,SERVERONLY,SETDEFAULT,SETNULL,SMALLINT,SOAPACTION,SOAPBINDINGSTYLE,SOAPBODYUSE,SOAPMESSAGENAME,SOAPNAMESPACE,SOAPREQUESTMESSAGE,SOAPTYPENAMESPACE,SPACE,SQLCATEGORY,SQLCOLUMNNUMBER,SQLCOMPUTECODE,SQLCOMPUTED,SQLCOMPUTEONCHANGE,SQLFIELDNAME,SQLLISTDELIMITER,SQLLISTTYPE,SQLMAP,SQLNAME,SQLPROC,SQLROWIDNAME,SQLROWIDPRIVATE,SQLSTRING,SQLTABLENAME,SQLUPPER,SQLVIEW,SQLVIEWNAME,STATE,STATEMENT,STATUS,STORAGE,STORAGESTRATEGY,STREAM,STREAMLOCATION,STRING,STRUCT,STRUCTURE,SUBNODE,SUBSCRIPT,SYSTEM,TIME,TIMESTAMP,TINYINT,TRANSIENT,TRIGGER,TRUE,TRUNCATE,TSQL,TYPE,UNIQUE,UPDATE,UPDATE/DELETE,UPDATECOLUMNLIST,UPPER,VALUE,VARBINARY,VARCHAR,VARIABLE,VECTOR,VIEW,VIEWQUERY,WEBMETHOD,XDATA,XMLNAMESPACE,ZENMETHOD";

///  alias_identifier ::= 'NEED ALIAS IDENT'
/// summary values:NEED ALIAS IDENT
/// summary=P
Method AliasIdentifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("NEED ALIAS IDENT",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"NEED ALIAS IDENT")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  as_type_class_reference ::= 'as' type_class_reference
/// summary values:AS
/// summary=K&C
Method AsTypeClassReference(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C
	if '(..isKeyword("AS",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"AS")  {
		if ..TypeClassReference(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  attribute_Abstract ::= 'abstract'
/// summary values:ABSTRACT
/// summary=K
Method AttributeAbstract(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeyword("ABSTRACT",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"ABSTRACT")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  attribute_Aliases ::= 'aliases' '=' '{' attribute_AliasList '}'
/// summary values:ALIASES
/// summary=K&P&P&C&P
Method AttributeAliases(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&P&C&P
	if '(..isKeyword("ALIASES",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"ALIASES")  {
		if ..addPunctuation(.subElement,"=")  {
			if ..addPunctuation(.subElement,"{")  {
				if ..AttributeAliaslist(.subElement,.addedElement)  {
					if ..addPunctuation(.subElement,"}")  {
						set done=1 ; end compileRules
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  attribute_AliasList ::= attribute_OneAlias ( ',' attribute_OneAlias )*
/// summary=C&(?4punctuation:4?)*
Method AttributeAliaslist(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..AttributeOnealias(.subElement,.addedElement)  {
		if ..AttributeAliaslist121RepZero(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ( ',' attribute_OneAlias )*
Method AttributeAliaslist121RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..AttributeAliaslist122Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' attribute_OneAlias
/// summary values:,
/// summary=P&C
Method AttributeAliaslist122Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..AttributeOnealias(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	quit ok
}

///  attribute_Calculated ::= 'calculated'
/// summary values:CALCULATED
/// summary=K
Method AttributeCalculated(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeyword("CALCULATED",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"CALCULATED")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  attribute_Cardinality ::= 'cardinality' '=' attribute_Cardinality_type
/// summary values:CARDINALITY
/// summary=K&P&C
Method AttributeCardinality(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&C
	if '(..isKeyword("CARDINALITY",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"CARDINALITY")  {
		if ..addPunctuation(.subElement,"=")  {
			if ..AttributeCardinalityType(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  attribute_Cardinality_type ::= 'one' | 'many' | 'parent' | 'children'
/// summary values:ONE,MANY,PARENT,CHILDREN
/// summary=K|K|K|K
Method AttributeCardinalityType(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K|K|K
	if '(..isKeywordInList($lb("ONE","MANY","PARENT","CHILDREN"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"ONE")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"MANY")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"PARENT")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"CHILDREN")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  attribute_ClassType ::= 'classtype' '=' class_type_name
/// summary values:CLASSTYPE
/// summary=K&P&C
Method AttributeClasstype(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&C
	if '(..isKeyword("CLASSTYPE",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"CLASSTYPE")  {
		if ..addPunctuation(.subElement,"=")  {
			if ..ClassTypeName(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  attribute_ClientDataType ::= 'clientdatatype' '=' client_data_type_name
/// summary values:CLIENTDATATYPE
/// summary=K&P&C
Method AttributeClientdatatype(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&C
	if '(..isKeyword("CLIENTDATATYPE",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"CLIENTDATATYPE")  {
		if ..addPunctuation(.subElement,"=")  {
			if ..ClientDataTypeName(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  attribute_ClientName ::= 'clientname' '=' attribute_ClientName_value
/// summary values:CLIENTNAME
/// summary=K&P&C
Method AttributeClientname(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&C
	if '(..isKeyword("CLIENTNAME",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"CLIENTNAME")  {
		if ..addPunctuation(.subElement,"=")  {
			if ..AttributeClientnameValue(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  attribute_ClientName_value ::= client_identifier
/// summary=C
Method AttributeClientnameValue(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ClientIdentifier(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  attribute_CodeMode ::= 'codemode' '=' attribute_CodeModeType
/// summary values:CODEMODE
/// summary=K&P&C
Method AttributeCodemode(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&C
	if '(..isKeyword("CODEMODE",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"CODEMODE")  {
		if ..addPunctuation(.subElement,"=")  {
			if ..AttributeCodemodetype(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  attribute_CodeModeType ::= 'call' | 'code' | 'expression' | 'objectgenerator' | 'generator'
/// summary values:CALL,CODE,EXPRESSION,OBJECTGENERATOR,GENERATOR
/// summary=K|K|K|K|K
Method AttributeCodemodetype(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K|K|K|K
	if '(..isKeywordInList($lb("CALL","CODE","EXPRESSION","OBJECTGENERATOR","GENERATOR"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"CALL")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"CODE")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"EXPRESSION")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"OBJECTGENERATOR")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"GENERATOR")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  attribute_CompileAfter ::= 'compileafter' '=' [class_reference_list | class_reference]
/// summary values:COMPILEAFTER
/// summary=K&P&[C|C]
Method AttributeCompileafter(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&[C|C]
	if '(..isKeyword("COMPILEAFTER",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"COMPILEAFTER")  {
		if ..addPunctuation(.subElement,"=")  {
			if ..AttributeCompileafter124OptGrp(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=C|C
Method AttributeCompileafter124OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..ClassReferenceList(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ClassReference(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=1 /* failure rollsback but returns OK */
	}
	quit ok
}

///  attribute_Condition ::= 'condition' '=' '{' expression '}'
/// summary values:CONDITION
/// summary=K&P&P&C&P
Method AttributeCondition(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&P&C&P
	if '(..isKeyword("CONDITION",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"CONDITION")  {
		if ..addPunctuation(.subElement,"=")  {
			if ..addPunctuation(.subElement,"{")  {
				if ..Expression(.subElement,.addedElement)  {
					if ..addPunctuation(.subElement,"}")  {
						set done=1 ; end compileRules
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  attribute_Constraint ::= 'constraint' '=' (number | string | identifier)
/// summary values:CONSTRAINT
/// summary=K&P&(C|C|C)
Method AttributeConstraint(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&(C|C|C)
	if '(..isKeyword("CONSTRAINT",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"CONSTRAINT")  {
		if ..addPunctuation(.subElement,"=")  {
			if ..AttributeConstraint123Sub(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// number | string | identifier
/// summary=C|C|C
Method AttributeConstraint123Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..Number(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..String(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Identifier(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  attribute_Data ::= 'data' '=' ( one_data_attribute_value | ( '(' one_data_attribute_value ( ',' one_data_attribute_value )* ')' ) )
/// summary values:DATA
/// summary=K&P&(C|(P&C&(?4punctuation:4?)*&P))
Method AttributeData(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&(C|(P&C&(?4punctuation:4?)*&P))
	if '(..isKeyword("DATA",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"DATA")  {
		if ..addPunctuation(.subElement,"=")  {
			if ..AttributeData125Sub(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  one_data_attribute_value | ( '(' one_data_attribute_value ( ',' one_data_attribute_value )* ')' )
/// summary=C|(P&C&(?4punctuation:4?)*&P)
Method AttributeData125Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|(P&C&(?4punctuation:4?)*&P)
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OneDataAttributeValue(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeData126Sub(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	quit ok
}

///  '(' one_data_attribute_value ( ',' one_data_attribute_value )* ')'
/// summary values:(
/// summary=P&C&(?4punctuation:4?)*&P
Method AttributeData126Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&(?4punctuation:4?)*&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if ..OneDataAttributeValue(.subElement,.addedElement)  {
			if ..AttributeData127RepZero(.subElement,.addedElement)  {
				if ..addPunctuation(.subElement,")")  {
					set done=1 ; end compileRules
				}
			}
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	quit ok
}

///  ( ',' one_data_attribute_value )*
Method AttributeData127RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..AttributeData128Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' one_data_attribute_value
/// summary values:,
/// summary=P&C
Method AttributeData128Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..OneDataAttributeValue(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	quit ok
}

///  attribute_DDLAllowed ::= 'ddlallowed'
/// summary values:DDLALLOWED
/// summary=K
Method AttributeDdlallowed(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeyword("DDLALLOWED",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"DDLALLOWED")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  attribute_DependsOn ::= 'dependson' '=' ( class_reference_list | class_reference )
/// summary values:DEPENDSON
/// summary=K&P&(C|C)
Method AttributeDependson(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&(C|C)
	if '(..isKeyword("DEPENDSON",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"DEPENDSON")  {
		if ..addPunctuation(.subElement,"=")  {
			if ..AttributeDependson130Sub(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  class_reference_list | class_reference
/// summary=C|C
Method AttributeDependson130Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..ClassReferenceList(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ClassReference(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  attribute_Deprecated ::= 'deprecated'
/// summary values:DEPRECATED
/// summary=K
Method AttributeDeprecated(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeyword("DEPRECATED",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"DEPRECATED")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  attribute_EmbeddedClass ::= 'EmbeddedClass' '=' class_reference
/// summary values:EMBEDDEDCLASS
/// summary=K&P&C
Method AttributeEmbeddedclass(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&C
	if '(..isKeyword("EMBEDDEDCLASS",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"EMBEDDEDCLASS")  {
		if ..addPunctuation(.subElement,"=")  {
			if ..ClassReference(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  attribute_Event ::= 'event' '=' event_keyword
/// summary values:EVENT
/// summary=K&P&C
Method AttributeEvent(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&C
	if '(..isKeyword("EVENT",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"EVENT")  {
		if ..addPunctuation(.subElement,"=")  {
			if ..EventKeyword(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  attribute_Extent ::= 'extent'
/// summary values:EXTENT
/// summary=K
Method AttributeExtent(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeyword("EXTENT",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"EXTENT")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  attribute_ExternalProcName ::= 'externalprocname' '=' text
/// summary values:EXTERNALPROCNAME
/// summary=K&P&C
Method AttributeExternalprocname(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&C
	if '(..isKeyword("EXTERNALPROCNAME",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"EXTERNALPROCNAME")  {
		if ..addPunctuation(.subElement,"=")  {
			if ..Text(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  attribute_Final ::= 'final'
/// summary values:FINAL
/// summary=K
Method AttributeFinal(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeyword("FINAL",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"FINAL")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  attribute_Flags ::= 'flags' '=' ( 'enumedit' | 'enum' | 'list' )
/// summary values:FLAGS
/// summary=K&P&(K|K|K)
Method AttributeFlags(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&(K|K|K)
	if '(..isKeyword("FLAGS",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"FLAGS")  {
		if ..addPunctuation(.subElement,"=")  {
			if ..AttributeFlags131Sub(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  'enumedit' | 'enum' | 'list'
/// summary values:ENUMEDIT,ENUM,LIST
/// summary=K|K|K
Method AttributeFlags131Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K|K|K
	if '(..isKeywordInList($lb("ENUMEDIT","ENUM","LIST"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"ENUMEDIT")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"ENUM")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"LIST")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  attribute_ForceGenerate ::= 'forcegenerate'
/// summary values:FORCEGENERATE
/// summary=K
Method AttributeForcegenerate(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeyword("FORCEGENERATE",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"FORCEGENERATE")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  attribute_ForEach ::= 'foreach' '=' foreach_type
/// summary values:FOREACH
/// summary=K&P&C
Method AttributeForeach(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&C
	if '(..isKeyword("FOREACH",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"FOREACH")  {
		if ..addPunctuation(.subElement,"=")  {
			if ..ForeachType(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  attribute_GenerateAfter ::= 'generateafter' '=' ( method_reference | ( '(' method_reference ( ',' method_reference )* ')' ) )
/// summary values:GENERATEAFTER
/// summary=K&P&(C|(P&C&(?4punctuation:4?)*&P))
Method AttributeGenerateafter(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&(C|(P&C&(?4punctuation:4?)*&P))
	if '(..isKeyword("GENERATEAFTER",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"GENERATEAFTER")  {
		if ..addPunctuation(.subElement,"=")  {
			if ..AttributeGenerateafter132Sub(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  method_reference | ( '(' method_reference ( ',' method_reference )* ')' )
/// summary=C|(P&C&(?4punctuation:4?)*&P)
Method AttributeGenerateafter132Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|(P&C&(?4punctuation:4?)*&P)
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..MethodReference(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeGenerateafter133Sub(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	quit ok
}

///  '(' method_reference ( ',' method_reference )* ')'
/// summary values:(
/// summary=P&C&(?4punctuation:4?)*&P
Method AttributeGenerateafter133Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&(?4punctuation:4?)*&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if ..MethodReference(.subElement,.addedElement)  {
			if ..AttributeGenerateafter134RepZero(.subElement,.addedElement)  {
				if ..addPunctuation(.subElement,")")  {
					set done=1 ; end compileRules
				}
			}
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	quit ok
}

///  ( ',' method_reference )*
Method AttributeGenerateafter134RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..AttributeGenerateafter135Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' method_reference
/// summary values:,
/// summary=P&C
Method AttributeGenerateafter135Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..MethodReference(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	quit ok
}

///  attribute_GeneratedBy ::= 'generatedby' '=' (class_reference | string | filename)
/// summary values:GENERATEDBY
/// summary=K&P&(C|C|C)
Method AttributeGeneratedby(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&(C|C|C)
	if '(..isKeyword("GENERATEDBY",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"GENERATEDBY")  {
		if ..addPunctuation(.subElement,"=")  {
			if ..AttributeGeneratedby136Sub(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// class_reference | string | filename
/// summary=C|C|C
Method AttributeGeneratedby136Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..ClassReference(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..String(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Filename(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  attribute_Hidden ::= 'hidden'
/// summary values:HIDDEN
/// summary=K
Method AttributeHidden(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeyword("HIDDEN",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"HIDDEN")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  attribute_Identity ::= 'identity'
/// summary values:IDENTITY
/// summary=K
Method AttributeIdentity(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeyword("IDENTITY",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"IDENTITY")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  attribute_IdKey ::= 'idkey'
/// summary values:IDKEY
/// summary=K
Method AttributeIdkey(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeyword("IDKEY",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"IDKEY")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  attribute_Inheritance ::= 'inheritance' '=' inheritance_direction
/// summary values:INHERITANCE
/// summary=K&P&C
Method AttributeInheritance(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&C
	if '(..isKeyword("INHERITANCE",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"INHERITANCE")  {
		if ..addPunctuation(.subElement,"=")  {
			if ..InheritanceDirection(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  attribute_InitialExpression ::= 'initialexpression' '=' initialexpression_value
/// summary values:INITIALEXPRESSION
/// summary=K&P&C
Method AttributeInitialexpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&C
	if '(..isKeyword("INITIALEXPRESSION",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"INITIALEXPRESSION")  {
		if ..addPunctuation(.subElement,"=")  {
			if ..InitialexpressionValue(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  attribute_Internal ::= 'internal'
/// summary values:INTERNAL
/// summary=K
Method AttributeInternal(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeyword("INTERNAL",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"INTERNAL")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  attribute_Inverse ::= 'inverse' '=' identifier
/// summary values:INVERSE
/// summary=K&P&C
Method AttributeInverse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&C
	if '(..isKeyword("INVERSE",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"INVERSE")  {
		if ..addPunctuation(.subElement,"=")  {
			if ..Identifier(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  attribute_Language ::= 'language' '=' class_language_name
/// summary values:LANGUAGE
/// summary=K&P&C
Method AttributeLanguage(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&C
	if '(..isKeyword("LANGUAGE",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"LANGUAGE")  {
		if ..addPunctuation(.subElement,"=")  {
			if ..ClassLanguageName(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  attribute_LegacyInstanceContext ::= 'legacyinstancecontext'
/// summary values:LEGACYINSTANCECONTEXT
/// summary=K
Method AttributeLegacyinstancecontext(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeyword("LEGACYINSTANCECONTEXT",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"LEGACYINSTANCECONTEXT")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  attribute_MemberSuper ::= 'MemberSuper' '=' ( ( '(' class_reference ( ',' class_reference )*')' ) | class_reference )
/// summary values:MEMBERSUPER
/// summary=K&P&((P&C&(?4punctuation:4?)*&P)|C)
Method AttributeMembersuper(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&((P&C&(?4punctuation:4?)*&P)|C)
	if '(..isKeyword("MEMBERSUPER",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"MEMBERSUPER")  {
		if ..addPunctuation(.subElement,"=")  {
			if ..AttributeMembersuper137Sub(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ( '(' class_reference ( ',' class_reference )*')' ) | class_reference
/// summary=(P&C&(?4punctuation:4?)*&P)|C
Method AttributeMembersuper137Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary (P&C&(?4punctuation:4?)*&P)|C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..AttributeMembersuper138Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ClassReference(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	quit ok
}

///  '(' class_reference ( ',' class_reference )*')'
/// summary values:(
/// summary=P&C&(?4punctuation:4?)*&P
Method AttributeMembersuper138Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&(?4punctuation:4?)*&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if ..ClassReference(.subElement,.addedElement)  {
			if ..AttributeMembersuper139RepZero(.subElement,.addedElement)  {
				if ..addPunctuation(.subElement,")")  {
					set done=1 ; end compileRules
				}
			}
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	quit ok
}

///  ( ',' class_reference )*
Method AttributeMembersuper139RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..AttributeMembersuper140Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' class_reference
/// summary values:,
/// summary=P&C
Method AttributeMembersuper140Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..ClassReference(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	quit ok
}

///  attribute_MimeType ::= 'mimetype' '=' identifier ('/' identifier)*
/// summary values:MIMETYPE
/// summary=K&P&C&(?4punctuation:4?)*
Method AttributeMimetype(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&C&(?4punctuation:4?)*
	if '(..isKeyword("MIMETYPE",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"MIMETYPE")  {
		if ..addPunctuation(.subElement,"=")  {
			if ..Identifier(.subElement,.addedElement)  {
				if ..AttributeMimetype141RepZero(.subElement,.addedElement)  {
					set done=1 ; end compileRules
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ('/' identifier)*
Method AttributeMimetype141RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..AttributeMimetype142Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// '/' identifier
/// summary values:/
/// summary=P&C
Method AttributeMimetype142Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle("/",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"/")  {
		if ..Identifier(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	quit ok
}

///  attribute_MultiDimensional ::= 'multidimensional'
/// summary values:MULTIDIMENSIONAL
/// summary=K
Method AttributeMultidimensional(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeyword("MULTIDIMENSIONAL",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"MULTIDIMENSIONAL")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  attribute_NewTable ::= 'newtable' '=' tablename
/// summary values:NEWTABLE
/// summary=K&P&C
Method AttributeNewtable(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&C
	if '(..isKeyword("NEWTABLE",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"NEWTABLE")  {
		if ..addPunctuation(.subElement,"=")  {
			if ..Tablename(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  attribute_NoCheck ::= 'nocheck'
/// summary values:NOCHECK
/// summary=K
Method AttributeNocheck(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeyword("NOCHECK",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"NOCHECK")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  attribute_NoContext ::= 'nocontext'
/// summary values:NOCONTEXT
/// summary=K
Method AttributeNocontext(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeyword("NOCONTEXT",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"NOCONTEXT")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  attribute_NoExtent ::= 'noextent'
/// summary values:NOEXTENT
/// summary=K
Method AttributeNoextent(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeyword("NOEXTENT",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"NOEXTENT")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  attribute_Not ::= 'not' ( attribute_Abstract | attribute_DDLAllowed | attribute_Deprecated | attribute_Final | attribute_Hidden | attribute_Internal | attribute_LegacyInstanceContext | attribute_NoExtent | attribute_Private | attribute_ProcedureBlock | attribute_ReadOnly | attribute_Required | attribute_ServerOnly | attribute_SQLComputed | attribute_Transient | attribute_Unique | attribute_SQLRowidPrivate )
/// summary values:NOT
/// summary=K&(C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C)
Method AttributeNot(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&(C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C)
	if '(..isKeyword("NOT",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"NOT")  {
		if ..AttributeNot29Sub(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  attribute_Abstract | attribute_DDLAllowed | attribute_Deprecated | attribute_Final | attribute_Hidden | attribute_Internal | attribute_LegacyInstanceContext | attribute_NoExtent | attribute_Private | attribute_ProcedureBlock | attribute_ReadOnly | attribute_Required | attribute_ServerOnly | attribute_SQLComputed | attribute_Transient | attribute_Unique | attribute_SQLRowidPrivate
/// summary=C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C
Method AttributeNot29Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..AttributeAbstract(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeDdlallowed(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeDeprecated(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeFinal(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeHidden(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeInternal(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeLegacyinstancecontext(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeNoextent(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributePrivate(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeProcedureblock(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeReadonly(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeRequired(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeServeronly(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeSqlcomputed(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeTransient(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeUnique(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeSqlrowidprivate(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  attribute_NotInheritable ::= 'notinheritable'
/// summary values:NOTINHERITABLE
/// summary=K
Method AttributeNotinheritable(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeyword("NOTINHERITABLE",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"NOTINHERITABLE")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  attribute_ODBCType ::= 'odbctype' '=' ( 'bigint' | 'bit' | 'date' | 'double' | 'integer' | 'longvarbinary' | 'longvarchar' | 'numeric' | 'resultset' | 'smallint' | 'struct' | 'time' | 'timestamp' | 'tinyint' | 'varbinary' | 'varchar' | 'guid' | 'POSIXTIME')
/// summary values:ODBCTYPE
/// summary=K&P&(K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K)
Method AttributeOdbctype(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&(K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K)
	if '(..isKeyword("ODBCTYPE",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"ODBCTYPE")  {
		if ..addPunctuation(.subElement,"=")  {
			if ..AttributeOdbctype143Sub(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  'bigint' | 'bit' | 'date' | 'double' | 'integer' | 'longvarbinary' | 'longvarchar' | 'numeric' | 'resultset' | 'smallint' | 'struct' | 'time' | 'timestamp' | 'tinyint' | 'varbinary' | 'varchar' | 'guid' | 'POSIXTIME'
/// summary values:BIGINT,BIT,DATE,DOUBLE,INTEGER,LONGVARBINARY,LONGVARCHAR,NUMERIC,RESULTSET,SMALLINT,STRUCT,TIME,TIMESTAMP,TINYINT,VARBINARY,VARCHAR,GUID,POSIXTIME
/// summary=K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K
Method AttributeOdbctype143Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K
	if '(..isKeywordInList($lb("BIGINT","BIT","DATE","DOUBLE","INTEGER","LONGVARBINARY","LONGVARCHAR","NUMERIC","RESULTSET","SMALLINT","STRUCT","TIME","TIMESTAMP","TINYINT","VARBINARY","VARCHAR","GUID","POSIXTIME"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"BIGINT")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"BIT")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"DATE")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"DOUBLE")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"INTEGER")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"LONGVARBINARY")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"LONGVARCHAR")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"NUMERIC")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"RESULTSET")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"SMALLINT")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"STRUCT")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"TIME")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"TIMESTAMP")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"TINYINT")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"VARBINARY")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"VARCHAR")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"GUID")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"POSIXTIME")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  attribute_OldTable ::= 'oldtable' '=' tablename
/// summary values:OLDTABLE
/// summary=K&P&C
Method AttributeOldtable(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&C
	if '(..isKeyword("OLDTABLE",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"OLDTABLE")  {
		if ..addPunctuation(.subElement,"=")  {
			if ..Tablename(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  attribute_OnAction_type ::= 'cascade' | 'noaction' | 'setdefault' | 'setnull'
/// summary values:CASCADE,NOACTION,SETDEFAULT,SETNULL
/// summary=K|K|K|K
Method AttributeOnactionType(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K|K|K
	if '(..isKeywordInList($lb("CASCADE","NOACTION","SETDEFAULT","SETNULL"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"CASCADE")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"NOACTION")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"SETDEFAULT")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"SETNULL")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  attribute_OnDelete ::= 'ondelete' '=' attribute_OnAction_type
/// summary values:ONDELETE
/// summary=K&P&C
Method AttributeOndelete(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&C
	if '(..isKeyword("ONDELETE",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"ONDELETE")  {
		if ..addPunctuation(.subElement,"=")  {
			if ..AttributeOnactionType(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  attribute_OneAlias ::= alias_identifier
/// summary=C
Method AttributeOnealias(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..AliasIdentifier(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  attribute_OnUpdate ::= 'onupdate' '=' attribute_OnAction_type
/// summary values:ONUPDATE
/// summary=K&P&C
Method AttributeOnupdate(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&C
	if '(..isKeyword("ONUPDATE",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"ONUPDATE")  {
		if ..addPunctuation(.subElement,"=")  {
			if ..AttributeOnactionType(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  attribute_Order ::= 'order' '=' expression
/// summary values:ORDER
/// summary=K&P&C
Method AttributeOrder(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&C
	if '(..isKeyword("ORDER",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"ORDER")  {
		if ..addPunctuation(.subElement,"=")  {
			if ..Expression(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  attribute_Owner ::= 'owner' '=' ( string | number | '{' text_in_curly '}' )
/// summary values:OWNER
/// summary=K&P&(C|C|P&C&P)
Method AttributeOwner(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&(C|C|P&C&P)
	if '(..isKeyword("OWNER",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"OWNER")  {
		if ..addPunctuation(.subElement,"=")  {
			if ..AttributeOwner144Sub(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  string | number | '{' text_in_curly '}'
/// summary=C|C|P&C&P
Method AttributeOwner144Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C|P&C&P
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..String(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Number(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"{")  {
		if ..TextInCurly(.subElement,.addedElement)  {
			if ..addPunctuation(.subElement,"}")  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	quit ok
}

///  attribute_PlaceAfter ::= 'placeafter' '=' method_reference ('(' ',' method_reference ')')*
/// summary values:PLACEAFTER
/// summary=K&P&C&(?4punctuation:4?)*
Method AttributePlaceafter(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&C&(?4punctuation:4?)*
	if '(..isKeyword("PLACEAFTER",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"PLACEAFTER")  {
		if ..addPunctuation(.subElement,"=")  {
			if ..MethodReference(.subElement,.addedElement)  {
				if ..AttributePlaceafter145RepZero(.subElement,.addedElement)  {
					set done=1 ; end compileRules
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ('(' ',' method_reference ')')*
Method AttributePlaceafter145RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..AttributePlaceafter146Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// '(' ',' method_reference ')'
/// summary values:(
/// summary=P&P&C&P
Method AttributePlaceafter146Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&P&C&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if ..addPunctuation(.subElement,",")  {
			if ..MethodReference(.subElement,.addedElement)  {
				if ..addPunctuation(.subElement,")")  {
					set done=1 ; end compileRules
				}
			}
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	quit ok
}

///  attribute_PrimaryKey ::= 'primarykey'
/// summary values:PRIMARYKEY
/// summary=K
Method AttributePrimarykey(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeyword("PRIMARYKEY",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"PRIMARYKEY")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  attribute_Private ::= 'private'
/// summary values:PRIVATE
/// summary=K
Method AttributePrivate(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeyword("PRIVATE",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"PRIVATE")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  attribute_ProcedureBlock ::= 'procedureblock' [ '=' ( '0' | '1' ) ]
/// summary values:PROCEDUREBLOCK
/// summary=K&[P&(P|P)]
Method AttributeProcedureblock(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&[P&(P|P)]
	if '(..isKeyword("PROCEDUREBLOCK",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"PROCEDUREBLOCK")  {
		if ..AttributeProcedureblock147OptGrp(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary values:=
/// summary=P&(P|P)
Method AttributeProcedureblock147OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&(P|P)
	; first rule summary P
	if '(..isStringSingle("=",.value)) { quit 1 /* not found is OK */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"=")  {
		if ..AttributeProcedureblock148Sub(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=1 /* failure rollsback but returns OK */
	}
	quit ok
}

///  '0' | '1'
/// summary values:0,1
/// summary=P|P
Method AttributeProcedureblock148Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P|P
	if '(..isStringInList($lb("0","1"),1,.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addPunctuation(.subElement,"0")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"1")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  attribute_PropertyClass ::= 'propertyclass' '=' class_reference ('(' ',' class_reference ')')*
/// summary values:PROPERTYCLASS
/// summary=K&P&C&(?4punctuation:4?)*
Method AttributePropertyclass(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&C&(?4punctuation:4?)*
	if '(..isKeyword("PROPERTYCLASS",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"PROPERTYCLASS")  {
		if ..addPunctuation(.subElement,"=")  {
			if ..ClassReference(.subElement,.addedElement)  {
				if ..AttributePropertyclass149RepZero(.subElement,.addedElement)  {
					set done=1 ; end compileRules
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ('(' ',' class_reference ')')*
Method AttributePropertyclass149RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..AttributePropertyclass150Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// '(' ',' class_reference ')'
/// summary values:(
/// summary=P&P&C&P
Method AttributePropertyclass150Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&P&C&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if ..addPunctuation(.subElement,",")  {
			if ..ClassReference(.subElement,.addedElement)  {
				if ..addPunctuation(.subElement,")")  {
					set done=1 ; end compileRules
				}
			}
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	quit ok
}

///  attribute_PublicList ::= 'publiclist' '=' ( ('(' identifier (',' identifier )* ')' ) | identifier)
/// summary values:PUBLICLIST
/// summary=K&P&((P&C&(?4punctuation:4?)*&P)|C)
Method AttributePubliclist(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&((P&C&(?4punctuation:4?)*&P)|C)
	if '(..isKeyword("PUBLICLIST",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"PUBLICLIST")  {
		if ..addPunctuation(.subElement,"=")  {
			if ..AttributePubliclist151Sub(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ('(' identifier (',' identifier )* ')' ) | identifier
/// summary=(P&C&(?4punctuation:4?)*&P)|C
Method AttributePubliclist151Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary (P&C&(?4punctuation:4?)*&P)|C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..AttributePubliclist152Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Identifier(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	quit ok
}

/// '(' identifier (',' identifier )* ')'
/// summary values:(
/// summary=P&C&(?4punctuation:4?)*&P
Method AttributePubliclist152Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&(?4punctuation:4?)*&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if ..Identifier(.subElement,.addedElement)  {
			if ..AttributePubliclist153RepZero(.subElement,.addedElement)  {
				if ..addPunctuation(.subElement,")")  {
					set done=1 ; end compileRules
				}
			}
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	quit ok
}

///  (',' identifier )*
Method AttributePubliclist153RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..AttributePubliclist154Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// ',' identifier
/// summary values:,
/// summary=P&C
Method AttributePubliclist154Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..Identifier(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	quit ok
}

///  attribute_ReadOnly ::= 'readonly'
/// summary values:READONLY
/// summary=K
Method AttributeReadonly(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeyword("READONLY",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"READONLY")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  attribute_Required ::= 'required'
/// summary values:REQUIRED
/// summary=K
Method AttributeRequired(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeyword("REQUIRED",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"REQUIRED")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  attribute_ReturnResultSets ::= 'returnresultsets'
/// summary values:RETURNRESULTSETS
/// summary=K
Method AttributeReturnresultsets(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeyword("RETURNRESULTSETS",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"RETURNRESULTSETS")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  attribute_SchemaSpec ::= 'schemaspec' '=' string
/// summary values:SCHEMASPEC
/// summary=K&P&C
Method AttributeSchemaspec(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&C
	if '(..isKeyword("SCHEMASPEC",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"SCHEMASPEC")  {
		if ..addPunctuation(.subElement,"=")  {
			if ..String(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  attribute_ServerOnly ::= 'serveronly' '=' ( '0' | '1' )
/// summary values:SERVERONLY
/// summary=K&P&(P|P)
Method AttributeServeronly(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&(P|P)
	if '(..isKeyword("SERVERONLY",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"SERVERONLY")  {
		if ..addPunctuation(.subElement,"=")  {
			if ..AttributeServeronly155Sub(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  '0' | '1'
/// summary values:0,1
/// summary=P|P
Method AttributeServeronly155Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P|P
	if '(..isStringInList($lb("0","1"),1,.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addPunctuation(.subElement,"0")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"1")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  attribute_SOAPAction ::= 'soapaction' '=' (identifier | string)
/// summary values:SOAPACTION
/// summary=K&P&(C|C)
Method AttributeSoapaction(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&(C|C)
	if '(..isKeyword("SOAPACTION",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"SOAPACTION")  {
		if ..addPunctuation(.subElement,"=")  {
			if ..AttributeSoapaction156Sub(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// identifier | string
/// summary=C|C
Method AttributeSoapaction156Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..Identifier(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..String(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  attribute_SOAPBindingStyle ::= 'SoapBindingStyle' '=' ( 'document' | 'rcp' )
/// summary values:SOAPBINDINGSTYLE
/// summary=K&P&(K|K)
Method AttributeSoapbindingstyle(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&(K|K)
	if '(..isKeyword("SOAPBINDINGSTYLE",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"SOAPBINDINGSTYLE")  {
		if ..addPunctuation(.subElement,"=")  {
			if ..AttributeSoapbindingstyle157Sub(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  'document' | 'rcp'
/// summary values:DOCUMENT,RCP
/// summary=K|K
Method AttributeSoapbindingstyle157Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K|K
	if '(..isKeywordInList($lb("DOCUMENT","RCP"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"DOCUMENT")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"RCP")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  attribute_SOAPBodyuse ::= 'soapbodyuse' '=' ( 'literal' | 'encoded' )
/// summary values:SOAPBODYUSE
/// summary=K&P&(K|K)
Method AttributeSoapbodyuse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&(K|K)
	if '(..isKeyword("SOAPBODYUSE",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"SOAPBODYUSE")  {
		if ..addPunctuation(.subElement,"=")  {
			if ..AttributeSoapbodyuse158Sub(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  'literal' | 'encoded'
/// summary values:LITERAL,ENCODED
/// summary=K|K
Method AttributeSoapbodyuse158Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K|K
	if '(..isKeywordInList($lb("LITERAL","ENCODED"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"LITERAL")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"ENCODED")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  attribute_SOAPMessageName ::= 'soapmessagename' '=' ( string | soap_identifier )
/// summary values:SOAPMESSAGENAME
/// summary=K&P&(C|C)
Method AttributeSoapmessagename(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&(C|C)
	if '(..isKeyword("SOAPMESSAGENAME",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"SOAPMESSAGENAME")  {
		if ..addPunctuation(.subElement,"=")  {
			if ..AttributeSoapmessagename159Sub(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  string | soap_identifier
/// summary=C|C
Method AttributeSoapmessagename159Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..String(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SoapIdentifier(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  attribute_SOAPNameSpace ::= 'soapnamespace' '=' ( string | soap_identifier)
/// summary values:SOAPNAMESPACE
/// summary=K&P&(C|C)
Method AttributeSoapnamespace(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&(C|C)
	if '(..isKeyword("SOAPNAMESPACE",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"SOAPNAMESPACE")  {
		if ..addPunctuation(.subElement,"=")  {
			if ..AttributeSoapnamespace160Sub(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  string | soap_identifier
/// summary=C|C
Method AttributeSoapnamespace160Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..String(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SoapIdentifier(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  attribute_SOAPRequestMessage ::= 'soaprequestmessage' '=' ( string | soap_identifier )
/// summary values:SOAPREQUESTMESSAGE
/// summary=K&P&(C|C)
Method AttributeSoaprequestmessage(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&(C|C)
	if '(..isKeyword("SOAPREQUESTMESSAGE",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"SOAPREQUESTMESSAGE")  {
		if ..addPunctuation(.subElement,"=")  {
			if ..AttributeSoaprequestmessage161Sub(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  string | soap_identifier
/// summary=C|C
Method AttributeSoaprequestmessage161Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..String(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SoapIdentifier(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  attribute_SOAPTypeNamespace ::= 'soaptypenamespace' '=' ( string | soap_identifier )
/// summary values:SOAPTYPENAMESPACE
/// summary=K&P&(C|C)
Method AttributeSoaptypenamespace(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&(C|C)
	if '(..isKeyword("SOAPTYPENAMESPACE",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"SOAPTYPENAMESPACE")  {
		if ..addPunctuation(.subElement,"=")  {
			if ..AttributeSoaptypenamespace162Sub(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  string | soap_identifier
/// summary=C|C
Method AttributeSoaptypenamespace162Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..String(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SoapIdentifier(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  attribute_SQLCategory ::= 'sqlcategory' '=' ( 'date' | 'double' | 'fmdate' | 'fmtimestamp' | 'integer' | 'mvdate' | 'name' | 'numeric' | 'string' | 'time' | 'timestamp' | 'POSIXTS' | 'VECTOR' )
/// summary values:SQLCATEGORY
/// summary=K&P&(K|K|K|K|K|K|K|K|K|K|K|K|K)
Method AttributeSqlcategory(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&(K|K|K|K|K|K|K|K|K|K|K|K|K)
	if '(..isKeyword("SQLCATEGORY",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"SQLCATEGORY")  {
		if ..addPunctuation(.subElement,"=")  {
			if ..AttributeSqlcategory163Sub(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  'date' | 'double' | 'fmdate' | 'fmtimestamp' | 'integer' | 'mvdate' | 'name' | 'numeric' | 'string' | 'time' | 'timestamp' | 'POSIXTS' | 'VECTOR'
/// summary values:DATE,DOUBLE,FMDATE,FMTIMESTAMP,INTEGER,MVDATE,NAME,NUMERIC,STRING,TIME,TIMESTAMP,POSIXTS,VECTOR
/// summary=K|K|K|K|K|K|K|K|K|K|K|K|K
Method AttributeSqlcategory163Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K|K|K|K|K|K|K|K|K|K|K|K|K
	if '(..isKeywordInList($lb("DATE","DOUBLE","FMDATE","FMTIMESTAMP","INTEGER","MVDATE","NAME","NUMERIC","STRING","TIME","TIMESTAMP","POSIXTS","VECTOR"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"DATE")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"DOUBLE")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"FMDATE")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"FMTIMESTAMP")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"INTEGER")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"MVDATE")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"NAME")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"NUMERIC")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"STRING")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"TIME")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"TIMESTAMP")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"POSIXTS")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"VECTOR")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  attribute_SQLColumnNumber ::= 'SqlColumnNumber' '=' number
/// summary values:SQLCOLUMNNUMBER
/// summary=K&P&C
Method AttributeSqlcolumnnumber(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&C
	if '(..isKeyword("SQLCOLUMNNUMBER",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"SQLCOLUMNNUMBER")  {
		if ..addPunctuation(.subElement,"=")  {
			if ..Number(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  attribute_SQLComputeCode ::= 'sqlcomputecode' '=' '{' cos_code_block_sql '}'
/// summary values:SQLCOMPUTECODE
/// summary=K&P&P&C&P
Method AttributeSqlcomputecode(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&P&C&P
	if '(..isKeyword("SQLCOMPUTECODE",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"SQLCOMPUTECODE")  {
		if ..addPunctuation(.subElement,"=")  {
			if ..addPunctuation(.subElement,"{")  {
				if ..CosCodeBlockSql(.subElement,.addedElement)  {
					if ..addPunctuation(.subElement,"}")  {
						set done=1 ; end compileRules
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  attribute_SQLComputed ::= 'sqlcomputed'
/// summary values:SQLCOMPUTED
/// summary=K
Method AttributeSqlcomputed(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeyword("SQLCOMPUTED",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"SQLCOMPUTED")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  attribute_SQLComputeOnChange ::= 'sqlcomputeonchange' '=' property_reference | ('(' property_reference (',' property_reference )* ')')
/// summary values:SQLCOMPUTEONCHANGE
/// summary=K&P&C|(P&C&(?4punctuation:4?)*&P)
Method AttributeSqlcomputeonchange(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&C|(P&C&(?4punctuation:4?)*&P)
	if '(..isKeyword("SQLCOMPUTEONCHANGE",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"SQLCOMPUTEONCHANGE")  {
		if ..addPunctuation(.subElement,"=")  {
			if ..PropertyReference(.subElement,.addedElement)  {
				set done=1 ; or
			} elseif ..AttributeSqlcomputeonchange164Sub(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// '(' property_reference (',' property_reference )* ')'
/// summary values:(
/// summary=P&C&(?4punctuation:4?)*&P
Method AttributeSqlcomputeonchange164Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&(?4punctuation:4?)*&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if ..PropertyReference(.subElement,.addedElement)  {
			if ..AttributeSqlcomputeonchange165RepZero(.subElement,.addedElement)  {
				if ..addPunctuation(.subElement,")")  {
					set done=1 ; end compileRules
				}
			}
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	quit ok
}

///  (',' property_reference )*
Method AttributeSqlcomputeonchange165RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..AttributeSqlcomputeonchange166Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// ',' property_reference
/// summary values:,
/// summary=P&C
Method AttributeSqlcomputeonchange166Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..PropertyReference(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	quit ok
}

///  attribute_SQLFieldname ::= 'sqlfieldname' '=' sql_field_name
/// summary values:SQLFIELDNAME
/// summary=K&P&C
Method AttributeSqlfieldname(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&C
	if '(..isKeyword("SQLFIELDNAME",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"SQLFIELDNAME")  {
		if ..addPunctuation(.subElement,"=")  {
			if ..SqlFieldName(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  attribute_SQLListDelimiter ::= 'sqllistdelimiter' '=' expression
/// summary values:SQLLISTDELIMITER
/// summary=K&P&C
Method AttributeSqllistdelimiter(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&C
	if '(..isKeyword("SQLLISTDELIMITER",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"SQLLISTDELIMITER")  {
		if ..addPunctuation(.subElement,"=")  {
			if ..Expression(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  attribute_SQLListType ::= 'sqllisttype' '=' ( 'list' | 'delimited' | 'subnode' )
/// summary values:SQLLISTTYPE
/// summary=K&P&(K|K|K)
Method AttributeSqllisttype(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&(K|K|K)
	if '(..isKeyword("SQLLISTTYPE",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"SQLLISTTYPE")  {
		if ..addPunctuation(.subElement,"=")  {
			if ..AttributeSqllisttype167Sub(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  'list' | 'delimited' | 'subnode'
/// summary values:LIST,DELIMITED,SUBNODE
/// summary=K|K|K
Method AttributeSqllisttype167Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K|K|K
	if '(..isKeywordInList($lb("LIST","DELIMITED","SUBNODE"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"LIST")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"DELIMITED")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"SUBNODE")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  attribute_SQLName ::= 'sqlname' '=' (sql_table_name | string )
/// summary values:SQLNAME
/// summary=K&P&(C|C)
Method AttributeSqlname(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&(C|C)
	if '(..isKeyword("SQLNAME",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"SQLNAME")  {
		if ..addPunctuation(.subElement,"=")  {
			if ..AttributeSqlname168Sub(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// sql_table_name | string
/// summary=C|C
Method AttributeSqlname168Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..SqlTableName(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..String(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  attribute_SQLProc ::= 'sqlproc'
/// summary values:SQLPROC
/// summary=K
Method AttributeSqlproc(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeyword("SQLPROC",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"SQLPROC")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  attribute_SQLRowidName ::= 'sqlrowidname' '=' ( '""' | string | sql_table_name )
/// summary values:SQLROWIDNAME
/// summary=K&P&(P|C|C)
Method AttributeSqlrowidname(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&(P|C|C)
	if '(..isKeyword("SQLROWIDNAME",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"SQLROWIDNAME")  {
		if ..addPunctuation(.subElement,"=")  {
			if ..AttributeSqlrowidname169Sub(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  '""' | string | sql_table_name
/// summary=P|C|C
Method AttributeSqlrowidname169Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P|C|C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"""""")  {
		set done=1 ; or
	} elseif ..String(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlTableName(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	quit ok
}

///  attribute_SQLRowidPrivate ::= 'sqlrowidprivate'
/// summary values:SQLROWIDPRIVATE
/// summary=K
Method AttributeSqlrowidprivate(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeyword("SQLROWIDPRIVATE",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"SQLROWIDPRIVATE")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  attribute_SQLTableName ::= 'sqltablename' '=' ( '""' | sql_table_name )
/// summary values:SQLTABLENAME
/// summary=K&P&(P|C)
Method AttributeSqltablename(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&(P|C)
	if '(..isKeyword("SQLTABLENAME",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"SQLTABLENAME")  {
		if ..addPunctuation(.subElement,"=")  {
			if ..AttributeSqltablename170Sub(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  '""' | sql_table_name
/// summary=P|C
Method AttributeSqltablename170Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P|C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"""""")  {
		set done=1 ; or
	} elseif ..SqlTableName(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	quit ok
}

///  attribute_SQLView ::= 'sqlview'
/// summary values:SQLVIEW
/// summary=K
Method AttributeSqlview(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeyword("SQLVIEW",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"SQLVIEW")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  attribute_SQLViewname ::= 'sqlviewname' '=' ( string | sql_table_name )
/// summary values:SQLVIEWNAME
/// summary=K&P&(C|C)
Method AttributeSqlviewname(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&(C|C)
	if '(..isKeyword("SQLVIEWNAME",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"SQLVIEWNAME")  {
		if ..addPunctuation(.subElement,"=")  {
			if ..AttributeSqlviewname171Sub(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  string | sql_table_name
/// summary=C|C
Method AttributeSqlviewname171Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..String(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlTableName(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  attribute_StorageStrategy ::= 'storagestrategy' '=' ('""' | class_item_identifier)
/// summary values:STORAGESTRATEGY
/// summary=K&P&(P|C)
Method AttributeStoragestrategy(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&(P|C)
	if '(..isKeyword("STORAGESTRATEGY",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"STORAGESTRATEGY")  {
		if ..addPunctuation(.subElement,"=")  {
			if ..AttributeStoragestrategy172Sub(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// '""' | class_item_identifier
/// summary=P|C
Method AttributeStoragestrategy172Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P|C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"""""")  {
		set done=1 ; or
	} elseif ..ClassItemIdentifier(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	quit ok
}

///  attribute_System ::= 'system' '=' ( '0' | '1' | '2' | '3' | '4' )
/// summary values:SYSTEM
/// summary=K&P&(P|P|P|P|P)
Method AttributeSystem(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&(P|P|P|P|P)
	if '(..isKeyword("SYSTEM",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"SYSTEM")  {
		if ..addPunctuation(.subElement,"=")  {
			if ..AttributeSystem173Sub(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  '0' | '1' | '2' | '3' | '4'
/// summary values:0,1,2,3,4
/// summary=P|P|P|P|P
Method AttributeSystem173Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P|P|P|P|P
	if '(..isStringInList($lb("0","1","2","3","4"),1,.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addPunctuation(.subElement,"0")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"1")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"2")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"3")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"4")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  attribute_Time ::= 'time' '=' time_value
/// summary values:TIME
/// summary=K&P&C
Method AttributeTime(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&C
	if '(..isKeyword("TIME",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"TIME")  {
		if ..addPunctuation(.subElement,"=")  {
			if ..TimeValue(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  attribute_Transient ::= 'transient'
/// summary values:TRANSIENT
/// summary=K
Method AttributeTransient(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeyword("TRANSIENT",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"TRANSIENT")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  attribute_Type ::= 'type' '=' ( 'bitmap' | 'bitslice' | 'index' |'key' | 'collatedkey' )
/// summary values:TYPE
/// summary=K&P&(K|K|K|K|K)
Method AttributeType(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&(K|K|K|K|K)
	if '(..isKeyword("TYPE",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"TYPE")  {
		if ..addPunctuation(.subElement,"=")  {
			if ..AttributeType174Sub(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  'bitmap' | 'bitslice' | 'index' |'key' | 'collatedkey'
/// summary values:BITMAP,BITSLICE,INDEX,KEY,COLLATEDKEY
/// summary=K|K|K|K|K
Method AttributeType174Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K|K|K|K|K
	if '(..isKeywordInList($lb("BITMAP","BITSLICE","INDEX","KEY","COLLATEDKEY"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"BITMAP")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"BITSLICE")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"INDEX")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"KEY")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"COLLATEDKEY")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  attribute_Unique ::= 'unique'
/// summary values:UNIQUE
/// summary=K
Method AttributeUnique(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeyword("UNIQUE",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"UNIQUE")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  attribute_UpdateColumnList ::= 'updatecolumnlist' '=' ( one_column_name | ( '(' one_column_name ( ',' one_column_name )* ')' ) )
/// summary values:UPDATECOLUMNLIST
/// summary=K&P&(C|(P&C&(?4punctuation:4?)*&P))
Method AttributeUpdatecolumnlist(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&(C|(P&C&(?4punctuation:4?)*&P))
	if '(..isKeyword("UPDATECOLUMNLIST",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"UPDATECOLUMNLIST")  {
		if ..addPunctuation(.subElement,"=")  {
			if ..AttributeUpdatecolumnlist175Sub(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  one_column_name | ( '(' one_column_name ( ',' one_column_name )* ')' )
/// summary=C|(P&C&(?4punctuation:4?)*&P)
Method AttributeUpdatecolumnlist175Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|(P&C&(?4punctuation:4?)*&P)
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OneColumnName(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeUpdatecolumnlist176Sub(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	quit ok
}

///  '(' one_column_name ( ',' one_column_name )* ')'
/// summary values:(
/// summary=P&C&(?4punctuation:4?)*&P
Method AttributeUpdatecolumnlist176Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&(?4punctuation:4?)*&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if ..OneColumnName(.subElement,.addedElement)  {
			if ..AttributeUpdatecolumnlist177RepZero(.subElement,.addedElement)  {
				if ..addPunctuation(.subElement,")")  {
					set done=1 ; end compileRules
				}
			}
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	quit ok
}

///  ( ',' one_column_name )*
Method AttributeUpdatecolumnlist177RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..AttributeUpdatecolumnlist178Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' one_column_name
/// summary values:,
/// summary=P&C
Method AttributeUpdatecolumnlist178Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..OneColumnName(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	quit ok
}

///  attribute_ViewQuery ::= 'viewquery' '=' '{' class_query_body '}'
/// summary values:VIEWQUERY
/// summary=K&P&P&C&P
Method AttributeViewquery(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&P&C&P
	if '(..isKeyword("VIEWQUERY",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"VIEWQUERY")  {
		if ..addPunctuation(.subElement,"=")  {
			if ..addPunctuation(.subElement,"{")  {
				if ..ClassQueryBody(.subElement,.addedElement)  {
					if ..addPunctuation(.subElement,"}")  {
						set done=1 ; end compileRules
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  attribute_WebMethod ::= 'webmethod'
/// summary values:WEBMETHOD
/// summary=K
Method AttributeWebmethod(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeyword("WEBMETHOD",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"WEBMETHOD")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  attribute_XMLNamespace ::= 'xmlnamespace' '=' (string | identifier)
/// summary values:XMLNAMESPACE
/// summary=K&P&(C|C)
Method AttributeXmlnamespace(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&(C|C)
	if '(..isKeyword("XMLNAMESPACE",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"XMLNAMESPACE")  {
		if ..addPunctuation(.subElement,"=")  {
			if ..AttributeXmlnamespace179Sub(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// string | identifier
/// summary=C|C
Method AttributeXmlnamespace179Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..String(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Identifier(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  attribute_ZenMethod ::= 'zenmethod'
/// summary values:ZENMETHOD
/// summary=K
Method AttributeZenmethod(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeyword("ZENMETHOD",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"ZENMETHOD")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  class_attribute ::= attribute_Abstract | attribute_ClassType | attribute_ClientDataType | attribute_ClientName | attribute_CompileAfter | attribute_DDLAllowed | attribute_DependsOn | attribute_Deprecated | attribute_Embeddedclass | attribute_Final | attribute_GeneratedBy | attribute_Hidden | attribute_Inheritance | attribute_Language | attribute_LegacyInstanceContext | attribute_MemberSuper | attribute_NoContext | attribute_NoExtent | attribute_Not | attribute_ODBCType | attribute_Owner | attribute_ProcedureBlock | attribute_PropertyClass | attribute_ServerOnly | attribute_SOAPBindingStyle | attribute_SOAPBodyuse | attribute_SQLCategory | attribute_SQLRowidName | attribute_SQLRowidPrivate | attribute_SQLTableName | attribute_StorageStrategy | attribute_System | attribute_ViewQuery
/// summary=C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C
Method ClassAttribute(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..AttributeAbstract(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeClasstype(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeClientdatatype(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeClientname(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeCompileafter(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeDdlallowed(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeDependson(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeDeprecated(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeEmbeddedclass(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeFinal(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeGeneratedby(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeHidden(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeInheritance(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeLanguage(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeLegacyinstancecontext(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeMembersuper(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeNocontext(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeNoextent(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeNot(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeOdbctype(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeOwner(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeProcedureblock(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributePropertyclass(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeServeronly(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeSoapbindingstyle(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeSoapbodyuse(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeSqlcategory(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeSqlrowidname(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeSqlrowidprivate(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeSqltablename(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeStoragestrategy(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeSystem(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeViewquery(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  class_attribute_list ::= class_attribute ( ',' class_attribute )*
/// summary=C&(?4punctuation:4?)*
Method ClassAttributeList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ClassAttribute(.subElement,.addedElement)  {
		if ..ClassAttributeList15RepZero(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ( ',' class_attribute )*
Method ClassAttributeList15RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ClassAttributeList16Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' class_attribute
/// summary values:,
/// summary=P&C
Method ClassAttributeList16Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..ClassAttribute(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	quit ok
}

///  class_attributes ::= '[' class_attribute_list ']'
/// summary values:[
/// summary=P&C&P
Method ClassAttributes(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&P
	; first rule summary P
	if '(..isStringSingle("[",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"[")  {
		if ..ClassAttributeList(.subElement,.addedElement)  {
			if ..addPunctuation(.subElement,"]")  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  class_class_method ::= 'classmethod' method_name '(' [ formal_spec_list ] ')' [ 'as' return_type_class_reference ] [ method_attribute_list ] '{' method_body '}'
/// summary values:CLASSMETHOD
/// summary=K&C&P&[C]&P&[K&C]&[C]&P&C&P
Method ClassClassMethod(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C&P&[C]&P&[K&C]&[C]&P&C&P
	if '(..isKeyword("CLASSMETHOD",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"CLASSMETHOD")  {
		if ..MethodName(.subElement,.addedElement)  {
			if ..addPunctuation(.subElement,"(")  {
				if $S(..FormalSpecList(.subElement,.addedElement) :1,1:1) {
					if ..addPunctuation(.subElement,")")  {
						if ..ClassClassMethod30OptGrp(.subElement,.addedElement)  {
							if $S(..MethodAttributeList(.subElement,.addedElement) :1,1:1) {
								if ..addPunctuation(.subElement,"{")  {
									if ..MethodBody(.subElement,.addedElement)  {
										if ..addPunctuation(.subElement,"}")  {
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
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary values:AS
/// summary=K&C
Method ClassClassMethod30OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&C
	if '(..isKeyword("AS",.value)) { quit 1 /* not found is OK */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"AS")  {
		if ..ReturnTypeClassReference(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=1 /* failure rollsback but returns OK */
	}
	quit ok
}

///  class_client_method ::= 'clientmethod' method_name '(' [ formal_spec_list ] ')' [ 'as' type_class_reference ] [ method_attribute_list ] '{' javascript_code_block '}'
/// summary values:CLIENTMETHOD
/// summary=K&C&P&[C]&P&[K&C]&[C]&P&C&P
Method ClassClientMethod(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C&P&[C]&P&[K&C]&[C]&P&C&P
	if '(..isKeyword("CLIENTMETHOD",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"CLIENTMETHOD")  {
		if ..MethodName(.subElement,.addedElement)  {
			if ..addPunctuation(.subElement,"(")  {
				if $S(..FormalSpecList(.subElement,.addedElement) :1,1:1) {
					if ..addPunctuation(.subElement,")")  {
						if ..ClassClientMethod36OptGrp(.subElement,.addedElement)  {
							if $S(..MethodAttributeList(.subElement,.addedElement) :1,1:1) {
								if ..addPunctuation(.subElement,"{")  {
									if ..JavascriptCodeBlock(.subElement,.addedElement)  {
										if ..addPunctuation(.subElement,"}")  {
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
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary values:AS
/// summary=K&C
Method ClassClientMethod36OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&C
	if '(..isKeyword("AS",.value)) { quit 1 /* not found is OK */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"AS")  {
		if ..TypeClassReference(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=1 /* failure rollsback but returns OK */
	}
	quit ok
}

///  class_definition ::= 'class' class_name [ 'extends' ( class_reference_list | class_reference ) ] [class_attributes] class_member_section
/// summary values:CLASS
/// summary=K&C&[K&(C|C)]&[C]&C
Method ClassDefinition(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C&[K&(C|C)]&[C]&C
	if '(..isKeyword("CLASS",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"CLASS")  {
		if ..ClassName(.subElement,.addedElement)  {
			if ..ClassDefinition11OptGrp(.subElement,.addedElement)  {
				if $S(..ClassAttributes(.subElement,.addedElement) :1,1:1) {
					if ..ClassMemberSection(.subElement,.addedElement)  {
						set done=1 ; end compileRules
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary values:EXTENDS
/// summary=K&(C|C)
Method ClassDefinition11OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&(C|C)
	if '(..isKeyword("EXTENDS",.value)) { quit 1 /* not found is OK */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"EXTENDS")  {
		if ..ClassDefinition12Sub(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=1 /* failure rollsback but returns OK */
	}
	quit ok
}

///  class_reference_list | class_reference
/// summary=C|C
Method ClassDefinition12Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..ClassReferenceList(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ClassReference(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  class_ForeignKey ::= 'foreignkey' foreignkey_name [ '(' key_props ')' ] 'references' class_reference [ '(' [ref_props] ')' ] [ foreignKey_attribute_list ] ';'
/// summary values:FOREIGNKEY
/// summary=K&C&[P&C&P]&K&C&[P&[C]&P]&[C]&P
Method ClassForeignkey(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C&[P&C&P]&K&C&[P&[C]&P]&[C]&P
	if '(..isKeyword("FOREIGNKEY",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"FOREIGNKEY")  {
		if ..ForeignkeyName(.subElement,.addedElement)  {
			if ..ClassForeignkey38OptGrp(.subElement,.addedElement)  {
				if ..addKeyword(.subElement,"REFERENCES")  {
					if ..ClassReference(.subElement,.addedElement)  {
						if ..ClassForeignkey39OptGrp(.subElement,.addedElement)  {
							if $S(..ForeignkeyAttributeList(.subElement,.addedElement) :1,1:1) {
								if ..addPunctuation(.subElement,";")  {
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
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary values:(
/// summary=P&C&P
Method ClassForeignkey38OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 1 /* not found is OK */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if ..KeyProps(.subElement,.addedElement)  {
			if ..addPunctuation(.subElement,")")  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=1 /* failure rollsback but returns OK */
	}
	quit ok
}

/// 
/// summary values:(
/// summary=P&[C]&P
Method ClassForeignkey39OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&[C]&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 1 /* not found is OK */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if $S(..RefProps(.subElement,.addedElement) :1,1:1) {
			if ..addPunctuation(.subElement,")")  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=1 /* failure rollsback but returns OK */
	}
	quit ok
}

///  class_identifier ::= 'regexp:(\%|[a-zA-Z])[a-zA-Z0-9\.]*'
/// summary=R
Method ClassIdentifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary R
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..addRegex(.subElement,"(\%|[a-zA-Z])[a-zA-Z0-9\.]*")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  class_index ::= 'index' index_name [ 'on' index_property_expression_list ] [ index_attributes ] [ 'as' type_class_reference ]';'
/// summary values:INDEX
/// summary=K&C&[K&C]&[C]&[K&C]&P
Method ClassIndex(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C&[K&C]&[C]&[K&C]&P
	if '(..isKeyword("INDEX",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"INDEX")  {
		if ..IndexName(.subElement,.addedElement)  {
			if ..ClassIndex111OptGrp(.subElement,.addedElement)  {
				if $S(..IndexAttributes(.subElement,.addedElement) :1,1:1) {
					if ..ClassIndex112OptGrp(.subElement,.addedElement)  {
						if ..addPunctuation(.subElement,";")  {
							set done=1 ; end compileRules
						}
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary values:ON
/// summary=K&C
Method ClassIndex111OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&C
	if '(..isKeyword("ON",.value)) { quit 1 /* not found is OK */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"ON")  {
		if ..IndexPropertyExpressionList(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=1 /* failure rollsback but returns OK */
	}
	quit ok
}

/// 
/// summary values:AS
/// summary=K&C
Method ClassIndex112OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&C
	if '(..isKeyword("AS",.value)) { quit 1 /* not found is OK */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"AS")  {
		if ..TypeClassReference(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=1 /* failure rollsback but returns OK */
	}
	quit ok
}

///  class_item_identifier ::= string | identifier
/// summary=C|C
Method ClassItemIdentifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..String(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Identifier(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  class_language_name ::= 'cache' | 'basic' | 'javascript' | 'java' | 'mvbasic' | 'tsql' | 'cpp' | 'objectscript' | 'python'
/// summary values:CACHE,BASIC,JAVASCRIPT,JAVA,MVBASIC,TSQL,CPP,OBJECTSCRIPT,PYTHON
/// summary=K|K|K|K|K|K|K|K|K
Method ClassLanguageName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K|K|K|K|K|K|K|K
	if '(..isKeywordInList($lb("CACHE","BASIC","JAVASCRIPT","JAVA","MVBASIC","TSQL","CPP","OBJECTSCRIPT","PYTHON"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"CACHE")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"BASIC")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"JAVASCRIPT")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"JAVA")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"MVBASIC")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"TSQL")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"CPP")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"OBJECTSCRIPT")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"PYTHON")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  class_member_list ::= one_classMember ( one_classMember )*
/// summary=C&(?4punctuation:4?)*
Method ClassMemberList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OneClassmember(.subElement,.addedElement)  {
		if ..ClassMemberList17RepZero(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ( one_classMember )*
Method ClassMemberList17RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ClassMemberList18Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  one_classMember
/// summary=C
Method ClassMemberList18Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C
	set subElement=ParentElement
	set done=0 ; method start
	if ..OneClassmember(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  class_member_section ::= '{' class_member_list? '}'
/// summary values:{
/// summary=P&?4OptionalSingle4?&P
Method ClassMemberSection(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?4OptionalSingle4?&P
	; first rule summary P
	if '(..isStringSingle("{",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"{")  {
		if $s(..ClassMemberList(.subElement,.addedElement) :1,1:1)  {
			if ..addPunctuation(.subElement,"}")  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  class_method ::= 'method' method_name '(' [ formal_spec_list ] ')' [ 'as' return_type_class_reference ] [ method_attribute_list ] '{' method_body '}'
/// summary values:METHOD
/// summary=K&C&P&[C]&P&[K&C]&[C]&P&C&P
Method ClassMethod(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C&P&[C]&P&[K&C]&[C]&P&C&P
	if '(..isKeyword("METHOD",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"METHOD")  {
		if ..MethodName(.subElement,.addedElement)  {
			if ..addPunctuation(.subElement,"(")  {
				if $S(..FormalSpecList(.subElement,.addedElement) :1,1:1) {
					if ..addPunctuation(.subElement,")")  {
						if ..ClassMethod31OptGrp(.subElement,.addedElement)  {
							if $S(..MethodAttributeList(.subElement,.addedElement) :1,1:1) {
								if ..addPunctuation(.subElement,"{")  {
									if ..MethodBody(.subElement,.addedElement)  {
										if ..addPunctuation(.subElement,"}")  {
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
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary values:AS
/// summary=K&C
Method ClassMethod31OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&C
	if '(..isKeyword("AS",.value)) { quit 1 /* not found is OK */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"AS")  {
		if ..ReturnTypeClassReference(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=1 /* failure rollsback but returns OK */
	}
	quit ok
}

///  class_name ::= class_identifier
/// summary=C
Method ClassName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ClassIdentifier(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  class_parameter ::= 'parameter' class_parameter_name [ 'as' class_parameter_type ] [ class_parameter_attribute_list ] [ '=' class_parameter_value ] ';'
/// summary values:PARAMETER
/// summary=K&C&[K&C]&[C]&[P&C]&P
Method ClassParameter(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C&[K&C]&[C]&[P&C]&P
	if '(..isKeyword("PARAMETER",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"PARAMETER")  {
		if ..ClassParameterName(.subElement,.addedElement)  {
			if ..ClassParameter45OptGrp(.subElement,.addedElement)  {
				if $S(..ClassParameterAttributeList(.subElement,.addedElement) :1,1:1) {
					if ..ClassParameter46OptGrp(.subElement,.addedElement)  {
						if ..addPunctuation(.subElement,";")  {
							set done=1 ; end compileRules
						}
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary values:AS
/// summary=K&C
Method ClassParameter45OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&C
	if '(..isKeyword("AS",.value)) { quit 1 /* not found is OK */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"AS")  {
		if ..ClassParameterType(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=1 /* failure rollsback but returns OK */
	}
	quit ok
}

/// 
/// summary values:=
/// summary=P&C
Method ClassParameter46OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle("=",.value)) { quit 1 /* not found is OK */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"=")  {
		if ..ClassParameterValue(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=1 /* failure rollsback but returns OK */
	}
	quit ok
}

///  class_parameter_attribute ::= attribute_Abstract | attribute_Constraint | attribute_Final | attribute_Flags | attribute_Internal | attribute_Deprecated
/// summary=C|C|C|C|C|C
Method ClassParameterAttribute(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C|C|C|C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..AttributeAbstract(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeConstraint(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeFinal(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeFlags(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeInternal(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeDeprecated(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  class_parameter_attribute_list ::= '[' class_parameter_attribute ( ',' class_parameter_attribute )* ']'
/// summary values:[
/// summary=P&C&(?4punctuation:4?)*&P
Method ClassParameterAttributeList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&(?4punctuation:4?)*&P
	; first rule summary P
	if '(..isStringSingle("[",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"[")  {
		if ..ClassParameterAttribute(.subElement,.addedElement)  {
			if ..ClassParameterAttributeList48RepZero(.subElement,.addedElement)  {
				if ..addPunctuation(.subElement,"]")  {
					set done=1 ; end compileRules
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ( ',' class_parameter_attribute )*
Method ClassParameterAttributeList48RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ClassParameterAttributeList49Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' class_parameter_attribute
/// summary values:,
/// summary=P&C
Method ClassParameterAttributeList49Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..ClassParameterAttribute(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	quit ok
}

///  class_parameter_name ::= class_item_identifier
/// summary=C
Method ClassParameterName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ClassItemIdentifier(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  class_parameter_type ::= 'COSEXPRESSION' | 'BOOLEAN' | 'STRING' | 'INTEGER' | 'CONFIGVALUE' | class_reference
/// summary=K|K|K|K|K|C
Method ClassParameterType(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K|K|K|K|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"COSEXPRESSION")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"BOOLEAN")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"STRING")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"INTEGER")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"CONFIGVALUE")  {
		set done=1 ; or
	} elseif ..ClassReference(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  class_parameter_value ::= string | number | ( '{' expression '}' )
/// summary=C|C|(P&C&P)
Method ClassParameterValue(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C|(P&C&P)
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..String(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Number(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ClassParameterValue47Sub(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  '{' expression '}'
/// summary values:{
/// summary=P&C&P
Method ClassParameterValue47Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&P
	; first rule summary P
	if '(..isStringSingle("{",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"{")  {
		if ..Expression(.subElement,.addedElement)  {
			if ..addPunctuation(.subElement,"}")  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	quit ok
}

///  class_projection ::= 'projection' projection_name [ class_projection_type ] [ class_property_attributes ] ';'
/// summary values:PROJECTION
/// summary=K&C&[C]&[C]&P
Method ClassProjection(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C&[C]&[C]&P
	if '(..isKeyword("PROJECTION",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"PROJECTION")  {
		if ..ProjectionName(.subElement,.addedElement)  {
			if $S(..ClassProjectionType(.subElement,.addedElement) :1,1:1) {
				if $S(..ClassPropertyAttributes(.subElement,.addedElement) :1,1:1) {
					if ..addPunctuation(.subElement,";")  {
						set done=1 ; end compileRules
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  class_projection_type ::= 'as' type_class_reference
/// summary values:AS
/// summary=K&C
Method ClassProjectionType(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C
	if '(..isKeyword("AS",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"AS")  {
		if ..TypeClassReference(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  class_property ::= 'property' property_name [ class_property_type ] [ class_property_attributes ] ';'
/// summary values:PROPERTY
/// summary=K&C&[C]&[C]&P
Method ClassProperty(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C&[C]&[C]&P
	if '(..isKeyword("PROPERTY",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"PROPERTY")  {
		if ..PropertyName(.subElement,.addedElement)  {
			if $S(..ClassPropertyType(.subElement,.addedElement) :1,1:1) {
				if $S(..ClassPropertyAttributes(.subElement,.addedElement) :1,1:1) {
					if ..addPunctuation(.subElement,";")  {
						set done=1 ; end compileRules
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  class_property_attribute ::= attribute_Aliases | attribute_Calculated | attribute_Cardinality | attribute_ClientName | attribute_Deprecated | attribute_Final | attribute_Identity | attribute_InitialExpression | attribute_Internal | attribute_Inverse | attribute_MultiDimensional | attribute_OnDelete | attribute_Private | attribute_ReadOnly | attribute_Required | attribute_ServerOnly | attribute_SQLColumnNumber | attribute_SQLComputeCode | attribute_SQLComputed | attribute_SQLComputeOnChange | attribute_SQLFieldname | attribute_SQLListDelimiter | attribute_SQLListType | attribute_Transient | attribute_Not
/// summary=C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C
Method ClassPropertyAttribute(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..AttributeAliases(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeCalculated(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeCardinality(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeClientname(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeDeprecated(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeFinal(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeIdentity(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeInitialexpression(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeInternal(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeInverse(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeMultidimensional(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeOndelete(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributePrivate(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeReadonly(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeRequired(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeServeronly(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeSqlcolumnnumber(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeSqlcomputecode(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeSqlcomputed(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeSqlcomputeonchange(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeSqlfieldname(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeSqllistdelimiter(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeSqllisttype(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeTransient(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeNot(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  class_property_attribute_list ::= class_property_attribute ( ',' class_property_attribute )*
/// summary=C&(?4punctuation:4?)*
Method ClassPropertyAttributeList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ClassPropertyAttribute(.subElement,.addedElement)  {
		if ..ClassPropertyAttributeList25RepZero(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ( ',' class_property_attribute )*
Method ClassPropertyAttributeList25RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ClassPropertyAttributeList26Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' class_property_attribute
/// summary values:,
/// summary=P&C
Method ClassPropertyAttributeList26Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..ClassPropertyAttribute(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	quit ok
}

///  class_property_attributes ::= '[' class_property_attribute_list ']'
/// summary values:[
/// summary=P&C&P
Method ClassPropertyAttributes(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&P
	; first rule summary P
	if '(..isStringSingle("[",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"[")  {
		if ..ClassPropertyAttributeList(.subElement,.addedElement)  {
			if ..addPunctuation(.subElement,"]")  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  class_property_type ::= ('as' [ ( 'array' | 'list' ) 'of' ] type_class_reference ) | type_parameters
/// summary=(K&[(K|K)&K]&C)|C
Method ClassPropertyType(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K&[(K|K)&K]&C)|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ClassPropertyType22Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..TypeParameters(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 'as' [ ( 'array' | 'list' ) 'of' ] type_class_reference
/// summary values:AS
/// summary=K&[(K|K)&K]&C
Method ClassPropertyType22Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&[(K|K)&K]&C
	if '(..isKeyword("AS",.value)) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"AS")  {
		if ..ClassPropertyType23OptGrp(.subElement,.addedElement)  {
			if ..TypeClassReference(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	quit ok
}

/// 
/// summary values:ARRAY,LIST
/// summary=(K|K)&K
Method ClassPropertyType23OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary (K|K)&K
	if '(..isKeywordInList($lb("ARRAY","LIST"),.value)) { quit 1 /* not found is OK */ /*1*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ClassPropertyType24Sub(.subElement,.addedElement)  {
		if ..addKeyword(.subElement,"OF")  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=1 /* failure rollsback but returns OK */
	}
	quit ok
}

///  'array' | 'list'
/// summary values:ARRAY,LIST
/// summary=K|K
Method ClassPropertyType24Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K|K
	if '(..isKeywordInList($lb("ARRAY","LIST"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"ARRAY")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"LIST")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  class_query ::= 'query' query_name '(' [ formal_spec_list ] ')' [ 'as' type_class_reference ] [ class_query_attributes ] '{' class_query_body '}'
/// summary values:QUERY
/// summary=K&C&P&[C]&P&[K&C]&[C]&P&C&P
Method ClassQuery(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C&P&[C]&P&[K&C]&[C]&P&C&P
	if '(..isKeyword("QUERY",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"QUERY")  {
		if ..QueryName(.subElement,.addedElement)  {
			if ..addPunctuation(.subElement,"(")  {
				if $S(..FormalSpecList(.subElement,.addedElement) :1,1:1) {
					if ..addPunctuation(.subElement,")")  {
						if ..ClassQuery87OptGrp(.subElement,.addedElement)  {
							if $S(..ClassQueryAttributes(.subElement,.addedElement) :1,1:1) {
								if ..addPunctuation(.subElement,"{")  {
									if ..ClassQueryBody(.subElement,.addedElement)  {
										if ..addPunctuation(.subElement,"}")  {
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
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary values:AS
/// summary=K&C
Method ClassQuery87OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&C
	if '(..isKeyword("AS",.value)) { quit 1 /* not found is OK */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"AS")  {
		if ..TypeClassReference(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=1 /* failure rollsback but returns OK */
	}
	quit ok
}

///  class_query_attribute ::= attribute_ClientName | attribute_Deprecated | attribute_Final | attribute_Internal | attribute_Private | attribute_SOAPBindingStyle | attribute_SOAPBodyuse | attribute_SOAPNameSpace | attribute_SQLName | attribute_SQLProc | attribute_SQLView | attribute_SQLViewname | attribute_WebMethod
/// summary=C|C|C|C|C|C|C|C|C|C|C|C|C
Method ClassQueryAttribute(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C|C|C|C|C|C|C|C|C|C|C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..AttributeClientname(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeDeprecated(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeFinal(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeInternal(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributePrivate(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeSoapbindingstyle(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeSoapbodyuse(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeSoapnamespace(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeSqlname(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeSqlproc(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeSqlview(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeSqlviewname(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeWebmethod(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  class_query_attributes ::= '[' class_query_attribute ( ',' class_query_attribute )* ']'
/// summary values:[
/// summary=P&C&(?4punctuation:4?)*&P
Method ClassQueryAttributes(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&(?4punctuation:4?)*&P
	; first rule summary P
	if '(..isStringSingle("[",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"[")  {
		if ..ClassQueryAttribute(.subElement,.addedElement)  {
			if ..ClassQueryAttributes88RepZero(.subElement,.addedElement)  {
				if ..addPunctuation(.subElement,"]")  {
					set done=1 ; end compileRules
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ( ',' class_query_attribute )*
Method ClassQueryAttributes88RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ClassQueryAttributes89Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' class_query_attribute
/// summary values:,
/// summary=P&C
Method ClassQueryAttributes89Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..ClassQueryAttribute(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	quit ok
}

///  class_query_body ::= text_brace_block
/// summary=C
Method ClassQueryBody(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..TextBraceBlock(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  class_reference ::= class_identifier
/// summary=C
Method ClassReference(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ClassIdentifier(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  class_reference_list ::= '(' [class_reference] ( ',' class_reference )* ')'
/// summary values:(
/// summary=P&[C]&(?4punctuation:4?)*&P
Method ClassReferenceList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&[C]&(?4punctuation:4?)*&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if $S(..ClassReference(.subElement,.addedElement) :1,1:1) {
			if ..ClassReferenceList13RepZero(.subElement,.addedElement)  {
				if ..addPunctuation(.subElement,")")  {
					set done=1 ; end compileRules
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ( ',' class_reference )*
Method ClassReferenceList13RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ClassReferenceList14Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' class_reference
/// summary values:,
/// summary=P&C
Method ClassReferenceList14Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..ClassReference(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	quit ok
}

///  class_relationship ::= 'relationship' property_name [ class_property_type ] class_property_attributes ';'
/// summary values:RELATIONSHIP
/// summary=K&C&[C]&C&P
Method ClassRelationship(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C&[C]&C&P
	if '(..isKeyword("RELATIONSHIP",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"RELATIONSHIP")  {
		if ..PropertyName(.subElement,.addedElement)  {
			if $S(..ClassPropertyType(.subElement,.addedElement) :1,1:1) {
				if ..ClassPropertyAttributes(.subElement,.addedElement)  {
					if ..addPunctuation(.subElement,";")  {
						set done=1 ; end compileRules
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  class_storage ::= 'storage' storage_name '{' storage_xml '}'
/// summary values:STORAGE
/// summary=K&C&P&C&P
Method ClassStorage(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C&P&C&P
	if '(..isKeyword("STORAGE",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"STORAGE")  {
		if ..StorageName(.subElement,.addedElement)  {
			if ..addPunctuation(.subElement,"{")  {
				if ..StorageXml(.subElement,.addedElement)  {
					if ..addPunctuation(.subElement,"}")  {
						set done=1 ; end compileRules
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  class_trigger ::= 'trigger' trigger_name [ trigger_attribute_list ] '{' [ trigger_code_block ] '}'
/// summary values:TRIGGER
/// summary=K&C&[C]&P&[C]&P
Method ClassTrigger(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C&[C]&P&[C]&P
	if '(..isKeyword("TRIGGER",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"TRIGGER")  {
		if ..TriggerName(.subElement,.addedElement)  {
			if $S(..TriggerAttributeList(.subElement,.addedElement) :1,1:1) {
				if ..addPunctuation(.subElement,"{")  {
					if $S(..TriggerCodeBlock(.subElement,.addedElement) :1,1:1) {
						if ..addPunctuation(.subElement,"}")  {
							set done=1 ; end compileRules
						}
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  class_type_name ::= 'datatype' | 'persistent' | 'serial' | 'stream' | 'view' | 'index' | 'donotuse' | 'dynamic' | '""'
/// summary=K|K|K|K|K|K|K|K|P
Method ClassTypeName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K|K|K|K|K|K|K|P
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"DATATYPE")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"PERSISTENT")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"SERIAL")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"STREAM")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"VIEW")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"INDEX")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"DONOTUSE")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"DYNAMIC")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"""""")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  class_xdata ::= 'xdata' xdata_name [xdata_attributes ] '{' (xdata_text | xdata_xml | xdata_json ) '}'
/// summary values:XDATA
/// summary=K&C&[C]&P&(C|C|C)&P
Method ClassXdata(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C&[C]&P&(C|C|C)&P
	if '(..isKeyword("XDATA",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"XDATA")  {
		if ..XdataName(.subElement,.addedElement)  {
			if $S(..XdataAttributes(.subElement,.addedElement) :1,1:1) {
				if ..addPunctuation(.subElement,"{")  {
					if ..ClassXdata90Sub(.subElement,.addedElement)  {
						if ..addPunctuation(.subElement,"}")  {
							set done=1 ; end compileRules
						}
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// xdata_text | xdata_xml | xdata_json
/// summary=C|C|C
Method ClassXdata90Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..XdataText(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..XdataXml(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..XdataJson(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  client_data_type_name ::= 'bigint' | 'binary' | 'binarystream' | 'boolean' | 'characterstream' | 'currency' | 'date' | 'decimal' | 'double' | 'fdate' | 'ftimestamp' | 'handle' | 'integer' | 'list' | 'longvarchar' | 'numeric' | 'status' | 'timestamp' | 'time' | 'varchar' | 'MVDATE'
/// summary values:BIGINT,BINARY,BINARYSTREAM,BOOLEAN,CHARACTERSTREAM,CURRENCY,DATE,DECIMAL,DOUBLE,FDATE,FTIMESTAMP,HANDLE,INTEGER,LIST,LONGVARCHAR,NUMERIC,STATUS,TIMESTAMP,TIME,VARCHAR,MVDATE
/// summary=K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K
Method ClientDataTypeName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K
	if '(..isKeywordInList($lb("BIGINT","BINARY","BINARYSTREAM","BOOLEAN","CHARACTERSTREAM","CURRENCY","DATE","DECIMAL","DOUBLE","FDATE","FTIMESTAMP","HANDLE","INTEGER","LIST","LONGVARCHAR","NUMERIC","STATUS","TIMESTAMP","TIME","VARCHAR","MVDATE"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"BIGINT")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"BINARY")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"BINARYSTREAM")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"BOOLEAN")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"CHARACTERSTREAM")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"CURRENCY")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"DATE")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"DECIMAL")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"DOUBLE")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"FDATE")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"FTIMESTAMP")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"HANDLE")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"INTEGER")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"LIST")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"LONGVARCHAR")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"NUMERIC")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"STATUS")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"TIMESTAMP")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"TIME")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"VARCHAR")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"MVDATE")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  client_identifier ::= 'regexp:(\%|\_|[a-zA-Z])[a-zA-Z0-9]\_\.*'
/// summary=R
Method ClientIdentifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary R
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..addRegex(.subElement,"(\%|\_|[a-zA-Z])[a-zA-Z0-9]\_\.*")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  collation_type ::= 'exact' | 'mvr' | 'sqlstring' | ('sqlupper' [ '(' number ')' ] )| 'truncate' | 'plus' | 'minus' | 'alphaup' | 'string' | 'upper' | 'space'
/// summary=K|K|K|(K&[P&C&P])|K|K|K|K|K|K|K
Method CollationType(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K|K|(K&[P&C&P])|K|K|K|K|K|K|K
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"EXACT")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"MVR")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"SQLSTRING")  {
		set done=1 ; or
	} elseif ..CollationType117Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"TRUNCATE")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"PLUS")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"MINUS")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"ALPHAUP")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"STRING")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"UPPER")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"SPACE")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 'sqlupper' [ '(' number ')' ]
/// summary values:SQLUPPER
/// summary=K&[P&C&P]
Method CollationType117Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&[P&C&P]
	if '(..isKeyword("SQLUPPER",.value)) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"SQLUPPER")  {
		if ..CollationType118OptGrp(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	quit ok
}

/// 
/// summary values:(
/// summary=P&C&P
Method CollationType118OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 1 /* not found is OK */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if ..Number(.subElement,.addedElement)  {
			if ..addPunctuation(.subElement,")")  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=1 /* failure rollsback but returns OK */
	}
	quit ok
}

///  cos_code_block ::= 'NEEDS COS CODE BLOCK'
/// summary values:NEEDS COS CODE BLOCK
/// summary=P
Method CosCodeBlock(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("NEEDS COS CODE BLOCK",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"NEEDS COS CODE BLOCK")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  cos_code_block_sql ::= 'NEEDS COS SQL CODE BLOCK'
/// summary values:NEEDS COS SQL CODE BLOCK
/// summary=P
Method CosCodeBlockSql(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("NEEDS COS SQL CODE BLOCK",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"NEEDS COS SQL CODE BLOCK")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  cos_code_block_sql_storage ::= 'NEEDS COS SQL CODE BLOCK'
/// summary values:NEEDS COS SQL CODE BLOCK
/// summary=P
Method CosCodeBlockSqlStorage(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("NEEDS COS SQL CODE BLOCK",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"NEEDS COS SQL CODE BLOCK")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  cos_code_block_storage ::= ('<!' '[CDATA[' cos_code_block_sql_storage ']]' '>') | cos_code_block_sql_storage
/// summary=(P&P&C&P&P)|C
Method CosCodeBlockStorage(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (P&P&C&P&P)|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CosCodeBlockStorage189Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CosCodeBlockSqlStorage(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// '<!' '[CDATA[' cos_code_block_sql_storage ']]' '>'
/// summary values:<!
/// summary=P&P&C&P&P
Method CosCodeBlockStorage189Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&P&C&P&P
	; first rule summary P
	if '(..isStringSingle("<!",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"<!")  {
		if ..addPunctuation(.subElement,"[CDATA[")  {
			if ..CosCodeBlockSqlStorage(.subElement,.addedElement)  {
				if ..addPunctuation(.subElement,"]]")  {
					if ..addPunctuation(.subElement,">")  {
						set done=1 ; end compileRules
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	quit ok
}

///  cos_code_block_trigger ::= 'NEEDS COS SQL CODE BLOCK'
/// summary values:NEEDS COS SQL CODE BLOCK
/// summary=P
Method CosCodeBlockTrigger(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("NEEDS COS SQL CODE BLOCK",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"NEEDS COS SQL CODE BLOCK")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  cos_expression_sql ::= 'NEEDS COS EXPRESSION SQL'
/// summary values:NEEDS COS EXPRESSION SQL
/// summary=P
Method CosExpressionSql(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("NEEDS COS EXPRESSION SQL",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"NEEDS COS EXPRESSION SQL")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  cos_expression_storage ::= ('<!' '[CDATA[' cos_expression_sql ']]' '>') | cos_expression_sql
/// summary=(P&P&C&P&P)|C
Method CosExpressionStorage(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (P&P&C&P&P)|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CosExpressionStorage188Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CosExpressionSql(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// '<!' '[CDATA[' cos_expression_sql ']]' '>'
/// summary values:<!
/// summary=P&P&C&P&P
Method CosExpressionStorage188Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&P&C&P&P
	; first rule summary P
	if '(..isStringSingle("<!",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"<!")  {
		if ..addPunctuation(.subElement,"[CDATA[")  {
			if ..CosExpressionSql(.subElement,.addedElement)  {
				if ..addPunctuation(.subElement,"]]")  {
					if ..addPunctuation(.subElement,">")  {
						set done=1 ; end compileRules
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	quit ok
}

///  event_keyword ::= 'insert/update/delete' | 'insert/update' | 'insert/delete' | 'update/delete' | 'delete' | 'insert' | 'update'
/// summary values:INSERT/UPDATE/DELETE,INSERT/UPDATE,INSERT/DELETE,UPDATE/DELETE,DELETE,INSERT,UPDATE
/// summary=K|K|K|K|K|K|K
Method EventKeyword(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K|K|K|K|K|K
	if '(..isKeywordInList($lb("INSERT/UPDATE/DELETE","INSERT/UPDATE","INSERT/DELETE","UPDATE/DELETE","DELETE","INSERT","UPDATE"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"INSERT/UPDATE/DELETE")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"INSERT/UPDATE")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"INSERT/DELETE")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"UPDATE/DELETE")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"DELETE")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"INSERT")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"UPDATE")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  expression ::= 'NEEDS EXPRESSION'
/// summary values:NEEDS EXPRESSION
/// summary=P
Method Expression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("NEEDS EXPRESSION",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"NEEDS EXPRESSION")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  fieldname ::= property_reference
/// summary=C
Method Fieldname(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..PropertyReference(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  filename ::= 'NEEDS FILE NAME'
/// summary values:NEEDS FILE NAME
/// summary=P
Method Filename(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("NEEDS FILE NAME",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"NEEDS FILE NAME")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  foreach_type ::= 'row' | 'row/object' | 'statement'
/// summary values:ROW,ROW/OBJECT,STATEMENT
/// summary=K|K|K
Method ForeachType(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K|K
	if '(..isKeywordInList($lb("ROW","ROW/OBJECT","STATEMENT"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"ROW")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"ROW/OBJECT")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"STATEMENT")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  foreignKey_attribute_list ::= '[' one_foreignkey_atttribute ( ',' one_foreignkey_atttribute )* ']'
/// summary values:[
/// summary=P&C&(?4punctuation:4?)*&P
Method ForeignkeyAttributeList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&(?4punctuation:4?)*&P
	; first rule summary P
	if '(..isStringSingle("[",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"[")  {
		if ..OneForeignkeyAtttribute(.subElement,.addedElement)  {
			if ..ForeignkeyAttributeList43RepZero(.subElement,.addedElement)  {
				if ..addPunctuation(.subElement,"]")  {
					set done=1 ; end compileRules
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ( ',' one_foreignkey_atttribute )*
Method ForeignkeyAttributeList43RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ForeignkeyAttributeList44Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' one_foreignkey_atttribute
/// summary values:,
/// summary=P&C
Method ForeignkeyAttributeList44Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..OneForeignkeyAtttribute(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	quit ok
}

///  foreignkey_name ::= class_item_identifier
/// summary=C
Method ForeignkeyName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ClassItemIdentifier(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  formal_spec_item ::= [ formal_spec_mode ] variable_set ['...'] [ as_type_class_reference ] [ parameter_default_value ]
/// summary=[C]&C&[P]&[C]&[C]
Method FormalSpecItem(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary [C]&C&[P]&[C]&[C]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..FormalSpecMode(.subElement,.addedElement) :1,1:1) {
		if ..VariableSet(.subElement,.addedElement)  {
			if $S(..addPunctuation(.subElement,"...") :1,1:1) {
				if $S(..AsTypeClassReference(.subElement,.addedElement) :1,1:1) {
					if $S(..ParameterDefaultValue(.subElement,.addedElement) :1,1:1) {
						set done=1 ; end compileRules
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  formal_spec_list ::= formal_spec_item( ',' formal_spec_item )*
/// summary=C&(?4punctuation:4?)*
Method FormalSpecList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..FormalSpecItem(.subElement,.addedElement)  {
		if ..FormalSpecList32RepZero(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// ( ',' formal_spec_item )*
Method FormalSpecList32RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..FormalSpecList33Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' formal_spec_item
/// summary values:,
/// summary=P&C
Method FormalSpecList33Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..FormalSpecItem(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	quit ok
}

///  formal_spec_mode ::= 'byref' | 'output' | 'byval'
/// summary values:BYREF,OUTPUT,BYVAL
/// summary=K|K|K
Method FormalSpecMode(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K|K
	if '(..isKeywordInList($lb("BYREF","OUTPUT","BYVAL"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"BYREF")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"OUTPUT")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"BYVAL")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  global ::= cos_expression_sql
/// summary=C
Method Global(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CosExpressionSql(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  identifier ::= 'regexp:(\%|[a-zA-Z])[a-zA-Z0-9]*'
/// summary=R
Method Identifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary R
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..addRegex(.subElement,"(\%|[a-zA-Z])[a-zA-Z0-9]*")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  import_definition ::= 'import' ( package_name | ( '(' package_list ')' ) )
/// summary values:IMPORT
/// summary=K&(C|(P&C&P))
Method ImportDefinition(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&(C|(P&C&P))
	if '(..isKeyword("IMPORT",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"IMPORT")  {
		if ..ImportDefinition3Sub(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  package_name | ( '(' package_list ')' )
/// summary=C|(P&C&P)
Method ImportDefinition3Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|(P&C&P)
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..PackageName(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ImportDefinition4Sub(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	quit ok
}

///  '(' package_list ')'
/// summary values:(
/// summary=P&C&P
Method ImportDefinition4Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if ..PackageList(.subElement,.addedElement)  {
			if ..addPunctuation(.subElement,")")  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	quit ok
}

///  include_definition ::= 'include' ( include_list | include_name )
/// summary values:INCLUDE
/// summary=K&(C|C)
Method IncludeDefinition(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&(C|C)
	if '(..isKeyword("INCLUDE",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"INCLUDE")  {
		if ..IncludeDefinition6Sub(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  include_list | include_name
/// summary=C|C
Method IncludeDefinition6Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..IncludeList(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..IncludeName(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  include_generator_definition ::= 'includegenerator' ( include_list | include_name )
/// summary values:INCLUDEGENERATOR
/// summary=K&(C|C)
Method IncludeGeneratorDefinition(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&(C|C)
	if '(..isKeyword("INCLUDEGENERATOR",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"INCLUDEGENERATOR")  {
		if ..IncludeGeneratorDefinition5Sub(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  include_list | include_name
/// summary=C|C
Method IncludeGeneratorDefinition5Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..IncludeList(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..IncludeName(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  include_list ::= '(' include_name ( ',' include_name )* ')'
/// summary values:(
/// summary=P&C&(?4punctuation:4?)*&P
Method IncludeList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&(?4punctuation:4?)*&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if ..IncludeName(.subElement,.addedElement)  {
			if ..IncludeList9RepZero(.subElement,.addedElement)  {
				if ..addPunctuation(.subElement,")")  {
					set done=1 ; end compileRules
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ',' include_name
/// summary values:,
/// summary=P&C
Method IncludeList10Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..IncludeName(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	quit ok
}

///  ( ',' include_name )*
Method IncludeList9RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..IncludeList10Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  include_name ::= identifier
/// summary=C
Method IncludeName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Identifier(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  index_attribute ::= attribute_Condition | attribute_Data | attribute_Extent | attribute_IdKey | attribute_Internal | attribute_PrimaryKey | attribute_SQLName | attribute_Type | attribute_Unique
/// summary=C|C|C|C|C|C|C|C|C
Method IndexAttribute(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C|C|C|C|C|C|C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..AttributeCondition(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeData(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeExtent(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeIdkey(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeInternal(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributePrimarykey(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeSqlname(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeType(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeUnique(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  index_attributes ::= '[' index_attribute ( ',' index_attribute )* ']'
/// summary values:[
/// summary=P&C&(?4punctuation:4?)*&P
Method IndexAttributes(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&(?4punctuation:4?)*&P
	; first rule summary P
	if '(..isStringSingle("[",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"[")  {
		if ..IndexAttribute(.subElement,.addedElement)  {
			if ..IndexAttributes119RepZero(.subElement,.addedElement)  {
				if ..addPunctuation(.subElement,"]")  {
					set done=1 ; end compileRules
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ( ',' index_attribute )*
Method IndexAttributes119RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..IndexAttributes120Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' index_attribute
/// summary values:,
/// summary=P&C
Method IndexAttributes120Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..IndexAttribute(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	quit ok
}

///  index_name ::= class_item_identifier
/// summary=C
Method IndexName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ClassItemIdentifier(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  index_property ::= fieldname ['(ELEMENTS)' | '(KEYS)' ] [ 'as' collation_type]
/// summary=C&[P|P]&[K&C]
Method IndexProperty(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&[P|P]&[K&C]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Fieldname(.subElement,.addedElement)  {
		if ..IndexProperty115OptGrp(.subElement,.addedElement)  {
			if ..IndexProperty116OptGrp(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary values:(ELEMENTS),(KEYS)
/// summary=P|P
Method IndexProperty115OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P|P
	if '(..isStringInList($lb("(ELEMENTS)","(KEYS)"),10,.value)) { quit 1 /* not found is OK */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(ELEMENTS)")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"(KEYS)")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=1 /* failure rollsback but returns OK */
	}
	quit ok
}

/// 
/// summary values:AS
/// summary=K&C
Method IndexProperty116OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&C
	if '(..isKeyword("AS",.value)) { quit 1 /* not found is OK */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"AS")  {
		if ..CollationType(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=1 /* failure rollsback but returns OK */
	}
	quit ok
}

///  index_property_expression_list ::= index_property | index_property_list
/// summary=C|C
Method IndexPropertyExpressionList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..IndexProperty(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..IndexPropertyList(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  index_property_list ::= '(' index_property ( ',' index_property )* ')'
/// summary values:(
/// summary=P&C&(?4punctuation:4?)*&P
Method IndexPropertyList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&(?4punctuation:4?)*&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if ..IndexProperty(.subElement,.addedElement)  {
			if ..IndexPropertyList113RepZero(.subElement,.addedElement)  {
				if ..addPunctuation(.subElement,")")  {
					set done=1 ; end compileRules
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ( ',' index_property )*
Method IndexPropertyList113RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..IndexPropertyList114Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' index_property
/// summary values:,
/// summary=P&C
Method IndexPropertyList114Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..IndexProperty(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	quit ok
}

///  inheritance_direction ::= 'left' | 'right'
/// summary values:LEFT,RIGHT
/// summary=K|K
Method InheritanceDirection(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K
	if '(..isKeywordInList($lb("LEFT","RIGHT"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"LEFT")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"RIGHT")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  initial_expression_complex ::= '{' expression '}'
/// summary values:{
/// summary=P&C&P
Method InitialExpressionComplex(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&P
	; first rule summary P
	if '(..isStringSingle("{",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"{")  {
		if ..Expression(.subElement,.addedElement)  {
			if ..addPunctuation(.subElement,"}")  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  initial_expression_simple ::= string | number
/// summary=C|C
Method InitialExpressionSimple(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..String(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Number(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  initialexpression_value ::= initial_expression_complex | initial_expression_simple
/// summary=C|C
Method InitialexpressionValue(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..InitialExpressionComplex(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..InitialExpressionSimple(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  javascript_code_block ::= 'NEEDS JS CODE BLOCK'
/// summary values:NEEDS JS CODE BLOCK
/// summary=P
Method JavascriptCodeBlock(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("NEEDS JS CODE BLOCK",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"NEEDS JS CODE BLOCK")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  json_string ::= 'NEED JSON STRING'
/// summary values:NEED JSON STRING
/// summary=P
Method JsonString(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("NEED JSON STRING",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"NEED JSON STRING")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  key_props ::= name_value_pair_list
/// summary=C
Method KeyProps(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..NameValuePairList(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  method_attribute ::= attribute_Abstract | attribute_ClientName | attribute_CodeMode | attribute_Deprecated | attribute_ExternalProcName | attribute_Final | attribute_ForceGenerate | attribute_GenerateAfter | attribute_Internal | attribute_Language | attribute_NoContext | attribute_NotInheritable | attribute_PlaceAfter | attribute_Private | attribute_ProcedureBlock | attribute_PublicList | attribute_ReturnResultSets | attribute_ServerOnly | attribute_SOAPAction | attribute_SOAPBindingStyle | attribute_SOAPBodyuse | attribute_SOAPMessageName | attribute_SOAPNameSpace | attribute_SOAPRequestMessage | attribute_SOAPTypeNamespace | attribute_SQLName | attribute_SQLProc | attribute_WebMethod | attribute_ZenMethod
/// summary=C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C
Method MethodAttribute(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..AttributeAbstract(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeClientname(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeCodemode(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeDeprecated(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeExternalprocname(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeFinal(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeForcegenerate(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeGenerateafter(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeInternal(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeLanguage(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeNocontext(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeNotinheritable(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributePlaceafter(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributePrivate(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeProcedureblock(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributePubliclist(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeReturnresultsets(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeServeronly(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeSoapaction(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeSoapbindingstyle(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeSoapbodyuse(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeSoapmessagename(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeSoapnamespace(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeSoaprequestmessage(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeSoaptypenamespace(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeSqlname(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeSqlproc(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeWebmethod(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeZenmethod(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  method_attribute_list ::= '[' method_attribute ( ',' method_attribute )* ']'
/// summary values:[
/// summary=P&C&(?4punctuation:4?)*&P
Method MethodAttributeList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&(?4punctuation:4?)*&P
	; first rule summary P
	if '(..isStringSingle("[",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"[")  {
		if ..MethodAttribute(.subElement,.addedElement)  {
			if ..MethodAttributeList34RepZero(.subElement,.addedElement)  {
				if ..addPunctuation(.subElement,"]")  {
					set done=1 ; end compileRules
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ( ',' method_attribute )*
Method MethodAttributeList34RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..MethodAttributeList35Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' method_attribute
/// summary values:,
/// summary=P&C
Method MethodAttributeList35Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..MethodAttribute(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	quit ok
}

///  method_body ::= cos_code_block
/// summary=C
Method MethodBody(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CosCodeBlock(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  method_name ::= class_item_identifier
/// summary=C
Method MethodName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ClassItemIdentifier(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  method_reference ::= class_item_identifier
/// summary=C
Method MethodReference(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ClassItemIdentifier(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  mime_type ::= 'regex:[a-zA-Z][a-zA-Z0-9]*\/[a-zA-Z][a-zA-Z0-9]*'
/// summary values:REGEX:[A-ZA-Z][A-ZA-Z0-9]*\/[A-ZA-Z][A-ZA-Z0-9]*
/// summary=P
Method MimeType(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("REGEX:[A-ZA-Z][A-ZA-Z0-9]*\/[A-ZA-Z][A-ZA-Z0-9]*",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"regex:[a-zA-Z][a-zA-Z0-9]*\/[a-zA-Z][a-zA-Z0-9]*")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  name_value_pair_list ::= one_name_value_pair ( ',' one_name_value_pair )*
/// summary=C&(?4punctuation:4?)*
Method NameValuePairList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OneNameValuePair(.subElement,.addedElement)  {
		if ..NameValuePairList40RepZero(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ( ',' one_name_value_pair )*
Method NameValuePairList40RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..NameValuePairList41Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' one_name_value_pair
/// summary values:,
/// summary=P&C
Method NameValuePairList41Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..OneNameValuePair(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	quit ok
}

///  number ::= ['-'] ('regexp:[0-9]*' [ '.' 'regexp:[0-9]+'] [ ('e' | 'E') 'regexp:[0-9]+']) | ('.' 'regexp:[0-9]+' [ ('e' | 'E') 'regexp:[0-9]+'])
/// summary=[P]&(R&[P&R]&[(K|K)&R])|(P&R&[(K|K)&R])
Method Number(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary [P]&(R&[P&R]&[(K|K)&R])|(P&R&[(K|K)&R])
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..addPunctuation(.subElement,"-") :1,1:1) {
		if ..Number180Sub(.subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..Number184Sub(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 'regexp:[0-9]*' [ '.' 'regexp:[0-9]+'] [ ('e' | 'E') 'regexp:[0-9]+']
/// summary=R&[P&R]&[(K|K)&R]
Method Number180Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary R&[P&R]&[(K|K)&R]
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addRegex(.subElement,"[0-9]*")  {
		if ..Number181OptGrp(.subElement,.addedElement)  {
			if ..Number182OptGrp(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	quit ok
}

/// 
/// summary values:.
/// summary=P&R
Method Number181OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&R
	; first rule summary P
	if '(..isStringSingle(".",.value)) { quit 1 /* not found is OK */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,".")  {
		if ..addRegex(.subElement,"[0-9]+")  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=1 /* failure rollsback but returns OK */
	}
	quit ok
}

/// 
/// summary values:E,E
/// summary=(K|K)&R
Method Number182OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary (K|K)&R
	if '(..isKeywordInList($lb("E","E"),.value)) { quit 1 /* not found is OK */ /*1*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Number183Sub(.subElement,.addedElement)  {
		if ..addRegex(.subElement,"[0-9]+")  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=1 /* failure rollsback but returns OK */
	}
	quit ok
}

/// 'e' | 'E'
/// summary values:E,E
/// summary=K|K
Method Number183Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K|K
	if '(..isKeywordInList($lb("E","E"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"E")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"E")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

/// '.' 'regexp:[0-9]+' [ ('e' | 'E') 'regexp:[0-9]+']
/// summary values:.
/// summary=P&R&[(K|K)&R]
Method Number184Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&R&[(K|K)&R]
	; first rule summary P
	if '(..isStringSingle(".",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,".")  {
		if ..addRegex(.subElement,"[0-9]+")  {
			if ..Number185OptGrp(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	quit ok
}

/// 
/// summary values:E,E
/// summary=(K|K)&R
Method Number185OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary (K|K)&R
	if '(..isKeywordInList($lb("E","E"),.value)) { quit 1 /* not found is OK */ /*1*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Number186Sub(.subElement,.addedElement)  {
		if ..addRegex(.subElement,"[0-9]+")  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=1 /* failure rollsback but returns OK */
	}
	quit ok
}

/// 'e' | 'E'
/// summary values:E,E
/// summary=K|K
Method Number186Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K|K
	if '(..isKeywordInList($lb("E","E"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"E")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"E")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  one_classMember ::= class_class_method | class_ForeignKey | class_index | class_method | class_property | class_parameter | class_projection | class_query | class_relationship | class_storage | class_trigger | class_xdata | class_client_method
/// summary=C|C|C|C|C|C|C|C|C|C|C|C|C
Method OneClassmember(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C|C|C|C|C|C|C|C|C|C|C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ClassClassMethod(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ClassForeignkey(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ClassIndex(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ClassMethod(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ClassProperty(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ClassParameter(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ClassProjection(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ClassQuery(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ClassRelationship(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ClassStorage(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ClassTrigger(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ClassXdata(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ClassClientMethod(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  one_column_name ::= string | text
/// summary=C|C
Method OneColumnName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..String(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Text(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  one_data_attribute_value ::= property_reference ['(ELEMENTS)' | '(KEYS)' ]
/// summary=C&[P|P]
Method OneDataAttributeValue(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&[P|P]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..PropertyReference(.subElement,.addedElement)  {
		if ..OneDataAttributeValue129OptGrp(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary values:(ELEMENTS),(KEYS)
/// summary=P|P
Method OneDataAttributeValue129OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P|P
	if '(..isStringInList($lb("(ELEMENTS)","(KEYS)"),10,.value)) { quit 1 /* not found is OK */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(ELEMENTS)")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"(KEYS)")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=1 /* failure rollsback but returns OK */
	}
	quit ok
}

///  one_foreignkey_atttribute ::= attribute_Internal | attribute_NoCheck | attribute_OnDelete | attribute_OnUpdate | attribute_SQLName
/// summary=C|C|C|C|C
Method OneForeignkeyAtttribute(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C|C|C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..AttributeInternal(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeNocheck(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeOndelete(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeOnupdate(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeSqlname(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  one_name_value_pair ::= class_item_identifier [ '=' expression ]
/// summary=C&[P&C]
Method OneNameValuePair(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&[P&C]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ClassItemIdentifier(.subElement,.addedElement)  {
		if ..OneNameValuePair42OptGrp(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary values:=
/// summary=P&C
Method OneNameValuePair42OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle("=",.value)) { quit 1 /* not found is OK */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"=")  {
		if ..Expression(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=1 /* failure rollsback but returns OK */
	}
	quit ok
}

///  package_list ::= package_name ( ',' package_name )*
/// summary=C&(?4punctuation:4?)*
Method PackageList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..PackageName(.subElement,.addedElement)  {
		if ..PackageList7RepZero(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ( ',' package_name )*
Method PackageList7RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..PackageList8Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' package_name
/// summary values:,
/// summary=P&C
Method PackageList8Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..PackageName(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	quit ok
}

///  package_name ::= identifier
/// summary=C
Method PackageName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Identifier(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  parameter_default_expression ::= '{' expression '}'
/// summary values:{
/// summary=P&C&P
Method ParameterDefaultExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&P
	; first rule summary P
	if '(..isStringSingle("{",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"{")  {
		if ..Expression(.subElement,.addedElement)  {
			if ..addPunctuation(.subElement,"}")  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  parameter_default_simple ::= [ '+' ] number | string
/// summary=[P]&C|C
Method ParameterDefaultSimple(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary [P]&C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..addPunctuation(.subElement,"+") :1,1:1) {
		if ..Number(.subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..String(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  parameter_default_value ::= '=' ( 'NULL' | parameter_default_simple | parameter_default_expression )
/// summary values:=
/// summary=P&(K|C|C)
Method ParameterDefaultValue(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&(K|C|C)
	; first rule summary P
	if '(..isStringSingle("=",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"=")  {
		if ..ParameterDefaultValue37Sub(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  'NULL' | parameter_default_simple | parameter_default_expression
/// summary=K|C|C
Method ParameterDefaultValue37Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K|C|C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"NULL")  {
		set done=1 ; or
	} elseif ..ParameterDefaultSimple(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ParameterDefaultExpression(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	quit ok
}

///  projection_name ::= string | identifier
/// summary=C|C
Method ProjectionName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..String(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Identifier(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  property_name ::= class_item_identifier
/// summary=C
Method PropertyName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ClassItemIdentifier(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  property_reference ::= class_item_identifier
/// summary=C
Method PropertyReference(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ClassItemIdentifier(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  query_name ::= class_item_identifier
/// summary=C
Method QueryName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ClassItemIdentifier(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ref_props ::= name_value_pair_list
/// summary=C
Method RefProps(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..NameValuePairList(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  relationship_attribute ::= attribute_Cardinality | attribute_Final | attribute_Internal | attribute_Inverse | attribute_Required | attribute_SQLFieldname | attribute_Private | attribute_OnDelete
/// summary=C|C|C|C|C|C|C|C
Method RelationshipAttribute(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C|C|C|C|C|C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..AttributeCardinality(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeFinal(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeInternal(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeInverse(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeRequired(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeSqlfieldname(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributePrivate(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeOndelete(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  relationship_attributes ::= '[' relationship_attribute ( ',' relationship_attribute )* ']'
/// summary values:[
/// summary=P&C&(?4punctuation:4?)*&P
Method RelationshipAttributes(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&(?4punctuation:4?)*&P
	; first rule summary P
	if '(..isStringSingle("[",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"[")  {
		if ..RelationshipAttribute(.subElement,.addedElement)  {
			if ..RelationshipAttributes27RepZero(.subElement,.addedElement)  {
				if ..addPunctuation(.subElement,"]")  {
					set done=1 ; end compileRules
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ( ',' relationship_attribute )*
Method RelationshipAttributes27RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..RelationshipAttributes28Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' relationship_attribute
/// summary values:,
/// summary=P&C
Method RelationshipAttributes28Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..RelationshipAttribute(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	quit ok
}

///  return_type_class_reference ::= class_reference [ type_parameters ]
/// summary=C&[C]
Method ReturnTypeClassReference(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&[C]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ClassReference(.subElement,.addedElement)  {
		if $S(..TypeParameters(.subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  soap_identifier ::= identifier
/// summary=C
Method SoapIdentifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Identifier(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  sql_field_name ::= text
/// summary=C
Method SqlFieldName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Text(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  sql_table_name ::= 'NEEDS SQL TABLE NAME'
/// summary values:NEEDS SQL TABLE NAME
/// summary=P
Method SqlTableName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("NEEDS SQL TABLE NAME",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"NEEDS SQL TABLE NAME")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  storage_name ::= class_item_identifier
/// summary=C
Method StorageName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ClassItemIdentifier(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  storage_xml ::= (xml_data)*
/// summary=(?4punctuation:4?)*
Method StorageXml(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..StorageXml50RepZero(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  (xml_data)*
Method StorageXml50RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..StorageXml51Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// xml_data
/// summary=C
Method StorageXml51Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C
	set subElement=ParentElement
	set done=0 ; method start
	if ..XmlData(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  storage_xml_attribute ::= xml_tag_s_a 'Attribute' xml_tag_s_b identifier xml_tag_e_a 'Attribute' xml_tag_e_b
/// summary=C&K&C&C&C&K&C
Method StorageXmlAttribute(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&K&C&C&C&K&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(.subElement,.addedElement)  {
		if ..addKeyword(.subElement,"ATTRIBUTE")  {
			if ..XmlTagSB(.subElement,.addedElement)  {
				if ..Identifier(.subElement,.addedElement)  {
					if ..XmlTagEA(.subElement,.addedElement)  {
						if ..addKeyword(.subElement,"ATTRIBUTE")  {
							if ..XmlTagEB(.subElement,.addedElement)  {
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
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  storage_xml_complex ::= ( storage_xml_data | storage_xml_data_location | storage_xml_default_data | storage_xml_description | storage_xml_extent_location | storage_xml_extent_size | storage_xml_id_function | storage_xml_id_location | storage_xml_index_location | storage_xml_index | storage_xml_stream_location | storage_xml_state | storage_xml_type | storage_xml_property | storage_xml_sqlmap | storage_xml_counterlocation )*
/// summary=(?4punctuation:4?)*
Method StorageXmlComplex(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..StorageXmlComplex52RepZero(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ( storage_xml_data | storage_xml_data_location | storage_xml_default_data | storage_xml_description | storage_xml_extent_location | storage_xml_extent_size | storage_xml_id_function | storage_xml_id_location | storage_xml_index_location | storage_xml_index | storage_xml_stream_location | storage_xml_state | storage_xml_type | storage_xml_property | storage_xml_sqlmap | storage_xml_counterlocation )*
Method StorageXmlComplex52RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..StorageXmlComplex53Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  storage_xml_data | storage_xml_data_location | storage_xml_default_data | storage_xml_description | storage_xml_extent_location | storage_xml_extent_size | storage_xml_id_function | storage_xml_id_location | storage_xml_index_location | storage_xml_index | storage_xml_stream_location | storage_xml_state | storage_xml_type | storage_xml_property | storage_xml_sqlmap | storage_xml_counterlocation
/// summary=C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C
Method StorageXmlComplex53Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..StorageXmlData(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlDataLocation(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlDefaultData(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlDescription(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlExtentLocation(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlExtentSize(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlIdFunction(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlIdLocation(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlIndexLocation(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlIndex(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlStreamLocation(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlState(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlType(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlProperty(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlSqlmap(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlCounterlocation(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  storage_xml_counterlocation ::= xml_tag_s_a 'CounterLocation' xml_tag_s_b global xml_tag_e_a 'CounterLocation' xml_tag_e_b
/// summary=C&K&C&C&C&K&C
Method StorageXmlCounterlocation(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&K&C&C&C&K&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(.subElement,.addedElement)  {
		if ..addKeyword(.subElement,"COUNTERLOCATION")  {
			if ..XmlTagSB(.subElement,.addedElement)  {
				if ..Global(.subElement,.addedElement)  {
					if ..XmlTagEA(.subElement,.addedElement)  {
						if ..addKeyword(.subElement,"COUNTERLOCATION")  {
							if ..XmlTagEB(.subElement,.addedElement)  {
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
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  storage_xml_data ::= xml_tag_s_a 'Data' 'name' '=' string ( xml_tag_s_c | (xml_tag_s_b (storage_xml_dataelement)* xml_tag_e_a 'Data' xml_tag_e_b) )
/// summary=C&K&K&P&C&(C|(C&(?4punctuation:4?)*&C&K&C))
Method StorageXmlData(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&K&K&P&C&(C|(C&(?4punctuation:4?)*&C&K&C))
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(.subElement,.addedElement)  {
		if ..addKeyword(.subElement,"DATA")  {
			if ..addKeyword(.subElement,"NAME")  {
				if ..addPunctuation(.subElement,"=")  {
					if ..String(.subElement,.addedElement)  {
						if ..StorageXmlData54Sub(.subElement,.addedElement)  {
							set done=1 ; end compileRules
						}
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  xml_tag_s_c | (xml_tag_s_b (storage_xml_dataelement)* xml_tag_e_a 'Data' xml_tag_e_b)
/// summary=C|(C&(?4punctuation:4?)*&C&K&C)
Method StorageXmlData54Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|(C&(?4punctuation:4?)*&C&K&C)
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSC(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlData55Sub(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	quit ok
}

/// xml_tag_s_b (storage_xml_dataelement)* xml_tag_e_a 'Data' xml_tag_e_b
/// summary=C&(?4punctuation:4?)*&C&K&C
Method StorageXmlData55Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&(?4punctuation:4?)*&C&K&C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSB(.subElement,.addedElement)  {
		if ..StorageXmlData56RepZero(.subElement,.addedElement)  {
			if ..XmlTagEA(.subElement,.addedElement)  {
				if ..addKeyword(.subElement,"DATA")  {
					if ..XmlTagEB(.subElement,.addedElement)  {
						set done=1 ; end compileRules
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	quit ok
}

///  (storage_xml_dataelement)*
Method StorageXmlData56RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..StorageXmlData57Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// storage_xml_dataelement
/// summary=C
Method StorageXmlData57Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C
	set subElement=ParentElement
	set done=0 ; method start
	if ..StorageXmlDataelement(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  storage_xml_data_delimiter ::= xml_tag_s_a 'Delimiter' xml_tag_s_b cos_expression_storage xml_tag_e_a 'Delimiter' xml_tag_e_b
/// summary=C&K&C&C&C&K&C
Method StorageXmlDataDelimiter(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&K&C&C&C&K&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(.subElement,.addedElement)  {
		if ..addKeyword(.subElement,"DELIMITER")  {
			if ..XmlTagSB(.subElement,.addedElement)  {
				if ..CosExpressionStorage(.subElement,.addedElement)  {
					if ..XmlTagEA(.subElement,.addedElement)  {
						if ..addKeyword(.subElement,"DELIMITER")  {
							if ..XmlTagEB(.subElement,.addedElement)  {
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
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  storage_xml_data_location ::= xml_tag_s_a 'DataLocation'xml_tag_s_b (expression | ('{%%PARENT}' ['(' string ')'])) xml_tag_e_a 'DataLocation' xml_tag_e_b
/// summary=C&K&C&(C|(P&[P&C&P]))&C&K&C
Method StorageXmlDataLocation(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&K&C&(C|(P&[P&C&P]))&C&K&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(.subElement,.addedElement)  {
		if ..addKeyword(.subElement,"DATALOCATION")  {
			if ..XmlTagSB(.subElement,.addedElement)  {
				if ..StorageXmlDataLocation64Sub(.subElement,.addedElement)  {
					if ..XmlTagEA(.subElement,.addedElement)  {
						if ..addKeyword(.subElement,"DATALOCATION")  {
							if ..XmlTagEB(.subElement,.addedElement)  {
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
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// expression | ('{%%PARENT}' ['(' string ')'])
/// summary=C|(P&[P&C&P])
Method StorageXmlDataLocation64Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|(P&[P&C&P])
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlDataLocation65Sub(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	quit ok
}

/// '{%%PARENT}' ['(' string ')']
/// summary values:{%%PARENT}
/// summary=P&[P&C&P]
Method StorageXmlDataLocation65Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&[P&C&P]
	; first rule summary P
	if '(..isStringSingle("{%%PARENT}",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"{%%PARENT}")  {
		if ..StorageXmlDataLocation66OptGrp(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	quit ok
}

/// 
/// summary values:(
/// summary=P&C&P
Method StorageXmlDataLocation66OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 1 /* not found is OK */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if ..String(.subElement,.addedElement)  {
			if ..addPunctuation(.subElement,")")  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=1 /* failure rollsback but returns OK */
	}
	quit ok
}

///  storage_xml_data_node ::= xml_tag_s_a 'Node' xml_tag_s_b (number | string) xml_tag_e_a 'Node' xml_tag_e_b
/// summary=C&K&C&(C|C)&C&K&C
Method StorageXmlDataNode(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&K&C&(C|C)&C&K&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(.subElement,.addedElement)  {
		if ..addKeyword(.subElement,"NODE")  {
			if ..XmlTagSB(.subElement,.addedElement)  {
				if ..StorageXmlDataNode68Sub(.subElement,.addedElement)  {
					if ..XmlTagEA(.subElement,.addedElement)  {
						if ..addKeyword(.subElement,"NODE")  {
							if ..XmlTagEB(.subElement,.addedElement)  {
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
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// number | string
/// summary=C|C
Method StorageXmlDataNode68Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..Number(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..String(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  storage_xml_data_piece ::= xml_tag_s_a 'Piece' xml_tag_s_b number [ ',' number ] xml_tag_e_a 'Piece' xml_tag_e_b
/// summary=C&K&C&C&[P&C]&C&K&C
Method StorageXmlDataPiece(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&K&C&C&[P&C]&C&K&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(.subElement,.addedElement)  {
		if ..addKeyword(.subElement,"PIECE")  {
			if ..XmlTagSB(.subElement,.addedElement)  {
				if ..Number(.subElement,.addedElement)  {
					if ..StorageXmlDataPiece67OptGrp(.subElement,.addedElement)  {
						if ..XmlTagEA(.subElement,.addedElement)  {
							if ..addKeyword(.subElement,"PIECE")  {
								if ..XmlTagEB(.subElement,.addedElement)  {
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
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary values:,
/// summary=P&C
Method StorageXmlDataPiece67OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 1 /* not found is OK */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..Number(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=1 /* failure rollsback but returns OK */
	}
	quit ok
}

///  storage_xml_data_position ::= xml_tag_s_a 'Value' 'name' '=' string xml_tag_s_b (storage_xml_data_position_field)* xml_tag_e_a 'Value' xml_tag_e_b
/// summary=C&K&K&P&C&C&(?4punctuation:4?)*&C&K&C
Method StorageXmlDataPosition(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&K&K&P&C&C&(?4punctuation:4?)*&C&K&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(.subElement,.addedElement)  {
		if ..addKeyword(.subElement,"VALUE")  {
			if ..addKeyword(.subElement,"NAME")  {
				if ..addPunctuation(.subElement,"=")  {
					if ..String(.subElement,.addedElement)  {
						if ..XmlTagSB(.subElement,.addedElement)  {
							if ..StorageXmlDataPosition61RepZero(.subElement,.addedElement)  {
								if ..XmlTagEA(.subElement,.addedElement)  {
									if ..addKeyword(.subElement,"VALUE")  {
										if ..XmlTagEB(.subElement,.addedElement)  {
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
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  (storage_xml_data_position_field)*
Method StorageXmlDataPosition61RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..StorageXmlDataPosition62Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// storage_xml_data_position_field
/// summary=C
Method StorageXmlDataPosition62Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C
	set subElement=ParentElement
	set done=0 ; method start
	if ..StorageXmlDataPositionField(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  storage_xml_data_position_field ::= xml_tag_s_a 'Value' xml_tag_s_b (identifier) xml_tag_e_a 'Value' xml_tag_e_b
/// summary=C&K&C&(C)&C&K&C
Method StorageXmlDataPositionField(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&K&C&(C)&C&K&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(.subElement,.addedElement)  {
		if ..addKeyword(.subElement,"VALUE")  {
			if ..XmlTagSB(.subElement,.addedElement)  {
				if ..StorageXmlDataPositionField63Sub(.subElement,.addedElement)  {
					if ..XmlTagEA(.subElement,.addedElement)  {
						if ..addKeyword(.subElement,"VALUE")  {
							if ..XmlTagEB(.subElement,.addedElement)  {
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
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// identifier
/// summary=C
Method StorageXmlDataPositionField63Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C
	set subElement=ParentElement
	set done=0 ; method start
	if ..Identifier(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  storage_xml_data_retrieval_code ::= xml_tag_s_a 'RetrievalCode' xml_tag_s_b cos_code_block_storage xml_tag_e_a 'RetrievalCode' xml_tag_e_b
/// summary=C&K&C&C&C&K&C
Method StorageXmlDataRetrievalCode(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&K&C&C&C&K&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(.subElement,.addedElement)  {
		if ..addKeyword(.subElement,"RETRIEVALCODE")  {
			if ..XmlTagSB(.subElement,.addedElement)  {
				if ..CosCodeBlockStorage(.subElement,.addedElement)  {
					if ..XmlTagEA(.subElement,.addedElement)  {
						if ..addKeyword(.subElement,"RETRIEVALCODE")  {
							if ..XmlTagEB(.subElement,.addedElement)  {
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
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  storage_xml_dataelement ::= storage_xml_attribute | storage_xml_structure | storage_xml_subscript | storage_xml_data_position | storage_xml_data_piece | storage_xml_data_node | storage_xml_data_delimiter | storage_xml_data_retrieval_code
/// summary=C|C|C|C|C|C|C|C
Method StorageXmlDataelement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C|C|C|C|C|C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..StorageXmlAttribute(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlStructure(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlSubscript(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlDataPosition(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlDataPiece(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlDataNode(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlDataDelimiter(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlDataRetrievalCode(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  storage_xml_default_data ::= xml_tag_s_a 'DefaultData' xml_tag_s_b cos_expression_storage xml_tag_e_a 'DefaultData' xml_tag_e_b
/// summary=C&K&C&C&C&K&C
Method StorageXmlDefaultData(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&K&C&C&C&K&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(.subElement,.addedElement)  {
		if ..addKeyword(.subElement,"DEFAULTDATA")  {
			if ..XmlTagSB(.subElement,.addedElement)  {
				if ..CosExpressionStorage(.subElement,.addedElement)  {
					if ..XmlTagEA(.subElement,.addedElement)  {
						if ..addKeyword(.subElement,"DEFAULTDATA")  {
							if ..XmlTagEB(.subElement,.addedElement)  {
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
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  storage_xml_description ::= xml_tag_s_a 'Description' xml_tag_s_b (xml_cdata | xml_content) xml_tag_e_a 'Description' xml_tag_e_b
/// summary=C&K&C&(C|C)&C&K&C
Method StorageXmlDescription(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&K&C&(C|C)&C&K&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(.subElement,.addedElement)  {
		if ..addKeyword(.subElement,"DESCRIPTION")  {
			if ..XmlTagSB(.subElement,.addedElement)  {
				if ..StorageXmlDescription58Sub(.subElement,.addedElement)  {
					if ..XmlTagEA(.subElement,.addedElement)  {
						if ..addKeyword(.subElement,"DESCRIPTION")  {
							if ..XmlTagEB(.subElement,.addedElement)  {
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
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// xml_cdata | xml_content
/// summary=C|C
Method StorageXmlDescription58Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..XmlCdata(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..XmlContent(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  storage_xml_extent_location ::= xml_tag_s_a 'ExtentLocation' xml_tag_s_b global xml_tag_e_a 'ExtentLocation' xml_tag_e_b
/// summary=C&K&C&C&C&K&C
Method StorageXmlExtentLocation(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&K&C&C&C&K&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(.subElement,.addedElement)  {
		if ..addKeyword(.subElement,"EXTENTLOCATION")  {
			if ..XmlTagSB(.subElement,.addedElement)  {
				if ..Global(.subElement,.addedElement)  {
					if ..XmlTagEA(.subElement,.addedElement)  {
						if ..addKeyword(.subElement,"EXTENTLOCATION")  {
							if ..XmlTagEB(.subElement,.addedElement)  {
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
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  storage_xml_extent_size ::= xml_tag_s_a 'ExtentSize' xml_tag_s_b number xml_tag_e_a 'ExtentSize' xml_tag_e_b
/// summary=C&K&C&C&C&K&C
Method StorageXmlExtentSize(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&K&C&C&C&K&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(.subElement,.addedElement)  {
		if ..addKeyword(.subElement,"EXTENTSIZE")  {
			if ..XmlTagSB(.subElement,.addedElement)  {
				if ..Number(.subElement,.addedElement)  {
					if ..XmlTagEA(.subElement,.addedElement)  {
						if ..addKeyword(.subElement,"EXTENTSIZE")  {
							if ..XmlTagEB(.subElement,.addedElement)  {
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
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  storage_xml_global ::= xml_tag_s_a 'Global' xml_tag_s_b global xml_tag_e_a 'Global' xml_tag_e_b
/// summary=C&K&C&C&C&K&C
Method StorageXmlGlobal(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&K&C&C&C&K&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(.subElement,.addedElement)  {
		if ..addKeyword(.subElement,"GLOBAL")  {
			if ..XmlTagSB(.subElement,.addedElement)  {
				if ..Global(.subElement,.addedElement)  {
					if ..XmlTagEA(.subElement,.addedElement)  {
						if ..addKeyword(.subElement,"GLOBAL")  {
							if ..XmlTagEB(.subElement,.addedElement)  {
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
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  storage_xml_id_function ::= xml_tag_s_a 'IdFunction' xml_tag_s_b ( 'sequence' )xml_tag_e_a 'IdFunction' xml_tag_e_b
/// summary=C&K&C&(K)&C&K&C
Method StorageXmlIdFunction(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&K&C&(K)&C&K&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(.subElement,.addedElement)  {
		if ..addKeyword(.subElement,"IDFUNCTION")  {
			if ..XmlTagSB(.subElement,.addedElement)  {
				if ..StorageXmlIdFunction69Sub(.subElement,.addedElement)  {
					if ..XmlTagEA(.subElement,.addedElement)  {
						if ..addKeyword(.subElement,"IDFUNCTION")  {
							if ..XmlTagEB(.subElement,.addedElement)  {
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
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  'sequence'
/// summary values:SEQUENCE
/// summary=K
Method StorageXmlIdFunction69Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K
	if '(..isKeyword("SEQUENCE",.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"SEQUENCE")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  storage_xml_id_location ::= xml_tag_s_a 'IdLocation' xml_tag_s_b ( ('{%%PARENT}' ['(' string ')']) | (expression [ '(' string ')' ]) ) xml_tag_e_a 'IdLocation' xml_tag_e_b
/// summary=C&K&C&((P&[P&C&P])|(C&[P&C&P]))&C&K&C
Method StorageXmlIdLocation(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&K&C&((P&[P&C&P])|(C&[P&C&P]))&C&K&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(.subElement,.addedElement)  {
		if ..addKeyword(.subElement,"IDLOCATION")  {
			if ..XmlTagSB(.subElement,.addedElement)  {
				if ..StorageXmlIdLocation70Sub(.subElement,.addedElement)  {
					if ..XmlTagEA(.subElement,.addedElement)  {
						if ..addKeyword(.subElement,"IDLOCATION")  {
							if ..XmlTagEB(.subElement,.addedElement)  {
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
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ('{%%PARENT}' ['(' string ')']) | (expression [ '(' string ')' ])
/// summary=(P&[P&C&P])|(C&[P&C&P])
Method StorageXmlIdLocation70Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary (P&[P&C&P])|(C&[P&C&P])
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..StorageXmlIdLocation71Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlIdLocation73Sub(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	quit ok
}

/// '{%%PARENT}' ['(' string ')']
/// summary values:{%%PARENT}
/// summary=P&[P&C&P]
Method StorageXmlIdLocation71Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&[P&C&P]
	; first rule summary P
	if '(..isStringSingle("{%%PARENT}",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"{%%PARENT}")  {
		if ..StorageXmlIdLocation72OptGrp(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	quit ok
}

/// 
/// summary values:(
/// summary=P&C&P
Method StorageXmlIdLocation72OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 1 /* not found is OK */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if ..String(.subElement,.addedElement)  {
			if ..addPunctuation(.subElement,")")  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=1 /* failure rollsback but returns OK */
	}
	quit ok
}

/// expression [ '(' string ')' ]
/// summary=C&[P&C&P]
Method StorageXmlIdLocation73Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&[P&C&P]
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(.subElement,.addedElement)  {
		if ..StorageXmlIdLocation74OptGrp(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	quit ok
}

/// 
/// summary values:(
/// summary=P&C&P
Method StorageXmlIdLocation74OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 1 /* not found is OK */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if ..String(.subElement,.addedElement)  {
			if ..addPunctuation(.subElement,")")  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=1 /* failure rollsback but returns OK */
	}
	quit ok
}

///  storage_xml_index ::= xml_tag_s_a 'Index' 'name' '=' string xml_tag_s_b (storage_xml_index_sublocation)* xml_tag_e_a 'Index' xml_tag_e_b
/// summary=C&K&K&P&C&C&(?4punctuation:4?)*&C&K&C
Method StorageXmlIndex(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&K&K&P&C&C&(?4punctuation:4?)*&C&K&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(.subElement,.addedElement)  {
		if ..addKeyword(.subElement,"INDEX")  {
			if ..addKeyword(.subElement,"NAME")  {
				if ..addPunctuation(.subElement,"=")  {
					if ..String(.subElement,.addedElement)  {
						if ..XmlTagSB(.subElement,.addedElement)  {
							if ..StorageXmlIndex75RepZero(.subElement,.addedElement)  {
								if ..XmlTagEA(.subElement,.addedElement)  {
									if ..addKeyword(.subElement,"INDEX")  {
										if ..XmlTagEB(.subElement,.addedElement)  {
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
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  (storage_xml_index_sublocation)*
Method StorageXmlIndex75RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..StorageXmlIndex76Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// storage_xml_index_sublocation
/// summary=C
Method StorageXmlIndex76Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C
	set subElement=ParentElement
	set done=0 ; method start
	if ..StorageXmlIndexSublocation(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  storage_xml_index_location ::= xml_tag_s_a 'IndexLocation' xml_tag_s_b expression xml_tag_e_a 'IndexLocation' xml_tag_e_b
/// summary=C&K&C&C&C&K&C
Method StorageXmlIndexLocation(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&K&C&C&C&K&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(.subElement,.addedElement)  {
		if ..addKeyword(.subElement,"INDEXLOCATION")  {
			if ..XmlTagSB(.subElement,.addedElement)  {
				if ..Expression(.subElement,.addedElement)  {
					if ..XmlTagEA(.subElement,.addedElement)  {
						if ..addKeyword(.subElement,"INDEXLOCATION")  {
							if ..XmlTagEB(.subElement,.addedElement)  {
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
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  storage_xml_index_sublocation ::= xml_tag_s_a 'Location' xml_tag_s_b (expression)xml_tag_e_a 'Location' xml_tag_e_b
/// summary=C&K&C&(C)&C&K&C
Method StorageXmlIndexSublocation(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&K&C&(C)&C&K&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(.subElement,.addedElement)  {
		if ..addKeyword(.subElement,"LOCATION")  {
			if ..XmlTagSB(.subElement,.addedElement)  {
				if ..StorageXmlIndexSublocation77Sub(.subElement,.addedElement)  {
					if ..XmlTagEA(.subElement,.addedElement)  {
						if ..addKeyword(.subElement,"LOCATION")  {
							if ..XmlTagEB(.subElement,.addedElement)  {
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
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// expression
/// summary=C
Method StorageXmlIndexSublocation77Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C
	set subElement=ParentElement
	set done=0 ; method start
	if ..Expression(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  storage_xml_property ::= storage_xml_property_empty | storage_xml_property_full
/// summary=C|C
Method StorageXmlProperty(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..StorageXmlPropertyEmpty(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlPropertyFull(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  storage_xml_property_empty ::= xml_tag_s_a 'Property' 'name' '=' string xml_tag_s_b (storage_xml_property_selectivity | storage_xml_property_outlier_selectivity | storage_xml_property_fieldsize | storage_xml_property_histogram)* xml_tag_e_a 'Property' xml_tag_e_b
/// summary=C&K&K&P&C&C&(?4punctuation:4?)*&C&K&C
Method StorageXmlPropertyEmpty(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&K&K&P&C&C&(?4punctuation:4?)*&C&K&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(.subElement,.addedElement)  {
		if ..addKeyword(.subElement,"PROPERTY")  {
			if ..addKeyword(.subElement,"NAME")  {
				if ..addPunctuation(.subElement,"=")  {
					if ..String(.subElement,.addedElement)  {
						if ..XmlTagSB(.subElement,.addedElement)  {
							if ..StorageXmlPropertyEmpty78RepZero(.subElement,.addedElement)  {
								if ..XmlTagEA(.subElement,.addedElement)  {
									if ..addKeyword(.subElement,"PROPERTY")  {
										if ..XmlTagEB(.subElement,.addedElement)  {
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
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  (storage_xml_property_selectivity | storage_xml_property_outlier_selectivity | storage_xml_property_fieldsize | storage_xml_property_histogram)*
Method StorageXmlPropertyEmpty78RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..StorageXmlPropertyEmpty79Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// storage_xml_property_selectivity | storage_xml_property_outlier_selectivity | storage_xml_property_fieldsize | storage_xml_property_histogram
/// summary=C|C|C|C
Method StorageXmlPropertyEmpty79Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C|C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..StorageXmlPropertySelectivity(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlPropertyOutlierSelectivity(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlPropertyFieldsize(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlPropertyHistogram(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  storage_xml_property_fieldsize ::= xml_tag_s_a 'AverageFieldSize' xml_tag_s_b number xml_tag_e_a 'AverageFieldSize' xml_tag_e_b
/// summary=C&K&C&C&C&K&C
Method StorageXmlPropertyFieldsize(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&K&C&C&C&K&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(.subElement,.addedElement)  {
		if ..addKeyword(.subElement,"AVERAGEFIELDSIZE")  {
			if ..XmlTagSB(.subElement,.addedElement)  {
				if ..Number(.subElement,.addedElement)  {
					if ..XmlTagEA(.subElement,.addedElement)  {
						if ..addKeyword(.subElement,"AVERAGEFIELDSIZE")  {
							if ..XmlTagEB(.subElement,.addedElement)  {
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
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  storage_xml_property_full ::= xml_tag_s_a 'Property' 'name' '=' string xml_tag_s_c
/// summary=C&K&K&P&C&C
Method StorageXmlPropertyFull(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&K&K&P&C&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(.subElement,.addedElement)  {
		if ..addKeyword(.subElement,"PROPERTY")  {
			if ..addKeyword(.subElement,"NAME")  {
				if ..addPunctuation(.subElement,"=")  {
					if ..String(.subElement,.addedElement)  {
						if ..XmlTagSC(.subElement,.addedElement)  {
							set done=1 ; end compileRules
						}
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  storage_xml_property_histogram ::= xml_tag_s_a 'Histogram' xml_tag_s_b expression xml_tag_e_a 'Histogram' xml_tag_e_b
/// summary=C&K&C&C&C&K&C
Method StorageXmlPropertyHistogram(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&K&C&C&C&K&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(.subElement,.addedElement)  {
		if ..addKeyword(.subElement,"HISTOGRAM")  {
			if ..XmlTagSB(.subElement,.addedElement)  {
				if ..Expression(.subElement,.addedElement)  {
					if ..XmlTagEA(.subElement,.addedElement)  {
						if ..addKeyword(.subElement,"HISTOGRAM")  {
							if ..XmlTagEB(.subElement,.addedElement)  {
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
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  storage_xml_property_outlier_selectivity ::= xml_tag_s_a 'OutlierSelectivity' xml_tag_s_b number ':' number xml_tag_e_a 'OutlierSelectivity' xml_tag_e_b
/// summary=C&K&C&C&P&C&C&K&C
Method StorageXmlPropertyOutlierSelectivity(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&K&C&C&P&C&C&K&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(.subElement,.addedElement)  {
		if ..addKeyword(.subElement,"OUTLIERSELECTIVITY")  {
			if ..XmlTagSB(.subElement,.addedElement)  {
				if ..Number(.subElement,.addedElement)  {
					if ..addPunctuation(.subElement,":")  {
						if ..Number(.subElement,.addedElement)  {
							if ..XmlTagEA(.subElement,.addedElement)  {
								if ..addKeyword(.subElement,"OUTLIERSELECTIVITY")  {
									if ..XmlTagEB(.subElement,.addedElement)  {
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
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  storage_xml_property_selectivity ::= xml_tag_s_a 'Selectivity' xml_tag_s_b number ['%'] xml_tag_e_a 'Selectivity' xml_tag_e_b
/// summary=C&K&C&C&[P]&C&K&C
Method StorageXmlPropertySelectivity(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&K&C&C&[P]&C&K&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(.subElement,.addedElement)  {
		if ..addKeyword(.subElement,"SELECTIVITY")  {
			if ..XmlTagSB(.subElement,.addedElement)  {
				if ..Number(.subElement,.addedElement)  {
					if $S(..addPunctuation(.subElement,"%") :1,1:1) {
						if ..XmlTagEA(.subElement,.addedElement)  {
							if ..addKeyword(.subElement,"SELECTIVITY")  {
								if ..XmlTagEB(.subElement,.addedElement)  {
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
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  storage_xml_sqlmap ::= xml_tag_s_a 'SQLMap' 'name' '=' string xml_tag_s_b (storage_xml_sqlmap_blockcount | storage_xml_data | storage_xml_global | storage_xml_sqlmap_condition | storage_xml_sqlmap_population | storage_xml_sqlmap_type | storage_xml_sqlmap_structure | storage_xml_sqlmap_subscript | storage_xml_sqlmap_rowidspec )* xml_tag_e_a 'SQLMap' xml_tag_e_b
/// summary=C&K&K&P&C&C&(?4punctuation:4?)*&C&K&C
Method StorageXmlSqlmap(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&K&K&P&C&C&(?4punctuation:4?)*&C&K&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(.subElement,.addedElement)  {
		if ..addKeyword(.subElement,"SQLMAP")  {
			if ..addKeyword(.subElement,"NAME")  {
				if ..addPunctuation(.subElement,"=")  {
					if ..String(.subElement,.addedElement)  {
						if ..XmlTagSB(.subElement,.addedElement)  {
							if ..StorageXmlSqlmap80RepZero(.subElement,.addedElement)  {
								if ..XmlTagEA(.subElement,.addedElement)  {
									if ..addKeyword(.subElement,"SQLMAP")  {
										if ..XmlTagEB(.subElement,.addedElement)  {
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
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  (storage_xml_sqlmap_blockcount | storage_xml_data | storage_xml_global | storage_xml_sqlmap_condition | storage_xml_sqlmap_population | storage_xml_sqlmap_type | storage_xml_sqlmap_structure | storage_xml_sqlmap_subscript | storage_xml_sqlmap_rowidspec )*
Method StorageXmlSqlmap80RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..StorageXmlSqlmap81Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// storage_xml_sqlmap_blockcount | storage_xml_data | storage_xml_global | storage_xml_sqlmap_condition | storage_xml_sqlmap_population | storage_xml_sqlmap_type | storage_xml_sqlmap_structure | storage_xml_sqlmap_subscript | storage_xml_sqlmap_rowidspec
/// summary=C|C|C|C|C|C|C|C|C
Method StorageXmlSqlmap81Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C|C|C|C|C|C|C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..StorageXmlSqlmapBlockcount(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlData(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlGlobal(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlSqlmapCondition(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlSqlmapPopulation(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlSqlmapType(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlSqlmapStructure(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlSqlmapSubscript(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlSqlmapRowidspec(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  storage_xml_sqlmap_blockcount ::= xml_tag_s_a 'BlockCount' xml_tag_s_b number xml_tag_e_a 'BlockCount' xml_tag_e_b
/// summary=C&K&C&C&C&K&C
Method StorageXmlSqlmapBlockcount(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&K&C&C&C&K&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(.subElement,.addedElement)  {
		if ..addKeyword(.subElement,"BLOCKCOUNT")  {
			if ..XmlTagSB(.subElement,.addedElement)  {
				if ..Number(.subElement,.addedElement)  {
					if ..XmlTagEA(.subElement,.addedElement)  {
						if ..addKeyword(.subElement,"BLOCKCOUNT")  {
							if ..XmlTagEB(.subElement,.addedElement)  {
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
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  storage_xml_sqlmap_condition ::= xml_tag_s_a 'Condition' xml_tag_s_b cos_expression_storage xml_tag_e_a 'Condition' xml_tag_e_b
/// summary=C&K&C&C&C&K&C
Method StorageXmlSqlmapCondition(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&K&C&C&C&K&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(.subElement,.addedElement)  {
		if ..addKeyword(.subElement,"CONDITION")  {
			if ..XmlTagSB(.subElement,.addedElement)  {
				if ..CosExpressionStorage(.subElement,.addedElement)  {
					if ..XmlTagEA(.subElement,.addedElement)  {
						if ..addKeyword(.subElement,"CONDITION")  {
							if ..XmlTagEB(.subElement,.addedElement)  {
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
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  storage_xml_sqlmap_population ::= xml_tag_s_a 'PopulationType' xml_tag_s_b identifier xml_tag_e_a 'PopulationType' xml_tag_e_b
/// summary=C&K&C&C&C&K&C
Method StorageXmlSqlmapPopulation(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&K&C&C&C&K&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(.subElement,.addedElement)  {
		if ..addKeyword(.subElement,"POPULATIONTYPE")  {
			if ..XmlTagSB(.subElement,.addedElement)  {
				if ..Identifier(.subElement,.addedElement)  {
					if ..XmlTagEA(.subElement,.addedElement)  {
						if ..addKeyword(.subElement,"POPULATIONTYPE")  {
							if ..XmlTagEB(.subElement,.addedElement)  {
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
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  storage_xml_sqlmap_row_expression ::= xml_tag_s_a 'Expression' xml_tag_s_b cos_expression_storage xml_tag_e_a 'Expression' xml_tag_e_b
/// summary=C&K&C&C&C&K&C
Method StorageXmlSqlmapRowExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&K&C&C&C&K&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(.subElement,.addedElement)  {
		if ..addKeyword(.subElement,"EXPRESSION")  {
			if ..XmlTagSB(.subElement,.addedElement)  {
				if ..CosExpressionStorage(.subElement,.addedElement)  {
					if ..XmlTagEA(.subElement,.addedElement)  {
						if ..addKeyword(.subElement,"EXPRESSION")  {
							if ..XmlTagEB(.subElement,.addedElement)  {
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
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  storage_xml_sqlmap_row_field ::= xml_tag_s_a 'Field' xml_tag_s_b identifier xml_tag_e_a 'Field' xml_tag_e_b
/// summary=C&K&C&C&C&K&C
Method StorageXmlSqlmapRowField(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&K&C&C&C&K&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(.subElement,.addedElement)  {
		if ..addKeyword(.subElement,"FIELD")  {
			if ..XmlTagSB(.subElement,.addedElement)  {
				if ..Identifier(.subElement,.addedElement)  {
					if ..XmlTagEA(.subElement,.addedElement)  {
						if ..addKeyword(.subElement,"FIELD")  {
							if ..XmlTagEB(.subElement,.addedElement)  {
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
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  storage_xml_sqlmap_rowidspec ::= xml_tag_s_a 'RowIdSpec' 'name' '=' string xml_tag_s_b (storage_xml_sqlmap_row_expression | storage_xml_sqlmap_row_field)* xml_tag_e_a 'RowIdSpec' xml_tag_e_b
/// summary=C&K&K&P&C&C&(?4punctuation:4?)*&C&K&C
Method StorageXmlSqlmapRowidspec(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&K&K&P&C&C&(?4punctuation:4?)*&C&K&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(.subElement,.addedElement)  {
		if ..addKeyword(.subElement,"ROWIDSPEC")  {
			if ..addKeyword(.subElement,"NAME")  {
				if ..addPunctuation(.subElement,"=")  {
					if ..String(.subElement,.addedElement)  {
						if ..XmlTagSB(.subElement,.addedElement)  {
							if ..StorageXmlSqlmapRowidspec85RepZero(.subElement,.addedElement)  {
								if ..XmlTagEA(.subElement,.addedElement)  {
									if ..addKeyword(.subElement,"ROWIDSPEC")  {
										if ..XmlTagEB(.subElement,.addedElement)  {
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
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  (storage_xml_sqlmap_row_expression | storage_xml_sqlmap_row_field)*
Method StorageXmlSqlmapRowidspec85RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..StorageXmlSqlmapRowidspec86Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// storage_xml_sqlmap_row_expression | storage_xml_sqlmap_row_field
/// summary=C|C
Method StorageXmlSqlmapRowidspec86Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..StorageXmlSqlmapRowExpression(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlSqlmapRowField(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  storage_xml_sqlmap_structure ::= xml_tag_s_a 'Structure' xml_tag_s_b identifier xml_tag_e_a 'Structure' xml_tag_e_b
/// summary=C&K&C&C&C&K&C
Method StorageXmlSqlmapStructure(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&K&C&C&C&K&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(.subElement,.addedElement)  {
		if ..addKeyword(.subElement,"STRUCTURE")  {
			if ..XmlTagSB(.subElement,.addedElement)  {
				if ..Identifier(.subElement,.addedElement)  {
					if ..XmlTagEA(.subElement,.addedElement)  {
						if ..addKeyword(.subElement,"STRUCTURE")  {
							if ..XmlTagEB(.subElement,.addedElement)  {
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
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  storage_xml_sqlmap_sub_accesstype ::= xml_tag_s_a 'AccessType' xml_tag_s_b identifier xml_tag_e_a 'AccessType' xml_tag_e_b
/// summary=C&K&C&C&C&K&C
Method StorageXmlSqlmapSubAccesstype(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&K&C&C&C&K&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(.subElement,.addedElement)  {
		if ..addKeyword(.subElement,"ACCESSTYPE")  {
			if ..XmlTagSB(.subElement,.addedElement)  {
				if ..Identifier(.subElement,.addedElement)  {
					if ..XmlTagEA(.subElement,.addedElement)  {
						if ..addKeyword(.subElement,"ACCESSTYPE")  {
							if ..XmlTagEB(.subElement,.addedElement)  {
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
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  storage_xml_sqlmap_sub_accessvar ::= xml_tag_s_a 'Accessvar' 'name' '=' string xml_tag_s_b (storage_xml_sqlmap_sub_code storage_xml_sqlmap_sub_variable) xml_tag_e_a 'Accessvar' xml_tag_e_b
/// summary=C&K&K&P&C&C&(C&C)&C&K&C
Method StorageXmlSqlmapSubAccessvar(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&K&K&P&C&C&(C&C)&C&K&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(.subElement,.addedElement)  {
		if ..addKeyword(.subElement,"ACCESSVAR")  {
			if ..addKeyword(.subElement,"NAME")  {
				if ..addPunctuation(.subElement,"=")  {
					if ..String(.subElement,.addedElement)  {
						if ..XmlTagSB(.subElement,.addedElement)  {
							if ..StorageXmlSqlmapSubAccessvar84Sub(.subElement,.addedElement)  {
								if ..XmlTagEA(.subElement,.addedElement)  {
									if ..addKeyword(.subElement,"ACCESSVAR")  {
										if ..XmlTagEB(.subElement,.addedElement)  {
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
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// storage_xml_sqlmap_sub_code storage_xml_sqlmap_sub_variable
/// summary=C&C
Method StorageXmlSqlmapSubAccessvar84Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..StorageXmlSqlmapSubCode(.subElement,.addedElement)  {
		if ..StorageXmlSqlmapSubVariable(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	quit ok
}

///  storage_xml_sqlmap_sub_code ::= xml_tag_s_a 'Code' xml_tag_s_b cos_code_block_storage xml_tag_e_a 'Code' xml_tag_e_b
/// summary=C&K&C&C&C&K&C
Method StorageXmlSqlmapSubCode(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&K&C&C&C&K&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(.subElement,.addedElement)  {
		if ..addKeyword(.subElement,"CODE")  {
			if ..XmlTagSB(.subElement,.addedElement)  {
				if ..CosCodeBlockStorage(.subElement,.addedElement)  {
					if ..XmlTagEA(.subElement,.addedElement)  {
						if ..addKeyword(.subElement,"CODE")  {
							if ..XmlTagEB(.subElement,.addedElement)  {
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
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  storage_xml_sqlmap_sub_dataaccess ::= xml_tag_s_a 'DataAccess' xml_tag_s_b cos_expression_storage xml_tag_e_a 'DataAccess' xml_tag_e_b
/// summary=C&K&C&C&C&K&C
Method StorageXmlSqlmapSubDataaccess(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&K&C&C&C&K&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(.subElement,.addedElement)  {
		if ..addKeyword(.subElement,"DATAACCESS")  {
			if ..XmlTagSB(.subElement,.addedElement)  {
				if ..CosExpressionStorage(.subElement,.addedElement)  {
					if ..XmlTagEA(.subElement,.addedElement)  {
						if ..addKeyword(.subElement,"DATAACCESS")  {
							if ..XmlTagEB(.subElement,.addedElement)  {
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
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  storage_xml_sqlmap_sub_expression ::= xml_tag_s_a 'Expression' xml_tag_s_b cos_expression_storage xml_tag_e_a 'Expression' xml_tag_e_b
/// summary=C&K&C&C&C&K&C
Method StorageXmlSqlmapSubExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&K&C&C&C&K&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(.subElement,.addedElement)  {
		if ..addKeyword(.subElement,"EXPRESSION")  {
			if ..XmlTagSB(.subElement,.addedElement)  {
				if ..CosExpressionStorage(.subElement,.addedElement)  {
					if ..XmlTagEA(.subElement,.addedElement)  {
						if ..addKeyword(.subElement,"EXPRESSION")  {
							if ..XmlTagEB(.subElement,.addedElement)  {
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
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  storage_xml_sqlmap_sub_invcond ::= xml_tag_s_a 'InvalidCondition' 'name' '=' string xml_tag_s_b storage_xml_sqlmap_sub_expression xml_tag_e_a 'Invalidcondition' xml_tag_e_b
/// summary=C&K&K&P&C&C&C&C&K&C
Method StorageXmlSqlmapSubInvcond(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&K&K&P&C&C&C&C&K&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(.subElement,.addedElement)  {
		if ..addKeyword(.subElement,"INVALIDCONDITION")  {
			if ..addKeyword(.subElement,"NAME")  {
				if ..addPunctuation(.subElement,"=")  {
					if ..String(.subElement,.addedElement)  {
						if ..XmlTagSB(.subElement,.addedElement)  {
							if ..StorageXmlSqlmapSubExpression(.subElement,.addedElement)  {
								if ..XmlTagEA(.subElement,.addedElement)  {
									if ..addKeyword(.subElement,"INVALIDCONDITION")  {
										if ..XmlTagEB(.subElement,.addedElement)  {
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
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  storage_xml_sqlmap_sub_loopinitval ::= xml_tag_s_a 'LoopInitValue' xml_tag_s_b cos_expression_storage xml_tag_e_a 'LoopInitValue' xml_tag_e_b
/// summary=C&K&C&C&C&K&C
Method StorageXmlSqlmapSubLoopinitval(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&K&C&C&C&K&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(.subElement,.addedElement)  {
		if ..addKeyword(.subElement,"LOOPINITVALUE")  {
			if ..XmlTagSB(.subElement,.addedElement)  {
				if ..CosExpressionStorage(.subElement,.addedElement)  {
					if ..XmlTagEA(.subElement,.addedElement)  {
						if ..addKeyword(.subElement,"LOOPINITVALUE")  {
							if ..XmlTagEB(.subElement,.addedElement)  {
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
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  storage_xml_sqlmap_sub_next_code ::= xml_tag_s_a 'NextCode' xml_tag_s_b cos_code_block_storage xml_tag_e_a 'NextCode' xml_tag_e_b
/// summary=C&K&C&C&C&K&C
Method StorageXmlSqlmapSubNextCode(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&K&C&C&C&K&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(.subElement,.addedElement)  {
		if ..addKeyword(.subElement,"NEXTCODE")  {
			if ..XmlTagSB(.subElement,.addedElement)  {
				if ..CosCodeBlockStorage(.subElement,.addedElement)  {
					if ..XmlTagEA(.subElement,.addedElement)  {
						if ..addKeyword(.subElement,"NEXTCODE")  {
							if ..XmlTagEB(.subElement,.addedElement)  {
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
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  storage_xml_sqlmap_sub_variable ::= xml_tag_s_a 'Variable' xml_tag_s_b cos_expression_storage xml_tag_e_a 'Variable' xml_tag_e_b
/// summary=C&K&C&C&C&K&C
Method StorageXmlSqlmapSubVariable(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&K&C&C&C&K&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(.subElement,.addedElement)  {
		if ..addKeyword(.subElement,"VARIABLE")  {
			if ..XmlTagSB(.subElement,.addedElement)  {
				if ..CosExpressionStorage(.subElement,.addedElement)  {
					if ..XmlTagEA(.subElement,.addedElement)  {
						if ..addKeyword(.subElement,"VARIABLE")  {
							if ..XmlTagEB(.subElement,.addedElement)  {
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
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  storage_xml_sqlmap_subscript ::= xml_tag_s_a 'Subscript' 'name' '=' string xml_tag_s_b (storage_xml_sqlmap_sub_expression | storage_xml_sqlmap_sub_accessvar | storage_xml_sqlmap_sub_accesstype | storage_xml_sqlmap_sub_invcond | storage_xml_data_delimiter | storage_xml_sqlmap_sub_loopinitval | storage_xml_sqlmap_sub_dataaccess | storage_xml_sqlmap_sub_next_code )* xml_tag_e_a 'Subscript' xml_tag_e_b
/// summary=C&K&K&P&C&C&(?4punctuation:4?)*&C&K&C
Method StorageXmlSqlmapSubscript(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&K&K&P&C&C&(?4punctuation:4?)*&C&K&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(.subElement,.addedElement)  {
		if ..addKeyword(.subElement,"SUBSCRIPT")  {
			if ..addKeyword(.subElement,"NAME")  {
				if ..addPunctuation(.subElement,"=")  {
					if ..String(.subElement,.addedElement)  {
						if ..XmlTagSB(.subElement,.addedElement)  {
							if ..StorageXmlSqlmapSubscript82RepZero(.subElement,.addedElement)  {
								if ..XmlTagEA(.subElement,.addedElement)  {
									if ..addKeyword(.subElement,"SUBSCRIPT")  {
										if ..XmlTagEB(.subElement,.addedElement)  {
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
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  (storage_xml_sqlmap_sub_expression | storage_xml_sqlmap_sub_accessvar | storage_xml_sqlmap_sub_accesstype | storage_xml_sqlmap_sub_invcond | storage_xml_data_delimiter | storage_xml_sqlmap_sub_loopinitval | storage_xml_sqlmap_sub_dataaccess | storage_xml_sqlmap_sub_next_code )*
Method StorageXmlSqlmapSubscript82RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..StorageXmlSqlmapSubscript83Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// storage_xml_sqlmap_sub_expression | storage_xml_sqlmap_sub_accessvar | storage_xml_sqlmap_sub_accesstype | storage_xml_sqlmap_sub_invcond | storage_xml_data_delimiter | storage_xml_sqlmap_sub_loopinitval | storage_xml_sqlmap_sub_dataaccess | storage_xml_sqlmap_sub_next_code
/// summary=C|C|C|C|C|C|C|C
Method StorageXmlSqlmapSubscript83Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C|C|C|C|C|C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..StorageXmlSqlmapSubExpression(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlSqlmapSubAccessvar(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlSqlmapSubAccesstype(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlSqlmapSubInvcond(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlDataDelimiter(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlSqlmapSubLoopinitval(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlSqlmapSubDataaccess(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StorageXmlSqlmapSubNextCode(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  storage_xml_sqlmap_type ::= xml_tag_s_a 'Type' xml_tag_s_b identifier xml_tag_e_a 'Type' xml_tag_e_b
/// summary=C&K&C&C&C&K&C
Method StorageXmlSqlmapType(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&K&C&C&C&K&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(.subElement,.addedElement)  {
		if ..addKeyword(.subElement,"TYPE")  {
			if ..XmlTagSB(.subElement,.addedElement)  {
				if ..Identifier(.subElement,.addedElement)  {
					if ..XmlTagEA(.subElement,.addedElement)  {
						if ..addKeyword(.subElement,"TYPE")  {
							if ..XmlTagEB(.subElement,.addedElement)  {
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
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  storage_xml_state ::= xml_tag_s_a 'State' xml_tag_s_b identifier xml_tag_e_a 'State' xml_tag_e_b
/// summary=C&K&C&C&C&K&C
Method StorageXmlState(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&K&C&C&C&K&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(.subElement,.addedElement)  {
		if ..addKeyword(.subElement,"STATE")  {
			if ..XmlTagSB(.subElement,.addedElement)  {
				if ..Identifier(.subElement,.addedElement)  {
					if ..XmlTagEA(.subElement,.addedElement)  {
						if ..addKeyword(.subElement,"STATE")  {
							if ..XmlTagEB(.subElement,.addedElement)  {
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
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  storage_xml_stream_location ::= xml_tag_s_a 'StreamLocation' xml_tag_s_b expression xml_tag_e_a 'StreamLocation' xml_tag_e_b
/// summary=C&K&C&C&C&K&C
Method StorageXmlStreamLocation(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&K&C&C&C&K&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(.subElement,.addedElement)  {
		if ..addKeyword(.subElement,"STREAMLOCATION")  {
			if ..XmlTagSB(.subElement,.addedElement)  {
				if ..Expression(.subElement,.addedElement)  {
					if ..XmlTagEA(.subElement,.addedElement)  {
						if ..addKeyword(.subElement,"STREAMLOCATION")  {
							if ..XmlTagEB(.subElement,.addedElement)  {
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
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  storage_xml_structure ::= xml_tag_s_a 'Structure' xml_tag_s_b ( 'subnode' | 'node') xml_tag_e_a 'Structure' xml_tag_e_b
/// summary=C&K&C&(K|K)&C&K&C
Method StorageXmlStructure(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&K&C&(K|K)&C&K&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(.subElement,.addedElement)  {
		if ..addKeyword(.subElement,"STRUCTURE")  {
			if ..XmlTagSB(.subElement,.addedElement)  {
				if ..StorageXmlStructure59Sub(.subElement,.addedElement)  {
					if ..XmlTagEA(.subElement,.addedElement)  {
						if ..addKeyword(.subElement,"STRUCTURE")  {
							if ..XmlTagEB(.subElement,.addedElement)  {
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
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  'subnode' | 'node'
/// summary values:SUBNODE,NODE
/// summary=K|K
Method StorageXmlStructure59Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K|K
	if '(..isKeywordInList($lb("SUBNODE","NODE"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"SUBNODE")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"NODE")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  storage_xml_subscript ::= xml_tag_s_a 'Subscript' xml_tag_s_b (string | number) xml_tag_e_a 'Subscript' xml_tag_e_b
/// summary=C&K&C&(C|C)&C&K&C
Method StorageXmlSubscript(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&K&C&(C|C)&C&K&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(.subElement,.addedElement)  {
		if ..addKeyword(.subElement,"SUBSCRIPT")  {
			if ..XmlTagSB(.subElement,.addedElement)  {
				if ..StorageXmlSubscript60Sub(.subElement,.addedElement)  {
					if ..XmlTagEA(.subElement,.addedElement)  {
						if ..addKeyword(.subElement,"SUBSCRIPT")  {
							if ..XmlTagEB(.subElement,.addedElement)  {
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
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// string | number
/// summary=C|C
Method StorageXmlSubscript60Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..String(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Number(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  storage_xml_type ::= xml_tag_s_a 'Type' xml_tag_s_b class_reference xml_tag_e_a 'Type' xml_tag_e_b
/// summary=C&K&C&C&C&K&C
Method StorageXmlType(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&K&C&C&C&K&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(.subElement,.addedElement)  {
		if ..addKeyword(.subElement,"TYPE")  {
			if ..XmlTagSB(.subElement,.addedElement)  {
				if ..ClassReference(.subElement,.addedElement)  {
					if ..XmlTagEA(.subElement,.addedElement)  {
						if ..addKeyword(.subElement,"TYPE")  {
							if ..XmlTagEB(.subElement,.addedElement)  {
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
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  string ::= '""' | ('"' 'regexp:[^\"\r\n]*' '"')
/// summary=P|(P&R&P)
Method String(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|(P&R&P)
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"""""")  {
		set done=1 ; or
	} elseif ..String187Sub(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// '"' 'regexp:[^\"\r\n]*' '"'
/// summary values:""
/// summary=P&R&P
Method String187Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&R&P
	; first rule summary P
	if '(..isStringSingle("""",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"""")  {
		if ..addRegex(.subElement,"[^\""\r\n]*")  {
			if ..addPunctuation(.subElement,"""")  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	quit ok
}

///  tablename ::= identifier
/// summary=C
Method Tablename(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Identifier(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  text ::= 'regexp:.*'
/// summary=R
Method Text(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary R
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..addRegex(.subElement,".*")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  text_brace_block ::= '{' text '}'
/// summary values:{
/// summary=P&C&P
Method TextBraceBlock(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&P
	; first rule summary P
	if '(..isStringSingle("{",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"{")  {
		if ..Text(.subElement,.addedElement)  {
			if ..addPunctuation(.subElement,"}")  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  text_in_curly ::= 'NEEDS TEXT IN CURLY'
/// summary values:NEEDS TEXT IN CURLY
/// summary=P
Method TextInCurly(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("NEEDS TEXT IN CURLY",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"NEEDS TEXT IN CURLY")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  time_value ::= 'after' | 'before'
/// summary values:AFTER,BEFORE
/// summary=K|K
Method TimeValue(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K
	if '(..isKeywordInList($lb("AFTER","BEFORE"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"AFTER")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"BEFORE")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  trigger_attribute ::= attribute_CodeMode | attribute_Event | attribute_Final | attribute_ForEach | attribute_Internal | attribute_Language | attribute_NewTable | attribute_OldTable | attribute_Order | attribute_SQLName | attribute_Time | attribute_UpdateColumnList
/// summary=C|C|C|C|C|C|C|C|C|C|C|C
Method TriggerAttribute(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C|C|C|C|C|C|C|C|C|C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..AttributeCodemode(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeEvent(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeFinal(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeForeach(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeInternal(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeLanguage(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeNewtable(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeOldtable(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeOrder(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeSqlname(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeTime(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeUpdatecolumnlist(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  trigger_attribute_list ::= '[' trigger_attribute ( ',' trigger_attribute )* ']'
/// summary values:[
/// summary=P&C&(?4punctuation:4?)*&P
Method TriggerAttributeList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&(?4punctuation:4?)*&P
	; first rule summary P
	if '(..isStringSingle("[",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"[")  {
		if ..TriggerAttribute(.subElement,.addedElement)  {
			if ..TriggerAttributeList109RepZero(.subElement,.addedElement)  {
				if ..addPunctuation(.subElement,"]")  {
					set done=1 ; end compileRules
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ( ',' trigger_attribute )*
Method TriggerAttributeList109RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..TriggerAttributeList110Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' trigger_attribute
/// summary values:,
/// summary=P&C
Method TriggerAttributeList110Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..TriggerAttribute(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	quit ok
}

///  trigger_code_block ::= cos_code_block_trigger
/// summary=C
Method TriggerCodeBlock(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CosCodeBlockTrigger(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  trigger_name ::= class_item_identifier
/// summary=C
Method TriggerName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ClassItemIdentifier(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  type_class_reference ::= class_reference [ type_parameters ]
/// summary=C&[C]
Method TypeClassReference(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&[C]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ClassReference(.subElement,.addedElement)  {
		if $S(..TypeParameters(.subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  type_parameter_item ::= class_item_identifier '=' ( string | number )
/// summary=C&P&(C|C)
Method TypeParameterItem(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&P&(C|C)
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ClassItemIdentifier(.subElement,.addedElement)  {
		if ..addPunctuation(.subElement,"=")  {
			if ..TypeParameterItem21Sub(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  string | number
/// summary=C|C
Method TypeParameterItem21Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..String(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Number(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  type_parameters ::= '(' type_parameters_list ')'
/// summary values:(
/// summary=P&C&P
Method TypeParameters(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if ..TypeParametersList(.subElement,.addedElement)  {
			if ..addPunctuation(.subElement,")")  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  type_parameters_list ::= type_parameter_item (',' type_parameter_item)*
/// summary=C&(?4punctuation:4?)*
Method TypeParametersList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..TypeParameterItem(.subElement,.addedElement)  {
		if ..TypeParametersList19RepZero(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  (',' type_parameter_item)*
Method TypeParametersList19RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..TypeParametersList20Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// ',' type_parameter_item
/// summary values:,
/// summary=P&C
Method TypeParametersList20Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..TypeParameterItem(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	quit ok
}

///  udl_program ::= udl_statement
/// summary=C
Method UdlProgram(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..UdlStatement(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  udl_statement ::= ( import_definition | include_generator_definition | include_definition )* class_definition
/// summary=(?4punctuation:4?)*&C
Method UdlStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (?4punctuation:4?)*&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..UdlStatement1RepZero(.subElement,.addedElement)  {
		if ..ClassDefinition(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ( import_definition | include_generator_definition | include_definition )*
Method UdlStatement1RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..UdlStatement2Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  import_definition | include_generator_definition | include_definition
/// summary=C|C|C
Method UdlStatement2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..ImportDefinition(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..IncludeGeneratorDefinition(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..IncludeDefinition(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  variable ::= variable_identifier
/// summary=C
Method Variable(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..VariableIdentifier(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  variable_identifier ::= 'regexp:(\%|[a-zA-Z])[a-zA-Z0-9]*'
/// summary=R
Method VariableIdentifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary R
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..addRegex(.subElement,"(\%|[a-zA-Z])[a-zA-Z0-9]*")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  variable_set ::= variable_identifier
/// summary=C
Method VariableSet(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..VariableIdentifier(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  xdata_attribute ::= attribute_Internal | attribute_MimeType | attribute_SchemaSpec | attribute_XMLNamespace
/// summary=C|C|C|C
Method XdataAttribute(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C|C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..AttributeInternal(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeMimetype(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeSchemaspec(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AttributeXmlnamespace(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  xdata_attributes ::= '[' xdata_attribute (',' xdata_attribute)* ']'
/// summary values:[
/// summary=P&C&(?4punctuation:4?)*&P
Method XdataAttributes(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&(?4punctuation:4?)*&P
	; first rule summary P
	if '(..isStringSingle("[",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"[")  {
		if ..XdataAttribute(.subElement,.addedElement)  {
			if ..XdataAttributes91RepZero(.subElement,.addedElement)  {
				if ..addPunctuation(.subElement,"]")  {
					set done=1 ; end compileRules
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  (',' xdata_attribute)*
Method XdataAttributes91RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..XdataAttributes92Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// ',' xdata_attribute
/// summary values:,
/// summary=P&C
Method XdataAttributes92Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..XdataAttribute(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	quit ok
}

///  xdata_json ::= xdata_json_object | xdata_json_array | xdata_json_prim
/// summary=C|C|C
Method XdataJson(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XdataJsonObject(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..XdataJsonArray(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..XdataJsonPrim(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  xdata_json_array ::= '[' [ xdata_json_array_items ] ']'
/// summary values:[
/// summary=P&[C]&P
Method XdataJsonArray(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&[C]&P
	; first rule summary P
	if '(..isStringSingle("[",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"[")  {
		if $S(..XdataJsonArrayItems(.subElement,.addedElement) :1,1:1) {
			if ..addPunctuation(.subElement,"]")  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  xdata_json_array_items ::= xdata_json (',' xdata_json)*
/// summary=C&(?4punctuation:4?)*
Method XdataJsonArrayItems(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XdataJson(.subElement,.addedElement)  {
		if ..XdataJsonArrayItems107RepZero(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  (',' xdata_json)*
Method XdataJsonArrayItems107RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..XdataJsonArrayItems108Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// ',' xdata_json
/// summary values:,
/// summary=P&C
Method XdataJsonArrayItems108Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..XdataJson(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	quit ok
}

///  xdata_json_object ::= '{' [ xdata_json_pair ( ',' xdata_json_pair )*] '}'
/// summary values:{
/// summary=P&[C&(?4punctuation:4?)*]&P
Method XdataJsonObject(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&[C&(?4punctuation:4?)*]&P
	; first rule summary P
	if '(..isStringSingle("{",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"{")  {
		if ..XdataJsonObject104OptGrp(.subElement,.addedElement)  {
			if ..addPunctuation(.subElement,"}")  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=C&(?4punctuation:4?)*
Method XdataJsonObject104OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&(?4punctuation:4?)*
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XdataJsonPair(.subElement,.addedElement)  {
		if ..XdataJsonObject105RepZero(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=1 /* failure rollsback but returns OK */
	}
	quit ok
}

///  ( ',' xdata_json_pair )*
Method XdataJsonObject105RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..XdataJsonObject106Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' xdata_json_pair
/// summary values:,
/// summary=P&C
Method XdataJsonObject106Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..XdataJsonPair(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	quit ok
}

///  xdata_json_pair ::= json_string ':' xdata_json
/// summary=C&P&C
Method XdataJsonPair(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&P&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..JsonString(.subElement,.addedElement)  {
		if ..addPunctuation(.subElement,":")  {
			if ..XdataJson(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  xdata_json_prim ::= number | json_string | 'true' | 'false' | 'null'
/// summary=C|C|K|K|K
Method XdataJsonPrim(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C|K|K|K
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Number(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..JsonString(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"TRUE")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"FALSE")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"NULL")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  xdata_name ::= class_item_identifier
/// summary=C
Method XdataName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ClassItemIdentifier(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  xdata_text ::= text
/// summary=C
Method XdataText(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Text(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  xdata_xml ::= [xml_xml] xml_data
/// summary=[C]&C
Method XdataXml(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary [C]&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..XmlXml(.subElement,.addedElement) :1,1:1) {
		if ..XmlData(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  xml_attribute ::= [ xml_schema ':' ] xml_attribute_name '=' xml_attribute_value
/// summary=[C&P]&C&P&C
Method XmlAttribute(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary [C&P]&C&P&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlAttribute101OptGrp(.subElement,.addedElement)  {
		if ..XmlAttributeName(.subElement,.addedElement)  {
			if ..addPunctuation(.subElement,"=")  {
				if ..XmlAttributeValue(.subElement,.addedElement)  {
					set done=1 ; end compileRules
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=C&P
Method XmlAttribute101OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&P
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlSchema(.subElement,.addedElement)  {
		if ..addPunctuation(.subElement,":")  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=1 /* failure rollsback but returns OK */
	}
	quit ok
}

///  xml_attribute_name ::= xml_identifier
/// summary=C
Method XmlAttributeName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlIdentifier(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  xml_attribute_value ::= string | number
/// summary=C|C
Method XmlAttributeValue(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..String(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Number(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  xml_cdata ::= '<' '!' '[CDATA[' xml_cdata_text ']]' '>'
/// summary values:<
/// summary=P&P&P&C&P&P
Method XmlCdata(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&P&P&C&P&P
	; first rule summary P
	if '(..isStringSingle("<",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"<")  {
		if ..addPunctuation(.subElement,"!")  {
			if ..addPunctuation(.subElement,"[CDATA[")  {
				if ..XmlCdataText(.subElement,.addedElement)  {
					if ..addPunctuation(.subElement,"]]")  {
						if ..addPunctuation(.subElement,">")  {
							set done=1 ; end compileRules
						}
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  xml_cdata_text ::= 'NEED XML CDATA TEXT THAT READS UP TO END OF CDATA'
/// summary values:NEED XML CDATA TEXT THAT READS UP TO END OF CDATA
/// summary=P
Method XmlCdataText(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("NEED XML CDATA TEXT THAT READS UP TO END OF CDATA",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"NEED XML CDATA TEXT THAT READS UP TO END OF CDATA")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  xml_content ::= text
/// summary=C
Method XmlContent(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Text(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  xml_data ::= xml_cdata | ( xml_start_tag ( xml_data | xml_content)* xml_end_tag) | xml_empty_tag
/// summary=C|(C&(?4punctuation:4?)*&C)|C
Method XmlData(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|(C&(?4punctuation:4?)*&C)|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlCdata(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..XmlData93Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..XmlEmptyTag(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  xml_start_tag ( xml_data | xml_content)* xml_end_tag
/// summary=C&(?4punctuation:4?)*&C
Method XmlData93Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&(?4punctuation:4?)*&C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlStartTag(.subElement,.addedElement)  {
		if ..XmlData94RepZero(.subElement,.addedElement)  {
			if ..XmlEndTag(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	quit ok
}

///  ( xml_data | xml_content)*
Method XmlData94RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..XmlData95Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  xml_data | xml_content
/// summary=C|C
Method XmlData95Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..XmlData(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..XmlContent(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  xml_empty_tag ::= xml_tag_s_a xml_tag_ns_name (xml_attribute)* xml_tag_s_c
/// summary=C&C&(?4punctuation:4?)*&C
Method XmlEmptyTag(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&C&(?4punctuation:4?)*&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(.subElement,.addedElement)  {
		if ..XmlTagNsName(.subElement,.addedElement)  {
			if ..XmlEmptyTag98RepZero(.subElement,.addedElement)  {
				if ..XmlTagSC(.subElement,.addedElement)  {
					set done=1 ; end compileRules
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  (xml_attribute)*
Method XmlEmptyTag98RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..XmlEmptyTag99Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// xml_attribute
/// summary=C
Method XmlEmptyTag99Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C
	set subElement=ParentElement
	set done=0 ; method start
	if ..XmlAttribute(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  xml_end_tag ::= xml_tag_e_a xml_tag_ns_name xml_tag_e_b
/// summary=C&C&C
Method XmlEndTag(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&C&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagEA(.subElement,.addedElement)  {
		if ..XmlTagNsName(.subElement,.addedElement)  {
			if ..XmlTagEB(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  xml_identifier ::= 'regexp:(\_|[a-zA-Z])[a-zA-Z0-9]\-\_\.*'
/// summary=R
Method XmlIdentifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary R
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..addRegex(.subElement,"(\_|[a-zA-Z])[a-zA-Z0-9]\-\_\.*")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  xml_schema ::= xml_identifier
/// summary=C
Method XmlSchema(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlIdentifier(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  xml_start_tag ::= xml_tag_s_a xml_tag_ns_name (xml_attribute)* xml_tag_s_b
/// summary=C&C&(?4punctuation:4?)*&C
Method XmlStartTag(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&C&(?4punctuation:4?)*&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(.subElement,.addedElement)  {
		if ..XmlTagNsName(.subElement,.addedElement)  {
			if ..XmlStartTag96RepZero(.subElement,.addedElement)  {
				if ..XmlTagSB(.subElement,.addedElement)  {
					set done=1 ; end compileRules
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  (xml_attribute)*
Method XmlStartTag96RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..XmlStartTag97Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// xml_attribute
/// summary=C
Method XmlStartTag97Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C
	set subElement=ParentElement
	set done=0 ; method start
	if ..XmlAttribute(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  xml_tag_e_a ::= '</'
/// summary values:</
/// summary=P
Method XmlTagEA(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("</",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"</")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  xml_tag_e_b ::= '>'
/// summary values:>
/// summary=P
Method XmlTagEB(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle(">",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,">")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  xml_tag_name ::= xml_identifier
/// summary=C
Method XmlTagName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlIdentifier(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  xml_tag_ns_name ::= [ xml_schema ':'] xml_tag_name
/// summary=[C&P]&C
Method XmlTagNsName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary [C&P]&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagNsName100OptGrp(.subElement,.addedElement)  {
		if ..XmlTagName(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=C&P
Method XmlTagNsName100OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&P
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlSchema(.subElement,.addedElement)  {
		if ..addPunctuation(.subElement,":")  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=1 /* failure rollsback but returns OK */
	}
	quit ok
}

///  xml_tag_s_a ::= '<'
/// summary values:<
/// summary=P
Method XmlTagSA(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("<",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"<")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  xml_tag_s_b ::= '>'
/// summary values:>
/// summary=P
Method XmlTagSB(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle(">",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,">")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  xml_tag_s_c ::= '/>'
/// summary values:/>
/// summary=P
Method XmlTagSC(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("/>",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"/>")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  xml_xml ::= xml_tag_s_a '?xml' (xml_attribute)* '?' xml_tag_s_b
/// summary=C&P&(?4punctuation:4?)*&P&C
Method XmlXml(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&P&(?4punctuation:4?)*&P&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XmlTagSA(.subElement,.addedElement)  {
		if ..addPunctuation(.subElement,"?xml")  {
			if ..XmlXml102RepZero(.subElement,.addedElement)  {
				if ..addPunctuation(.subElement,"?")  {
					if ..XmlTagSB(.subElement,.addedElement)  {
						set done=1 ; end compileRules
					}
				}
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  (xml_attribute)*
Method XmlXml102RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..XmlXml103Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// xml_attribute
/// summary=C
Method XmlXml103Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C
	set subElement=ParentElement
	set done=0 ; method start
	if ..XmlAttribute(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

Method newElement(Type As %String) As PXW.DEV.BNF.Elements.ClassDefinition
{
	quit ##class(PXW.DEV.BNF.Elements.ClassDefinition).%New(Type)
}

}
