/// Created: 2024-10-20 14:41:20 PXW.DEV.BNF.Compilers.Compiler1
Class PXW.DEV.BNF.GEN.COS Extends PXW.DEV.BNF.super [ ProcedureBlock ]
{

Parameter KeywordPattern = "1A.AN";

Parameter Keywords = "A,ARRAY,AS,B,BITLOGIC,BREAK,C,CASE,CATCH,CLASSMETHOD,CLOSE,CONTINUE,D,DEF1ARG,DEFERRED,DEFINE,DEVICE,DIM,DISPLAY,DO,E,EC,ECODE,ELSE,ELSEIF,ENDIF,ES,ESTACK,ET,ETRAP,EXECUTE,EXTRACT,F,FALSE,FDBMS,FOR,G,GOTO,H,HALT,HANG,HOROLOG,I,IF,IFDEF,IFNDEF,IMPORT,INCLUDE,INCREMENT,IO,J,JOB,K,KEY,KILL,L,LB,LG,LI,LIST,LISTBUILD,LISTGET,LISTUPDATE,LOCK,LOGICAL,LU,M,MERGE,METHOD,METHODIMPL,MODE,MVP,MVPRINT,N,NAMESPACE,NEW,NULL,O,ODBC,OF,OPEN,P,PIECE,PRINCIPAL,PRINT,PRIVATE,PUBLIC,PYTHON,Q,QUIT,R,READ,RETURN,ROLES,RUNTIME,S,SELECT,SET,SQLCOMPILE,STACK,STORAGE,SYSTEM,T,TC,TCOMMIT,TEST,TEXT,THIS,THROW,THROWOBJ,TL,TLEVEL,TROLLBACK,TRUE,TRY,TS,TSTART,U,UNDEF,USE,USERNAME,V,VIEW,W,WHILE,WRITE,X,XECUTE,Y,ZA,ZALLOCATE,ZB,ZBREAK,ZCHILD,ZDEALLOCATE,ZE,ZEOF,ZEOS,ZERROR,ZFWCHARZ,ZH,ZHOROLOG,ZHWKATAZ,ZINSERT,ZIO,ZJOB,ZK,ZKILL,ZLOAD,ZMODE,ZN,ZNAME,ZNSPACE,ZOBJCLASSMETHOD,ZOBJMETHOD,ZORDER,ZPARENT,ZPI,ZPOS,ZPRINT,ZQUIT,ZR,ZREFERENCE,ZREMOVE,ZS,ZSAVE,ZSTORAGE,ZSYNC,ZT,ZTIMESTAMP,ZTIMEZONE,ZTRAP,ZTS,ZU,ZUTIL,ZV,ZVERSION,ZW,ZWRITE,ZZDUMP,ZZWRITE";

///  amp_op ::= '&'
/// summary values:&
Method AmpOp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("&",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"&")  {
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

///  any_keyword ::= 'need any keyword'
/// summary values:NEED ANY KEYWORD
Method AnyKeyword(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("NEED ANY KEYWORD",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"need any keyword")  {
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

///  any_text_upto_close_bracket ::= 'code this'
/// summary values:CODE THIS
Method AnyTextUptoCloseBracket(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("CODE THIS",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"code this")  {
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

///  array_parameter_list ::= open_bracket expression ( ',' expression )* close_bracket
Method ArrayParameterList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?1Rule?&(?4?)*&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OpenBracket(subElement,.addedElement)  {
		if ..Expression(subElement,.addedElement)  {
			if ..ArrayParameterList103RepZero(subElement,.addedElement)  {
				if ..CloseBracket(subElement,.addedElement)  {
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

///  ( ',' expression )*
Method ArrayParameterList103RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ArrayParameterList104Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' expression
/// summary values:,
Method ArrayParameterList104Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..Expression(subElement,.addedElement)  {
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

///  bitlogic_expression ::= (expression ('|' | '&' | '^' |'~')* )*
Method BitlogicExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (?4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..BitlogicExpression349RepZero(subElement,.addedElement)  {
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

///  (expression ('|' | '&' | '^' |'~')* )*
Method BitlogicExpression349RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..BitlogicExpression350Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

/// expression ('|' | '&' | '^' |'~')*
Method BitlogicExpression350Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(subElement,.addedElement)  {
		if ..BitlogicExpression351RepZero(subElement,.addedElement)  {
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

///  ('|' | '&' | '^' |'~')*
Method BitlogicExpression351RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..BitlogicExpression352Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

/// '|' | '&' | '^' |'~'
/// summary values:|,&,^,~
Method BitlogicExpression352Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|P|P|P
	if '(..isStringInList($lb("|","&","^","~"),1,.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
	if ..addPunctuation(subElement,"|")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"&")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"^")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"~")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  bitlogic_function_call ::= 'bitlogic' open_bracket bitlogic_expression [ ',' expression ] close_bracket
/// summary values:BITLOGIC
Method BitlogicFunctionCall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?&?1Rule?&?4?&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("BITLOGIC"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"BITLOGIC")  {
		if ..OpenBracket(subElement,.addedElement)  {
			if ..BitlogicExpression(subElement,.addedElement)  {
				if ..BitlogicFunctionCall348OptGrp(subElement,.addedElement)  {
					if ..CloseBracket(subElement,.addedElement)  {
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
/// summary values:,
Method BitlogicFunctionCall348OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
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

///  block_comment ::= '/*' text '*/'
/// summary values:/*
Method BlockComment(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&P
	; first rule summary P
	if '(..isStringSingle("/*",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"/*")  {
		if ..Text(subElement,.addedElement)  {
			if ..addPunctuation(subElement,"*/")  {
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

///  break_command ::= ('break' | 'b') [ post_conditional ] [ naked | ( break_extend | break_flag )]
Method BreakCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?&?4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..BreakCommand117Sub(subElement,.addedElement)  {
		if $S(..PostConditional(subElement,.addedElement) :1,1:1) {
			if ..BreakCommand118OptGrp(subElement,.addedElement)  {
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

/// 'break' | 'b'
/// summary values:BREAK,B
Method BreakCommand117Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K
	if '(..isKeywordInList($lb("BREAK","B"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
	if ..addKeyword(subElement,"BREAK")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"B")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

Method BreakCommand118OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Naked(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..BreakCommand119Sub(subElement,.addedElement)  {
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

///  break_extend | break_flag
Method BreakCommand119Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..BreakExtend(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..BreakFlag(subElement,.addedElement)  {
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

///  break_extend ::= expression
Method BreakExtend(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(subElement,.addedElement)  {
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

///  break_flag ::= expression
Method BreakFlag(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(subElement,.addedElement)  {
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

///  case_clause ::= case_clause_case ':' case_clause_value
Method CaseClause(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&P&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CaseClauseCase(subElement,.addedElement)  {
		if ..addPunctuation(subElement,":")  {
			if ..CaseClauseValue(subElement,.addedElement)  {
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

///  case_clause_case ::= expression
Method CaseClauseCase(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(subElement,.addedElement)  {
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

///  case_clause_default ::= ',' ':' expression
/// summary values:,
Method CaseClauseDefault(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..addPunctuation(subElement,":")  {
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

///  case_clause_value ::= expression
Method CaseClauseValue(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(subElement,.addedElement)  {
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

///  case_clauses ::= (( ',' case_clause ))*
Method CaseClauses(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (?4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CaseClauses315RepZero(subElement,.addedElement)  {
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

///  (( ',' case_clause ))*
Method CaseClauses315RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..CaseClauses316Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

/// ( ',' case_clause )
Method CaseClauses316Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CaseClauses317Sub(subElement,.addedElement)  {
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

///  ',' case_clause
/// summary values:,
Method CaseClauses317Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..CaseClause(subElement,.addedElement)  {
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

///  case_function_call ::= 'case' open_bracket expression [ case_clauses ] [ case_clause_default ] close_bracket
/// summary values:CASE
Method CaseFunctionCall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?&?1Rule?&?4?&?4?&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("CASE"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"CASE")  {
		if ..OpenBracket(subElement,.addedElement)  {
			if ..Expression(subElement,.addedElement)  {
				if $S(..CaseClauses(subElement,.addedElement) :1,1:1) {
					if $S(..CaseClauseDefault(subElement,.addedElement) :1,1:1) {
						if ..CloseBracket(subElement,.addedElement)  {
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

///  class_casting ::= ['(' ] ( '##this' | '$this' | variable_identifier ) [')']
Method ClassCasting(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?&?1Rule?&?4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..addPunctuation(subElement,"(") :1,1:1) {
		if ..ClassCasting89Sub(subElement,.addedElement)  {
			if $S(..addPunctuation(subElement,")") :1,1:1) {
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

///  '##this' | '$this' | variable_identifier
Method ClassCasting89Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|P|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"##this")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"$this")  {
		set done=1 ; or
	} elseif ..VariableIdentifier(subElement,.addedElement)  {
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

///  class_expression ::= '##class' '(' class_reference ')' [ class_casting ] object_chain
/// summary values:##CLASS
Method ClassExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&P&?1Rule?&P&?4?&?1Rule?
	; first rule summary P
	if '(..isStringSingle("##CLASS",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"##class")  {
		if ..addPunctuation(subElement,"(")  {
			if ..ClassReference(subElement,.addedElement)  {
				if ..addPunctuation(subElement,")")  {
					if $S(..ClassCasting(subElement,.addedElement) :1,1:1) {
						if ..ObjectChain(subElement,.addedElement)  {
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

///  classexpr ::= super_expression | class_expression
Method Classexpr(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SuperExpression(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ClassExpression(subElement,.addedElement)  {
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

///  classmethod_function_call ::= 'classmethod' function_parameter_list [ object_chain ]
/// summary values:CLASSMETHOD
Method ClassmethodFunctionCall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?&?4?
	; first rule summary K
	if '(..isKeywordInList($lb("CLASSMETHOD"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"CLASSMETHOD")  {
		if ..FunctionParameterList(subElement,.addedElement)  {
			if $S(..ObjectChain(subElement,.addedElement) :1,1:1) {
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

///  close_bracket ::= ')'
/// summary values:)
Method CloseBracket(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle(")",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,")")  {
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

///  close_command ::= ('close' | 'c') [ post_conditional ] close_item (',' close_item)*
Method CloseCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?&?1Rule?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CloseCommand120Sub(subElement,.addedElement)  {
		if $S(..PostConditional(subElement,.addedElement) :1,1:1) {
			if ..CloseItem(subElement,.addedElement)  {
				if ..CloseCommand121RepZero(subElement,.addedElement)  {
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

/// 'close' | 'c'
/// summary values:CLOSE,C
Method CloseCommand120Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K
	if '(..isKeywordInList($lb("CLOSE","C"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
	if ..addKeyword(subElement,"CLOSE")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"C")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  (',' close_item)*
Method CloseCommand121RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..CloseCommand122Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

/// ',' close_item
/// summary values:,
Method CloseCommand122Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..CloseItem(subElement,.addedElement)  {
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

///  close_item ::= open_device [ ':' device_parameters ]
Method CloseItem(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OpenDevice(subElement,.addedElement)  {
		if ..CloseItem123OptGrp(subElement,.addedElement)  {
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
/// summary values::
Method CloseItem123OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(":",.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,":")  {
		if ..DeviceParameters(subElement,.addedElement)  {
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

///  command_list ::= cos_command ( cos_command )*
Method CommandList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CosCommand(subElement,.addedElement)  {
		if ..CommandList43RepZero(subElement,.addedElement)  {
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

///  ( cos_command )*
Method CommandList43RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..CommandList44Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  cos_command
Method CommandList44Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CosCommand(subElement,.addedElement)  {
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

///  command_list_eol ::= cos_command ( cos_command )*
Method CommandListEol(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CosCommand(subElement,.addedElement)  {
		if ..CommandListEol45RepZero(subElement,.addedElement)  {
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

///  ( cos_command )*
Method CommandListEol45RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..CommandListEol46Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  cos_command
Method CommandListEol46Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CosCommand(subElement,.addedElement)  {
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

///  comment ::= line_comment | block_comment
Method Comment(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LineComment(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..BlockComment(subElement,.addedElement)  {
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

///  continue_command ::= 'continue' [ post_conditional ]
/// summary values:CONTINUE
Method ContinueCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?4?
	; first rule summary K
	if '(..isKeywordInList($lb("CONTINUE"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"CONTINUE")  {
		if $S(..PostConditional(subElement,.addedElement) :1,1:1) {
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

///  cos_code_block ::= one_cos_statement ( one_cos_statement )*
Method CosCodeBlock(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OneCosStatement(subElement,.addedElement)  {
		if ..CosCodeBlock1RepZero(subElement,.addedElement)  {
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

///  ( one_cos_statement )*
Method CosCodeBlock1RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..CosCodeBlock2Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  one_cos_statement
Method CosCodeBlock2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OneCosStatement(subElement,.addedElement)  {
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

///  cos_code_block_sql ::= one_cos_Statement_sql ( one_cos_statement_sql)*
Method CosCodeBlockSql(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OneCosStatementSql(subElement,.addedElement)  {
		if ..CosCodeBlockSql3RepZero(subElement,.addedElement)  {
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

///  ( one_cos_statement_sql)*
Method CosCodeBlockSql3RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..CosCodeBlockSql4Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  one_cos_statement_sql
Method CosCodeBlockSql4Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OneCosStatementSql(subElement,.addedElement)  {
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

///  cos_code_block_sql_storage ::= one_cos_Statement_sql ( one_cos_statement_sql)*
Method CosCodeBlockSqlStorage(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OneCosStatementSql(subElement,.addedElement)  {
		if ..CosCodeBlockSqlStorage5RepZero(subElement,.addedElement)  {
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

///  ( one_cos_statement_sql)*
Method CosCodeBlockSqlStorage5RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..CosCodeBlockSqlStorage6Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  one_cos_statement_sql
Method CosCodeBlockSqlStorage6Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OneCosStatementSql(subElement,.addedElement)  {
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

///  cos_code_block_trigger ::= one_cos_statement ( one_cos_statement )*
Method CosCodeBlockTrigger(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OneCosStatement(subElement,.addedElement)  {
		if ..CosCodeBlockTrigger7RepZero(subElement,.addedElement)  {
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

///  ( one_cos_statement )*
Method CosCodeBlockTrigger7RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..CosCodeBlockTrigger8Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  one_cos_statement
Method CosCodeBlockTrigger8Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OneCosStatement(subElement,.addedElement)  {
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

///  cos_command ::= set_command | if_command | quit_command | do_command | for_command | kill_command | break_command | continue_command | goto_command | else_command | hang_command | halt_command | job_command | sql_command | js_command | lock_command | merge_command | new_command | open_command | close_command | return_command | read_command | tcommit_command | throw_command | trollback_command | try_command | tstart_command | use_command | view_command | while_command | write_command | xecute_command | macrocall | cos_directive | zallocate_command | zbreak_command | zdeallocate_command | zinsert_command | zkill_command | zload_command | znspace_command | zprint_command | zquit_command | zremove_command | zsave_command | zsync_command | ztrap_command | zwrite_command | zzdump_command | zzwrite_command | html_command | print_command | mpv_command
Method CosCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SetCommand(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..IfCommand(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..QuitCommand(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..DoCommand(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ForCommand(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..KillCommand(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..BreakCommand(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ContinueCommand(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..GotoCommand(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ElseCommand(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..HangCommand(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..HaltCommand(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..JobCommand(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlCommand(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..JsCommand(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..LockCommand(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..MergeCommand(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..NewCommand(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OpenCommand(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CloseCommand(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ReturnCommand(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ReadCommand(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..TcommitCommand(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ThrowCommand(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..TrollbackCommand(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..TryCommand(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..TstartCommand(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..UseCommand(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ViewCommand(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..WhileCommand(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..WriteCommand(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..XecuteCommand(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Macrocall(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CosDirective(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ZallocateCommand(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ZbreakCommand(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ZdeallocateCommand(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ZinsertCommand(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ZkillCommand(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ZloadCommand(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ZnspaceCommand(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ZprintCommand(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ZquitCommand(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ZremoveCommand(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ZsaveCommand(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ZsyncCommand(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ZtrapCommand(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ZwriteCommand(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ZzdumpCommand(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ZzwriteCommand(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..HtmlCommand(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..PrintCommand(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..MpvCommand(subElement,.addedElement)  {
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

///  cos_directive ::= '#' ( cos_directive_define | cos_directive_dim | cos_directive_ifdef | cos_directive_ifndef | cos_directive_if | cos_directive_else | cos_directive_elseif | cos_directive_endif | cos_directive_defonearg | cos_directive_include | cos_directive_undef | cos_directive_execute | cos_directive_sqlcompile )
/// summary values:#
Method CosDirective(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle("#",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"#")  {
		if ..CosDirective25Sub(subElement,.addedElement)  {
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

///  cos_directive_define | cos_directive_dim | cos_directive_ifdef | cos_directive_ifndef | cos_directive_if | cos_directive_else | cos_directive_elseif | cos_directive_endif | cos_directive_defonearg | cos_directive_include | cos_directive_undef | cos_directive_execute | cos_directive_sqlcompile
Method CosDirective25Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CosDirectiveDefine(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CosDirectiveDim(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CosDirectiveIfdef(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CosDirectiveIfndef(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CosDirectiveIf(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CosDirectiveElse(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CosDirectiveElseif(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CosDirectiveEndif(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CosDirectiveDefonearg(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CosDirectiveInclude(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CosDirectiveUndef(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CosDirectiveExecute(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CosDirectiveSqlcompile(subElement,.addedElement)  {
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

///  cos_directive_define ::= 'define' cos_directive_define_name [ array_parameter_list ] [cos_directive_define_subst]
/// summary values:DEFINE
Method CosDirectiveDefine(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?&?4?&?4?
	; first rule summary K
	if '(..isKeywordInList($lb("DEFINE"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"DEFINE")  {
		if ..CosDirectiveDefineName(subElement,.addedElement)  {
			if $S(..ArrayParameterList(subElement,.addedElement) :1,1:1) {
				if $S(..CosDirectiveDefineSubst(subElement,.addedElement) :1,1:1) {
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

///  cos_directive_define_name ::= macro_identifier
Method CosDirectiveDefineName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..MacroIdentifier(subElement,.addedElement)  {
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

///  cos_directive_define_subst ::= [command_list_eol | expression_list ] text_to_eol_continue
Method CosDirectiveDefineSubst(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CosDirectiveDefineSubst26OptGrp(subElement,.addedElement)  {
		if ..TextToEolContinue(subElement,.addedElement)  {
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

Method CosDirectiveDefineSubst26OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CommandListEol(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ExpressionList(subElement,.addedElement)  {
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

///  cos_directive_defonearg ::= 'def1arg' cos_directive_define_name [ array_parameter_list ] [cos_directive_define_subst]
/// summary values:DEF1ARG
Method CosDirectiveDefonearg(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?&?4?&?4?
	; first rule summary K
	if '(..isKeywordInList($lb("DEF1ARG"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"DEF1ARG")  {
		if ..CosDirectiveDefineName(subElement,.addedElement)  {
			if $S(..ArrayParameterList(subElement,.addedElement) :1,1:1) {
				if $S(..CosDirectiveDefineSubst(subElement,.addedElement) :1,1:1) {
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

///  cos_directive_dim ::= 'dim' cos_directive_dim_item (',' cos_directive_dim_item )*
/// summary values:DIM
Method CosDirectiveDim(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?&(?4?)*
	; first rule summary K
	if '(..isKeywordInList($lb("DIM"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"DIM")  {
		if ..CosDirectiveDimItem(subElement,.addedElement)  {
			if ..CosDirectiveDim27RepZero(subElement,.addedElement)  {
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

///  (',' cos_directive_dim_item )*
Method CosDirectiveDim27RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..CosDirectiveDim28Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

/// ',' cos_directive_dim_item
/// summary values:,
Method CosDirectiveDim28Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..CosDirectiveDimItem(subElement,.addedElement)  {
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

///  cos_directive_dim_item ::= variable_set [(',' variable_set )*] [ 'as' [('array' | 'list') 'of'] class_reference ] [ '=' dim_expression ]
Method CosDirectiveDimItem(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?&?4?&?4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..VariableSet(subElement,.addedElement)  {
		if $S(..CosDirectiveDimItem29RepZero(subElement,.addedElement) :1,1:1) {
			if ..CosDirectiveDimItem31OptGrp(subElement,.addedElement)  {
				if ..CosDirectiveDimItem34OptGrp(subElement,.addedElement)  {
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

/// (',' variable_set )*
Method CosDirectiveDimItem29RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..CosDirectiveDimItem30Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

/// ',' variable_set
/// summary values:,
Method CosDirectiveDimItem30Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..VariableSet(subElement,.addedElement)  {
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
/// summary values:AS
Method CosDirectiveDimItem31OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?4?&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("AS"),.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"AS")  {
		if ..CosDirectiveDimItem32OptGrp(subElement,.addedElement)  {
			if ..ClassReference(subElement,.addedElement)  {
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

Method CosDirectiveDimItem32OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&K
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CosDirectiveDimItem33Sub(subElement,.addedElement)  {
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

/// 'array' | 'list'
/// summary values:ARRAY,LIST
Method CosDirectiveDimItem33Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K
	if '(..isKeywordInList($lb("ARRAY","LIST"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
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

/// 
/// summary values:=
Method CosDirectiveDimItem34OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle("=",.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"=")  {
		if ..DimExpression(subElement,.addedElement)  {
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

///  cos_directive_else ::= 'else'
/// summary values:ELSE
Method CosDirectiveElse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeywordInList($lb("ELSE"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"ELSE")  {
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

///  cos_directive_elseif ::= 'elseif' expression
/// summary values:ELSEIF
Method CosDirectiveElseif(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("ELSEIF"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"ELSEIF")  {
		if ..Expression(subElement,.addedElement)  {
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

///  cos_directive_endif ::= 'endif'
/// summary values:ENDIF
Method CosDirectiveEndif(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeywordInList($lb("ENDIF"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"ENDIF")  {
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

///  cos_directive_execute ::= 'execute' command_list_eol
/// summary values:EXECUTE
Method CosDirectiveExecute(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("EXECUTE"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"EXECUTE")  {
		if ..CommandListEol(subElement,.addedElement)  {
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

///  cos_directive_if ::= 'if' expression
/// summary values:IF
Method CosDirectiveIf(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("IF"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"IF")  {
		if ..Expression(subElement,.addedElement)  {
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

///  cos_directive_ifdef ::= 'ifdef' macro_identifier
/// summary values:IFDEF
Method CosDirectiveIfdef(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("IFDEF"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"IFDEF")  {
		if ..MacroIdentifier(subElement,.addedElement)  {
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

///  cos_directive_ifndef ::= 'ifndef' macro_identifier
/// summary values:IFNDEF
Method CosDirectiveIfndef(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("IFNDEF"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"IFNDEF")  {
		if ..MacroIdentifier(subElement,.addedElement)  {
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

///  cos_directive_include ::= 'include' (cos_directive_include_list | cos_directive_include_name)
/// summary values:INCLUDE
Method CosDirectiveInclude(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("INCLUDE"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"INCLUDE")  {
		if ..CosDirectiveInclude35Sub(subElement,.addedElement)  {
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

/// cos_directive_include_list | cos_directive_include_name
Method CosDirectiveInclude35Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CosDirectiveIncludeList(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CosDirectiveIncludeName(subElement,.addedElement)  {
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

///  cos_directive_include_list ::= '(' cos_directive_include_name ( ',' cos_directive_include_name )* ')'
/// summary values:(
Method CosDirectiveIncludeList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&(?4?)*&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"(")  {
		if ..CosDirectiveIncludeName(subElement,.addedElement)  {
			if ..CosDirectiveIncludeList41RepZero(subElement,.addedElement)  {
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

///  ( ',' cos_directive_include_name )*
Method CosDirectiveIncludeList41RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..CosDirectiveIncludeList42Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' cos_directive_include_name
/// summary values:,
Method CosDirectiveIncludeList42Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..CosDirectiveIncludeName(subElement,.addedElement)  {
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

///  cos_directive_include_name ::= identifier
Method CosDirectiveIncludeName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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

///  cos_directive_sqlcompile ::= 'sqlcompile' ( ( 'select' '=' ('display' | 'logical' | 'odbc' | 'runtime' | 'text' | 'FDBMS') ) | ( 'mode' '=' ('deferred') ) )
/// summary values:SQLCOMPILE
Method CosDirectiveSqlcompile(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("SQLCOMPILE"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"SQLCOMPILE")  {
		if ..CosDirectiveSqlcompile36Sub(subElement,.addedElement)  {
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

///  ( 'select' '=' ('display' | 'logical' | 'odbc' | 'runtime' | 'text' | 'FDBMS') ) | ( 'mode' '=' ('deferred') )
Method CosDirectiveSqlcompile36Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CosDirectiveSqlcompile37Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CosDirectiveSqlcompile39Sub(subElement,.addedElement)  {
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

///  'select' '=' ('display' | 'logical' | 'odbc' | 'runtime' | 'text' | 'FDBMS')
/// summary values:SELECT
Method CosDirectiveSqlcompile37Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("SELECT"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"SELECT")  {
		if ..addPunctuation(subElement,"=")  {
			if ..CosDirectiveSqlcompile38Sub(subElement,.addedElement)  {
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

/// 'display' | 'logical' | 'odbc' | 'runtime' | 'text' | 'FDBMS'
/// summary values:DISPLAY,LOGICAL,ODBC,RUNTIME,TEXT,FDBMS
Method CosDirectiveSqlcompile38Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K|K|K|K|K
	if '(..isKeywordInList($lb("DISPLAY","LOGICAL","ODBC","RUNTIME","TEXT","FDBMS"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
	if ..addKeyword(subElement,"DISPLAY")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"LOGICAL")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"ODBC")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"RUNTIME")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"TEXT")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"FDBMS")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  'mode' '=' ('deferred')
/// summary values:MODE
Method CosDirectiveSqlcompile39Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("MODE"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"MODE")  {
		if ..addPunctuation(subElement,"=")  {
			if ..CosDirectiveSqlcompile40Sub(subElement,.addedElement)  {
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

/// 'deferred'
/// summary values:DEFERRED
Method CosDirectiveSqlcompile40Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeywordInList($lb("DEFERRED"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
	if ..addKeyword(subElement,"DEFERRED")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  cos_directive_undef ::= 'undef' macro_identifier
/// summary values:UNDEF
Method CosDirectiveUndef(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("UNDEF"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"UNDEF")  {
		if ..MacroIdentifier(subElement,.addedElement)  {
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

///  cos_json ::= cos_json_object | cos_json_array | cos_json_prim
Method CosJson(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CosJsonObject(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CosJsonArray(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CosJsonPrim(subElement,.addedElement)  {
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

///  cos_json_array ::= '[' [ cos_json (',' cos_json)* ] ']'
/// summary values:[
Method CosJsonArray(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?4?&P
	; first rule summary P
	if '(..isStringSingle("[",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"[")  {
		if ..CosJsonArray364OptGrp(subElement,.addedElement)  {
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

Method CosJsonArray364OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CosJson(subElement,.addedElement)  {
		if ..CosJsonArray365RepZero(subElement,.addedElement)  {
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

///  (',' cos_json)*
Method CosJsonArray365RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..CosJsonArray366Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

/// ',' cos_json
/// summary values:,
Method CosJsonArray366Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..CosJson(subElement,.addedElement)  {
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

///  cos_json_object ::= '{' [ cos_json_pair ( ',' cos_json_pair )*] '}'
/// summary values:{
Method CosJsonObject(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?4?&P
	; first rule summary P
	if '(..isStringSingle("{",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"{")  {
		if ..CosJsonObject360OptGrp(subElement,.addedElement)  {
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

Method CosJsonObject360OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CosJsonPair(subElement,.addedElement)  {
		if ..CosJsonObject361RepZero(subElement,.addedElement)  {
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

///  ( ',' cos_json_pair )*
Method CosJsonObject361RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..CosJsonObject362Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' cos_json_pair
/// summary values:,
Method CosJsonObject362Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..CosJsonPair(subElement,.addedElement)  {
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

///  cos_json_pair ::= json_string ':' cos_json
Method CosJsonPair(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&P&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..JsonString(subElement,.addedElement)  {
		if ..addPunctuation(subElement,":")  {
			if ..CosJson(subElement,.addedElement)  {
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

///  cos_json_prim ::= number | json_string | 'true' | 'false' | 'null' | ( '(' expression ')' )
Method CosJsonPrim(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?|K|K|K|?1Rule?
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
		set done=1 ; or
	} elseif ..CosJsonPrim363Sub(subElement,.addedElement)  {
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

///  '(' expression ')'
/// summary values:(
Method CosJsonPrim363Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"(")  {
		if ..Expression(subElement,.addedElement)  {
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

///  device_parameter_list ::= ( one_device_parameter ( ':' one_device_parameter )* )
Method DeviceParameterList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..DeviceParameterList125Sub(subElement,.addedElement)  {
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

///  one_device_parameter ( ':' one_device_parameter )*
Method DeviceParameterList125Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OneDeviceParameter(subElement,.addedElement)  {
		if ..DeviceParameterList126RepZero(subElement,.addedElement)  {
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

///  ( ':' one_device_parameter )*
Method DeviceParameterList126RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..DeviceParameterList127Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ':' one_device_parameter
/// summary values::
Method DeviceParameterList127Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(":",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,":")  {
		if ..OneDeviceParameter(subElement,.addedElement)  {
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

///  device_parameters ::= ( '(' device_parameter_list ')' ) | one_device_parameter
Method DeviceParameters(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..DeviceParameters124Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OneDeviceParameter(subElement,.addedElement)  {
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

///  '(' device_parameter_list ')'
/// summary values:(
Method DeviceParameters124Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"(")  {
		if ..DeviceParameterList(subElement,.addedElement)  {
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

///  dim_expression ::= expression
Method DimExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(subElement,.addedElement)  {
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

///  do_command ::= ('do' | 'd') ( do_while | do_label )
Method DoCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..DoCommand128Sub(subElement,.addedElement)  {
		if ..DoCommand129Sub(subElement,.addedElement)  {
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

/// 'do' | 'd'
/// summary values:DO,D
Method DoCommand128Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K
	if '(..isKeywordInList($lb("DO","D"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
	if ..addKeyword(subElement,"DO")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"D")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  do_while | do_label
Method DoCommand129Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..DoWhile(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..DoLabel(subElement,.addedElement)  {
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

///  do_item ::= (object_variable) | this_object | simple_indirection | ( label_reference [ function_parameter_list ] ) | system_object | macrocall | intrinsicfncall | classexpr | ( '(' expression ')' [ object_chain ])
Method DoItem(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..DoItem133Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ThisObject(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SimpleIndirection(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..DoItem134Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SystemObject(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Macrocall(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Intrinsicfncall(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Classexpr(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..DoItem135Sub(subElement,.addedElement)  {
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

/// object_variable
Method DoItem133Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ObjectVariable(subElement,.addedElement)  {
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

///  label_reference [ function_parameter_list ]
Method DoItem134Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LabelReference(subElement,.addedElement)  {
		if $S(..FunctionParameterList(subElement,.addedElement) :1,1:1) {
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

///  '(' expression ')' [ object_chain ]
/// summary values:(
Method DoItem135Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&P&?4?
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"(")  {
		if ..Expression(subElement,.addedElement)  {
			if ..addPunctuation(subElement,")")  {
				if $S(..ObjectChain(subElement,.addedElement) :1,1:1) {
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

///  do_item_list ::= do_item ( ',' do_item)*
Method DoItemList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..DoItem(subElement,.addedElement)  {
		if ..DoItemList131RepZero(subElement,.addedElement)  {
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

///  ( ',' do_item)*
Method DoItemList131RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..DoItemList132Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' do_item
/// summary values:,
Method DoItemList132Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..DoItem(subElement,.addedElement)  {
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

///  do_label ::= [ post_conditional ] ( naked | do_item_list)
Method DoLabel(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..PostConditional(subElement,.addedElement) :1,1:1) {
		if ..DoLabel130Sub(subElement,.addedElement)  {
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

///  naked | do_item_list
Method DoLabel130Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Naked(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..DoItemList(subElement,.addedElement)  {
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

///  do_while ::= '{' [ cos_code_block ] '}' 'while' expression_list
/// summary values:{
Method DoWhile(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?4?&P&K&?1Rule?
	; first rule summary P
	if '(..isStringSingle("{",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"{")  {
		if $S(..CosCodeBlock(subElement,.addedElement) :1,1:1) {
			if ..addPunctuation(subElement,"}")  {
				if ..addKeyword(subElement,"WHILE")  {
					if ..ExpressionList(subElement,.addedElement)  {
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

///  do_while_command ::= ('do' | 'd') '{' [ cos_code_block ] '}' 'while' expression_list
Method DoWhileCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&P&?4?&P&K&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..DoWhileCommand136Sub(subElement,.addedElement)  {
		if ..addPunctuation(subElement,"{")  {
			if $S(..CosCodeBlock(subElement,.addedElement) :1,1:1) {
				if ..addPunctuation(subElement,"}")  {
					if ..addKeyword(subElement,"WHILE")  {
						if ..ExpressionList(subElement,.addedElement)  {
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

/// 'do' | 'd'
/// summary values:DO,D
Method DoWhileCommand136Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K
	if '(..isKeywordInList($lb("DO","D"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
	if ..addKeyword(subElement,"DO")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"D")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  dyadicop ::= "+" | "-" | "\\" | "/" | "\" | ">=" | ">" | "'>=" | "'>" | "<=" | "<" | "'<=" | "'<" | "=" | "'=" | "**" | "*" | "&&" | "']]" | "]]" | "']" | "]" | "'[" | "[" | "!" | "||" | "_" | hash_op | amp_op
Method Dyadicop(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"+")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"-")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"\\")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"/")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"\")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,">=")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,">")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"'>=")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"'>")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"<=")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"<")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"'<=")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"'<")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"=")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"'=")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"**")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"*")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"&&")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"']]")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"]]")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"']")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"]")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"'[")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"[")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"!")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"||")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"_")  {
		set done=1 ; or
	} elseif ..HashOp(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AmpOp(subElement,.addedElement)  {
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

///  else_block ::= 'else' ( ( '{' [ cos_code_block ] '}' ) | command_list_eol )
/// summary values:ELSE
Method ElseBlock(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("ELSE"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"ELSE")  {
		if ..ElseBlock162Sub(subElement,.addedElement)  {
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

///  ( '{' [ cos_code_block ] '}' ) | command_list_eol
Method ElseBlock162Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ElseBlock163Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CommandListEol(subElement,.addedElement)  {
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

///  '{' [ cos_code_block ] '}'
/// summary values:{
Method ElseBlock163Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?4?&P
	; first rule summary P
	if '(..isStringSingle("{",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"{")  {
		if $S(..CosCodeBlock(subElement,.addedElement) :1,1:1) {
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

///  else_command ::= ('else' | 'e') naked
Method ElseCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ElseCommand164Sub(subElement,.addedElement)  {
		if ..Naked(subElement,.addedElement)  {
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

/// 'else' | 'e'
/// summary values:ELSE,E
Method ElseCommand164Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K
	if '(..isKeywordInList($lb("ELSE","E"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
	if ..addKeyword(subElement,"ELSE")  {
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

///  elseif_block ::= 'elseif' expression_list ( ( '{' [ cos_code_block ] '}' ) | command_list_eol )
/// summary values:ELSEIF
Method ElseifBlock(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("ELSEIF"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"ELSEIF")  {
		if ..ExpressionList(subElement,.addedElement)  {
			if ..ElseifBlock160Sub(subElement,.addedElement)  {
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

///  ( '{' [ cos_code_block ] '}' ) | command_list_eol
Method ElseifBlock160Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ElseifBlock161Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CommandListEol(subElement,.addedElement)  {
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

///  '{' [ cos_code_block ] '}'
/// summary values:{
Method ElseifBlock161Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?4?&P
	; first rule summary P
	if '(..isStringSingle("{",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"{")  {
		if $S(..CosCodeBlock(subElement,.addedElement) :1,1:1) {
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

///  elseif_block_list ::= elseif_block ( elseif_block )*
Method ElseifBlockList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ElseifBlock(subElement,.addedElement)  {
		if ..ElseifBlockList158RepZero(subElement,.addedElement)  {
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

///  ( elseif_block )*
Method ElseifBlockList158RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ElseifBlockList159Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  elseif_block
Method ElseifBlockList159Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ElseifBlock(subElement,.addedElement)  {
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

///  expression ::= factor ( pattern_match | (dyadicop factor ))*
Method Expression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Factor(subElement,.addedElement)  {
		if ..Expression50RepZero(subElement,.addedElement)  {
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

///  ( pattern_match | (dyadicop factor ))*
Method Expression50RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..Expression51Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  pattern_match | (dyadicop factor )
Method Expression51Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..PatternMatch(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Expression52Sub(subElement,.addedElement)  {
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

/// dyadicop factor
Method Expression52Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Dyadicop(subElement,.addedElement)  {
		if ..Factor(subElement,.addedElement)  {
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

///  expression_function_call ::= '##expression' function_parameter_list
/// summary values:##EXPRESSION
Method ExpressionFunctionCall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle("##EXPRESSION",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"##expression")  {
		if ..FunctionParameterList(subElement,.addedElement)  {
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

///  expression_list ::= expression ( ',' expression )*
Method ExpressionList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(subElement,.addedElement)  {
		if ..ExpressionList115RepZero(subElement,.addedElement)  {
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

///  ( ',' expression )*
Method ExpressionList115RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ExpressionList116Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' expression
/// summary values:,
Method ExpressionList116Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..Expression(subElement,.addedElement)  {
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

///  extract_function_call ::= ('extract' | 'e') open_bracket expression [ ',' star_parameter [ ',' star_parameter ] ] close_bracket
Method ExtractFunctionCall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?1Rule?&?1Rule?&?4?&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ExtractFunctionCall321Sub(subElement,.addedElement)  {
		if ..OpenBracket(subElement,.addedElement)  {
			if ..Expression(subElement,.addedElement)  {
				if ..ExtractFunctionCall322OptGrp(subElement,.addedElement)  {
					if ..CloseBracket(subElement,.addedElement)  {
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

/// 'extract' | 'e'
/// summary values:EXTRACT,E
Method ExtractFunctionCall321Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K
	if '(..isKeywordInList($lb("EXTRACT","E"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
	if ..addKeyword(subElement,"EXTRACT")  {
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

/// 
/// summary values:,
Method ExtractFunctionCall322OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&?4?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..StarParameter(subElement,.addedElement)  {
			if ..ExtractFunctionCall323OptGrp(subElement,.addedElement)  {
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
/// summary values:,
Method ExtractFunctionCall323OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..StarParameter(subElement,.addedElement)  {
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

///  extract_function_call_set ::= ('extract' | 'e') open_bracket set_value_expression [ ',' star_parameter [ ',' star_parameter ] ] close_bracket
Method ExtractFunctionCallSet(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?1Rule?&?1Rule?&?4?&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ExtractFunctionCallSet324Sub(subElement,.addedElement)  {
		if ..OpenBracket(subElement,.addedElement)  {
			if ..SetValueExpression(subElement,.addedElement)  {
				if ..ExtractFunctionCallSet325OptGrp(subElement,.addedElement)  {
					if ..CloseBracket(subElement,.addedElement)  {
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

/// 'extract' | 'e'
/// summary values:EXTRACT,E
Method ExtractFunctionCallSet324Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K
	if '(..isKeywordInList($lb("EXTRACT","E"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
	if ..addKeyword(subElement,"EXTRACT")  {
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

/// 
/// summary values:,
Method ExtractFunctionCallSet325OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&?4?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..StarParameter(subElement,.addedElement)  {
			if ..ExtractFunctionCallSet326OptGrp(subElement,.addedElement)  {
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
/// summary values:,
Method ExtractFunctionCallSet326OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..StarParameter(subElement,.addedElement)  {
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

///  extrinsicfncall ::= '$$' label_reference [extrinsicfncall_parameter_list ]
/// summary values:$$
Method Extrinsicfncall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&?4?
	; first rule summary P
	if '(..isStringSingle("$$",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"$$")  {
		if ..LabelReference(subElement,.addedElement)  {
			if $S(..ExtrinsicfncallParameterList(subElement,.addedElement) :1,1:1) {
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

///  extrinsicfncall_parameter ::= ('.' (this_object_direct_property | simple_indirection | variable )) | expression
Method ExtrinsicfncallParameter(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ExtrinsicfncallParameter73Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Expression(subElement,.addedElement)  {
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

/// '.' (this_object_direct_property | simple_indirection | variable )
/// summary values:.
Method ExtrinsicfncallParameter73Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(".",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,".")  {
		if ..ExtrinsicfncallParameter74Sub(subElement,.addedElement)  {
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

/// this_object_direct_property | simple_indirection | variable
Method ExtrinsicfncallParameter74Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ThisObjectDirectProperty(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SimpleIndirection(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Variable(subElement,.addedElement)  {
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

///  extrinsicfncall_parameter_list ::= open_bracket [ [extrinsicfncall_parameter] ( ',' [extrinsicfncall_parameter] )* ] ['...'] close_bracket
Method ExtrinsicfncallParameterList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?&?4?&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OpenBracket(subElement,.addedElement)  {
		if ..ExtrinsicfncallParameterList70OptGrp(subElement,.addedElement)  {
			if $S(..addPunctuation(subElement,"...") :1,1:1) {
				if ..CloseBracket(subElement,.addedElement)  {
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

Method ExtrinsicfncallParameterList70OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..ExtrinsicfncallParameter(subElement,.addedElement) :1,1:1) {
		if ..ExtrinsicfncallParameterList71RepZero(subElement,.addedElement)  {
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

///  ( ',' [extrinsicfncall_parameter] )*
Method ExtrinsicfncallParameterList71RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ExtrinsicfncallParameterList72Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' [extrinsicfncall_parameter]
/// summary values:,
Method ExtrinsicfncallParameterList72Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?4?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if $S(..ExtrinsicfncallParameter(subElement,.addedElement) :1,1:1) {
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

///  factor ::= ( monadicop )* primary
Method Factor(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (?4?)*&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Factor53RepZero(subElement,.addedElement)  {
		if ..Primary(subElement,.addedElement)  {
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

///  ( monadicop )*
Method Factor53RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..Factor54Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  monadicop
Method Factor54Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Monadicop(subElement,.addedElement)  {
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

///  for_command ::= ('for' | 'f') [ for_parameters ] for_loop_statement
Method ForCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ForCommand137Sub(subElement,.addedElement)  {
		if $S(..ForParameters(subElement,.addedElement) :1,1:1) {
			if ..ForLoopStatement(subElement,.addedElement)  {
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

/// 'for' | 'f'
/// summary values:FOR,F
Method ForCommand137Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K
	if '(..isKeywordInList($lb("FOR","F"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
	if ..addKeyword(subElement,"FOR")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"F")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  for_end_loop_value ::= expression
Method ForEndLoopValue(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(subElement,.addedElement)  {
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

///  for_increment_value ::= expression
Method ForIncrementValue(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(subElement,.addedElement)  {
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

///  for_loop_specifier ::= for_start_value [ ':' for_increment_value [ ':' for_end_loop_value ] ]
Method ForLoopSpecifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ForStartValue(subElement,.addedElement)  {
		if ..ForLoopSpecifier144OptGrp(subElement,.addedElement)  {
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
/// summary values::
Method ForLoopSpecifier144OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&?4?
	; first rule summary P
	if '(..isStringSingle(":",.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,":")  {
		if ..ForIncrementValue(subElement,.addedElement)  {
			if ..ForLoopSpecifier145OptGrp(subElement,.addedElement)  {
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
/// summary values::
Method ForLoopSpecifier145OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(":",.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,":")  {
		if ..ForEndLoopValue(subElement,.addedElement)  {
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

///  for_loop_specifier_list ::= for_loop_specifier ( ',' for_loop_specifier )*
Method ForLoopSpecifierList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ForLoopSpecifier(subElement,.addedElement)  {
		if ..ForLoopSpecifierList142RepZero(subElement,.addedElement)  {
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

///  ( ',' for_loop_specifier )*
Method ForLoopSpecifierList142RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ForLoopSpecifierList143Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' for_loop_specifier
/// summary values:,
Method ForLoopSpecifierList143Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..ForLoopSpecifier(subElement,.addedElement)  {
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

///  for_loop_statement ::= ( '{' [ cos_command] [ cos_code_block ] '}' ) | (naked | command_list_eol )
Method ForLoopStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ForLoopStatement138Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ForLoopStatement139Sub(subElement,.addedElement)  {
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

///  '{' [ cos_command] [ cos_code_block ] '}'
/// summary values:{
Method ForLoopStatement138Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?4?&?4?&P
	; first rule summary P
	if '(..isStringSingle("{",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"{")  {
		if $S(..CosCommand(subElement,.addedElement) :1,1:1) {
			if $S(..CosCodeBlock(subElement,.addedElement) :1,1:1) {
				if ..addPunctuation(subElement,"}")  {
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

/// naked | command_list_eol
Method ForLoopStatement139Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Naked(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CommandListEol(subElement,.addedElement)  {
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

///  for_parameter ::= lvalue_expression '=' for_loop_specifier_list
Method ForParameter(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&P&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LvalueExpression(subElement,.addedElement)  {
		if ..addPunctuation(subElement,"=")  {
			if ..ForLoopSpecifierList(subElement,.addedElement)  {
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

///  for_parameters ::= for_parameter ( ',' for_parameter )*
Method ForParameters(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ForParameter(subElement,.addedElement)  {
		if ..ForParameters140RepZero(subElement,.addedElement)  {
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

///  ( ',' for_parameter )*
Method ForParameters140RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ForParameters141Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' for_parameter
/// summary values:,
Method ForParameters141Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..ForParameter(subElement,.addedElement)  {
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

///  for_start_value ::= expression
Method ForStartValue(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(subElement,.addedElement)  {
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

///  function_parameter ::= ( '.' ( this_object_direct_property | simple_indirection | variable )) | expression
Method FunctionParameter(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..FunctionParameter82Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Expression(subElement,.addedElement)  {
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

///  '.' ( this_object_direct_property | simple_indirection | variable )
/// summary values:.
Method FunctionParameter82Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(".",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,".")  {
		if ..FunctionParameter83Sub(subElement,.addedElement)  {
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

///  this_object_direct_property | simple_indirection | variable
Method FunctionParameter83Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ThisObjectDirectProperty(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SimpleIndirection(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Variable(subElement,.addedElement)  {
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

///  function_parameter_list ::= open_bracket [ [function_parameter] ( ',' [function_parameter] )* ] ['...'] close_bracket
Method FunctionParameterList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?&?4?&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OpenBracket(subElement,.addedElement)  {
		if ..FunctionParameterList79OptGrp(subElement,.addedElement)  {
			if $S(..addPunctuation(subElement,"...") :1,1:1) {
				if ..CloseBracket(subElement,.addedElement)  {
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

Method FunctionParameterList79OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..FunctionParameter(subElement,.addedElement) :1,1:1) {
		if ..FunctionParameterList80RepZero(subElement,.addedElement)  {
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

///  ( ',' [function_parameter] )*
Method FunctionParameterList80RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..FunctionParameterList81Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' [function_parameter]
/// summary values:,
Method FunctionParameterList81Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?4?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if $S(..FunctionParameter(subElement,.addedElement) :1,1:1) {
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

///  general_intrinsic ::= any_keyword function_parameter_list [ object_chain ]
Method GeneralIntrinsic(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?1Rule?&?4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..AnyKeyword(subElement,.addedElement)  {
		if ..FunctionParameterList(subElement,.addedElement)  {
			if $S(..ObjectChain(subElement,.addedElement) :1,1:1) {
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

///  general_intrinsic_set ::= any_keyword function_parameter_list [ object_chain ]
Method GeneralIntrinsicSet(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?1Rule?&?4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..AnyKeyword(subElement,.addedElement)  {
		if ..FunctionParameterList(subElement,.addedElement)  {
			if $S(..ObjectChain(subElement,.addedElement) :1,1:1) {
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

///  global_identifier ::= 'regexp:(((\%[a-zA-Z0-9])|(\$[a-zA-Z])|[a-zA-Z])[a-zA-Z0-9\.]*)'
/// summary values:REGEXP:(((\%[A-ZA-Z0-9])|(\$[A-ZA-Z])|[A-ZA-Z])[A-ZA-Z0-9\.]*)
Method GlobalIdentifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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

///  global_name ::= global_identifier
Method GlobalName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..GlobalIdentifier(subElement,.addedElement)  {
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

///  global_ref ::= global_ref_naked | global_ref_full
Method GlobalRef(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..GlobalRefNaked(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..GlobalRefFull(subElement,.addedElement)  {
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

///  global_ref_env ::= '|' [ expression ] '|'
/// summary values:|
Method GlobalRefEnv(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?4?&P
	; first rule summary P
	if '(..isStringSingle("|",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"|")  {
		if $S(..Expression(subElement,.addedElement) :1,1:1) {
			if ..addPunctuation(subElement,"|")  {
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

///  global_ref_env_two ::= '[' primary [ ',' primary ] ']'
/// summary values:[
Method GlobalRefEnvTwo(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&?4?&P
	; first rule summary P
	if '(..isStringSingle("[",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"[")  {
		if ..Primary(subElement,.addedElement)  {
			if ..GlobalRefEnvTwo98OptGrp(subElement,.addedElement)  {
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

/// 
/// summary values:,
Method GlobalRefEnvTwo98OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..Primary(subElement,.addedElement)  {
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

///  global_ref_full ::= '^' [ global_ref_env | global_ref_env_two ] (macrocall | global_name ) [subscript_parameter_list]
/// summary values:^
Method GlobalRefFull(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?4?&?1Rule?&?4?
	; first rule summary P
	if '(..isStringSingle("^",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"^")  {
		if ..GlobalRefFull96OptGrp(subElement,.addedElement)  {
			if ..GlobalRefFull97Sub(subElement,.addedElement)  {
				if $S(..SubscriptParameterList(subElement,.addedElement) :1,1:1) {
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

Method GlobalRefFull96OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..GlobalRefEnv(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..GlobalRefEnvTwo(subElement,.addedElement)  {
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

/// macrocall | global_name
Method GlobalRefFull97Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Macrocall(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..GlobalName(subElement,.addedElement)  {
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

///  global_ref_naked ::= '^' subscript_parameter_list
/// summary values:^
Method GlobalRefNaked(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle("^",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"^")  {
		if ..SubscriptParameterList(subElement,.addedElement)  {
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

///  global_ref_set ::= global_ref_naked | global_ref_full
Method GlobalRefSet(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..GlobalRefNaked(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..GlobalRefFull(subElement,.addedElement)  {
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

///  goto_case_clause ::= goto_case_clause_case ':' goto_case_clause_value
Method GotoCaseClause(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&P&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..GotoCaseClauseCase(subElement,.addedElement)  {
		if ..addPunctuation(subElement,":")  {
			if ..GotoCaseClauseValue(subElement,.addedElement)  {
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

///  goto_case_clause_case ::= expression
Method GotoCaseClauseCase(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(subElement,.addedElement)  {
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

///  goto_case_clause_default ::= ',' ':' label_reference
/// summary values:,
Method GotoCaseClauseDefault(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..addPunctuation(subElement,":")  {
			if ..LabelReference(subElement,.addedElement)  {
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

///  goto_case_clause_value ::= label_reference
Method GotoCaseClauseValue(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LabelReference(subElement,.addedElement)  {
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

///  goto_case_clauses ::= (( ',' goto_case_clause ))*
Method GotoCaseClauses(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (?4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..GotoCaseClauses318RepZero(subElement,.addedElement)  {
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

///  (( ',' goto_case_clause ))*
Method GotoCaseClauses318RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..GotoCaseClauses319Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

/// ( ',' goto_case_clause )
Method GotoCaseClauses319Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..GotoCaseClauses320Sub(subElement,.addedElement)  {
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

///  ',' goto_case_clause
/// summary values:,
Method GotoCaseClauses320Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..GotoCaseClause(subElement,.addedElement)  {
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

///  goto_case_function_call ::= '$case' open_bracket expression [ goto_case_clauses ] [ goto_case_clause_default ] close_bracket
/// summary values:$CASE
Method GotoCaseFunctionCall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&?1Rule?&?4?&?4?&?1Rule?
	; first rule summary P
	if '(..isStringSingle("$CASE",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"$case")  {
		if ..OpenBracket(subElement,.addedElement)  {
			if ..Expression(subElement,.addedElement)  {
				if $S(..GotoCaseClauses(subElement,.addedElement) :1,1:1) {
					if $S(..GotoCaseClauseDefault(subElement,.addedElement) :1,1:1) {
						if ..CloseBracket(subElement,.addedElement)  {
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

///  goto_command ::= ('goto' | 'g') [ post_conditional ] goto_dest_list
Method GotoCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..GotoCommand146Sub(subElement,.addedElement)  {
		if $S(..PostConditional(subElement,.addedElement) :1,1:1) {
			if ..GotoDestList(subElement,.addedElement)  {
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

/// 'goto' | 'g'
/// summary values:GOTO,G
Method GotoCommand146Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K
	if '(..isKeywordInList($lb("GOTO","G"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
	if ..addKeyword(subElement,"GOTO")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"G")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  goto_dest ::= goto_case_function_call | ( label_reference [ post_conditional ] )
Method GotoDest(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..GotoCaseFunctionCall(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..GotoDest149Sub(subElement,.addedElement)  {
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

///  label_reference [ post_conditional ]
Method GotoDest149Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LabelReference(subElement,.addedElement)  {
		if $S(..PostConditional(subElement,.addedElement) :1,1:1) {
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

///  goto_dest_list ::= goto_dest ( ',' goto_dest )*
Method GotoDestList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..GotoDest(subElement,.addedElement)  {
		if ..GotoDestList147RepZero(subElement,.addedElement)  {
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

///  ( ',' goto_dest )*
Method GotoDestList147RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..GotoDestList148Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' goto_dest
/// summary values:,
Method GotoDestList148Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..GotoDest(subElement,.addedElement)  {
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

///  halt_command ::= ('halt' | 'h') [ post_conditional ] naked
Method HaltCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..HaltCommand150Sub(subElement,.addedElement)  {
		if $S(..PostConditional(subElement,.addedElement) :1,1:1) {
			if ..Naked(subElement,.addedElement)  {
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

/// 'halt' | 'h'
/// summary values:HALT,H
Method HaltCommand150Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K
	if '(..isKeywordInList($lb("HALT","H"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
	if ..addKeyword(subElement,"HALT")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"H")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  hang_command ::= ('hang' | 'h') [ post_conditional ] hangtime
Method HangCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..HangCommand151Sub(subElement,.addedElement)  {
		if $S(..PostConditional(subElement,.addedElement) :1,1:1) {
			if ..Hangtime(subElement,.addedElement)  {
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

/// 'hang' | 'h'
/// summary values:HANG,H
Method HangCommand151Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K
	if '(..isKeywordInList($lb("HANG","H"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
	if ..addKeyword(subElement,"HANG")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"H")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  hang_value ::= expression
Method HangValue(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(subElement,.addedElement)  {
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

///  hangtime ::= hang_value ( ',' hang_value )*
Method Hangtime(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..HangValue(subElement,.addedElement)  {
		if ..Hangtime152RepZero(subElement,.addedElement)  {
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

///  ( ',' hang_value )*
Method Hangtime152RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..Hangtime153Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' hang_value
/// summary values:,
Method Hangtime153Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..HangValue(subElement,.addedElement)  {
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

///  hash_op ::= '#'
/// summary values:#
Method HashOp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("#",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"#")  {
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

///  html_body ::= 'NEED HTML BODY'
/// summary values:NEED HTML BODY
Method HtmlBody(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("NEED HTML BODY",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"NEED HTML BODY")  {
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

///  html_command ::= '&html<' html_body '>'
/// summary values:&HTML<
Method HtmlCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&P
	; first rule summary P
	if '(..isStringSingle("&HTML<",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"&html<")  {
		if ..HtmlBody(subElement,.addedElement)  {
			if ..addPunctuation(subElement,">")  {
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

///  if_command ::= ('if' | 'i') ( naked | expression_list) ( naked | [then_block] ) [ elseif_block_list ] [ else_block ]
Method IfCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?1Rule?&?1Rule?&?4?&?4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..IfCommand154Sub(subElement,.addedElement)  {
		if ..IfCommand155Sub(subElement,.addedElement)  {
			if ..IfCommand156Sub(subElement,.addedElement)  {
				if $S(..ElseifBlockList(subElement,.addedElement) :1,1:1) {
					if $S(..ElseBlock(subElement,.addedElement) :1,1:1) {
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

/// 'if' | 'i'
/// summary values:IF,I
Method IfCommand154Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K
	if '(..isKeywordInList($lb("IF","I"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
	if ..addKeyword(subElement,"IF")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"I")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  naked | expression_list
Method IfCommand155Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Naked(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ExpressionList(subElement,.addedElement)  {
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

///  naked | [then_block]
Method IfCommand156Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?4?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Naked(subElement,.addedElement)  {
		set done=1 ; or
	} elseif $S(..ThenBlock(subElement,.addedElement) :1,1:1) {
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

///  increment_function_call ::= ('increment' | '$i') '(' variable_set [',' expression ] ')'
Method IncrementFunctionCall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&P&?1Rule?&?4?&P
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..IncrementFunctionCall355Sub(subElement,.addedElement)  {
		if ..addPunctuation(subElement,"(")  {
			if ..VariableSet(subElement,.addedElement)  {
				if ..IncrementFunctionCall356OptGrp(subElement,.addedElement)  {
					if ..addPunctuation(subElement,")")  {
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

/// 'increment' | '$i'
Method IncrementFunctionCall355Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|P
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"INCREMENT")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"$i")  {
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

/// 
/// summary values:,
Method IncrementFunctionCall356OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
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

///  Indirection ::= Subscript_Indirection | Simple_Indirection
Method Indirection(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SubscriptIndirection(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SimpleIndirection(subElement,.addedElement)  {
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

///  intrinsicfncall ::= '$' (special_intrinsic | general_intrinsic )
/// summary values:$
Method Intrinsicfncall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle("$",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"$")  {
		if ..Intrinsicfncall76Sub(subElement,.addedElement)  {
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

/// special_intrinsic | general_intrinsic
Method Intrinsicfncall76Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SpecialIntrinsic(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..GeneralIntrinsic(subElement,.addedElement)  {
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

///  intrinsicfncall_parameter ::= expression
Method IntrinsicfncallParameter(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(subElement,.addedElement)  {
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

///  intrinsicfncall_parameter_list ::= open_bracket [expression] ( ',' [expression] )* close_bracket
Method IntrinsicfncallParameterList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?&(?4?)*&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OpenBracket(subElement,.addedElement)  {
		if $S(..Expression(subElement,.addedElement) :1,1:1) {
			if ..IntrinsicfncallParameterList77RepZero(subElement,.addedElement)  {
				if ..CloseBracket(subElement,.addedElement)  {
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

///  ( ',' [expression] )*
Method IntrinsicfncallParameterList77RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..IntrinsicfncallParameterList78Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' [expression]
/// summary values:,
Method IntrinsicfncallParameterList78Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?4?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if $S(..Expression(subElement,.addedElement) :1,1:1) {
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

///  intrinsicfncall_set ::= '$' (special_intrinsic_set | general_intrinsic_set )
/// summary values:$
Method IntrinsicfncallSet(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle("$",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"$")  {
		if ..IntrinsicfncallSet84Sub(subElement,.addedElement)  {
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

/// special_intrinsic_set | general_intrinsic_set
Method IntrinsicfncallSet84Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SpecialIntrinsicSet(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..GeneralIntrinsicSet(subElement,.addedElement)  {
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

///  job_argument ::= job_call [ job_process_parameters ] [ job_timeout_spec ]
Method JobArgument(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?&?4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..JobCall(subElement,.addedElement)  {
		if $S(..JobProcessParameters(subElement,.addedElement) :1,1:1) {
			if $S(..JobTimeoutSpec(subElement,.addedElement) :1,1:1) {
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

///  job_arguments ::= job_argument ( ',' job_argument )*
Method JobArguments(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..JobArgument(subElement,.addedElement)  {
		if ..JobArguments166RepZero(subElement,.addedElement)  {
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

///  ( ',' job_argument )*
Method JobArguments166RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..JobArguments167Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' job_argument
/// summary values:,
Method JobArguments167Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..JobArgument(subElement,.addedElement)  {
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

///  job_call ::= job_routine_call | job_class_method_call | job_instanceMethod_call | job_classmethodfn_call
Method JobCall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?|?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..JobRoutineCall(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..JobClassMethodCall(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..JobInstancemethodCall(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..JobClassmethodfnCall(subElement,.addedElement)  {
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

///  job_class_method_call ::= class_expression
Method JobClassMethodCall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ClassExpression(subElement,.addedElement)  {
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

///  job_classmethodfn_call ::= '$classmethod' '(' expression ',' expression ( ',' expression )* ')'
/// summary values:$CLASSMETHOD
Method JobClassmethodfnCall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&P&?1Rule?&P&?1Rule?&(?4?)*&P
	; first rule summary P
	if '(..isStringSingle("$CLASSMETHOD",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"$classmethod")  {
		if ..addPunctuation(subElement,"(")  {
			if ..Expression(subElement,.addedElement)  {
				if ..addPunctuation(subElement,",")  {
					if ..Expression(subElement,.addedElement)  {
						if ..JobClassmethodfnCall177RepZero(subElement,.addedElement)  {
							if ..addPunctuation(subElement,")")  {
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

///  ( ',' expression )*
Method JobClassmethodfnCall177RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..JobClassmethodfnCall178Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' expression
/// summary values:,
Method JobClassmethodfnCall178Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..Expression(subElement,.addedElement)  {
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

///  job_command ::= ('job' | 'j') [ post_conditional ] job_arguments
Method JobCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..JobCommand165Sub(subElement,.addedElement)  {
		if $S(..PostConditional(subElement,.addedElement) :1,1:1) {
			if ..JobArguments(subElement,.addedElement)  {
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

/// 'job' | 'j'
/// summary values:JOB,J
Method JobCommand165Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K
	if '(..isKeywordInList($lb("JOB","J"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
	if ..addKeyword(subElement,"JOB")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"J")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  job_instanceMethod_call ::= '..' identifier function_parameter_list
/// summary values:..
Method JobInstancemethodCall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&?1Rule?
	; first rule summary P
	if '(..isStringSingle("..",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"..")  {
		if ..Identifier(subElement,.addedElement)  {
			if ..FunctionParameterList(subElement,.addedElement)  {
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

///  job_nspace_param ::= [ expression ]
Method JobNspaceParam(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..Expression(subElement,.addedElement) :1,1:1) {
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

///  job_os-directory ::= [ expression ]
Method JobOsdirectory(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..Expression(subElement,.addedElement) :1,1:1) {
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

///  job_principal-input ::= [ expression ]
Method JobPrincipalinput(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..Expression(subElement,.addedElement) :1,1:1) {
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

///  job_principal-output ::= [ expression ]
Method JobPrincipaloutput(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..Expression(subElement,.addedElement) :1,1:1) {
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

///  job_priority ::= [ expression ]
Method JobPriority(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..Expression(subElement,.addedElement) :1,1:1) {
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

///  job_process_parameters ::= ':' ( job_process_parameters_inbrackets | job_process_parameters_nobrackets )
/// summary values::
Method JobProcessParameters(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(":",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,":")  {
		if ..JobProcessParameters168Sub(subElement,.addedElement)  {
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

///  job_process_parameters_inbrackets | job_process_parameters_nobrackets
Method JobProcessParameters168Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..JobProcessParametersInbrackets(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..JobProcessParametersNobrackets(subElement,.addedElement)  {
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

///  job_process_parameters_inbrackets ::= '(' ( job_nspace_param [ ':' [ job_switch_param] [ ':' [ job_principal-input] [ ':' [ job_principal-output] [ ':' [ job_priority] [ ':' [ job_os-directory] [ ':' [job_process-name] ] ] ] ] ] ] ) ')'
/// summary values:(
Method JobProcessParametersInbrackets(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"(")  {
		if ..JobProcessParametersInbrackets169Sub(subElement,.addedElement)  {
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

///  job_nspace_param [ ':' [ job_switch_param] [ ':' [ job_principal-input] [ ':' [ job_principal-output] [ ':' [ job_priority] [ ':' [ job_os-directory] [ ':' [job_process-name] ] ] ] ] ] ]
Method JobProcessParametersInbrackets169Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..JobNspaceParam(subElement,.addedElement)  {
		if ..JobProcessParametersInbrackets170OptGrp(subElement,.addedElement)  {
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
/// summary values::
Method JobProcessParametersInbrackets170OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?4?&?4?
	; first rule summary P
	if '(..isStringSingle(":",.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,":")  {
		if $S(..JobSwitchParam(subElement,.addedElement) :1,1:1) {
			if ..JobProcessParametersInbrackets171OptGrp(subElement,.addedElement)  {
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
/// summary values::
Method JobProcessParametersInbrackets171OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?4?&?4?
	; first rule summary P
	if '(..isStringSingle(":",.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,":")  {
		if $S(..JobPrincipalinput(subElement,.addedElement) :1,1:1) {
			if ..JobProcessParametersInbrackets172OptGrp(subElement,.addedElement)  {
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
/// summary values::
Method JobProcessParametersInbrackets172OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?4?&?4?
	; first rule summary P
	if '(..isStringSingle(":",.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,":")  {
		if $S(..JobPrincipaloutput(subElement,.addedElement) :1,1:1) {
			if ..JobProcessParametersInbrackets173OptGrp(subElement,.addedElement)  {
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
/// summary values::
Method JobProcessParametersInbrackets173OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?4?&?4?
	; first rule summary P
	if '(..isStringSingle(":",.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,":")  {
		if $S(..JobPriority(subElement,.addedElement) :1,1:1) {
			if ..JobProcessParametersInbrackets174OptGrp(subElement,.addedElement)  {
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
/// summary values::
Method JobProcessParametersInbrackets174OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?4?&?4?
	; first rule summary P
	if '(..isStringSingle(":",.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,":")  {
		if $S(..JobOsdirectory(subElement,.addedElement) :1,1:1) {
			if ..JobProcessParametersInbrackets175OptGrp(subElement,.addedElement)  {
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
/// summary values::
Method JobProcessParametersInbrackets175OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?4?
	; first rule summary P
	if '(..isStringSingle(":",.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,":")  {
		if $S(..JobProcessname(subElement,.addedElement) :1,1:1) {
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

///  job_process_parameters_nobrackets ::= [ job_nspace_param ]
Method JobProcessParametersNobrackets(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..JobNspaceParam(subElement,.addedElement) :1,1:1) {
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

///  job_process-name ::= [ expression ]
Method JobProcessname(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..Expression(subElement,.addedElement) :1,1:1) {
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

///  job_routine_call ::= identifier [ '^' identifier ] [ parameter_list]
Method JobRoutineCall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?&?4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Identifier(subElement,.addedElement)  {
		if ..JobRoutineCall176OptGrp(subElement,.addedElement)  {
			if $S(..ParameterList(subElement,.addedElement) :1,1:1) {
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
/// summary values:^
Method JobRoutineCall176OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle("^",.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"^")  {
		if ..Identifier(subElement,.addedElement)  {
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

///  job_switch_param ::= [ expression ]
Method JobSwitchParam(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..Expression(subElement,.addedElement) :1,1:1) {
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

///  job_timeout_spec ::= ':' expression
/// summary values::
Method JobTimeoutSpec(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(":",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,":")  {
		if ..Expression(subElement,.addedElement)  {
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

///  js_body ::= 'NEED JS BODY'
/// summary values:NEED JS BODY
Method JsBody(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("NEED JS BODY",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"NEED JS BODY")  {
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

///  js_command ::= ('&javascript<' | '&js<') js_body '>'
Method JsCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?1Rule?&P
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..JsCommand314Sub(subElement,.addedElement)  {
		if ..JsBody(subElement,.addedElement)  {
			if ..addPunctuation(subElement,">")  {
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

/// '&javascript<' | '&js<'
/// summary values:&JAVASCRIPT<,&JS<
Method JsCommand314Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|P
	if '(..isStringInList($lb("&JAVASCRIPT<","&JS<"),12,.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
	if ..addPunctuation(subElement,"&javascript<")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"&js<")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  json_string ::= 'NEEDS JSON STRING'
/// summary values:NEEDS JSON STRING
Method JsonString(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("NEEDS JSON STRING",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"NEEDS JSON STRING")  {
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

///  kill_command ::= ( 'kill' | 'k') [ post_conditional ] ( naked | kill_parameter_list )
Method KillCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..KillCommand179Sub(subElement,.addedElement)  {
		if $S(..PostConditional(subElement,.addedElement) :1,1:1) {
			if ..KillCommand180Sub(subElement,.addedElement)  {
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

///  'kill' | 'k'
/// summary values:KILL,K
Method KillCommand179Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K
	if '(..isKeywordInList($lb("KILL","K"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
	if ..addKeyword(subElement,"KILL")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"K")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  naked | kill_parameter_list
Method KillCommand180Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Naked(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..KillParameterList(subElement,.addedElement)  {
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

///  kill_exclusive_list ::= '(' kill_item_list ')'
/// summary values:(
Method KillExclusiveList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"(")  {
		if ..KillItemList(subElement,.addedElement)  {
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

///  kill_item ::= set_item_single
Method KillItem(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SetItemSingle(subElement,.addedElement)  {
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

///  kill_item_list ::= kill_item ( ',' kill_item )*
Method KillItemList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..KillItem(subElement,.addedElement)  {
		if ..KillItemList183RepZero(subElement,.addedElement)  {
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

///  ( ',' kill_item )*
Method KillItemList183RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..KillItemList184Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' kill_item
/// summary values:,
Method KillItemList184Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..KillItem(subElement,.addedElement)  {
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

///  kill_parameter ::= kill_exclusive_list | kill_item
Method KillParameter(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..KillExclusiveList(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..KillItem(subElement,.addedElement)  {
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

///  kill_parameter_list ::= kill_parameter ( ',' kill_parameter )*
Method KillParameterList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..KillParameter(subElement,.addedElement)  {
		if ..KillParameterList181RepZero(subElement,.addedElement)  {
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

///  ( ',' kill_parameter )*
Method KillParameterList181RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..KillParameterList182Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' kill_parameter
/// summary values:,
Method KillParameterList182Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..KillParameter(subElement,.addedElement)  {
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

///  label ::= 'regexp:[0-9A-Za-z]+'
/// summary values:REGEXP:[0-9A-ZA-Z]+
Method Label(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("REGEXP:[0-9A-ZA-Z]+",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"regexp:[0-9A-Za-z]+")  {
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

///  label_definition ::= label_identifier [ label_formal_specification ] [ label_scope ] [ '{' cos_code_block '}']
Method LabelDefinition(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?&?4?&?4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LabelIdentifier(subElement,.addedElement)  {
		if $S(..LabelFormalSpecification(subElement,.addedElement) :1,1:1) {
			if $S(..LabelScope(subElement,.addedElement) :1,1:1) {
				if ..LabelDefinition13OptGrp(subElement,.addedElement)  {
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

/// 
/// summary values:{
Method LabelDefinition13OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&P
	; first rule summary P
	if '(..isStringSingle("{",.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"{")  {
		if ..CosCodeBlock(subElement,.addedElement)  {
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
		set ret=1 /* failure rollsback but returns OK */
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  label_formal_specification ::= '(' [ label-formal-param-list ] ')'
/// summary values:(
Method LabelFormalSpecification(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?4?&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"(")  {
		if $S(..Labelformalparamlist(subElement,.addedElement) :1,1:1) {
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

///  label_identifier ::= [ '%' ] 'regexp:[0-9A-Za-z]+'
Method LabelIdentifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?&P
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..addPunctuation(subElement,"%") :1,1:1) {
		if ..addPunctuation(subElement,"regexp:[0-9A-Za-z]+")  {
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

///  label_public_vars ::= '[' variable ( ',' variable )* ']'
/// summary values:[
Method LabelPublicVars(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&(?4?)*&P
	; first rule summary P
	if '(..isStringSingle("[",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"[")  {
		if ..Variable(subElement,.addedElement)  {
			if ..LabelPublicVars17RepZero(subElement,.addedElement)  {
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

///  ( ',' variable )*
Method LabelPublicVars17RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..LabelPublicVars18Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' variable
/// summary values:,
Method LabelPublicVars18Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..Variable(subElement,.addedElement)  {
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

///  label_reference ::= (( label_identifier | simple_indirection ) [ '^' [routine_env] ( routine_identifier | simple_indirection) ]) | ('^' [routine_env] (routine_identifier | simple_indirection) )
Method LabelReference(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LabelReference19Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..LabelReference23Sub(subElement,.addedElement)  {
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

/// ( label_identifier | simple_indirection ) [ '^' [routine_env] ( routine_identifier | simple_indirection) ]
Method LabelReference19Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LabelReference20Sub(subElement,.addedElement)  {
		if ..LabelReference21OptGrp(subElement,.addedElement)  {
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

///  label_identifier | simple_indirection
Method LabelReference20Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LabelIdentifier(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SimpleIndirection(subElement,.addedElement)  {
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

/// 
/// summary values:^
Method LabelReference21OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?4?&?1Rule?
	; first rule summary P
	if '(..isStringSingle("^",.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"^")  {
		if $S(..RoutineEnv(subElement,.addedElement) :1,1:1) {
			if ..LabelReference22Sub(subElement,.addedElement)  {
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

///  routine_identifier | simple_indirection
Method LabelReference22Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..RoutineIdentifier(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SimpleIndirection(subElement,.addedElement)  {
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

/// '^' [routine_env] (routine_identifier | simple_indirection)
/// summary values:^
Method LabelReference23Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?4?&?1Rule?
	; first rule summary P
	if '(..isStringSingle("^",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"^")  {
		if $S(..RoutineEnv(subElement,.addedElement) :1,1:1) {
			if ..LabelReference24Sub(subElement,.addedElement)  {
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

/// routine_identifier | simple_indirection
Method LabelReference24Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..RoutineIdentifier(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SimpleIndirection(subElement,.addedElement)  {
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

///  label_scope ::= ( [ label_public_vars ] 'public' | 'private' | 'methodimpl' )
Method LabelScope(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LabelScope16Sub(subElement,.addedElement)  {
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

///  [ label_public_vars ] 'public' | 'private' | 'methodimpl'
Method LabelScope16Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?&K|K|K
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..LabelPublicVars(subElement,.addedElement) :1,1:1) {
		if ..addKeyword(subElement,"PUBLIC")  {
			set done=1 ; or
		} elseif ..addKeyword(subElement,"PRIVATE")  {
			set done=1 ; or
		} elseif ..addKeyword(subElement,"METHODIMPL")  {
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

///  label-formal-param-list ::= label-one-formal-param ( ',' label-one-formal-param )* ['...']
Method Labelformalparamlist(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*&?4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Labeloneformalparam(subElement,.addedElement)  {
		if ..Labelformalparamlist14RepZero(subElement,.addedElement)  {
			if $S(..addPunctuation(subElement,"...") :1,1:1) {
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

///  ( ',' label-one-formal-param )*
Method Labelformalparamlist14RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..Labelformalparamlist15Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' label-one-formal-param
/// summary values:,
Method Labelformalparamlist15Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..Labeloneformalparam(subElement,.addedElement)  {
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

///  label-one-formal-param ::= [ '&' ] label-param-name [ label-param-default-value ]
Method Labeloneformalparam(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?&?1Rule?&?4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..addPunctuation(subElement,"&") :1,1:1) {
		if ..Labelparamname(subElement,.addedElement)  {
			if $S(..Labelparamdefaultvalue(subElement,.addedElement) :1,1:1) {
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

///  label-param-default-value ::= '=' expression
/// summary values:=
Method Labelparamdefaultvalue(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle("=",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"=")  {
		if ..Expression(subElement,.addedElement)  {
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

///  label-param-name ::= variable_set
Method Labelparamname(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..VariableSet(subElement,.addedElement)  {
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

///  line_comment ::= ';' text_to_eol | '//' text_to_eol | '#;' text_to_eol | '##;' text_to_eol
/// summary values:;
Method LineComment(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?|P&?1Rule?|P&?1Rule?|P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(";",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,";")  {
		if ..TextToEol(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..addPunctuation(subElement,"//")  {
			if ..TextToEol(subElement,.addedElement)  {
				set done=1 ; or
			} elseif ..addPunctuation(subElement,"#;")  {
				if ..TextToEol(subElement,.addedElement)  {
					set done=1 ; or
				} elseif ..addPunctuation(subElement,"##;")  {
					if ..TextToEol(subElement,.addedElement)  {
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

///  line_reference ::= [ label ] [ [ offset_sign ] offset ]
Method LineReference(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?&?4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..Label(subElement,.addedElement) :1,1:1) {
		if ..LineReference221OptGrp(subElement,.addedElement)  {
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

Method LineReference221OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..OffsetSign(subElement,.addedElement) :1,1:1) {
		if ..Offset(subElement,.addedElement)  {
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

///  lineref1 ::= line_reference
Method Lineref1(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LineReference(subElement,.addedElement)  {
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

///  lineref2 ::= line_reference
Method Lineref2(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LineReference(subElement,.addedElement)  {
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

///  listbuild_function_call ::= ('listbuild' | 'lb') open_bracket expression (',' expression)* close_bracket
Method ListbuildFunctionCall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?1Rule?&?1Rule?&(?4?)*&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ListbuildFunctionCall333Sub(subElement,.addedElement)  {
		if ..OpenBracket(subElement,.addedElement)  {
			if ..Expression(subElement,.addedElement)  {
				if ..ListbuildFunctionCall334RepZero(subElement,.addedElement)  {
					if ..CloseBracket(subElement,.addedElement)  {
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

/// 'listbuild' | 'lb'
/// summary values:LISTBUILD,LB
Method ListbuildFunctionCall333Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K
	if '(..isKeywordInList($lb("LISTBUILD","LB"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
	if ..addKeyword(subElement,"LISTBUILD")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"LB")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  (',' expression)*
Method ListbuildFunctionCall334RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ListbuildFunctionCall335Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

/// ',' expression
/// summary values:,
Method ListbuildFunctionCall335Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..Expression(subElement,.addedElement)  {
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

///  listbuild_function_call_set ::= ('listbuild' | 'lb') open_bracket set_value_expression (',' variable_set)* close_bracket
Method ListbuildFunctionCallSet(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?1Rule?&?1Rule?&(?4?)*&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ListbuildFunctionCallSet336Sub(subElement,.addedElement)  {
		if ..OpenBracket(subElement,.addedElement)  {
			if ..SetValueExpression(subElement,.addedElement)  {
				if ..ListbuildFunctionCallSet337RepZero(subElement,.addedElement)  {
					if ..CloseBracket(subElement,.addedElement)  {
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

/// 'listbuild' | 'lb'
/// summary values:LISTBUILD,LB
Method ListbuildFunctionCallSet336Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K
	if '(..isKeywordInList($lb("LISTBUILD","LB"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
	if ..addKeyword(subElement,"LISTBUILD")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"LB")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  (',' variable_set)*
Method ListbuildFunctionCallSet337RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ListbuildFunctionCallSet338Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

/// ',' variable_set
/// summary values:,
Method ListbuildFunctionCallSet338Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..VariableSet(subElement,.addedElement)  {
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

///  listitem_function_call ::= ('listget' | 'list' | 'li' |'lg' ) open_bracket expression [ ',' star_parameter [ ',' star_parameter ] ] close_bracket
Method ListitemFunctionCall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?1Rule?&?1Rule?&?4?&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ListitemFunctionCall342Sub(subElement,.addedElement)  {
		if ..OpenBracket(subElement,.addedElement)  {
			if ..Expression(subElement,.addedElement)  {
				if ..ListitemFunctionCall343OptGrp(subElement,.addedElement)  {
					if ..CloseBracket(subElement,.addedElement)  {
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

/// 'listget' | 'list' | 'li' |'lg'
/// summary values:LISTGET,LIST,LI,LG
Method ListitemFunctionCall342Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K|K|K
	if '(..isKeywordInList($lb("LISTGET","LIST","LI","LG"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
	if ..addKeyword(subElement,"LISTGET")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"LIST")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"LI")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"LG")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

/// 
/// summary values:,
Method ListitemFunctionCall343OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&?4?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..StarParameter(subElement,.addedElement)  {
			if ..ListitemFunctionCall344OptGrp(subElement,.addedElement)  {
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
/// summary values:,
Method ListitemFunctionCall344OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..StarParameter(subElement,.addedElement)  {
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

///  listitem_function_call_set ::= ('list' | 'li') open_bracket set_value_expression [ ',' star_parameter [ ',' star_parameter ] ] close_bracket
Method ListitemFunctionCallSet(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?1Rule?&?1Rule?&?4?&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ListitemFunctionCallSet345Sub(subElement,.addedElement)  {
		if ..OpenBracket(subElement,.addedElement)  {
			if ..SetValueExpression(subElement,.addedElement)  {
				if ..ListitemFunctionCallSet346OptGrp(subElement,.addedElement)  {
					if ..CloseBracket(subElement,.addedElement)  {
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

/// 'list' | 'li'
/// summary values:LIST,LI
Method ListitemFunctionCallSet345Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K
	if '(..isKeywordInList($lb("LIST","LI"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
	if ..addKeyword(subElement,"LIST")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"LI")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

/// 
/// summary values:,
Method ListitemFunctionCallSet346OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&?4?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..StarParameter(subElement,.addedElement)  {
			if ..ListitemFunctionCallSet347OptGrp(subElement,.addedElement)  {
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
/// summary values:,
Method ListitemFunctionCallSet347OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..StarParameter(subElement,.addedElement)  {
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

///  listupdate_function_call ::= ('listupdate' | 'lu') open_bracket expression ',' expression (',' expression ':' expression)* close_bracket
Method ListupdateFunctionCall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?1Rule?&?1Rule?&P&?1Rule?&(?4?)*&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ListupdateFunctionCall339Sub(subElement,.addedElement)  {
		if ..OpenBracket(subElement,.addedElement)  {
			if ..Expression(subElement,.addedElement)  {
				if ..addPunctuation(subElement,",")  {
					if ..Expression(subElement,.addedElement)  {
						if ..ListupdateFunctionCall340RepZero(subElement,.addedElement)  {
							if ..CloseBracket(subElement,.addedElement)  {
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

/// 'listupdate' | 'lu'
/// summary values:LISTUPDATE,LU
Method ListupdateFunctionCall339Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K
	if '(..isKeywordInList($lb("LISTUPDATE","LU"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
	if ..addKeyword(subElement,"LISTUPDATE")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"LU")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  (',' expression ':' expression)*
Method ListupdateFunctionCall340RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ListupdateFunctionCall341Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

/// ',' expression ':' expression
/// summary values:,
Method ListupdateFunctionCall341Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..Expression(subElement,.addedElement)  {
			if ..addPunctuation(subElement,":")  {
				if ..Expression(subElement,.addedElement)  {
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

///  lock_command ::= ('lock' | 'l') [post_conditional ] ( naked | ( [ lock_parameter ( ',' lock_parameter)* ] [ else_block ] ) )
Method LockCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LockCommand185Sub(subElement,.addedElement)  {
		if $S(..PostConditional(subElement,.addedElement) :1,1:1) {
			if ..LockCommand186Sub(subElement,.addedElement)  {
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

/// 'lock' | 'l'
/// summary values:LOCK,L
Method LockCommand185Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K
	if '(..isKeywordInList($lb("LOCK","L"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
	if ..addKeyword(subElement,"LOCK")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"L")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  naked | ( [ lock_parameter ( ',' lock_parameter)* ] [ else_block ] )
Method LockCommand186Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Naked(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..LockCommand187Sub(subElement,.addedElement)  {
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

///  [ lock_parameter ( ',' lock_parameter)* ] [ else_block ]
Method LockCommand187Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?&?4?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LockCommand188OptGrp(subElement,.addedElement)  {
		if $S(..ElseBlock(subElement,.addedElement) :1,1:1) {
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

Method LockCommand188OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LockParameter(subElement,.addedElement)  {
		if ..LockCommand189RepZero(subElement,.addedElement)  {
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

///  ( ',' lock_parameter)*
Method LockCommand189RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..LockCommand190Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' lock_parameter
/// summary values:,
Method LockCommand190Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..LockParameter(subElement,.addedElement)  {
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

///  lock_parameter ::= [ '+' | '-' ] (lockname_list | lockname_list_item) [ lock_timeout ]
Method LockParameter(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?&?1Rule?&?4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LockParameter191OptGrp(subElement,.addedElement)  {
		if ..LockParameter192Sub(subElement,.addedElement)  {
			if $S(..LockTimeout(subElement,.addedElement) :1,1:1) {
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
/// summary values:+,-
Method LockParameter191OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|P
	if '(..isStringInList($lb("+","-"),1,.value)) { quit 1 /* not found is OK */ }
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
	if ..addPunctuation(subElement,"+")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"-")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=1 /* failure rollsback but returns OK */
	}
	quit ret
}

/// lockname_list | lockname_list_item
Method LockParameter192Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LocknameList(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..LocknameListItem(subElement,.addedElement)  {
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

///  lock_timeout ::= ':' expression
/// summary values::
Method LockTimeout(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(":",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,":")  {
		if ..Expression(subElement,.addedElement)  {
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

///  lock_type ::= hash_op expression
Method LockType(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..HashOp(subElement,.addedElement)  {
		if ..Expression(subElement,.addedElement)  {
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

///  lockname ::= global_ref | variable | macrocall | indirection
Method Lockname(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?|?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..GlobalRef(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Variable(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Macrocall(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Indirection(subElement,.addedElement)  {
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

///  lockname_list ::= '(' lockname_list_item ( ',' lockname_list_item )* ')'
/// summary values:(
Method LocknameList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&(?4?)*&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"(")  {
		if ..LocknameListItem(subElement,.addedElement)  {
			if ..LocknameList193RepZero(subElement,.addedElement)  {
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

///  ( ',' lockname_list_item )*
Method LocknameList193RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..LocknameList194Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' lockname_list_item
/// summary values:,
Method LocknameList194Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..LocknameListItem(subElement,.addedElement)  {
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

///  lockname_list_item ::= lockname [ lock_type ]
Method LocknameListItem(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Lockname(subElement,.addedElement)  {
		if $S(..LockType(subElement,.addedElement) :1,1:1) {
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

///  lvalue_expression ::= this_object_set | variable_set | intrinsicfncall_set | special_variable | macrocall | Indirection | global_ref_set
Method LvalueExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ThisObjectSet(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..VariableSet(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..IntrinsicfncallSet(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SpecialVariable(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Macrocall(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Indirection(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..GlobalRefSet(subElement,.addedElement)  {
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

///  macro_expression ::= expression_function_call | safeexpression_function_call
Method MacroExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ExpressionFunctionCall(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SafeexpressionFunctionCall(subElement,.addedElement)  {
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

///  macro_identifier ::= [ '%' ] 'regexp:[0-9A-Za-z]+'
Method MacroIdentifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?&P
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..addPunctuation(subElement,"%") :1,1:1) {
		if ..addPunctuation(subElement,"regexp:[0-9A-Za-z]+")  {
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

///  macro_parameter ::= ('.' variable_set ) | expression
Method MacroParameter(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..MacroParameter69Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Expression(subElement,.addedElement)  {
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

/// '.' variable_set
/// summary values:.
Method MacroParameter69Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(".",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,".")  {
		if ..VariableSet(subElement,.addedElement)  {
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

///  macro_parameter_list ::= '(' [ [macro_parameter] ( ',' [macro_parameter] )* ] ')'
/// summary values:(
Method MacroParameterList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?4?&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"(")  {
		if ..MacroParameterList66OptGrp(subElement,.addedElement)  {
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

Method MacroParameterList66OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..MacroParameter(subElement,.addedElement) :1,1:1) {
		if ..MacroParameterList67RepZero(subElement,.addedElement)  {
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

///  ( ',' [macro_parameter] )*
Method MacroParameterList67RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..MacroParameterList68Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' [macro_parameter]
/// summary values:,
Method MacroParameterList68Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?4?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if $S(..MacroParameter(subElement,.addedElement) :1,1:1) {
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

///  macro_parameter_text ::= '(' any_text_upto_close_bracket ')'
/// summary values:(
Method MacroParameterText(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"(")  {
		if ..AnyTextUptoCloseBracket(subElement,.addedElement)  {
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

///  macrocall ::= '$$$' macro_identifier [ macro_parameter_list | macro_parameter_text ] [ macro_parameter_list ] [ object_chain ]
/// summary values:$$$
Method Macrocall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&?4?&?4?&?4?
	; first rule summary P
	if '(..isStringSingle("$$$",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"$$$")  {
		if ..MacroIdentifier(subElement,.addedElement)  {
			if ..Macrocall65OptGrp(subElement,.addedElement)  {
				if $S(..MacroParameterList(subElement,.addedElement) :1,1:1) {
					if $S(..ObjectChain(subElement,.addedElement) :1,1:1) {
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

Method Macrocall65OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..MacroParameterList(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..MacroParameterText(subElement,.addedElement)  {
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

///  member_ref ::= identifier | string
Method MemberRef(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Identifier(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..String(subElement,.addedElement)  {
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

///  merge_command ::= ('merge' | 'm') [ post_conditional ] merge_list
Method MergeCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..MergeCommand197Sub(subElement,.addedElement)  {
		if $S(..PostConditional(subElement,.addedElement) :1,1:1) {
			if ..MergeList(subElement,.addedElement)  {
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

/// 'merge' | 'm'
/// summary values:MERGE,M
Method MergeCommand197Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K
	if '(..isKeywordInList($lb("MERGE","M"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
	if ..addKeyword(subElement,"MERGE")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"M")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  merge_item ::= lvalue_expression '=' expression
Method MergeItem(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&P&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LvalueExpression(subElement,.addedElement)  {
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

///  merge_list ::= merge_item ( ',' merge_item )*
Method MergeList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..MergeItem(subElement,.addedElement)  {
		if ..MergeList198RepZero(subElement,.addedElement)  {
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

///  ( ',' merge_item )*
Method MergeList198RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..MergeList199Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' merge_item
/// summary values:,
Method MergeList199Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..MergeItem(subElement,.addedElement)  {
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

///  method_function_call ::= 'method' function_parameter_list [ object_chain ]
/// summary values:METHOD
Method MethodFunctionCall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?&?4?
	; first rule summary K
	if '(..isKeywordInList($lb("METHOD"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"METHOD")  {
		if ..FunctionParameterList(subElement,.addedElement)  {
			if $S(..ObjectChain(subElement,.addedElement) :1,1:1) {
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

///  mnemonic_arguments ::= expression ( ',' expression )*
Method MnemonicArguments(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(subElement,.addedElement)  {
		if ..MnemonicArguments264RepZero(subElement,.addedElement)  {
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

///  ( ',' expression )*
Method MnemonicArguments264RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..MnemonicArguments265Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' expression
/// summary values:,
Method MnemonicArguments265Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..Expression(subElement,.addedElement)  {
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

///  monadicop ::= "+" | "-" | "'" | "~"
/// summary values:+,-,',~
Method Monadicop(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|P|P|P
	if '(..isStringInList($lb("+","-","'","~"),1,.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"+")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"-")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"'")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"~")  {
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

///  mpv_command ::= ('mvprint' | 'mvp') [ post_conditional ] [ write_argument_list ]
Method MpvCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?&?4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..MpvCommand266Sub(subElement,.addedElement)  {
		if $S(..PostConditional(subElement,.addedElement) :1,1:1) {
			if $S(..WriteArgumentList(subElement,.addedElement) :1,1:1) {
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

/// 'mvprint' | 'mvp'
/// summary values:MVPRINT,MVP
Method MpvCommand266Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K
	if '(..isKeywordInList($lb("MVPRINT","MVP"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
	if ..addKeyword(subElement,"MVPRINT")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"MVP")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  my_one_xecute_arg ::= expression [ post_conditional]
Method MyOneXecuteArg(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(subElement,.addedElement)  {
		if $S(..PostConditional(subElement,.addedElement) :1,1:1) {
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

///  naked ::= ' '
/// summary values: 
Method Naked(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle(" ",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement," ")  {
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

///  new_command ::= ('new' | 'n') [ post_conditional ] ( naked | new_item_list )
Method NewCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..NewCommand200Sub(subElement,.addedElement)  {
		if $S(..PostConditional(subElement,.addedElement) :1,1:1) {
			if ..NewCommand201Sub(subElement,.addedElement)  {
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

/// 'new' | 'n'
/// summary values:NEW,N
Method NewCommand200Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K
	if '(..isKeywordInList($lb("NEW","N"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
	if ..addKeyword(subElement,"NEW")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"N")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  naked | new_item_list
Method NewCommand201Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Naked(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..NewItemList(subElement,.addedElement)  {
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

///  new_item ::= new_item_single | new_item_varlist
Method NewItem(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..NewItemSingle(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..NewItemVarlist(subElement,.addedElement)  {
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

///  new_item_list ::= new_item ( ',' new_item )*
Method NewItemList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..NewItem(subElement,.addedElement)  {
		if ..NewItemList202RepZero(subElement,.addedElement)  {
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

///  ( ',' new_item )*
Method NewItemList202RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..NewItemList203Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' new_item
/// summary values:,
Method NewItemList203Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..NewItem(subElement,.addedElement)  {
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

///  new_item_single ::= lvalue_expression
Method NewItemSingle(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LvalueExpression(subElement,.addedElement)  {
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

///  new_item_single_list ::= new_item_single ( ',' new_item_single )*
Method NewItemSingleList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..NewItemSingle(subElement,.addedElement)  {
		if ..NewItemSingleList204RepZero(subElement,.addedElement)  {
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

///  ( ',' new_item_single )*
Method NewItemSingleList204RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..NewItemSingleList205Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' new_item_single
/// summary values:,
Method NewItemSingleList205Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..NewItemSingle(subElement,.addedElement)  {
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

///  new_item_varlist ::= '(' new_item_single_list ')'
/// summary values:(
Method NewItemVarlist(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"(")  {
		if ..NewItemSingleList(subElement,.addedElement)  {
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

///  number ::= ('regexp:[0-9]*' [ '.' 'regexp:[0-9]+'] [ ('e' | 'E' ) 'regexp:[0-9]+']) | ('.' 'regexp:[0-9]+' [ ('e' | 'E') 'regexp:[0-9]+'])
Method Number(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Number107Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Number111Sub(subElement,.addedElement)  {
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

/// 'regexp:[0-9]*' [ '.' 'regexp:[0-9]+'] [ ('e' | 'E' ) 'regexp:[0-9]+']
/// summary values:REGEXP:[0-9]*
Method Number107Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?4?&?4?
	; first rule summary P
	if '(..isStringSingle("REGEXP:[0-9]*",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"regexp:[0-9]*")  {
		if ..Number108OptGrp(subElement,.addedElement)  {
			if ..Number109OptGrp(subElement,.addedElement)  {
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
Method Number108OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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

Method Number109OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&P
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Number110Sub(subElement,.addedElement)  {
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
Method Number110Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K
	if '(..isKeywordInList($lb("E","E"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
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
Method Number111Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&P&?4?
	; first rule summary P
	if '(..isStringSingle(".",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,".")  {
		if ..addPunctuation(subElement,"regexp:[0-9]+")  {
			if ..Number112OptGrp(subElement,.addedElement)  {
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

Method Number112OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&P
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Number113Sub(subElement,.addedElement)  {
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
Method Number113Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K
	if '(..isKeywordInList($lb("E","E"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
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

///  object_chain ::= '.' object_member_identifier [ function_parameter_list ] [ object_chain ]
/// summary values:.
Method ObjectChain(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&?4?&?4?
	; first rule summary P
	if '(..isStringSingle(".",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,".")  {
		if ..ObjectMemberIdentifier(subElement,.addedElement)  {
			if $S(..FunctionParameterList(subElement,.addedElement) :1,1:1) {
				if $S(..ObjectChain(subElement,.addedElement) :1,1:1) {
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

///  object_chain99 ::= '.' object_chain_item ( '.' object_chain_item )*
/// summary values:.
Method ObjectChain99(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&(?4?)*
	; first rule summary P
	if '(..isStringSingle(".",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,".")  {
		if ..ObjectChainItem(subElement,.addedElement)  {
			if ..ObjectChain99105RepZero(subElement,.addedElement)  {
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

///  ( '.' object_chain_item )*
Method ObjectChain99105RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ObjectChain99106Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  '.' object_chain_item
/// summary values:.
Method ObjectChain99106Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(".",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,".")  {
		if ..ObjectChainItem(subElement,.addedElement)  {
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

///  object_chain_item ::= object_member_identifier [ function_parameter_list ]
Method ObjectChainItem(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ObjectMemberIdentifier(subElement,.addedElement)  {
		if $S(..FunctionParameterList(subElement,.addedElement) :1,1:1) {
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

///  object_chain_no_dot ::= object_member_identifier [ function_parameter_list ] [ object_chain ]
Method ObjectChainNoDot(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?&?4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ObjectMemberIdentifier(subElement,.addedElement)  {
		if $S(..FunctionParameterList(subElement,.addedElement) :1,1:1) {
			if $S(..ObjectChain(subElement,.addedElement) :1,1:1) {
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

///  object_dot ::= '.'
/// summary values:.
Method ObjectDot(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle(".",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,".")  {
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

///  object_member_identifier ::= 'regexp:(((\%[a-zA-Z0-9])|(\$[a-zA-Z])|[a-zA-Z])[a-zA-Z0-9\.]*)'
/// summary values:REGEXP:(((\%[A-ZA-Z0-9])|(\$[A-ZA-Z])|[A-ZA-Z])[A-ZA-Z0-9\.]*)
Method ObjectMemberIdentifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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

///  object_variable ::= variable_identifier [ array_parameter_list ] object_chain
Method ObjectVariable(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..VariableIdentifier(subElement,.addedElement)  {
		if $S(..ArrayParameterList(subElement,.addedElement) :1,1:1) {
			if ..ObjectChain(subElement,.addedElement)  {
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

///  offset ::= 'regexp:[0-9]+'
/// summary values:REGEXP:[0-9]+
Method Offset(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("REGEXP:[0-9]+",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"regexp:[0-9]+")  {
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

///  offset_sign ::= '+' | '-'
/// summary values:+,-
Method OffsetSign(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|P
	if '(..isStringInList($lb("+","-"),1,.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"+")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"-")  {
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

///  OLDintrinsicfncall ::= case_function_call | select_function_call | extract_function_call | piece_function_call | listitem_function_call | listupdate_function_call | increment_function_call | method_function_call | classmethod_function_call | zobjmethod_function_call | zobjclassmethod_function_call | text_function_call | bitlogic_function_call | expression_function_call | ('$' identifier function_parameter_list [ object_chain ])
Method Oldintrinsicfncall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CaseFunctionCall(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SelectFunctionCall(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ExtractFunctionCall(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..PieceFunctionCall(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ListitemFunctionCall(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ListupdateFunctionCall(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..IncrementFunctionCall(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..MethodFunctionCall(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ClassmethodFunctionCall(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ZobjmethodFunctionCall(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ZobjclassmethodFunctionCall(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..TextFunctionCall(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..BitlogicFunctionCall(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ExpressionFunctionCall(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Oldintrinsicfncall75Sub(subElement,.addedElement)  {
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

/// '$' identifier function_parameter_list [ object_chain ]
/// summary values:$
Method Oldintrinsicfncall75Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&?1Rule?&?4?
	; first rule summary P
	if '(..isStringSingle("$",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"$")  {
		if ..Identifier(subElement,.addedElement)  {
			if ..FunctionParameterList(subElement,.addedElement)  {
				if $S(..ObjectChain(subElement,.addedElement) :1,1:1) {
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

///  OLDlock_type ::= '#' '"' ( 'S' | 'E' | 'I' | 'D' )* '"'
/// summary values:#
Method OldlockType(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&P&(?4?)*&P
	; first rule summary P
	if '(..isStringSingle("#",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"#")  {
		if ..addPunctuation(subElement,"""")  {
			if ..OldlockType195RepZero(subElement,.addedElement)  {
				if ..addPunctuation(subElement,"""")  {
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

///  ( 'S' | 'E' | 'I' | 'D' )*
Method OldlockType195RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..OldlockType196Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  'S' | 'E' | 'I' | 'D'
/// summary values:S,E,I,D
Method OldlockType196Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K|K|K
	if '(..isKeywordInList($lb("S","E","I","D"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
	if ..addKeyword(subElement,"S")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"E")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"I")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"D")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  oldthis_object ::= ('..' | 'i%' | 'r%' | '$this' | '##this') object_chain_item [ object_chain]
Method OldthisObject(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?1Rule?&?4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OldthisObject90Sub(subElement,.addedElement)  {
		if ..ObjectChainItem(subElement,.addedElement)  {
			if $S(..ObjectChain(subElement,.addedElement) :1,1:1) {
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

/// '..' | 'i%' | 'r%' | '$this' | '##this'
/// summary values:..,I%,R%,$THIS,##THIS
Method OldthisObject90Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|P|P|P|P
	if '(..isStringInList($lb("..","I%","R%","$THIS","##THIS"),6,.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
	if ..addPunctuation(subElement,"..")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"i%")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"r%")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"$this")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"##this")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  oldthis_object_set ::= ('..' | 'i%' | 'r%' | '$this' | '##this' ) object_chain_item [ object_chain]
Method OldthisObjectSet(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?1Rule?&?4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OldthisObjectSet91Sub(subElement,.addedElement)  {
		if ..ObjectChainItem(subElement,.addedElement)  {
			if $S(..ObjectChain(subElement,.addedElement) :1,1:1) {
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

/// '..' | 'i%' | 'r%' | '$this' | '##this'
/// summary values:..,I%,R%,$THIS,##THIS
Method OldthisObjectSet91Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|P|P|P|P
	if '(..isStringInList($lb("..","I%","R%","$THIS","##THIS"),6,.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
	if ..addPunctuation(subElement,"..")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"i%")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"r%")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"$this")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"##this")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  one_cos_statement ::= [ label_definition ] ('.')* cos_command
Method OneCosStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?&(?4?)*&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..LabelDefinition(subElement,.addedElement) :1,1:1) {
		if ..OneCosStatement9RepZero(subElement,.addedElement)  {
			if ..CosCommand(subElement,.addedElement)  {
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

/// '.'
/// summary values:.
Method OneCosStatement10Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle(".",.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
	if ..addPunctuation(subElement,".")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  ('.')*
Method OneCosStatement9RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..OneCosStatement10Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  one_cos_statement_sql ::= ('.')* cos_command
Method OneCosStatementSql(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (?4?)*&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OneCosStatementSql11RepZero(subElement,.addedElement)  {
		if ..CosCommand(subElement,.addedElement)  {
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

///  ('.')*
Method OneCosStatementSql11RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..OneCosStatementSql12Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

/// '.'
/// summary values:.
Method OneCosStatementSql12Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle(".",.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
	if ..addPunctuation(subElement,".")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  one_device_parameter ::= text
Method OneDeviceParameter(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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

///  one_open_argument ::= open_device [ ':' [ ( '(' open_device_parameters ')' ) | expression ] ] [ ':' open_timeout ] [ ':' open_mnemonic_space ]
Method OneOpenArgument(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?&?4?&?4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OpenDevice(subElement,.addedElement)  {
		if ..OneOpenArgument209OptGrp(subElement,.addedElement)  {
			if ..OneOpenArgument212OptGrp(subElement,.addedElement)  {
				if ..OneOpenArgument213OptGrp(subElement,.addedElement)  {
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

/// 
/// summary values::
Method OneOpenArgument209OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?4?
	; first rule summary P
	if '(..isStringSingle(":",.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,":")  {
		if ..OneOpenArgument210OptGrp(subElement,.addedElement)  {
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

Method OneOpenArgument210OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OneOpenArgument211Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Expression(subElement,.addedElement)  {
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

///  '(' open_device_parameters ')'
/// summary values:(
Method OneOpenArgument211Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"(")  {
		if ..OpenDeviceParameters(subElement,.addedElement)  {
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

/// 
/// summary values::
Method OneOpenArgument212OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(":",.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,":")  {
		if ..OpenTimeout(subElement,.addedElement)  {
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
/// summary values::
Method OneOpenArgument213OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(":",.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,":")  {
		if ..OpenMnemonicSpace(subElement,.addedElement)  {
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

///  one_open_device_parameter ::= ('/' identifier [ '=' open_expression_list ] ) | expression
Method OneOpenDeviceParameter(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OneOpenDeviceParameter216Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Expression(subElement,.addedElement)  {
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

/// '/' identifier [ '=' open_expression_list ]
/// summary values:/
Method OneOpenDeviceParameter216Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&?4?
	; first rule summary P
	if '(..isStringSingle("/",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"/")  {
		if ..Identifier(subElement,.addedElement)  {
			if ..OneOpenDeviceParameter217OptGrp(subElement,.addedElement)  {
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
/// summary values:=
Method OneOpenDeviceParameter217OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle("=",.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"=")  {
		if ..OpenExpressionList(subElement,.addedElement)  {
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

///  one_parameter_value ::= ( [ '.' ] identifier ) | ( identifier '...' ) | expression
Method OneParameterValue(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OneParameterValue87Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OneParameterValue88Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Expression(subElement,.addedElement)  {
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

///  [ '.' ] identifier
Method OneParameterValue87Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..addPunctuation(subElement,".") :1,1:1) {
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

///  identifier '...'
Method OneParameterValue88Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&P
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Identifier(subElement,.addedElement)  {
		if ..addPunctuation(subElement,"...")  {
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

///  one_use_argument ::= use_device [ ':' ( use_device_parameters_inbrackets | use_device_parameters) ] [ ':' use_mnemonic_space ]
Method OneUseArgument(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?&?4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..UseDevice(subElement,.addedElement)  {
		if ..OneUseArgument248OptGrp(subElement,.addedElement)  {
			if ..OneUseArgument250OptGrp(subElement,.addedElement)  {
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
/// summary values::
Method OneUseArgument248OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(":",.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,":")  {
		if ..OneUseArgument249Sub(subElement,.addedElement)  {
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

///  use_device_parameters_inbrackets | use_device_parameters
Method OneUseArgument249Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..UseDeviceParametersInbrackets(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..UseDeviceParameters(subElement,.addedElement)  {
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

/// 
/// summary values::
Method OneUseArgument250OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(":",.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,":")  {
		if ..UseMnemonicSpace(subElement,.addedElement)  {
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

///  one_use_device_parameter ::= ('/' identifier [ '=' expression ] ) | expression
Method OneUseDeviceParameter(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OneUseDeviceParameter253Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Expression(subElement,.addedElement)  {
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

/// '/' identifier [ '=' expression ]
/// summary values:/
Method OneUseDeviceParameter253Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&?4?
	; first rule summary P
	if '(..isStringSingle("/",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"/")  {
		if ..Identifier(subElement,.addedElement)  {
			if ..OneUseDeviceParameter254OptGrp(subElement,.addedElement)  {
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
/// summary values:=
Method OneUseDeviceParameter254OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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

///  one_write_argument ::= expression | write_control_expression_list
Method OneWriteArgument(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..WriteControlExpressionList(subElement,.addedElement)  {
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

///  one_xecute_arg ::= ( xecute_arg_with_params | xecute_arg_no_params ) [ post_conditional ]
Method OneXecuteArg(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OneXecuteArg282Sub(subElement,.addedElement)  {
		if $S(..PostConditional(subElement,.addedElement) :1,1:1) {
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

///  xecute_arg_with_params | xecute_arg_no_params
Method OneXecuteArg282Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XecuteArgWithParams(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..XecuteArgNoParams(subElement,.addedElement)  {
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

///  one_zallocatename ::= zallocatename [ zallocate_type ]
Method OneZallocatename(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Zallocatename(subElement,.addedElement)  {
		if $S(..ZallocateType(subElement,.addedElement) :1,1:1) {
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

///  one_zdeallocatename ::= zdeallocatename [ zdeallocate_type ]
Method OneZdeallocatename(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Zdeallocatename(subElement,.addedElement)  {
		if $S(..ZdeallocateType(subElement,.addedElement) :1,1:1) {
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

///  open_arguments ::= one_open_argument ( ',' one_open_argument )*
Method OpenArguments(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OneOpenArgument(subElement,.addedElement)  {
		if ..OpenArguments207RepZero(subElement,.addedElement)  {
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

///  ( ',' one_open_argument )*
Method OpenArguments207RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..OpenArguments208Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' one_open_argument
/// summary values:,
Method OpenArguments208Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..OneOpenArgument(subElement,.addedElement)  {
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

///  open_bracket ::= '('
/// summary values:(
Method OpenBracket(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"(")  {
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

///  open_command ::= ('open' | 'o') [ post_conditional ] open_arguments
Method OpenCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OpenCommand206Sub(subElement,.addedElement)  {
		if $S(..PostConditional(subElement,.addedElement) :1,1:1) {
			if ..OpenArguments(subElement,.addedElement)  {
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

/// 'open' | 'o'
/// summary values:OPEN,O
Method OpenCommand206Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K
	if '(..isKeywordInList($lb("OPEN","O"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
	if ..addKeyword(subElement,"OPEN")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"O")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  open_device ::= expression
Method OpenDevice(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(subElement,.addedElement)  {
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

///  open_device_parameters ::= [one_open_device_parameter] ( ':'[ one_open_device_parameter] )*
Method OpenDeviceParameters(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..OneOpenDeviceParameter(subElement,.addedElement) :1,1:1) {
		if ..OpenDeviceParameters214RepZero(subElement,.addedElement)  {
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

///  ( ':'[ one_open_device_parameter] )*
Method OpenDeviceParameters214RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..OpenDeviceParameters215Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ':'[ one_open_device_parameter]
/// summary values::
Method OpenDeviceParameters215Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?4?
	; first rule summary P
	if '(..isStringSingle(":",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,":")  {
		if $S(..OneOpenDeviceParameter(subElement,.addedElement) :1,1:1) {
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

///  open_expression_list ::= (variable '...') | expression_list
Method OpenExpressionList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OpenExpressionList218Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ExpressionList(subElement,.addedElement)  {
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

/// variable '...'
Method OpenExpressionList218Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&P
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Variable(subElement,.addedElement)  {
		if ..addPunctuation(subElement,"...")  {
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

///  open_mnemonic_space ::= expression
Method OpenMnemonicSpace(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(subElement,.addedElement)  {
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

///  open_timeout ::= expression
Method OpenTimeout(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(subElement,.addedElement)  {
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

///  parameter_list ::= '(' [ parameter_values ] ')'
/// summary values:(
Method ParameterList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?4?&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"(")  {
		if $S(..ParameterValues(subElement,.addedElement) :1,1:1) {
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

///  parameter_values ::= one_parameter_value ( ',' [ one_parameter_value ] )*
Method ParameterValues(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OneParameterValue(subElement,.addedElement)  {
		if ..ParameterValues85RepZero(subElement,.addedElement)  {
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

///  ( ',' [ one_parameter_value ] )*
Method ParameterValues85RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ParameterValues86Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' [ one_parameter_value ]
/// summary values:,
Method ParameterValues86Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?4?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if $S(..OneParameterValue(subElement,.addedElement) :1,1:1) {
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

///  pattern_match ::= ( "?" | "'?" ) (pattern_match_combo )*
Method PatternMatch(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..PatternMatch55Sub(subElement,.addedElement)  {
		if ..PatternMatch56RepZero(subElement,.addedElement)  {
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

///  "?" | "'?"
/// summary values:?,'?
Method PatternMatch55Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|P
	if '(..isStringInList($lb("?","'?"),2,.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
	if ..addPunctuation(subElement,"?")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"'?")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  (pattern_match_combo )*
Method PatternMatch56RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..PatternMatch57Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

/// pattern_match_combo
Method PatternMatch57Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..PatternMatchCombo(subElement,.addedElement)  {
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

///  pattern_match_alternating ::= '(' ( pattern_match_combo ( ',' pattern_match_combo )* )')'
/// summary values:(
Method PatternMatchAlternating(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"(")  {
		if ..PatternMatchAlternating59Sub(subElement,.addedElement)  {
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

///  pattern_match_combo ( ',' pattern_match_combo )*
Method PatternMatchAlternating59Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..PatternMatchCombo(subElement,.addedElement)  {
		if ..PatternMatchAlternating60RepZero(subElement,.addedElement)  {
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

///  ( ',' pattern_match_combo )*
Method PatternMatchAlternating60RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..PatternMatchAlternating61Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' pattern_match_combo
/// summary values:,
Method PatternMatchAlternating61Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..PatternMatchCombo(subElement,.addedElement)  {
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

///  pattern_match_code ::= 'a' | 'c' | 'e' | 'l' | 'n' | 'p' | 'u' | 'b' | 'm' | 'ZFWCHARZ' | 'ZHWKATAZ' | string
Method PatternMatchCode(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K|K|K|K|K|K|K|K|K|K|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"A")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"C")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"E")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"L")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"N")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"P")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"U")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"B")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"M")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"ZFWCHARZ")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"ZHWKATAZ")  {
		set done=1 ; or
	} elseif ..String(subElement,.addedElement)  {
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

///  pattern_match_combo ::= pattern_match_repeat ( pattern_match_code | pattern_match_alternating )
Method PatternMatchCombo(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..PatternMatchRepeat(subElement,.addedElement)  {
		if ..PatternMatchCombo58Sub(subElement,.addedElement)  {
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

///  pattern_match_code | pattern_match_alternating
Method PatternMatchCombo58Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..PatternMatchCode(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..PatternMatchAlternating(subElement,.addedElement)  {
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

///  pattern_match_repeat ::= ('regexp:[0-9]*' [ '.' [ 'regexp:[0-9]*' ] ]) | ('.' ['regexp:[0-9]*'])
Method PatternMatchRepeat(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..PatternMatchRepeat62Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..PatternMatchRepeat64Sub(subElement,.addedElement)  {
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

/// 'regexp:[0-9]*' [ '.' [ 'regexp:[0-9]*' ] ]
/// summary values:REGEXP:[0-9]*
Method PatternMatchRepeat62Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?4?
	; first rule summary P
	if '(..isStringSingle("REGEXP:[0-9]*",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"regexp:[0-9]*")  {
		if ..PatternMatchRepeat63OptGrp(subElement,.addedElement)  {
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
/// summary values:.
Method PatternMatchRepeat63OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?4?
	; first rule summary P
	if '(..isStringSingle(".",.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,".")  {
		if $S(..addPunctuation(subElement,"regexp:[0-9]*") :1,1:1) {
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

/// '.' ['regexp:[0-9]*']
/// summary values:.
Method PatternMatchRepeat64Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?4?
	; first rule summary P
	if '(..isStringSingle(".",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,".")  {
		if $S(..addPunctuation(subElement,"regexp:[0-9]*") :1,1:1) {
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

///  piece_function_call ::= ('piece' | 'p') open_bracket expression ',' expression [ ',' star_parameter [ ',' star_parameter ] ] close_bracket
Method PieceFunctionCall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?1Rule?&?1Rule?&P&?1Rule?&?4?&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..PieceFunctionCall327Sub(subElement,.addedElement)  {
		if ..OpenBracket(subElement,.addedElement)  {
			if ..Expression(subElement,.addedElement)  {
				if ..addPunctuation(subElement,",")  {
					if ..Expression(subElement,.addedElement)  {
						if ..PieceFunctionCall328OptGrp(subElement,.addedElement)  {
							if ..CloseBracket(subElement,.addedElement)  {
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

/// 'piece' | 'p'
/// summary values:PIECE,P
Method PieceFunctionCall327Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K
	if '(..isKeywordInList($lb("PIECE","P"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
	if ..addKeyword(subElement,"PIECE")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"P")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

/// 
/// summary values:,
Method PieceFunctionCall328OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&?4?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..StarParameter(subElement,.addedElement)  {
			if ..PieceFunctionCall329OptGrp(subElement,.addedElement)  {
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
/// summary values:,
Method PieceFunctionCall329OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..StarParameter(subElement,.addedElement)  {
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

///  piece_function_call_set ::= ('piece' | 'p') open_bracket set_value_expression ',' expression [ ',' star_parameter [ ',' star_parameter ] ] close_bracket
Method PieceFunctionCallSet(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?1Rule?&?1Rule?&P&?1Rule?&?4?&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..PieceFunctionCallSet330Sub(subElement,.addedElement)  {
		if ..OpenBracket(subElement,.addedElement)  {
			if ..SetValueExpression(subElement,.addedElement)  {
				if ..addPunctuation(subElement,",")  {
					if ..Expression(subElement,.addedElement)  {
						if ..PieceFunctionCallSet331OptGrp(subElement,.addedElement)  {
							if ..CloseBracket(subElement,.addedElement)  {
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

/// 'piece' | 'p'
/// summary values:PIECE,P
Method PieceFunctionCallSet330Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K
	if '(..isKeywordInList($lb("PIECE","P"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
	if ..addKeyword(subElement,"PIECE")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"P")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

/// 
/// summary values:,
Method PieceFunctionCallSet331OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&?4?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..StarParameter(subElement,.addedElement)  {
			if ..PieceFunctionCallSet332OptGrp(subElement,.addedElement)  {
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
/// summary values:,
Method PieceFunctionCallSet332OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..StarParameter(subElement,.addedElement)  {
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

///  post_conditional ::= ':' expression
/// summary values::
Method PostConditional(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(":",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,":")  {
		if ..Expression(subElement,.addedElement)  {
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

///  primary ::= number | string | macrocall | macro_expression | this_object | extrinsicfncall | intrinsicfncall | classexpr | variable | special_variable | Indirection | global_ref | ( sub_expression [ object_chain ] ) | (cos_json [ object_chain ])
Method Primary(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Number(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..String(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Macrocall(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..MacroExpression(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ThisObject(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Extrinsicfncall(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Intrinsicfncall(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Classexpr(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Variable(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SpecialVariable(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Indirection(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..GlobalRef(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Primary99Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Primary100Sub(subElement,.addedElement)  {
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

/// cos_json [ object_chain ]
Method Primary100Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CosJson(subElement,.addedElement)  {
		if $S(..ObjectChain(subElement,.addedElement) :1,1:1) {
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

///  sub_expression [ object_chain ]
Method Primary99Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SubExpression(subElement,.addedElement)  {
		if $S(..ObjectChain(subElement,.addedElement) :1,1:1) {
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

///  print_command ::= 'print' [ post_conditional ] [ lineref1 [ ':' lineref2 ] ]
/// summary values:PRINT
Method PrintCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?4?&?4?
	; first rule summary K
	if '(..isKeywordInList($lb("PRINT"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"PRINT")  {
		if $S(..PostConditional(subElement,.addedElement) :1,1:1) {
			if ..PrintCommand219OptGrp(subElement,.addedElement)  {
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

Method PrintCommand219OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Lineref1(subElement,.addedElement)  {
		if ..PrintCommand220OptGrp(subElement,.addedElement)  {
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
/// summary values::
Method PrintCommand220OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(":",.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,":")  {
		if ..Lineref2(subElement,.addedElement)  {
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

///  python_import ::= 'system' '.' 'python' '.' 'import' '(' string ')'
/// summary values:SYSTEM
Method PythonImport(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&K&P&K&P&?1Rule?&P
	; first rule summary K
	if '(..isKeywordInList($lb("SYSTEM"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"SYSTEM")  {
		if ..addPunctuation(subElement,".")  {
			if ..addKeyword(subElement,"PYTHON")  {
				if ..addPunctuation(subElement,".")  {
					if ..addKeyword(subElement,"IMPORT")  {
						if ..addPunctuation(subElement,"(")  {
							if ..String(subElement,.addedElement)  {
								if ..addPunctuation(subElement,")")  {
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

///  quit_command ::= ('quit' | 'q') [ post_conditional ] ( naked | [ quit_expression ])
Method QuitCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..QuitCommand222Sub(subElement,.addedElement)  {
		if $S(..PostConditional(subElement,.addedElement) :1,1:1) {
			if ..QuitCommand223Sub(subElement,.addedElement)  {
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

/// 'quit' | 'q'
/// summary values:QUIT,Q
Method QuitCommand222Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K
	if '(..isKeywordInList($lb("QUIT","Q"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
	if ..addKeyword(subElement,"QUIT")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"Q")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  naked | [ quit_expression ]
Method QuitCommand223Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?4?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Naked(subElement,.addedElement)  {
		set done=1 ; or
	} elseif $S(..QuitExpression(subElement,.addedElement) :1,1:1) {
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

///  quit_expression ::= expression
Method QuitExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(subElement,.addedElement)  {
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

///  read_argument ::= read_format_character | read_prompt | read_single_char | read_length
Method ReadArgument(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?|?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ReadFormatCharacter(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ReadPrompt(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ReadSingleChar(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ReadLength(subElement,.addedElement)  {
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

///  read_command ::= ('read' | 'r') [ post_conditional ] read_argument ( ',' read_argument )*
Method ReadCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?&?1Rule?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ReadCommand267Sub(subElement,.addedElement)  {
		if $S(..PostConditional(subElement,.addedElement) :1,1:1) {
			if ..ReadArgument(subElement,.addedElement)  {
				if ..ReadCommand268RepZero(subElement,.addedElement)  {
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

/// 'read' | 'r'
/// summary values:READ,R
Method ReadCommand267Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K
	if '(..isKeywordInList($lb("READ","R"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
	if ..addKeyword(subElement,"READ")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"R")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  ( ',' read_argument )*
Method ReadCommand268RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ReadCommand269Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' read_argument
/// summary values:,
Method ReadCommand269Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..ReadArgument(subElement,.addedElement)  {
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

///  read_format_character ::= '!' | '#' | ('?' expression) | ('/' read_keyword [ '(' read_keyword_parameters ')' ])
Method ReadFormatCharacter(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|P|?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"!")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"#")  {
		set done=1 ; or
	} elseif ..ReadFormatCharacter271Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ReadFormatCharacter272Sub(subElement,.addedElement)  {
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

/// '?' expression
/// summary values:?
Method ReadFormatCharacter271Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle("?",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"?")  {
		if ..Expression(subElement,.addedElement)  {
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

/// '/' read_keyword [ '(' read_keyword_parameters ')' ]
/// summary values:/
Method ReadFormatCharacter272Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&?4?
	; first rule summary P
	if '(..isStringSingle("/",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"/")  {
		if ..ReadKeyword(subElement,.addedElement)  {
			if ..ReadFormatCharacter273OptGrp(subElement,.addedElement)  {
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
/// summary values:(
Method ReadFormatCharacter273OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"(")  {
		if ..ReadKeywordParameters(subElement,.addedElement)  {
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

///  read_format_character_set ::= read_format_character+
Method ReadFormatCharacterSet(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (?4?)+
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ReadFormatCharacterSet270RepOne(subElement,.addedElement)  {
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

///  read_format_character+
Method ReadFormatCharacterSet270RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..ReadFormatCharacter(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  read_keyword ::= text
Method ReadKeyword(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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

///  read_keyword_parameter ::= text
Method ReadKeywordParameter(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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

///  read_keyword_parameters ::= read_keyword_parameter ( ',' read_keyword_parameter )*
Method ReadKeywordParameters(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ReadKeywordParameter(subElement,.addedElement)  {
		if ..ReadKeywordParameters274RepZero(subElement,.addedElement)  {
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

///  ( ',' read_keyword_parameter )*
Method ReadKeywordParameters274RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ReadKeywordParameters275Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' read_keyword_parameter
/// summary values:,
Method ReadKeywordParameters275Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..ReadKeywordParameter(subElement,.addedElement)  {
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

///  read_length ::= lvalue_expression [ '#' expression ] [ ':' expression ]
Method ReadLength(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?&?4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LvalueExpression(subElement,.addedElement)  {
		if ..ReadLength277OptGrp(subElement,.addedElement)  {
			if ..ReadLength278OptGrp(subElement,.addedElement)  {
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
/// summary values:#
Method ReadLength277OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle("#",.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"#")  {
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

/// 
/// summary values::
Method ReadLength278OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(":",.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,":")  {
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

///  read_prompt ::= string
Method ReadPrompt(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..String(subElement,.addedElement)  {
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

///  read_single_char ::= '*' lvalue_expression [ ':' expression ]
/// summary values:*
Method ReadSingleChar(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&?4?
	; first rule summary P
	if '(..isStringSingle("*",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"*")  {
		if ..LvalueExpression(subElement,.addedElement)  {
			if ..ReadSingleChar276OptGrp(subElement,.addedElement)  {
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
/// summary values::
Method ReadSingleChar276OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(":",.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,":")  {
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

///  return_command ::= 'return' [ post_conditional ] [ naked | expression ]
/// summary values:RETURN
Method ReturnCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?4?&?4?
	; first rule summary K
	if '(..isKeywordInList($lb("RETURN"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"RETURN")  {
		if $S(..PostConditional(subElement,.addedElement) :1,1:1) {
			if ..ReturnCommand224OptGrp(subElement,.addedElement)  {
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

Method ReturnCommand224OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Naked(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Expression(subElement,.addedElement)  {
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

///  routine_env ::= '|' [ expression ] '|'
/// summary values:|
Method RoutineEnv(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?4?&P
	; first rule summary P
	if '(..isStringSingle("|",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"|")  {
		if $S(..Expression(subElement,.addedElement) :1,1:1) {
			if ..addPunctuation(subElement,"|")  {
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

///  routine_identifier ::= 'regexp:(((\%[a-zA-Z0-9])|(\$[a-zA-Z])|[a-zA-Z])[a-zA-Z0-9\.]*)'
/// summary values:REGEXP:(((\%[A-ZA-Z0-9])|(\$[A-ZA-Z])|[A-ZA-Z])[A-ZA-Z0-9\.]*)
Method RoutineIdentifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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

///  safeexpression_function_call ::= '##safeexpression' function_parameter_list
/// summary values:##SAFEEXPRESSION
Method SafeexpressionFunctionCall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle("##SAFEEXPRESSION",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"##safeexpression")  {
		if ..FunctionParameterList(subElement,.addedElement)  {
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

///  select_clause ::= expression ':' expression
Method SelectClause(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&P&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(subElement,.addedElement)  {
		if ..addPunctuation(subElement,":")  {
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

///  select_clause_default ::= '1' ':' expression
/// summary values:1
Method SelectClauseDefault(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&P&?1Rule?
	; first rule summary P
	if '(..isStringSingle("1",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"1")  {
		if ..addPunctuation(subElement,":")  {
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

///  select_clauses ::= select_clause ( ',' select_clause )*
Method SelectClauses(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SelectClause(subElement,.addedElement)  {
		if ..SelectClauses358RepZero(subElement,.addedElement)  {
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

///  ( ',' select_clause )*
Method SelectClauses358RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..SelectClauses359Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' select_clause
/// summary values:,
Method SelectClauses359Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..SelectClause(subElement,.addedElement)  {
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

///  select_function_call ::= ('select' | 's') '(' select_clauses ')' [ object_chain ]
Method SelectFunctionCall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&P&?1Rule?&P&?4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SelectFunctionCall357Sub(subElement,.addedElement)  {
		if ..addPunctuation(subElement,"(")  {
			if ..SelectClauses(subElement,.addedElement)  {
				if ..addPunctuation(subElement,")")  {
					if $S(..ObjectChain(subElement,.addedElement) :1,1:1) {
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

/// 'select' | 's'
/// summary values:SELECT,S
Method SelectFunctionCall357Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K
	if '(..isKeywordInList($lb("SELECT","S"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
	if ..addKeyword(subElement,"SELECT")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"S")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  set_command ::= ('set' | 's') [ post_conditional ] set_item_list
Method SetCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SetCommand225Sub(subElement,.addedElement)  {
		if $S(..PostConditional(subElement,.addedElement) :1,1:1) {
			if ..SetItemList(subElement,.addedElement)  {
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

/// 'set' | 's'
/// summary values:SET,S
Method SetCommand225Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K
	if '(..isKeywordInList($lb("SET","S"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
	if ..addKeyword(subElement,"SET")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"S")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  set_expression ::= expression
Method SetExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(subElement,.addedElement)  {
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

///  set_item ::= (( set_value_expression | ('(' set_value_expression ( ',' set_value_expression )* ')' )) '=' set_expression) | simple_indirection
Method SetItem(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SetItem230Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SimpleIndirection(subElement,.addedElement)  {
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

/// ( set_value_expression | ('(' set_value_expression ( ',' set_value_expression )* ')' )) '=' set_expression
Method SetItem230Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&P&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SetItem231Sub(subElement,.addedElement)  {
		if ..addPunctuation(subElement,"=")  {
			if ..SetExpression(subElement,.addedElement)  {
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

///  set_value_expression | ('(' set_value_expression ( ',' set_value_expression )* ')' )
Method SetItem231Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SetValueExpression(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SetItem232Sub(subElement,.addedElement)  {
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

/// '(' set_value_expression ( ',' set_value_expression )* ')'
/// summary values:(
Method SetItem232Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&(?4?)*&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"(")  {
		if ..SetValueExpression(subElement,.addedElement)  {
			if ..SetItem233RepZero(subElement,.addedElement)  {
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

///  ( ',' set_value_expression )*
Method SetItem233RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..SetItem234Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' set_value_expression
/// summary values:,
Method SetItem234Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..SetValueExpression(subElement,.addedElement)  {
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

///  set_item_list ::= set_item ( ',' set_item )*
Method SetItemList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SetItem(subElement,.addedElement)  {
		if ..SetItemList226RepZero(subElement,.addedElement)  {
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

///  ( ',' set_item )*
Method SetItemList226RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..SetItemList227Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' set_item
/// summary values:,
Method SetItemList227Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..SetItem(subElement,.addedElement)  {
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

///  set_item_old ::= (( set_item_single | set_item_varlist ) '=' expression) | simple_indirection
Method SetItemOld(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SetItemOld228Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SimpleIndirection(subElement,.addedElement)  {
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

/// ( set_item_single | set_item_varlist ) '=' expression
Method SetItemOld228Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&P&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SetItemOld229Sub(subElement,.addedElement)  {
		if ..addPunctuation(subElement,"=")  {
			if ..Expression(subElement,.addedElement)  {
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

///  set_item_single | set_item_varlist
Method SetItemOld229Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SetItemSingle(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SetItemVarlist(subElement,.addedElement)  {
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

///  set_item_single ::= lvalue_expression
Method SetItemSingle(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LvalueExpression(subElement,.addedElement)  {
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

///  set_item_single_list ::= set_item_single ( ',' set_item_single )*
Method SetItemSingleList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SetItemSingle(subElement,.addedElement)  {
		if ..SetItemSingleList235RepZero(subElement,.addedElement)  {
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

///  ( ',' set_item_single )*
Method SetItemSingleList235RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..SetItemSingleList236Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' set_item_single
/// summary values:,
Method SetItemSingleList236Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..SetItemSingle(subElement,.addedElement)  {
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

///  set_item_varlist ::= '(' set_item_single_list ')'
/// summary values:(
Method SetItemVarlist(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"(")  {
		if ..SetItemSingleList(subElement,.addedElement)  {
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

///  set_value_expression ::= this_object_set | variable_set | macrocall | Indirection | global_ref_set | intrinsicfncall_set | special_variable | ( '(' set_value_expression ')' [ object_chain ] )
Method SetValueExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ThisObjectSet(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..VariableSet(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Macrocall(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Indirection(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..GlobalRefSet(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..IntrinsicfncallSet(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SpecialVariable(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SetValueExpression237Sub(subElement,.addedElement)  {
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

///  '(' set_value_expression ')' [ object_chain ]
/// summary values:(
Method SetValueExpression237Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&P&?4?
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"(")  {
		if ..SetValueExpression(subElement,.addedElement)  {
			if ..addPunctuation(subElement,")")  {
				if $S(..ObjectChain(subElement,.addedElement) :1,1:1) {
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

///  Simple_Indirection ::= '@' term
/// summary values:@
Method SimpleIndirection(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle("@",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"@")  {
		if ..Term(subElement,.addedElement)  {
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

///  special_intrinsic ::= case_function_call | select_function_call | extract_function_call | piece_function_call | listitem_function_call | listupdate_function_call | increment_function_call | method_function_call | classmethod_function_call | zobjmethod_function_call | zobjclassmethod_function_call | text_function_call | bitlogic_function_call
Method SpecialIntrinsic(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CaseFunctionCall(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SelectFunctionCall(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ExtractFunctionCall(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..PieceFunctionCall(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ListitemFunctionCall(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ListupdateFunctionCall(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..IncrementFunctionCall(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..MethodFunctionCall(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ClassmethodFunctionCall(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ZobjmethodFunctionCall(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ZobjclassmethodFunctionCall(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..TextFunctionCall(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..BitlogicFunctionCall(subElement,.addedElement)  {
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

///  special_intrinsic_set ::= extract_function_call_set | piece_function_call_set | listitem_function_call_set | listbuild_function_call_set
Method SpecialIntrinsicSet(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?|?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ExtractFunctionCallSet(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..PieceFunctionCallSet(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ListitemFunctionCallSet(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ListbuildFunctionCallSet(subElement,.addedElement)  {
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

///  special_variable ::= '$' ('DEVICE' | 'ECODE' | 'EC' | 'ESTACK' | 'ES' | 'ETRAP' | 'ET' | 'HALT' | 'HOROLOG' | 'H' | 'IO' | 'I' | 'JOB' | 'J' | 'KEY' | 'NAMESPACE' | 'PRINCIPAL' | 'P' | 'QUIT' | 'ROLES' | 'STACK' | 'STORAGE' | python_import | ('SYSTEM' [ object_chain ]) | 'S' | 'TEST' | 'THIS' | 'THROWOBJ' | 'TLEVEL' | 'Tl' | 'T' | 'USERNAME' | 'X' | 'Y' | 'ZA' | 'ZB' | 'ZCHILD' | 'ZEOF' | 'ZEOS' | 'ZERROR' | 'ZE' | 'ZHOROLOG' | 'ZH' | 'ZIO' | 'ZJOB' | 'ZMODE' | 'ZNAME' | 'ZNSPACE' | 'ZN' | 'ZORDER' | 'ZPARENT' | 'ZPI' | 'ZPOS' | 'ZREFERENCE' | 'ZR' | 'ZSTORAGE' | 'ZS' | 'ZTIMESTAMP' | 'ZTS' | 'ZTIMEZONE' | 'ZTRAP' | 'ZT' | 'ZUTIL' | 'ZU' | 'ZVERSION' | 'ZV' )
/// summary values:$
Method SpecialVariable(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle("$",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"$")  {
		if ..SpecialVariable101Sub(subElement,.addedElement)  {
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

/// 'DEVICE' | 'ECODE' | 'EC' | 'ESTACK' | 'ES' | 'ETRAP' | 'ET' | 'HALT' | 'HOROLOG' | 'H' | 'IO' | 'I' | 'JOB' | 'J' | 'KEY' | 'NAMESPACE' | 'PRINCIPAL' | 'P' | 'QUIT' | 'ROLES' | 'STACK' | 'STORAGE' | python_import | ('SYSTEM' [ object_chain ]) | 'S' | 'TEST' | 'THIS' | 'THROWOBJ' | 'TLEVEL' | 'Tl' | 'T' | 'USERNAME' | 'X' | 'Y' | 'ZA' | 'ZB' | 'ZCHILD' | 'ZEOF' | 'ZEOS' | 'ZERROR' | 'ZE' | 'ZHOROLOG' | 'ZH' | 'ZIO' | 'ZJOB' | 'ZMODE' | 'ZNAME' | 'ZNSPACE' | 'ZN' | 'ZORDER' | 'ZPARENT' | 'ZPI' | 'ZPOS' | 'ZREFERENCE' | 'ZR' | 'ZSTORAGE' | 'ZS' | 'ZTIMESTAMP' | 'ZTS' | 'ZTIMEZONE' | 'ZTRAP' | 'ZT' | 'ZUTIL' | 'ZU' | 'ZVERSION' | 'ZV'
Method SpecialVariable101Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|?1Rule?|?1Rule?|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"DEVICE")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"ECODE")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"EC")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"ESTACK")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"ES")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"ETRAP")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"ET")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"HALT")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"HOROLOG")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"H")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"IO")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"I")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"JOB")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"J")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"KEY")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"NAMESPACE")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"PRINCIPAL")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"P")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"QUIT")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"ROLES")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"STACK")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"STORAGE")  {
		set done=1 ; or
	} elseif ..PythonImport(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SpecialVariable102Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"S")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"TEST")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"THIS")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"THROWOBJ")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"TLEVEL")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"TL")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"T")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"USERNAME")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"X")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"Y")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"ZA")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"ZB")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"ZCHILD")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"ZEOF")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"ZEOS")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"ZERROR")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"ZE")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"ZHOROLOG")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"ZH")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"ZIO")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"ZJOB")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"ZMODE")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"ZNAME")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"ZNSPACE")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"ZN")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"ZORDER")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"ZPARENT")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"ZPI")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"ZPOS")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"ZREFERENCE")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"ZR")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"ZSTORAGE")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"ZS")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"ZTIMESTAMP")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"ZTS")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"ZTIMEZONE")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"ZTRAP")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"ZT")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"ZUTIL")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"ZU")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"ZVERSION")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"ZV")  {
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

/// 'SYSTEM' [ object_chain ]
/// summary values:SYSTEM
Method SpecialVariable102Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?4?
	; first rule summary K
	if '(..isKeywordInList($lb("SYSTEM"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"SYSTEM")  {
		if $S(..ObjectChain(subElement,.addedElement) :1,1:1) {
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

///  sql_body ::= 'NEED SQL BODY'
/// summary values:NEED SQL BODY
Method SqlBody(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("NEED SQL BODY",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"NEED SQL BODY")  {
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

///  sql_command ::= '&sql(' sql_body ')'
/// summary values:&SQL(
Method SqlCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&P
	; first rule summary P
	if '(..isStringSingle("&SQL(",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"&sql(")  {
		if ..SqlBody(subElement,.addedElement)  {
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

///  star_parameter ::= ('*' [expression]) | expression
Method StarParameter(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..StarParameter354Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Expression(subElement,.addedElement)  {
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

/// '*' [expression]
/// summary values:*
Method StarParameter354Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?4?
	; first rule summary P
	if '(..isStringSingle("*",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"*")  {
		if $S(..Expression(subElement,.addedElement) :1,1:1) {
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
	} elseif ..String114Sub(subElement,.addedElement)  {
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
Method String114Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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

///  sub_expression ::= '(' expression ')'
/// summary values:(
Method SubExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"(")  {
		if ..Expression(subElement,.addedElement)  {
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

///  Subscript_Indirection ::= '@' term '@' subscript_parameter_list
/// summary values:@
Method SubscriptIndirection(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&P&?1Rule?
	; first rule summary P
	if '(..isStringSingle("@",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"@")  {
		if ..Term(subElement,.addedElement)  {
			if ..addPunctuation(subElement,"@")  {
				if ..SubscriptParameterList(subElement,.addedElement)  {
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

///  subscript_parameter_list ::= '(' expression ( ',' expression )* ')'
/// summary values:(
Method SubscriptParameterList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&(?4?)*&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"(")  {
		if ..Expression(subElement,.addedElement)  {
			if ..SubscriptParameterList94RepZero(subElement,.addedElement)  {
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

///  ( ',' expression )*
Method SubscriptParameterList94RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..SubscriptParameterList95Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' expression
/// summary values:,
Method SubscriptParameterList95Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..Expression(subElement,.addedElement)  {
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

///  super_expression ::= '##super' function_parameter_list
/// summary values:##SUPER
Method SuperExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle("##SUPER",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"##super")  {
		if ..FunctionParameterList(subElement,.addedElement)  {
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

///  system_object ::='$system.' object_chain_item [ object_chain ]
/// summary values:$SYSTEM.
Method SystemObject(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&?4?
	; first rule summary P
	if '(..isStringSingle("$SYSTEM.",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"$system.")  {
		if ..ObjectChainItem(subElement,.addedElement)  {
			if $S(..ObjectChain(subElement,.addedElement) :1,1:1) {
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

///  tcommit_command ::= ('tcommit' | 'tc') [ post_conditional ]
Method TcommitCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..TcommitCommand238Sub(subElement,.addedElement)  {
		if $S(..PostConditional(subElement,.addedElement) :1,1:1) {
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

/// 'tcommit' | 'tc'
/// summary values:TCOMMIT,TC
Method TcommitCommand238Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K
	if '(..isKeywordInList($lb("TCOMMIT","TC"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
	if ..addKeyword(subElement,"TCOMMIT")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"TC")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  term ::= primary
Method Term(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Primary(subElement,.addedElement)  {
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

///  text_function_call ::= ('text') open_bracket label_reference close_bracket
Method TextFunctionCall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?1Rule?&?1Rule?&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..TextFunctionCall353Sub(subElement,.addedElement)  {
		if ..OpenBracket(subElement,.addedElement)  {
			if ..LabelReference(subElement,.addedElement)  {
				if ..CloseBracket(subElement,.addedElement)  {
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

/// 'text'
/// summary values:TEXT
Method TextFunctionCall353Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeywordInList($lb("TEXT"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
	if ..addKeyword(subElement,"TEXT")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  text_to_eol ::= 'regexp:[^\r\n]*'
/// summary values:REGEXP:[^\R\N]*
Method TextToEol(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("REGEXP:[^\R\N]*",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"regexp:[^\r\n]*")  {
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

///  text_to_eol_continue ::= 'regexp:[^\r\n]*'
/// summary values:REGEXP:[^\R\N]*
Method TextToEolContinue(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("REGEXP:[^\R\N]*",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"regexp:[^\r\n]*")  {
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

///  then_block ::= ( '{' [ cos_code_block ] '}' ) | command_list_eol
Method ThenBlock(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ThenBlock157Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CommandListEol(subElement,.addedElement)  {
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

///  '{' [ cos_code_block ] '}'
/// summary values:{
Method ThenBlock157Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?4?&P
	; first rule summary P
	if '(..isStringSingle("{",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"{")  {
		if $S(..CosCodeBlock(subElement,.addedElement) :1,1:1) {
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

///  this_object ::= this_object_self | this_object_this
Method ThisObject(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ThisObjectSelf(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ThisObjectThis(subElement,.addedElement)  {
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

///  this_object_direct_property ::= 'i%' object_chain_item
/// summary values:I%
Method ThisObjectDirectProperty(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle("I%",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"i%")  {
		if ..ObjectChainItem(subElement,.addedElement)  {
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

///  this_object_self ::= ('..' | 'i%' | 'r%' | 'm%' | 's%') [object_chain_no_dot]
Method ThisObjectSelf(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ThisObjectSelf92Sub(subElement,.addedElement)  {
		if $S(..ObjectChainNoDot(subElement,.addedElement) :1,1:1) {
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

/// '..' | 'i%' | 'r%' | 'm%' | 's%'
/// summary values:..,I%,R%,M%,S%
Method ThisObjectSelf92Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|P|P|P|P
	if '(..isStringInList($lb("..","I%","R%","M%","S%"),2,.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
	if ..addPunctuation(subElement,"..")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"i%")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"r%")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"m%")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"s%")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  this_object_set ::= this_object_self | this_object_this
Method ThisObjectSet(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ThisObjectSelf(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ThisObjectThis(subElement,.addedElement)  {
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

///  this_object_this ::= ('$this' | '##this') [ object_chain]
Method ThisObjectThis(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ThisObjectThis93Sub(subElement,.addedElement)  {
		if $S(..ObjectChain(subElement,.addedElement) :1,1:1) {
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

/// '$this' | '##this'
/// summary values:$THIS,##THIS
Method ThisObjectThis93Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|P
	if '(..isStringInList($lb("$THIS","##THIS"),6,.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
	if ..addPunctuation(subElement,"$this")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"##this")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  throw_command ::= 'throw' [ post_conditional ] [ naked | expression ]
/// summary values:THROW
Method ThrowCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?4?&?4?
	; first rule summary K
	if '(..isKeywordInList($lb("THROW"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"THROW")  {
		if $S(..PostConditional(subElement,.addedElement) :1,1:1) {
			if ..ThrowCommand239OptGrp(subElement,.addedElement)  {
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

Method ThrowCommand239OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Naked(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Expression(subElement,.addedElement)  {
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

///  trollback_command ::= 'trollback' [ post_conditional ] [ '1' ]
/// summary values:TROLLBACK
Method TrollbackCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?4?&?4?
	; first rule summary K
	if '(..isKeywordInList($lb("TROLLBACK"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"TROLLBACK")  {
		if $S(..PostConditional(subElement,.addedElement) :1,1:1) {
			if $S(..addPunctuation(subElement,"1") :1,1:1) {
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

///  try_command ::= 'try' '{' [ cos_code_block ] '}' (cos_directive)* 'catch' [ identifier | ( '(' identifier ')' ) ] '{' [ cos_code_block ] '}'
/// summary values:TRY
Method TryCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?4?&P&(?4?)*&K&?4?&P&?4?&P
	; first rule summary K
	if '(..isKeywordInList($lb("TRY"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"TRY")  {
		if ..addPunctuation(subElement,"{")  {
			if $S(..CosCodeBlock(subElement,.addedElement) :1,1:1) {
				if ..addPunctuation(subElement,"}")  {
					if ..TryCommand240RepZero(subElement,.addedElement)  {
						if ..addKeyword(subElement,"CATCH")  {
							if ..TryCommand242OptGrp(subElement,.addedElement)  {
								if ..addPunctuation(subElement,"{")  {
									if $S(..CosCodeBlock(subElement,.addedElement) :1,1:1) {
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

///  (cos_directive)*
Method TryCommand240RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..TryCommand241Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

/// cos_directive
Method TryCommand241Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CosDirective(subElement,.addedElement)  {
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

Method TryCommand242OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Identifier(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..TryCommand243Sub(subElement,.addedElement)  {
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

///  '(' identifier ')'
/// summary values:(
Method TryCommand243Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"(")  {
		if ..Identifier(subElement,.addedElement)  {
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

///  tstart_command ::= ('tstart' | 'ts' ) [ post_conditional ]
Method TstartCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..TstartCommand244Sub(subElement,.addedElement)  {
		if $S(..PostConditional(subElement,.addedElement) :1,1:1) {
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

/// 'tstart' | 'ts'
/// summary values:TSTART,TS
Method TstartCommand244Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K
	if '(..isKeywordInList($lb("TSTART","TS"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
	if ..addKeyword(subElement,"TSTART")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"TS")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  use_arguments ::= one_use_argument ( ',' one_use_argument )*
Method UseArguments(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OneUseArgument(subElement,.addedElement)  {
		if ..UseArguments246RepZero(subElement,.addedElement)  {
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

///  ( ',' one_use_argument )*
Method UseArguments246RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..UseArguments247Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' one_use_argument
/// summary values:,
Method UseArguments247Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..OneUseArgument(subElement,.addedElement)  {
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

///  use_command ::= ('use' | 'u') [ post_conditional ] use_arguments
Method UseCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..UseCommand245Sub(subElement,.addedElement)  {
		if $S(..PostConditional(subElement,.addedElement) :1,1:1) {
			if ..UseArguments(subElement,.addedElement)  {
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

/// 'use' | 'u'
/// summary values:USE,U
Method UseCommand245Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K
	if '(..isKeywordInList($lb("USE","U"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
	if ..addKeyword(subElement,"USE")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"U")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  use_device ::= expression
Method UseDevice(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(subElement,.addedElement)  {
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

///  use_device_parameters ::= [one_use_device_parameter] ( ':' [one_use_device_parameter] )*
Method UseDeviceParameters(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..OneUseDeviceParameter(subElement,.addedElement) :1,1:1) {
		if ..UseDeviceParameters251RepZero(subElement,.addedElement)  {
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

///  ( ':' [one_use_device_parameter] )*
Method UseDeviceParameters251RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..UseDeviceParameters252Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ':' [one_use_device_parameter]
/// summary values::
Method UseDeviceParameters252Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?4?
	; first rule summary P
	if '(..isStringSingle(":",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,":")  {
		if $S(..OneUseDeviceParameter(subElement,.addedElement) :1,1:1) {
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

///  use_device_parameters_inbrackets ::= '(' use_device_parameters ')'
/// summary values:(
Method UseDeviceParametersInbrackets(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"(")  {
		if ..UseDeviceParameters(subElement,.addedElement)  {
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

///  use_mnemonic_space ::= expression
Method UseMnemonicSpace(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(subElement,.addedElement)  {
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

///  variable ::= variable_identifier [ array_parameter_list ] [ object_chain ]
Method Variable(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?&?4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..VariableIdentifier(subElement,.addedElement)  {
		if $S(..ArrayParameterList(subElement,.addedElement) :1,1:1) {
			if $S(..ObjectChain(subElement,.addedElement) :1,1:1) {
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

///  variable_set ::= variable_identifier [ array_parameter_list ] [ object_chain ]
Method VariableSet(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?&?4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..VariableIdentifier(subElement,.addedElement)  {
		if $S(..ArrayParameterList(subElement,.addedElement) :1,1:1) {
			if $S(..ObjectChain(subElement,.addedElement) :1,1:1) {
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

///  view_block_form ::= expression
Method ViewBlockForm(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(subElement,.addedElement)  {
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

///  view_command ::= ('view' | 'v') [ post_conditional ] ( view_offset_form | view_block_form )
Method ViewCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ViewCommand255Sub(subElement,.addedElement)  {
		if $S(..PostConditional(subElement,.addedElement) :1,1:1) {
			if ..ViewCommand256Sub(subElement,.addedElement)  {
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

/// 'view' | 'v'
/// summary values:VIEW,V
Method ViewCommand255Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K
	if '(..isKeywordInList($lb("VIEW","V"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
	if ..addKeyword(subElement,"VIEW")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"V")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  view_offset_form | view_block_form
Method ViewCommand256Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ViewOffsetForm(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ViewBlockForm(subElement,.addedElement)  {
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

///  view_length ::= expression
Method ViewLength(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(subElement,.addedElement)  {
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

///  view_mode ::= expression
Method ViewMode(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(subElement,.addedElement)  {
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

///  view_newvalue ::= expression
Method ViewNewvalue(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(subElement,.addedElement)  {
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

///  view_offset ::= expression
Method ViewOffset(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(subElement,.addedElement)  {
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

///  view_offset_form ::= view_offset ':' view_mode ':' view_length ':' view_newvalue
Method ViewOffsetForm(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&P&?1Rule?&P&?1Rule?&P&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ViewOffset(subElement,.addedElement)  {
		if ..addPunctuation(subElement,":")  {
			if ..ViewMode(subElement,.addedElement)  {
				if ..addPunctuation(subElement,":")  {
					if ..ViewLength(subElement,.addedElement)  {
						if ..addPunctuation(subElement,":")  {
							if ..ViewNewvalue(subElement,.addedElement)  {
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

///  while_command ::= 'while' expression_list '{' [ cos_code_block ] '}'
/// summary values:WHILE
Method WhileCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?&P&?4?&P
	; first rule summary K
	if '(..isKeywordInList($lb("WHILE"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"WHILE")  {
		if ..ExpressionList(subElement,.addedElement)  {
			if ..addPunctuation(subElement,"{")  {
				if $S(..CosCodeBlock(subElement,.addedElement) :1,1:1) {
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

///  whitespace ::= ( [ comment ] [ ( ' ' | '\t' | '\r') ] )*
Method Whitespace(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (?4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Whitespace47RepZero(subElement,.addedElement)  {
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

///  ( [ comment ] [ ( ' ' | '\t' | '\r') ] )*
Method Whitespace47RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..Whitespace48Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  [ comment ] [ ( ' ' | '\t' | '\r') ]
Method Whitespace48Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?&?4?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..Comment(subElement,.addedElement) :1,1:1) {
		if $S(..Whitespace49Sub(subElement,.addedElement) :1,1:1) {
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

///  ' ' | '\t' | '\r'
/// summary values: ,\T,\R
Method Whitespace49Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|P|P
	if '(..isStringInList($lb(" ","\T","\R"),2,.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
	if ..addPunctuation(subElement," ")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"\t")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"\r")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  write_argument_list ::= one_write_argument ( ',' one_write_argument)*
Method WriteArgumentList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OneWriteArgument(subElement,.addedElement)  {
		if ..WriteArgumentList258RepZero(subElement,.addedElement)  {
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

///  ( ',' one_write_argument)*
Method WriteArgumentList258RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..WriteArgumentList259Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' one_write_argument
/// summary values:,
Method WriteArgumentList259Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..OneWriteArgument(subElement,.addedElement)  {
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

///  write_bang_expression ::= '!'
/// summary values:!
Method WriteBangExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("!",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"!")  {
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

///  write_command ::= ('write' | 'w') [ post_conditional ] [ write_argument_list ]
Method WriteCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?&?4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..WriteCommand257Sub(subElement,.addedElement)  {
		if $S(..PostConditional(subElement,.addedElement) :1,1:1) {
			if $S(..WriteArgumentList(subElement,.addedElement) :1,1:1) {
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

/// 'write' | 'w'
/// summary values:WRITE,W
Method WriteCommand257Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K
	if '(..isKeywordInList($lb("WRITE","W"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
	if ..addKeyword(subElement,"WRITE")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"W")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  write_control_expression ::= write_format_expression | write_device_expression | write_escape_expression
Method WriteControlExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..WriteFormatExpression(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..WriteDeviceExpression(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..WriteEscapeExpression(subElement,.addedElement)  {
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

///  write_control_expression_list ::= write_control_expression (write_control_expression)*
Method WriteControlExpressionList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..WriteControlExpression(subElement,.addedElement)  {
		if ..WriteControlExpressionList260RepZero(subElement,.addedElement)  {
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

///  (write_control_expression)*
Method WriteControlExpressionList260RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..WriteControlExpressionList261Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

/// write_control_expression
Method WriteControlExpressionList261Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..WriteControlExpression(subElement,.addedElement)  {
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

///  write_device_expression ::= '*-' expression
/// summary values:*-
Method WriteDeviceExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle("*-",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"*-")  {
		if ..Expression(subElement,.addedElement)  {
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

///  write_escape_expression ::= '*' expression
/// summary values:*
Method WriteEscapeExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle("*",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"*")  {
		if ..Expression(subElement,.addedElement)  {
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

///  write_format_expression ::= write_bang_expression | write_hash_expression | write_pos_expression | write_mnemonic_expression
Method WriteFormatExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?|?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..WriteBangExpression(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..WriteHashExpression(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..WritePosExpression(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..WriteMnemonicExpression(subElement,.addedElement)  {
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

///  write_hash_expression ::= '#'
/// summary values:#
Method WriteHashExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("#",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"#")  {
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

///  write_mnemonic_expression ::= '/' identifier [ '(' mnemonic_arguments* ')' ]
/// summary values:/
Method WriteMnemonicExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&?4?
	; first rule summary P
	if '(..isStringSingle("/",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"/")  {
		if ..Identifier(subElement,.addedElement)  {
			if ..WriteMnemonicExpression262OptGrp(subElement,.addedElement)  {
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
/// summary values:(
Method WriteMnemonicExpression262OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&(?4?)*&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"(")  {
		if ..WriteMnemonicExpression263RepZero(subElement,.addedElement)  {
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

///  mnemonic_arguments*
Method WriteMnemonicExpression263RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..MnemonicArguments(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  write_pos_expression ::= '?' expression
/// summary values:?
Method WritePosExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle("?",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"?")  {
		if ..Expression(subElement,.addedElement)  {
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

///  xecute_arg_no_params ::= xecute_command_text
Method XecuteArgNoParams(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XecuteCommandText(subElement,.addedElement)  {
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

///  xecute_arg_with_params ::= '(' xecute_command_text ',' xecute_param_list ')'
/// summary values:(
Method XecuteArgWithParams(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&P&?1Rule?&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"(")  {
		if ..XecuteCommandText(subElement,.addedElement)  {
			if ..addPunctuation(subElement,",")  {
				if ..XecuteParamList(subElement,.addedElement)  {
					if ..addPunctuation(subElement,")")  {
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

///  xecute_args ::= one_xecute_arg ( ',' one_xecute_arg )*
Method XecuteArgs(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OneXecuteArg(subElement,.addedElement)  {
		if ..XecuteArgs280RepZero(subElement,.addedElement)  {
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

///  ( ',' one_xecute_arg )*
Method XecuteArgs280RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..XecuteArgs281Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' one_xecute_arg
/// summary values:,
Method XecuteArgs281Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..OneXecuteArg(subElement,.addedElement)  {
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

///  xecute_command ::= ( 'xecute' | 'x') [ post_conditional ] xecute_args
Method XecuteCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XecuteCommand279Sub(subElement,.addedElement)  {
		if $S(..PostConditional(subElement,.addedElement) :1,1:1) {
			if ..XecuteArgs(subElement,.addedElement)  {
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

///  'xecute' | 'x'
/// summary values:XECUTE,X
Method XecuteCommand279Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K
	if '(..isKeywordInList($lb("XECUTE","X"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
	if ..addKeyword(subElement,"XECUTE")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"X")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  xecute_command_text ::= expression
Method XecuteCommandText(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(subElement,.addedElement)  {
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

///  xecute_param_list ::= xecute_parameter ( ',' xecute_parameter )*
Method XecuteParamList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XecuteParameter(subElement,.addedElement)  {
		if ..XecuteParamList283RepZero(subElement,.addedElement)  {
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

///  ( ',' xecute_parameter )*
Method XecuteParamList283RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..XecuteParamList284Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' xecute_parameter
/// summary values:,
Method XecuteParamList284Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..XecuteParameter(subElement,.addedElement)  {
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

///  xecute_parameter ::= ('.' variable ) | expression
Method XecuteParameter(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XecuteParameter285Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Expression(subElement,.addedElement)  {
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

/// '.' variable
/// summary values:.
Method XecuteParameter285Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(".",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,".")  {
		if ..Variable(subElement,.addedElement)  {
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

///  zallocate_command ::= 'zallocate' [post_conditional ] [ zallocate_parameter ( ',' zallocate_parameter)* ] [ else_block ]
/// summary values:ZALLOCATE
Method ZallocateCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?4?&?4?&?4?
	; first rule summary K
	if '(..isKeywordInList($lb("ZALLOCATE"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"ZALLOCATE")  {
		if $S(..PostConditional(subElement,.addedElement) :1,1:1) {
			if ..ZallocateCommand286OptGrp(subElement,.addedElement)  {
				if $S(..ElseBlock(subElement,.addedElement) :1,1:1) {
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

Method ZallocateCommand286OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ZallocateParameter(subElement,.addedElement)  {
		if ..ZallocateCommand287RepZero(subElement,.addedElement)  {
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

///  ( ',' zallocate_parameter)*
Method ZallocateCommand287RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ZallocateCommand288Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' zallocate_parameter
/// summary values:,
Method ZallocateCommand288Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..ZallocateParameter(subElement,.addedElement)  {
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

///  zallocate_parameter ::= [ '+' | '-' ] zallocatename_list [ zallocate_timeout ]
Method ZallocateParameter(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?&?1Rule?&?4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ZallocateParameter289OptGrp(subElement,.addedElement)  {
		if ..ZallocatenameList(subElement,.addedElement)  {
			if $S(..ZallocateTimeout(subElement,.addedElement) :1,1:1) {
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
/// summary values:+,-
Method ZallocateParameter289OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|P
	if '(..isStringInList($lb("+","-"),1,.value)) { quit 1 /* not found is OK */ }
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
	if ..addPunctuation(subElement,"+")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"-")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=1 /* failure rollsback but returns OK */
	}
	quit ret
}

///  zallocate_timeout ::= ':' expression
/// summary values::
Method ZallocateTimeout(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(":",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,":")  {
		if ..Expression(subElement,.addedElement)  {
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

///  zallocate_type ::= '#' '"' ( 'S' | 'E' | 'I' | 'D' )+ '"'
/// summary values:#
Method ZallocateType(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&P&(?4?)+&P
	; first rule summary P
	if '(..isStringSingle("#",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"#")  {
		if ..addPunctuation(subElement,"""")  {
			if ..ZallocateType292RepOne(subElement,.addedElement)  {
				if ..addPunctuation(subElement,"""")  {
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

///  ( 'S' | 'E' | 'I' | 'D' )+
Method ZallocateType292RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..ZallocateType293Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  'S' | 'E' | 'I' | 'D'
/// summary values:S,E,I,D
Method ZallocateType293Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K|K|K
	if '(..isKeywordInList($lb("S","E","I","D"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
	if ..addKeyword(subElement,"S")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"E")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"I")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"D")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  zallocatename ::= text
Method Zallocatename(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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

///  zallocatename_list ::= one_zallocatename ( ',' one_zallocatename )*
Method ZallocatenameList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OneZallocatename(subElement,.addedElement)  {
		if ..ZallocatenameList290RepZero(subElement,.addedElement)  {
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

///  ( ',' one_zallocatename )*
Method ZallocatenameList290RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ZallocatenameList291Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' one_zallocatename
/// summary values:,
Method ZallocatenameList291Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..OneZallocatename(subElement,.addedElement)  {
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

///  zbreak_command ::= ('zbreak' | 'zb') [ post_conditional ] [ '/' identifier [ ':' identifier ] ]
Method ZbreakCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?&?4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ZbreakCommand294Sub(subElement,.addedElement)  {
		if $S(..PostConditional(subElement,.addedElement) :1,1:1) {
			if ..ZbreakCommand295OptGrp(subElement,.addedElement)  {
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

/// 'zbreak' | 'zb'
/// summary values:ZBREAK,ZB
Method ZbreakCommand294Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K
	if '(..isKeywordInList($lb("ZBREAK","ZB"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
	if ..addKeyword(subElement,"ZBREAK")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"ZB")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

/// 
/// summary values:/
Method ZbreakCommand295OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&?4?
	; first rule summary P
	if '(..isStringSingle("/",.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"/")  {
		if ..Identifier(subElement,.addedElement)  {
			if ..ZbreakCommand296OptGrp(subElement,.addedElement)  {
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
/// summary values::
Method ZbreakCommand296OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(":",.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,":")  {
		if ..Identifier(subElement,.addedElement)  {
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

///  zdeallocate_command ::= 'zdeallocate' [post_conditional ] [ zdeallocate_parameter ( ',' zdeallocate_parameter)* ] [ else_block ]
/// summary values:ZDEALLOCATE
Method ZdeallocateCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?4?&?4?&?4?
	; first rule summary K
	if '(..isKeywordInList($lb("ZDEALLOCATE"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"ZDEALLOCATE")  {
		if $S(..PostConditional(subElement,.addedElement) :1,1:1) {
			if ..ZdeallocateCommand297OptGrp(subElement,.addedElement)  {
				if $S(..ElseBlock(subElement,.addedElement) :1,1:1) {
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

Method ZdeallocateCommand297OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ZdeallocateParameter(subElement,.addedElement)  {
		if ..ZdeallocateCommand298RepZero(subElement,.addedElement)  {
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

///  ( ',' zdeallocate_parameter)*
Method ZdeallocateCommand298RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ZdeallocateCommand299Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' zdeallocate_parameter
/// summary values:,
Method ZdeallocateCommand299Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..ZdeallocateParameter(subElement,.addedElement)  {
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

///  zdeallocate_parameter ::= [ '+' | '-' ] zdeallocatename_list [ zdeallocate_timeout ]
Method ZdeallocateParameter(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?&?1Rule?&?4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ZdeallocateParameter300OptGrp(subElement,.addedElement)  {
		if ..ZdeallocatenameList(subElement,.addedElement)  {
			if $S(..ZdeallocateTimeout(subElement,.addedElement) :1,1:1) {
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
/// summary values:+,-
Method ZdeallocateParameter300OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|P
	if '(..isStringInList($lb("+","-"),1,.value)) { quit 1 /* not found is OK */ }
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
	if ..addPunctuation(subElement,"+")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"-")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=1 /* failure rollsback but returns OK */
	}
	quit ret
}

///  zdeallocate_timeout ::= ':' expression
/// summary values::
Method ZdeallocateTimeout(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(":",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,":")  {
		if ..Expression(subElement,.addedElement)  {
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

///  zdeallocate_type ::= '#' '"' ( 'S' | 'E' | 'I' | 'D' )+ '"'
/// summary values:#
Method ZdeallocateType(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&P&(?4?)+&P
	; first rule summary P
	if '(..isStringSingle("#",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"#")  {
		if ..addPunctuation(subElement,"""")  {
			if ..ZdeallocateType303RepOne(subElement,.addedElement)  {
				if ..addPunctuation(subElement,"""")  {
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

///  ( 'S' | 'E' | 'I' | 'D' )+
Method ZdeallocateType303RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..ZdeallocateType304Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  'S' | 'E' | 'I' | 'D'
/// summary values:S,E,I,D
Method ZdeallocateType304Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K|K|K
	if '(..isKeywordInList($lb("S","E","I","D"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
	if ..addKeyword(subElement,"S")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"E")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"I")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"D")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  zdeallocatename ::= text
Method Zdeallocatename(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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

///  zdeallocatename_list ::= one_zdeallocatename ( ',' one_zdeallocatename )*
Method ZdeallocatenameList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OneZdeallocatename(subElement,.addedElement)  {
		if ..ZdeallocatenameList301RepZero(subElement,.addedElement)  {
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

///  ( ',' one_zdeallocatename )*
Method ZdeallocatenameList301RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ZdeallocatenameList302Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' one_zdeallocatename
/// summary values:,
Method ZdeallocatenameList302Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..OneZdeallocatename(subElement,.addedElement)  {
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

///  zinsert_command ::= 'zinsert'
/// summary values:ZINSERT
Method ZinsertCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeywordInList($lb("ZINSERT"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"ZINSERT")  {
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

///  zkill_command ::= ('zkill' | 'zk') [ post_conditional ] [ kill_parameter_list ]
Method ZkillCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?&?4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ZkillCommand305Sub(subElement,.addedElement)  {
		if $S(..PostConditional(subElement,.addedElement) :1,1:1) {
			if $S(..KillParameterList(subElement,.addedElement) :1,1:1) {
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

/// 'zkill' | 'zk'
/// summary values:ZKILL,ZK
Method ZkillCommand305Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K
	if '(..isKeywordInList($lb("ZKILL","ZK"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
	if ..addKeyword(subElement,"ZKILL")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"ZK")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  zload_command ::= 'zload'
/// summary values:ZLOAD
Method ZloadCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeywordInList($lb("ZLOAD"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"ZLOAD")  {
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

///  znspace_command ::= ('znspace'|'zn') [ post_conditional ] expression
Method ZnspaceCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ZnspaceCommand306Sub(subElement,.addedElement)  {
		if $S(..PostConditional(subElement,.addedElement) :1,1:1) {
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

/// 'znspace'|'zn'
/// summary values:ZNSPACE,ZN
Method ZnspaceCommand306Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K
	if '(..isKeywordInList($lb("ZNSPACE","ZN"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
	if ..addKeyword(subElement,"ZNSPACE")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"ZN")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  zobjclassmethod_function_call ::= 'zobjclassmethod' function_parameter_list [ object_chain ]
/// summary values:ZOBJCLASSMETHOD
Method ZobjclassmethodFunctionCall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?&?4?
	; first rule summary K
	if '(..isKeywordInList($lb("ZOBJCLASSMETHOD"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"ZOBJCLASSMETHOD")  {
		if ..FunctionParameterList(subElement,.addedElement)  {
			if $S(..ObjectChain(subElement,.addedElement) :1,1:1) {
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

///  zobjmethod_function_call ::= 'zobjmethod' function_parameter_list [ object_chain ]
/// summary values:ZOBJMETHOD
Method ZobjmethodFunctionCall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?&?4?
	; first rule summary K
	if '(..isKeywordInList($lb("ZOBJMETHOD"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"ZOBJMETHOD")  {
		if ..FunctionParameterList(subElement,.addedElement)  {
			if $S(..ObjectChain(subElement,.addedElement) :1,1:1) {
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

///  zprint_command ::= 'zprint' [ post_conditional ] [ lineref1 [ ':' lineref2 ] ]
/// summary values:ZPRINT
Method ZprintCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?4?&?4?
	; first rule summary K
	if '(..isKeywordInList($lb("ZPRINT"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"ZPRINT")  {
		if $S(..PostConditional(subElement,.addedElement) :1,1:1) {
			if ..ZprintCommand307OptGrp(subElement,.addedElement)  {
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

Method ZprintCommand307OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Lineref1(subElement,.addedElement)  {
		if ..ZprintCommand308OptGrp(subElement,.addedElement)  {
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
/// summary values::
Method ZprintCommand308OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(":",.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,":")  {
		if ..Lineref2(subElement,.addedElement)  {
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

///  zquit_command ::= 'zquit'
/// summary values:ZQUIT
Method ZquitCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeywordInList($lb("ZQUIT"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"ZQUIT")  {
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

///  zremove_command ::= 'zremove'
/// summary values:ZREMOVE
Method ZremoveCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeywordInList($lb("ZREMOVE"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"ZREMOVE")  {
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

///  zsave_command ::= 'zsave'
/// summary values:ZSAVE
Method ZsaveCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeywordInList($lb("ZSAVE"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"ZSAVE")  {
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

///  zsync_command ::= 'zsync' [ post_conditional ]
/// summary values:ZSYNC
Method ZsyncCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?4?
	; first rule summary K
	if '(..isKeywordInList($lb("ZSYNC"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"ZSYNC")  {
		if $S(..PostConditional(subElement,.addedElement) :1,1:1) {
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

///  ztrap_command ::= ('ztrap' | 'zt') [post_conditional ] [naked | expression]
Method ZtrapCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?&?4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ZtrapCommand309Sub(subElement,.addedElement)  {
		if $S(..PostConditional(subElement,.addedElement) :1,1:1) {
			if ..ZtrapCommand310OptGrp(subElement,.addedElement)  {
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

/// 'ztrap' | 'zt'
/// summary values:ZTRAP,ZT
Method ZtrapCommand309Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K
	if '(..isKeywordInList($lb("ZTRAP","ZT"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
	if ..addKeyword(subElement,"ZTRAP")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"ZT")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

Method ZtrapCommand310OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Naked(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Expression(subElement,.addedElement)  {
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

///  zwrite_argument ::= expression
Method ZwriteArgument(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(subElement,.addedElement)  {
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

///  zwrite_argument_list ::= zwrite_argument ( ',' zwrite_argument )*
Method ZwriteArgumentList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ZwriteArgument(subElement,.addedElement)  {
		if ..ZwriteArgumentList312RepZero(subElement,.addedElement)  {
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

///  ( ',' zwrite_argument )*
Method ZwriteArgumentList312RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ZwriteArgumentList313Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' zwrite_argument
/// summary values:,
Method ZwriteArgumentList313Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..ZwriteArgument(subElement,.addedElement)  {
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

///  zwrite_command ::= ( 'zwrite' | 'zw' ) [ post_conditional ] [ zwrite_argument_list ]
Method ZwriteCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?&?4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ZwriteCommand311Sub(subElement,.addedElement)  {
		if $S(..PostConditional(subElement,.addedElement) :1,1:1) {
			if $S(..ZwriteArgumentList(subElement,.addedElement) :1,1:1) {
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

///  'zwrite' | 'zw'
/// summary values:ZWRITE,ZW
Method ZwriteCommand311Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K
	if '(..isKeywordInList($lb("ZWRITE","ZW"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
	if ..addKeyword(subElement,"ZWRITE")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"ZW")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  zzdump_command ::= 'zzdump' [post_conditional] expression
/// summary values:ZZDUMP
Method ZzdumpCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?4?&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("ZZDUMP"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"ZZDUMP")  {
		if $S(..PostConditional(subElement,.addedElement) :1,1:1) {
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

///  zzwrite_command ::= 'zzwrite' [post_conditional] expression
/// summary values:ZZWRITE
Method ZzwriteCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?4?&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("ZZWRITE"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"ZZWRITE")  {
		if $S(..PostConditional(subElement,.addedElement) :1,1:1) {
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

Method newElement(Type As %String) As PXW.DEV.BNF.Elements.COS
{
	quit ##class(PXW.DEV.BNF.Elements.COS).%New(Type)
}

}
