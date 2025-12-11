/// Created: 2025-12-11 20:19:37 PXW.DEV.BNF.Compilers.Compiler1
Class PXW.DEV.BNF.GEN.COS Extends PXW.DEV.BNF.super [ ProcedureBlock ]
{

Parameter KeywordPattern = "1A.AN";

Parameter Keywords = "A,ARRAY,AS,B,BITLOGIC,BREAK,C,CASE,CATCH,CLASSCONTEXT,CLASSMETHOD,CLOSE,CONTINUE,D,DEF1ARG,DEFERRED,DEFINE,DEVICE,DIM,DISPLAY,DO,E,EC,ECODE,ELSE,ELSEIF,ENDIF,ES,ESTACK,ET,ETRAP,EXECUTE,EXTRACT,F,FALSE,FDBMS,FOR,G,GENERATOR,GOTO,H,HALT,HANG,HOROLOG,I,IF,IFDEF,IFNDEF,IMPORT,INCLUDE,INCREMENT,IO,J,JOB,K,KEY,KILL,L,LB,LG,LI,LIST,LISTBUILD,LISTGET,LISTUPDATE,LOCK,LOGICAL,LU,M,MERGE,METHOD,METHODIMPL,MNV,MODE,MV,MVAM,MVANS,MVCOMMAND,MVCONV,MVDATE,MVDAY,MVDICT,MVERRORS,MVFILENAME,MVFM,MVFOOTER,MVFORMAT,MVHEADER,MVID,MVLEVEL,MVMONTH,MVMORESUBVALUES,MVMOREVALUES,MVNAM,MVNB,MVND,MVNI,MVNS,MVNV,MVOPTIONS,MVP,MVPARASENTENCE,MVPRINT,MVPROCERRORS,MVPROCNAME,MVPROCPIB,MVPROCPIBOFF,MVPROCPOB,MVPROCSIB,MVPROCSIBOFF,MVPROCSOB,MVRECORD,MVSELECTED,MVSENTENCE,MVSM,MVSTDFIL,MVSVM,MVSYSRETCODE,MVTIME,MVTM,MVTTY,MVUSERRETCODE,MVVM,MVYEAR,N,NAMESPACE,NEW,NULL,O,ODBC,OF,OPEN,ORDER,P,PIECE,PRINCIPAL,PRINT,PRIVATE,PUBLIC,PYTHON,Q,QUERY,QUIT,R,READ,RETURN,ROLES,RUNTIME,S,SELECT,SET,SPECIAL,SQLCOMPILE,STACK,STORAGE,SY,SYSTEM,T,TC,TCOMMIT,TEST,TEXT,THIS,THROW,THROWOBJ,TL,TLEVEL,TROLLBACK,TRUE,TRY,TS,TSTART,U,UNDEF,USE,USERNAME,V,VECTOR,VIEW,W,WHILE,WRITE,X,XECUTE,Y,ZA,ZALLOCATE,ZB,ZBREAK,ZCHILD,ZDEALLOCATE,ZE,ZEOF,ZEOS,ZERROR,ZFWCHARZ,ZH,ZHOROLOG,ZHWKATAZ,ZINSERT,ZIO,ZJOB,ZK,ZKILL,ZLOAD,ZMODE,ZN,ZNAME,ZNSPACE,ZOBJCLASSMETHOD,ZOBJMETHOD,ZORDER,ZPARENT,ZPI,ZPOS,ZPRINT,ZQUIT,ZR,ZREFERENCE,ZREMOVE,ZS,ZSAVE,ZSTORAGE,ZSYNC,ZT,ZTIMESTAMP,ZTIMEZONE,ZTRAP,ZTS,ZU,ZUTIL,ZV,ZVERSION,ZW,ZWRITE,ZZ,ZZDUMP,ZZWRITE";

///  amp_op ::= '&'
/// summary values:&
/// summary=P
Method AmpOp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("&",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"&")  {
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

///  any_keyword ::= 'need any keyword'
/// summary values:NEED ANY KEYWORD
/// summary=P
Method AnyKeyword(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("NEED ANY KEYWORD",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"need any keyword")  {
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

///  any_text_upto_close_bracket ::= 'code this'
/// summary values:CODE THIS
/// summary=P
Method AnyTextUptoCloseBracket(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("CODE THIS",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"code this")  {
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

///  array_parameter_list ::= open_bracket expression ( ',' expression )* close_bracket
/// summary=C&C&(?4punctuation:4?)*&C
Method ArrayParameterList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&C&(?4punctuation:4?)*&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OpenBracket(.subElement,.addedElement)  {
		if ..Expression(.subElement,.addedElement)  {
			if ..ArrayParameterList105RepZero(.subElement,.addedElement)  {
				if ..CloseBracket(.subElement,.addedElement)  {
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

///  ( ',' expression )*
Method ArrayParameterList105RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ArrayParameterList106Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' expression
/// summary values:,
/// summary=P&C
Method ArrayParameterList106Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..Expression(.subElement,.addedElement)  {
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

///  bitlogic_expression ::= (expression ('|' | '&' | '^' |'~')* )*
/// summary=(?4punctuation:4?)*
Method BitlogicExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..BitlogicExpression355RepZero(.subElement,.addedElement)  {
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

///  (expression ('|' | '&' | '^' |'~')* )*
Method BitlogicExpression355RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..BitlogicExpression356Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// expression ('|' | '&' | '^' |'~')*
/// summary=C&(?4punctuation:4?)*
Method BitlogicExpression356Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&(?4punctuation:4?)*
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(.subElement,.addedElement)  {
		if ..BitlogicExpression357RepZero(.subElement,.addedElement)  {
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

///  ('|' | '&' | '^' |'~')*
Method BitlogicExpression357RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..BitlogicExpression358Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// '|' | '&' | '^' |'~'
/// summary values:|,&,^,~
/// summary=P|P|P|P
Method BitlogicExpression358Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P|P|P|P
	if '(..isStringInList($lb("|","&","^","~"),1,.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addPunctuation(.subElement,"|")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"&")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"^")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"~")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  bitlogic_function_call ::= 'bitlogic' open_bracket bitlogic_expression [ ',' expression ] close_bracket
/// summary values:BITLOGIC
/// summary=K&C&C&[P&C]&C
Method BitlogicFunctionCall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C&C&[P&C]&C
	if '(..isKeyword("BITLOGIC",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"BITLOGIC")  {
		if ..OpenBracket(.subElement,.addedElement)  {
			if ..BitlogicExpression(.subElement,.addedElement)  {
				if ..BitlogicFunctionCall354OptGrp(.subElement,.addedElement)  {
					if ..CloseBracket(.subElement,.addedElement)  {
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
/// summary values:,
/// summary=P&C
Method BitlogicFunctionCall354OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 1 /* not found is OK */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
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

///  block_comment ::= '/*' text '*/'
/// summary values:/*
/// summary=P&C&P
Method BlockComment(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&P
	; first rule summary P
	if '(..isStringSingle("/*",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"/*")  {
		if ..Text(.subElement,.addedElement)  {
			if ..addPunctuation(.subElement,"*/")  {
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

///  break_command ::= ('break' | 'b') [ post_conditional ] [ naked | ( break_extend | break_flag )]
/// summary values:BREAK,B
/// summary=(K|K)&[C]&[C|(C|C)]
Method BreakCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&[C]&[C|(C|C)]
	if '(..isKeywordInList($lb("BREAK","B"),.value)) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..BreakCommand119Sub(.subElement,.addedElement)  {
		if $S(..PostConditional(.subElement,.addedElement) :1,1:1) {
			if ..BreakCommand120OptGrp(.subElement,.addedElement)  {
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

/// 'break' | 'b'
/// summary values:BREAK,B
/// summary=K|K
Method BreakCommand119Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K|K
	if '(..isKeywordInList($lb("BREAK","B"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"BREAK")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"B")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

/// 
/// summary=C|(C|C)
Method BreakCommand120OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|(C|C)
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Naked(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..BreakCommand121Sub(.subElement,.addedElement)  {
		set done=1 ; end compileRules
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

///  break_extend | break_flag
/// summary=C|C
Method BreakCommand121Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..BreakExtend(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..BreakFlag(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  break_extend ::= expression
/// summary=C
Method BreakExtend(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(.subElement,.addedElement)  {
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

///  break_flag ::= expression
/// summary=C
Method BreakFlag(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(.subElement,.addedElement)  {
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

///  byref_variable ::= variable_set
/// summary=C
Method ByrefVariable(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..VariableSet(.subElement,.addedElement)  {
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

///  case_clause ::= case_clause_case ':' case_clause_value
/// summary=C&P&C
Method CaseClause(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&P&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CaseClauseCase(.subElement,.addedElement)  {
		if ..addPunctuation(.subElement,":")  {
			if ..CaseClauseValue(.subElement,.addedElement)  {
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

///  case_clause_case ::= expression
/// summary=C
Method CaseClauseCase(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(.subElement,.addedElement)  {
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

///  case_clause_default ::= ',' ':' expression
/// summary values:,
/// summary=P&P&C
Method CaseClauseDefault(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..addPunctuation(.subElement,":")  {
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

///  case_clause_value ::= expression
/// summary=C
Method CaseClauseValue(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(.subElement,.addedElement)  {
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

///  case_clauses ::= (( ',' case_clause ))*
/// summary=(?4punctuation:4?)*
Method CaseClauses(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CaseClauses320RepZero(.subElement,.addedElement)  {
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

///  (( ',' case_clause ))*
Method CaseClauses320RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..CaseClauses321Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// ( ',' case_clause )
/// summary=(P&C)
Method CaseClauses321Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary (P&C)
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CaseClauses322Sub(.subElement,.addedElement)  {
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

///  ',' case_clause
/// summary values:,
/// summary=P&C
Method CaseClauses322Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..CaseClause(.subElement,.addedElement)  {
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

///  case_function_call ::= 'case' open_bracket expression [ case_clauses ] [ case_clause_default ] close_bracket
/// summary values:CASE
/// summary=K&C&C&[C]&[C]&C
Method CaseFunctionCall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C&C&[C]&[C]&C
	if '(..isKeyword("CASE",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"CASE")  {
		if ..OpenBracket(.subElement,.addedElement)  {
			if ..Expression(.subElement,.addedElement)  {
				if $S(..CaseClauses(.subElement,.addedElement) :1,1:1) {
					if $S(..CaseClauseDefault(.subElement,.addedElement) :1,1:1) {
						if ..CloseBracket(.subElement,.addedElement)  {
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

///  class_casting ::= ['(' ] ( '##this' | '$this' | variable_identifier ) [')']
/// summary=[P]&(P|P|C)&[P]
Method ClassCasting(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary [P]&(P|P|C)&[P]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..addPunctuation(.subElement,"(") :1,1:1) {
		if ..ClassCasting90Sub(.subElement,.addedElement)  {
			if $S(..addPunctuation(.subElement,")") :1,1:1) {
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

///  '##this' | '$this' | variable_identifier
/// summary=P|P|C
Method ClassCasting90Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P|P|C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"##this")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"$this")  {
		set done=1 ; or
	} elseif ..VariableIdentifier(.subElement,.addedElement)  {
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

///  class_expression ::= '##class' '(' class_reference ')' [ class_casting ] object_chain
/// summary values:##CLASS
/// summary=P&P&C&P&[C]&C
Method ClassExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&P&C&P&[C]&C
	; first rule summary P
	if '(..isStringSingle("##CLASS",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"##class")  {
		if ..addPunctuation(.subElement,"(")  {
			if ..ClassReference(.subElement,.addedElement)  {
				if ..addPunctuation(.subElement,")")  {
					if $S(..ClassCasting(.subElement,.addedElement) :1,1:1) {
						if ..ObjectChain(.subElement,.addedElement)  {
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

///  class_identifier ::= 'regexp:(\%|[a-zA-Z])[a-zA-Z0-9\.]*)'
/// summary=R
Method ClassIdentifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary R
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..addRegex(.subElement,"(\%|[a-zA-Z])[a-zA-Z0-9\.]*)")  {
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

///  classexpr ::= super_expression | class_expression
/// summary=C|C
Method Classexpr(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SuperExpression(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ClassExpression(.subElement,.addedElement)  {
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

///  classmethod_class ::= expression
/// summary=C
Method ClassmethodClass(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(.subElement,.addedElement)  {
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

///  classmethod_function_call ::= 'classmethod' open_bracket classmethod_class ',' classmethod_method [ ',' function_parameter_list_items ] close_bracket [ object_chain ]
/// summary values:CLASSMETHOD
/// summary=K&C&C&P&C&[P&C]&C&[C]
Method ClassmethodFunctionCall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C&C&P&C&[P&C]&C&[C]
	if '(..isKeyword("CLASSMETHOD",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"CLASSMETHOD")  {
		if ..OpenBracket(.subElement,.addedElement)  {
			if ..ClassmethodClass(.subElement,.addedElement)  {
				if ..addPunctuation(.subElement,",")  {
					if ..ClassmethodMethod(.subElement,.addedElement)  {
						if ..ClassmethodFunctionCall382OptGrp(.subElement,.addedElement)  {
							if ..CloseBracket(.subElement,.addedElement)  {
								if $S(..ObjectChain(.subElement,.addedElement) :1,1:1) {
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
Method ClassmethodFunctionCall382OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 1 /* not found is OK */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..FunctionParameterListItems(.subElement,.addedElement)  {
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

///  classmethod_method ::= expression
/// summary=C
Method ClassmethodMethod(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(.subElement,.addedElement)  {
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

///  close_bracket ::= ')'
/// summary values:)
/// summary=P
Method CloseBracket(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle(")",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,")")  {
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

///  close_command ::= ('close' | 'c') [ post_conditional ] close_item (',' close_item)*
/// summary values:CLOSE,C
/// summary=(K|K)&[C]&C&(?4punctuation:4?)*
Method CloseCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&[C]&C&(?4punctuation:4?)*
	if '(..isKeywordInList($lb("CLOSE","C"),.value)) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CloseCommand122Sub(.subElement,.addedElement)  {
		if $S(..PostConditional(.subElement,.addedElement) :1,1:1) {
			if ..CloseItem(.subElement,.addedElement)  {
				if ..CloseCommand123RepZero(.subElement,.addedElement)  {
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

/// 'close' | 'c'
/// summary values:CLOSE,C
/// summary=K|K
Method CloseCommand122Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K|K
	if '(..isKeywordInList($lb("CLOSE","C"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"CLOSE")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"C")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  (',' close_item)*
Method CloseCommand123RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..CloseCommand124Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// ',' close_item
/// summary values:,
/// summary=P&C
Method CloseCommand124Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..CloseItem(.subElement,.addedElement)  {
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

///  close_device ::= expression
/// summary=C
Method CloseDevice(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(.subElement,.addedElement)  {
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

///  close_device_parameter_list ::= ( one_close_device_parameter ( ':' one_close_device_parameter )* )
/// summary=(C&(?4punctuation:4?)*)
Method CloseDeviceParameterList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (C&(?4punctuation:4?)*)
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CloseDeviceParameterList127Sub(.subElement,.addedElement)  {
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

///  one_close_device_parameter ( ':' one_close_device_parameter )*
/// summary=C&(?4punctuation:4?)*
Method CloseDeviceParameterList127Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&(?4punctuation:4?)*
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OneCloseDeviceParameter(.subElement,.addedElement)  {
		if ..CloseDeviceParameterList128RepZero(.subElement,.addedElement)  {
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

///  ( ':' one_close_device_parameter )*
Method CloseDeviceParameterList128RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..CloseDeviceParameterList129Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ':' one_close_device_parameter
/// summary values::
/// summary=P&C
Method CloseDeviceParameterList129Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(":",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,":")  {
		if ..OneCloseDeviceParameter(.subElement,.addedElement)  {
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

///  close_device_parameters ::= ( '(' close_device_parameter_list ')' ) | one_close_device_parameter
/// summary=(P&C&P)|C
Method CloseDeviceParameters(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (P&C&P)|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CloseDeviceParameters126Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OneCloseDeviceParameter(.subElement,.addedElement)  {
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

///  '(' close_device_parameter_list ')'
/// summary values:(
/// summary=P&C&P
Method CloseDeviceParameters126Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if ..CloseDeviceParameterList(.subElement,.addedElement)  {
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

///  close_item ::= open_device [ ':' close_device_parameters ]
/// summary=C&[P&C]
Method CloseItem(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&[P&C]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OpenDevice(.subElement,.addedElement)  {
		if ..CloseItem125OptGrp(.subElement,.addedElement)  {
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
/// summary values::
/// summary=P&C
Method CloseItem125OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(":",.value)) { quit 1 /* not found is OK */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,":")  {
		if ..CloseDeviceParameters(.subElement,.addedElement)  {
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

///  command_list ::= cos_command ( cos_command )*
/// summary=C&(?4punctuation:4?)*
Method CommandList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CosCommand(.subElement,.addedElement)  {
		if ..CommandList43RepZero(.subElement,.addedElement)  {
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

///  ( cos_command )*
Method CommandList43RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..CommandList44Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  cos_command
/// summary=C
Method CommandList44Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C
	set subElement=ParentElement
	set done=0 ; method start
	if ..CosCommand(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  command_list_eol ::= cos_command_or_macro ( cos_command_or_macro )*
/// summary=C&(?4punctuation:4?)*
Method CommandListEol(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CosCommandOrMacro(.subElement,.addedElement)  {
		if ..CommandListEol45RepZero(.subElement,.addedElement)  {
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

///  ( cos_command_or_macro )*
Method CommandListEol45RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..CommandListEol46Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  cos_command_or_macro
/// summary=C
Method CommandListEol46Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C
	set subElement=ParentElement
	set done=0 ; method start
	if ..CosCommandOrMacro(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  command_list_eol_continue ::= cos_command ( cos_command )*
/// summary=C&(?4punctuation:4?)*
Method CommandListEolContinue(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CosCommand(.subElement,.addedElement)  {
		if ..CommandListEolContinue47RepZero(.subElement,.addedElement)  {
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

///  ( cos_command )*
Method CommandListEolContinue47RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..CommandListEolContinue48Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  cos_command
/// summary=C
Method CommandListEolContinue48Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C
	set subElement=ParentElement
	set done=0 ; method start
	if ..CosCommand(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  comment ::= line_comment | block_comment
/// summary=C|C
Method Comment(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LineComment(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..BlockComment(.subElement,.addedElement)  {
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

///  continue_command ::= 'continue' [ post_conditional ]
/// summary values:CONTINUE
/// summary=K&[C]
Method ContinueCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&[C]
	if '(..isKeyword("CONTINUE",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"CONTINUE")  {
		if $S(..PostConditional(.subElement,.addedElement) :1,1:1) {
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

///  cos_code_block ::= one_cos_statement ( one_cos_statement )*
/// summary=C&(?4punctuation:4?)*
Method CosCodeBlock(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OneCosStatement(.subElement,.addedElement)  {
		if ..CosCodeBlock1RepZero(.subElement,.addedElement)  {
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

///  ( one_cos_statement )*
Method CosCodeBlock1RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..CosCodeBlock2Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  one_cos_statement
/// summary=C
Method CosCodeBlock2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C
	set subElement=ParentElement
	set done=0 ; method start
	if ..OneCosStatement(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  cos_code_block_sql ::= one_cos_Statement_sql ( one_cos_statement_sql)*
/// summary=C&(?4punctuation:4?)*
Method CosCodeBlockSql(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OneCosStatementSql(.subElement,.addedElement)  {
		if ..CosCodeBlockSql3RepZero(.subElement,.addedElement)  {
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

///  ( one_cos_statement_sql)*
Method CosCodeBlockSql3RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..CosCodeBlockSql4Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  one_cos_statement_sql
/// summary=C
Method CosCodeBlockSql4Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C
	set subElement=ParentElement
	set done=0 ; method start
	if ..OneCosStatementSql(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  cos_code_block_sql_storage ::= one_cos_Statement_sql ( one_cos_statement_sql)*
/// summary=C&(?4punctuation:4?)*
Method CosCodeBlockSqlStorage(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OneCosStatementSql(.subElement,.addedElement)  {
		if ..CosCodeBlockSqlStorage5RepZero(.subElement,.addedElement)  {
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

///  ( one_cos_statement_sql)*
Method CosCodeBlockSqlStorage5RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..CosCodeBlockSqlStorage6Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  one_cos_statement_sql
/// summary=C
Method CosCodeBlockSqlStorage6Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C
	set subElement=ParentElement
	set done=0 ; method start
	if ..OneCosStatementSql(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  cos_code_block_trigger ::= one_cos_statement ( one_cos_statement )*
/// summary=C&(?4punctuation:4?)*
Method CosCodeBlockTrigger(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OneCosStatement(.subElement,.addedElement)  {
		if ..CosCodeBlockTrigger7RepZero(.subElement,.addedElement)  {
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

///  ( one_cos_statement )*
Method CosCodeBlockTrigger7RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..CosCodeBlockTrigger8Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  one_cos_statement
/// summary=C
Method CosCodeBlockTrigger8Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C
	set subElement=ParentElement
	set done=0 ; method start
	if ..OneCosStatement(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  cos_command ::= set_command | if_command | quit_command | do_command | for_command | kill_command | break_command | continue_command | goto_command | else_command | hang_command | halt_command | job_command | sql_command | js_command | lock_command | merge_command | new_command | open_command | close_command | return_command | read_command | tcommit_command | throw_command | trollback_command | try_command | tstart_command | use_command | view_command | while_command | write_command | xecute_command | cos_directive | zallocate_command | zbreak_command | zdeallocate_command | zinsert_command | zkill_command | zload_command | znspace_command | zprint_command | zquit_command | zremove_command | zsave_command | zsync_command | ztrap_command | zwrite_command | zzdump_command | zzwrite_command | html_command | print_command | mpv_command | ZZ_COMMAND
/// summary=C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C
Method CosCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SetCommand(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..IfCommand(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..QuitCommand(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..DoCommand(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ForCommand(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..KillCommand(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..BreakCommand(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ContinueCommand(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..GotoCommand(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ElseCommand(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..HangCommand(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..HaltCommand(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..JobCommand(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlCommand(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..JsCommand(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..LockCommand(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..MergeCommand(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..NewCommand(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OpenCommand(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CloseCommand(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ReturnCommand(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ReadCommand(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..TcommitCommand(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ThrowCommand(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..TrollbackCommand(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..TryCommand(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..TstartCommand(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..UseCommand(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ViewCommand(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..WhileCommand(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..WriteCommand(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..XecuteCommand(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CosDirective(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ZallocateCommand(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ZbreakCommand(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ZdeallocateCommand(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ZinsertCommand(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ZkillCommand(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ZloadCommand(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ZnspaceCommand(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ZprintCommand(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ZquitCommand(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ZremoveCommand(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ZsaveCommand(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ZsyncCommand(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ZtrapCommand(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ZwriteCommand(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ZzdumpCommand(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ZzwriteCommand(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..HtmlCommand(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..PrintCommand(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..MpvCommand(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ZzCommand(.subElement,.addedElement)  {
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

///  cos_command_or_macro ::= cos_command | macrocall
/// summary=C|C
Method CosCommandOrMacro(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CosCommand(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Macrocall(.subElement,.addedElement)  {
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

///  cos_directive ::= '#' ( cos_directive_define | cos_directive_dim | cos_directive_ifdef | cos_directive_ifndef | cos_directive_if | cos_directive_else | cos_directive_elseif | cos_directive_endif | cos_directive_defonearg | cos_directive_include | cos_directive_undef | cos_directive_execute | cos_directive_sqlcompile | cos_directive_classcontext | cos_directive_generator | cos_directive_classmethod )
/// summary values:#
/// summary=P&(C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C)
Method CosDirective(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&(C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C)
	; first rule summary P
	if '(..isStringSingle("#",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"#")  {
		if ..CosDirective24Sub(.subElement,.addedElement)  {
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

///  cos_directive_define | cos_directive_dim | cos_directive_ifdef | cos_directive_ifndef | cos_directive_if | cos_directive_else | cos_directive_elseif | cos_directive_endif | cos_directive_defonearg | cos_directive_include | cos_directive_undef | cos_directive_execute | cos_directive_sqlcompile | cos_directive_classcontext | cos_directive_generator | cos_directive_classmethod
/// summary=C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C
Method CosDirective24Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..CosDirectiveDefine(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CosDirectiveDim(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CosDirectiveIfdef(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CosDirectiveIfndef(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CosDirectiveIf(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CosDirectiveElse(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CosDirectiveElseif(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CosDirectiveEndif(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CosDirectiveDefonearg(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CosDirectiveInclude(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CosDirectiveUndef(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CosDirectiveExecute(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CosDirectiveSqlcompile(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CosDirectiveClasscontext(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CosDirectiveGenerator(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CosDirectiveClassmethod(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  cos_directive_classcontext ::= 'classcontext' class_reference
/// summary values:CLASSCONTEXT
/// summary=K&C
Method CosDirectiveClasscontext(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C
	if '(..isKeyword("CLASSCONTEXT",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"CLASSCONTEXT")  {
		if ..ClassReference(.subElement,.addedElement)  {
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

///  cos_directive_classmethod ::= 'classmethod' object_member_identifier
/// summary values:CLASSMETHOD
/// summary=K&C
Method CosDirectiveClassmethod(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C
	if '(..isKeyword("CLASSMETHOD",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"CLASSMETHOD")  {
		if ..ObjectMemberIdentifier(.subElement,.addedElement)  {
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

///  cos_directive_define ::= 'define' cos_directive_define_name [ array_parameter_list ] [cos_directive_define_subst]
/// summary values:DEFINE
/// summary=K&C&[C]&[C]
Method CosDirectiveDefine(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C&[C]&[C]
	if '(..isKeyword("DEFINE",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"DEFINE")  {
		if ..CosDirectiveDefineName(.subElement,.addedElement)  {
			if $S(..ArrayParameterList(.subElement,.addedElement) :1,1:1) {
				if $S(..CosDirectiveDefineSubst(.subElement,.addedElement) :1,1:1) {
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

///  cos_directive_define_name ::= macro_identifier
/// summary=C
Method CosDirectiveDefineName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..MacroIdentifier(.subElement,.addedElement)  {
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

///  cos_directive_define_subst ::= [ command_list_eol_continue | expression_list ] text_to_eol_continue
/// summary=[C|C]&C
Method CosDirectiveDefineSubst(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary [C|C]&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CosDirectiveDefineSubst25OptGrp(.subElement,.addedElement)  {
		if ..TextToEolContinue(.subElement,.addedElement)  {
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
/// summary=C|C
Method CosDirectiveDefineSubst25OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..CommandListEolContinue(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ExpressionList(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=1 /* failure rollsback but returns OK */
	}
	quit ok
}

///  cos_directive_define_subst_old ::= [command_list_eol | expression_list ] text_to_eol_continue
/// summary=[C|C]&C
Method CosDirectiveDefineSubstOld(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary [C|C]&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CosDirectiveDefineSubstOld26OptGrp(.subElement,.addedElement)  {
		if ..TextToEolContinue(.subElement,.addedElement)  {
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
/// summary=C|C
Method CosDirectiveDefineSubstOld26OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..CommandListEol(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ExpressionList(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=1 /* failure rollsback but returns OK */
	}
	quit ok
}

///  cos_directive_defonearg ::= 'def1arg' cos_directive_define_name [ array_parameter_list ] [cos_directive_define_subst]
/// summary values:DEF1ARG
/// summary=K&C&[C]&[C]
Method CosDirectiveDefonearg(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C&[C]&[C]
	if '(..isKeyword("DEF1ARG",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"DEF1ARG")  {
		if ..CosDirectiveDefineName(.subElement,.addedElement)  {
			if $S(..ArrayParameterList(.subElement,.addedElement) :1,1:1) {
				if $S(..CosDirectiveDefineSubst(.subElement,.addedElement) :1,1:1) {
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

///  cos_directive_dim ::= 'dim' cos_directive_dim_item (',' cos_directive_dim_item )*
/// summary values:DIM
/// summary=K&C&(?4punctuation:4?)*
Method CosDirectiveDim(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C&(?4punctuation:4?)*
	if '(..isKeyword("DIM",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"DIM")  {
		if ..CosDirectiveDimItem(.subElement,.addedElement)  {
			if ..CosDirectiveDim27RepZero(.subElement,.addedElement)  {
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

///  (',' cos_directive_dim_item )*
Method CosDirectiveDim27RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..CosDirectiveDim28Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// ',' cos_directive_dim_item
/// summary values:,
/// summary=P&C
Method CosDirectiveDim28Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..CosDirectiveDimItem(.subElement,.addedElement)  {
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

///  cos_directive_dim_item ::= variable_set [(',' variable_set )*] [ 'as' [('array' | 'list') 'of'] class_reference ] [ '=' dim_expression ]
/// summary=C&[(?4punctuation:4?)*]&[K&[(K|K)&K]&C]&[P&C]
Method CosDirectiveDimItem(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&[(?4punctuation:4?)*]&[K&[(K|K)&K]&C]&[P&C]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..VariableSet(.subElement,.addedElement)  {
		if $S(..CosDirectiveDimItem29RepZero(.subElement,.addedElement) :1,1:1) {
			if ..CosDirectiveDimItem31OptGrp(.subElement,.addedElement)  {
				if ..CosDirectiveDimItem34OptGrp(.subElement,.addedElement)  {
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

/// (',' variable_set )*
Method CosDirectiveDimItem29RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..CosDirectiveDimItem30Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// ',' variable_set
/// summary values:,
/// summary=P&C
Method CosDirectiveDimItem30Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..VariableSet(.subElement,.addedElement)  {
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
/// summary values:AS
/// summary=K&[(K|K)&K]&C
Method CosDirectiveDimItem31OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&[(K|K)&K]&C
	if '(..isKeyword("AS",.value)) { quit 1 /* not found is OK */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"AS")  {
		if ..CosDirectiveDimItem32OptGrp(.subElement,.addedElement)  {
			if ..ClassReference(.subElement,.addedElement)  {
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
/// summary values:ARRAY,LIST
/// summary=(K|K)&K
Method CosDirectiveDimItem32OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary (K|K)&K
	if '(..isKeywordInList($lb("ARRAY","LIST"),.value)) { quit 1 /* not found is OK */ /*1*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CosDirectiveDimItem33Sub(.subElement,.addedElement)  {
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

/// 'array' | 'list'
/// summary values:ARRAY,LIST
/// summary=K|K
Method CosDirectiveDimItem33Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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

/// 
/// summary values:=
/// summary=P&C
Method CosDirectiveDimItem34OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle("=",.value)) { quit 1 /* not found is OK */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"=")  {
		if ..DimExpression(.subElement,.addedElement)  {
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

///  cos_directive_else ::= 'else'
/// summary values:ELSE
/// summary=K
Method CosDirectiveElse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeyword("ELSE",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"ELSE")  {
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

///  cos_directive_elseif ::= 'elseif' expression
/// summary values:ELSEIF
/// summary=K&C
Method CosDirectiveElseif(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C
	if '(..isKeyword("ELSEIF",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"ELSEIF")  {
		if ..Expression(.subElement,.addedElement)  {
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

///  cos_directive_endif ::= 'endif'
/// summary values:ENDIF
/// summary=K
Method CosDirectiveEndif(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeyword("ENDIF",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"ENDIF")  {
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

///  cos_directive_execute ::= 'execute' command_list_eol
/// summary values:EXECUTE
/// summary=K&C
Method CosDirectiveExecute(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C
	if '(..isKeyword("EXECUTE",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"EXECUTE")  {
		if ..CommandListEol(.subElement,.addedElement)  {
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

///  cos_directive_generator ::= 'generator'
/// summary values:GENERATOR
/// summary=K
Method CosDirectiveGenerator(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeyword("GENERATOR",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"GENERATOR")  {
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

///  cos_directive_if ::= 'if' expression
/// summary values:IF
/// summary=K&C
Method CosDirectiveIf(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C
	if '(..isKeyword("IF",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"IF")  {
		if ..Expression(.subElement,.addedElement)  {
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

///  cos_directive_ifdef ::= 'ifdef' macro_identifier
/// summary values:IFDEF
/// summary=K&C
Method CosDirectiveIfdef(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C
	if '(..isKeyword("IFDEF",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"IFDEF")  {
		if ..MacroIdentifier(.subElement,.addedElement)  {
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

///  cos_directive_ifndef ::= 'ifndef' macro_identifier
/// summary values:IFNDEF
/// summary=K&C
Method CosDirectiveIfndef(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C
	if '(..isKeyword("IFNDEF",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"IFNDEF")  {
		if ..MacroIdentifier(.subElement,.addedElement)  {
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

///  cos_directive_include ::= 'include' (cos_directive_include_list | cos_directive_include_name)
/// summary values:INCLUDE
/// summary=K&(C|C)
Method CosDirectiveInclude(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&(C|C)
	if '(..isKeyword("INCLUDE",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"INCLUDE")  {
		if ..CosDirectiveInclude35Sub(.subElement,.addedElement)  {
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

/// cos_directive_include_list | cos_directive_include_name
/// summary=C|C
Method CosDirectiveInclude35Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..CosDirectiveIncludeList(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CosDirectiveIncludeName(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  cos_directive_include_list ::= '(' cos_directive_include_name ( ',' cos_directive_include_name )* ')'
/// summary values:(
/// summary=P&C&(?4punctuation:4?)*&P
Method CosDirectiveIncludeList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&(?4punctuation:4?)*&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if ..CosDirectiveIncludeName(.subElement,.addedElement)  {
			if ..CosDirectiveIncludeList41RepZero(.subElement,.addedElement)  {
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

///  ( ',' cos_directive_include_name )*
Method CosDirectiveIncludeList41RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..CosDirectiveIncludeList42Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' cos_directive_include_name
/// summary values:,
/// summary=P&C
Method CosDirectiveIncludeList42Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..CosDirectiveIncludeName(.subElement,.addedElement)  {
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

///  cos_directive_include_name ::= include_identifier
/// summary=C
Method CosDirectiveIncludeName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..IncludeIdentifier(.subElement,.addedElement)  {
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

///  cos_directive_sqlcompile ::= 'sqlcompile' ( ( 'select' '=' ('display' | 'logical' | 'odbc' | 'runtime' | 'text' | 'FDBMS') ) | ( 'mode' '=' ('deferred') ) )
/// summary values:SQLCOMPILE
/// summary=K&((K&P&(K|K|K|K|K|K))|(K&P&(K)))
Method CosDirectiveSqlcompile(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&((K&P&(K|K|K|K|K|K))|(K&P&(K)))
	if '(..isKeyword("SQLCOMPILE",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"SQLCOMPILE")  {
		if ..CosDirectiveSqlcompile36Sub(.subElement,.addedElement)  {
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

///  ( 'select' '=' ('display' | 'logical' | 'odbc' | 'runtime' | 'text' | 'FDBMS') ) | ( 'mode' '=' ('deferred') )
/// summary=(K&P&(K|K|K|K|K|K))|(K&P&(K))
Method CosDirectiveSqlcompile36Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary (K&P&(K|K|K|K|K|K))|(K&P&(K))
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CosDirectiveSqlcompile37Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CosDirectiveSqlcompile39Sub(.subElement,.addedElement)  {
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

///  'select' '=' ('display' | 'logical' | 'odbc' | 'runtime' | 'text' | 'FDBMS')
/// summary values:SELECT
/// summary=K&P&(K|K|K|K|K|K)
Method CosDirectiveSqlcompile37Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&P&(K|K|K|K|K|K)
	if '(..isKeyword("SELECT",.value)) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"SELECT")  {
		if ..addPunctuation(.subElement,"=")  {
			if ..CosDirectiveSqlcompile38Sub(.subElement,.addedElement)  {
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

/// 'display' | 'logical' | 'odbc' | 'runtime' | 'text' | 'FDBMS'
/// summary values:DISPLAY,LOGICAL,ODBC,RUNTIME,TEXT,FDBMS
/// summary=K|K|K|K|K|K
Method CosDirectiveSqlcompile38Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K|K|K|K|K|K
	if '(..isKeywordInList($lb("DISPLAY","LOGICAL","ODBC","RUNTIME","TEXT","FDBMS"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"DISPLAY")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"LOGICAL")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"ODBC")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"RUNTIME")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"TEXT")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"FDBMS")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  'mode' '=' ('deferred')
/// summary values:MODE
/// summary=K&P&(K)
Method CosDirectiveSqlcompile39Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&P&(K)
	if '(..isKeyword("MODE",.value)) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"MODE")  {
		if ..addPunctuation(.subElement,"=")  {
			if ..CosDirectiveSqlcompile40Sub(.subElement,.addedElement)  {
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

/// 'deferred'
/// summary values:DEFERRED
/// summary=K
Method CosDirectiveSqlcompile40Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K
	if '(..isKeyword("DEFERRED",.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"DEFERRED")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  cos_directive_undef ::= 'undef' macro_identifier
/// summary values:UNDEF
/// summary=K&C
Method CosDirectiveUndef(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C
	if '(..isKeyword("UNDEF",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"UNDEF")  {
		if ..MacroIdentifier(.subElement,.addedElement)  {
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

///  cos_json ::= cos_json_object | cos_json_array | cos_json_prim
/// summary=C|C|C
Method CosJson(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CosJsonObject(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CosJsonArray(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CosJsonPrim(.subElement,.addedElement)  {
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

///  cos_json_array ::= '[' [ cos_json (',' cos_json)* ] ']'
/// summary values:[
/// summary=P&[C&(?4punctuation:4?)*]&P
Method CosJsonArray(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&[C&(?4punctuation:4?)*]&P
	; first rule summary P
	if '(..isStringSingle("[",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"[")  {
		if ..CosJsonArray395OptGrp(.subElement,.addedElement)  {
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

/// 
/// summary=C&(?4punctuation:4?)*
Method CosJsonArray395OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&(?4punctuation:4?)*
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CosJson(.subElement,.addedElement)  {
		if ..CosJsonArray396RepZero(.subElement,.addedElement)  {
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

///  (',' cos_json)*
Method CosJsonArray396RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..CosJsonArray397Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// ',' cos_json
/// summary values:,
/// summary=P&C
Method CosJsonArray397Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..CosJson(.subElement,.addedElement)  {
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

///  cos_json_object ::= '{' [ cos_json_pair ( ',' cos_json_pair )*] '}'
/// summary values:{
/// summary=P&[C&(?4punctuation:4?)*]&P
Method CosJsonObject(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&[C&(?4punctuation:4?)*]&P
	; first rule summary P
	if '(..isStringSingle("{",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"{")  {
		if ..CosJsonObject391OptGrp(.subElement,.addedElement)  {
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
Method CosJsonObject391OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&(?4punctuation:4?)*
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CosJsonPair(.subElement,.addedElement)  {
		if ..CosJsonObject392RepZero(.subElement,.addedElement)  {
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

///  ( ',' cos_json_pair )*
Method CosJsonObject392RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..CosJsonObject393Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' cos_json_pair
/// summary values:,
/// summary=P&C
Method CosJsonObject393Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..CosJsonPair(.subElement,.addedElement)  {
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

///  cos_json_pair ::= json_string ':' cos_json
/// summary=C&P&C
Method CosJsonPair(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&P&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..JsonString(.subElement,.addedElement)  {
		if ..addPunctuation(.subElement,":")  {
			if ..CosJson(.subElement,.addedElement)  {
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

///  cos_json_prim ::= number | json_string | 'true' | 'false' | 'null' | ( '(' expression ')' )
/// summary=C|C|K|K|K|(P&C&P)
Method CosJsonPrim(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C|K|K|K|(P&C&P)
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
		set done=1 ; or
	} elseif ..CosJsonPrim394Sub(.subElement,.addedElement)  {
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

///  '(' expression ')'
/// summary values:(
/// summary=P&C&P
Method CosJsonPrim394Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if ..Expression(.subElement,.addedElement)  {
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

///  dim_expression ::= expression
/// summary=C
Method DimExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(.subElement,.addedElement)  {
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

///  do_command ::= ('do' | 'd') ( do_while | do_label )
/// summary values:DO,D
/// summary=(K|K)&(C|C)
Method DoCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&(C|C)
	if '(..isKeywordInList($lb("DO","D"),.value)) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..DoCommand130Sub(.subElement,.addedElement)  {
		if ..DoCommand131Sub(.subElement,.addedElement)  {
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

/// 'do' | 'd'
/// summary values:DO,D
/// summary=K|K
Method DoCommand130Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K|K
	if '(..isKeywordInList($lb("DO","D"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"DO")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"D")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  do_while | do_label
/// summary=C|C
Method DoCommand131Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..DoWhile(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..DoLabel(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  do_item ::= object_variable | this_object | simple_indirection | ( label_reference [ function_parameter_list ] ) | system_object | macrocall | intrinsicfncall | classexpr | ( '(' expression ')' [ object_chain ])
/// summary=C|C|C|(C&[C])|C|C|C|C|(P&C&P&[C])
Method DoItem(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C|C|(C&[C])|C|C|C|C|(P&C&P&[C])
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ObjectVariable(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ThisObject(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SimpleIndirection(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..DoItem135Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SystemObject(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Macrocall(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Intrinsicfncall(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Classexpr(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..DoItem136Sub(.subElement,.addedElement)  {
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

///  label_reference [ function_parameter_list ]
/// summary=C&[C]
Method DoItem135Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&[C]
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LabelReference(.subElement,.addedElement)  {
		if $S(..FunctionParameterList(.subElement,.addedElement) :1,1:1) {
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

///  '(' expression ')' [ object_chain ]
/// summary values:(
/// summary=P&C&P&[C]
Method DoItem136Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&P&[C]
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if ..Expression(.subElement,.addedElement)  {
			if ..addPunctuation(.subElement,")")  {
				if $S(..ObjectChain(.subElement,.addedElement) :1,1:1) {
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

///  do_item_list ::= do_item [ post_conditional] ( ',' do_item [ post_conditional] )*
/// summary=C&[C]&(?4punctuation:4?)*
Method DoItemList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&[C]&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..DoItem(.subElement,.addedElement)  {
		if $S(..PostConditional(.subElement,.addedElement) :1,1:1) {
			if ..DoItemList133RepZero(.subElement,.addedElement)  {
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

///  ( ',' do_item [ post_conditional] )*
Method DoItemList133RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..DoItemList134Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' do_item [ post_conditional]
/// summary values:,
/// summary=P&C&[C]
Method DoItemList134Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&[C]
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..DoItem(.subElement,.addedElement)  {
			if $S(..PostConditional(.subElement,.addedElement) :1,1:1) {
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

///  do_label ::= [ post_conditional ] ( naked | do_item_list)
/// summary=[C]&(C|C)
Method DoLabel(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary [C]&(C|C)
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..PostConditional(.subElement,.addedElement) :1,1:1) {
		if ..DoLabel132Sub(.subElement,.addedElement)  {
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

///  naked | do_item_list
/// summary=C|C
Method DoLabel132Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..Naked(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..DoItemList(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  do_while ::= '{' [ cos_code_block ] '}' 'while' expression_list
/// summary values:{
/// summary=P&[C]&P&K&C
Method DoWhile(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&[C]&P&K&C
	; first rule summary P
	if '(..isStringSingle("{",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"{")  {
		if $S(..CosCodeBlock(.subElement,.addedElement) :1,1:1) {
			if ..addPunctuation(.subElement,"}")  {
				if ..addKeyword(.subElement,"WHILE")  {
					if ..ExpressionList(.subElement,.addedElement)  {
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

///  dyadicop ::= "+" | "-" | "\\" | "/" | "\" | ">=" | ">" | "'>=" | "'>" | "<=" | "<" | "'<=" | "'<" | "=" | "'=" | "**" | "*" | "&&" | "']]" | "]]" | "']" | "]" | "'[" | "[" | "!" | "||" | "_" | hash_op | amp_op
/// summary=P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|C|C
Method Dyadicop(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"+")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"-")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"\\")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"/")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"\")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,">=")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,">")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"'>=")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"'>")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"<=")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"<")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"'<=")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"'<")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"=")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"'=")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"**")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"*")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"&&")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"']]")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"]]")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"']")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"]")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"'[")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"[")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"!")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"||")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"_")  {
		set done=1 ; or
	} elseif ..HashOp(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AmpOp(.subElement,.addedElement)  {
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

///  else_block ::= 'else' ( ( '{' [ cos_code_block ] '}' ) | command_list_eol )
/// summary values:ELSE
/// summary=K&((P&[C]&P)|C)
Method ElseBlock(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&((P&[C]&P)|C)
	if '(..isKeyword("ELSE",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"ELSE")  {
		if ..ElseBlock162Sub(.subElement,.addedElement)  {
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

///  ( '{' [ cos_code_block ] '}' ) | command_list_eol
/// summary=(P&[C]&P)|C
Method ElseBlock162Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary (P&[C]&P)|C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ElseBlock163Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CommandListEol(.subElement,.addedElement)  {
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

///  '{' [ cos_code_block ] '}'
/// summary values:{
/// summary=P&[C]&P
Method ElseBlock163Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&[C]&P
	; first rule summary P
	if '(..isStringSingle("{",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"{")  {
		if $S(..CosCodeBlock(.subElement,.addedElement) :1,1:1) {
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

///  else_command ::= ('else' | 'e') naked
/// summary values:ELSE,E
/// summary=(K|K)&C
Method ElseCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&C
	if '(..isKeywordInList($lb("ELSE","E"),.value)) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ElseCommand164Sub(.subElement,.addedElement)  {
		if ..Naked(.subElement,.addedElement)  {
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

/// 'else' | 'e'
/// summary values:ELSE,E
/// summary=K|K
Method ElseCommand164Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K|K
	if '(..isKeywordInList($lb("ELSE","E"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"ELSE")  {
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

///  elseif_block ::= 'elseif' expression_list ( ( '{' [ cos_code_block ] '}' ) | command_list_eol )
/// summary values:ELSEIF
/// summary=K&C&((P&[C]&P)|C)
Method ElseifBlock(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C&((P&[C]&P)|C)
	if '(..isKeyword("ELSEIF",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"ELSEIF")  {
		if ..ExpressionList(.subElement,.addedElement)  {
			if ..ElseifBlock160Sub(.subElement,.addedElement)  {
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

///  ( '{' [ cos_code_block ] '}' ) | command_list_eol
/// summary=(P&[C]&P)|C
Method ElseifBlock160Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary (P&[C]&P)|C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ElseifBlock161Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CommandListEol(.subElement,.addedElement)  {
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

///  '{' [ cos_code_block ] '}'
/// summary values:{
/// summary=P&[C]&P
Method ElseifBlock161Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&[C]&P
	; first rule summary P
	if '(..isStringSingle("{",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"{")  {
		if $S(..CosCodeBlock(.subElement,.addedElement) :1,1:1) {
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

///  elseif_block_list ::= elseif_block ( elseif_block )*
/// summary=C&(?4punctuation:4?)*
Method ElseifBlockList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ElseifBlock(.subElement,.addedElement)  {
		if ..ElseifBlockList158RepZero(.subElement,.addedElement)  {
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

///  ( elseif_block )*
Method ElseifBlockList158RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ElseifBlockList159Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  elseif_block
/// summary=C
Method ElseifBlockList159Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C
	set subElement=ParentElement
	set done=0 ; method start
	if ..ElseifBlock(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  empty_parameter ::= 'SPECIAL'
/// summary values:SPECIAL
/// summary=K
Method EmptyParameter(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeyword("SPECIAL",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"SPECIAL")  {
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

///  expression ::= factor ( pattern_match | (dyadicop factor ))*
/// summary=C&(?4punctuation:4?)*
Method Expression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Factor(.subElement,.addedElement)  {
		if ..Expression49RepZero(.subElement,.addedElement)  {
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

///  ( pattern_match | (dyadicop factor ))*
Method Expression49RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..Expression50Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  pattern_match | (dyadicop factor )
/// summary=C|(C&C)
Method Expression50Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|(C&C)
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..PatternMatch(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Expression51Sub(.subElement,.addedElement)  {
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

/// dyadicop factor
/// summary=C&C
Method Expression51Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Dyadicop(.subElement,.addedElement)  {
		if ..Factor(.subElement,.addedElement)  {
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

///  expression_function_call ::= '##expression' function_parameter_list
/// summary values:##EXPRESSION
/// summary=P&C
Method ExpressionFunctionCall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle("##EXPRESSION",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"##expression")  {
		if ..FunctionParameterList(.subElement,.addedElement)  {
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

///  expression_list ::= expression ( ',' expression )*
/// summary=C&(?4punctuation:4?)*
Method ExpressionList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(.subElement,.addedElement)  {
		if ..ExpressionList117RepZero(.subElement,.addedElement)  {
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

///  ( ',' expression )*
Method ExpressionList117RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ExpressionList118Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' expression
/// summary values:,
/// summary=P&C
Method ExpressionList118Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..Expression(.subElement,.addedElement)  {
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

///  extract_function_call ::= ('extract' | 'e') open_bracket expression [ ',' star_parameter [ ',' star_parameter ] ] close_bracket
/// summary values:EXTRACT,E
/// summary=(K|K)&C&C&[P&C&[P&C]]&C
Method ExtractFunctionCall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&C&C&[P&C&[P&C]]&C
	if '(..isKeywordInList($lb("EXTRACT","E"),.value)) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ExtractFunctionCall326Sub(.subElement,.addedElement)  {
		if ..OpenBracket(.subElement,.addedElement)  {
			if ..Expression(.subElement,.addedElement)  {
				if ..ExtractFunctionCall327OptGrp(.subElement,.addedElement)  {
					if ..CloseBracket(.subElement,.addedElement)  {
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

/// 'extract' | 'e'
/// summary values:EXTRACT,E
/// summary=K|K
Method ExtractFunctionCall326Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K|K
	if '(..isKeywordInList($lb("EXTRACT","E"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"EXTRACT")  {
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

/// 
/// summary values:,
/// summary=P&C&[P&C]
Method ExtractFunctionCall327OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&[P&C]
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 1 /* not found is OK */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..StarParameter(.subElement,.addedElement)  {
			if ..ExtractFunctionCall328OptGrp(.subElement,.addedElement)  {
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
/// summary values:,
/// summary=P&C
Method ExtractFunctionCall328OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 1 /* not found is OK */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..StarParameter(.subElement,.addedElement)  {
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

///  extract_function_call_set ::= ('extract' | 'e') open_bracket set_value_expression [ ',' star_parameter [ ',' star_parameter ] ] close_bracket
/// summary values:EXTRACT,E
/// summary=(K|K)&C&C&[P&C&[P&C]]&C
Method ExtractFunctionCallSet(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&C&C&[P&C&[P&C]]&C
	if '(..isKeywordInList($lb("EXTRACT","E"),.value)) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ExtractFunctionCallSet329Sub(.subElement,.addedElement)  {
		if ..OpenBracket(.subElement,.addedElement)  {
			if ..SetValueExpression(.subElement,.addedElement)  {
				if ..ExtractFunctionCallSet330OptGrp(.subElement,.addedElement)  {
					if ..CloseBracket(.subElement,.addedElement)  {
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

/// 'extract' | 'e'
/// summary values:EXTRACT,E
/// summary=K|K
Method ExtractFunctionCallSet329Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K|K
	if '(..isKeywordInList($lb("EXTRACT","E"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"EXTRACT")  {
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

/// 
/// summary values:,
/// summary=P&C&[P&C]
Method ExtractFunctionCallSet330OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&[P&C]
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 1 /* not found is OK */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..StarParameter(.subElement,.addedElement)  {
			if ..ExtractFunctionCallSet331OptGrp(.subElement,.addedElement)  {
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
/// summary values:,
/// summary=P&C
Method ExtractFunctionCallSet331OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 1 /* not found is OK */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..StarParameter(.subElement,.addedElement)  {
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

///  extrinsicfncall ::= '$$' label_reference [extrinsicfncall_parameter_list ]
/// summary values:$$
/// summary=P&C&[C]
Method Extrinsicfncall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&[C]
	; first rule summary P
	if '(..isStringSingle("$$",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"$$")  {
		if ..LabelReference(.subElement,.addedElement)  {
			if $S(..ExtrinsicfncallParameterList(.subElement,.addedElement) :1,1:1) {
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

///  extrinsicfncall_parameter ::= ('.' (this_object_direct_property | simple_indirection | variable )) | expression
/// summary=(P&(C|C|C))|C
Method ExtrinsicfncallParameter(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (P&(C|C|C))|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ExtrinsicfncallParameter72Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Expression(.subElement,.addedElement)  {
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

/// '.' (this_object_direct_property | simple_indirection | variable )
/// summary values:.
/// summary=P&(C|C|C)
Method ExtrinsicfncallParameter72Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&(C|C|C)
	; first rule summary P
	if '(..isStringSingle(".",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,".")  {
		if ..ExtrinsicfncallParameter73Sub(.subElement,.addedElement)  {
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

/// this_object_direct_property | simple_indirection | variable
/// summary=C|C|C
Method ExtrinsicfncallParameter73Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..ThisObjectDirectProperty(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SimpleIndirection(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Variable(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  extrinsicfncall_parameter_list ::= open_bracket [ [extrinsicfncall_parameter] ( ',' [extrinsicfncall_parameter] )* ] ['...'] close_bracket
/// summary=C&[[C]&(?4punctuation:4?)*]&[P]&C
Method ExtrinsicfncallParameterList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&[[C]&(?4punctuation:4?)*]&[P]&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OpenBracket(.subElement,.addedElement)  {
		if ..ExtrinsicfncallParameterList69OptGrp(.subElement,.addedElement)  {
			if $S(..addPunctuation(.subElement,"...") :1,1:1) {
				if ..CloseBracket(.subElement,.addedElement)  {
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
/// summary=[C]&(?4punctuation:4?)*
Method ExtrinsicfncallParameterList69OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary [C]&(?4punctuation:4?)*
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..ExtrinsicfncallParameter(.subElement,.addedElement) :1,1:1) {
		if ..ExtrinsicfncallParameterList70RepZero(.subElement,.addedElement)  {
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

///  ( ',' [extrinsicfncall_parameter] )*
Method ExtrinsicfncallParameterList70RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ExtrinsicfncallParameterList71Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' [extrinsicfncall_parameter]
/// summary values:,
/// summary=P&[C]
Method ExtrinsicfncallParameterList71Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&[C]
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if $S(..ExtrinsicfncallParameter(.subElement,.addedElement) :1,1:1) {
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

///  factor ::= ( monadicop )* primary
/// summary=(?4punctuation:4?)*&C
Method Factor(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (?4punctuation:4?)*&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Factor52RepZero(.subElement,.addedElement)  {
		if ..Primary(.subElement,.addedElement)  {
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

///  ( monadicop )*
Method Factor52RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..Factor53Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  monadicop
/// summary=C
Method Factor53Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C
	set subElement=ParentElement
	set done=0 ; method start
	if ..Monadicop(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  for_command ::= ('for' | 'f') [ for_parameters ] for_loop_statement
/// summary values:FOR,F
/// summary=(K|K)&[C]&C
Method ForCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&[C]&C
	if '(..isKeywordInList($lb("FOR","F"),.value)) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ForCommand137Sub(.subElement,.addedElement)  {
		if $S(..ForParameters(.subElement,.addedElement) :1,1:1) {
			if ..ForLoopStatement(.subElement,.addedElement)  {
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

/// 'for' | 'f'
/// summary values:FOR,F
/// summary=K|K
Method ForCommand137Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K|K
	if '(..isKeywordInList($lb("FOR","F"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"FOR")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"F")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  for_end_loop_value ::= expression
/// summary=C
Method ForEndLoopValue(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(.subElement,.addedElement)  {
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

///  for_increment_value ::= expression
/// summary=C
Method ForIncrementValue(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(.subElement,.addedElement)  {
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

///  for_loop_specifier ::= for_start_value [ ':' for_increment_value [ ':' for_end_loop_value ] ]
/// summary=C&[P&C&[P&C]]
Method ForLoopSpecifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&[P&C&[P&C]]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ForStartValue(.subElement,.addedElement)  {
		if ..ForLoopSpecifier144OptGrp(.subElement,.addedElement)  {
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
/// summary values::
/// summary=P&C&[P&C]
Method ForLoopSpecifier144OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&[P&C]
	; first rule summary P
	if '(..isStringSingle(":",.value)) { quit 1 /* not found is OK */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,":")  {
		if ..ForIncrementValue(.subElement,.addedElement)  {
			if ..ForLoopSpecifier145OptGrp(.subElement,.addedElement)  {
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
/// summary values::
/// summary=P&C
Method ForLoopSpecifier145OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(":",.value)) { quit 1 /* not found is OK */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,":")  {
		if ..ForEndLoopValue(.subElement,.addedElement)  {
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

///  for_loop_specifier_list ::= for_loop_specifier ( ',' for_loop_specifier )*
/// summary=C&(?4punctuation:4?)*
Method ForLoopSpecifierList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ForLoopSpecifier(.subElement,.addedElement)  {
		if ..ForLoopSpecifierList142RepZero(.subElement,.addedElement)  {
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

///  ( ',' for_loop_specifier )*
Method ForLoopSpecifierList142RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ForLoopSpecifierList143Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' for_loop_specifier
/// summary values:,
/// summary=P&C
Method ForLoopSpecifierList143Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..ForLoopSpecifier(.subElement,.addedElement)  {
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

///  for_loop_statement ::= ( '{' [ cos_command_or_macro ] [ cos_code_block ] '}' ) | (naked | command_list_eol )
/// summary=(P&[C]&[C]&P)|(C|C)
Method ForLoopStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (P&[C]&[C]&P)|(C|C)
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ForLoopStatement138Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ForLoopStatement139Sub(.subElement,.addedElement)  {
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

///  '{' [ cos_command_or_macro ] [ cos_code_block ] '}'
/// summary values:{
/// summary=P&[C]&[C]&P
Method ForLoopStatement138Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&[C]&[C]&P
	; first rule summary P
	if '(..isStringSingle("{",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"{")  {
		if $S(..CosCommandOrMacro(.subElement,.addedElement) :1,1:1) {
			if $S(..CosCodeBlock(.subElement,.addedElement) :1,1:1) {
				if ..addPunctuation(.subElement,"}")  {
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

/// naked | command_list_eol
/// summary=C|C
Method ForLoopStatement139Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..Naked(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CommandListEol(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  for_parameter ::= lvalue_expression '=' for_loop_specifier_list
/// summary=C&P&C
Method ForParameter(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&P&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LvalueExpression(.subElement,.addedElement)  {
		if ..addPunctuation(.subElement,"=")  {
			if ..ForLoopSpecifierList(.subElement,.addedElement)  {
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

///  for_parameters ::= for_parameter ( ',' for_parameter )*
/// summary=C&(?4punctuation:4?)*
Method ForParameters(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ForParameter(.subElement,.addedElement)  {
		if ..ForParameters140RepZero(.subElement,.addedElement)  {
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

///  ( ',' for_parameter )*
Method ForParameters140RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ForParameters141Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' for_parameter
/// summary values:,
/// summary=P&C
Method ForParameters141Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..ForParameter(.subElement,.addedElement)  {
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

///  for_start_value ::= expression
/// summary=C
Method ForStartValue(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(.subElement,.addedElement)  {
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

///  function_parameter ::= ( '.' ( this_object_direct_property | simple_indirection | byref_variable )) | expression | empty_parameter
/// summary=(P&(C|C|C))|C|C
Method FunctionParameter(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (P&(C|C|C))|C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..FunctionParameter83Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Expression(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..EmptyParameter(.subElement,.addedElement)  {
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

///  '.' ( this_object_direct_property | simple_indirection | byref_variable )
/// summary values:.
/// summary=P&(C|C|C)
Method FunctionParameter83Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&(C|C|C)
	; first rule summary P
	if '(..isStringSingle(".",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,".")  {
		if ..FunctionParameter84Sub(.subElement,.addedElement)  {
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

///  this_object_direct_property | simple_indirection | byref_variable
/// summary=C|C|C
Method FunctionParameter84Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..ThisObjectDirectProperty(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SimpleIndirection(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ByrefVariable(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  function_parameter_list ::= open_bracket [ function_parameter? ( ',' function_parameter? )* ] ['...'] close_bracket
/// summary=C&[?4OptionalSingle4?&(?4punctuation:4?)*]&[P]&C
Method FunctionParameterList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&[?4OptionalSingle4?&(?4punctuation:4?)*]&[P]&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OpenBracket(.subElement,.addedElement)  {
		if ..FunctionParameterList77OptGrp(.subElement,.addedElement)  {
			if $S(..addPunctuation(.subElement,"...") :1,1:1) {
				if ..CloseBracket(.subElement,.addedElement)  {
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
/// summary=?4OptionalSingle4?&(?4punctuation:4?)*
Method FunctionParameterList77OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4OptionalSingle4?&(?4punctuation:4?)*
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $s(..FunctionParameter(.subElement,.addedElement) :1,1:1)  {
		if ..FunctionParameterList78RepZero(.subElement,.addedElement)  {
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

///  ( ',' function_parameter? )*
Method FunctionParameterList78RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..FunctionParameterList79Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' function_parameter?
/// summary values:,
/// summary=P&?4OptionalSingle4?
Method FunctionParameterList79Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&?4OptionalSingle4?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if $s(..FunctionParameter(.subElement,.addedElement) :1,1:1)  {
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

///  function_parameter_list_items ::= [ function_parameter? ( ',' function_parameter? )* ] ['...']
/// summary=[?4OptionalSingle4?&(?4punctuation:4?)*]&[P]
Method FunctionParameterListItems(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary [?4OptionalSingle4?&(?4punctuation:4?)*]&[P]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..FunctionParameterListItems80OptGrp(.subElement,.addedElement)  {
		if $S(..addPunctuation(.subElement,"...") :1,1:1) {
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
/// summary=?4OptionalSingle4?&(?4punctuation:4?)*
Method FunctionParameterListItems80OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4OptionalSingle4?&(?4punctuation:4?)*
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $s(..FunctionParameter(.subElement,.addedElement) :1,1:1)  {
		if ..FunctionParameterListItems81RepZero(.subElement,.addedElement)  {
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

///  ( ',' function_parameter? )*
Method FunctionParameterListItems81RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..FunctionParameterListItems82Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' function_parameter?
/// summary values:,
/// summary=P&?4OptionalSingle4?
Method FunctionParameterListItems82Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&?4OptionalSingle4?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if $s(..FunctionParameter(.subElement,.addedElement) :1,1:1)  {
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

///  general_intrinsic ::= any_keyword function_parameter_list [ object_chain ]
/// summary=C&C&[C]
Method GeneralIntrinsic(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&C&[C]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..AnyKeyword(.subElement,.addedElement)  {
		if ..FunctionParameterList(.subElement,.addedElement)  {
			if $S(..ObjectChain(.subElement,.addedElement) :1,1:1) {
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

///  general_intrinsic_set ::= any_keyword function_parameter_list [ object_chain ]
/// summary=C&C&[C]
Method GeneralIntrinsicSet(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&C&[C]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..AnyKeyword(.subElement,.addedElement)  {
		if ..FunctionParameterList(.subElement,.addedElement)  {
			if $S(..ObjectChain(.subElement,.addedElement) :1,1:1) {
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

///  global_identifier ::= 'regexp:(\%|\$|[a-zA-Z])[a-zA-Z0-9\.]*'
/// summary=R
Method GlobalIdentifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary R
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..addRegex(.subElement,"(\%|\$|[a-zA-Z])[a-zA-Z0-9\.]*")  {
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

///  global_name ::= global_identifier
/// summary=C
Method GlobalName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..GlobalIdentifier(.subElement,.addedElement)  {
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

///  global_ref ::= global_ref_macro | global_ref_special | global_ref_naked | global_ref_full
/// summary=C|C|C|C
Method GlobalRef(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C|C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..GlobalRefMacro(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..GlobalRefSpecial(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..GlobalRefNaked(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..GlobalRefFull(.subElement,.addedElement)  {
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

///  global_ref_env ::= '|' [ expression ] '|'
/// summary values:|
/// summary=P&[C]&P
Method GlobalRefEnv(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&[C]&P
	; first rule summary P
	if '(..isStringSingle("|",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"|")  {
		if $S(..Expression(.subElement,.addedElement) :1,1:1) {
			if ..addPunctuation(.subElement,"|")  {
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

///  global_ref_env_two ::= '[' primary [ ',' primary ] ']'
/// summary values:[
/// summary=P&C&[P&C]&P
Method GlobalRefEnvTwo(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&[P&C]&P
	; first rule summary P
	if '(..isStringSingle("[",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"[")  {
		if ..Primary(.subElement,.addedElement)  {
			if ..GlobalRefEnvTwo99OptGrp(.subElement,.addedElement)  {
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

/// 
/// summary values:,
/// summary=P&C
Method GlobalRefEnvTwo99OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 1 /* not found is OK */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..Primary(.subElement,.addedElement)  {
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

///  global_ref_full ::= '^' [ global_ref_env | global_ref_env_two ] (macrocall | global_name ) [subscript_parameter_list]
/// summary values:^
/// summary=P&[C|C]&(C|C)&[C]
Method GlobalRefFull(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&[C|C]&(C|C)&[C]
	; first rule summary P
	if '(..isStringSingle("^",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"^")  {
		if ..GlobalRefFull95OptGrp(.subElement,.addedElement)  {
			if ..GlobalRefFull96Sub(.subElement,.addedElement)  {
				if $S(..SubscriptParameterList(.subElement,.addedElement) :1,1:1) {
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
/// summary=C|C
Method GlobalRefFull95OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..GlobalRefEnv(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..GlobalRefEnvTwo(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=1 /* failure rollsback but returns OK */
	}
	quit ok
}

/// macrocall | global_name
/// summary=C|C
Method GlobalRefFull96Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..Macrocall(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..GlobalName(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  global_ref_macro ::= '^' macrocall [subscript_parameter_list]
/// summary values:^
/// summary=P&C&[C]
Method GlobalRefMacro(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&[C]
	; first rule summary P
	if '(..isStringSingle("^",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"^")  {
		if ..Macrocall(.subElement,.addedElement)  {
			if $S(..SubscriptParameterList(.subElement,.addedElement) :1,1:1) {
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

///  global_ref_naked ::= '^' subscript_parameter_list
/// summary values:^
/// summary=P&C
Method GlobalRefNaked(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle("^",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"^")  {
		if ..SubscriptParameterList(.subElement,.addedElement)  {
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

///  global_ref_set ::= global_ref_naked | global_ref_full
/// summary=C|C
Method GlobalRefSet(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..GlobalRefNaked(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..GlobalRefFull(.subElement,.addedElement)  {
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

///  global_ref_special ::= '^$' [ global_ref_env | global_ref_env_two ] (macrocall | global_name ) [subscript_parameter_list]
/// summary values:^$
/// summary=P&[C|C]&(C|C)&[C]
Method GlobalRefSpecial(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&[C|C]&(C|C)&[C]
	; first rule summary P
	if '(..isStringSingle("^$",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"^$")  {
		if ..GlobalRefSpecial97OptGrp(.subElement,.addedElement)  {
			if ..GlobalRefSpecial98Sub(.subElement,.addedElement)  {
				if $S(..SubscriptParameterList(.subElement,.addedElement) :1,1:1) {
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
/// summary=C|C
Method GlobalRefSpecial97OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..GlobalRefEnv(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..GlobalRefEnvTwo(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=1 /* failure rollsback but returns OK */
	}
	quit ok
}

/// macrocall | global_name
/// summary=C|C
Method GlobalRefSpecial98Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..Macrocall(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..GlobalName(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  goto_case_clause ::= goto_case_clause_case ':' goto_case_clause_value
/// summary=C&P&C
Method GotoCaseClause(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&P&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..GotoCaseClauseCase(.subElement,.addedElement)  {
		if ..addPunctuation(.subElement,":")  {
			if ..GotoCaseClauseValue(.subElement,.addedElement)  {
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

///  goto_case_clause_case ::= expression
/// summary=C
Method GotoCaseClauseCase(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(.subElement,.addedElement)  {
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

///  goto_case_clause_default ::= ',' ':' label_reference
/// summary values:,
/// summary=P&P&C
Method GotoCaseClauseDefault(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..addPunctuation(.subElement,":")  {
			if ..LabelReference(.subElement,.addedElement)  {
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

///  goto_case_clause_value ::= label_reference
/// summary=C
Method GotoCaseClauseValue(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LabelReference(.subElement,.addedElement)  {
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

///  goto_case_clauses ::= (( ',' goto_case_clause ))*
/// summary=(?4punctuation:4?)*
Method GotoCaseClauses(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..GotoCaseClauses323RepZero(.subElement,.addedElement)  {
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

///  (( ',' goto_case_clause ))*
Method GotoCaseClauses323RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..GotoCaseClauses324Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// ( ',' goto_case_clause )
/// summary=(P&C)
Method GotoCaseClauses324Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary (P&C)
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..GotoCaseClauses325Sub(.subElement,.addedElement)  {
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

///  ',' goto_case_clause
/// summary values:,
/// summary=P&C
Method GotoCaseClauses325Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..GotoCaseClause(.subElement,.addedElement)  {
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

///  goto_case_function_call ::= '$case' open_bracket expression [ goto_case_clauses ] [ goto_case_clause_default ] close_bracket
/// summary values:$CASE
/// summary=P&C&C&[C]&[C]&C
Method GotoCaseFunctionCall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&C&[C]&[C]&C
	; first rule summary P
	if '(..isStringSingle("$CASE",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"$case")  {
		if ..OpenBracket(.subElement,.addedElement)  {
			if ..Expression(.subElement,.addedElement)  {
				if $S(..GotoCaseClauses(.subElement,.addedElement) :1,1:1) {
					if $S(..GotoCaseClauseDefault(.subElement,.addedElement) :1,1:1) {
						if ..CloseBracket(.subElement,.addedElement)  {
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

///  goto_command ::= ('goto' | 'g') [ post_conditional ] goto_dest_list
/// summary values:GOTO,G
/// summary=(K|K)&[C]&C
Method GotoCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&[C]&C
	if '(..isKeywordInList($lb("GOTO","G"),.value)) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..GotoCommand146Sub(.subElement,.addedElement)  {
		if $S(..PostConditional(.subElement,.addedElement) :1,1:1) {
			if ..GotoDestList(.subElement,.addedElement)  {
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

/// 'goto' | 'g'
/// summary values:GOTO,G
/// summary=K|K
Method GotoCommand146Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K|K
	if '(..isKeywordInList($lb("GOTO","G"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"GOTO")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"G")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  goto_dest ::= goto_case_function_call | ( label_reference [ post_conditional ] )
/// summary=C|(C&[C])
Method GotoDest(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|(C&[C])
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..GotoCaseFunctionCall(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..GotoDest149Sub(.subElement,.addedElement)  {
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

///  label_reference [ post_conditional ]
/// summary=C&[C]
Method GotoDest149Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&[C]
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LabelReference(.subElement,.addedElement)  {
		if $S(..PostConditional(.subElement,.addedElement) :1,1:1) {
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

///  goto_dest_list ::= goto_dest ( ',' goto_dest )*
/// summary=C&(?4punctuation:4?)*
Method GotoDestList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..GotoDest(.subElement,.addedElement)  {
		if ..GotoDestList147RepZero(.subElement,.addedElement)  {
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

///  ( ',' goto_dest )*
Method GotoDestList147RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..GotoDestList148Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' goto_dest
/// summary values:,
/// summary=P&C
Method GotoDestList148Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..GotoDest(.subElement,.addedElement)  {
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

///  halt_command ::= ('halt' | 'h') [ post_conditional ] naked
/// summary values:HALT,H
/// summary=(K|K)&[C]&C
Method HaltCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&[C]&C
	if '(..isKeywordInList($lb("HALT","H"),.value)) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..HaltCommand150Sub(.subElement,.addedElement)  {
		if $S(..PostConditional(.subElement,.addedElement) :1,1:1) {
			if ..Naked(.subElement,.addedElement)  {
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

/// 'halt' | 'h'
/// summary values:HALT,H
/// summary=K|K
Method HaltCommand150Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K|K
	if '(..isKeywordInList($lb("HALT","H"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"HALT")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"H")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  hang_command ::= ('hang' | 'h') [ post_conditional ] hangtime
/// summary values:HANG,H
/// summary=(K|K)&[C]&C
Method HangCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&[C]&C
	if '(..isKeywordInList($lb("HANG","H"),.value)) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..HangCommand151Sub(.subElement,.addedElement)  {
		if $S(..PostConditional(.subElement,.addedElement) :1,1:1) {
			if ..Hangtime(.subElement,.addedElement)  {
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

/// 'hang' | 'h'
/// summary values:HANG,H
/// summary=K|K
Method HangCommand151Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K|K
	if '(..isKeywordInList($lb("HANG","H"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"HANG")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"H")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  hang_value ::= expression
/// summary=C
Method HangValue(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(.subElement,.addedElement)  {
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

///  hangtime ::= hang_value ( ',' hang_value )*
/// summary=C&(?4punctuation:4?)*
Method Hangtime(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..HangValue(.subElement,.addedElement)  {
		if ..Hangtime152RepZero(.subElement,.addedElement)  {
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

///  ( ',' hang_value )*
Method Hangtime152RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..Hangtime153Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' hang_value
/// summary values:,
/// summary=P&C
Method Hangtime153Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..HangValue(.subElement,.addedElement)  {
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

///  hash_op ::= '#'
/// summary values:#
/// summary=P
Method HashOp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("#",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"#")  {
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

///  html_body ::= 'NEED HTML BODY'
/// summary values:NEED HTML BODY
/// summary=P
Method HtmlBody(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("NEED HTML BODY",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"NEED HTML BODY")  {
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

///  html_command ::= '&html<' html_body '>'
/// summary values:&HTML<
/// summary=P&C&P
Method HtmlCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&P
	; first rule summary P
	if '(..isStringSingle("&HTML<",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"&html<")  {
		if ..HtmlBody(.subElement,.addedElement)  {
			if ..addPunctuation(.subElement,">")  {
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

///  identifier ::= 'regexp:(((\%[a-zA-Z0-9])|(\$[a-zA-Z])|[a-zA-Z])[a-zA-Z0-9\.]*)'
/// summary=R
Method Identifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary R
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..addRegex(.subElement,"(((\%[a-zA-Z0-9])|(\$[a-zA-Z])|[a-zA-Z])[a-zA-Z0-9\.]*)")  {
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

///  if_command ::= ('if' | 'i') ( naked | expression_list) ( naked | [then_block] ) [ elseif_block_list ] [ else_block ]
/// summary values:IF,I
/// summary=(K|K)&(C|C)&(C|[C])&[C]&[C]
Method IfCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&(C|C)&(C|[C])&[C]&[C]
	if '(..isKeywordInList($lb("IF","I"),.value)) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..IfCommand154Sub(.subElement,.addedElement)  {
		if ..IfCommand155Sub(.subElement,.addedElement)  {
			if ..IfCommand156Sub(.subElement,.addedElement)  {
				if $S(..ElseifBlockList(.subElement,.addedElement) :1,1:1) {
					if $S(..ElseBlock(.subElement,.addedElement) :1,1:1) {
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

/// 'if' | 'i'
/// summary values:IF,I
/// summary=K|K
Method IfCommand154Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K|K
	if '(..isKeywordInList($lb("IF","I"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"IF")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"I")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  naked | expression_list
/// summary=C|C
Method IfCommand155Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..Naked(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ExpressionList(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  naked | [then_block]
/// summary=C|[C]
Method IfCommand156Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|[C]
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Naked(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif $S(..ThenBlock(.subElement,.addedElement) :1,1:1) {
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

///  include_identifier ::= 'regexp:(\%|[a-zA-Z])[a-zA-Z0-9\.]*'
/// summary=R
Method IncludeIdentifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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

///  increment_function_call ::= ('increment' | 'i') '(' (variable_set | global_ref_set) [',' expression ] ')'
/// summary values:INCREMENT,I
/// summary=(K|K)&P&(C|C)&[P&C]&P
Method IncrementFunctionCall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&P&(C|C)&[P&C]&P
	if '(..isKeywordInList($lb("INCREMENT","I"),.value)) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..IncrementFunctionCall378Sub(.subElement,.addedElement)  {
		if ..addPunctuation(.subElement,"(")  {
			if ..IncrementFunctionCall379Sub(.subElement,.addedElement)  {
				if ..IncrementFunctionCall380OptGrp(.subElement,.addedElement)  {
					if ..addPunctuation(.subElement,")")  {
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

/// 'increment' | 'i'
/// summary values:INCREMENT,I
/// summary=K|K
Method IncrementFunctionCall378Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K|K
	if '(..isKeywordInList($lb("INCREMENT","I"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"INCREMENT")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"I")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

/// variable_set | global_ref_set
/// summary=C|C
Method IncrementFunctionCall379Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..VariableSet(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..GlobalRefSet(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

/// 
/// summary values:,
/// summary=P&C
Method IncrementFunctionCall380OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 1 /* not found is OK */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
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

///  Indirection ::= Subscript_Indirection | Simple_Indirection
/// summary=C|C
Method Indirection(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SubscriptIndirection(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SimpleIndirection(.subElement,.addedElement)  {
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

///  intrinsicfncall ::= '$' (special_intrinsic | general_intrinsic )
/// summary values:$
/// summary=P&(C|C)
Method Intrinsicfncall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&(C|C)
	; first rule summary P
	if '(..isStringSingle("$",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"$")  {
		if ..Intrinsicfncall74Sub(.subElement,.addedElement)  {
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

/// special_intrinsic | general_intrinsic
/// summary=C|C
Method Intrinsicfncall74Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..SpecialIntrinsic(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..GeneralIntrinsic(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  intrinsicfncall_parameter ::= expression
/// summary=C
Method IntrinsicfncallParameter(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(.subElement,.addedElement)  {
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

///  intrinsicfncall_parameter_list ::= open_bracket [expression] ( ',' [expression] )* close_bracket
/// summary=C&[C]&(?4punctuation:4?)*&C
Method IntrinsicfncallParameterList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&[C]&(?4punctuation:4?)*&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OpenBracket(.subElement,.addedElement)  {
		if $S(..Expression(.subElement,.addedElement) :1,1:1) {
			if ..IntrinsicfncallParameterList75RepZero(.subElement,.addedElement)  {
				if ..CloseBracket(.subElement,.addedElement)  {
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

///  ( ',' [expression] )*
Method IntrinsicfncallParameterList75RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..IntrinsicfncallParameterList76Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' [expression]
/// summary values:,
/// summary=P&[C]
Method IntrinsicfncallParameterList76Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&[C]
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if $S(..Expression(.subElement,.addedElement) :1,1:1) {
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

///  intrinsicfncall_set ::= '$' (special_intrinsic_set | general_intrinsic_set )
/// summary values:$
/// summary=P&(C|C)
Method IntrinsicfncallSet(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&(C|C)
	; first rule summary P
	if '(..isStringSingle("$",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"$")  {
		if ..IntrinsicfncallSet85Sub(.subElement,.addedElement)  {
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

/// special_intrinsic_set | general_intrinsic_set
/// summary=C|C
Method IntrinsicfncallSet85Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..SpecialIntrinsicSet(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..GeneralIntrinsicSet(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  job_argument ::= job_call [ job_process_parameters ] [ job_timeout_spec ]
/// summary=C&[C]&[C]
Method JobArgument(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&[C]&[C]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..JobCall(.subElement,.addedElement)  {
		if $S(..JobProcessParameters(.subElement,.addedElement) :1,1:1) {
			if $S(..JobTimeoutSpec(.subElement,.addedElement) :1,1:1) {
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

///  job_arguments ::= job_argument ( ',' job_argument )*
/// summary=C&(?4punctuation:4?)*
Method JobArguments(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..JobArgument(.subElement,.addedElement)  {
		if ..JobArguments166RepZero(.subElement,.addedElement)  {
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

///  ( ',' job_argument )*
Method JobArguments166RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..JobArguments167Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' job_argument
/// summary values:,
/// summary=P&C
Method JobArguments167Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..JobArgument(.subElement,.addedElement)  {
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

///  job_call ::= ( label_reference [ function_parameter_list ] ) | class_expression | this_object | ( '$' classmethod_function_call )
/// summary=(C&[C])|C|C|(P&C)
Method JobCall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (C&[C])|C|C|(P&C)
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..JobCall168Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ClassExpression(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ThisObject(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..JobCall169Sub(.subElement,.addedElement)  {
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

///  label_reference [ function_parameter_list ]
/// summary=C&[C]
Method JobCall168Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&[C]
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LabelReference(.subElement,.addedElement)  {
		if $S(..FunctionParameterList(.subElement,.addedElement) :1,1:1) {
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

///  '$' classmethod_function_call
/// summary values:$
/// summary=P&C
Method JobCall169Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle("$",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"$")  {
		if ..ClassmethodFunctionCall(.subElement,.addedElement)  {
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

///  job_command ::= ('job' | 'j') [ post_conditional ] job_arguments
/// summary values:JOB,J
/// summary=(K|K)&[C]&C
Method JobCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&[C]&C
	if '(..isKeywordInList($lb("JOB","J"),.value)) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..JobCommand165Sub(.subElement,.addedElement)  {
		if $S(..PostConditional(.subElement,.addedElement) :1,1:1) {
			if ..JobArguments(.subElement,.addedElement)  {
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

/// 'job' | 'j'
/// summary values:JOB,J
/// summary=K|K
Method JobCommand165Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K|K
	if '(..isKeywordInList($lb("JOB","J"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"JOB")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"J")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  job_nspace_param ::= [ expression ]
/// summary=[C]
Method JobNspaceParam(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary [C]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..Expression(.subElement,.addedElement) :1,1:1) {
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

///  job_os-directory ::= [ expression ]
/// summary=[C]
Method JobOsdirectory(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary [C]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..Expression(.subElement,.addedElement) :1,1:1) {
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

///  job_principal-input ::= [ expression ]
/// summary=[C]
Method JobPrincipalinput(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary [C]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..Expression(.subElement,.addedElement) :1,1:1) {
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

///  job_principal-output ::= [ expression ]
/// summary=[C]
Method JobPrincipaloutput(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary [C]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..Expression(.subElement,.addedElement) :1,1:1) {
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

///  job_priority ::= [ expression ]
/// summary=[C]
Method JobPriority(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary [C]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..Expression(.subElement,.addedElement) :1,1:1) {
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

///  job_process_parameters ::= ':' ( job_process_parameters_inbrackets | job_process_parameters_nobrackets )
/// summary values::
/// summary=P&(C|C)
Method JobProcessParameters(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&(C|C)
	; first rule summary P
	if '(..isStringSingle(":",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,":")  {
		if ..JobProcessParameters170Sub(.subElement,.addedElement)  {
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

///  job_process_parameters_inbrackets | job_process_parameters_nobrackets
/// summary=C|C
Method JobProcessParameters170Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..JobProcessParametersInbrackets(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..JobProcessParametersNobrackets(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  job_process_parameters_inbrackets ::= '(' ( job_nspace_param [ ':' [ job_switch_param] [ ':' [ job_principal-input] [ ':' [ job_principal-output] [ ':' [ job_priority] [ ':' [ job_os-directory] [ ':' [job_process-name] ] ] ] ] ] ] ) ')'
/// summary values:(
/// summary=P&(C&[P&[C]&[P&[C]&[P&[C]&[P&[C]&[P&[C]&[P&[C]]]]]]])&P
Method JobProcessParametersInbrackets(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&(C&[P&[C]&[P&[C]&[P&[C]&[P&[C]&[P&[C]&[P&[C]]]]]]])&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if ..JobProcessParametersInbrackets171Sub(.subElement,.addedElement)  {
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

///  job_nspace_param [ ':' [ job_switch_param] [ ':' [ job_principal-input] [ ':' [ job_principal-output] [ ':' [ job_priority] [ ':' [ job_os-directory] [ ':' [job_process-name] ] ] ] ] ] ]
/// summary=C&[P&[C]&[P&[C]&[P&[C]&[P&[C]&[P&[C]&[P&[C]]]]]]]
Method JobProcessParametersInbrackets171Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&[P&[C]&[P&[C]&[P&[C]&[P&[C]&[P&[C]&[P&[C]]]]]]]
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..JobNspaceParam(.subElement,.addedElement)  {
		if ..JobProcessParametersInbrackets172OptGrp(.subElement,.addedElement)  {
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
/// summary values::
/// summary=P&[C]&[P&[C]&[P&[C]&[P&[C]&[P&[C]&[P&[C]]]]]]
Method JobProcessParametersInbrackets172OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&[C]&[P&[C]&[P&[C]&[P&[C]&[P&[C]&[P&[C]]]]]]
	; first rule summary P
	if '(..isStringSingle(":",.value)) { quit 1 /* not found is OK */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,":")  {
		if $S(..JobSwitchParam(.subElement,.addedElement) :1,1:1) {
			if ..JobProcessParametersInbrackets173OptGrp(.subElement,.addedElement)  {
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
/// summary values::
/// summary=P&[C]&[P&[C]&[P&[C]&[P&[C]&[P&[C]]]]]
Method JobProcessParametersInbrackets173OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&[C]&[P&[C]&[P&[C]&[P&[C]&[P&[C]]]]]
	; first rule summary P
	if '(..isStringSingle(":",.value)) { quit 1 /* not found is OK */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,":")  {
		if $S(..JobPrincipalinput(.subElement,.addedElement) :1,1:1) {
			if ..JobProcessParametersInbrackets174OptGrp(.subElement,.addedElement)  {
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
/// summary values::
/// summary=P&[C]&[P&[C]&[P&[C]&[P&[C]]]]
Method JobProcessParametersInbrackets174OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&[C]&[P&[C]&[P&[C]&[P&[C]]]]
	; first rule summary P
	if '(..isStringSingle(":",.value)) { quit 1 /* not found is OK */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,":")  {
		if $S(..JobPrincipaloutput(.subElement,.addedElement) :1,1:1) {
			if ..JobProcessParametersInbrackets175OptGrp(.subElement,.addedElement)  {
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
/// summary values::
/// summary=P&[C]&[P&[C]&[P&[C]]]
Method JobProcessParametersInbrackets175OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&[C]&[P&[C]&[P&[C]]]
	; first rule summary P
	if '(..isStringSingle(":",.value)) { quit 1 /* not found is OK */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,":")  {
		if $S(..JobPriority(.subElement,.addedElement) :1,1:1) {
			if ..JobProcessParametersInbrackets176OptGrp(.subElement,.addedElement)  {
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
/// summary values::
/// summary=P&[C]&[P&[C]]
Method JobProcessParametersInbrackets176OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&[C]&[P&[C]]
	; first rule summary P
	if '(..isStringSingle(":",.value)) { quit 1 /* not found is OK */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,":")  {
		if $S(..JobOsdirectory(.subElement,.addedElement) :1,1:1) {
			if ..JobProcessParametersInbrackets177OptGrp(.subElement,.addedElement)  {
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
/// summary values::
/// summary=P&[C]
Method JobProcessParametersInbrackets177OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&[C]
	; first rule summary P
	if '(..isStringSingle(":",.value)) { quit 1 /* not found is OK */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,":")  {
		if $S(..JobProcessname(.subElement,.addedElement) :1,1:1) {
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

///  job_process_parameters_nobrackets ::= [ job_nspace_param ]
/// summary=[C]
Method JobProcessParametersNobrackets(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary [C]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..JobNspaceParam(.subElement,.addedElement) :1,1:1) {
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

///  job_process-name ::= [ expression ]
/// summary=[C]
Method JobProcessname(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary [C]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..Expression(.subElement,.addedElement) :1,1:1) {
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

///  job_switch_param ::= [ expression ]
/// summary=[C]
Method JobSwitchParam(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary [C]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..Expression(.subElement,.addedElement) :1,1:1) {
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

///  job_timeout_spec ::= ':' expression
/// summary values::
/// summary=P&C
Method JobTimeoutSpec(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(":",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,":")  {
		if ..Expression(.subElement,.addedElement)  {
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

///  js_body ::= 'NEED JS BODY'
/// summary values:NEED JS BODY
/// summary=P
Method JsBody(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("NEED JS BODY",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"NEED JS BODY")  {
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

///  js_command ::= ('&javascript<' | '&js<') js_body '>'
/// summary=(P|P)&C&P
Method JsCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (P|P)&C&P
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..JsCommand317Sub(.subElement,.addedElement)  {
		if ..JsBody(.subElement,.addedElement)  {
			if ..addPunctuation(.subElement,">")  {
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

/// '&javascript<' | '&js<'
/// summary values:&JAVASCRIPT<,&JS<
/// summary=P|P
Method JsCommand317Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P|P
	if '(..isStringInList($lb("&JAVASCRIPT<","&JS<"),12,.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addPunctuation(.subElement,"&javascript<")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"&js<")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  json_string ::= 'NEEDS JSON STRING'
/// summary values:NEEDS JSON STRING
/// summary=P
Method JsonString(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("NEEDS JSON STRING",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"NEEDS JSON STRING")  {
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

///  kill_command ::= ( 'kill' | 'k') [ post_conditional ] ( naked | kill_parameter_list )
/// summary values:KILL,K
/// summary=(K|K)&[C]&(C|C)
Method KillCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&[C]&(C|C)
	if '(..isKeywordInList($lb("KILL","K"),.value)) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..KillCommand178Sub(.subElement,.addedElement)  {
		if $S(..PostConditional(.subElement,.addedElement) :1,1:1) {
			if ..KillCommand179Sub(.subElement,.addedElement)  {
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

///  'kill' | 'k'
/// summary values:KILL,K
/// summary=K|K
Method KillCommand178Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K|K
	if '(..isKeywordInList($lb("KILL","K"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"KILL")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"K")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  naked | kill_parameter_list
/// summary=C|C
Method KillCommand179Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..Naked(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..KillParameterList(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  kill_exclusive_list ::= '(' kill_item_list ')'
/// summary values:(
/// summary=P&C&P
Method KillExclusiveList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if ..KillItemList(.subElement,.addedElement)  {
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

///  kill_item ::= set_item_single
/// summary=C
Method KillItem(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SetItemSingle(.subElement,.addedElement)  {
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

///  kill_item_list ::= kill_item ( ',' kill_item )*
/// summary=C&(?4punctuation:4?)*
Method KillItemList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..KillItem(.subElement,.addedElement)  {
		if ..KillItemList182RepZero(.subElement,.addedElement)  {
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

///  ( ',' kill_item )*
Method KillItemList182RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..KillItemList183Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' kill_item
/// summary values:,
/// summary=P&C
Method KillItemList183Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..KillItem(.subElement,.addedElement)  {
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

///  kill_parameter ::= kill_exclusive_list | kill_item
/// summary=C|C
Method KillParameter(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..KillExclusiveList(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..KillItem(.subElement,.addedElement)  {
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

///  kill_parameter_list ::= kill_parameter ( ',' kill_parameter )*
/// summary=C&(?4punctuation:4?)*
Method KillParameterList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..KillParameter(.subElement,.addedElement)  {
		if ..KillParameterList180RepZero(.subElement,.addedElement)  {
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

///  ( ',' kill_parameter )*
Method KillParameterList180RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..KillParameterList181Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' kill_parameter
/// summary values:,
/// summary=P&C
Method KillParameterList181Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..KillParameter(.subElement,.addedElement)  {
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

///  label ::= 'regexp:[0-9A-Za-z]+'
/// summary=R
Method Label(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary R
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..addRegex(.subElement,"[0-9A-Za-z]+")  {
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

///  label_definition ::= label_identifier [ label_formal_specification ] [ label_public_vars ] [ label_scope ] [ '{' [cos_code_block] '}']
/// summary=C&[C]&[C]&[C]&[P&[C]&P]
Method LabelDefinition(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&[C]&[C]&[C]&[P&[C]&P]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LabelIdentifier(.subElement,.addedElement)  {
		if $S(..LabelFormalSpecification(.subElement,.addedElement) :1,1:1) {
			if $S(..LabelPublicVars(.subElement,.addedElement) :1,1:1) {
				if $S(..LabelScope(.subElement,.addedElement) :1,1:1) {
					if ..LabelDefinition13OptGrp(.subElement,.addedElement)  {
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
/// summary values:{
/// summary=P&[C]&P
Method LabelDefinition13OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&[C]&P
	; first rule summary P
	if '(..isStringSingle("{",.value)) { quit 1 /* not found is OK */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"{")  {
		if $S(..CosCodeBlock(.subElement,.addedElement) :1,1:1) {
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
		set ok=1 /* failure rollsback but returns OK */
	}
	quit ok
}

///  label_formal_specification ::= '(' [ label-formal-param-list ] ')'
/// summary values:(
/// summary=P&[C]&P
Method LabelFormalSpecification(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&[C]&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if $S(..Labelformalparamlist(.subElement,.addedElement) :1,1:1) {
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

///  label_identifier ::= [ '%' ] 'regexp:[0-9A-Za-z]+'
/// summary=[P]&R
Method LabelIdentifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary [P]&R
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..addPunctuation(.subElement,"%") :1,1:1) {
		if ..addRegex(.subElement,"[0-9A-Za-z]+")  {
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

///  label_public_vars ::= '[' label_public_vars_list? ']'
/// summary values:[
/// summary=P&?4OptionalSingle4?&P
Method LabelPublicVars(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?4OptionalSingle4?&P
	; first rule summary P
	if '(..isStringSingle("[",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"[")  {
		if $s(..LabelPublicVarsList(.subElement,.addedElement) :1,1:1)  {
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

///  label_public_vars_list ::= variable ( ',' variable )*
/// summary=C&(?4punctuation:4?)*
Method LabelPublicVarsList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Variable(.subElement,.addedElement)  {
		if ..LabelPublicVarsList16RepZero(.subElement,.addedElement)  {
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

///  ( ',' variable )*
Method LabelPublicVarsList16RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..LabelPublicVarsList17Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' variable
/// summary values:,
/// summary=P&C
Method LabelPublicVarsList17Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..Variable(.subElement,.addedElement)  {
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

///  label_reference ::= (( label_identifier | simple_indirection ) [ '^' [routine_env] ( routine_identifier | simple_indirection) ]) | ('^' [routine_env] (routine_identifier | simple_indirection) )
/// summary=((C|C)&[P&[C]&(C|C)])|(P&[C]&(C|C))
Method LabelReference(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ((C|C)&[P&[C]&(C|C)])|(P&[C]&(C|C))
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LabelReference18Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..LabelReference22Sub(.subElement,.addedElement)  {
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

/// ( label_identifier | simple_indirection ) [ '^' [routine_env] ( routine_identifier | simple_indirection) ]
/// summary=(C|C)&[P&[C]&(C|C)]
Method LabelReference18Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary (C|C)&[P&[C]&(C|C)]
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LabelReference19Sub(.subElement,.addedElement)  {
		if ..LabelReference20OptGrp(.subElement,.addedElement)  {
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

///  label_identifier | simple_indirection
/// summary=C|C
Method LabelReference19Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..LabelIdentifier(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SimpleIndirection(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

/// 
/// summary values:^
/// summary=P&[C]&(C|C)
Method LabelReference20OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&[C]&(C|C)
	; first rule summary P
	if '(..isStringSingle("^",.value)) { quit 1 /* not found is OK */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"^")  {
		if $S(..RoutineEnv(.subElement,.addedElement) :1,1:1) {
			if ..LabelReference21Sub(.subElement,.addedElement)  {
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

///  routine_identifier | simple_indirection
/// summary=C|C
Method LabelReference21Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..RoutineIdentifier(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SimpleIndirection(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

/// '^' [routine_env] (routine_identifier | simple_indirection)
/// summary values:^
/// summary=P&[C]&(C|C)
Method LabelReference22Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&[C]&(C|C)
	; first rule summary P
	if '(..isStringSingle("^",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"^")  {
		if $S(..RoutineEnv(.subElement,.addedElement) :1,1:1) {
			if ..LabelReference23Sub(.subElement,.addedElement)  {
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

/// routine_identifier | simple_indirection
/// summary=C|C
Method LabelReference23Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..RoutineIdentifier(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SimpleIndirection(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  label_scope ::= 'public' | 'private' | 'methodimpl'
/// summary values:PUBLIC,PRIVATE,METHODIMPL
/// summary=K|K|K
Method LabelScope(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K|K
	if '(..isKeywordInList($lb("PUBLIC","PRIVATE","METHODIMPL"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"PUBLIC")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"PRIVATE")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"METHODIMPL")  {
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

///  label-formal-param-list ::= label-one-formal-param ( ',' label-one-formal-param )* ['...']
/// summary=C&(?4punctuation:4?)*&[P]
Method Labelformalparamlist(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&(?4punctuation:4?)*&[P]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Labeloneformalparam(.subElement,.addedElement)  {
		if ..Labelformalparamlist14RepZero(.subElement,.addedElement)  {
			if $S(..addPunctuation(.subElement,"...") :1,1:1) {
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

///  ( ',' label-one-formal-param )*
Method Labelformalparamlist14RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..Labelformalparamlist15Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' label-one-formal-param
/// summary values:,
/// summary=P&C
Method Labelformalparamlist15Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..Labeloneformalparam(.subElement,.addedElement)  {
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

///  label-one-formal-param ::= [ '&' ] label-param-name [ label-param-default-value ]
/// summary=[P]&C&[C]
Method Labeloneformalparam(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary [P]&C&[C]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..addPunctuation(.subElement,"&") :1,1:1) {
		if ..Labelparamname(.subElement,.addedElement)  {
			if $S(..Labelparamdefaultvalue(.subElement,.addedElement) :1,1:1) {
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

///  label-param-default-value ::= '=' expression
/// summary values:=
/// summary=P&C
Method Labelparamdefaultvalue(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle("=",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"=")  {
		if ..Expression(.subElement,.addedElement)  {
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

///  label-param-name ::= variable_set
/// summary=C
Method Labelparamname(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..VariableSet(.subElement,.addedElement)  {
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

///  line_comment ::= ';' text_to_eol | '//' text_to_eol | '#;' text_to_eol | '##;' text_to_eol
/// summary values:;
/// summary=P&C|P&C|P&C|P&C
Method LineComment(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C|P&C|P&C|P&C
	; first rule summary P
	if '(..isStringSingle(";",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,";")  {
		if ..TextToEol(.subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..addPunctuation(.subElement,"//")  {
			if ..TextToEol(.subElement,.addedElement)  {
				set done=1 ; or
			} elseif ..addPunctuation(.subElement,"#;")  {
				if ..TextToEol(.subElement,.addedElement)  {
					set done=1 ; or
				} elseif ..addPunctuation(.subElement,"##;")  {
					if ..TextToEol(.subElement,.addedElement)  {
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

///  line_reference ::= [ label ] [ [ offset_sign ] offset ]
/// summary=[C]&[[C]&C]
Method LineReference(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary [C]&[[C]&C]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..Label(.subElement,.addedElement) :1,1:1) {
		if ..LineReference218OptGrp(.subElement,.addedElement)  {
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
/// summary=[C]&C
Method LineReference218OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary [C]&C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..OffsetSign(.subElement,.addedElement) :1,1:1) {
		if ..Offset(.subElement,.addedElement)  {
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

///  lineref1 ::= line_reference
/// summary=C
Method Lineref1(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LineReference(.subElement,.addedElement)  {
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

///  lineref2 ::= line_reference
/// summary=C
Method Lineref2(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LineReference(.subElement,.addedElement)  {
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

///  listbuild_function_call ::= ('listbuild' | 'lb') open_bracket expression (',' expression)* close_bracket
/// summary values:LISTBUILD,LB
/// summary=(K|K)&C&C&(?4punctuation:4?)*&C
Method ListbuildFunctionCall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&C&C&(?4punctuation:4?)*&C
	if '(..isKeywordInList($lb("LISTBUILD","LB"),.value)) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ListbuildFunctionCall338Sub(.subElement,.addedElement)  {
		if ..OpenBracket(.subElement,.addedElement)  {
			if ..Expression(.subElement,.addedElement)  {
				if ..ListbuildFunctionCall339RepZero(.subElement,.addedElement)  {
					if ..CloseBracket(.subElement,.addedElement)  {
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

/// 'listbuild' | 'lb'
/// summary values:LISTBUILD,LB
/// summary=K|K
Method ListbuildFunctionCall338Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K|K
	if '(..isKeywordInList($lb("LISTBUILD","LB"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"LISTBUILD")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"LB")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  (',' expression)*
Method ListbuildFunctionCall339RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ListbuildFunctionCall340Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// ',' expression
/// summary values:,
/// summary=P&C
Method ListbuildFunctionCall340Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..Expression(.subElement,.addedElement)  {
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

///  listbuild_function_call_set ::= ('listbuild' | 'lb') open_bracket set_value_expression (',' variable_set)* close_bracket
/// summary values:LISTBUILD,LB
/// summary=(K|K)&C&C&(?4punctuation:4?)*&C
Method ListbuildFunctionCallSet(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&C&C&(?4punctuation:4?)*&C
	if '(..isKeywordInList($lb("LISTBUILD","LB"),.value)) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ListbuildFunctionCallSet341Sub(.subElement,.addedElement)  {
		if ..OpenBracket(.subElement,.addedElement)  {
			if ..SetValueExpression(.subElement,.addedElement)  {
				if ..ListbuildFunctionCallSet342RepZero(.subElement,.addedElement)  {
					if ..CloseBracket(.subElement,.addedElement)  {
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

/// 'listbuild' | 'lb'
/// summary values:LISTBUILD,LB
/// summary=K|K
Method ListbuildFunctionCallSet341Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K|K
	if '(..isKeywordInList($lb("LISTBUILD","LB"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"LISTBUILD")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"LB")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  (',' variable_set)*
Method ListbuildFunctionCallSet342RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ListbuildFunctionCallSet343Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// ',' variable_set
/// summary values:,
/// summary=P&C
Method ListbuildFunctionCallSet343Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..VariableSet(.subElement,.addedElement)  {
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

///  listitem_function_call ::= ('listget' | 'list' | 'li' |'lg' ) open_bracket expression [ ',' star_parameter [ ',' star_parameter ] ] close_bracket
/// summary values:LISTGET,LIST,LI,LG
/// summary=(K|K|K|K)&C&C&[P&C&[P&C]]&C
Method ListitemFunctionCall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K|K|K)&C&C&[P&C&[P&C]]&C
	if '(..isKeywordInList($lb("LISTGET","LIST","LI","LG"),.value)) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ListitemFunctionCall348Sub(.subElement,.addedElement)  {
		if ..OpenBracket(.subElement,.addedElement)  {
			if ..Expression(.subElement,.addedElement)  {
				if ..ListitemFunctionCall349OptGrp(.subElement,.addedElement)  {
					if ..CloseBracket(.subElement,.addedElement)  {
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

/// 'listget' | 'list' | 'li' |'lg'
/// summary values:LISTGET,LIST,LI,LG
/// summary=K|K|K|K
Method ListitemFunctionCall348Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K|K|K|K
	if '(..isKeywordInList($lb("LISTGET","LIST","LI","LG"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"LISTGET")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"LIST")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"LI")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"LG")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

/// 
/// summary values:,
/// summary=P&C&[P&C]
Method ListitemFunctionCall349OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&[P&C]
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 1 /* not found is OK */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..StarParameter(.subElement,.addedElement)  {
			if ..ListitemFunctionCall350OptGrp(.subElement,.addedElement)  {
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
/// summary values:,
/// summary=P&C
Method ListitemFunctionCall350OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 1 /* not found is OK */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..StarParameter(.subElement,.addedElement)  {
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

///  listitem_function_call_set ::= ('list' | 'li') open_bracket set_value_expression [ ',' star_parameter [ ',' star_parameter ] ] close_bracket
/// summary values:LIST,LI
/// summary=(K|K)&C&C&[P&C&[P&C]]&C
Method ListitemFunctionCallSet(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&C&C&[P&C&[P&C]]&C
	if '(..isKeywordInList($lb("LIST","LI"),.value)) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ListitemFunctionCallSet351Sub(.subElement,.addedElement)  {
		if ..OpenBracket(.subElement,.addedElement)  {
			if ..SetValueExpression(.subElement,.addedElement)  {
				if ..ListitemFunctionCallSet352OptGrp(.subElement,.addedElement)  {
					if ..CloseBracket(.subElement,.addedElement)  {
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

/// 'list' | 'li'
/// summary values:LIST,LI
/// summary=K|K
Method ListitemFunctionCallSet351Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K|K
	if '(..isKeywordInList($lb("LIST","LI"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"LIST")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"LI")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

/// 
/// summary values:,
/// summary=P&C&[P&C]
Method ListitemFunctionCallSet352OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&[P&C]
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 1 /* not found is OK */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..StarParameter(.subElement,.addedElement)  {
			if ..ListitemFunctionCallSet353OptGrp(.subElement,.addedElement)  {
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
/// summary values:,
/// summary=P&C
Method ListitemFunctionCallSet353OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 1 /* not found is OK */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..StarParameter(.subElement,.addedElement)  {
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

///  listupdate_function_call ::= ('listupdate' | 'lu') open_bracket expression ',' expression (',' [ expression ':' expression] )* close_bracket
/// summary values:LISTUPDATE,LU
/// summary=(K|K)&C&C&P&C&(?4punctuation:4?)*&C
Method ListupdateFunctionCall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&C&C&P&C&(?4punctuation:4?)*&C
	if '(..isKeywordInList($lb("LISTUPDATE","LU"),.value)) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ListupdateFunctionCall344Sub(.subElement,.addedElement)  {
		if ..OpenBracket(.subElement,.addedElement)  {
			if ..Expression(.subElement,.addedElement)  {
				if ..addPunctuation(.subElement,",")  {
					if ..Expression(.subElement,.addedElement)  {
						if ..ListupdateFunctionCall345RepZero(.subElement,.addedElement)  {
							if ..CloseBracket(.subElement,.addedElement)  {
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

/// 'listupdate' | 'lu'
/// summary values:LISTUPDATE,LU
/// summary=K|K
Method ListupdateFunctionCall344Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K|K
	if '(..isKeywordInList($lb("LISTUPDATE","LU"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"LISTUPDATE")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"LU")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  (',' [ expression ':' expression] )*
Method ListupdateFunctionCall345RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ListupdateFunctionCall346Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// ',' [ expression ':' expression]
/// summary values:,
/// summary=P&[C&P&C]
Method ListupdateFunctionCall346Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&[C&P&C]
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..ListupdateFunctionCall347OptGrp(.subElement,.addedElement)  {
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
/// summary=C&P&C
Method ListupdateFunctionCall347OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&P&C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(.subElement,.addedElement)  {
		if ..addPunctuation(.subElement,":")  {
			if ..Expression(.subElement,.addedElement)  {
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

///  lock_command ::= ('lock' | 'l') [post_conditional ] ( naked | ( [ lock_parameter ( ',' lock_parameter)* ] [ else_block ] ) )
/// summary values:LOCK,L
/// summary=(K|K)&[C]&(C|([C&(?4punctuation:4?)*]&[C]))
Method LockCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&[C]&(C|([C&(?4punctuation:4?)*]&[C]))
	if '(..isKeywordInList($lb("LOCK","L"),.value)) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LockCommand184Sub(.subElement,.addedElement)  {
		if $S(..PostConditional(.subElement,.addedElement) :1,1:1) {
			if ..LockCommand185Sub(.subElement,.addedElement)  {
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

/// 'lock' | 'l'
/// summary values:LOCK,L
/// summary=K|K
Method LockCommand184Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K|K
	if '(..isKeywordInList($lb("LOCK","L"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"LOCK")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"L")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  naked | ( [ lock_parameter ( ',' lock_parameter)* ] [ else_block ] )
/// summary=C|([C&(?4punctuation:4?)*]&[C])
Method LockCommand185Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|([C&(?4punctuation:4?)*]&[C])
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Naked(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..LockCommand186Sub(.subElement,.addedElement)  {
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

///  [ lock_parameter ( ',' lock_parameter)* ] [ else_block ]
/// summary=[C&(?4punctuation:4?)*]&[C]
Method LockCommand186Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary [C&(?4punctuation:4?)*]&[C]
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LockCommand187OptGrp(.subElement,.addedElement)  {
		if $S(..ElseBlock(.subElement,.addedElement) :1,1:1) {
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
/// summary=C&(?4punctuation:4?)*
Method LockCommand187OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&(?4punctuation:4?)*
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LockParameter(.subElement,.addedElement)  {
		if ..LockCommand188RepZero(.subElement,.addedElement)  {
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

///  ( ',' lock_parameter)*
Method LockCommand188RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..LockCommand189Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' lock_parameter
/// summary values:,
/// summary=P&C
Method LockCommand189Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..LockParameter(.subElement,.addedElement)  {
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

///  lock_parameter ::= [ '+' | '-' ] (lockname_list | lockname_list_item) [ lock_timeout ]
/// summary=[P|P]&(C|C)&[C]
Method LockParameter(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary [P|P]&(C|C)&[C]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LockParameter190OptGrp(.subElement,.addedElement)  {
		if ..LockParameter191Sub(.subElement,.addedElement)  {
			if $S(..LockTimeout(.subElement,.addedElement) :1,1:1) {
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
/// summary values:+,-
/// summary=P|P
Method LockParameter190OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P|P
	if '(..isStringInList($lb("+","-"),1,.value)) { quit 1 /* not found is OK */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addPunctuation(.subElement,"+")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"-")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=1 /* failure rollsback but returns OK */
	}
	quit ok
}

/// lockname_list | lockname_list_item
/// summary=C|C
Method LockParameter191Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..LocknameList(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..LocknameListItem(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  lock_timeout ::= ':' expression
/// summary values::
/// summary=P&C
Method LockTimeout(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(":",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,":")  {
		if ..Expression(.subElement,.addedElement)  {
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

///  lock_type ::= hash_op expression
/// summary=C&C
Method LockType(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..HashOp(.subElement,.addedElement)  {
		if ..Expression(.subElement,.addedElement)  {
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

///  lockname ::= global_ref | variable | macrocall | indirection
/// summary=C|C|C|C
Method Lockname(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C|C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..GlobalRef(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Variable(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Macrocall(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Indirection(.subElement,.addedElement)  {
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

///  lockname_list ::= '(' lockname_list_item ( ',' lockname_list_item )* ')'
/// summary values:(
/// summary=P&C&(?4punctuation:4?)*&P
Method LocknameList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&(?4punctuation:4?)*&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if ..LocknameListItem(.subElement,.addedElement)  {
			if ..LocknameList192RepZero(.subElement,.addedElement)  {
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

///  ( ',' lockname_list_item )*
Method LocknameList192RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..LocknameList193Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' lockname_list_item
/// summary values:,
/// summary=P&C
Method LocknameList193Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..LocknameListItem(.subElement,.addedElement)  {
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

///  lockname_list_item ::= lockname [ lock_type ]
/// summary=C&[C]
Method LocknameListItem(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&[C]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Lockname(.subElement,.addedElement)  {
		if $S(..LockType(.subElement,.addedElement) :1,1:1) {
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

///  lvalue_expression ::= this_object_set | variable_set | intrinsicfncall_set | special_variable | macrocall | Indirection | global_ref_set
/// summary=C|C|C|C|C|C|C
Method LvalueExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C|C|C|C|C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ThisObjectSet(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..VariableSet(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..IntrinsicfncallSet(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SpecialVariable(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Macrocall(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Indirection(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..GlobalRefSet(.subElement,.addedElement)  {
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

///  macro_expression ::= expression_function_call | safeexpression_function_call
/// summary=C|C
Method MacroExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ExpressionFunctionCall(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SafeexpressionFunctionCall(.subElement,.addedElement)  {
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

///  macro_identifier ::= [ '%' ] 'regexp:[0-9A-Za-z]+'
/// summary=[P]&R
Method MacroIdentifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary [P]&R
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..addPunctuation(.subElement,"%") :1,1:1) {
		if ..addRegex(.subElement,"[0-9A-Za-z]+")  {
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

///  macro_parameter ::= ('.' variable_set ) | expression
/// summary=(P&C)|C
Method MacroParameter(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (P&C)|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..MacroParameter68Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Expression(.subElement,.addedElement)  {
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

/// '.' variable_set
/// summary values:.
/// summary=P&C
Method MacroParameter68Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(".",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,".")  {
		if ..VariableSet(.subElement,.addedElement)  {
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

///  macro_parameter_list ::= '(' [ [macro_parameter] ( ',' [macro_parameter] )* ] ')'
/// summary values:(
/// summary=P&[[C]&(?4punctuation:4?)*]&P
Method MacroParameterList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&[[C]&(?4punctuation:4?)*]&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if ..MacroParameterList65OptGrp(.subElement,.addedElement)  {
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

/// 
/// summary=[C]&(?4punctuation:4?)*
Method MacroParameterList65OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary [C]&(?4punctuation:4?)*
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..MacroParameter(.subElement,.addedElement) :1,1:1) {
		if ..MacroParameterList66RepZero(.subElement,.addedElement)  {
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

///  ( ',' [macro_parameter] )*
Method MacroParameterList66RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..MacroParameterList67Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' [macro_parameter]
/// summary values:,
/// summary=P&[C]
Method MacroParameterList67Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&[C]
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if $S(..MacroParameter(.subElement,.addedElement) :1,1:1) {
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

///  macro_parameter_text ::= '(' any_text_upto_close_bracket ')'
/// summary values:(
/// summary=P&C&P
Method MacroParameterText(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if ..AnyTextUptoCloseBracket(.subElement,.addedElement)  {
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

///  macrocall ::= '$$$' macro_identifier [ macro_parameter_list | macro_parameter_text ] [ macro_parameter_list ] [ object_chain ]
/// summary values:$$$
/// summary=P&C&[C|C]&[C]&[C]
Method Macrocall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&[C|C]&[C]&[C]
	; first rule summary P
	if '(..isStringSingle("$$$",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"$$$")  {
		if ..MacroIdentifier(.subElement,.addedElement)  {
			if ..Macrocall64OptGrp(.subElement,.addedElement)  {
				if $S(..MacroParameterList(.subElement,.addedElement) :1,1:1) {
					if $S(..ObjectChain(.subElement,.addedElement) :1,1:1) {
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
/// summary=C|C
Method Macrocall64OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..MacroParameterList(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..MacroParameterText(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=1 /* failure rollsback but returns OK */
	}
	quit ok
}

///  merge_command ::= ('merge' | 'm') [ post_conditional ] merge_list
/// summary values:MERGE,M
/// summary=(K|K)&[C]&C
Method MergeCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&[C]&C
	if '(..isKeywordInList($lb("MERGE","M"),.value)) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..MergeCommand194Sub(.subElement,.addedElement)  {
		if $S(..PostConditional(.subElement,.addedElement) :1,1:1) {
			if ..MergeList(.subElement,.addedElement)  {
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

/// 'merge' | 'm'
/// summary values:MERGE,M
/// summary=K|K
Method MergeCommand194Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K|K
	if '(..isKeywordInList($lb("MERGE","M"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"MERGE")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"M")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  merge_item ::= lvalue_expression '=' expression
/// summary=C&P&C
Method MergeItem(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&P&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LvalueExpression(.subElement,.addedElement)  {
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

///  merge_list ::= merge_item ( ',' merge_item )*
/// summary=C&(?4punctuation:4?)*
Method MergeList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..MergeItem(.subElement,.addedElement)  {
		if ..MergeList195RepZero(.subElement,.addedElement)  {
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

///  ( ',' merge_item )*
Method MergeList195RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..MergeList196Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' merge_item
/// summary values:,
/// summary=P&C
Method MergeList196Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..MergeItem(.subElement,.addedElement)  {
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

///  method_function_call ::= 'method' open_bracket classmethod_class ',' classmethod_method [ ',' function_parameter_list_items ] close_bracket [ object_chain ]
/// summary values:METHOD
/// summary=K&C&C&P&C&[P&C]&C&[C]
Method MethodFunctionCall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C&C&P&C&[P&C]&C&[C]
	if '(..isKeyword("METHOD",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"METHOD")  {
		if ..OpenBracket(.subElement,.addedElement)  {
			if ..ClassmethodClass(.subElement,.addedElement)  {
				if ..addPunctuation(.subElement,",")  {
					if ..ClassmethodMethod(.subElement,.addedElement)  {
						if ..MethodFunctionCall381OptGrp(.subElement,.addedElement)  {
							if ..CloseBracket(.subElement,.addedElement)  {
								if $S(..ObjectChain(.subElement,.addedElement) :1,1:1) {
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
Method MethodFunctionCall381OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 1 /* not found is OK */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..FunctionParameterListItems(.subElement,.addedElement)  {
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

///  mnemonic_arguments ::= expression ( ',' expression )*
/// summary=C&(?4punctuation:4?)*
Method MnemonicArguments(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(.subElement,.addedElement)  {
		if ..MnemonicArguments260RepZero(.subElement,.addedElement)  {
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

///  ( ',' expression )*
Method MnemonicArguments260RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..MnemonicArguments261Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' expression
/// summary values:,
/// summary=P&C
Method MnemonicArguments261Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..Expression(.subElement,.addedElement)  {
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

///  monadicop ::= "+" | "-" | "'" | "~"
/// summary values:+,-,',~
/// summary=P|P|P|P
Method Monadicop(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|P|P|P
	if '(..isStringInList($lb("+","-","'","~"),1,.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"+")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"-")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"'")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"~")  {
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

///  mpv_command ::= ('mvprint' | 'mvp') [ post_conditional ] [ write_argument_list ]
/// summary values:MVPRINT,MVP
/// summary=(K|K)&[C]&[C]
Method MpvCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&[C]&[C]
	if '(..isKeywordInList($lb("MVPRINT","MVP"),.value)) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..MpvCommand262Sub(.subElement,.addedElement)  {
		if $S(..PostConditional(.subElement,.addedElement) :1,1:1) {
			if $S(..WriteArgumentList(.subElement,.addedElement) :1,1:1) {
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

/// 'mvprint' | 'mvp'
/// summary values:MVPRINT,MVP
/// summary=K|K
Method MpvCommand262Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K|K
	if '(..isKeywordInList($lb("MVPRINT","MVP"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"MVPRINT")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"MVP")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  mv_function_set ::= 'mv' open_bracket variable_set ',' expression [ '::' expression ] [ ',' expression [ ',' expression ] ] close_bracket
/// summary values:MV
/// summary=K&C&C&P&C&[P&C]&[P&C&[P&C]]&C
Method MvFunctionSet(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C&C&P&C&[P&C]&[P&C&[P&C]]&C
	if '(..isKeyword("MV",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"MV")  {
		if ..OpenBracket(.subElement,.addedElement)  {
			if ..VariableSet(.subElement,.addedElement)  {
				if ..addPunctuation(.subElement,",")  {
					if ..Expression(.subElement,.addedElement)  {
						if ..MvFunctionSet388OptGrp(.subElement,.addedElement)  {
							if ..MvFunctionSet389OptGrp(.subElement,.addedElement)  {
								if ..CloseBracket(.subElement,.addedElement)  {
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
/// summary values:::
/// summary=P&C
Method MvFunctionSet388OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle("::",.value)) { quit 1 /* not found is OK */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"::")  {
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

/// 
/// summary values:,
/// summary=P&C&[P&C]
Method MvFunctionSet389OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&[P&C]
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 1 /* not found is OK */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..Expression(.subElement,.addedElement)  {
			if ..MvFunctionSet390OptGrp(.subElement,.addedElement)  {
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
/// summary values:,
/// summary=P&C
Method MvFunctionSet390OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 1 /* not found is OK */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
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

///  my_one_xecute_arg ::= expression [ post_conditional]
/// summary=C&[C]
Method MyOneXecuteArg(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&[C]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(.subElement,.addedElement)  {
		if $S(..PostConditional(.subElement,.addedElement) :1,1:1) {
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

///  naked ::= ' '
/// summary values: 
/// summary=P
Method Naked(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle(" ",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement," ")  {
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

///  new_command ::= ('new' | 'n') [ post_conditional ] ( naked | new_item_list )
/// summary values:NEW,N
/// summary=(K|K)&[C]&(C|C)
Method NewCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&[C]&(C|C)
	if '(..isKeywordInList($lb("NEW","N"),.value)) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..NewCommand197Sub(.subElement,.addedElement)  {
		if $S(..PostConditional(.subElement,.addedElement) :1,1:1) {
			if ..NewCommand198Sub(.subElement,.addedElement)  {
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

/// 'new' | 'n'
/// summary values:NEW,N
/// summary=K|K
Method NewCommand197Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K|K
	if '(..isKeywordInList($lb("NEW","N"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"NEW")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"N")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  naked | new_item_list
/// summary=C|C
Method NewCommand198Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..Naked(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..NewItemList(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  new_item ::= new_item_single | new_item_varlist
/// summary=C|C
Method NewItem(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..NewItemSingle(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..NewItemVarlist(.subElement,.addedElement)  {
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

///  new_item_list ::= new_item ( ',' new_item )*
/// summary=C&(?4punctuation:4?)*
Method NewItemList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..NewItem(.subElement,.addedElement)  {
		if ..NewItemList199RepZero(.subElement,.addedElement)  {
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

///  ( ',' new_item )*
Method NewItemList199RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..NewItemList200Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' new_item
/// summary values:,
/// summary=P&C
Method NewItemList200Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..NewItem(.subElement,.addedElement)  {
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

///  new_item_single ::= lvalue_expression
/// summary=C
Method NewItemSingle(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LvalueExpression(.subElement,.addedElement)  {
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

///  new_item_single_list ::= new_item_single ( ',' new_item_single )*
/// summary=C&(?4punctuation:4?)*
Method NewItemSingleList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..NewItemSingle(.subElement,.addedElement)  {
		if ..NewItemSingleList201RepZero(.subElement,.addedElement)  {
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

///  ( ',' new_item_single )*
Method NewItemSingleList201RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..NewItemSingleList202Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' new_item_single
/// summary values:,
/// summary=P&C
Method NewItemSingleList202Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..NewItemSingle(.subElement,.addedElement)  {
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

///  new_item_varlist ::= '(' new_item_single_list ')'
/// summary values:(
/// summary=P&C&P
Method NewItemVarlist(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if ..NewItemSingleList(.subElement,.addedElement)  {
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

///  number ::= ('regexp:[0-9]*' [ '.' 'regexp:[0-9]+'] [ ('e' | 'E' ) 'regexp:[0-9]+']) | ('.' 'regexp:[0-9]+' [ ('e' | 'E') 'regexp:[0-9]+'])
/// summary=(R&[P&R]&[(K|K)&R])|(P&R&[(K|K)&R])
Method Number(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (R&[P&R]&[(K|K)&R])|(P&R&[(K|K)&R])
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Number109Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Number113Sub(.subElement,.addedElement)  {
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

/// 'regexp:[0-9]*' [ '.' 'regexp:[0-9]+'] [ ('e' | 'E' ) 'regexp:[0-9]+']
/// summary=R&[P&R]&[(K|K)&R]
Method Number109Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary R&[P&R]&[(K|K)&R]
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addRegex(.subElement,"[0-9]*")  {
		if ..Number110OptGrp(.subElement,.addedElement)  {
			if ..Number111OptGrp(.subElement,.addedElement)  {
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
Method Number110OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method Number111OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary (K|K)&R
	if '(..isKeywordInList($lb("E","E"),.value)) { quit 1 /* not found is OK */ /*1*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Number112Sub(.subElement,.addedElement)  {
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
Method Number112Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method Number113Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&R&[(K|K)&R]
	; first rule summary P
	if '(..isStringSingle(".",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,".")  {
		if ..addRegex(.subElement,"[0-9]+")  {
			if ..Number114OptGrp(.subElement,.addedElement)  {
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
Method Number114OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary (K|K)&R
	if '(..isKeywordInList($lb("E","E"),.value)) { quit 1 /* not found is OK */ /*1*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Number115Sub(.subElement,.addedElement)  {
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
Method Number115Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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

///  object_chain ::= '.' object_member_identifier [ function_parameter_list ] [ object_chain ]
/// summary values:.
/// summary=P&C&[C]&[C]
Method ObjectChain(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&[C]&[C]
	; first rule summary P
	if '(..isStringSingle(".",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,".")  {
		if ..ObjectMemberIdentifier(.subElement,.addedElement)  {
			if $S(..FunctionParameterList(.subElement,.addedElement) :1,1:1) {
				if $S(..ObjectChain(.subElement,.addedElement) :1,1:1) {
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

///  object_chain99 ::= '.' object_chain_item ( '.' object_chain_item )*
/// summary values:.
/// summary=P&C&(?4punctuation:4?)*
Method ObjectChain99(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&(?4punctuation:4?)*
	; first rule summary P
	if '(..isStringSingle(".",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,".")  {
		if ..ObjectChainItem(.subElement,.addedElement)  {
			if ..ObjectChain99107RepZero(.subElement,.addedElement)  {
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

///  ( '.' object_chain_item )*
Method ObjectChain99107RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ObjectChain99108Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  '.' object_chain_item
/// summary values:.
/// summary=P&C
Method ObjectChain99108Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(".",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,".")  {
		if ..ObjectChainItem(.subElement,.addedElement)  {
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

///  object_chain_item ::= object_member_identifier [ function_parameter_list ]
/// summary=C&[C]
Method ObjectChainItem(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&[C]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ObjectMemberIdentifier(.subElement,.addedElement)  {
		if $S(..FunctionParameterList(.subElement,.addedElement) :1,1:1) {
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

///  object_chain_no_dot ::= object_member_identifier [ function_parameter_list ] [ object_chain ]
/// summary=C&[C]&[C]
Method ObjectChainNoDot(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&[C]&[C]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ObjectMemberIdentifier(.subElement,.addedElement)  {
		if $S(..FunctionParameterList(.subElement,.addedElement) :1,1:1) {
			if $S(..ObjectChain(.subElement,.addedElement) :1,1:1) {
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

///  object_dot ::= '.'
/// summary values:.
/// summary=P
Method ObjectDot(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle(".",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,".")  {
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

///  object_member_identifier ::= 'regexp:(\%|\#|[a-zA-Z])[a-zA-Z0-9\.]*'
/// summary=R
Method ObjectMemberIdentifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary R
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..addRegex(.subElement,"(\%|\#|[a-zA-Z])[a-zA-Z0-9\.]*")  {
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

///  object_variable ::= variable_identifier [ array_parameter_list ] object_chain
/// summary=C&[C]&C
Method ObjectVariable(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&[C]&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..VariableIdentifier(.subElement,.addedElement)  {
		if $S(..ArrayParameterList(.subElement,.addedElement) :1,1:1) {
			if ..ObjectChain(.subElement,.addedElement)  {
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

///  offset ::= 'regexp:[0-9]+'
/// summary=R
Method Offset(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary R
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..addRegex(.subElement,"[0-9]+")  {
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

///  offset_sign ::= '+' | '-'
/// summary values:+,-
/// summary=P|P
Method OffsetSign(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|P
	if '(..isStringInList($lb("+","-"),1,.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"+")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"-")  {
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

///  one_close_device_parameter ::= expression
/// summary=C
Method OneCloseDeviceParameter(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(.subElement,.addedElement)  {
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

///  one_cos_statement ::= [ label_definition ] ('.')* cos_command_or_macro
/// summary=[C]&(?4punctuation:4?)*&C
Method OneCosStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary [C]&(?4punctuation:4?)*&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..LabelDefinition(.subElement,.addedElement) :1,1:1) {
		if ..OneCosStatement9RepZero(.subElement,.addedElement)  {
			if ..CosCommandOrMacro(.subElement,.addedElement)  {
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

/// '.'
/// summary values:.
/// summary=P
Method OneCosStatement10Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P
	if '(..isStringSingle(".",.value)) { quit 0 /* normal */ /*3 */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addPunctuation(.subElement,".")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  ('.')*
Method OneCosStatement9RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..OneCosStatement10Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  one_cos_statement_sql ::= ('.')* cos_command_or_macro
/// summary=(?4punctuation:4?)*&C
Method OneCosStatementSql(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (?4punctuation:4?)*&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OneCosStatementSql11RepZero(.subElement,.addedElement)  {
		if ..CosCommandOrMacro(.subElement,.addedElement)  {
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

///  ('.')*
Method OneCosStatementSql11RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..OneCosStatementSql12Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// '.'
/// summary values:.
/// summary=P
Method OneCosStatementSql12Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P
	if '(..isStringSingle(".",.value)) { quit 0 /* normal */ /*3 */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addPunctuation(.subElement,".")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  one_open_argument ::= open_device [ ':' [ ( '(' open_device_parameters ')' ) | expression ] ] [ ':' open_timeout ] [ ':' open_mnemonic_space ]
/// summary=C&[P&[(P&C&P)|C]]&[P&C]&[P&C]
Method OneOpenArgument(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&[P&[(P&C&P)|C]]&[P&C]&[P&C]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OpenDevice(.subElement,.addedElement)  {
		if ..OneOpenArgument206OptGrp(.subElement,.addedElement)  {
			if ..OneOpenArgument209OptGrp(.subElement,.addedElement)  {
				if ..OneOpenArgument210OptGrp(.subElement,.addedElement)  {
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
/// summary values::
/// summary=P&[(P&C&P)|C]
Method OneOpenArgument206OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&[(P&C&P)|C]
	; first rule summary P
	if '(..isStringSingle(":",.value)) { quit 1 /* not found is OK */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,":")  {
		if ..OneOpenArgument207OptGrp(.subElement,.addedElement)  {
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
/// summary=(P&C&P)|C
Method OneOpenArgument207OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary (P&C&P)|C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OneOpenArgument208Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Expression(.subElement,.addedElement)  {
		set done=1 ; end compileRules
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

///  '(' open_device_parameters ')'
/// summary values:(
/// summary=P&C&P
Method OneOpenArgument208Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if ..OpenDeviceParameters(.subElement,.addedElement)  {
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

/// 
/// summary values::
/// summary=P&C
Method OneOpenArgument209OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(":",.value)) { quit 1 /* not found is OK */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,":")  {
		if ..OpenTimeout(.subElement,.addedElement)  {
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
/// summary values::
/// summary=P&C
Method OneOpenArgument210OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(":",.value)) { quit 1 /* not found is OK */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,":")  {
		if ..OpenMnemonicSpace(.subElement,.addedElement)  {
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

///  one_open_device_parameter ::= ('/' identifier [ '=' open_expression_list ] ) | expression
/// summary=(P&C&[P&C])|C
Method OneOpenDeviceParameter(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (P&C&[P&C])|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OneOpenDeviceParameter213Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Expression(.subElement,.addedElement)  {
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

/// '/' identifier [ '=' open_expression_list ]
/// summary values:/
/// summary=P&C&[P&C]
Method OneOpenDeviceParameter213Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&[P&C]
	; first rule summary P
	if '(..isStringSingle("/",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"/")  {
		if ..Identifier(.subElement,.addedElement)  {
			if ..OneOpenDeviceParameter214OptGrp(.subElement,.addedElement)  {
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
/// summary values:=
/// summary=P&C
Method OneOpenDeviceParameter214OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle("=",.value)) { quit 1 /* not found is OK */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"=")  {
		if ..OpenExpressionList(.subElement,.addedElement)  {
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

///  one_parameter_value ::= ( [ '.' ] variable ) | ( variable '...' ) | expression
/// summary=([P]&C)|(C&P)|C
Method OneParameterValue(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ([P]&C)|(C&P)|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OneParameterValue88Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OneParameterValue89Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Expression(.subElement,.addedElement)  {
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

///  [ '.' ] variable
/// summary=[P]&C
Method OneParameterValue88Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary [P]&C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..addPunctuation(.subElement,".") :1,1:1) {
		if ..Variable(.subElement,.addedElement)  {
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

///  variable '...'
/// summary=C&P
Method OneParameterValue89Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&P
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Variable(.subElement,.addedElement)  {
		if ..addPunctuation(.subElement,"...")  {
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

///  one_use_argument ::= use_device [ ':' ( use_device_parameters_inbrackets | use_device_parameters) ] [ ':' use_mnemonic_space ]
/// summary=C&[P&(C|C)]&[P&C]
Method OneUseArgument(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&[P&(C|C)]&[P&C]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..UseDevice(.subElement,.addedElement)  {
		if ..OneUseArgument243OptGrp(.subElement,.addedElement)  {
			if ..OneUseArgument245OptGrp(.subElement,.addedElement)  {
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
/// summary values::
/// summary=P&(C|C)
Method OneUseArgument243OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&(C|C)
	; first rule summary P
	if '(..isStringSingle(":",.value)) { quit 1 /* not found is OK */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,":")  {
		if ..OneUseArgument244Sub(.subElement,.addedElement)  {
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

///  use_device_parameters_inbrackets | use_device_parameters
/// summary=C|C
Method OneUseArgument244Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..UseDeviceParametersInbrackets(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..UseDeviceParameters(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

/// 
/// summary values::
/// summary=P&C
Method OneUseArgument245OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(":",.value)) { quit 1 /* not found is OK */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,":")  {
		if ..UseMnemonicSpace(.subElement,.addedElement)  {
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

///  one_use_device_parameter ::= ('/' identifier [ '=' expression ] ) | expression
/// summary=(P&C&[P&C])|C
Method OneUseDeviceParameter(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (P&C&[P&C])|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OneUseDeviceParameter248Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Expression(.subElement,.addedElement)  {
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

/// '/' identifier [ '=' expression ]
/// summary values:/
/// summary=P&C&[P&C]
Method OneUseDeviceParameter248Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&[P&C]
	; first rule summary P
	if '(..isStringSingle("/",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"/")  {
		if ..Identifier(.subElement,.addedElement)  {
			if ..OneUseDeviceParameter249OptGrp(.subElement,.addedElement)  {
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
/// summary values:=
/// summary=P&C
Method OneUseDeviceParameter249OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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

///  one_write_argument ::= expression | write_control_expression_list
/// summary=C|C
Method OneWriteArgument(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..WriteControlExpressionList(.subElement,.addedElement)  {
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

///  one_xecute_arg ::= ( xecute_arg_with_params | xecute_arg_no_params ) [ post_conditional ]
/// summary=(C|C)&[C]
Method OneXecuteArg(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (C|C)&[C]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OneXecuteArg278Sub(.subElement,.addedElement)  {
		if $S(..PostConditional(.subElement,.addedElement) :1,1:1) {
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

///  xecute_arg_with_params | xecute_arg_no_params
/// summary=C|C
Method OneXecuteArg278Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..XecuteArgWithParams(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..XecuteArgNoParams(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  one_zallocatename ::= zallocatename [ zallocate_type ]
/// summary=C&[C]
Method OneZallocatename(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&[C]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Zallocatename(.subElement,.addedElement)  {
		if $S(..ZallocateType(.subElement,.addedElement) :1,1:1) {
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

///  one_zdeallocatename ::= zdeallocatename [ zdeallocate_type ]
/// summary=C&[C]
Method OneZdeallocatename(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&[C]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Zdeallocatename(.subElement,.addedElement)  {
		if $S(..ZdeallocateType(.subElement,.addedElement) :1,1:1) {
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

///  open_arguments ::= one_open_argument ( ',' one_open_argument )*
/// summary=C&(?4punctuation:4?)*
Method OpenArguments(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OneOpenArgument(.subElement,.addedElement)  {
		if ..OpenArguments204RepZero(.subElement,.addedElement)  {
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

///  ( ',' one_open_argument )*
Method OpenArguments204RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..OpenArguments205Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' one_open_argument
/// summary values:,
/// summary=P&C
Method OpenArguments205Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..OneOpenArgument(.subElement,.addedElement)  {
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

///  open_bracket ::= '('
/// summary values:(
/// summary=P
Method OpenBracket(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
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

///  open_command ::= ('open' | 'o') [ post_conditional ] open_arguments
/// summary values:OPEN,O
/// summary=(K|K)&[C]&C
Method OpenCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&[C]&C
	if '(..isKeywordInList($lb("OPEN","O"),.value)) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OpenCommand203Sub(.subElement,.addedElement)  {
		if $S(..PostConditional(.subElement,.addedElement) :1,1:1) {
			if ..OpenArguments(.subElement,.addedElement)  {
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

/// 'open' | 'o'
/// summary values:OPEN,O
/// summary=K|K
Method OpenCommand203Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K|K
	if '(..isKeywordInList($lb("OPEN","O"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"OPEN")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"O")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  open_device ::= expression
/// summary=C
Method OpenDevice(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(.subElement,.addedElement)  {
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

///  open_device_parameters ::= [one_open_device_parameter] ( ':'[ one_open_device_parameter] )*
/// summary=[C]&(?4punctuation:4?)*
Method OpenDeviceParameters(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary [C]&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..OneOpenDeviceParameter(.subElement,.addedElement) :1,1:1) {
		if ..OpenDeviceParameters211RepZero(.subElement,.addedElement)  {
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

///  ( ':'[ one_open_device_parameter] )*
Method OpenDeviceParameters211RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..OpenDeviceParameters212Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ':'[ one_open_device_parameter]
/// summary values::
/// summary=P&[C]
Method OpenDeviceParameters212Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&[C]
	; first rule summary P
	if '(..isStringSingle(":",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,":")  {
		if $S(..OneOpenDeviceParameter(.subElement,.addedElement) :1,1:1) {
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

///  open_expression_list ::= (variable '...') | expression_list
/// summary=(C&P)|C
Method OpenExpressionList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (C&P)|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OpenExpressionList215Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ExpressionList(.subElement,.addedElement)  {
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

/// variable '...'
/// summary=C&P
Method OpenExpressionList215Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&P
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Variable(.subElement,.addedElement)  {
		if ..addPunctuation(.subElement,"...")  {
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

///  open_mnemonic_space ::= expression
/// summary=C
Method OpenMnemonicSpace(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(.subElement,.addedElement)  {
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

///  open_timeout ::= expression
/// summary=C
Method OpenTimeout(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(.subElement,.addedElement)  {
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

///  order_function_call ::= ('order' | 'o') open_bracket expression [',' expression [ ',' variable_set ] ] close_bracket
/// summary values:ORDER,O
/// summary=(K|K)&C&C&[P&C&[P&C]]&C
Method OrderFunctionCall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&C&C&[P&C&[P&C]]&C
	if '(..isKeywordInList($lb("ORDER","O"),.value)) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OrderFunctionCall361Sub(.subElement,.addedElement)  {
		if ..OpenBracket(.subElement,.addedElement)  {
			if ..Expression(.subElement,.addedElement)  {
				if ..OrderFunctionCall362OptGrp(.subElement,.addedElement)  {
					if ..CloseBracket(.subElement,.addedElement)  {
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

/// 'order' | 'o'
/// summary values:ORDER,O
/// summary=K|K
Method OrderFunctionCall361Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K|K
	if '(..isKeywordInList($lb("ORDER","O"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"ORDER")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"O")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

/// 
/// summary values:,
/// summary=P&C&[P&C]
Method OrderFunctionCall362OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&[P&C]
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 1 /* not found is OK */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..Expression(.subElement,.addedElement)  {
			if ..OrderFunctionCall363OptGrp(.subElement,.addedElement)  {
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
/// summary values:,
/// summary=P&C
Method OrderFunctionCall363OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 1 /* not found is OK */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..VariableSet(.subElement,.addedElement)  {
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

///  parameter_list ::= '(' [ parameter_values ] ')'
/// summary values:(
/// summary=P&[C]&P
Method ParameterList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&[C]&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if $S(..ParameterValues(.subElement,.addedElement) :1,1:1) {
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

///  parameter_values ::= one_parameter_value ( ',' [ one_parameter_value ] )*
/// summary=C&(?4punctuation:4?)*
Method ParameterValues(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OneParameterValue(.subElement,.addedElement)  {
		if ..ParameterValues86RepZero(.subElement,.addedElement)  {
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

///  ( ',' [ one_parameter_value ] )*
Method ParameterValues86RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ParameterValues87Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' [ one_parameter_value ]
/// summary values:,
/// summary=P&[C]
Method ParameterValues87Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&[C]
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if $S(..OneParameterValue(.subElement,.addedElement) :1,1:1) {
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

///  pattern_match ::= ( "?" | "'?" ) (pattern_match_combo )*
/// summary=(P|P)&(?4punctuation:4?)*
Method PatternMatch(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (P|P)&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..PatternMatch54Sub(.subElement,.addedElement)  {
		if ..PatternMatch55RepZero(.subElement,.addedElement)  {
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

///  "?" | "'?"
/// summary values:?,'?
/// summary=P|P
Method PatternMatch54Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P|P
	if '(..isStringInList($lb("?","'?"),2,.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addPunctuation(.subElement,"?")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"'?")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  (pattern_match_combo )*
Method PatternMatch55RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..PatternMatch56Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// pattern_match_combo
/// summary=C
Method PatternMatch56Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C
	set subElement=ParentElement
	set done=0 ; method start
	if ..PatternMatchCombo(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  pattern_match_alternating ::= '(' ( pattern_match_combo ( ',' pattern_match_combo )* )')'
/// summary values:(
/// summary=P&(C&(?4punctuation:4?)*)&P
Method PatternMatchAlternating(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&(C&(?4punctuation:4?)*)&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if ..PatternMatchAlternating58Sub(.subElement,.addedElement)  {
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

///  pattern_match_combo ( ',' pattern_match_combo )*
/// summary=C&(?4punctuation:4?)*
Method PatternMatchAlternating58Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&(?4punctuation:4?)*
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..PatternMatchCombo(.subElement,.addedElement)  {
		if ..PatternMatchAlternating59RepZero(.subElement,.addedElement)  {
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

///  ( ',' pattern_match_combo )*
Method PatternMatchAlternating59RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..PatternMatchAlternating60Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' pattern_match_combo
/// summary values:,
/// summary=P&C
Method PatternMatchAlternating60Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..PatternMatchCombo(.subElement,.addedElement)  {
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

///  pattern_match_code ::= 'a' | 'c' | 'e' | 'l' | 'n' | 'p' | 'u' | 'b' | 'm' | 'ZFWCHARZ' | 'ZHWKATAZ' | string
/// summary=K|K|K|K|K|K|K|K|K|K|K|C
Method PatternMatchCode(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K|K|K|K|K|K|K|K|K|K|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"A")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"C")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"E")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"L")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"N")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"P")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"U")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"B")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"M")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"ZFWCHARZ")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"ZHWKATAZ")  {
		set done=1 ; or
	} elseif ..String(.subElement,.addedElement)  {
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

///  pattern_match_combo ::= pattern_match_repeat ( pattern_match_code | pattern_match_alternating )
/// summary=C&(C|C)
Method PatternMatchCombo(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&(C|C)
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..PatternMatchRepeat(.subElement,.addedElement)  {
		if ..PatternMatchCombo57Sub(.subElement,.addedElement)  {
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

///  pattern_match_code | pattern_match_alternating
/// summary=C|C
Method PatternMatchCombo57Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..PatternMatchCode(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..PatternMatchAlternating(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  pattern_match_repeat ::= ('regexp:[0-9]*' [ '.' [ 'regexp:[0-9]*' ] ]) | ('.' ['regexp:[0-9]*'])
/// summary=(R&[P&[R]])|(P&[R])
Method PatternMatchRepeat(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (R&[P&[R]])|(P&[R])
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..PatternMatchRepeat61Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..PatternMatchRepeat63Sub(.subElement,.addedElement)  {
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

/// 'regexp:[0-9]*' [ '.' [ 'regexp:[0-9]*' ] ]
/// summary=R&[P&[R]]
Method PatternMatchRepeat61Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary R&[P&[R]]
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addRegex(.subElement,"[0-9]*")  {
		if ..PatternMatchRepeat62OptGrp(.subElement,.addedElement)  {
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
/// summary values:.
/// summary=P&[R]
Method PatternMatchRepeat62OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&[R]
	; first rule summary P
	if '(..isStringSingle(".",.value)) { quit 1 /* not found is OK */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,".")  {
		if $S(..addRegex(.subElement,"[0-9]*") :1,1:1) {
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

/// '.' ['regexp:[0-9]*']
/// summary values:.
/// summary=P&[R]
Method PatternMatchRepeat63Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&[R]
	; first rule summary P
	if '(..isStringSingle(".",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,".")  {
		if $S(..addRegex(.subElement,"[0-9]*") :1,1:1) {
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

///  piece_function_call ::= ('piece' | 'p') open_bracket expression ',' expression [ ',' star_parameter [ ',' star_parameter ] ] close_bracket
/// summary values:PIECE,P
/// summary=(K|K)&C&C&P&C&[P&C&[P&C]]&C
Method PieceFunctionCall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&C&C&P&C&[P&C&[P&C]]&C
	if '(..isKeywordInList($lb("PIECE","P"),.value)) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..PieceFunctionCall332Sub(.subElement,.addedElement)  {
		if ..OpenBracket(.subElement,.addedElement)  {
			if ..Expression(.subElement,.addedElement)  {
				if ..addPunctuation(.subElement,",")  {
					if ..Expression(.subElement,.addedElement)  {
						if ..PieceFunctionCall333OptGrp(.subElement,.addedElement)  {
							if ..CloseBracket(.subElement,.addedElement)  {
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

/// 'piece' | 'p'
/// summary values:PIECE,P
/// summary=K|K
Method PieceFunctionCall332Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K|K
	if '(..isKeywordInList($lb("PIECE","P"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"PIECE")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"P")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

/// 
/// summary values:,
/// summary=P&C&[P&C]
Method PieceFunctionCall333OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&[P&C]
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 1 /* not found is OK */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..StarParameter(.subElement,.addedElement)  {
			if ..PieceFunctionCall334OptGrp(.subElement,.addedElement)  {
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
/// summary values:,
/// summary=P&C
Method PieceFunctionCall334OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 1 /* not found is OK */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..StarParameter(.subElement,.addedElement)  {
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

///  piece_function_call_set ::= ('piece' | 'p') open_bracket set_value_expression ',' expression [ ',' star_parameter [ ',' star_parameter ] ] close_bracket
/// summary values:PIECE,P
/// summary=(K|K)&C&C&P&C&[P&C&[P&C]]&C
Method PieceFunctionCallSet(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&C&C&P&C&[P&C&[P&C]]&C
	if '(..isKeywordInList($lb("PIECE","P"),.value)) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..PieceFunctionCallSet335Sub(.subElement,.addedElement)  {
		if ..OpenBracket(.subElement,.addedElement)  {
			if ..SetValueExpression(.subElement,.addedElement)  {
				if ..addPunctuation(.subElement,",")  {
					if ..Expression(.subElement,.addedElement)  {
						if ..PieceFunctionCallSet336OptGrp(.subElement,.addedElement)  {
							if ..CloseBracket(.subElement,.addedElement)  {
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

/// 'piece' | 'p'
/// summary values:PIECE,P
/// summary=K|K
Method PieceFunctionCallSet335Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K|K
	if '(..isKeywordInList($lb("PIECE","P"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"PIECE")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"P")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

/// 
/// summary values:,
/// summary=P&C&[P&C]
Method PieceFunctionCallSet336OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&[P&C]
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 1 /* not found is OK */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..StarParameter(.subElement,.addedElement)  {
			if ..PieceFunctionCallSet337OptGrp(.subElement,.addedElement)  {
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
/// summary values:,
/// summary=P&C
Method PieceFunctionCallSet337OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 1 /* not found is OK */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..StarParameter(.subElement,.addedElement)  {
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

///  post_conditional ::= ':' expression
/// summary values::
/// summary=P&C
Method PostConditional(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(":",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,":")  {
		if ..Expression(.subElement,.addedElement)  {
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

///  primary ::= number | string | macrocall | macro_expression | this_object | extrinsicfncall | intrinsicfncall | classexpr | variable | special_variable | Indirection | global_ref | ( sub_expression [ object_chain ] ) | (cos_json [ object_chain ])
/// summary=C|C|C|C|C|C|C|C|C|C|C|C|(C&[C])|(C&[C])
Method Primary(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C|C|C|C|C|C|C|C|C|C|C|(C&[C])|(C&[C])
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Number(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..String(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Macrocall(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..MacroExpression(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ThisObject(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Extrinsicfncall(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Intrinsicfncall(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Classexpr(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Variable(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SpecialVariable(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Indirection(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..GlobalRef(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Primary100Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Primary101Sub(.subElement,.addedElement)  {
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

///  sub_expression [ object_chain ]
/// summary=C&[C]
Method Primary100Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&[C]
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SubExpression(.subElement,.addedElement)  {
		if $S(..ObjectChain(.subElement,.addedElement) :1,1:1) {
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

/// cos_json [ object_chain ]
/// summary=C&[C]
Method Primary101Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&[C]
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CosJson(.subElement,.addedElement)  {
		if $S(..ObjectChain(.subElement,.addedElement) :1,1:1) {
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

///  print_command ::= 'print' [ post_conditional ] [ lineref1 [ ':' lineref2 ] ]
/// summary values:PRINT
/// summary=K&[C]&[C&[P&C]]
Method PrintCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&[C]&[C&[P&C]]
	if '(..isKeyword("PRINT",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"PRINT")  {
		if $S(..PostConditional(.subElement,.addedElement) :1,1:1) {
			if ..PrintCommand216OptGrp(.subElement,.addedElement)  {
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
/// summary=C&[P&C]
Method PrintCommand216OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&[P&C]
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Lineref1(.subElement,.addedElement)  {
		if ..PrintCommand217OptGrp(.subElement,.addedElement)  {
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
/// summary values::
/// summary=P&C
Method PrintCommand217OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(":",.value)) { quit 1 /* not found is OK */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,":")  {
		if ..Lineref2(.subElement,.addedElement)  {
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

///  python_import ::= 'system' '.' 'python' '.' 'import' '(' string ')'
/// summary values:SYSTEM
/// summary=K&P&K&P&K&P&C&P
Method PythonImport(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&K&P&K&P&C&P
	if '(..isKeyword("SYSTEM",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"SYSTEM")  {
		if ..addPunctuation(.subElement,".")  {
			if ..addKeyword(.subElement,"PYTHON")  {
				if ..addPunctuation(.subElement,".")  {
					if ..addKeyword(.subElement,"IMPORT")  {
						if ..addPunctuation(.subElement,"(")  {
							if ..String(.subElement,.addedElement)  {
								if ..addPunctuation(.subElement,")")  {
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

///  query_function_call ::= ('query' | 'q') open_bracket expression [',' expression [ ',' variable_set ] ] close_bracket
/// summary values:QUERY,Q
/// summary=(K|K)&C&C&[P&C&[P&C]]&C
Method QueryFunctionCall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&C&C&[P&C&[P&C]]&C
	if '(..isKeywordInList($lb("QUERY","Q"),.value)) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..QueryFunctionCall374Sub(.subElement,.addedElement)  {
		if ..OpenBracket(.subElement,.addedElement)  {
			if ..Expression(.subElement,.addedElement)  {
				if ..QueryFunctionCall375OptGrp(.subElement,.addedElement)  {
					if ..CloseBracket(.subElement,.addedElement)  {
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

/// 'query' | 'q'
/// summary values:QUERY,Q
/// summary=K|K
Method QueryFunctionCall374Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K|K
	if '(..isKeywordInList($lb("QUERY","Q"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"QUERY")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"Q")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

/// 
/// summary values:,
/// summary=P&C&[P&C]
Method QueryFunctionCall375OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&[P&C]
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 1 /* not found is OK */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..Expression(.subElement,.addedElement)  {
			if ..QueryFunctionCall376OptGrp(.subElement,.addedElement)  {
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
/// summary values:,
/// summary=P&C
Method QueryFunctionCall376OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 1 /* not found is OK */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..VariableSet(.subElement,.addedElement)  {
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

///  quit_command ::= ('quit' | 'q') [ post_conditional ] ( naked | [ quit_expression ])
/// summary values:QUIT,Q
/// summary=(K|K)&[C]&(C|[C])
Method QuitCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&[C]&(C|[C])
	if '(..isKeywordInList($lb("QUIT","Q"),.value)) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..QuitCommand219Sub(.subElement,.addedElement)  {
		if $S(..PostConditional(.subElement,.addedElement) :1,1:1) {
			if ..QuitCommand220Sub(.subElement,.addedElement)  {
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

/// 'quit' | 'q'
/// summary values:QUIT,Q
/// summary=K|K
Method QuitCommand219Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K|K
	if '(..isKeywordInList($lb("QUIT","Q"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"QUIT")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"Q")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  naked | [ quit_expression ]
/// summary=C|[C]
Method QuitCommand220Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|[C]
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Naked(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif $S(..QuitExpression(.subElement,.addedElement) :1,1:1) {
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

///  quit_expression ::= expression
/// summary=C
Method QuitExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(.subElement,.addedElement)  {
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

///  read_argument ::= read_format_character | read_prompt | read_single_char | read_length
/// summary=C|C|C|C
Method ReadArgument(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C|C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ReadFormatCharacter(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ReadPrompt(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ReadSingleChar(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ReadLength(.subElement,.addedElement)  {
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

///  read_command ::= ('read' | 'r') [ post_conditional ] read_argument ( ',' read_argument )*
/// summary values:READ,R
/// summary=(K|K)&[C]&C&(?4punctuation:4?)*
Method ReadCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&[C]&C&(?4punctuation:4?)*
	if '(..isKeywordInList($lb("READ","R"),.value)) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ReadCommand263Sub(.subElement,.addedElement)  {
		if $S(..PostConditional(.subElement,.addedElement) :1,1:1) {
			if ..ReadArgument(.subElement,.addedElement)  {
				if ..ReadCommand264RepZero(.subElement,.addedElement)  {
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

/// 'read' | 'r'
/// summary values:READ,R
/// summary=K|K
Method ReadCommand263Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K|K
	if '(..isKeywordInList($lb("READ","R"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"READ")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"R")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  ( ',' read_argument )*
Method ReadCommand264RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ReadCommand265Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' read_argument
/// summary values:,
/// summary=P&C
Method ReadCommand265Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..ReadArgument(.subElement,.addedElement)  {
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

///  read_format_character ::= '!' | '#' | ('?' expression) | ('/' read_keyword [ '(' read_keyword_parameters ')' ])
/// summary=P|P|(P&C)|(P&C&[P&C&P])
Method ReadFormatCharacter(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|P|(P&C)|(P&C&[P&C&P])
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"!")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"#")  {
		set done=1 ; or
	} elseif ..ReadFormatCharacter267Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ReadFormatCharacter268Sub(.subElement,.addedElement)  {
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

/// '?' expression
/// summary values:?
/// summary=P&C
Method ReadFormatCharacter267Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle("?",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"?")  {
		if ..Expression(.subElement,.addedElement)  {
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

/// '/' read_keyword [ '(' read_keyword_parameters ')' ]
/// summary values:/
/// summary=P&C&[P&C&P]
Method ReadFormatCharacter268Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&[P&C&P]
	; first rule summary P
	if '(..isStringSingle("/",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"/")  {
		if ..ReadKeyword(.subElement,.addedElement)  {
			if ..ReadFormatCharacter269OptGrp(.subElement,.addedElement)  {
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
/// summary values:(
/// summary=P&C&P
Method ReadFormatCharacter269OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 1 /* not found is OK */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if ..ReadKeywordParameters(.subElement,.addedElement)  {
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

///  read_format_character_set ::= read_format_character+
/// summary=(?4Call:4?)+
Method ReadFormatCharacterSet(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (?4Call:4?)+
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ReadFormatCharacterSet266RepOne(.subElement,.addedElement)  {
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

///  read_format_character+
Method ReadFormatCharacterSet266RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4Call:4?
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..ReadFormatCharacter(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  read_keyword ::= text
/// summary=C
Method ReadKeyword(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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

///  read_keyword_parameter ::= text
/// summary=C
Method ReadKeywordParameter(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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

///  read_keyword_parameters ::= read_keyword_parameter ( ',' read_keyword_parameter )*
/// summary=C&(?4punctuation:4?)*
Method ReadKeywordParameters(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ReadKeywordParameter(.subElement,.addedElement)  {
		if ..ReadKeywordParameters270RepZero(.subElement,.addedElement)  {
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

///  ( ',' read_keyword_parameter )*
Method ReadKeywordParameters270RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ReadKeywordParameters271Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' read_keyword_parameter
/// summary values:,
/// summary=P&C
Method ReadKeywordParameters271Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..ReadKeywordParameter(.subElement,.addedElement)  {
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

///  read_length ::= lvalue_expression [ '#' expression ] [ ':' expression ]
/// summary=C&[P&C]&[P&C]
Method ReadLength(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&[P&C]&[P&C]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LvalueExpression(.subElement,.addedElement)  {
		if ..ReadLength273OptGrp(.subElement,.addedElement)  {
			if ..ReadLength274OptGrp(.subElement,.addedElement)  {
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
/// summary values:#
/// summary=P&C
Method ReadLength273OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle("#",.value)) { quit 1 /* not found is OK */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"#")  {
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

/// 
/// summary values::
/// summary=P&C
Method ReadLength274OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(":",.value)) { quit 1 /* not found is OK */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,":")  {
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

///  read_prompt ::= string
/// summary=C
Method ReadPrompt(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..String(.subElement,.addedElement)  {
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

///  read_single_char ::= '*' lvalue_expression [ ':' expression ]
/// summary values:*
/// summary=P&C&[P&C]
Method ReadSingleChar(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&[P&C]
	; first rule summary P
	if '(..isStringSingle("*",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"*")  {
		if ..LvalueExpression(.subElement,.addedElement)  {
			if ..ReadSingleChar272OptGrp(.subElement,.addedElement)  {
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
/// summary values::
/// summary=P&C
Method ReadSingleChar272OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(":",.value)) { quit 1 /* not found is OK */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,":")  {
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

///  return_command ::= 'return' [ post_conditional ] [ naked | return_expression ]
/// summary values:RETURN
/// summary=K&[C]&[C|C]
Method ReturnCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&[C]&[C|C]
	if '(..isKeyword("RETURN",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"RETURN")  {
		if $S(..PostConditional(.subElement,.addedElement) :1,1:1) {
			if ..ReturnCommand221OptGrp(.subElement,.addedElement)  {
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
Method ReturnCommand221OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..Naked(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ReturnExpression(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=1 /* failure rollsback but returns OK */
	}
	quit ok
}

///  return_expression ::= expression
/// summary=C
Method ReturnExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(.subElement,.addedElement)  {
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

///  routine_env ::= '|' [ expression ] '|'
/// summary values:|
/// summary=P&[C]&P
Method RoutineEnv(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&[C]&P
	; first rule summary P
	if '(..isStringSingle("|",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"|")  {
		if $S(..Expression(.subElement,.addedElement) :1,1:1) {
			if ..addPunctuation(.subElement,"|")  {
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

///  routine_identifier ::= 'regexp:(\%|[a-zA-Z])[a-zA-Z0-9]*'
/// summary=R
Method RoutineIdentifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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

///  safeexpression_function_call ::= '##safeexpression' function_parameter_list
/// summary values:##SAFEEXPRESSION
/// summary=P&C
Method SafeexpressionFunctionCall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle("##SAFEEXPRESSION",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"##safeexpression")  {
		if ..FunctionParameterList(.subElement,.addedElement)  {
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

///  select_clause ::= expression ':' expression
/// summary=C&P&C
Method SelectClause(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&P&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(.subElement,.addedElement)  {
		if ..addPunctuation(.subElement,":")  {
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

///  select_clause_default ::= '1' ':' expression
/// summary values:1
/// summary=P&P&C
Method SelectClauseDefault(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&P&C
	; first rule summary P
	if '(..isStringSingle("1",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"1")  {
		if ..addPunctuation(.subElement,":")  {
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

///  select_clauses ::= select_clause ( ',' select_clause )*
/// summary=C&(?4punctuation:4?)*
Method SelectClauses(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SelectClause(.subElement,.addedElement)  {
		if ..SelectClauses386RepZero(.subElement,.addedElement)  {
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

///  ( ',' select_clause )*
Method SelectClauses386RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..SelectClauses387Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' select_clause
/// summary values:,
/// summary=P&C
Method SelectClauses387Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..SelectClause(.subElement,.addedElement)  {
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

///  select_function_call ::= ('select' | 's') '(' select_clauses ')' [ object_chain ]
/// summary values:SELECT,S
/// summary=(K|K)&P&C&P&[C]
Method SelectFunctionCall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&P&C&P&[C]
	if '(..isKeywordInList($lb("SELECT","S"),.value)) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SelectFunctionCall385Sub(.subElement,.addedElement)  {
		if ..addPunctuation(.subElement,"(")  {
			if ..SelectClauses(.subElement,.addedElement)  {
				if ..addPunctuation(.subElement,")")  {
					if $S(..ObjectChain(.subElement,.addedElement) :1,1:1) {
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

/// 'select' | 's'
/// summary values:SELECT,S
/// summary=K|K
Method SelectFunctionCall385Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K|K
	if '(..isKeywordInList($lb("SELECT","S"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"SELECT")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"S")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  set_command ::= ('set' | 's') [ post_conditional ] set_item_list
/// summary values:SET,S
/// summary=(K|K)&[C]&C
Method SetCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&[C]&C
	if '(..isKeywordInList($lb("SET","S"),.value)) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SetCommand222Sub(.subElement,.addedElement)  {
		if $S(..PostConditional(.subElement,.addedElement) :1,1:1) {
			if ..SetItemList(.subElement,.addedElement)  {
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

/// 'set' | 's'
/// summary values:SET,S
/// summary=K|K
Method SetCommand222Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K|K
	if '(..isKeywordInList($lb("SET","S"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"SET")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"S")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  set_expression ::= expression
/// summary=C
Method SetExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(.subElement,.addedElement)  {
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

///  set_item ::= (( set_value_expression | ('(' set_value_expression ( ',' set_value_expression )* ')' )) '=' set_expression) | simple_indirection
/// summary=((C|(P&C&(?4punctuation:4?)*&P))&P&C)|C
Method SetItem(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ((C|(P&C&(?4punctuation:4?)*&P))&P&C)|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SetItem225Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SimpleIndirection(.subElement,.addedElement)  {
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

/// ( set_value_expression | ('(' set_value_expression ( ',' set_value_expression )* ')' )) '=' set_expression
/// summary=(C|(P&C&(?4punctuation:4?)*&P))&P&C
Method SetItem225Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary (C|(P&C&(?4punctuation:4?)*&P))&P&C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SetItem226Sub(.subElement,.addedElement)  {
		if ..addPunctuation(.subElement,"=")  {
			if ..SetExpression(.subElement,.addedElement)  {
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

///  set_value_expression | ('(' set_value_expression ( ',' set_value_expression )* ')' )
/// summary=C|(P&C&(?4punctuation:4?)*&P)
Method SetItem226Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|(P&C&(?4punctuation:4?)*&P)
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SetValueExpression(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SetItem227Sub(.subElement,.addedElement)  {
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

/// '(' set_value_expression ( ',' set_value_expression )* ')'
/// summary values:(
/// summary=P&C&(?4punctuation:4?)*&P
Method SetItem227Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&(?4punctuation:4?)*&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if ..SetValueExpression(.subElement,.addedElement)  {
			if ..SetItem228RepZero(.subElement,.addedElement)  {
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

///  ( ',' set_value_expression )*
Method SetItem228RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..SetItem229Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' set_value_expression
/// summary values:,
/// summary=P&C
Method SetItem229Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..SetValueExpression(.subElement,.addedElement)  {
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

///  set_item_list ::= set_item ( ',' set_item )*
/// summary=C&(?4punctuation:4?)*
Method SetItemList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SetItem(.subElement,.addedElement)  {
		if ..SetItemList223RepZero(.subElement,.addedElement)  {
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

///  ( ',' set_item )*
Method SetItemList223RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..SetItemList224Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' set_item
/// summary values:,
/// summary=P&C
Method SetItemList224Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..SetItem(.subElement,.addedElement)  {
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

///  set_item_single ::= lvalue_expression
/// summary=C
Method SetItemSingle(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LvalueExpression(.subElement,.addedElement)  {
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

///  set_item_single_list ::= set_item_single ( ',' set_item_single )*
/// summary=C&(?4punctuation:4?)*
Method SetItemSingleList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SetItemSingle(.subElement,.addedElement)  {
		if ..SetItemSingleList230RepZero(.subElement,.addedElement)  {
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

///  ( ',' set_item_single )*
Method SetItemSingleList230RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..SetItemSingleList231Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' set_item_single
/// summary values:,
/// summary=P&C
Method SetItemSingleList231Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..SetItemSingle(.subElement,.addedElement)  {
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

///  set_item_varlist ::= '(' set_item_single_list ')'
/// summary values:(
/// summary=P&C&P
Method SetItemVarlist(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if ..SetItemSingleList(.subElement,.addedElement)  {
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

///  set_value_expression ::= this_object_set | variable_set | macrocall | Indirection | global_ref_set | intrinsicfncall_set | special_variable | ( '(' set_value_expression ')' [ object_chain ] )
/// summary=C|C|C|C|C|C|C|(P&C&P&[C])
Method SetValueExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C|C|C|C|C|C|(P&C&P&[C])
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ThisObjectSet(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..VariableSet(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Macrocall(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Indirection(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..GlobalRefSet(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..IntrinsicfncallSet(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SpecialVariable(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SetValueExpression232Sub(.subElement,.addedElement)  {
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

///  '(' set_value_expression ')' [ object_chain ]
/// summary values:(
/// summary=P&C&P&[C]
Method SetValueExpression232Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&P&[C]
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if ..SetValueExpression(.subElement,.addedElement)  {
			if ..addPunctuation(.subElement,")")  {
				if $S(..ObjectChain(.subElement,.addedElement) :1,1:1) {
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

///  Simple_Indirection ::= '@' term
/// summary values:@
/// summary=P&C
Method SimpleIndirection(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle("@",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"@")  {
		if ..Term(.subElement,.addedElement)  {
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

///  special_intrinsic ::= case_function_call | select_function_call | extract_function_call | piece_function_call | order_function_call | listitem_function_call | listupdate_function_call | increment_function_call | method_function_call | classmethod_function_call | zobjmethod_function_call | zobjclassmethod_function_call | text_function_call | query_function_call | bitlogic_function_call | vector_function_call
/// summary=C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C
Method SpecialIntrinsic(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CaseFunctionCall(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SelectFunctionCall(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ExtractFunctionCall(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..PieceFunctionCall(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OrderFunctionCall(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ListitemFunctionCall(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ListupdateFunctionCall(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..IncrementFunctionCall(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..MethodFunctionCall(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ClassmethodFunctionCall(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ZobjmethodFunctionCall(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ZobjclassmethodFunctionCall(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..TextFunctionCall(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..QueryFunctionCall(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..BitlogicFunctionCall(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..VectorFunctionCall(.subElement,.addedElement)  {
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

///  special_intrinsic_set ::= extract_function_call_set | piece_function_call_set | listitem_function_call_set | listbuild_function_call_set | vector_function_call_set | mv_function_set
/// summary=C|C|C|C|C|C
Method SpecialIntrinsicSet(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C|C|C|C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ExtractFunctionCallSet(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..PieceFunctionCallSet(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ListitemFunctionCallSet(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ListbuildFunctionCallSet(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..VectorFunctionCallSet(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..MvFunctionSet(.subElement,.addedElement)  {
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

///  special_variable ::= '$' ('DEVICE' | 'ECODE' | 'EC' | 'ESTACK' | 'ES' | 'ETRAP' | 'ET' | 'HALT' | 'HOROLOG' | 'H' | 'IO' | 'I' | 'JOB' | 'J' | 'KEY' | 'MNV' | 'NAMESPACE' | 'PRINCIPAL' | 'P' | 'QUIT' | 'Q' | 'ROLES' | 'STACK' | 'STORAGE' | python_import | ('SYSTEM' [ object_chain ]) | 'SY' | 'S' | 'TEST' | 'THIS' | 'THROWOBJ' | 'TLEVEL' | 'Tl' | 'T' | 'USERNAME' | 'X' | 'Y' | 'ZA' | 'ZB' | 'ZCHILD' | 'ZEOF' | 'ZEOS' | 'ZERROR' | 'ZE' | 'ZHOROLOG' | 'ZH' | 'ZIO' | 'ZJOB' | 'ZMODE' | 'ZNAME' | 'ZNSPACE' | 'ZN' | 'ZORDER' | 'ZPARENT' | 'ZPI' | 'ZPOS' | 'ZREFERENCE' | 'ZR' | 'ZSTORAGE' | 'ZS' | 'ZTIMESTAMP' | 'ZTS' | 'ZTIMEZONE' | 'ZTRAP' | 'ZT' | 'ZUTIL' | 'ZU' | 'ZVERSION' | 'ZV' | 'MVAM' | 'MVNV' | 'MVNAM' | 'MVANS' | 'MVCOMMAND' | 'MVCONV' | 'MVDATE' | 'MVDAY' | 'MVDICT' | 'MVFILENAME' | 'MVFM' | 'MVFM' | 'MVFORMAT' | 'MVHEADER' | 'MVID' | 'MVLEVEL' | 'MVMONTH' | 'MVNB' | 'MVND' | 'MVNI' | 'MVNS' | 'MVPARASENTENCE' | 'MVRECORD' | 'MVSELECTED' | 'MVSENTENCE' | 'MVSM' | 'MVSTDFIL' | 'MVSVM' | 'MVSYSRETCODE' | 'MVTIME' |'MVTM' | 'MVTTY' | 'MVUSERRETCODE' | 'MVVM' | 'MVYEAR' | 'MVERRORS' | 'MVFOOTER' | 'MVMORESUBVALUES' | 'MVMOREVALUES' | 'MVOPTIONS' | 'MVPROCERRORS' | 'MVPROCNAME' | 'MVPROCPIB' | 'MVPROCPIBOFF' | 'MVPROCPOB' | 'MVPROCSIB' | 'MVPROCSIBOFF' | 'MVPROCSOB' )
/// summary values:$
/// summary=P&(K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|C|(K&[C])|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K)
Method SpecialVariable(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&(K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|C|(K&[C])|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K)
	; first rule summary P
	if '(..isStringSingle("$",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"$")  {
		if ..SpecialVariable102Sub(.subElement,.addedElement)  {
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

/// 'DEVICE' | 'ECODE' | 'EC' | 'ESTACK' | 'ES' | 'ETRAP' | 'ET' | 'HALT' | 'HOROLOG' | 'H' | 'IO' | 'I' | 'JOB' | 'J' | 'KEY' | 'MNV' | 'NAMESPACE' | 'PRINCIPAL' | 'P' | 'QUIT' | 'Q' | 'ROLES' | 'STACK' | 'STORAGE' | python_import | ('SYSTEM' [ object_chain ]) | 'SY' | 'S' | 'TEST' | 'THIS' | 'THROWOBJ' | 'TLEVEL' | 'Tl' | 'T' | 'USERNAME' | 'X' | 'Y' | 'ZA' | 'ZB' | 'ZCHILD' | 'ZEOF' | 'ZEOS' | 'ZERROR' | 'ZE' | 'ZHOROLOG' | 'ZH' | 'ZIO' | 'ZJOB' | 'ZMODE' | 'ZNAME' | 'ZNSPACE' | 'ZN' | 'ZORDER' | 'ZPARENT' | 'ZPI' | 'ZPOS' | 'ZREFERENCE' | 'ZR' | 'ZSTORAGE' | 'ZS' | 'ZTIMESTAMP' | 'ZTS' | 'ZTIMEZONE' | 'ZTRAP' | 'ZT' | 'ZUTIL' | 'ZU' | 'ZVERSION' | 'ZV' | 'MVAM' | 'MVNV' | 'MVNAM' | 'MVANS' | 'MVCOMMAND' | 'MVCONV' | 'MVDATE' | 'MVDAY' | 'MVDICT' | 'MVFILENAME' | 'MVFM' | 'MVFM' | 'MVFORMAT' | 'MVHEADER' | 'MVID' | 'MVLEVEL' | 'MVMONTH' | 'MVNB' | 'MVND' | 'MVNI' | 'MVNS' | 'MVPARASENTENCE' | 'MVRECORD' | 'MVSELECTED' | 'MVSENTENCE' | 'MVSM' | 'MVSTDFIL' | 'MVSVM' | 'MVSYSRETCODE' | 'MVTIME' |'MVTM' | 'MVTTY' | 'MVUSERRETCODE' | 'MVVM' | 'MVYEAR' | 'MVERRORS' | 'MVFOOTER' | 'MVMORESUBVALUES' | 'MVMOREVALUES' | 'MVOPTIONS' | 'MVPROCERRORS' | 'MVPROCNAME' | 'MVPROCPIB' | 'MVPROCPIBOFF' | 'MVPROCPOB' | 'MVPROCSIB' | 'MVPROCSIBOFF' | 'MVPROCSOB'
/// summary=K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|C|(K&[C])|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K
Method SpecialVariable102Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|C|(K&[C])|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"DEVICE")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"ECODE")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"EC")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"ESTACK")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"ES")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"ETRAP")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"ET")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"HALT")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"HOROLOG")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"H")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"IO")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"I")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"JOB")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"J")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"KEY")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"MNV")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"NAMESPACE")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"PRINCIPAL")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"P")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"QUIT")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"Q")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"ROLES")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"STACK")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"STORAGE")  {
		set done=1 ; or
	} elseif ..PythonImport(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SpecialVariable103Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"SY")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"S")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"TEST")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"THIS")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"THROWOBJ")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"TLEVEL")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"TL")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"T")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"USERNAME")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"X")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"Y")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"ZA")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"ZB")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"ZCHILD")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"ZEOF")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"ZEOS")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"ZERROR")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"ZE")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"ZHOROLOG")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"ZH")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"ZIO")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"ZJOB")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"ZMODE")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"ZNAME")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"ZNSPACE")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"ZN")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"ZORDER")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"ZPARENT")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"ZPI")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"ZPOS")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"ZREFERENCE")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"ZR")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"ZSTORAGE")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"ZS")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"ZTIMESTAMP")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"ZTS")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"ZTIMEZONE")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"ZTRAP")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"ZT")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"ZUTIL")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"ZU")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"ZVERSION")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"ZV")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"MVAM")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"MVNV")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"MVNAM")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"MVANS")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"MVCOMMAND")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"MVCONV")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"MVDATE")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"MVDAY")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"MVDICT")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"MVFILENAME")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"MVFM")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"MVFM")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"MVFORMAT")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"MVHEADER")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"MVID")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"MVLEVEL")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"MVMONTH")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"MVNB")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"MVND")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"MVNI")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"MVNS")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"MVPARASENTENCE")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"MVRECORD")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"MVSELECTED")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"MVSENTENCE")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"MVSM")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"MVSTDFIL")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"MVSVM")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"MVSYSRETCODE")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"MVTIME")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"MVTM")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"MVTTY")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"MVUSERRETCODE")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"MVVM")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"MVYEAR")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"MVERRORS")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"MVFOOTER")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"MVMORESUBVALUES")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"MVMOREVALUES")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"MVOPTIONS")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"MVPROCERRORS")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"MVPROCNAME")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"MVPROCPIB")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"MVPROCPIBOFF")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"MVPROCPOB")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"MVPROCSIB")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"MVPROCSIBOFF")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"MVPROCSOB")  {
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

/// 'SYSTEM' [ object_chain ]
/// summary values:SYSTEM
/// summary=K&[C]
Method SpecialVariable103Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&[C]
	if '(..isKeyword("SYSTEM",.value)) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"SYSTEM")  {
		if $S(..ObjectChain(.subElement,.addedElement) :1,1:1) {
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

///  sql_body ::= 'NEED SQL BODY'
/// summary values:NEED SQL BODY
/// summary=P
Method SqlBody(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("NEED SQL BODY",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"NEED SQL BODY")  {
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

///  sql_command ::= ('&sql(' sql_body ')') | ('&sqlcq(' sql_body ')qc')
/// summary=(P&C&P)|(P&C&P)
Method SqlCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (P&C&P)|(P&C&P)
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SqlCommand318Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlCommand319Sub(.subElement,.addedElement)  {
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

/// '&sql(' sql_body ')'
/// summary values:&SQL(
/// summary=P&C&P
Method SqlCommand318Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&P
	; first rule summary P
	if '(..isStringSingle("&SQL(",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"&sql(")  {
		if ..SqlBody(.subElement,.addedElement)  {
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

/// '&sqlcq(' sql_body ')qc'
/// summary values:&SQLCQ(
/// summary=P&C&P
Method SqlCommand319Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&P
	; first rule summary P
	if '(..isStringSingle("&SQLCQ(",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"&sqlcq(")  {
		if ..SqlBody(.subElement,.addedElement)  {
			if ..addPunctuation(.subElement,")qc")  {
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

///  star_parameter ::= ('*' [expression]) | expression
/// summary=(P&[C])|C
Method StarParameter(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (P&[C])|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..StarParameter377Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Expression(.subElement,.addedElement)  {
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

/// '*' [expression]
/// summary values:*
/// summary=P&[C]
Method StarParameter377Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&[C]
	; first rule summary P
	if '(..isStringSingle("*",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"*")  {
		if $S(..Expression(.subElement,.addedElement) :1,1:1) {
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
	} elseif ..String116Sub(.subElement,.addedElement)  {
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
Method String116Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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

///  sub_expression ::= '(' expression ')'
/// summary values:(
/// summary=P&C&P
Method SubExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if ..Expression(.subElement,.addedElement)  {
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

///  Subscript_Indirection ::= '@' term '@' subscript_parameter_list
/// summary values:@
/// summary=P&C&P&C
Method SubscriptIndirection(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&P&C
	; first rule summary P
	if '(..isStringSingle("@",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"@")  {
		if ..Term(.subElement,.addedElement)  {
			if ..addPunctuation(.subElement,"@")  {
				if ..SubscriptParameterList(.subElement,.addedElement)  {
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

///  subscript_parameter_list ::= '(' expression ( ',' expression )* ')'
/// summary values:(
/// summary=P&C&(?4punctuation:4?)*&P
Method SubscriptParameterList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&(?4punctuation:4?)*&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if ..Expression(.subElement,.addedElement)  {
			if ..SubscriptParameterList93RepZero(.subElement,.addedElement)  {
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

///  ( ',' expression )*
Method SubscriptParameterList93RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..SubscriptParameterList94Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' expression
/// summary values:,
/// summary=P&C
Method SubscriptParameterList94Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..Expression(.subElement,.addedElement)  {
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

///  super_expression ::= '##super' function_parameter_list
/// summary values:##SUPER
/// summary=P&C
Method SuperExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle("##SUPER",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"##super")  {
		if ..FunctionParameterList(.subElement,.addedElement)  {
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

///  system_object ::='$system.' object_chain_item [ object_chain ]
/// summary values:$SYSTEM.
/// summary=P&C&[C]
Method SystemObject(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&[C]
	; first rule summary P
	if '(..isStringSingle("$SYSTEM.",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"$system.")  {
		if ..ObjectChainItem(.subElement,.addedElement)  {
			if $S(..ObjectChain(.subElement,.addedElement) :1,1:1) {
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

///  tcommit_command ::= ('tcommit' | 'tc') [ post_conditional ]
/// summary values:TCOMMIT,TC
/// summary=(K|K)&[C]
Method TcommitCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&[C]
	if '(..isKeywordInList($lb("TCOMMIT","TC"),.value)) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..TcommitCommand233Sub(.subElement,.addedElement)  {
		if $S(..PostConditional(.subElement,.addedElement) :1,1:1) {
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

/// 'tcommit' | 'tc'
/// summary values:TCOMMIT,TC
/// summary=K|K
Method TcommitCommand233Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K|K
	if '(..isKeywordInList($lb("TCOMMIT","TC"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"TCOMMIT")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"TC")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  term ::= primary
/// summary=C
Method Term(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Primary(.subElement,.addedElement)  {
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

///  text_function_call ::= ('text' | 't') open_bracket text_label_reference close_bracket
/// summary values:TEXT,T
/// summary=(K|K)&C&C&C
Method TextFunctionCall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&C&C&C
	if '(..isKeywordInList($lb("TEXT","T"),.value)) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..TextFunctionCall364Sub(.subElement,.addedElement)  {
		if ..OpenBracket(.subElement,.addedElement)  {
			if ..TextLabelReference(.subElement,.addedElement)  {
				if ..CloseBracket(.subElement,.addedElement)  {
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

/// 'text' | 't'
/// summary values:TEXT,T
/// summary=K|K
Method TextFunctionCall364Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K|K
	if '(..isKeywordInList($lb("TEXT","T"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"TEXT")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"T")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  text_label_reference ::= (( (label_identifier [ '+' expression ]) | ('+' expression) | simple_indirection ) [ '^' [routine_env] ( routine_identifier | simple_indirection) ]) | ('^' [routine_env] (routine_identifier | simple_indirection) )
/// summary=(((C&[P&C])|(P&C)|C)&[P&[C]&(C|C)])|(P&[C]&(C|C))
Method TextLabelReference(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (((C&[P&C])|(P&C)|C)&[P&[C]&(C|C)])|(P&[C]&(C|C))
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..TextLabelReference365Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..TextLabelReference372Sub(.subElement,.addedElement)  {
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

/// ( (label_identifier [ '+' expression ]) | ('+' expression) | simple_indirection ) [ '^' [routine_env] ( routine_identifier | simple_indirection) ]
/// summary=((C&[P&C])|(P&C)|C)&[P&[C]&(C|C)]
Method TextLabelReference365Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ((C&[P&C])|(P&C)|C)&[P&[C]&(C|C)]
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..TextLabelReference366Sub(.subElement,.addedElement)  {
		if ..TextLabelReference370OptGrp(.subElement,.addedElement)  {
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

///  (label_identifier [ '+' expression ]) | ('+' expression) | simple_indirection
/// summary=(C&[P&C])|(P&C)|C
Method TextLabelReference366Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary (C&[P&C])|(P&C)|C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..TextLabelReference367Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..TextLabelReference369Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SimpleIndirection(.subElement,.addedElement)  {
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

/// label_identifier [ '+' expression ]
/// summary=C&[P&C]
Method TextLabelReference367Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&[P&C]
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LabelIdentifier(.subElement,.addedElement)  {
		if ..TextLabelReference368OptGrp(.subElement,.addedElement)  {
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
/// summary values:+
/// summary=P&C
Method TextLabelReference368OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle("+",.value)) { quit 1 /* not found is OK */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"+")  {
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

/// '+' expression
/// summary values:+
/// summary=P&C
Method TextLabelReference369Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle("+",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"+")  {
		if ..Expression(.subElement,.addedElement)  {
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
/// summary values:^
/// summary=P&[C]&(C|C)
Method TextLabelReference370OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&[C]&(C|C)
	; first rule summary P
	if '(..isStringSingle("^",.value)) { quit 1 /* not found is OK */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"^")  {
		if $S(..RoutineEnv(.subElement,.addedElement) :1,1:1) {
			if ..TextLabelReference371Sub(.subElement,.addedElement)  {
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

///  routine_identifier | simple_indirection
/// summary=C|C
Method TextLabelReference371Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..RoutineIdentifier(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SimpleIndirection(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

/// '^' [routine_env] (routine_identifier | simple_indirection)
/// summary values:^
/// summary=P&[C]&(C|C)
Method TextLabelReference372Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&[C]&(C|C)
	; first rule summary P
	if '(..isStringSingle("^",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"^")  {
		if $S(..RoutineEnv(.subElement,.addedElement) :1,1:1) {
			if ..TextLabelReference373Sub(.subElement,.addedElement)  {
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

/// routine_identifier | simple_indirection
/// summary=C|C
Method TextLabelReference373Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..RoutineIdentifier(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SimpleIndirection(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  text_to_eol ::= 'regexp:[^\r\n]*'
/// summary=R
Method TextToEol(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary R
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..addRegex(.subElement,"[^\r\n]*")  {
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

///  text_to_eol_continue ::= 'regexp:[^\r\n]*'
/// summary=R
Method TextToEolContinue(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary R
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..addRegex(.subElement,"[^\r\n]*")  {
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

///  then_block ::= ( '{' [ cos_code_block ] '}' ) | command_list_eol
/// summary=(P&[C]&P)|C
Method ThenBlock(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (P&[C]&P)|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ThenBlock157Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CommandListEol(.subElement,.addedElement)  {
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

///  '{' [ cos_code_block ] '}'
/// summary values:{
/// summary=P&[C]&P
Method ThenBlock157Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&[C]&P
	; first rule summary P
	if '(..isStringSingle("{",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"{")  {
		if $S(..CosCodeBlock(.subElement,.addedElement) :1,1:1) {
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

///  this_object ::= this_object_self | this_object_this
/// summary=C|C
Method ThisObject(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ThisObjectSelf(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ThisObjectThis(.subElement,.addedElement)  {
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

///  this_object_direct_property ::= 'i%' object_chain_item
/// summary values:I%
/// summary=P&C
Method ThisObjectDirectProperty(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle("I%",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"i%")  {
		if ..ObjectChainItem(.subElement,.addedElement)  {
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

///  this_object_self ::= ('..' | 'i%' | 'r%' | 'm%' | 's%') [object_chain_no_dot]
/// summary=(P|P|P|P|P)&[C]
Method ThisObjectSelf(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (P|P|P|P|P)&[C]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ThisObjectSelf91Sub(.subElement,.addedElement)  {
		if $S(..ObjectChainNoDot(.subElement,.addedElement) :1,1:1) {
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

/// '..' | 'i%' | 'r%' | 'm%' | 's%'
/// summary values:..,I%,R%,M%,S%
/// summary=P|P|P|P|P
Method ThisObjectSelf91Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P|P|P|P|P
	if '(..isStringInList($lb("..","I%","R%","M%","S%"),2,.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addPunctuation(.subElement,"..")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"i%")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"r%")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"m%")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"s%")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  this_object_set ::= this_object_self | this_object_this
/// summary=C|C
Method ThisObjectSet(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ThisObjectSelf(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ThisObjectThis(.subElement,.addedElement)  {
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

///  this_object_this ::= ('$this' | '##this') [ object_chain]
/// summary=(P|P)&[C]
Method ThisObjectThis(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (P|P)&[C]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ThisObjectThis92Sub(.subElement,.addedElement)  {
		if $S(..ObjectChain(.subElement,.addedElement) :1,1:1) {
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

/// '$this' | '##this'
/// summary values:$THIS,##THIS
/// summary=P|P
Method ThisObjectThis92Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P|P
	if '(..isStringInList($lb("$THIS","##THIS"),6,.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addPunctuation(.subElement,"$this")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"##this")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  throw_command ::= 'throw' [ post_conditional ] [ naked | expression ]
/// summary values:THROW
/// summary=K&[C]&[C|C]
Method ThrowCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&[C]&[C|C]
	if '(..isKeyword("THROW",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"THROW")  {
		if $S(..PostConditional(.subElement,.addedElement) :1,1:1) {
			if ..ThrowCommand234OptGrp(.subElement,.addedElement)  {
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
Method ThrowCommand234OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..Naked(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Expression(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=1 /* failure rollsback but returns OK */
	}
	quit ok
}

///  trollback_command ::= 'trollback' [ post_conditional ] [ '1' ]
/// summary values:TROLLBACK
/// summary=K&[C]&[P]
Method TrollbackCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&[C]&[P]
	if '(..isKeyword("TROLLBACK",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"TROLLBACK")  {
		if $S(..PostConditional(.subElement,.addedElement) :1,1:1) {
			if $S(..addPunctuation(.subElement,"1") :1,1:1) {
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

///  try_command ::= 'try' '{' [ cos_code_block ] '}' (cos_directive)* 'catch' [ variable | ( '(' variable ')' ) ] '{' [ cos_code_block ] '}'
/// summary values:TRY
/// summary=K&P&[C]&P&(?4punctuation:4?)*&K&[C|(P&C&P)]&P&[C]&P
Method TryCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&[C]&P&(?4punctuation:4?)*&K&[C|(P&C&P)]&P&[C]&P
	if '(..isKeyword("TRY",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"TRY")  {
		if ..addPunctuation(.subElement,"{")  {
			if $S(..CosCodeBlock(.subElement,.addedElement) :1,1:1) {
				if ..addPunctuation(.subElement,"}")  {
					if ..TryCommand235RepZero(.subElement,.addedElement)  {
						if ..addKeyword(.subElement,"CATCH")  {
							if ..TryCommand237OptGrp(.subElement,.addedElement)  {
								if ..addPunctuation(.subElement,"{")  {
									if $S(..CosCodeBlock(.subElement,.addedElement) :1,1:1) {
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

///  (cos_directive)*
Method TryCommand235RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..TryCommand236Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// cos_directive
/// summary=C
Method TryCommand236Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C
	set subElement=ParentElement
	set done=0 ; method start
	if ..CosDirective(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

/// 
/// summary=C|(P&C&P)
Method TryCommand237OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|(P&C&P)
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Variable(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..TryCommand238Sub(.subElement,.addedElement)  {
		set done=1 ; end compileRules
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

///  '(' variable ')'
/// summary values:(
/// summary=P&C&P
Method TryCommand238Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if ..Variable(.subElement,.addedElement)  {
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

///  tstart_command ::= ('tstart' | 'ts' ) [ post_conditional ]
/// summary values:TSTART,TS
/// summary=(K|K)&[C]
Method TstartCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&[C]
	if '(..isKeywordInList($lb("TSTART","TS"),.value)) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..TstartCommand239Sub(.subElement,.addedElement)  {
		if $S(..PostConditional(.subElement,.addedElement) :1,1:1) {
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

/// 'tstart' | 'ts'
/// summary values:TSTART,TS
/// summary=K|K
Method TstartCommand239Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K|K
	if '(..isKeywordInList($lb("TSTART","TS"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"TSTART")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"TS")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  use_arguments ::= one_use_argument ( ',' one_use_argument )*
/// summary=C&(?4punctuation:4?)*
Method UseArguments(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OneUseArgument(.subElement,.addedElement)  {
		if ..UseArguments241RepZero(.subElement,.addedElement)  {
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

///  ( ',' one_use_argument )*
Method UseArguments241RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..UseArguments242Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' one_use_argument
/// summary values:,
/// summary=P&C
Method UseArguments242Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..OneUseArgument(.subElement,.addedElement)  {
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

///  use_command ::= ('use' | 'u') [ post_conditional ] use_arguments
/// summary values:USE,U
/// summary=(K|K)&[C]&C
Method UseCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&[C]&C
	if '(..isKeywordInList($lb("USE","U"),.value)) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..UseCommand240Sub(.subElement,.addedElement)  {
		if $S(..PostConditional(.subElement,.addedElement) :1,1:1) {
			if ..UseArguments(.subElement,.addedElement)  {
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

/// 'use' | 'u'
/// summary values:USE,U
/// summary=K|K
Method UseCommand240Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K|K
	if '(..isKeywordInList($lb("USE","U"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"USE")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"U")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  use_device ::= expression
/// summary=C
Method UseDevice(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(.subElement,.addedElement)  {
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

///  use_device_parameters ::= [one_use_device_parameter] ( ':' [one_use_device_parameter] )*
/// summary=[C]&(?4punctuation:4?)*
Method UseDeviceParameters(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary [C]&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..OneUseDeviceParameter(.subElement,.addedElement) :1,1:1) {
		if ..UseDeviceParameters246RepZero(.subElement,.addedElement)  {
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

///  ( ':' [one_use_device_parameter] )*
Method UseDeviceParameters246RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..UseDeviceParameters247Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ':' [one_use_device_parameter]
/// summary values::
/// summary=P&[C]
Method UseDeviceParameters247Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&[C]
	; first rule summary P
	if '(..isStringSingle(":",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,":")  {
		if $S(..OneUseDeviceParameter(.subElement,.addedElement) :1,1:1) {
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

///  use_device_parameters_inbrackets ::= '(' use_device_parameters ')'
/// summary values:(
/// summary=P&C&P
Method UseDeviceParametersInbrackets(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if ..UseDeviceParameters(.subElement,.addedElement)  {
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

///  use_mnemonic_space ::= expression
/// summary=C
Method UseMnemonicSpace(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(.subElement,.addedElement)  {
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

///  variable ::= variable_identifier [ array_parameter_list ] [ object_chain ]
/// summary=C&[C]&[C]
Method Variable(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&[C]&[C]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..VariableIdentifier(.subElement,.addedElement)  {
		if $S(..ArrayParameterList(.subElement,.addedElement) :1,1:1) {
			if $S(..ObjectChain(.subElement,.addedElement) :1,1:1) {
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

///  variable_identifier_pattern ::= (['%'] | '?1A') '?AN'
/// summary=([P]|P)&P
Method VariableIdentifierPattern(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ([P]|P)&P
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..VariableIdentifierPattern104Sub(.subElement,.addedElement)  {
		if ..addPunctuation(.subElement,"?AN")  {
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

/// ['%'] | '?1A'
/// summary=[P]|P
Method VariableIdentifierPattern104Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary [P]|P
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..addPunctuation(.subElement,"%") :1,1:1) {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"?1A")  {
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

///  variable_set ::= variable_identifier [ array_parameter_list ] [ object_chain ]
/// summary=C&[C]&[C]
Method VariableSet(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&[C]&[C]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..VariableIdentifier(.subElement,.addedElement)  {
		if $S(..ArrayParameterList(.subElement,.addedElement) :1,1:1) {
			if $S(..ObjectChain(.subElement,.addedElement) :1,1:1) {
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

///  vector_function_call ::= 'vector' open_bracket expression [ ',' star_parameter [ ',' star_parameter ] ] close_bracket
/// summary values:VECTOR
/// summary=K&C&C&[P&C&[P&C]]&C
Method VectorFunctionCall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C&C&[P&C&[P&C]]&C
	if '(..isKeyword("VECTOR",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"VECTOR")  {
		if ..OpenBracket(.subElement,.addedElement)  {
			if ..Expression(.subElement,.addedElement)  {
				if ..VectorFunctionCall359OptGrp(.subElement,.addedElement)  {
					if ..CloseBracket(.subElement,.addedElement)  {
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
/// summary values:,
/// summary=P&C&[P&C]
Method VectorFunctionCall359OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&[P&C]
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 1 /* not found is OK */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..StarParameter(.subElement,.addedElement)  {
			if ..VectorFunctionCall360OptGrp(.subElement,.addedElement)  {
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
/// summary values:,
/// summary=P&C
Method VectorFunctionCall360OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 1 /* not found is OK */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..StarParameter(.subElement,.addedElement)  {
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

///  vector_function_call_set ::= 'vector' open_bracket set_value_expression ',' expression ',' expression close_bracket
/// summary values:VECTOR
/// summary=K&C&C&P&C&P&C&C
Method VectorFunctionCallSet(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C&C&P&C&P&C&C
	if '(..isKeyword("VECTOR",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"VECTOR")  {
		if ..OpenBracket(.subElement,.addedElement)  {
			if ..SetValueExpression(.subElement,.addedElement)  {
				if ..addPunctuation(.subElement,",")  {
					if ..Expression(.subElement,.addedElement)  {
						if ..addPunctuation(.subElement,",")  {
							if ..Expression(.subElement,.addedElement)  {
								if ..CloseBracket(.subElement,.addedElement)  {
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

///  view_block_form ::= expression
/// summary=C
Method ViewBlockForm(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(.subElement,.addedElement)  {
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

///  view_command ::= ('view' | 'v') [ post_conditional ] ( view_offset_form | view_block_form )
/// summary values:VIEW,V
/// summary=(K|K)&[C]&(C|C)
Method ViewCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&[C]&(C|C)
	if '(..isKeywordInList($lb("VIEW","V"),.value)) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ViewCommand250Sub(.subElement,.addedElement)  {
		if $S(..PostConditional(.subElement,.addedElement) :1,1:1) {
			if ..ViewCommand251Sub(.subElement,.addedElement)  {
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

/// 'view' | 'v'
/// summary values:VIEW,V
/// summary=K|K
Method ViewCommand250Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K|K
	if '(..isKeywordInList($lb("VIEW","V"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"VIEW")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"V")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  view_offset_form | view_block_form
/// summary=C|C
Method ViewCommand251Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..ViewOffsetForm(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ViewBlockForm(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  view_length ::= expression
/// summary=C
Method ViewLength(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(.subElement,.addedElement)  {
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

///  view_mode ::= expression
/// summary=C
Method ViewMode(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(.subElement,.addedElement)  {
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

///  view_newvalue ::= expression
/// summary=C
Method ViewNewvalue(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(.subElement,.addedElement)  {
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

///  view_offset ::= expression
/// summary=C
Method ViewOffset(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(.subElement,.addedElement)  {
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

///  view_offset_form ::= view_offset ':' view_mode ':' view_length ':' view_newvalue
/// summary=C&P&C&P&C&P&C
Method ViewOffsetForm(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&P&C&P&C&P&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ViewOffset(.subElement,.addedElement)  {
		if ..addPunctuation(.subElement,":")  {
			if ..ViewMode(.subElement,.addedElement)  {
				if ..addPunctuation(.subElement,":")  {
					if ..ViewLength(.subElement,.addedElement)  {
						if ..addPunctuation(.subElement,":")  {
							if ..ViewNewvalue(.subElement,.addedElement)  {
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

///  while_command ::= 'while' expression_list '{' [ cos_code_block ] '}'
/// summary values:WHILE
/// summary=K&C&P&[C]&P
Method WhileCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C&P&[C]&P
	if '(..isKeyword("WHILE",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"WHILE")  {
		if ..ExpressionList(.subElement,.addedElement)  {
			if ..addPunctuation(.subElement,"{")  {
				if $S(..CosCodeBlock(.subElement,.addedElement) :1,1:1) {
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

///  write_argument_list ::= one_write_argument ( ',' one_write_argument)*
/// summary=C&(?4punctuation:4?)*
Method WriteArgumentList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OneWriteArgument(.subElement,.addedElement)  {
		if ..WriteArgumentList254RepZero(.subElement,.addedElement)  {
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

///  ( ',' one_write_argument)*
Method WriteArgumentList254RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..WriteArgumentList255Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' one_write_argument
/// summary values:,
/// summary=P&C
Method WriteArgumentList255Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..OneWriteArgument(.subElement,.addedElement)  {
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

///  write_bang_expression ::= '!'
/// summary values:!
/// summary=P
Method WriteBangExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("!",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"!")  {
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

///  write_command ::= ('write' | 'w') [ post_conditional ] ( naked | write_argument_list )
/// summary values:WRITE,W
/// summary=(K|K)&[C]&(C|C)
Method WriteCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&[C]&(C|C)
	if '(..isKeywordInList($lb("WRITE","W"),.value)) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..WriteCommand252Sub(.subElement,.addedElement)  {
		if $S(..PostConditional(.subElement,.addedElement) :1,1:1) {
			if ..WriteCommand253Sub(.subElement,.addedElement)  {
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

/// 'write' | 'w'
/// summary values:WRITE,W
/// summary=K|K
Method WriteCommand252Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K|K
	if '(..isKeywordInList($lb("WRITE","W"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"WRITE")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"W")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  naked | write_argument_list
/// summary=C|C
Method WriteCommand253Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..Naked(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..WriteArgumentList(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  write_control_expression ::= write_format_expression | write_device_expression | write_escape_expression
/// summary=C|C|C
Method WriteControlExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..WriteFormatExpression(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..WriteDeviceExpression(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..WriteEscapeExpression(.subElement,.addedElement)  {
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

///  write_control_expression_list ::= write_control_expression (write_control_expression)*
/// summary=C&(?4punctuation:4?)*
Method WriteControlExpressionList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..WriteControlExpression(.subElement,.addedElement)  {
		if ..WriteControlExpressionList256RepZero(.subElement,.addedElement)  {
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

///  (write_control_expression)*
Method WriteControlExpressionList256RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..WriteControlExpressionList257Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// write_control_expression
/// summary=C
Method WriteControlExpressionList257Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C
	set subElement=ParentElement
	set done=0 ; method start
	if ..WriteControlExpression(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  write_device_expression ::= '*-' expression
/// summary values:*-
/// summary=P&C
Method WriteDeviceExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle("*-",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"*-")  {
		if ..Expression(.subElement,.addedElement)  {
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

///  write_escape_expression ::= '*' expression
/// summary values:*
/// summary=P&C
Method WriteEscapeExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle("*",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"*")  {
		if ..Expression(.subElement,.addedElement)  {
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

///  write_format_expression ::= write_bang_expression | write_hash_expression | write_pos_expression | write_mnemonic_expression
/// summary=C|C|C|C
Method WriteFormatExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C|C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..WriteBangExpression(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..WriteHashExpression(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..WritePosExpression(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..WriteMnemonicExpression(.subElement,.addedElement)  {
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

///  write_hash_expression ::= '#'
/// summary values:#
/// summary=P
Method WriteHashExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("#",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"#")  {
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

///  write_mnemonic_expression ::= '/' identifier [ '(' mnemonic_arguments* ')' ]
/// summary values:/
/// summary=P&C&[P&(?4Call:4?)*&P]
Method WriteMnemonicExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&[P&(?4Call:4?)*&P]
	; first rule summary P
	if '(..isStringSingle("/",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"/")  {
		if ..Identifier(.subElement,.addedElement)  {
			if ..WriteMnemonicExpression258OptGrp(.subElement,.addedElement)  {
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
/// summary values:(
/// summary=P&(?4Call:4?)*&P
Method WriteMnemonicExpression258OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&(?4Call:4?)*&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 1 /* not found is OK */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if ..WriteMnemonicExpression259RepZero(.subElement,.addedElement)  {
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

///  mnemonic_arguments*
Method WriteMnemonicExpression259RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4Call:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..MnemonicArguments(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  write_pos_expression ::= '?' expression
/// summary values:?
/// summary=P&C
Method WritePosExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle("?",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"?")  {
		if ..Expression(.subElement,.addedElement)  {
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

///  xecute_arg_no_params ::= xecute_command_text
/// summary=C
Method XecuteArgNoParams(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XecuteCommandText(.subElement,.addedElement)  {
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

///  xecute_arg_with_params ::= '(' xecute_command_text ',' xecute_param_list ')'
/// summary values:(
/// summary=P&C&P&C&P
Method XecuteArgWithParams(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&P&C&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if ..XecuteCommandText(.subElement,.addedElement)  {
			if ..addPunctuation(.subElement,",")  {
				if ..XecuteParamList(.subElement,.addedElement)  {
					if ..addPunctuation(.subElement,")")  {
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

///  xecute_args ::= one_xecute_arg ( ',' one_xecute_arg )*
/// summary=C&(?4punctuation:4?)*
Method XecuteArgs(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OneXecuteArg(.subElement,.addedElement)  {
		if ..XecuteArgs276RepZero(.subElement,.addedElement)  {
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

///  ( ',' one_xecute_arg )*
Method XecuteArgs276RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..XecuteArgs277Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' one_xecute_arg
/// summary values:,
/// summary=P&C
Method XecuteArgs277Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..OneXecuteArg(.subElement,.addedElement)  {
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

///  xecute_command ::= ( 'xecute' | 'x') [ post_conditional ] xecute_args
/// summary values:XECUTE,X
/// summary=(K|K)&[C]&C
Method XecuteCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&[C]&C
	if '(..isKeywordInList($lb("XECUTE","X"),.value)) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XecuteCommand275Sub(.subElement,.addedElement)  {
		if $S(..PostConditional(.subElement,.addedElement) :1,1:1) {
			if ..XecuteArgs(.subElement,.addedElement)  {
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

///  'xecute' | 'x'
/// summary values:XECUTE,X
/// summary=K|K
Method XecuteCommand275Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K|K
	if '(..isKeywordInList($lb("XECUTE","X"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"XECUTE")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"X")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  xecute_command_text ::= expression
/// summary=C
Method XecuteCommandText(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(.subElement,.addedElement)  {
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

///  xecute_param_list ::= xecute_parameter ( ',' xecute_parameter )*
/// summary=C&(?4punctuation:4?)*
Method XecuteParamList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XecuteParameter(.subElement,.addedElement)  {
		if ..XecuteParamList279RepZero(.subElement,.addedElement)  {
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

///  ( ',' xecute_parameter )*
Method XecuteParamList279RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..XecuteParamList280Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' xecute_parameter
/// summary values:,
/// summary=P&C
Method XecuteParamList280Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..XecuteParameter(.subElement,.addedElement)  {
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

///  xecute_parameter ::= ('.' variable ) | expression
/// summary=(P&C)|C
Method XecuteParameter(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (P&C)|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XecuteParameter281Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Expression(.subElement,.addedElement)  {
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

/// '.' variable
/// summary values:.
/// summary=P&C
Method XecuteParameter281Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(".",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,".")  {
		if ..Variable(.subElement,.addedElement)  {
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

///  zallocate_command ::= 'zallocate' [post_conditional ] [ zallocate_parameter ( ',' zallocate_parameter)* ] [ else_block ]
/// summary values:ZALLOCATE
/// summary=K&[C]&[C&(?4punctuation:4?)*]&[C]
Method ZallocateCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&[C]&[C&(?4punctuation:4?)*]&[C]
	if '(..isKeyword("ZALLOCATE",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"ZALLOCATE")  {
		if $S(..PostConditional(.subElement,.addedElement) :1,1:1) {
			if ..ZallocateCommand282OptGrp(.subElement,.addedElement)  {
				if $S(..ElseBlock(.subElement,.addedElement) :1,1:1) {
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
/// summary=C&(?4punctuation:4?)*
Method ZallocateCommand282OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&(?4punctuation:4?)*
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ZallocateParameter(.subElement,.addedElement)  {
		if ..ZallocateCommand283RepZero(.subElement,.addedElement)  {
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

///  ( ',' zallocate_parameter)*
Method ZallocateCommand283RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ZallocateCommand284Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' zallocate_parameter
/// summary values:,
/// summary=P&C
Method ZallocateCommand284Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..ZallocateParameter(.subElement,.addedElement)  {
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

///  zallocate_parameter ::= [ '+' | '-' ] zallocatename_list [ zallocate_timeout ]
/// summary=[P|P]&C&[C]
Method ZallocateParameter(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary [P|P]&C&[C]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ZallocateParameter285OptGrp(.subElement,.addedElement)  {
		if ..ZallocatenameList(.subElement,.addedElement)  {
			if $S(..ZallocateTimeout(.subElement,.addedElement) :1,1:1) {
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
/// summary values:+,-
/// summary=P|P
Method ZallocateParameter285OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P|P
	if '(..isStringInList($lb("+","-"),1,.value)) { quit 1 /* not found is OK */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addPunctuation(.subElement,"+")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"-")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=1 /* failure rollsback but returns OK */
	}
	quit ok
}

///  zallocate_timeout ::= ':' expression
/// summary values::
/// summary=P&C
Method ZallocateTimeout(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(":",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,":")  {
		if ..Expression(.subElement,.addedElement)  {
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

///  zallocate_type ::= '#' '"' ( 'S' | 'E' | 'I' | 'D' )+ '"'
/// summary values:#
/// summary=P&P&(?4punctuation:4?)+&P
Method ZallocateType(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&P&(?4punctuation:4?)+&P
	; first rule summary P
	if '(..isStringSingle("#",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"#")  {
		if ..addPunctuation(.subElement,"""")  {
			if ..ZallocateType288RepOne(.subElement,.addedElement)  {
				if ..addPunctuation(.subElement,"""")  {
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

///  ( 'S' | 'E' | 'I' | 'D' )+
Method ZallocateType288RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..ZallocateType289Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  'S' | 'E' | 'I' | 'D'
/// summary values:S,E,I,D
/// summary=K|K|K|K
Method ZallocateType289Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K|K|K|K
	if '(..isKeywordInList($lb("S","E","I","D"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"S")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"E")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"I")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"D")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  zallocatename ::= text
/// summary=C
Method Zallocatename(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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

///  zallocatename_list ::= one_zallocatename ( ',' one_zallocatename )*
/// summary=C&(?4punctuation:4?)*
Method ZallocatenameList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OneZallocatename(.subElement,.addedElement)  {
		if ..ZallocatenameList286RepZero(.subElement,.addedElement)  {
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

///  ( ',' one_zallocatename )*
Method ZallocatenameList286RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ZallocatenameList287Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' one_zallocatename
/// summary values:,
/// summary=P&C
Method ZallocatenameList287Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..OneZallocatename(.subElement,.addedElement)  {
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

///  zbreak_command ::= ('zbreak' | 'zb') [ post_conditional ] [ (('/' identifier) | '$') [ ':' ( identifier | string ) [ ':' expression [ ':' expression ] ] ] ]
/// summary values:ZBREAK,ZB
/// summary=(K|K)&[C]&[((P&C)|P)&[P&(C|C)&[P&C&[P&C]]]]
Method ZbreakCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&[C]&[((P&C)|P)&[P&(C|C)&[P&C&[P&C]]]]
	if '(..isKeywordInList($lb("ZBREAK","ZB"),.value)) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ZbreakCommand290Sub(.subElement,.addedElement)  {
		if $S(..PostConditional(.subElement,.addedElement) :1,1:1) {
			if ..ZbreakCommand291OptGrp(.subElement,.addedElement)  {
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

/// 'zbreak' | 'zb'
/// summary values:ZBREAK,ZB
/// summary=K|K
Method ZbreakCommand290Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K|K
	if '(..isKeywordInList($lb("ZBREAK","ZB"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"ZBREAK")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"ZB")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

/// 
/// summary=((P&C)|P)&[P&(C|C)&[P&C&[P&C]]]
Method ZbreakCommand291OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ((P&C)|P)&[P&(C|C)&[P&C&[P&C]]]
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ZbreakCommand292Sub(.subElement,.addedElement)  {
		if ..ZbreakCommand294OptGrp(.subElement,.addedElement)  {
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

/// ('/' identifier) | '$'
/// summary=(P&C)|P
Method ZbreakCommand292Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary (P&C)|P
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ZbreakCommand293Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"$")  {
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

/// '/' identifier
/// summary values:/
/// summary=P&C
Method ZbreakCommand293Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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

/// 
/// summary values::
/// summary=P&(C|C)&[P&C&[P&C]]
Method ZbreakCommand294OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&(C|C)&[P&C&[P&C]]
	; first rule summary P
	if '(..isStringSingle(":",.value)) { quit 1 /* not found is OK */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,":")  {
		if ..ZbreakCommand295Sub(.subElement,.addedElement)  {
			if ..ZbreakCommand296OptGrp(.subElement,.addedElement)  {
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

///  identifier | string
/// summary=C|C
Method ZbreakCommand295Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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

/// 
/// summary values::
/// summary=P&C&[P&C]
Method ZbreakCommand296OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&[P&C]
	; first rule summary P
	if '(..isStringSingle(":",.value)) { quit 1 /* not found is OK */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,":")  {
		if ..Expression(.subElement,.addedElement)  {
			if ..ZbreakCommand297OptGrp(.subElement,.addedElement)  {
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
/// summary values::
/// summary=P&C
Method ZbreakCommand297OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(":",.value)) { quit 1 /* not found is OK */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,":")  {
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

///  zdeallocate_command ::= 'zdeallocate' [post_conditional ] [ zdeallocate_parameter ( ',' zdeallocate_parameter)* ] [ else_block ]
/// summary values:ZDEALLOCATE
/// summary=K&[C]&[C&(?4punctuation:4?)*]&[C]
Method ZdeallocateCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&[C]&[C&(?4punctuation:4?)*]&[C]
	if '(..isKeyword("ZDEALLOCATE",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"ZDEALLOCATE")  {
		if $S(..PostConditional(.subElement,.addedElement) :1,1:1) {
			if ..ZdeallocateCommand298OptGrp(.subElement,.addedElement)  {
				if $S(..ElseBlock(.subElement,.addedElement) :1,1:1) {
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
/// summary=C&(?4punctuation:4?)*
Method ZdeallocateCommand298OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&(?4punctuation:4?)*
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ZdeallocateParameter(.subElement,.addedElement)  {
		if ..ZdeallocateCommand299RepZero(.subElement,.addedElement)  {
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

///  ( ',' zdeallocate_parameter)*
Method ZdeallocateCommand299RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ZdeallocateCommand300Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' zdeallocate_parameter
/// summary values:,
/// summary=P&C
Method ZdeallocateCommand300Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..ZdeallocateParameter(.subElement,.addedElement)  {
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

///  zdeallocate_parameter ::= [ '+' | '-' ] zdeallocatename_list [ zdeallocate_timeout ]
/// summary=[P|P]&C&[C]
Method ZdeallocateParameter(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary [P|P]&C&[C]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ZdeallocateParameter301OptGrp(.subElement,.addedElement)  {
		if ..ZdeallocatenameList(.subElement,.addedElement)  {
			if $S(..ZdeallocateTimeout(.subElement,.addedElement) :1,1:1) {
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
/// summary values:+,-
/// summary=P|P
Method ZdeallocateParameter301OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P|P
	if '(..isStringInList($lb("+","-"),1,.value)) { quit 1 /* not found is OK */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addPunctuation(.subElement,"+")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"-")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=1 /* failure rollsback but returns OK */
	}
	quit ok
}

///  zdeallocate_timeout ::= ':' expression
/// summary values::
/// summary=P&C
Method ZdeallocateTimeout(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(":",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,":")  {
		if ..Expression(.subElement,.addedElement)  {
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

///  zdeallocate_type ::= '#' '"' ( 'S' | 'E' | 'I' | 'D' )+ '"'
/// summary values:#
/// summary=P&P&(?4punctuation:4?)+&P
Method ZdeallocateType(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&P&(?4punctuation:4?)+&P
	; first rule summary P
	if '(..isStringSingle("#",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"#")  {
		if ..addPunctuation(.subElement,"""")  {
			if ..ZdeallocateType304RepOne(.subElement,.addedElement)  {
				if ..addPunctuation(.subElement,"""")  {
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

///  ( 'S' | 'E' | 'I' | 'D' )+
Method ZdeallocateType304RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..ZdeallocateType305Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  'S' | 'E' | 'I' | 'D'
/// summary values:S,E,I,D
/// summary=K|K|K|K
Method ZdeallocateType305Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K|K|K|K
	if '(..isKeywordInList($lb("S","E","I","D"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"S")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"E")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"I")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"D")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  zdeallocatename ::= text
/// summary=C
Method Zdeallocatename(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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

///  zdeallocatename_list ::= one_zdeallocatename ( ',' one_zdeallocatename )*
/// summary=C&(?4punctuation:4?)*
Method ZdeallocatenameList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OneZdeallocatename(.subElement,.addedElement)  {
		if ..ZdeallocatenameList302RepZero(.subElement,.addedElement)  {
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

///  ( ',' one_zdeallocatename )*
Method ZdeallocatenameList302RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ZdeallocatenameList303Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' one_zdeallocatename
/// summary values:,
/// summary=P&C
Method ZdeallocatenameList303Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..OneZdeallocatename(.subElement,.addedElement)  {
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

///  zinsert_command ::= 'zinsert'
/// summary values:ZINSERT
/// summary=K
Method ZinsertCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeyword("ZINSERT",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"ZINSERT")  {
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

///  zkill_command ::= ('zkill' | 'zk') [ post_conditional ] [ kill_parameter_list ]
/// summary values:ZKILL,ZK
/// summary=(K|K)&[C]&[C]
Method ZkillCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&[C]&[C]
	if '(..isKeywordInList($lb("ZKILL","ZK"),.value)) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ZkillCommand306Sub(.subElement,.addedElement)  {
		if $S(..PostConditional(.subElement,.addedElement) :1,1:1) {
			if $S(..KillParameterList(.subElement,.addedElement) :1,1:1) {
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

/// 'zkill' | 'zk'
/// summary values:ZKILL,ZK
/// summary=K|K
Method ZkillCommand306Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K|K
	if '(..isKeywordInList($lb("ZKILL","ZK"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"ZKILL")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"ZK")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  zload_command ::= 'zload'
/// summary values:ZLOAD
/// summary=K
Method ZloadCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeyword("ZLOAD",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"ZLOAD")  {
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

///  znspace_command ::= ('znspace'|'zn') [ post_conditional ] expression
/// summary values:ZNSPACE,ZN
/// summary=(K|K)&[C]&C
Method ZnspaceCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&[C]&C
	if '(..isKeywordInList($lb("ZNSPACE","ZN"),.value)) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ZnspaceCommand307Sub(.subElement,.addedElement)  {
		if $S(..PostConditional(.subElement,.addedElement) :1,1:1) {
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

/// 'znspace'|'zn'
/// summary values:ZNSPACE,ZN
/// summary=K|K
Method ZnspaceCommand307Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K|K
	if '(..isKeywordInList($lb("ZNSPACE","ZN"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"ZNSPACE")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"ZN")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  zobjclassmethod_function_call ::= 'zobjclassmethod' open_bracket classmethod_class ',' classmethod_method [ ',' function_parameter_list_items ] close_bracket [ object_chain ]
/// summary values:ZOBJCLASSMETHOD
/// summary=K&C&C&P&C&[P&C]&C&[C]
Method ZobjclassmethodFunctionCall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C&C&P&C&[P&C]&C&[C]
	if '(..isKeyword("ZOBJCLASSMETHOD",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"ZOBJCLASSMETHOD")  {
		if ..OpenBracket(.subElement,.addedElement)  {
			if ..ClassmethodClass(.subElement,.addedElement)  {
				if ..addPunctuation(.subElement,",")  {
					if ..ClassmethodMethod(.subElement,.addedElement)  {
						if ..ZobjclassmethodFunctionCall384OptGrp(.subElement,.addedElement)  {
							if ..CloseBracket(.subElement,.addedElement)  {
								if $S(..ObjectChain(.subElement,.addedElement) :1,1:1) {
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
Method ZobjclassmethodFunctionCall384OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 1 /* not found is OK */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..FunctionParameterListItems(.subElement,.addedElement)  {
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

///  zobjmethod_function_call ::= 'zobjmethod' open_bracket classmethod_class ',' classmethod_method [ ',' function_parameter_list_items ] close_bracket [ object_chain ]
/// summary values:ZOBJMETHOD
/// summary=K&C&C&P&C&[P&C]&C&[C]
Method ZobjmethodFunctionCall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C&C&P&C&[P&C]&C&[C]
	if '(..isKeyword("ZOBJMETHOD",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"ZOBJMETHOD")  {
		if ..OpenBracket(.subElement,.addedElement)  {
			if ..ClassmethodClass(.subElement,.addedElement)  {
				if ..addPunctuation(.subElement,",")  {
					if ..ClassmethodMethod(.subElement,.addedElement)  {
						if ..ZobjmethodFunctionCall383OptGrp(.subElement,.addedElement)  {
							if ..CloseBracket(.subElement,.addedElement)  {
								if $S(..ObjectChain(.subElement,.addedElement) :1,1:1) {
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
Method ZobjmethodFunctionCall383OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 1 /* not found is OK */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..FunctionParameterListItems(.subElement,.addedElement)  {
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

///  zprint_command ::= 'zprint' [ post_conditional ] [ lineref1 [ ':' lineref2 ] ]
/// summary values:ZPRINT
/// summary=K&[C]&[C&[P&C]]
Method ZprintCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&[C]&[C&[P&C]]
	if '(..isKeyword("ZPRINT",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"ZPRINT")  {
		if $S(..PostConditional(.subElement,.addedElement) :1,1:1) {
			if ..ZprintCommand308OptGrp(.subElement,.addedElement)  {
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
/// summary=C&[P&C]
Method ZprintCommand308OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&[P&C]
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Lineref1(.subElement,.addedElement)  {
		if ..ZprintCommand309OptGrp(.subElement,.addedElement)  {
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
/// summary values::
/// summary=P&C
Method ZprintCommand309OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(":",.value)) { quit 1 /* not found is OK */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,":")  {
		if ..Lineref2(.subElement,.addedElement)  {
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

///  zquit_command ::= 'zquit'
/// summary values:ZQUIT
/// summary=K
Method ZquitCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeyword("ZQUIT",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"ZQUIT")  {
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

///  zremove_command ::= 'zremove'
/// summary values:ZREMOVE
/// summary=K
Method ZremoveCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeyword("ZREMOVE",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"ZREMOVE")  {
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

///  zsave_command ::= 'zsave'
/// summary values:ZSAVE
/// summary=K
Method ZsaveCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeyword("ZSAVE",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"ZSAVE")  {
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

///  zsync_command ::= 'zsync' [ post_conditional ]
/// summary values:ZSYNC
/// summary=K&[C]
Method ZsyncCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&[C]
	if '(..isKeyword("ZSYNC",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"ZSYNC")  {
		if $S(..PostConditional(.subElement,.addedElement) :1,1:1) {
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

///  ztrap_command ::= ('ztrap' | 'zt') [post_conditional ] [naked | expression]
/// summary values:ZTRAP,ZT
/// summary=(K|K)&[C]&[C|C]
Method ZtrapCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&[C]&[C|C]
	if '(..isKeywordInList($lb("ZTRAP","ZT"),.value)) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ZtrapCommand310Sub(.subElement,.addedElement)  {
		if $S(..PostConditional(.subElement,.addedElement) :1,1:1) {
			if ..ZtrapCommand311OptGrp(.subElement,.addedElement)  {
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

/// 'ztrap' | 'zt'
/// summary values:ZTRAP,ZT
/// summary=K|K
Method ZtrapCommand310Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K|K
	if '(..isKeywordInList($lb("ZTRAP","ZT"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"ZTRAP")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"ZT")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

/// 
/// summary=C|C
Method ZtrapCommand311OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..Naked(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Expression(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=1 /* failure rollsback but returns OK */
	}
	quit ok
}

///  zwrite_argument ::= expression
/// summary=C
Method ZwriteArgument(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(.subElement,.addedElement)  {
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

///  zwrite_argument_list ::= zwrite_argument ( ',' zwrite_argument )*
/// summary=C&(?4punctuation:4?)*
Method ZwriteArgumentList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ZwriteArgument(.subElement,.addedElement)  {
		if ..ZwriteArgumentList314RepZero(.subElement,.addedElement)  {
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

///  ( ',' zwrite_argument )*
Method ZwriteArgumentList314RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ZwriteArgumentList315Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' zwrite_argument
/// summary values:,
/// summary=P&C
Method ZwriteArgumentList315Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..ZwriteArgument(.subElement,.addedElement)  {
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

///  zwrite_command ::= ( 'zwrite' | 'zw' ) [ post_conditional ] ( naked | zwrite_argument_list )
/// summary values:ZWRITE,ZW
/// summary=(K|K)&[C]&(C|C)
Method ZwriteCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&[C]&(C|C)
	if '(..isKeywordInList($lb("ZWRITE","ZW"),.value)) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ZwriteCommand312Sub(.subElement,.addedElement)  {
		if $S(..PostConditional(.subElement,.addedElement) :1,1:1) {
			if ..ZwriteCommand313Sub(.subElement,.addedElement)  {
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

///  'zwrite' | 'zw'
/// summary values:ZWRITE,ZW
/// summary=K|K
Method ZwriteCommand312Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K|K
	if '(..isKeywordInList($lb("ZWRITE","ZW"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"ZWRITE")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"ZW")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  naked | zwrite_argument_list
/// summary=C|C
Method ZwriteCommand313Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..Naked(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ZwriteArgumentList(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  ZZ_COMMAND ::= ZZ_COMMAND_WORD (naked | expression_list)
/// summary=C&(C|C)
Method ZzCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&(C|C)
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ZzCommandWord(.subElement,.addedElement)  {
		if ..ZzCommand316Sub(.subElement,.addedElement)  {
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

/// naked | expression_list
/// summary=C|C
Method ZzCommand316Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..Naked(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ExpressionList(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  ZZ_COMMAND_WORD ::= 'ZZ'
/// summary values:ZZ
/// summary=K
Method ZzCommandWord(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeyword("ZZ",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"ZZ")  {
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

///  zzdump_command ::= 'zzdump' [post_conditional] expression
/// summary values:ZZDUMP
/// summary=K&[C]&C
Method ZzdumpCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&[C]&C
	if '(..isKeyword("ZZDUMP",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"ZZDUMP")  {
		if $S(..PostConditional(.subElement,.addedElement) :1,1:1) {
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

///  zzwrite_command ::= 'zzwrite' [post_conditional] expression
/// summary values:ZZWRITE
/// summary=K&[C]&C
Method ZzwriteCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&[C]&C
	if '(..isKeyword("ZZWRITE",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"ZZWRITE")  {
		if $S(..PostConditional(.subElement,.addedElement) :1,1:1) {
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

Method newElement(Type As %String) As PXW.DEV.BNF.Elements.COS
{
	quit ##class(PXW.DEV.BNF.Elements.COS).%New(Type)
}

}
