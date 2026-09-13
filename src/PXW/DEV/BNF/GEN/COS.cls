Class PXW.DEV.BNF.GEN.COS Extends PXW.DEV.BNF.super [ ProcedureBlock ]
{

Parameter KeywordPattern = "1A.AN";

Parameter Keywords = "A,ARRAY,AS,B,BIT,BITLOGIC,BREAK,C,CASE,CATCH,CLASSCONTEXT,CLASSMETHOD,CLOSE,CONTINUE,D,DATA,DEF1ARG,DEFERRED,DEFINE,DEVICE,DIM,DISPLAY,DO,E,EC,ECODE,ELSE,ELSEIF,ENDIF,ES,ESTACK,ET,ETRAP,EXECUTE,EXTRACT,F,FALSE,FDBMS,FOR,G,GENERATOR,GET,GOTO,H,HALT,HANG,HOROLOG,I,IF,IFDEF,IFNDEF,IMPORT,INCLUDE,INCREMENT,IO,J,JOB,K,KEY,KILL,L,LB,LG,LI,LIST,LISTBUILD,LISTGET,LISTNEXT,LISTUPDATE,LOCATE,LOCK,LOGICAL,LU,M,MERGE,METHOD,METHODIMPL,MNV,MODE,MV,MVAM,MVANS,MVCOMMAND,MVCONV,MVDATE,MVDAY,MVDICT,MVERRORS,MVFILENAME,MVFM,MVFOOTER,MVFORMAT,MVHEADER,MVID,MVLEVEL,MVMONTH,MVMORESUBVALUES,MVMOREVALUES,MVNAM,MVNB,MVND,MVNI,MVNS,MVNV,MVOPTIONS,MVP,MVPARASENTENCE,MVPRINT,MVPROCERRORS,MVPROCNAME,MVPROCPIB,MVPROCPIBOFF,MVPROCPOB,MVPROCSIB,MVPROCSIBOFF,MVPROCSOB,MVRECORD,MVSELECTED,MVSENTENCE,MVSM,MVSTDFIL,MVSVM,MVSYSRETCODE,MVTIME,MVTM,MVTTY,MVUSERRETCODE,MVVM,MVYEAR,N,NAMESPACE,NEW,NULL,O,ODBC,OF,OPEN,ORDER,P,PIECE,PRINCIPAL,PRINT,PRIVATE,PUBLIC,PYTHON,Q,QUERY,QUIT,R,READ,RET,RETURN,ROLES,RUNTIME,S,SELECT,SET,SPECIAL,SQLCOMPILE,STACK,STORAGE,SY,SYSTEM,T,TC,TCOMMIT,TEST,TEXT,THIS,THROW,THROWOBJ,TL,TLEVEL,TROLLBACK,TRUE,TRY,TS,TSTART,U,UNDEF,USE,USERNAME,V,VECTOR,VIEW,W,WHILE,WRITE,X,XECUTE,Y,ZA,ZB,ZBREAK,ZCHILD,ZE,ZEOF,ZEOS,ZERROR,ZFWCHARZ,ZH,ZHOROLOG,ZHWKATAZ,ZINSERT,ZIO,ZJOB,ZK,ZKILL,ZLOAD,ZMODE,ZN,ZNAME,ZNSPACE,ZOBJCLASSMETHOD,ZOBJMETHOD,ZORDER,ZPARENT,ZPI,ZPOS,ZPRINT,ZQUIT,ZR,ZREFERENCE,ZREMOVE,ZS,ZSAVE,ZSTORAGE,ZSYNC,ZT,ZTIMESTAMP,ZTIMEZONE,ZTRAP,ZTS,ZU,ZUTIL,ZV,ZVERSION,ZW,ZWRITE,ZZ,ZZDUMP,ZZWRITE";

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
		set ok=0
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
		set ok=0
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  array_parameter_list ::= open_bracket ','.expression+ close_bracket
/// summary=C&.C.&C
Method ArrayParameterList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&.C.&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OpenBracket(.subElement,.addedElement)  {
		if ..ArrayParameterList1RepSep(.subElement,.addedElement)  {
			if ..CloseBracket(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ','.expression+
Method ArrayParameterList1RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4String:4?
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set done=0 ; must be at least 1
	if ..Expression(.subElement,.addedElement) {
		set done=1,ok=1 ; found 1
		do {
			$$$BNFSTART(repElement)
			set ok=(..addPunctuation(.repElement,",")  && ..Expression(.repElement,.addedElement) )
			if ok {
				$$$BNFCOMMITCOPY(repElement,subElement)
			} else {
				$$$BNFROLLBACK(repElement)
			}
		} while ok
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	quit ok
}

///  bit_function_call_set ::= 'bit' open_bracket variable_set ',' expression close_bracket
/// summary values:BIT
/// summary=K&C&C&P&C&C
Method BitFunctionCallSet(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C&C&P&C&C
	if '(..isKeyword("BIT")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"BIT")  {
		if ..OpenBracket(.subElement,.addedElement)  {
			if ..VariableSet(.subElement,.addedElement)  {
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

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
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
	if ..BitlogicExpression1RepZero(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  (expression ('|' | '&' | '^' |'~')* )*
Method BitlogicExpression1RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	; method start
	while ..BitlogicExpression2Sub(.subElement,.addedElement)  {
		;
	}
	set ok=1
	quit ok
}

/// expression ('|' | '&' | '^' |'~')*
/// summary=C&(?4punctuation:4?)*
Method BitlogicExpression2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&(?4punctuation:4?)*
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(.subElement,.addedElement)  {
		if ..BitlogicExpression3RepZero(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	quit ok
}

///  ('|' | '&' | '^' |'~')*
Method BitlogicExpression3RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	; method start
	while ..BitlogicExpression4Sub(.subElement,.addedElement)  {
		;
	}
	set ok=1
	quit ok
}

/// '|' | '&' | '^' |'~'
/// summary values:|,&,^,~
/// summary=P|P|P|P
Method BitlogicExpression4Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P|P|P|P
	if '..isPunctuationInList($lb("|","&","^","~"),1) { quit 0 /* normal */ }
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

	set ok=$s(done:1,1:0)
	quit ok
}

///  bitlogic_function_call ::= 'bitlogic' open_bracket bitlogic_expression [ ',' expression ] close_bracket
/// summary values:BITLOGIC
/// summary=K&C&C&[P&C]&C
Method BitlogicFunctionCall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C&C&[P&C]&C
	if '(..isKeyword("BITLOGIC")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"BITLOGIC")  {
		if ..OpenBracket(.subElement,.addedElement)  {
			if ..BitlogicExpression(.subElement,.addedElement)  {
				if ..BitlogicFunctionCall1OptGrp(.subElement,.addedElement)  {
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary values:,
/// summary=P&C
Method BitlogicFunctionCall1OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation(",",1) { quit 1 /* not found is OK */ }
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
	if '..isPunctuation("/*",2) { quit 0 /* normal */ }
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  break_command ::= ('break' | 'b') post_conditional? [ naked | ( break_extend | break_flag )]
/// summary values:BREAK,B
/// summary=(K|K)&?4OptionalSingle4?&[C|(C|C)]
Method BreakCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&?4OptionalSingle4?&[C|(C|C)]
	if '(..isKeywordInList($lb("BREAK","B"))) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..BreakCommand1Sub(.subElement,.addedElement)  {
		if $s(..PostConditional(.subElement,.addedElement) :1,1:1)  {
			if ..BreakCommand2OptGrp(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 'break' | 'b'
/// summary=K|K
Method BreakCommand1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"BREAK")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"B")  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

/// 
/// summary=C|(C|C)
Method BreakCommand2OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|(C|C)
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Naked(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..BreakCommand3Sub(.subElement,.addedElement)  {
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
Method BreakCommand3Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..BreakExtend(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..BreakFlag(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
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
		set ok=0
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
		set ok=0
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
		set ok=0
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
		set ok=0
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  case_clause_default ::= ',' ':' case_clause_value
/// summary values:,
/// summary=P&P&C
Method CaseClauseDefault(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&P&C
	if '..isPunctuation(",",1) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  case_clause_list ::= (( ',' case_clause ))*
/// summary=(?4punctuation:4?)*
Method CaseClauseList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CaseClauseList1RepZero(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  (( ',' case_clause ))*
Method CaseClauseList1RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	; method start
	while ..CaseClauseList2Sub(.subElement,.addedElement)  {
		;
	}
	set ok=1
	quit ok
}

/// ( ',' case_clause )
/// summary=(P&C)
Method CaseClauseList2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary (P&C)
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CaseClauseList3Sub(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	quit ok
}

///  ',' case_clause
/// summary values:,
/// summary=P&C
Method CaseClauseList3Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation(",",1) { quit 0 /* normal */ }
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
		set ok=0
	}
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  case_function_call ::= 'case' open_bracket expression case_clause_list? case_clause_default? close_bracket
/// summary values:CASE
/// summary=K&C&C&?4OptionalSingle4?&?4OptionalSingle4?&C
Method CaseFunctionCall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C&C&?4OptionalSingle4?&?4OptionalSingle4?&C
	if '(..isKeyword("CASE")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"CASE")  {
		if ..OpenBracket(.subElement,.addedElement)  {
			if ..Expression(.subElement,.addedElement)  {
				if $s(..CaseClauseList(.subElement,.addedElement) :1,1:1)  {
					if $s(..CaseClauseDefault(.subElement,.addedElement) :1,1:1)  {
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
		set ok=0
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
		if ..ClassCasting1Sub(.subElement,.addedElement)  {
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  '##this' | '$this' | variable_identifier
/// summary=P|P|C
Method ClassCasting1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		set ok=0
	}
	quit ok
}

///  class_expression ::= '##class' '(' class_reference ')' [ class_casting ] object_chain
/// summary values:##CLASS
/// summary=P&P&C&P&[C]&C
Method ClassExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&P&C&P&[C]&C
	if '..isStringSingle("##CLASS",7) { quit 0 /* normal */ }
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
		set ok=0
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

	set ok=$s(done:1,1:0)
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
		set ok=0
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
		set ok=0
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  classmethod_function_call ::= 'classmethod' open_bracket classmethod_class ',' classmethod_method [ ',' function_parameter_list_items ] close_bracket object_chain?
/// summary values:CLASSMETHOD
/// summary=K&C&C&P&C&[P&C]&C&?4OptionalSingle4?
Method ClassmethodFunctionCall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C&C&P&C&[P&C]&C&?4OptionalSingle4?
	if '(..isKeyword("CLASSMETHOD")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"CLASSMETHOD")  {
		if ..OpenBracket(.subElement,.addedElement)  {
			if ..ClassmethodClass(.subElement,.addedElement)  {
				if ..addPunctuation(.subElement,",")  {
					if ..ClassmethodMethod(.subElement,.addedElement)  {
						if ..ClassmethodFunctionCall1OptGrp(.subElement,.addedElement)  {
							if ..CloseBracket(.subElement,.addedElement)  {
								if $s(..ObjectChain(.subElement,.addedElement) :1,1:1)  {
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary values:,
/// summary=P&C
Method ClassmethodFunctionCall1OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation(",",1) { quit 1 /* not found is OK */ }
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
		set ok=0
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  close_command ::= ('close' | 'c') post_conditional? ','.close_item+
/// summary values:CLOSE,C
/// summary=(K|K)&?4OptionalSingle4?&.C.
Method CloseCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&?4OptionalSingle4?&.C.
	if '(..isKeywordInList($lb("CLOSE","C"))) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CloseCommand1Sub(.subElement,.addedElement)  {
		if $s(..PostConditional(.subElement,.addedElement) :1,1:1)  {
			if ..CloseCommand2RepSep(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 'close' | 'c'
/// summary=K|K
Method CloseCommand1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"CLOSE")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"C")  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

///  ','.close_item+
Method CloseCommand2RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4String:4?
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set done=0 ; must be at least 1
	if ..CloseItem(.subElement,.addedElement) {
		set done=1,ok=1 ; found 1
		do {
			$$$BNFSTART(repElement)
			set ok=(..addPunctuation(.repElement,",")  && ..CloseItem(.repElement,.addedElement) )
			if ok {
				$$$BNFCOMMITCOPY(repElement,subElement)
			} else {
				$$$BNFROLLBACK(repElement)
			}
		} while ok
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  close_device_parameter ::= expression
/// summary=C
Method CloseDeviceParameter(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  close_device_parameter_list ::= ( '(' ':'.close_device_parameter+ ')' ) | close_device_parameter
/// summary=(P&.C.&P)|C
Method CloseDeviceParameterList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (P&.C.&P)|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CloseDeviceParameterList1Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CloseDeviceParameter(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  '(' ':'.close_device_parameter+ ')'
/// summary=P&.C.&P
Method CloseDeviceParameterList1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if ..CloseDeviceParameterList2RepSep(.subElement,.addedElement)  {
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
		set ok=0
	}
	quit ok
}

///  ':'.close_device_parameter+
Method CloseDeviceParameterList2RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4String:4?
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set done=0 ; must be at least 1
	if ..CloseDeviceParameter(.subElement,.addedElement) {
		set done=1,ok=1 ; found 1
		do {
			$$$BNFSTART(repElement)
			set ok=(..addPunctuation(.repElement,":")  && ..CloseDeviceParameter(.repElement,.addedElement) )
			if ok {
				$$$BNFCOMMITCOPY(repElement,subElement)
			} else {
				$$$BNFROLLBACK(repElement)
			}
		} while ok
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	quit ok
}

///  close_item ::= close_device [ ':' close_device_parameter_list ]
/// summary=C&[P&C]
Method CloseItem(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&[P&C]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CloseDevice(.subElement,.addedElement)  {
		if ..CloseItem1OptGrp(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary values::
/// summary=P&C
Method CloseItem1OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation(":",1) { quit 1 /* not found is OK */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,":")  {
		if ..CloseDeviceParameterList(.subElement,.addedElement)  {
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

///  close_sq_op ::= ']'
/// summary values:]
/// summary=P
Method CloseSqOp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("]",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"]")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  command_list_eol ::= cos_command_or_macro+
/// summary=(C)+
Method CommandListEol(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (C)+
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CommandListEol1RepOne(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  cos_command_or_macro+
Method CommandListEol1RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..CosCommandOrMacro(.subElement,.addedElement)  {
		set done=1
	}
	set ok=$s(done:1,1:0)
	quit ok
}

///  command_list_eol_continue ::= cos_command+
/// summary=(C)+
Method CommandListEolContinue(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (C)+
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CommandListEolContinue1RepOne(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  cos_command+
Method CommandListEolContinue1RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..CosCommand(.subElement,.addedElement)  {
		set done=1
	}
	set ok=$s(done:1,1:0)
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  continue_command ::= 'continue' post_conditional?
/// summary values:CONTINUE
/// summary=K&?4OptionalSingle4?
Method ContinueCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?4OptionalSingle4?
	if '(..isKeyword("CONTINUE")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"CONTINUE")  {
		if $s(..PostConditional(.subElement,.addedElement) :1,1:1)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  cos_code_block ::= cos_statement*
/// summary=(C)*
Method CosCodeBlock(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (C)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CosCodeBlock1RepZero(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  cos_statement*
Method CosCodeBlock1RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C
	set subElement=ParentElement
	; method start
	while ..CosStatement(.subElement,.addedElement)  {
		;
	}
	set ok=1
	quit ok
}

///  cos_code_block_curly ::= '{' cos_statement* '}'
/// summary values:{
Method CosCodeBlockCurly(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&(C)*&P
	if '..isPunctuation("{",1) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	If ..addPunctuation(subElement,"{") {
		While '..isPunctuation("}", 1),..CosStatement(.subElement,.addedElement) { }
		If ..addPunctuation(subElement,"}") {
			Set done=1
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  cos_code_block_sql ::= cos_statement_sql+
/// summary=(C)+
Method CosCodeBlockSql(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (C)+
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CosCodeBlockSql1RepOne(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  cos_statement_sql+
Method CosCodeBlockSql1RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..CosStatementSql(.subElement,.addedElement)  {
		set done=1
	}
	set ok=$s(done:1,1:0)
	quit ok
}

///  cos_code_block_sql_storage ::= cos_statement_sql+
/// summary=(C)+
Method CosCodeBlockSqlStorage(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (C)+
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CosCodeBlockSqlStorage1RepOne(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  cos_statement_sql+
Method CosCodeBlockSqlStorage1RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..CosStatementSql(.subElement,.addedElement)  {
		set done=1
	}
	set ok=$s(done:1,1:0)
	quit ok
}

///  cos_code_block_trigger ::= cos_statement+
/// summary=(C)+
Method CosCodeBlockTrigger(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (C)+
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CosCodeBlockTrigger1RepOne(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  cos_statement+
Method CosCodeBlockTrigger1RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..CosStatement(.subElement,.addedElement)  {
		set done=1
	}
	set ok=$s(done:1,1:0)
	quit ok
}

///  cos_command ::= set_command | if_command | quit_command | do_command | for_command | kill_command | break_command | continue_command | goto_command | else_command | hang_command | halt_command | job_command | sql_command | js_command | lock_command | merge_command | new_command | open_command | close_command | return_command | read_command | tcommit_command | throw_command | trollback_command | try_command | tstart_command | use_command | view_command | while_command | write_command | xecute_command | cos_directive | zbreak_command | zinsert_command | zkill_command | zload_command | znspace_command | zprint_command | zquit_command | zremove_command | zsave_command | zsync_command | ztrap_command | zwrite_command | zzdump_command | zzwrite_command | html_command | print_command | mpv_command | ZZ_COMMAND
/// summary=C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C
Method CosCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C
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
	} elseif ..ZbreakCommand(.subElement,.addedElement)  {
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  cos_command_or_macro ::= macrocall | cos_command
/// summary=C|C
Method CosCommandOrMacro(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Macrocall(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CosCommand(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  cos_directive ::= '#' ( cos_directive_define | cos_directive_dim | cos_directive_ifdef | cos_directive_ifndef | cos_directive_if | cos_directive_else | cos_directive_elseif | cos_directive_endif | cos_directive_defonearg | cos_directive_include | cos_directive_undef | cos_directive_execute | cos_directive_sqlcompile | cos_directive_classcontext | cos_directive_generator | cos_directive_classmethod | cos_directive_import )
/// summary values:#
/// summary=P&(C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C)
Method CosDirective(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&(C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C)
	if '..isPunctuation("#",1) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"#")  {
		if ..CosDirective1Sub(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  cos_directive_define | cos_directive_dim | cos_directive_ifdef | cos_directive_ifndef | cos_directive_if | cos_directive_else | cos_directive_elseif | cos_directive_endif | cos_directive_defonearg | cos_directive_include | cos_directive_undef | cos_directive_execute | cos_directive_sqlcompile | cos_directive_classcontext | cos_directive_generator | cos_directive_classmethod | cos_directive_import
/// summary=C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C
Method CosDirective1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C
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
		set done=1 ; or
	} elseif ..CosDirectiveImport(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

///  cos_directive_classcontext ::= 'classcontext' class_reference
/// summary values:CLASSCONTEXT
/// summary=K&C
Method CosDirectiveClasscontext(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C
	if '(..isKeyword("CLASSCONTEXT")) { quit 0 /* normal */ }
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
		set ok=0
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
	if '(..isKeyword("CLASSMETHOD")) { quit 0 /* normal */ }
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
		set ok=0
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
	if '(..isKeyword("DEFINE")) { quit 0 /* normal */ }
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
		set ok=0
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
		set ok=0
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
	if ..CosDirectiveDefineSubst1OptGrp(.subElement,.addedElement)  {
		if ..TextToEolContinue(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=C|C
Method CosDirectiveDefineSubst1OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	; method start
	if ..CommandListEolContinue(.subElement,.addedElement)  {
		; or
	} elseif ..ExpressionList(.subElement,.addedElement)  {
		; end compileRules
	}

	set ok=1
	quit ok
}

///  cos_directive_defonearg ::= 'def1arg' cos_directive_define_name [ array_parameter_list ] [cos_directive_define_subst]
/// summary values:DEF1ARG
/// summary=K&C&[C]&[C]
Method CosDirectiveDefonearg(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C&[C]&[C]
	if '(..isKeyword("DEF1ARG")) { quit 0 /* normal */ }
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  cos_directive_dim ::= 'dim' ','.cos_directive_dim_item+
/// summary values:DIM
/// summary=K&.C.
Method CosDirectiveDim(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&.C.
	if '(..isKeyword("DIM")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"DIM")  {
		if ..CosDirectiveDim1RepSep(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ','.cos_directive_dim_item+
Method CosDirectiveDim1RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4String:4?
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set done=0 ; must be at least 1
	if ..CosDirectiveDimItem(.subElement,.addedElement) {
		set done=1,ok=1 ; found 1
		do {
			$$$BNFSTART(repElement)
			set ok=(..addPunctuation(.repElement,",")  && ..CosDirectiveDimItem(.repElement,.addedElement) )
			if ok {
				$$$BNFCOMMITCOPY(repElement,subElement)
			} else {
				$$$BNFROLLBACK(repElement)
			}
		} while ok
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	quit ok
}

///  cos_directive_dim_item ::= cos_directive_dim_item_set | cos_directive_dim_item_noset
/// summary=C|C
Method CosDirectiveDimItem(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CosDirectiveDimItemSet(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CosDirectiveDimItemNoset(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  cos_directive_dim_item_noset ::= ','.variable_nodef+ [ 'as' [('array' | 'list') 'of'] class_reference ]
/// summary=.C.&[K&[(K|K)&K]&C]
Method CosDirectiveDimItemNoset(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary .C.&[K&[(K|K)&K]&C]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CosDirectiveDimItemNoset1RepSep(.subElement,.addedElement)  {
		if ..CosDirectiveDimItemNoset2OptGrp(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ','.variable_nodef+
Method CosDirectiveDimItemNoset1RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4String:4?
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set done=0 ; must be at least 1
	if ..VariableNodef(.subElement,.addedElement) {
		set done=1,ok=1 ; found 1
		do {
			$$$BNFSTART(repElement)
			set ok=(..addPunctuation(.repElement,",")  && ..VariableNodef(.repElement,.addedElement) )
			if ok {
				$$$BNFCOMMITCOPY(repElement,subElement)
			} else {
				$$$BNFROLLBACK(repElement)
			}
		} while ok
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	quit ok
}

/// 
/// summary values:AS
/// summary=K&[(K|K)&K]&C
Method CosDirectiveDimItemNoset2OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&[(K|K)&K]&C
	if '(..isKeyword("AS")) { quit 1 /* not found is OK */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"AS")  {
		if ..CosDirectiveDimItemNoset3OptGrp(.subElement,.addedElement)  {
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
Method CosDirectiveDimItemNoset3OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary (K|K)&K
	if '(..isKeywordInList($lb("ARRAY","LIST"))) { quit 1 /* not found is OK */ /*1*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CosDirectiveDimItemNoset4Sub(.subElement,.addedElement)  {
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
Method CosDirectiveDimItemNoset4Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K|K
	if '(..isKeywordInList($lb("ARRAY","LIST"))) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"ARRAY")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"LIST")  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

///  cos_directive_dim_item_set ::= ','.variable_set+ [ 'as' [('array' | 'list') 'of'] class_reference ] '=' dim_expression
/// summary=.C.&[K&[(K|K)&K]&C]&P&C
Method CosDirectiveDimItemSet(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary .C.&[K&[(K|K)&K]&C]&P&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CosDirectiveDimItemSet1RepSep(.subElement,.addedElement)  {
		if ..CosDirectiveDimItemSet2OptGrp(.subElement,.addedElement)  {
			if ..addPunctuation(.subElement,"=")  {
				if ..DimExpression(.subElement,.addedElement)  {
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ','.variable_set+
Method CosDirectiveDimItemSet1RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4String:4?
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set done=0 ; must be at least 1
	if ..VariableSet(.subElement,.addedElement) {
		set done=1,ok=1 ; found 1
		do {
			$$$BNFSTART(repElement)
			set ok=(..addPunctuation(.repElement,",")  && ..VariableSet(.repElement,.addedElement) )
			if ok {
				$$$BNFCOMMITCOPY(repElement,subElement)
			} else {
				$$$BNFROLLBACK(repElement)
			}
		} while ok
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	quit ok
}

/// 
/// summary values:AS
/// summary=K&[(K|K)&K]&C
Method CosDirectiveDimItemSet2OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&[(K|K)&K]&C
	if '(..isKeyword("AS")) { quit 1 /* not found is OK */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"AS")  {
		if ..CosDirectiveDimItemSet3OptGrp(.subElement,.addedElement)  {
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
Method CosDirectiveDimItemSet3OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary (K|K)&K
	if '(..isKeywordInList($lb("ARRAY","LIST"))) { quit 1 /* not found is OK */ /*1*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CosDirectiveDimItemSet4Sub(.subElement,.addedElement)  {
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
Method CosDirectiveDimItemSet4Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K|K
	if '(..isKeywordInList($lb("ARRAY","LIST"))) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"ARRAY")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"LIST")  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

///  cos_directive_else ::= 'else'
/// summary values:ELSE
/// summary=K
Method CosDirectiveElse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeyword("ELSE")) { quit 0 /* normal */ }
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
		set ok=0
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
	if '(..isKeyword("ELSEIF")) { quit 0 /* normal */ }
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
		set ok=0
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
	if '(..isKeyword("ENDIF")) { quit 0 /* normal */ }
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
		set ok=0
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
	if '(..isKeyword("EXECUTE")) { quit 0 /* normal */ }
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
		set ok=0
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
	if '(..isKeyword("GENERATOR")) { quit 0 /* normal */ }
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
		set ok=0
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
	if '(..isKeyword("IF")) { quit 0 /* normal */ }
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
		set ok=0
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
	if '(..isKeyword("IFDEF")) { quit 0 /* normal */ }
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
		set ok=0
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
	if '(..isKeyword("IFNDEF")) { quit 0 /* normal */ }
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  cos_directive_import ::= 'import' identifier
/// summary values:IMPORT
/// summary=K&C
Method CosDirectiveImport(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C
	if '(..isKeyword("IMPORT")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"IMPORT")  {
		if ..Identifier(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
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
	if '(..isKeyword("INCLUDE")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"INCLUDE")  {
		if ..CosDirectiveInclude1Sub(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// cos_directive_include_list | cos_directive_include_name
/// summary=C|C
Method CosDirectiveInclude1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..CosDirectiveIncludeList(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CosDirectiveIncludeName(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

///  cos_directive_include_list ::= '(' ','.cos_directive_include_name+ ')'
/// summary values:(
/// summary=P&.C.&P
Method CosDirectiveIncludeList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&.C.&P
	if '..isPunctuation("(",1) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if ..CosDirectiveIncludeList1RepSep(.subElement,.addedElement)  {
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ','.cos_directive_include_name+
Method CosDirectiveIncludeList1RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4String:4?
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set done=0 ; must be at least 1
	if ..CosDirectiveIncludeName(.subElement,.addedElement) {
		set done=1,ok=1 ; found 1
		do {
			$$$BNFSTART(repElement)
			set ok=(..addPunctuation(.repElement,",")  && ..CosDirectiveIncludeName(.repElement,.addedElement) )
			if ok {
				$$$BNFCOMMITCOPY(repElement,subElement)
			} else {
				$$$BNFROLLBACK(repElement)
			}
		} while ok
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
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
		set ok=0
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
	if '(..isKeyword("SQLCOMPILE")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"SQLCOMPILE")  {
		if ..CosDirectiveSqlcompile1Sub(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ( 'select' '=' ('display' | 'logical' | 'odbc' | 'runtime' | 'text' | 'FDBMS') ) | ( 'mode' '=' ('deferred') )
/// summary=(K&P&(K|K|K|K|K|K))|(K&P&(K))
Method CosDirectiveSqlcompile1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary (K&P&(K|K|K|K|K|K))|(K&P&(K))
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CosDirectiveSqlcompile2Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CosDirectiveSqlcompile4Sub(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	quit ok
}

///  'select' '=' ('display' | 'logical' | 'odbc' | 'runtime' | 'text' | 'FDBMS')
/// summary values:SELECT
/// summary=K&P&(K|K|K|K|K|K)
Method CosDirectiveSqlcompile2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&P&(K|K|K|K|K|K)
	if '(..isKeyword("SELECT")) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"SELECT")  {
		if ..addPunctuation(.subElement,"=")  {
			if ..CosDirectiveSqlcompile3Sub(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	quit ok
}

/// 'display' | 'logical' | 'odbc' | 'runtime' | 'text' | 'FDBMS'
/// summary values:DISPLAY,LOGICAL,ODBC,RUNTIME,TEXT,FDBMS
/// summary=K|K|K|K|K|K
Method CosDirectiveSqlcompile3Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K|K|K|K|K|K
	if '(..isKeywordInList($lb("DISPLAY","LOGICAL","ODBC","RUNTIME","TEXT","FDBMS"))) { quit 0 /* normal */ }
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

	set ok=$s(done:1,1:0)
	quit ok
}

///  'mode' '=' ('deferred')
/// summary values:MODE
/// summary=K&P&(K)
Method CosDirectiveSqlcompile4Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&P&(K)
	if '(..isKeyword("MODE")) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"MODE")  {
		if ..addPunctuation(.subElement,"=")  {
			if ..CosDirectiveSqlcompile5Sub(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	quit ok
}

/// 'deferred'
/// summary values:DEFERRED
/// summary=K
Method CosDirectiveSqlcompile5Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K
	if '(..isKeyword("DEFERRED")) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"DEFERRED")  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

///  cos_directive_undef ::= 'undef' macro_identifier
/// summary values:UNDEF
/// summary=K&C
Method CosDirectiveUndef(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C
	if '(..isKeyword("UNDEF")) { quit 0 /* normal */ }
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
		set ok=0
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  cos_json_array ::= '[' [ ','.cos_json+ ] ']'
/// summary values:[
/// summary=P&[.C.]&P
Method CosJsonArray(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&[.C.]&P
	if '..isPunctuation("[",1) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"[")  {
		if $S(..CosJsonArray1RepSep(.subElement,.addedElement) :1,1:1) {
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ','.cos_json+
Method CosJsonArray1RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4String:4?
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set done=0 ; must be at least 1
	if ..CosJson(.subElement,.addedElement) {
		set done=1,ok=1 ; found 1
		do {
			$$$BNFSTART(repElement)
			set ok=(..addPunctuation(.repElement,",")  && ..CosJson(.repElement,.addedElement) )
			if ok {
				$$$BNFCOMMITCOPY(repElement,subElement)
			} else {
				$$$BNFROLLBACK(repElement)
			}
		} while ok
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	quit ok
}

///  cos_json_object ::= '{' [ ','.cos_json_pair+ ] '}'
/// summary values:{
/// summary=P&[.C.]&P
Method CosJsonObject(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&[.C.]&P
	if '..isPunctuation("{",1) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"{")  {
		if $S(..CosJsonObject1RepSep(.subElement,.addedElement) :1,1:1) {
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ','.cos_json_pair+
Method CosJsonObject1RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4String:4?
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set done=0 ; must be at least 1
	if ..CosJsonPair(.subElement,.addedElement) {
		set done=1,ok=1 ; found 1
		do {
			$$$BNFSTART(repElement)
			set ok=(..addPunctuation(.repElement,",")  && ..CosJsonPair(.repElement,.addedElement) )
			if ok {
				$$$BNFCOMMITCOPY(repElement,subElement)
			} else {
				$$$BNFROLLBACK(repElement)
			}
		} while ok
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
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
		set ok=0
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
	} elseif ..CosJsonPrim1Sub(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  '(' expression ')'
/// summary values:(
/// summary=P&C&P
Method CosJsonPrim1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&P
	if '..isPunctuation("(",1) { quit 0 /* normal */ }
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
		set ok=0
	}
	quit ok
}

///  cos_statement ::= label_definition? ('.')* cos_command_or_macro
/// summary=?4OptionalSingle4?&(?4punctuation:4?)*&C
Method CosStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4OptionalSingle4?&(?4punctuation:4?)*&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $s(..LabelDefinition(.subElement,.addedElement) :1,1:1)  {
		if ..CosStatement1RepZero(.subElement,.addedElement)  {
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ('.')*
Method CosStatement1RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	; method start
	while ..CosStatement2Sub(.subElement,.addedElement)  {
		;
	}
	set ok=1
	quit ok
}

/// '.'
/// summary values:.
/// summary=P
Method CosStatement2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P
	if '(..isStringSingle(".",.value)) { quit 0 /* normal */ /*3 */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addPunctuation(.subElement,".")  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

///  cos_statement_sql ::= ('.')* cos_command_or_macro
/// summary=(?4punctuation:4?)*&C
Method CosStatementSql(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (?4punctuation:4?)*&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CosStatementSql1RepZero(.subElement,.addedElement)  {
		if ..CosCommandOrMacro(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ('.')*
Method CosStatementSql1RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	; method start
	while ..CosStatementSql2Sub(.subElement,.addedElement)  {
		;
	}
	set ok=1
	quit ok
}

/// '.'
/// summary values:.
/// summary=P
Method CosStatementSql2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P
	if '(..isStringSingle(".",.value)) { quit 0 /* normal */ /*3 */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addPunctuation(.subElement,".")  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

///  data_expression ::= this_object | variable_nodef | macrocall | Indirection | global_ref | special_variable | ( '(' expression ')' object_chain? )
/// summary=C|C|C|C|C|C|(P&C&P&?4OptionalSingle4?)
Method DataExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C|C|C|C|C|(P&C&P&?4OptionalSingle4?)
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ThisObject(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..VariableNodef(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Macrocall(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Indirection(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..GlobalRef(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SpecialVariable(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..DataExpression1Sub(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  '(' expression ')' object_chain?
/// summary values:(
/// summary=P&C&P&?4OptionalSingle4?
Method DataExpression1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&P&?4OptionalSingle4?
	if '..isPunctuation("(",1) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if ..Expression(.subElement,.addedElement)  {
			if ..addPunctuation(.subElement,")")  {
				if $s(..ObjectChain(.subElement,.addedElement) :1,1:1)  {
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
		set ok=0
	}
	quit ok
}

///  data_function_call ::= ('data' | 'd') open_bracket data_expression [ ',' variable_set ] close_bracket
/// summary values:DATA,D
/// summary=(K|K)&C&C&[P&C]&C
Method DataFunctionCall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&C&C&[P&C]&C
	if '(..isKeywordInList($lb("DATA","D"))) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..DataFunctionCall1Sub(.subElement,.addedElement)  {
		if ..OpenBracket(.subElement,.addedElement)  {
			if ..DataExpression(.subElement,.addedElement)  {
				if ..DataFunctionCall2OptGrp(.subElement,.addedElement)  {
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 'data' | 'd'
/// summary=K|K
Method DataFunctionCall1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"DATA")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"D")  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

/// 
/// summary values:,
/// summary=P&C
Method DataFunctionCall2OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation(",",1) { quit 1 /* not found is OK */ }
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
		set ok=0
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
	if '(..isKeywordInList($lb("DO","D"))) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..DoCommand1Sub(.subElement,.addedElement)  {
		if ..DoCommand2Sub(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 'do' | 'd'
/// summary=K|K
Method DoCommand1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"DO")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"D")  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

///  do_while | do_label
/// summary=C|C
Method DoCommand2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..DoWhile(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..DoLabel(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

///  do_item ::= object_variable | this_object | ( label_reference [ function_parameter_list ] ) | system_object | macrocall | intrinsicfncall | classexpr | ( '(' expression ')' object_chain? )
/// summary=C|C|(C&[C])|C|C|C|C|(P&C&P&?4OptionalSingle4?)
Method DoItem(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C|(C&[C])|C|C|C|C|(P&C&P&?4OptionalSingle4?)
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ObjectVariable(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ThisObject(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..DoItem1Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SystemObject(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Macrocall(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Intrinsicfncall(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Classexpr(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..DoItem2Sub(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  label_reference [ function_parameter_list ]
/// summary=C&[C]
Method DoItem1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		set ok=0
	}
	quit ok
}

///  '(' expression ')' object_chain?
/// summary values:(
/// summary=P&C&P&?4OptionalSingle4?
Method DoItem2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&P&?4OptionalSingle4?
	if '..isPunctuation("(",1) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if ..Expression(.subElement,.addedElement)  {
			if ..addPunctuation(.subElement,")")  {
				if $s(..ObjectChain(.subElement,.addedElement) :1,1:1)  {
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
		set ok=0
	}
	quit ok
}

///  do_item_list ::= do_item post_conditional? ( ',' do_item post_conditional? )*
/// summary=C&?4OptionalSingle4?&(?4punctuation:4?)*
Method DoItemList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&?4OptionalSingle4?&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..DoItem(.subElement,.addedElement)  {
		if $s(..PostConditional(.subElement,.addedElement) :1,1:1)  {
			if ..DoItemList1RepZero(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ( ',' do_item post_conditional? )*
Method DoItemList1RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	; method start
	while ..DoItemList2Sub(.subElement,.addedElement)  {
		;
	}
	set ok=1
	quit ok
}

///  ',' do_item post_conditional?
/// summary values:,
/// summary=P&C&?4OptionalSingle4?
Method DoItemList2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&?4OptionalSingle4?
	if '..isPunctuation(",",1) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..DoItem(.subElement,.addedElement)  {
			if $s(..PostConditional(.subElement,.addedElement) :1,1:1)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	quit ok
}

///  do_label ::= post_conditional? ( naked | do_item_list )
/// summary=?4OptionalSingle4?&(C|C)
Method DoLabel(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4OptionalSingle4?&(C|C)
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $s(..PostConditional(.subElement,.addedElement) :1,1:1)  {
		if ..DoLabel1Sub(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  naked | do_item_list
/// summary=C|C
Method DoLabel1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..Naked(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..DoItemList(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

///  do_while ::= cos_code_block_curly 'while' expression_list
/// summary=C&K&C
Method DoWhile(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&K&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CosCodeBlockCurly(.subElement,.addedElement)  {
		if ..addKeyword(.subElement,"WHILE")  {
			if ..ExpressionList(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  dyadicop ::= "+" | "-" | "\\" | "/" | "\" | ">=" | ">" | "'>=" | "'>" | "<=" | "<" | "'<=" | "'<" | "=" | "'=" | "**" | "*" | "&&" | "']]" | "]]" | "']" | close_sq_op | "'[" | "[" | "!" | "||" | "_" | hash_op | amp_op
/// summary=P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|C|P|P|P|P|P|C|C
Method Dyadicop(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|C|P|P|P|P|P|C|C
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
	} elseif ..CloseSqOp(.subElement,.addedElement)  {
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  else_block ::= cos_directive? 'else' ( cos_code_block_curly | command_list_eol )
/// summary=?4OptionalSingle4?&K&(C|C)
Method ElseBlock(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4OptionalSingle4?&K&(C|C)
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $s(..CosDirective(.subElement,.addedElement) :1,1:1)  {
		if ..addKeyword(.subElement,"ELSE")  {
			if ..ElseBlock1Sub(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  cos_code_block_curly | command_list_eol
/// summary=C|C
Method ElseBlock1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..CosCodeBlockCurly(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CommandListEol(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

///  else_command ::= ('else' | 'e') naked
/// summary values:ELSE,E
/// summary=(K|K)&C
Method ElseCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&C
	if '(..isKeywordInList($lb("ELSE","E"))) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ElseCommand1Sub(.subElement,.addedElement)  {
		if ..Naked(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 'else' | 'e'
/// summary=K|K
Method ElseCommand1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"ELSE")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"E")  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

///  elseif_block ::= cos_directive? 'elseif' expression_list ( cos_code_block_curly | command_list_eol )
/// summary=?4OptionalSingle4?&K&C&(C|C)
Method ElseifBlock(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4OptionalSingle4?&K&C&(C|C)
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $s(..CosDirective(.subElement,.addedElement) :1,1:1)  {
		if ..addKeyword(.subElement,"ELSEIF")  {
			if ..ExpressionList(.subElement,.addedElement)  {
				if ..ElseifBlock1Sub(.subElement,.addedElement)  {
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  cos_code_block_curly | command_list_eol
/// summary=C|C
Method ElseifBlock1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..CosCodeBlockCurly(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CommandListEol(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

///  elseif_block_list ::= elseif_block+
/// summary=(C)+
Method ElseifBlockList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (C)+
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ElseifBlockList1RepOne(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  elseif_block+
Method ElseifBlockList1RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..ElseifBlock(.subElement,.addedElement)  {
		set done=1
	}
	set ok=$s(done:1,1:0)
	quit ok
}

///  empty_parameter ::= 'SPECIAL'
/// summary values:SPECIAL
/// summary=K
Method EmptyParameter(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeyword("SPECIAL")) { quit 0 /* normal */ }
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
		set ok=0
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
		if ..Expression1RepZero(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ( pattern_match | (dyadicop factor ))*
Method Expression1RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	; method start
	while ..Expression2Sub(.subElement,.addedElement)  {
		;
	}
	set ok=1
	quit ok
}

///  pattern_match | (dyadicop factor )
/// summary=C|(C&C)
Method Expression2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|(C&C)
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..PatternMatch(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Expression3Sub(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	quit ok
}

/// dyadicop factor
/// summary=C&C
Method Expression3Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		set ok=0
	}
	quit ok
}

///  expression_function_call ::= '##expression' function_parameter_list
/// summary values:##EXPRESSION
/// summary=P&C
Method ExpressionFunctionCall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C
	if '..isStringSingle("##EXPRESSION",12) { quit 0 /* normal */ }
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  expression_list ::= ','.expression+
/// summary=.C.
Method ExpressionList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary .C.
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ExpressionList1RepSep(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ','.expression+
Method ExpressionList1RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4String:4?
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set done=0 ; must be at least 1
	if ..Expression(.subElement,.addedElement) {
		set done=1,ok=1 ; found 1
		do {
			$$$BNFSTART(repElement)
			set ok=(..addPunctuation(.repElement,",")  && ..Expression(.repElement,.addedElement) )
			if ok {
				$$$BNFCOMMITCOPY(repElement,subElement)
			} else {
				$$$BNFROLLBACK(repElement)
			}
		} while ok
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	quit ok
}

///  extract_function_call ::= ('extract' | 'e') open_bracket expression [ ',' star_parameter [ ',' star_parameter ] ] close_bracket
/// summary values:EXTRACT,E
/// summary=(K|K)&C&C&[P&C&[P&C]]&C
Method ExtractFunctionCall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&C&C&[P&C&[P&C]]&C
	if '(..isKeywordInList($lb("EXTRACT","E"))) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ExtractFunctionCall1Sub(.subElement,.addedElement)  {
		if ..OpenBracket(.subElement,.addedElement)  {
			if ..Expression(.subElement,.addedElement)  {
				if ..ExtractFunctionCall2OptGrp(.subElement,.addedElement)  {
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 'extract' | 'e'
/// summary=K|K
Method ExtractFunctionCall1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"EXTRACT")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"E")  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

/// 
/// summary values:,
/// summary=P&C&[P&C]
Method ExtractFunctionCall2OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&[P&C]
	if '..isPunctuation(",",1) { quit 1 /* not found is OK */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..StarParameter(.subElement,.addedElement)  {
			if ..ExtractFunctionCall3OptGrp(.subElement,.addedElement)  {
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
Method ExtractFunctionCall3OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation(",",1) { quit 1 /* not found is OK */ }
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
	if '(..isKeywordInList($lb("EXTRACT","E"))) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ExtractFunctionCallSet1Sub(.subElement,.addedElement)  {
		if ..OpenBracket(.subElement,.addedElement)  {
			if ..SetValueExpression(.subElement,.addedElement)  {
				if ..ExtractFunctionCallSet2OptGrp(.subElement,.addedElement)  {
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 'extract' | 'e'
/// summary=K|K
Method ExtractFunctionCallSet1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"EXTRACT")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"E")  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

/// 
/// summary values:,
/// summary=P&C&[P&C]
Method ExtractFunctionCallSet2OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&[P&C]
	if '..isPunctuation(",",1) { quit 1 /* not found is OK */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..StarParameter(.subElement,.addedElement)  {
			if ..ExtractFunctionCallSet3OptGrp(.subElement,.addedElement)  {
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
Method ExtractFunctionCallSet3OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation(",",1) { quit 1 /* not found is OK */ }
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

///  extrinsicfncall ::= '$$' label_reference extrinsicfncall_parameter_list?
/// summary values:$$
/// summary=P&C&?4OptionalSingle4?
Method Extrinsicfncall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&?4OptionalSingle4?
	if '..isPunctuation("$$",2) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"$$")  {
		if ..LabelReference(.subElement,.addedElement)  {
			if $s(..ExtrinsicfncallParameterList(.subElement,.addedElement) :1,1:1)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  extrinsicfncall_parameter ::= ('.' ( this_object_direct_property | simple_indirection | byref_variable ) ) | expression
/// summary=(P&(C|C|C))|C
Method ExtrinsicfncallParameter(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (P&(C|C|C))|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ExtrinsicfncallParameter1Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Expression(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// '.' ( this_object_direct_property | simple_indirection | byref_variable )
/// summary=P&(C|C|C)
Method ExtrinsicfncallParameter1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,".")  {
		if ..ExtrinsicfncallParameter2Sub(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	quit ok
}

///  this_object_direct_property | simple_indirection | byref_variable
/// summary=C|C|C
Method ExtrinsicfncallParameter2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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

	set ok=$s(done:1,1:0)
	quit ok
}

///  extrinsicfncall_parameter_list ::= open_bracket [ ','.extrinsicfncall_parameter?+ ] ['...'] close_bracket
/// summary=C&[.?4OptionalableRule4?.]&[P]&C
Method ExtrinsicfncallParameterList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&[.?4OptionalableRule4?.]&[P]&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OpenBracket(.subElement,.addedElement)  {
		if $S(..ExtrinsicfncallParameterList1RepSep(.subElement,.addedElement) :1,1:1) {
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ','.extrinsicfncall_parameter?+
Method ExtrinsicfncallParameterList1RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4String:4?
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set done=0 ; must be at least 1
	if $s(..ExtrinsicfncallParameter(.subElement,.addedElement) :1,1:1) {
		set done=1,ok=1 ; found 1
		do {
			$$$BNFSTART(repElement)
			set ok=(..addPunctuation(.repElement,",")  && $s(..ExtrinsicfncallParameter(.repElement,.addedElement) :1,1:1) )
			if ok {
				$$$BNFCOMMITCOPY(repElement,subElement)
			} else {
				$$$BNFROLLBACK(repElement)
			}
		} while ok
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	quit ok
}

///  factor ::= monadicop* primary
/// summary=(C)*&C
Method Factor(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (C)*&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Factor1RepZero(.subElement,.addedElement)  {
		if ..Primary(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  monadicop*
Method Factor1RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C
	set subElement=ParentElement
	; method start
	while ..Monadicop(.subElement,.addedElement)  {
		;
	}
	set ok=1
	quit ok
}

///  for_command ::= ('for' | 'f') for_parameter_list? for_loop_statement
/// summary values:FOR,F
/// summary=(K|K)&?4OptionalSingle4?&C
Method ForCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&?4OptionalSingle4?&C
	if '(..isKeywordInList($lb("FOR","F"))) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ForCommand1Sub(.subElement,.addedElement)  {
		if $s(..ForParameterList(.subElement,.addedElement) :1,1:1)  {
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 'for' | 'f'
/// summary=K|K
Method ForCommand1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"FOR")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"F")  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
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
		set ok=0
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
		set ok=0
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
		if ..ForLoopSpecifier1OptGrp(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary values::
/// summary=P&C&[P&C]
Method ForLoopSpecifier1OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&[P&C]
	if '..isPunctuation(":",1) { quit 1 /* not found is OK */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,":")  {
		if ..ForIncrementValue(.subElement,.addedElement)  {
			if ..ForLoopSpecifier2OptGrp(.subElement,.addedElement)  {
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
Method ForLoopSpecifier2OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation(":",1) { quit 1 /* not found is OK */ }
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

///  for_loop_specifier_list ::= ','.for_loop_specifier+
/// summary=.C.
Method ForLoopSpecifierList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary .C.
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ForLoopSpecifierList1RepSep(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ','.for_loop_specifier+
Method ForLoopSpecifierList1RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4String:4?
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set done=0 ; must be at least 1
	if ..ForLoopSpecifier(.subElement,.addedElement) {
		set done=1,ok=1 ; found 1
		do {
			$$$BNFSTART(repElement)
			set ok=(..addPunctuation(.repElement,",")  && ..ForLoopSpecifier(.repElement,.addedElement) )
			if ok {
				$$$BNFCOMMITCOPY(repElement,subElement)
			} else {
				$$$BNFROLLBACK(repElement)
			}
		} while ok
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	quit ok
}

///  for_loop_statement ::= ( '{' cos_command_or_macro? cos_code_block '}' ) | (naked | command_list_eol )
/// summary=(P&?4OptionalSingle4?&C&P)|(C|C)
Method ForLoopStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (P&?4OptionalSingle4?&C&P)|(C|C)
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ForLoopStatement1Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ForLoopStatement2Sub(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  '{' cos_command_or_macro? cos_code_block '}'
/// summary=P&?4OptionalSingle4?&C&P
Method ForLoopStatement1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"{")  {
		if $s(..CosCommandOrMacro(.subElement,.addedElement) :1,1:1)  {
			if ..CosCodeBlock(.subElement,.addedElement)  {
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
		set ok=0
	}
	quit ok
}

/// naked | command_list_eol
/// summary=C|C
Method ForLoopStatement2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..Naked(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CommandListEol(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  for_parameter_list ::= ','.for_parameter+
/// summary=.C.
Method ForParameterList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary .C.
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ForParameterList1RepSep(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ','.for_parameter+
Method ForParameterList1RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4String:4?
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set done=0 ; must be at least 1
	if ..ForParameter(.subElement,.addedElement) {
		set done=1,ok=1 ; found 1
		do {
			$$$BNFSTART(repElement)
			set ok=(..addPunctuation(.repElement,",")  && ..ForParameter(.repElement,.addedElement) )
			if ok {
				$$$BNFCOMMITCOPY(repElement,subElement)
			} else {
				$$$BNFROLLBACK(repElement)
			}
		} while ok
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
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
		set ok=0
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
	if ..FunctionParameter1Sub(.subElement,.addedElement)  {
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  '.' ( this_object_direct_property | simple_indirection | byref_variable )
/// summary=P&(C|C|C)
Method FunctionParameter1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,".")  {
		if ..FunctionParameter2Sub(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	quit ok
}

///  this_object_direct_property | simple_indirection | byref_variable
/// summary=C|C|C
Method FunctionParameter2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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

	set ok=$s(done:1,1:0)
	quit ok
}

///  function_parameter_list ::= open_bracket [ ','.function_parameter?+ ] ['...'] close_bracket
/// summary=C&[.?4OptionalableRule4?.]&[P]&C
Method FunctionParameterList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&[.?4OptionalableRule4?.]&[P]&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OpenBracket(.subElement,.addedElement)  {
		if $S(..FunctionParameterList1RepSep(.subElement,.addedElement) :1,1:1) {
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ','.function_parameter?+
Method FunctionParameterList1RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4String:4?
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set done=0 ; must be at least 1
	if $s(..FunctionParameter(.subElement,.addedElement) :1,1:1) {
		set done=1,ok=1 ; found 1
		do {
			$$$BNFSTART(repElement)
			set ok=(..addPunctuation(.repElement,",")  && $s(..FunctionParameter(.repElement,.addedElement) :1,1:1) )
			if ok {
				$$$BNFCOMMITCOPY(repElement,subElement)
			} else {
				$$$BNFROLLBACK(repElement)
			}
		} while ok
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	quit ok
}

///  function_parameter_list_items ::= [ ','.function_parameter?+ ] ['...']
/// summary=[.?4OptionalableRule4?.]&[P]
Method FunctionParameterListItems(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary [.?4OptionalableRule4?.]&[P]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..FunctionParameterListItems1RepSep(.subElement,.addedElement) :1,1:1) {
		if $S(..addPunctuation(.subElement,"...") :1,1:1) {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ','.function_parameter?+
Method FunctionParameterListItems1RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4String:4?
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set done=0 ; must be at least 1
	if $s(..FunctionParameter(.subElement,.addedElement) :1,1:1) {
		set done=1,ok=1 ; found 1
		do {
			$$$BNFSTART(repElement)
			set ok=(..addPunctuation(.repElement,",")  && $s(..FunctionParameter(.repElement,.addedElement) :1,1:1) )
			if ok {
				$$$BNFCOMMITCOPY(repElement,subElement)
			} else {
				$$$BNFROLLBACK(repElement)
			}
		} while ok
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	quit ok
}

///  general_intrinsic ::= any_keyword function_parameter_list object_chain?
/// summary=C&C&?4OptionalSingle4?
Method GeneralIntrinsic(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&C&?4OptionalSingle4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..AnyKeyword(.subElement,.addedElement)  {
		if ..FunctionParameterList(.subElement,.addedElement)  {
			if $s(..ObjectChain(.subElement,.addedElement) :1,1:1)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  general_intrinsic_set ::= any_keyword function_parameter_list object_chain?
/// summary=C&C&?4OptionalSingle4?
Method GeneralIntrinsicSet(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&C&?4OptionalSingle4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..AnyKeyword(.subElement,.addedElement)  {
		if ..FunctionParameterList(.subElement,.addedElement)  {
			if $s(..ObjectChain(.subElement,.addedElement) :1,1:1)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  get_expression ::= expression
/// summary=C
Method GetExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  get_function_call ::= ('get' | 'g') open_bracket get_expression [ ',' expression ] close_bracket
/// summary values:GET,G
/// summary=(K|K)&C&C&[P&C]&C
Method GetFunctionCall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&C&C&[P&C]&C
	if '(..isKeywordInList($lb("GET","G"))) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..GetFunctionCall1Sub(.subElement,.addedElement)  {
		if ..OpenBracket(.subElement,.addedElement)  {
			if ..GetExpression(.subElement,.addedElement)  {
				if ..GetFunctionCall2OptGrp(.subElement,.addedElement)  {
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 'get' | 'g'
/// summary=K|K
Method GetFunctionCall1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"GET")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"G")  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

/// 
/// summary values:,
/// summary=P&C
Method GetFunctionCall2OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation(",",1) { quit 1 /* not found is OK */ }
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

	set ok=$s(done:1,1:0)
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
		set ok=0
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
		set ok=0
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
	if '..isPunctuation("|",1) { quit 0 /* normal */ }
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
		set ok=0
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
	if '..isPunctuation("[",1) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"[")  {
		if ..Primary(.subElement,.addedElement)  {
			if ..GlobalRefEnvTwo1OptGrp(.subElement,.addedElement)  {
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary values:,
/// summary=P&C
Method GlobalRefEnvTwo1OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation(",",1) { quit 1 /* not found is OK */ }
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
	if '..isPunctuation("^",1) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"^")  {
		if ..GlobalRefFull1OptGrp(.subElement,.addedElement)  {
			if ..GlobalRefFull2Sub(.subElement,.addedElement)  {
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=C|C
Method GlobalRefFull1OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	; method start
	if ..GlobalRefEnv(.subElement,.addedElement)  {
		; or
	} elseif ..GlobalRefEnvTwo(.subElement,.addedElement)  {
		; end compileRules
	}

	set ok=1
	quit ok
}

/// macrocall | global_name
/// summary=C|C
Method GlobalRefFull2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..Macrocall(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..GlobalName(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

///  global_ref_macro ::= '^' macrocall [subscript_parameter_list]
/// summary values:^
/// summary=P&C&[C]
Method GlobalRefMacro(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&[C]
	if '..isPunctuation("^",1) { quit 0 /* normal */ }
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
		set ok=0
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
	if '..isPunctuation("^",1) { quit 0 /* normal */ }
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
		set ok=0
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
		set ok=0
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
	if '..isPunctuation("^$",2) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"^$")  {
		if ..GlobalRefSpecial1OptGrp(.subElement,.addedElement)  {
			if ..GlobalRefSpecial2Sub(.subElement,.addedElement)  {
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=C|C
Method GlobalRefSpecial1OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	; method start
	if ..GlobalRefEnv(.subElement,.addedElement)  {
		; or
	} elseif ..GlobalRefEnvTwo(.subElement,.addedElement)  {
		; end compileRules
	}

	set ok=1
	quit ok
}

/// macrocall | global_name
/// summary=C|C
Method GlobalRefSpecial2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..Macrocall(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..GlobalName(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
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
		set ok=0
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
		set ok=0
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
	if '..isPunctuation(",",1) { quit 0 /* normal */ }
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  goto_case_clause_list ::= (( ',' goto_case_clause ))*
/// summary=(?4punctuation:4?)*
Method GotoCaseClauseList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..GotoCaseClauseList1RepZero(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  (( ',' goto_case_clause ))*
Method GotoCaseClauseList1RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	; method start
	while ..GotoCaseClauseList2Sub(.subElement,.addedElement)  {
		;
	}
	set ok=1
	quit ok
}

/// ( ',' goto_case_clause )
/// summary=(P&C)
Method GotoCaseClauseList2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary (P&C)
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..GotoCaseClauseList3Sub(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	quit ok
}

///  ',' goto_case_clause
/// summary values:,
/// summary=P&C
Method GotoCaseClauseList3Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation(",",1) { quit 0 /* normal */ }
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
		set ok=0
	}
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  goto_case_function_call ::= '$case' open_bracket expression goto_case_clause_list? goto_case_clause_default? close_bracket
/// summary values:$CASE
/// summary=P&C&C&?4OptionalSingle4?&?4OptionalSingle4?&C
Method GotoCaseFunctionCall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&C&?4OptionalSingle4?&?4OptionalSingle4?&C
	if '..isStringSingle("$CASE",5) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"$case")  {
		if ..OpenBracket(.subElement,.addedElement)  {
			if ..Expression(.subElement,.addedElement)  {
				if $s(..GotoCaseClauseList(.subElement,.addedElement) :1,1:1)  {
					if $s(..GotoCaseClauseDefault(.subElement,.addedElement) :1,1:1)  {
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  goto_command ::= ('goto' | 'g') post_conditional? goto_dest_list
/// summary values:GOTO,G
/// summary=(K|K)&?4OptionalSingle4?&C
Method GotoCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&?4OptionalSingle4?&C
	if '(..isKeywordInList($lb("GOTO","G"))) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..GotoCommand1Sub(.subElement,.addedElement)  {
		if $s(..PostConditional(.subElement,.addedElement) :1,1:1)  {
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 'goto' | 'g'
/// summary=K|K
Method GotoCommand1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"GOTO")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"G")  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

///  goto_dest ::= goto_case_function_call | ( label_reference post_conditional? )
/// summary=C|(C&?4OptionalSingle4?)
Method GotoDest(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|(C&?4OptionalSingle4?)
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..GotoCaseFunctionCall(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..GotoDest1Sub(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  label_reference post_conditional?
/// summary=C&?4OptionalSingle4?
Method GotoDest1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&?4OptionalSingle4?
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LabelReference(.subElement,.addedElement)  {
		if $s(..PostConditional(.subElement,.addedElement) :1,1:1)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	quit ok
}

///  goto_dest_list ::= ','.goto_dest+
/// summary=.C.
Method GotoDestList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary .C.
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..GotoDestList1RepSep(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ','.goto_dest+
Method GotoDestList1RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4String:4?
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set done=0 ; must be at least 1
	if ..GotoDest(.subElement,.addedElement) {
		set done=1,ok=1 ; found 1
		do {
			$$$BNFSTART(repElement)
			set ok=(..addPunctuation(.repElement,",")  && ..GotoDest(.repElement,.addedElement) )
			if ok {
				$$$BNFCOMMITCOPY(repElement,subElement)
			} else {
				$$$BNFROLLBACK(repElement)
			}
		} while ok
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	quit ok
}

///  halt_command ::= ('halt' | 'h') post_conditional? naked
/// summary values:HALT,H
/// summary=(K|K)&?4OptionalSingle4?&C
Method HaltCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&?4OptionalSingle4?&C
	if '(..isKeywordInList($lb("HALT","H"))) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..HaltCommand1Sub(.subElement,.addedElement)  {
		if $s(..PostConditional(.subElement,.addedElement) :1,1:1)  {
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 'halt' | 'h'
/// summary=K|K
Method HaltCommand1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"HALT")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"H")  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

///  hang_command ::= ('hang' | 'h') post_conditional? hang_value_list
/// summary values:HANG,H
/// summary=(K|K)&?4OptionalSingle4?&C
Method HangCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&?4OptionalSingle4?&C
	if '(..isKeywordInList($lb("HANG","H"))) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..HangCommand1Sub(.subElement,.addedElement)  {
		if $s(..PostConditional(.subElement,.addedElement) :1,1:1)  {
			if ..HangValueList(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 'hang' | 'h'
/// summary=K|K
Method HangCommand1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"HANG")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"H")  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  hang_value_list ::= ','.hang_value+
/// summary=.C.
Method HangValueList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary .C.
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..HangValueList1RepSep(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ','.hang_value+
Method HangValueList1RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4String:4?
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set done=0 ; must be at least 1
	if ..HangValue(.subElement,.addedElement) {
		set done=1,ok=1 ; found 1
		do {
			$$$BNFSTART(repElement)
			set ok=(..addPunctuation(.repElement,",")  && ..HangValue(.repElement,.addedElement) )
			if ok {
				$$$BNFCOMMITCOPY(repElement,subElement)
			} else {
				$$$BNFROLLBACK(repElement)
			}
		} while ok
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
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
		set ok=0
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
		set ok=0
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
	if '..isStringSingle("&HTML<",6) { quit 0 /* normal */ }
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
		set ok=0
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

	set ok=$s(done:1,1:0)
	$$$DEBUGMethodEnd
	quit ok
}

///  if_command ::= ('if' | 'i') ( naked | expression_list) ( naked | [then_block] ) elseif_block_list? else_block?
/// summary values:IF,I
/// summary=(K|K)&(C|C)&(C|[C])&?4OptionalSingle4?&?4OptionalSingle4?
Method IfCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&(C|C)&(C|[C])&?4OptionalSingle4?&?4OptionalSingle4?
	if '(..isKeywordInList($lb("IF","I"))) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..IfCommand1Sub(.subElement,.addedElement)  {
		if ..IfCommand2Sub(.subElement,.addedElement)  {
			if ..IfCommand3Sub(.subElement,.addedElement)  {
				if $s(..ElseifBlockList(.subElement,.addedElement) :1,1:1)  {
					if $s(..ElseBlock(.subElement,.addedElement) :1,1:1)  {
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 'if' | 'i'
/// summary=K|K
Method IfCommand1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"IF")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"I")  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

///  naked | expression_list
/// summary=C|C
Method IfCommand2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..Naked(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ExpressionList(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

///  naked | [then_block]
/// summary=C|[C]
Method IfCommand3Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		set ok=0
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

	set ok=$s(done:1,1:0)
	$$$DEBUGMethodEnd
	quit ok
}

///  increment_function_call ::= ('increment' | 'i') '(' (variable_set | global_ref_set) [',' expression ] ')'
/// summary values:INCREMENT,I
/// summary=(K|K)&P&(C|C)&[P&C]&P
Method IncrementFunctionCall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&P&(C|C)&[P&C]&P
	if '(..isKeywordInList($lb("INCREMENT","I"))) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..IncrementFunctionCall1Sub(.subElement,.addedElement)  {
		if ..addPunctuation(.subElement,"(")  {
			if ..IncrementFunctionCall2Sub(.subElement,.addedElement)  {
				if ..IncrementFunctionCall3OptGrp(.subElement,.addedElement)  {
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 'increment' | 'i'
/// summary=K|K
Method IncrementFunctionCall1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"INCREMENT")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"I")  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

/// variable_set | global_ref_set
/// summary=C|C
Method IncrementFunctionCall2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..VariableSet(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..GlobalRefSet(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

/// 
/// summary values:,
/// summary=P&C
Method IncrementFunctionCall3OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation(",",1) { quit 1 /* not found is OK */ }
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
		set ok=0
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
	if '..isPunctuation("$",1) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"$")  {
		if ..Intrinsicfncall1Sub(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// special_intrinsic | general_intrinsic
/// summary=C|C
Method Intrinsicfncall1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..SpecialIntrinsic(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..GeneralIntrinsic(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

///  intrinsicfncall_set ::= '$' (special_intrinsic_set | general_intrinsic_set )
/// summary values:$
/// summary=P&(C|C)
Method IntrinsicfncallSet(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&(C|C)
	if '..isPunctuation("$",1) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"$")  {
		if ..IntrinsicfncallSet1Sub(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// special_intrinsic_set | general_intrinsic_set
/// summary=C|C
Method IntrinsicfncallSet1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..SpecialIntrinsicSet(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..GeneralIntrinsicSet(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

///  job_argument ::= job_call job_location? job_process_parameters? job_timeout_spec?
/// summary=C&?4OptionalSingle4?&?4OptionalSingle4?&?4OptionalSingle4?
Method JobArgument(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&?4OptionalSingle4?&?4OptionalSingle4?&?4OptionalSingle4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..JobCall(.subElement,.addedElement)  {
		if $s(..JobLocation(.subElement,.addedElement) :1,1:1)  {
			if $s(..JobProcessParameters(.subElement,.addedElement) :1,1:1)  {
				if $s(..JobTimeoutSpec(.subElement,.addedElement) :1,1:1)  {
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  job_argument_list ::= ','.job_argument+
/// summary=.C.
Method JobArgumentList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary .C.
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..JobArgumentList1RepSep(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ','.job_argument+
Method JobArgumentList1RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4String:4?
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set done=0 ; must be at least 1
	if ..JobArgument(.subElement,.addedElement) {
		set done=1,ok=1 ; found 1
		do {
			$$$BNFSTART(repElement)
			set ok=(..addPunctuation(.repElement,",")  && ..JobArgument(.repElement,.addedElement) )
			if ok {
				$$$BNFCOMMITCOPY(repElement,subElement)
			} else {
				$$$BNFROLLBACK(repElement)
			}
		} while ok
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	quit ok
}

///  job_call ::= ( label_reference function_parameter_list? ) | class_expression | this_object | ( '$' classmethod_function_call )
/// summary=(C&?4OptionalSingle4?)|C|C|(P&C)
Method JobCall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (C&?4OptionalSingle4?)|C|C|(P&C)
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..JobCall1Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ClassExpression(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ThisObject(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..JobCall2Sub(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  label_reference function_parameter_list?
/// summary=C&?4OptionalSingle4?
Method JobCall1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LabelReference(.subElement,.addedElement)  {
		if $s(..FunctionParameterList(.subElement,.addedElement) :1,1:1)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	quit ok
}

///  '$' classmethod_function_call
/// summary values:$
/// summary=P&C
Method JobCall2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation("$",1) { quit 0 /* normal */ }
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
		set ok=0
	}
	quit ok
}

///  job_command ::= ('job' | 'j') post_conditional? job_argument_list
/// summary values:JOB,J
/// summary=(K|K)&?4OptionalSingle4?&C
Method JobCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&?4OptionalSingle4?&C
	if '(..isKeywordInList($lb("JOB","J"))) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..JobCommand1Sub(.subElement,.addedElement)  {
		if $s(..PostConditional(.subElement,.addedElement) :1,1:1)  {
			if ..JobArgumentList(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 'job' | 'j'
/// summary=K|K
Method JobCommand1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"JOB")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"J")  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

///  job_location ::= ('[' expression ']') | ('|' expression '|')
/// summary=(P&C&P)|(P&C&P)
Method JobLocation(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (P&C&P)|(P&C&P)
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..JobLocation1Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..JobLocation2Sub(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// '[' expression ']'
/// summary=P&C&P
Method JobLocation1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"[")  {
		if ..Expression(.subElement,.addedElement)  {
			if ..addPunctuation(.subElement,"]")  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	quit ok
}

/// '|' expression '|'
/// summary values:|
/// summary=P&C&P
Method JobLocation2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&P
	if '..isPunctuation("|",1) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"|")  {
		if ..Expression(.subElement,.addedElement)  {
			if ..addPunctuation(.subElement,"|")  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	quit ok
}

///  job_nspace_param ::= expression?
/// summary=?4OptionalSingle4?
Method JobNspaceParam(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4OptionalSingle4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $s(..Expression(.subElement,.addedElement) :1,1:1)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  job_os-directory ::= expression?
/// summary=?4OptionalSingle4?
Method JobOsdirectory(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4OptionalSingle4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $s(..Expression(.subElement,.addedElement) :1,1:1)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  job_principal-input ::= expression?
/// summary=?4OptionalSingle4?
Method JobPrincipalinput(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4OptionalSingle4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $s(..Expression(.subElement,.addedElement) :1,1:1)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  job_principal-output ::= expression?
/// summary=?4OptionalSingle4?
Method JobPrincipaloutput(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4OptionalSingle4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $s(..Expression(.subElement,.addedElement) :1,1:1)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  job_priority ::= expression?
/// summary=?4OptionalSingle4?
Method JobPriority(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4OptionalSingle4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $s(..Expression(.subElement,.addedElement) :1,1:1)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
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
	if '..isPunctuation(":",1) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,":")  {
		if ..JobProcessParameters1Sub(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  job_process_parameters_inbrackets | job_process_parameters_nobrackets
/// summary=C|C
Method JobProcessParameters1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..JobProcessParametersInbrackets(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..JobProcessParametersNobrackets(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

///  job_process_parameters_inbrackets ::= '(' ( job_nspace_param [ ':' job_switch_param? [ ':' job_principal-input? [ ':' job_principal-output? [ ':' job_priority? [ ':' job_os-directory? [ ':' job_process-name? ] ] ] ] ] ] ) ')'
/// summary values:(
/// summary=P&(C&[P&?4OptionalSingle4?&[P&?4OptionalSingle4?&[P&?4OptionalSingle4?&[P&?4OptionalSingle4?&[P&?4OptionalSingle4?&[P&?4OptionalSingle4?]]]]]])&P
Method JobProcessParametersInbrackets(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&(C&[P&?4OptionalSingle4?&[P&?4OptionalSingle4?&[P&?4OptionalSingle4?&[P&?4OptionalSingle4?&[P&?4OptionalSingle4?&[P&?4OptionalSingle4?]]]]]])&P
	if '..isPunctuation("(",1) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if ..JobProcessParametersInbrackets1Sub(.subElement,.addedElement)  {
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  job_nspace_param [ ':' job_switch_param? [ ':' job_principal-input? [ ':' job_principal-output? [ ':' job_priority? [ ':' job_os-directory? [ ':' job_process-name? ] ] ] ] ] ]
/// summary=C&[P&?4OptionalSingle4?&[P&?4OptionalSingle4?&[P&?4OptionalSingle4?&[P&?4OptionalSingle4?&[P&?4OptionalSingle4?&[P&?4OptionalSingle4?]]]]]]
Method JobProcessParametersInbrackets1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&[P&?4OptionalSingle4?&[P&?4OptionalSingle4?&[P&?4OptionalSingle4?&[P&?4OptionalSingle4?&[P&?4OptionalSingle4?&[P&?4OptionalSingle4?]]]]]]
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..JobNspaceParam(.subElement,.addedElement)  {
		if ..JobProcessParametersInbrackets2OptGrp(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	quit ok
}

/// 
/// summary values::
/// summary=P&?4OptionalSingle4?&[P&?4OptionalSingle4?&[P&?4OptionalSingle4?&[P&?4OptionalSingle4?&[P&?4OptionalSingle4?&[P&?4OptionalSingle4?]]]]]
Method JobProcessParametersInbrackets2OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&?4OptionalSingle4?&[P&?4OptionalSingle4?&[P&?4OptionalSingle4?&[P&?4OptionalSingle4?&[P&?4OptionalSingle4?&[P&?4OptionalSingle4?]]]]]
	if '..isPunctuation(":",1) { quit 1 /* not found is OK */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,":")  {
		if $s(..JobSwitchParam(.subElement,.addedElement) :1,1:1)  {
			if ..JobProcessParametersInbrackets3OptGrp(.subElement,.addedElement)  {
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
/// summary=P&?4OptionalSingle4?&[P&?4OptionalSingle4?&[P&?4OptionalSingle4?&[P&?4OptionalSingle4?&[P&?4OptionalSingle4?]]]]
Method JobProcessParametersInbrackets3OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&?4OptionalSingle4?&[P&?4OptionalSingle4?&[P&?4OptionalSingle4?&[P&?4OptionalSingle4?&[P&?4OptionalSingle4?]]]]
	if '..isPunctuation(":",1) { quit 1 /* not found is OK */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,":")  {
		if $s(..JobPrincipalinput(.subElement,.addedElement) :1,1:1)  {
			if ..JobProcessParametersInbrackets4OptGrp(.subElement,.addedElement)  {
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
/// summary=P&?4OptionalSingle4?&[P&?4OptionalSingle4?&[P&?4OptionalSingle4?&[P&?4OptionalSingle4?]]]
Method JobProcessParametersInbrackets4OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&?4OptionalSingle4?&[P&?4OptionalSingle4?&[P&?4OptionalSingle4?&[P&?4OptionalSingle4?]]]
	if '..isPunctuation(":",1) { quit 1 /* not found is OK */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,":")  {
		if $s(..JobPrincipaloutput(.subElement,.addedElement) :1,1:1)  {
			if ..JobProcessParametersInbrackets5OptGrp(.subElement,.addedElement)  {
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
/// summary=P&?4OptionalSingle4?&[P&?4OptionalSingle4?&[P&?4OptionalSingle4?]]
Method JobProcessParametersInbrackets5OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&?4OptionalSingle4?&[P&?4OptionalSingle4?&[P&?4OptionalSingle4?]]
	if '..isPunctuation(":",1) { quit 1 /* not found is OK */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,":")  {
		if $s(..JobPriority(.subElement,.addedElement) :1,1:1)  {
			if ..JobProcessParametersInbrackets6OptGrp(.subElement,.addedElement)  {
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
/// summary=P&?4OptionalSingle4?&[P&?4OptionalSingle4?]
Method JobProcessParametersInbrackets6OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&?4OptionalSingle4?&[P&?4OptionalSingle4?]
	if '..isPunctuation(":",1) { quit 1 /* not found is OK */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,":")  {
		if $s(..JobOsdirectory(.subElement,.addedElement) :1,1:1)  {
			if ..JobProcessParametersInbrackets7OptGrp(.subElement,.addedElement)  {
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
/// summary=P&?4OptionalSingle4?
Method JobProcessParametersInbrackets7OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&?4OptionalSingle4?
	if '..isPunctuation(":",1) { quit 1 /* not found is OK */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,":")  {
		if $s(..JobProcessname(.subElement,.addedElement) :1,1:1)  {
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

///  job_process_parameters_nobrackets ::= job_nspace_param?
/// summary=?4OptionalSingle4?
Method JobProcessParametersNobrackets(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4OptionalSingle4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $s(..JobNspaceParam(.subElement,.addedElement) :1,1:1)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  job_process-name ::= expression?
/// summary=?4OptionalSingle4?
Method JobProcessname(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4OptionalSingle4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $s(..Expression(.subElement,.addedElement) :1,1:1)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  job_switch_param ::= expression?
/// summary=?4OptionalSingle4?
Method JobSwitchParam(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4OptionalSingle4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $s(..Expression(.subElement,.addedElement) :1,1:1)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
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
	if '..isPunctuation(":",1) { quit 0 /* normal */ }
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
		set ok=0
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  js_command ::= ('&javascript<' | '&js<') js_body '>'
/// summary values:&JAVASCRIPT<,&JS<
/// summary=(P|P)&C&P
Method JsCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (P|P)&C&P
	if '..isStringSingle("&JAVASCRIPT<",12),'..isStringSingle("&JS<",4) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..JsCommand1Sub(.subElement,.addedElement)  {
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// '&javascript<' | '&js<'
/// summary=P|P
Method JsCommand1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	if ..addPunctuation(.subElement,"&javascript<")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"&js<")  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  kill_command ::= ( 'kill' | 'k') post_conditional? ( naked | kill_parameter_list )
/// summary values:KILL,K
/// summary=(K|K)&?4OptionalSingle4?&(C|C)
Method KillCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&?4OptionalSingle4?&(C|C)
	if '(..isKeywordInList($lb("KILL","K"))) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..KillCommand1Sub(.subElement,.addedElement)  {
		if $s(..PostConditional(.subElement,.addedElement) :1,1:1)  {
			if ..KillCommand2Sub(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  'kill' | 'k'
/// summary=K|K
Method KillCommand1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"KILL")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"K")  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

///  naked | kill_parameter_list
/// summary=C|C
Method KillCommand2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..Naked(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..KillParameterList(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

///  kill_exclusive_list ::= '(' kill_item_list ')'
/// summary values:(
/// summary=P&C&P
Method KillExclusiveList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&P
	if '..isPunctuation("(",1) { quit 0 /* normal */ }
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  kill_item ::= set_value_expression
/// summary=C
Method KillItem(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SetValueExpression(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  kill_item_list ::= ','.kill_item+
/// summary=.C.
Method KillItemList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary .C.
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..KillItemList1RepSep(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ','.kill_item+
Method KillItemList1RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4String:4?
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set done=0 ; must be at least 1
	if ..KillItem(.subElement,.addedElement) {
		set done=1,ok=1 ; found 1
		do {
			$$$BNFSTART(repElement)
			set ok=(..addPunctuation(.repElement,",")  && ..KillItem(.repElement,.addedElement) )
			if ok {
				$$$BNFCOMMITCOPY(repElement,subElement)
			} else {
				$$$BNFROLLBACK(repElement)
			}
		} while ok
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  kill_parameter_list ::= ','.kill_parameter+
/// summary=.C.
Method KillParameterList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary .C.
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..KillParameterList1RepSep(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ','.kill_parameter+
Method KillParameterList1RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4String:4?
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set done=0 ; must be at least 1
	if ..KillParameter(.subElement,.addedElement) {
		set done=1,ok=1 ; found 1
		do {
			$$$BNFSTART(repElement)
			set ok=(..addPunctuation(.repElement,",")  && ..KillParameter(.repElement,.addedElement) )
			if ok {
				$$$BNFCOMMITCOPY(repElement,subElement)
			} else {
				$$$BNFROLLBACK(repElement)
			}
		} while ok
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
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

	set ok=$s(done:1,1:0)
	$$$DEBUGMethodEnd
	quit ok
}

///  label_definition ::= label_identifier label_formal_specification? label_public_vars? label_scope? [ '{' cos_code_block'}']
/// summary=C&?4OptionalSingle4?&?4OptionalSingle4?&?4OptionalSingle4?&[P&C&P]
Method LabelDefinition(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&?4OptionalSingle4?&?4OptionalSingle4?&?4OptionalSingle4?&[P&C&P]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LabelIdentifier(.subElement,.addedElement)  {
		if $s(..LabelFormalSpecification(.subElement,.addedElement) :1,1:1)  {
			if $s(..LabelPublicVars(.subElement,.addedElement) :1,1:1)  {
				if $s(..LabelScope(.subElement,.addedElement) :1,1:1)  {
					if ..LabelDefinition1OptGrp(.subElement,.addedElement)  {
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary values:{
/// summary=P&C&P
Method LabelDefinition1OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&P
	if '..isPunctuation("{",1) { quit 1 /* not found is OK */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"{")  {
		if ..CosCodeBlock(.subElement,.addedElement)  {
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
	if '..isPunctuation("(",1) { quit 0 /* normal */ }
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
		set ok=0
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
		set ok=0
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
	if '..isPunctuation("[",1) { quit 0 /* normal */ }
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  label_public_vars_list ::= ','.variable+
/// summary=.C.
Method LabelPublicVarsList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary .C.
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LabelPublicVarsList1RepSep(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ','.variable+
Method LabelPublicVarsList1RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4String:4?
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set done=0 ; must be at least 1
	if ..Variable(.subElement,.addedElement) {
		set done=1,ok=1 ; found 1
		do {
			$$$BNFSTART(repElement)
			set ok=(..addPunctuation(.repElement,",")  && ..Variable(.repElement,.addedElement) )
			if ok {
				$$$BNFCOMMITCOPY(repElement,subElement)
			} else {
				$$$BNFROLLBACK(repElement)
			}
		} while ok
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	quit ok
}

///  label_reference ::= (( label_identifier | simple_indirection ) [ '^' routine_env? ( routine_identifier | simple_indirection) ]) | ('^' routine_env? (routine_identifier | simple_indirection) )
/// summary=((C|C)&[P&?4OptionalSingle4?&(C|C)])|(P&?4OptionalSingle4?&(C|C))
Method LabelReference(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ((C|C)&[P&?4OptionalSingle4?&(C|C)])|(P&?4OptionalSingle4?&(C|C))
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LabelReference1Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..LabelReference5Sub(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// ( label_identifier | simple_indirection ) [ '^' routine_env? ( routine_identifier | simple_indirection) ]
/// summary=(C|C)&[P&?4OptionalSingle4?&(C|C)]
Method LabelReference1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LabelReference2Sub(.subElement,.addedElement)  {
		if ..LabelReference3OptGrp(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	quit ok
}

///  label_identifier | simple_indirection
/// summary=C|C
Method LabelReference2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..LabelIdentifier(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SimpleIndirection(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

/// 
/// summary values:^
/// summary=P&?4OptionalSingle4?&(C|C)
Method LabelReference3OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&?4OptionalSingle4?&(C|C)
	if '..isPunctuation("^",1) { quit 1 /* not found is OK */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"^")  {
		if $s(..RoutineEnv(.subElement,.addedElement) :1,1:1)  {
			if ..LabelReference4Sub(.subElement,.addedElement)  {
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
Method LabelReference4Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..RoutineIdentifier(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SimpleIndirection(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

/// '^' routine_env? (routine_identifier | simple_indirection)
/// summary values:^
/// summary=P&?4OptionalSingle4?&(C|C)
Method LabelReference5Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&?4OptionalSingle4?&(C|C)
	if '..isPunctuation("^",1) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"^")  {
		if $s(..RoutineEnv(.subElement,.addedElement) :1,1:1)  {
			if ..LabelReference6Sub(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	quit ok
}

/// routine_identifier | simple_indirection
/// summary=C|C
Method LabelReference6Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..RoutineIdentifier(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SimpleIndirection(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

///  label_scope ::= 'public' | 'private' | 'methodimpl'
/// summary values:PUBLIC,PRIVATE,METHODIMPL
/// summary=K|K|K
Method LabelScope(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K|K
	if '(..isKeywordInList($lb("PUBLIC","PRIVATE","METHODIMPL"))) { quit 0 /* normal */ }
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  label-formal-param-list ::= ','.label-one-formal-param+ ['...']
/// summary=.C.&[P]
Method Labelformalparamlist(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary .C.&[P]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Labelformalparamlist1RepSep(.subElement,.addedElement)  {
		if $S(..addPunctuation(.subElement,"...") :1,1:1) {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ','.label-one-formal-param+
Method Labelformalparamlist1RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4String:4?
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set done=0 ; must be at least 1
	if ..Labeloneformalparam(.subElement,.addedElement) {
		set done=1,ok=1 ; found 1
		do {
			$$$BNFSTART(repElement)
			set ok=(..addPunctuation(.repElement,",")  && ..Labeloneformalparam(.repElement,.addedElement) )
			if ok {
				$$$BNFCOMMITCOPY(repElement,subElement)
			} else {
				$$$BNFROLLBACK(repElement)
			}
		} while ok
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
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
		set ok=0
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
	if '..isPunctuation("=",1) { quit 0 /* normal */ }
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
		set ok=0
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
		set ok=0
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
	if '..isPunctuation(";",1) { quit 0 /* normal */ }
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  line_reference ::= label? [ offset_sign? offset ]
/// summary=?4OptionalSingle4?&[?4OptionalSingle4?&C]
Method LineReference(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4OptionalSingle4?&[?4OptionalSingle4?&C]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $s(..Label(.subElement,.addedElement) :1,1:1)  {
		if ..LineReference1OptGrp(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=?4OptionalSingle4?&C
Method LineReference1OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4OptionalSingle4?&C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $s(..OffsetSign(.subElement,.addedElement) :1,1:1)  {
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
		set ok=0
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  listbuild_function_call_set ::= ('listbuild' | 'listget' | 'lb' | 'lg') open_bracket [set_value_expression] (',' [set_value_expression])* close_bracket
/// summary values:LISTBUILD,LISTGET,LB,LG
/// summary=(K|K|K|K)&C&[C]&(?4punctuation:4?)*&C
Method ListbuildFunctionCallSet(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K|K|K)&C&[C]&(?4punctuation:4?)*&C
	if '(..isKeywordInList($lb("LISTBUILD","LISTGET","LB","LG"))) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ListbuildFunctionCallSet1Sub(.subElement,.addedElement)  {
		if ..OpenBracket(.subElement,.addedElement)  {
			if $S(..SetValueExpression(.subElement,.addedElement) :1,1:1) {
				if ..ListbuildFunctionCallSet2RepZero(.subElement,.addedElement)  {
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 'listbuild' | 'listget' | 'lb' | 'lg'
/// summary=K|K|K|K
Method ListbuildFunctionCallSet1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"LISTBUILD")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"LISTGET")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"LB")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"LG")  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

///  (',' [set_value_expression])*
Method ListbuildFunctionCallSet2RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	; method start
	while ..ListbuildFunctionCallSet3Sub(.subElement,.addedElement)  {
		;
	}
	set ok=1
	quit ok
}

/// ',' [set_value_expression]
/// summary values:,
/// summary=P&[C]
Method ListbuildFunctionCallSet3Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&[C]
	if '..isPunctuation(",",1) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if $S(..SetValueExpression(.subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	quit ok
}

///  listitem_function_call ::= ('listget' | 'list' | 'li' |'lg' ) open_bracket expression [ ',' star_parameter [ ',' star_parameter ] ] close_bracket
/// summary values:LISTGET,LIST,LI,LG
/// summary=(K|K|K|K)&C&C&[P&C&[P&C]]&C
Method ListitemFunctionCall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K|K|K)&C&C&[P&C&[P&C]]&C
	if '(..isKeywordInList($lb("LISTGET","LIST","LI","LG"))) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ListitemFunctionCall1Sub(.subElement,.addedElement)  {
		if ..OpenBracket(.subElement,.addedElement)  {
			if ..Expression(.subElement,.addedElement)  {
				if ..ListitemFunctionCall2OptGrp(.subElement,.addedElement)  {
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 'listget' | 'list' | 'li' |'lg'
/// summary=K|K|K|K
Method ListitemFunctionCall1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
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

	set ok=$s(done:1,1:0)
	quit ok
}

/// 
/// summary values:,
/// summary=P&C&[P&C]
Method ListitemFunctionCall2OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&[P&C]
	if '..isPunctuation(",",1) { quit 1 /* not found is OK */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..StarParameter(.subElement,.addedElement)  {
			if ..ListitemFunctionCall3OptGrp(.subElement,.addedElement)  {
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
Method ListitemFunctionCall3OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation(",",1) { quit 1 /* not found is OK */ }
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
	if '(..isKeywordInList($lb("LIST","LI"))) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ListitemFunctionCallSet1Sub(.subElement,.addedElement)  {
		if ..OpenBracket(.subElement,.addedElement)  {
			if ..SetValueExpression(.subElement,.addedElement)  {
				if ..ListitemFunctionCallSet2OptGrp(.subElement,.addedElement)  {
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 'list' | 'li'
/// summary=K|K
Method ListitemFunctionCallSet1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"LIST")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"LI")  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

/// 
/// summary values:,
/// summary=P&C&[P&C]
Method ListitemFunctionCallSet2OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&[P&C]
	if '..isPunctuation(",",1) { quit 1 /* not found is OK */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..StarParameter(.subElement,.addedElement)  {
			if ..ListitemFunctionCallSet3OptGrp(.subElement,.addedElement)  {
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
Method ListitemFunctionCallSet3OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation(",",1) { quit 1 /* not found is OK */ }
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

///  listnext_function_call ::= 'listnext' open_bracket expression [',' expression [ ',' variable_set ] ] close_bracket
/// summary values:LISTNEXT
/// summary=K&C&C&[P&C&[P&C]]&C
Method ListnextFunctionCall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C&C&[P&C&[P&C]]&C
	if '(..isKeyword("LISTNEXT")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"LISTNEXT")  {
		if ..OpenBracket(.subElement,.addedElement)  {
			if ..Expression(.subElement,.addedElement)  {
				if ..ListnextFunctionCall1OptGrp(.subElement,.addedElement)  {
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary values:,
/// summary=P&C&[P&C]
Method ListnextFunctionCall1OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&[P&C]
	if '..isPunctuation(",",1) { quit 1 /* not found is OK */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..Expression(.subElement,.addedElement)  {
			if ..ListnextFunctionCall2OptGrp(.subElement,.addedElement)  {
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
Method ListnextFunctionCall2OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation(",",1) { quit 1 /* not found is OK */ }
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

///  listupdate_function_call ::= ('listupdate' | 'lu') open_bracket expression ',' expression (',' [ expression ':' expression] )* close_bracket
/// summary values:LISTUPDATE,LU
/// summary=(K|K)&C&C&P&C&(?4punctuation:4?)*&C
Method ListupdateFunctionCall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&C&C&P&C&(?4punctuation:4?)*&C
	if '(..isKeywordInList($lb("LISTUPDATE","LU"))) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ListupdateFunctionCall1Sub(.subElement,.addedElement)  {
		if ..OpenBracket(.subElement,.addedElement)  {
			if ..Expression(.subElement,.addedElement)  {
				if ..addPunctuation(.subElement,",")  {
					if ..Expression(.subElement,.addedElement)  {
						if ..ListupdateFunctionCall2RepZero(.subElement,.addedElement)  {
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 'listupdate' | 'lu'
/// summary=K|K
Method ListupdateFunctionCall1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"LISTUPDATE")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"LU")  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

///  (',' [ expression ':' expression] )*
Method ListupdateFunctionCall2RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	; method start
	while ..ListupdateFunctionCall3Sub(.subElement,.addedElement)  {
		;
	}
	set ok=1
	quit ok
}

/// ',' [ expression ':' expression]
/// summary values:,
/// summary=P&[C&P&C]
Method ListupdateFunctionCall3Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&[C&P&C]
	if '..isPunctuation(",",1) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..ListupdateFunctionCall4OptGrp(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	quit ok
}

/// 
/// summary=C&P&C
Method ListupdateFunctionCall4OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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

///  locate_function_call ::= 'locate' open_bracket expression ',' expression [ ',' expression [ ',' variable_set [',' variable_set ]]] close_bracket
/// summary values:LOCATE
/// summary=K&C&C&P&C&[P&C&[P&C&[P&C]]]&C
Method LocateFunctionCall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C&C&P&C&[P&C&[P&C&[P&C]]]&C
	if '(..isKeyword("LOCATE")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"LOCATE")  {
		if ..OpenBracket(.subElement,.addedElement)  {
			if ..Expression(.subElement,.addedElement)  {
				if ..addPunctuation(.subElement,",")  {
					if ..Expression(.subElement,.addedElement)  {
						if ..LocateFunctionCall1OptGrp(.subElement,.addedElement)  {
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary values:,
/// summary=P&C&[P&C&[P&C]]
Method LocateFunctionCall1OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&[P&C&[P&C]]
	if '..isPunctuation(",",1) { quit 1 /* not found is OK */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..Expression(.subElement,.addedElement)  {
			if ..LocateFunctionCall2OptGrp(.subElement,.addedElement)  {
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
/// summary=P&C&[P&C]
Method LocateFunctionCall2OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&[P&C]
	if '..isPunctuation(",",1) { quit 1 /* not found is OK */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..VariableSet(.subElement,.addedElement)  {
			if ..LocateFunctionCall3OptGrp(.subElement,.addedElement)  {
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
Method LocateFunctionCall3OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation(",",1) { quit 1 /* not found is OK */ }
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

///  lock_command ::= ('lock' | 'l') post_conditional? ( naked | ( [ ','.lock_parameter+ ] else_block? ) )
/// summary values:LOCK,L
/// summary=(K|K)&?4OptionalSingle4?&(C|([.C.]&?4OptionalSingle4?))
Method LockCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&?4OptionalSingle4?&(C|([.C.]&?4OptionalSingle4?))
	if '(..isKeywordInList($lb("LOCK","L"))) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LockCommand1Sub(.subElement,.addedElement)  {
		if $s(..PostConditional(.subElement,.addedElement) :1,1:1)  {
			if ..LockCommand2Sub(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 'lock' | 'l'
/// summary=K|K
Method LockCommand1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"LOCK")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"L")  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

///  naked | ( [ ','.lock_parameter+ ] else_block? )
/// summary=C|([.C.]&?4OptionalSingle4?)
Method LockCommand2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|([.C.]&?4OptionalSingle4?)
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Naked(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..LockCommand3Sub(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	quit ok
}

///  [ ','.lock_parameter+ ] else_block?
/// summary=[.C.]&?4OptionalSingle4?
Method LockCommand3Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary [.C.]&?4OptionalSingle4?
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..LockCommand4RepSep(.subElement,.addedElement) :1,1:1) {
		if $s(..ElseBlock(.subElement,.addedElement) :1,1:1)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	quit ok
}

///  ','.lock_parameter+
Method LockCommand4RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4String:4?
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set done=0 ; must be at least 1
	if ..LockParameter(.subElement,.addedElement) {
		set done=1,ok=1 ; found 1
		do {
			$$$BNFSTART(repElement)
			set ok=(..addPunctuation(.repElement,",")  && ..LockParameter(.repElement,.addedElement) )
			if ok {
				$$$BNFCOMMITCOPY(repElement,subElement)
			} else {
				$$$BNFROLLBACK(repElement)
			}
		} while ok
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	quit ok
}

///  lock_parameter ::= [ '+' | '-' ] (lockname_list | lockname_list_item) lock_timeout?
/// summary=[P|P]&(C|C)&?4OptionalSingle4?
Method LockParameter(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary [P|P]&(C|C)&?4OptionalSingle4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LockParameter1OptGrp(.subElement,.addedElement)  {
		if ..LockParameter2Sub(.subElement,.addedElement)  {
			if $s(..LockTimeout(.subElement,.addedElement) :1,1:1)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary values:+,-
/// summary=P|P
Method LockParameter1OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P|P
	if '..isPunctuationInList($lb("+","-"),1) { quit 1 /* not found is OK */ }
	set subElement=ParentElement
	; method start
	if ..addPunctuation(.subElement,"+")  {
		; or
	} elseif ..addPunctuation(.subElement,"-")  {
		; end compileRules
	}

	set ok=1
	quit ok
}

/// lockname_list | lockname_list_item
/// summary=C|C
Method LockParameter2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..LocknameList(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..LocknameListItem(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

///  lock_timeout ::= ':' expression
/// summary values::
/// summary=P&C
Method LockTimeout(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C
	if '..isPunctuation(":",1) { quit 0 /* normal */ }
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
		set ok=0
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
		set ok=0
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  lockname_list ::= '(' ','.lockname_list_item+ ')'
/// summary values:(
/// summary=P&.C.&P
Method LocknameList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&.C.&P
	if '..isPunctuation("(",1) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if ..LocknameList1RepSep(.subElement,.addedElement)  {
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ','.lockname_list_item+
Method LocknameList1RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4String:4?
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set done=0 ; must be at least 1
	if ..LocknameListItem(.subElement,.addedElement) {
		set done=1,ok=1 ; found 1
		do {
			$$$BNFSTART(repElement)
			set ok=(..addPunctuation(.repElement,",")  && ..LocknameListItem(.repElement,.addedElement) )
			if ok {
				$$$BNFCOMMITCOPY(repElement,subElement)
			} else {
				$$$BNFROLLBACK(repElement)
			}
		} while ok
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	quit ok
}

///  lockname_list_item ::= lockname lock_type?
/// summary=C&?4OptionalSingle4?
Method LocknameListItem(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&?4OptionalSingle4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Lockname(.subElement,.addedElement)  {
		if $s(..LockType(.subElement,.addedElement) :1,1:1)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
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
		set ok=0
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
		set ok=0
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
		set ok=0
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
	if ..MacroParameter1Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Expression(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// '.' variable_set
/// summary=P&C
Method MacroParameter1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
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
		set ok=0
	}
	quit ok
}

///  macro_parameter_list ::= '(' [ ','.macro_parameter+ ] ')'
/// summary values:(
/// summary=P&[.C.]&P
Method MacroParameterList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&[.C.]&P
	if '..isPunctuation("(",1) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if $S(..MacroParameterList1RepSep(.subElement,.addedElement) :1,1:1) {
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ','.macro_parameter+
Method MacroParameterList1RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4String:4?
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set done=0 ; must be at least 1
	if ..MacroParameter(.subElement,.addedElement) {
		set done=1,ok=1 ; found 1
		do {
			$$$BNFSTART(repElement)
			set ok=(..addPunctuation(.repElement,",")  && ..MacroParameter(.repElement,.addedElement) )
			if ok {
				$$$BNFCOMMITCOPY(repElement,subElement)
			} else {
				$$$BNFROLLBACK(repElement)
			}
		} while ok
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	quit ok
}

///  macro_parameter_text ::= '(' any_text_upto_close_bracket ')'
/// summary values:(
/// summary=P&C&P
Method MacroParameterText(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&P
	if '..isPunctuation("(",1) { quit 0 /* normal */ }
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  macrocall ::= '$$$' macro_identifier [ macro_parameter_list | macro_parameter_text ] macro_parameter_list? object_chain?
/// summary values:$$$
/// summary=P&C&[C|C]&?4OptionalSingle4?&?4OptionalSingle4?
Method Macrocall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&[C|C]&?4OptionalSingle4?&?4OptionalSingle4?
	if '..isPunctuation("$$$",3) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"$$$")  {
		if ..MacroIdentifier(.subElement,.addedElement)  {
			if ..Macrocall1OptGrp(.subElement,.addedElement)  {
				if $s(..MacroParameterList(.subElement,.addedElement) :1,1:1)  {
					if $s(..ObjectChain(.subElement,.addedElement) :1,1:1)  {
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=C|C
Method Macrocall1OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	; method start
	if ..MacroParameterList(.subElement,.addedElement)  {
		; or
	} elseif ..MacroParameterText(.subElement,.addedElement)  {
		; end compileRules
	}

	set ok=1
	quit ok
}

///  merge_command ::= ('merge' | 'm') post_conditional? merge_item_list
/// summary values:MERGE,M
/// summary=(K|K)&?4OptionalSingle4?&C
Method MergeCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&?4OptionalSingle4?&C
	if '(..isKeywordInList($lb("MERGE","M"))) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..MergeCommand1Sub(.subElement,.addedElement)  {
		if $s(..PostConditional(.subElement,.addedElement) :1,1:1)  {
			if ..MergeItemList(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 'merge' | 'm'
/// summary=K|K
Method MergeCommand1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"MERGE")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"M")  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  merge_item_list ::= ','.merge_item+
/// summary=.C.
Method MergeItemList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary .C.
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..MergeItemList1RepSep(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ','.merge_item+
Method MergeItemList1RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4String:4?
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set done=0 ; must be at least 1
	if ..MergeItem(.subElement,.addedElement) {
		set done=1,ok=1 ; found 1
		do {
			$$$BNFSTART(repElement)
			set ok=(..addPunctuation(.repElement,",")  && ..MergeItem(.repElement,.addedElement) )
			if ok {
				$$$BNFCOMMITCOPY(repElement,subElement)
			} else {
				$$$BNFROLLBACK(repElement)
			}
		} while ok
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	quit ok
}

///  method_function_call ::= 'method' open_bracket classmethod_class ',' classmethod_method [ ',' function_parameter_list_items ] close_bracket object_chain?
/// summary values:METHOD
/// summary=K&C&C&P&C&[P&C]&C&?4OptionalSingle4?
Method MethodFunctionCall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C&C&P&C&[P&C]&C&?4OptionalSingle4?
	if '(..isKeyword("METHOD")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"METHOD")  {
		if ..OpenBracket(.subElement,.addedElement)  {
			if ..ClassmethodClass(.subElement,.addedElement)  {
				if ..addPunctuation(.subElement,",")  {
					if ..ClassmethodMethod(.subElement,.addedElement)  {
						if ..MethodFunctionCall1OptGrp(.subElement,.addedElement)  {
							if ..CloseBracket(.subElement,.addedElement)  {
								if $s(..ObjectChain(.subElement,.addedElement) :1,1:1)  {
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary values:,
/// summary=P&C
Method MethodFunctionCall1OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation(",",1) { quit 1 /* not found is OK */ }
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

///  monadicop ::= "+" | "-" | "'" | "~"
/// summary values:+,-,',~
/// summary=P|P|P|P
Method Monadicop(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|P|P|P
	if '..isPunctuationInList($lb("+","-","'","~"),1) { quit 0 /* normal */ }
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  mpv_command ::= ('mvprint' | 'mvp') post_conditional? write_argument_list?
/// summary values:MVPRINT,MVP
/// summary=(K|K)&?4OptionalSingle4?&?4OptionalSingle4?
Method MpvCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&?4OptionalSingle4?&?4OptionalSingle4?
	if '(..isKeywordInList($lb("MVPRINT","MVP"))) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..MpvCommand1Sub(.subElement,.addedElement)  {
		if $s(..PostConditional(.subElement,.addedElement) :1,1:1)  {
			if $s(..WriteArgumentList(.subElement,.addedElement) :1,1:1)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 'mvprint' | 'mvp'
/// summary=K|K
Method MpvCommand1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"MVPRINT")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"MVP")  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

///  mv_function_set ::= 'mv' open_bracket variable_set ',' expression [ '::' expression ] [ ',' expression [ ',' expression ] ] close_bracket
/// summary values:MV
/// summary=K&C&C&P&C&[P&C]&[P&C&[P&C]]&C
Method MvFunctionSet(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C&C&P&C&[P&C]&[P&C&[P&C]]&C
	if '(..isKeyword("MV")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"MV")  {
		if ..OpenBracket(.subElement,.addedElement)  {
			if ..VariableSet(.subElement,.addedElement)  {
				if ..addPunctuation(.subElement,",")  {
					if ..Expression(.subElement,.addedElement)  {
						if ..MvFunctionSet1OptGrp(.subElement,.addedElement)  {
							if ..MvFunctionSet2OptGrp(.subElement,.addedElement)  {
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary values:::
/// summary=P&C
Method MvFunctionSet1OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation("::",2) { quit 1 /* not found is OK */ }
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
Method MvFunctionSet2OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&[P&C]
	if '..isPunctuation(",",1) { quit 1 /* not found is OK */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..Expression(.subElement,.addedElement)  {
			if ..MvFunctionSet3OptGrp(.subElement,.addedElement)  {
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
Method MvFunctionSet3OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation(",",1) { quit 1 /* not found is OK */ }
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  new_command ::= ('new' | 'n') post_conditional? ( naked | new_item_list )
/// summary values:NEW,N
/// summary=(K|K)&?4OptionalSingle4?&(C|C)
Method NewCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&?4OptionalSingle4?&(C|C)
	if '(..isKeywordInList($lb("NEW","N"))) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..NewCommand1Sub(.subElement,.addedElement)  {
		if $s(..PostConditional(.subElement,.addedElement) :1,1:1)  {
			if ..NewCommand2Sub(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 'new' | 'n'
/// summary=K|K
Method NewCommand1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"NEW")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"N")  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

///  naked | new_item_list
/// summary=C|C
Method NewCommand2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..Naked(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..NewItemList(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  new_item_list ::= ','.new_item+
/// summary=.C.
Method NewItemList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary .C.
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..NewItemList1RepSep(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ','.new_item+
Method NewItemList1RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4String:4?
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set done=0 ; must be at least 1
	if ..NewItem(.subElement,.addedElement) {
		set done=1,ok=1 ; found 1
		do {
			$$$BNFSTART(repElement)
			set ok=(..addPunctuation(.repElement,",")  && ..NewItem(.repElement,.addedElement) )
			if ok {
				$$$BNFCOMMITCOPY(repElement,subElement)
			} else {
				$$$BNFROLLBACK(repElement)
			}
		} while ok
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  new_item_single_list ::= ','.new_item_single+
/// summary=.C.
Method NewItemSingleList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary .C.
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..NewItemSingleList1RepSep(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ','.new_item_single+
Method NewItemSingleList1RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4String:4?
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set done=0 ; must be at least 1
	if ..NewItemSingle(.subElement,.addedElement) {
		set done=1,ok=1 ; found 1
		do {
			$$$BNFSTART(repElement)
			set ok=(..addPunctuation(.repElement,",")  && ..NewItemSingle(.repElement,.addedElement) )
			if ok {
				$$$BNFCOMMITCOPY(repElement,subElement)
			} else {
				$$$BNFROLLBACK(repElement)
			}
		} while ok
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	quit ok
}

///  new_item_varlist ::= '(' new_item_single_list ')'
/// summary values:(
/// summary=P&C&P
Method NewItemVarlist(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&P
	if '..isPunctuation("(",1) { quit 0 /* normal */ }
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
		set ok=0
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
	if ..Number1Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Number5Sub(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 'regexp:[0-9]*' [ '.' 'regexp:[0-9]+'] [ ('e' | 'E' ) 'regexp:[0-9]+']
/// summary=R&[P&R]&[(K|K)&R]
Method Number1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addRegex(.subElement,"[0-9]*")  {
		if ..Number2OptGrp(.subElement,.addedElement)  {
			if ..Number3OptGrp(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	quit ok
}

/// 
/// summary values:.
/// summary=P&R
Method Number2OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&R
	if '..isPunctuation(".",1) { quit 1 /* not found is OK */ }
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
Method Number3OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary (K|K)&R
	if '(..isKeywordInList($lb("E","E"))) { quit 1 /* not found is OK */ /*1*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Number4Sub(.subElement,.addedElement)  {
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
Method Number4Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K|K
	if '(..isKeywordInList($lb("E","E"))) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"E")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"E")  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

/// '.' 'regexp:[0-9]+' [ ('e' | 'E') 'regexp:[0-9]+']
/// summary values:.
/// summary=P&R&[(K|K)&R]
Method Number5Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&R&[(K|K)&R]
	if '..isPunctuation(".",1) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,".")  {
		if ..addRegex(.subElement,"[0-9]+")  {
			if ..Number6OptGrp(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	quit ok
}

/// 
/// summary values:E,E
/// summary=(K|K)&R
Method Number6OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary (K|K)&R
	if '(..isKeywordInList($lb("E","E"))) { quit 1 /* not found is OK */ /*1*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Number7Sub(.subElement,.addedElement)  {
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
Method Number7Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K|K
	if '(..isKeywordInList($lb("E","E"))) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"E")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"E")  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

///  object_chain ::= '.' object_member_identifier function_parameter_list? object_chain?
/// summary values:.
/// summary=P&C&?4OptionalSingle4?&?4OptionalSingle4?
Method ObjectChain(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&?4OptionalSingle4?&?4OptionalSingle4?
	if '..isPunctuation(".",1) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,".")  {
		if ..ObjectMemberIdentifier(.subElement,.addedElement)  {
			if $s(..FunctionParameterList(.subElement,.addedElement) :1,1:1)  {
				if $s(..ObjectChain(.subElement,.addedElement) :1,1:1)  {
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  object_chain_item ::= object_member_identifier function_parameter_list?
/// summary=C&?4OptionalSingle4?
Method ObjectChainItem(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&?4OptionalSingle4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ObjectMemberIdentifier(.subElement,.addedElement)  {
		if $s(..FunctionParameterList(.subElement,.addedElement) :1,1:1)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  object_chain_no_dot ::= object_member_identifier function_parameter_list? object_chain?
/// summary=C&?4OptionalSingle4?&?4OptionalSingle4?
Method ObjectChainNoDot(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&?4OptionalSingle4?&?4OptionalSingle4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ObjectMemberIdentifier(.subElement,.addedElement)  {
		if $s(..FunctionParameterList(.subElement,.addedElement) :1,1:1)  {
			if $s(..ObjectChain(.subElement,.addedElement) :1,1:1)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
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

	set ok=$s(done:1,1:0)
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
		set ok=0
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

	set ok=$s(done:1,1:0)
	$$$DEBUGMethodEnd
	quit ok
}

///  offset_sign ::= '+' | '-'
/// summary values:+,-
/// summary=P|P
Method OffsetSign(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|P
	if '..isPunctuationInList($lb("+","-"),1) { quit 0 /* normal */ }
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  open_argument ::= open_device [ ':' [ ( '(' open_device_parameters ')' ) | expression ] ] [ ':' open_timeout ] [ ':' open_mnemonic_space ]
/// summary=C&[P&[(P&C&P)|C]]&[P&C]&[P&C]
Method OpenArgument(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&[P&[(P&C&P)|C]]&[P&C]&[P&C]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OpenDevice(.subElement,.addedElement)  {
		if ..OpenArgument1OptGrp(.subElement,.addedElement)  {
			if ..OpenArgument4OptGrp(.subElement,.addedElement)  {
				if ..OpenArgument5OptGrp(.subElement,.addedElement)  {
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary values::
/// summary=P&[(P&C&P)|C]
Method OpenArgument1OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&[(P&C&P)|C]
	if '..isPunctuation(":",1) { quit 1 /* not found is OK */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,":")  {
		if ..OpenArgument2OptGrp(.subElement,.addedElement)  {
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
Method OpenArgument2OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary (P&C&P)|C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OpenArgument3Sub(.subElement,.addedElement)  {
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
Method OpenArgument3Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&P
	if '..isPunctuation("(",1) { quit 0 /* normal */ }
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
		set ok=0
	}
	quit ok
}

/// 
/// summary values::
/// summary=P&C
Method OpenArgument4OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation(":",1) { quit 1 /* not found is OK */ }
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
Method OpenArgument5OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation(":",1) { quit 1 /* not found is OK */ }
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

///  open_argument_list ::= ','.open_argument+
/// summary=.C.
Method OpenArgumentList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary .C.
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OpenArgumentList1RepSep(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ','.open_argument+
Method OpenArgumentList1RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4String:4?
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set done=0 ; must be at least 1
	if ..OpenArgument(.subElement,.addedElement) {
		set done=1,ok=1 ; found 1
		do {
			$$$BNFSTART(repElement)
			set ok=(..addPunctuation(.repElement,",")  && ..OpenArgument(.repElement,.addedElement) )
			if ok {
				$$$BNFCOMMITCOPY(repElement,subElement)
			} else {
				$$$BNFROLLBACK(repElement)
			}
		} while ok
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  open_command ::= ('open' | 'o') post_conditional? open_argument_list
/// summary values:OPEN,O
/// summary=(K|K)&?4OptionalSingle4?&C
Method OpenCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&?4OptionalSingle4?&C
	if '(..isKeywordInList($lb("OPEN","O"))) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OpenCommand1Sub(.subElement,.addedElement)  {
		if $s(..PostConditional(.subElement,.addedElement) :1,1:1)  {
			if ..OpenArgumentList(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 'open' | 'o'
/// summary=K|K
Method OpenCommand1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"OPEN")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"O")  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  open_device_parameter ::= ('/' identifier [ '=' open_expression_list ] ) | expression
/// summary=(P&C&[P&C])|C
Method OpenDeviceParameter(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (P&C&[P&C])|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OpenDeviceParameter1Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Expression(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// '/' identifier [ '=' open_expression_list ]
/// summary=P&C&[P&C]
Method OpenDeviceParameter1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"/")  {
		if ..Identifier(.subElement,.addedElement)  {
			if ..OpenDeviceParameter2OptGrp(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	quit ok
}

/// 
/// summary values:=
/// summary=P&C
Method OpenDeviceParameter2OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation("=",1) { quit 1 /* not found is OK */ }
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

///  open_device_parameters ::= ':'.open_device_parameter?+
/// summary=.?4OptionalableRule4?.
Method OpenDeviceParameters(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary .?4OptionalableRule4?.
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OpenDeviceParameters1RepSep(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ':'.open_device_parameter?+
Method OpenDeviceParameters1RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4String:4?
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set done=0 ; must be at least 1
	if $s(..OpenDeviceParameter(.subElement,.addedElement) :1,1:1) {
		set done=1,ok=1 ; found 1
		do {
			$$$BNFSTART(repElement)
			set ok=(..addPunctuation(.repElement,":")  && $s(..OpenDeviceParameter(.repElement,.addedElement) :1,1:1) )
			if ok {
				$$$BNFCOMMITCOPY(repElement,subElement)
			} else {
				$$$BNFROLLBACK(repElement)
			}
		} while ok
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
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
	if ..OpenExpressionList1Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ExpressionList(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// variable '...'
/// summary=C&P
Method OpenExpressionList1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
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
		set ok=0
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
		set ok=0
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
		set ok=0
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
	if '(..isKeywordInList($lb("ORDER","O"))) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OrderFunctionCall1Sub(.subElement,.addedElement)  {
		if ..OpenBracket(.subElement,.addedElement)  {
			if ..Expression(.subElement,.addedElement)  {
				if ..OrderFunctionCall2OptGrp(.subElement,.addedElement)  {
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 'order' | 'o'
/// summary=K|K
Method OrderFunctionCall1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"ORDER")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"O")  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

/// 
/// summary values:,
/// summary=P&C&[P&C]
Method OrderFunctionCall2OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&[P&C]
	if '..isPunctuation(",",1) { quit 1 /* not found is OK */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..Expression(.subElement,.addedElement)  {
			if ..OrderFunctionCall3OptGrp(.subElement,.addedElement)  {
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
Method OrderFunctionCall3OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation(",",1) { quit 1 /* not found is OK */ }
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

///  pattern_match ::= ( "?" | "'?" ) pattern_match_combo*
/// summary values:?,'?
/// summary=(P|P)&(C)*
Method PatternMatch(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (P|P)&(C)*
	if '..isPunctuation("'?",2),'..isPunctuation("?",1) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..PatternMatch1Sub(.subElement,.addedElement)  {
		if ..PatternMatch2RepZero(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  "?" | "'?"
/// summary=P|P
Method PatternMatch1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	if ..addPunctuation(.subElement,"?")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"'?")  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

///  pattern_match_combo*
Method PatternMatch2RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C
	set subElement=ParentElement
	; method start
	while ..PatternMatchCombo(.subElement,.addedElement)  {
		;
	}
	set ok=1
	quit ok
}

///  pattern_match_alternating ::= '(' ','.pattern_match_combo+ ')'
/// summary values:(
/// summary=P&.C.&P
Method PatternMatchAlternating(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&.C.&P
	if '..isPunctuation("(",1) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if ..PatternMatchAlternating1RepSep(.subElement,.addedElement)  {
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ','.pattern_match_combo+
Method PatternMatchAlternating1RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4String:4?
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set done=0 ; must be at least 1
	if ..PatternMatchCombo(.subElement,.addedElement) {
		set done=1,ok=1 ; found 1
		do {
			$$$BNFSTART(repElement)
			set ok=(..addPunctuation(.repElement,",")  && ..PatternMatchCombo(.repElement,.addedElement) )
			if ok {
				$$$BNFCOMMITCOPY(repElement,subElement)
			} else {
				$$$BNFROLLBACK(repElement)
			}
		} while ok
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
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
		set ok=0
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
		if ..PatternMatchCombo1Sub(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  pattern_match_code | pattern_match_alternating
/// summary=C|C
Method PatternMatchCombo1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..PatternMatchCode(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..PatternMatchAlternating(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
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
	if ..PatternMatchRepeat1Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..PatternMatchRepeat3Sub(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 'regexp:[0-9]*' [ '.' [ 'regexp:[0-9]*' ] ]
/// summary=R&[P&[R]]
Method PatternMatchRepeat1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addRegex(.subElement,"[0-9]*")  {
		if ..PatternMatchRepeat2OptGrp(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	quit ok
}

/// 
/// summary values:.
/// summary=P&[R]
Method PatternMatchRepeat2OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&[R]
	if '..isPunctuation(".",1) { quit 1 /* not found is OK */ }
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
Method PatternMatchRepeat3Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&[R]
	if '..isPunctuation(".",1) { quit 0 /* normal */ }
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
		set ok=0
	}
	quit ok
}

///  piece_function_call ::= ('piece' | 'p') open_bracket expression ',' expression [ ',' star_parameter [ ',' star_parameter ] ] close_bracket
/// summary values:PIECE,P
/// summary=(K|K)&C&C&P&C&[P&C&[P&C]]&C
Method PieceFunctionCall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&C&C&P&C&[P&C&[P&C]]&C
	if '(..isKeywordInList($lb("PIECE","P"))) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..PieceFunctionCall1Sub(.subElement,.addedElement)  {
		if ..OpenBracket(.subElement,.addedElement)  {
			if ..Expression(.subElement,.addedElement)  {
				if ..addPunctuation(.subElement,",")  {
					if ..Expression(.subElement,.addedElement)  {
						if ..PieceFunctionCall2OptGrp(.subElement,.addedElement)  {
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 'piece' | 'p'
/// summary=K|K
Method PieceFunctionCall1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"PIECE")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"P")  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

/// 
/// summary values:,
/// summary=P&C&[P&C]
Method PieceFunctionCall2OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&[P&C]
	if '..isPunctuation(",",1) { quit 1 /* not found is OK */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..StarParameter(.subElement,.addedElement)  {
			if ..PieceFunctionCall3OptGrp(.subElement,.addedElement)  {
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
Method PieceFunctionCall3OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation(",",1) { quit 1 /* not found is OK */ }
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
	if '(..isKeywordInList($lb("PIECE","P"))) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..PieceFunctionCallSet1Sub(.subElement,.addedElement)  {
		if ..OpenBracket(.subElement,.addedElement)  {
			if ..SetValueExpression(.subElement,.addedElement)  {
				if ..addPunctuation(.subElement,",")  {
					if ..Expression(.subElement,.addedElement)  {
						if ..PieceFunctionCallSet2OptGrp(.subElement,.addedElement)  {
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 'piece' | 'p'
/// summary=K|K
Method PieceFunctionCallSet1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"PIECE")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"P")  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

/// 
/// summary values:,
/// summary=P&C&[P&C]
Method PieceFunctionCallSet2OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&[P&C]
	if '..isPunctuation(",",1) { quit 1 /* not found is OK */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..StarParameter(.subElement,.addedElement)  {
			if ..PieceFunctionCallSet3OptGrp(.subElement,.addedElement)  {
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
Method PieceFunctionCallSet3OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation(",",1) { quit 1 /* not found is OK */ }
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
	if '..isPunctuation(":",1) { quit 0 /* normal */ }
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  primary ::= number | string | macrocall | macro_expression | this_object | extrinsicfncall | intrinsicfncall | classexpr | variable | special_variable | Indirection | global_ref | ( sub_expression object_chain? ) | (cos_json object_chain?)
/// summary=C|C|C|C|C|C|C|C|C|C|C|C|(C&?4OptionalSingle4?)|(C&?4OptionalSingle4?)
Method Primary(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C|C|C|C|C|C|C|C|C|C|C|(C&?4OptionalSingle4?)|(C&?4OptionalSingle4?)
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
	} elseif ..Primary1Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Primary2Sub(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  sub_expression object_chain?
/// summary=C&?4OptionalSingle4?
Method Primary1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&?4OptionalSingle4?
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SubExpression(.subElement,.addedElement)  {
		if $s(..ObjectChain(.subElement,.addedElement) :1,1:1)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	quit ok
}

/// cos_json object_chain?
/// summary=C&?4OptionalSingle4?
Method Primary2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&?4OptionalSingle4?
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CosJson(.subElement,.addedElement)  {
		if $s(..ObjectChain(.subElement,.addedElement) :1,1:1)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	quit ok
}

///  print_command ::= 'print' post_conditional? [ lineref1 [ ':' lineref2 ] ]
/// summary values:PRINT
/// summary=K&?4OptionalSingle4?&[C&[P&C]]
Method PrintCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?4OptionalSingle4?&[C&[P&C]]
	if '(..isKeyword("PRINT")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"PRINT")  {
		if $s(..PostConditional(.subElement,.addedElement) :1,1:1)  {
			if ..PrintCommand1OptGrp(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=C&[P&C]
Method PrintCommand1OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&[P&C]
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Lineref1(.subElement,.addedElement)  {
		if ..PrintCommand2OptGrp(.subElement,.addedElement)  {
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
Method PrintCommand2OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation(":",1) { quit 1 /* not found is OK */ }
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
	if '(..isKeyword("SYSTEM")) { quit 0 /* normal */ }
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
		set ok=0
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
	if '(..isKeywordInList($lb("QUERY","Q"))) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..QueryFunctionCall1Sub(.subElement,.addedElement)  {
		if ..OpenBracket(.subElement,.addedElement)  {
			if ..Expression(.subElement,.addedElement)  {
				if ..QueryFunctionCall2OptGrp(.subElement,.addedElement)  {
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 'query' | 'q'
/// summary=K|K
Method QueryFunctionCall1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"QUERY")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"Q")  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

/// 
/// summary values:,
/// summary=P&C&[P&C]
Method QueryFunctionCall2OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&[P&C]
	if '..isPunctuation(",",1) { quit 1 /* not found is OK */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..Expression(.subElement,.addedElement)  {
			if ..QueryFunctionCall3OptGrp(.subElement,.addedElement)  {
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
Method QueryFunctionCall3OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation(",",1) { quit 1 /* not found is OK */ }
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

///  quit_command ::= ('quit' | 'q') post_conditional? [ naked | quit_expression ]
/// summary values:QUIT,Q
/// summary=(K|K)&?4OptionalSingle4?&[C|C]
Method QuitCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&?4OptionalSingle4?&[C|C]
	if '(..isKeywordInList($lb("QUIT","Q"))) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..QuitCommand1Sub(.subElement,.addedElement)  {
		if $s(..PostConditional(.subElement,.addedElement) :1,1:1)  {
			if ..QuitCommand2OptGrp(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 'quit' | 'q'
/// summary=K|K
Method QuitCommand1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"QUIT")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"Q")  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

/// 
/// summary=C|C
Method QuitCommand2OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	; method start
	if ..Naked(.subElement,.addedElement)  {
		; or
	} elseif ..QuitExpression(.subElement,.addedElement)  {
		; end compileRules
	}

	set ok=1
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
		set ok=0
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  read_command ::= ('read' | 'r') post_conditional? ','.read_argument+
/// summary values:READ,R
/// summary=(K|K)&?4OptionalSingle4?&.C.
Method ReadCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&?4OptionalSingle4?&.C.
	if '(..isKeywordInList($lb("READ","R"))) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ReadCommand1Sub(.subElement,.addedElement)  {
		if $s(..PostConditional(.subElement,.addedElement) :1,1:1)  {
			if ..ReadCommand2RepSep(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 'read' | 'r'
/// summary=K|K
Method ReadCommand1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"READ")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"R")  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

///  ','.read_argument+
Method ReadCommand2RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4String:4?
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set done=0 ; must be at least 1
	if ..ReadArgument(.subElement,.addedElement) {
		set done=1,ok=1 ; found 1
		do {
			$$$BNFSTART(repElement)
			set ok=(..addPunctuation(.repElement,",")  && ..ReadArgument(.repElement,.addedElement) )
			if ok {
				$$$BNFCOMMITCOPY(repElement,subElement)
			} else {
				$$$BNFROLLBACK(repElement)
			}
		} while ok
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	quit ok
}

///  read_format_character ::= '!' | '#' | ('?' expression) | ('/' read_keyword [ '(' read_keyword_parameter_list ')' ])
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
	} elseif ..ReadFormatCharacter1Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ReadFormatCharacter2Sub(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// '?' expression
/// summary values:?
/// summary=P&C
Method ReadFormatCharacter1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation("?",1) { quit 0 /* normal */ }
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
		set ok=0
	}
	quit ok
}

/// '/' read_keyword [ '(' read_keyword_parameter_list ')' ]
/// summary values:/
/// summary=P&C&[P&C&P]
Method ReadFormatCharacter2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&[P&C&P]
	if '..isPunctuation("/",1) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"/")  {
		if ..ReadKeyword(.subElement,.addedElement)  {
			if ..ReadFormatCharacter3OptGrp(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	quit ok
}

/// 
/// summary values:(
/// summary=P&C&P
Method ReadFormatCharacter3OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&P
	if '..isPunctuation("(",1) { quit 1 /* not found is OK */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if ..ReadKeywordParameterList(.subElement,.addedElement)  {
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
		set ok=0
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  read_keyword_parameter_list ::= ','.read_keyword_parameter+
/// summary=.C.
Method ReadKeywordParameterList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary .C.
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ReadKeywordParameterList1RepSep(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ','.read_keyword_parameter+
Method ReadKeywordParameterList1RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4String:4?
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set done=0 ; must be at least 1
	if ..ReadKeywordParameter(.subElement,.addedElement) {
		set done=1,ok=1 ; found 1
		do {
			$$$BNFSTART(repElement)
			set ok=(..addPunctuation(.repElement,",")  && ..ReadKeywordParameter(.repElement,.addedElement) )
			if ok {
				$$$BNFCOMMITCOPY(repElement,subElement)
			} else {
				$$$BNFROLLBACK(repElement)
			}
		} while ok
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
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
		if ..ReadLength1OptGrp(.subElement,.addedElement)  {
			if ..ReadLength2OptGrp(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary values:#
/// summary=P&C
Method ReadLength1OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation("#",1) { quit 1 /* not found is OK */ }
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
Method ReadLength2OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation(":",1) { quit 1 /* not found is OK */ }
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
		set ok=0
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
	if '..isPunctuation("*",1) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"*")  {
		if ..LvalueExpression(.subElement,.addedElement)  {
			if ..ReadSingleChar1OptGrp(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary values::
/// summary=P&C
Method ReadSingleChar1OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation(":",1) { quit 1 /* not found is OK */ }
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

///  return_command ::= ('return' | 'ret') post_conditional? [ naked | return_expression ]
/// summary values:RETURN,RET
/// summary=(K|K)&?4OptionalSingle4?&[C|C]
Method ReturnCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&?4OptionalSingle4?&[C|C]
	if '(..isKeywordInList($lb("RETURN","RET"))) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ReturnCommand1Sub(.subElement,.addedElement)  {
		if $s(..PostConditional(.subElement,.addedElement) :1,1:1)  {
			if ..ReturnCommand2OptGrp(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 'return' | 'ret'
/// summary=K|K
Method ReturnCommand1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"RETURN")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"RET")  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

/// 
/// summary=C|C
Method ReturnCommand2OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	; method start
	if ..Naked(.subElement,.addedElement)  {
		; or
	} elseif ..ReturnExpression(.subElement,.addedElement)  {
		; end compileRules
	}

	set ok=1
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  routine_env ::= '|' expression? '|'
/// summary values:|
/// summary=P&?4OptionalSingle4?&P
Method RoutineEnv(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?4OptionalSingle4?&P
	if '..isPunctuation("|",1) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"|")  {
		if $s(..Expression(.subElement,.addedElement) :1,1:1)  {
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
		set ok=0
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

	set ok=$s(done:1,1:0)
	$$$DEBUGMethodEnd
	quit ok
}

///  safeexpression_function_call ::= '##safeexpression' function_parameter_list
/// summary values:##SAFEEXPRESSION
/// summary=P&C
Method SafeexpressionFunctionCall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C
	if '..isStringSingle("##SAFEEXPRESSION",16) { quit 0 /* normal */ }
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  select_clause ::= select_clause_test ':' select_clause_value
/// summary=C&P&C
Method SelectClause(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&P&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SelectClauseTest(.subElement,.addedElement)  {
		if ..addPunctuation(.subElement,":")  {
			if ..SelectClauseValue(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  select_clause_list ::= ','.select_clause+
/// summary=.C.
Method SelectClauseList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary .C.
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SelectClauseList1RepSep(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ','.select_clause+
Method SelectClauseList1RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4String:4?
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set done=0 ; must be at least 1
	if ..SelectClause(.subElement,.addedElement) {
		set done=1,ok=1 ; found 1
		do {
			$$$BNFSTART(repElement)
			set ok=(..addPunctuation(.repElement,",")  && ..SelectClause(.repElement,.addedElement) )
			if ok {
				$$$BNFCOMMITCOPY(repElement,subElement)
			} else {
				$$$BNFROLLBACK(repElement)
			}
		} while ok
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	quit ok
}

///  select_clause_test ::= expression
/// summary=C
Method SelectClauseTest(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  select_clause_value ::= expression
/// summary=C
Method SelectClauseValue(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  select_function_call ::= ('select' | 's') '(' select_clause_list ')' object_chain?
/// summary values:SELECT,S
/// summary=(K|K)&P&C&P&?4OptionalSingle4?
Method SelectFunctionCall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&P&C&P&?4OptionalSingle4?
	if '(..isKeywordInList($lb("SELECT","S"))) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SelectFunctionCall1Sub(.subElement,.addedElement)  {
		if ..addPunctuation(.subElement,"(")  {
			if ..SelectClauseList(.subElement,.addedElement)  {
				if ..addPunctuation(.subElement,")")  {
					if $s(..ObjectChain(.subElement,.addedElement) :1,1:1)  {
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 'select' | 's'
/// summary=K|K
Method SelectFunctionCall1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"SELECT")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"S")  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

///  set_command ::= ('set' | 's') post_conditional? set_item_list
/// summary values:SET,S
/// summary=(K|K)&?4OptionalSingle4?&C
Method SetCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&?4OptionalSingle4?&C
	if '(..isKeywordInList($lb("SET","S"))) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SetCommand1Sub(.subElement,.addedElement)  {
		if $s(..PostConditional(.subElement,.addedElement) :1,1:1)  {
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 'set' | 's'
/// summary=K|K
Method SetCommand1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"SET")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"S")  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  set_item ::= (( set_value_expression | ('(' ','.set_value_expression+ ')' )) '=' set_expression) | simple_indirection
/// summary=((C|(P&.C.&P))&P&C)|C
Method SetItem(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ((C|(P&.C.&P))&P&C)|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SetItem1Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SimpleIndirection(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// ( set_value_expression | ('(' ','.set_value_expression+ ')' )) '=' set_expression
/// summary=(C|(P&.C.&P))&P&C
Method SetItem1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SetItem2Sub(.subElement,.addedElement)  {
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
		set ok=0
	}
	quit ok
}

///  set_value_expression | ('(' ','.set_value_expression+ ')' )
/// summary=C|(P&.C.&P)
Method SetItem2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|(P&.C.&P)
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SetValueExpression(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SetItem3Sub(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	quit ok
}

/// '(' ','.set_value_expression+ ')'
/// summary values:(
/// summary=P&.C.&P
Method SetItem3Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&.C.&P
	if '..isPunctuation("(",1) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if ..SetItem4RepSep(.subElement,.addedElement)  {
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
		set ok=0
	}
	quit ok
}

///  ','.set_value_expression+
Method SetItem4RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4String:4?
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set done=0 ; must be at least 1
	if ..SetValueExpression(.subElement,.addedElement) {
		set done=1,ok=1 ; found 1
		do {
			$$$BNFSTART(repElement)
			set ok=(..addPunctuation(.repElement,",")  && ..SetValueExpression(.repElement,.addedElement) )
			if ok {
				$$$BNFCOMMITCOPY(repElement,subElement)
			} else {
				$$$BNFROLLBACK(repElement)
			}
		} while ok
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	quit ok
}

///  set_item_list ::= ','.set_item+
/// summary=.C.
Method SetItemList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary .C.
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SetItemList1RepSep(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ','.set_item+
Method SetItemList1RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4String:4?
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set done=0 ; must be at least 1
	if ..SetItem(.subElement,.addedElement) {
		set done=1,ok=1 ; found 1
		do {
			$$$BNFSTART(repElement)
			set ok=(..addPunctuation(.repElement,",")  && ..SetItem(.repElement,.addedElement) )
			if ok {
				$$$BNFCOMMITCOPY(repElement,subElement)
			} else {
				$$$BNFROLLBACK(repElement)
			}
		} while ok
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  set_value_expression ::= this_object_set | variable_set | macrocall | Indirection | global_ref_set | intrinsicfncall_set | special_variable | ( '(' set_value_expression ')' object_chain? )
/// summary=C|C|C|C|C|C|C|(P&C&P&?4OptionalSingle4?)
Method SetValueExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C|C|C|C|C|C|(P&C&P&?4OptionalSingle4?)
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
	} elseif ..SetValueExpression1Sub(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  '(' set_value_expression ')' object_chain?
/// summary values:(
/// summary=P&C&P&?4OptionalSingle4?
Method SetValueExpression1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&P&?4OptionalSingle4?
	if '..isPunctuation("(",1) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if ..SetValueExpression(.subElement,.addedElement)  {
			if ..addPunctuation(.subElement,")")  {
				if $s(..ObjectChain(.subElement,.addedElement) :1,1:1)  {
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
		set ok=0
	}
	quit ok
}

///  Simple_Indirection ::= '@' term
/// summary values:@
/// summary=P&C
Method SimpleIndirection(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C
	if '..isPunctuation("@",1) { quit 0 /* normal */ }
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  special_intrinsic ::= case_function_call | select_function_call | extract_function_call | piece_function_call | get_function_call | data_function_call | order_function_call | listitem_function_call | listnext_function_call | listupdate_function_call | increment_function_call | method_function_call | classmethod_function_call | zobjmethod_function_call | zobjclassmethod_function_call | text_function_call | query_function_call | bitlogic_function_call | vector_function_call | locate_function_call
/// summary=C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C
Method SpecialIntrinsic(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C
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
	} elseif ..GetFunctionCall(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..DataFunctionCall(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OrderFunctionCall(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ListitemFunctionCall(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ListnextFunctionCall(.subElement,.addedElement)  {
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
		set done=1 ; or
	} elseif ..LocateFunctionCall(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  special_intrinsic_set ::= extract_function_call_set | piece_function_call_set | listitem_function_call_set | listbuild_function_call_set | vector_function_call_set | bit_function_call_set | mv_function_set
/// summary=C|C|C|C|C|C|C
Method SpecialIntrinsicSet(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C|C|C|C|C|C
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
	} elseif ..BitFunctionCallSet(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..MvFunctionSet(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  special_system ::= 'SYSTEM' ('.' object_member_identifier !'(' )* object_chain?
/// summary values:SYSTEM
/// summary=K&(?4punctuation:4?)*&?4OptionalSingle4?
Method SpecialSystem(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&(?4punctuation:4?)*&?4OptionalSingle4?
	if '(..isKeyword("SYSTEM")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"SYSTEM")  {
		if ..SpecialSystem1RepZero(.subElement,.addedElement)  {
			if $s(..ObjectChain(.subElement,.addedElement) :1,1:1)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ('.' object_member_identifier !'(' )*
Method SpecialSystem1RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	; method start
	while ..SpecialSystem2Sub(.subElement,.addedElement)  {
		;
	}
	set ok=1
	quit ok
}

/// '.' object_member_identifier !'('
/// summary values:.
/// summary=P&C&?4NotRule4?
Method SpecialSystem2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&?4NotRule4?
	if '..isPunctuation(".",1) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,".")  {
		if ..ObjectMemberIdentifier(.subElement,.addedElement)  {
			if '..addPunctuation(.subElement,"(")  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	quit ok
}

///  special_variable ::= '$' ('DEVICE' | 'ECODE' | 'EC' | 'ESTACK' | 'ES' | 'ETRAP' | 'ET' | 'HALT' | 'HOROLOG' | 'H' | 'IO' | 'I' | 'JOB' | 'J' | 'KEY' | 'MNV' | 'NAMESPACE' | 'PRINCIPAL' | 'P' | 'QUIT' | 'Q' | 'ROLES' | 'STACK' | 'STORAGE' | python_import | special_system | 'SY' | 'S' | 'TEST' | 'THIS' | 'THROWOBJ' | 'TLEVEL' | 'Tl' | 'T' | 'USERNAME' | 'X' | 'Y' | 'ZA' | 'ZB' | 'ZCHILD' | 'ZEOF' | 'ZEOS' | 'ZERROR' | 'ZE' | 'ZHOROLOG' | 'ZH' | 'ZIO' | 'ZJOB' | 'ZMODE' | 'ZNAME' | 'ZNSPACE' | 'ZN' | 'ZORDER' | 'ZPARENT' | 'ZPI' | 'ZPOS' | 'ZREFERENCE' | 'ZR' | 'ZSTORAGE' | 'ZS' | 'ZTIMESTAMP' | 'ZTS' | 'ZTIMEZONE' | 'ZTRAP' | 'ZT' | 'ZUTIL' | 'ZU' | 'ZVERSION' | 'ZV' | 'MVAM' | 'MVNV' | 'MVNAM' | 'MVANS' | 'MVCOMMAND' | 'MVCONV' | 'MVDATE' | 'MVDAY' | 'MVDICT' | 'MVFILENAME' | 'MVFM' | 'MVFM' | 'MVFORMAT' | 'MVHEADER' | 'MVID' | 'MVLEVEL' | 'MVMONTH' | 'MVNB' | 'MVND' | 'MVNI' | 'MVNS' | 'MVPARASENTENCE' | 'MVRECORD' | 'MVSELECTED' | 'MVSENTENCE' | 'MVSM' | 'MVSTDFIL' | 'MVSVM' | 'MVSYSRETCODE' | 'MVTIME' |'MVTM' | 'MVTTY' | 'MVUSERRETCODE' | 'MVVM' | 'MVYEAR' | 'MVERRORS' | 'MVFOOTER' | 'MVMORESUBVALUES' | 'MVMOREVALUES' | 'MVOPTIONS' | 'MVPROCERRORS' | 'MVPROCNAME' | 'MVPROCPIB' | 'MVPROCPIBOFF' | 'MVPROCPOB' | 'MVPROCSIB' | 'MVPROCSIBOFF' | 'MVPROCSOB' )
/// summary values:$
/// summary=P&(K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|C|C|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K)
Method SpecialVariable(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&(K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|C|C|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K)
	if '..isPunctuation("$",1) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"$")  {
		if ..SpecialVariable1Sub(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 'DEVICE' | 'ECODE' | 'EC' | 'ESTACK' | 'ES' | 'ETRAP' | 'ET' | 'HALT' | 'HOROLOG' | 'H' | 'IO' | 'I' | 'JOB' | 'J' | 'KEY' | 'MNV' | 'NAMESPACE' | 'PRINCIPAL' | 'P' | 'QUIT' | 'Q' | 'ROLES' | 'STACK' | 'STORAGE' | python_import | special_system | 'SY' | 'S' | 'TEST' | 'THIS' | 'THROWOBJ' | 'TLEVEL' | 'Tl' | 'T' | 'USERNAME' | 'X' | 'Y' | 'ZA' | 'ZB' | 'ZCHILD' | 'ZEOF' | 'ZEOS' | 'ZERROR' | 'ZE' | 'ZHOROLOG' | 'ZH' | 'ZIO' | 'ZJOB' | 'ZMODE' | 'ZNAME' | 'ZNSPACE' | 'ZN' | 'ZORDER' | 'ZPARENT' | 'ZPI' | 'ZPOS' | 'ZREFERENCE' | 'ZR' | 'ZSTORAGE' | 'ZS' | 'ZTIMESTAMP' | 'ZTS' | 'ZTIMEZONE' | 'ZTRAP' | 'ZT' | 'ZUTIL' | 'ZU' | 'ZVERSION' | 'ZV' | 'MVAM' | 'MVNV' | 'MVNAM' | 'MVANS' | 'MVCOMMAND' | 'MVCONV' | 'MVDATE' | 'MVDAY' | 'MVDICT' | 'MVFILENAME' | 'MVFM' | 'MVFM' | 'MVFORMAT' | 'MVHEADER' | 'MVID' | 'MVLEVEL' | 'MVMONTH' | 'MVNB' | 'MVND' | 'MVNI' | 'MVNS' | 'MVPARASENTENCE' | 'MVRECORD' | 'MVSELECTED' | 'MVSENTENCE' | 'MVSM' | 'MVSTDFIL' | 'MVSVM' | 'MVSYSRETCODE' | 'MVTIME' |'MVTM' | 'MVTTY' | 'MVUSERRETCODE' | 'MVVM' | 'MVYEAR' | 'MVERRORS' | 'MVFOOTER' | 'MVMORESUBVALUES' | 'MVMOREVALUES' | 'MVOPTIONS' | 'MVPROCERRORS' | 'MVPROCNAME' | 'MVPROCPIB' | 'MVPROCPIBOFF' | 'MVPROCPOB' | 'MVPROCSIB' | 'MVPROCSIBOFF' | 'MVPROCSOB'
/// summary=K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|C|C|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K
Method SpecialVariable1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|C|C|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K
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
	} elseif ..SpecialSystem(.subElement,.addedElement)  {
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
		set ok=0
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  sql_command ::= ('&sql(' | '&sqlcq(') sql_body (')qc' | ')')
/// summary values:&SQL(,&SQLCQ(
/// summary=(P|P)&C&(P|P)
Method SqlCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (P|P)&C&(P|P)
	if '..isStringSingle("&SQLCQ(",7),'..isStringSingle("&SQL(",5) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SqlCommand1Sub(.subElement,.addedElement)  {
		if ..SqlBody(.subElement,.addedElement)  {
			if ..SqlCommand2Sub(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// '&sql(' | '&sqlcq('
/// summary=P|P
Method SqlCommand1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	if ..addPunctuation(.subElement,"&sql(")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"&sqlcq(")  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

/// ')qc' | ')'
/// summary values:)QC,)
/// summary=P|P
Method SqlCommand2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P|P
	if '..isStringSingle(")QC",3),'..isPunctuation(")",1) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addPunctuation(.subElement,")qc")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,")")  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

///  star_parameter ::= ('*' expression?) | expression
/// summary=(P&?4OptionalSingle4?)|C
Method StarParameter(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (P&?4OptionalSingle4?)|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..StarParameter1Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Expression(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// '*' expression?
/// summary=P&?4OptionalSingle4?
Method StarParameter1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"*")  {
		if $s(..Expression(.subElement,.addedElement) :1,1:1)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
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
	} elseif ..String1Sub(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// '"' 'regexp:[^\"\r\n]*' '"'
/// summary values:""
/// summary=P&R&P
Method String1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&R&P
	if '..isPunctuation("""",2) { quit 0 /* normal */ }
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
		set ok=0
	}
	quit ok
}

///  sub_expression ::= '(' expression ')'
/// summary values:(
/// summary=P&C&P
Method SubExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&P
	if '..isPunctuation("(",1) { quit 0 /* normal */ }
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
		set ok=0
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
	if '..isPunctuation("@",1) { quit 0 /* normal */ }
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  subscript_parameter_list ::= '(' ','.expression+ ')'
/// summary values:(
/// summary=P&.C.&P
Method SubscriptParameterList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&.C.&P
	if '..isPunctuation("(",1) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if ..SubscriptParameterList1RepSep(.subElement,.addedElement)  {
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ','.expression+
Method SubscriptParameterList1RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4String:4?
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set done=0 ; must be at least 1
	if ..Expression(.subElement,.addedElement) {
		set done=1,ok=1 ; found 1
		do {
			$$$BNFSTART(repElement)
			set ok=(..addPunctuation(.repElement,",")  && ..Expression(.repElement,.addedElement) )
			if ok {
				$$$BNFCOMMITCOPY(repElement,subElement)
			} else {
				$$$BNFROLLBACK(repElement)
			}
		} while ok
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	quit ok
}

///  super_expression ::= '##super' function_parameter_list
/// summary values:##SUPER
/// summary=P&C
Method SuperExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C
	if '..isStringSingle("##SUPER",7) { quit 0 /* normal */ }
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  system_object ::='$' special_system
/// summary values:$
/// summary=P&C
Method SystemObject(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C
	if '..isPunctuation("$",1) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"$")  {
		if ..SpecialSystem(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  tcommit_command ::= ('tcommit' | 'tc') post_conditional?
/// summary values:TCOMMIT,TC
/// summary=(K|K)&?4OptionalSingle4?
Method TcommitCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&?4OptionalSingle4?
	if '(..isKeywordInList($lb("TCOMMIT","TC"))) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..TcommitCommand1Sub(.subElement,.addedElement)  {
		if $s(..PostConditional(.subElement,.addedElement) :1,1:1)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 'tcommit' | 'tc'
/// summary=K|K
Method TcommitCommand1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"TCOMMIT")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"TC")  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
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
		set ok=0
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

	set ok=$s(done:1,1:0)
	$$$DEBUGMethodEnd
	quit ok
}

///  text_function_call ::= ('text' | 't') open_bracket text_label_reference close_bracket
/// summary values:TEXT,T
/// summary=(K|K)&C&C&C
Method TextFunctionCall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&C&C&C
	if '(..isKeywordInList($lb("TEXT","T"))) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..TextFunctionCall1Sub(.subElement,.addedElement)  {
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 'text' | 't'
/// summary=K|K
Method TextFunctionCall1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"TEXT")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"T")  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
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
	if ..TextLabelReference1Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..TextLabelReference8Sub(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// ( (label_identifier [ '+' expression ]) | ('+' expression) | simple_indirection ) [ '^' [routine_env] ( routine_identifier | simple_indirection) ]
/// summary=((C&[P&C])|(P&C)|C)&[P&[C]&(C|C)]
Method TextLabelReference1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..TextLabelReference2Sub(.subElement,.addedElement)  {
		if ..TextLabelReference6OptGrp(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	quit ok
}

///  (label_identifier [ '+' expression ]) | ('+' expression) | simple_indirection
/// summary=(C&[P&C])|(P&C)|C
Method TextLabelReference2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary (C&[P&C])|(P&C)|C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..TextLabelReference3Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..TextLabelReference5Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SimpleIndirection(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	quit ok
}

/// label_identifier [ '+' expression ]
/// summary=C&[P&C]
Method TextLabelReference3Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&[P&C]
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LabelIdentifier(.subElement,.addedElement)  {
		if ..TextLabelReference4OptGrp(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	quit ok
}

/// 
/// summary values:+
/// summary=P&C
Method TextLabelReference4OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation("+",1) { quit 1 /* not found is OK */ }
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
Method TextLabelReference5Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation("+",1) { quit 0 /* normal */ }
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
		set ok=0
	}
	quit ok
}

/// 
/// summary values:^
/// summary=P&[C]&(C|C)
Method TextLabelReference6OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&[C]&(C|C)
	if '..isPunctuation("^",1) { quit 1 /* not found is OK */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"^")  {
		if $S(..RoutineEnv(.subElement,.addedElement) :1,1:1) {
			if ..TextLabelReference7Sub(.subElement,.addedElement)  {
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
Method TextLabelReference7Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..RoutineIdentifier(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SimpleIndirection(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

/// '^' [routine_env] (routine_identifier | simple_indirection)
/// summary values:^
/// summary=P&[C]&(C|C)
Method TextLabelReference8Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&[C]&(C|C)
	if '..isPunctuation("^",1) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"^")  {
		if $S(..RoutineEnv(.subElement,.addedElement) :1,1:1) {
			if ..TextLabelReference9Sub(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	quit ok
}

/// routine_identifier | simple_indirection
/// summary=C|C
Method TextLabelReference9Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..RoutineIdentifier(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SimpleIndirection(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
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

	set ok=$s(done:1,1:0)
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

	set ok=$s(done:1,1:0)
	$$$DEBUGMethodEnd
	quit ok
}

///  then_block ::= cos_code_block_curly | command_list_eol
/// summary=C|C
Method ThenBlock(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CosCodeBlockCurly(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CommandListEol(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
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
		set ok=0
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
	if '..isStringSingle("I%",2) { quit 0 /* normal */ }
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  this_object_self ::= ('..' | 'i%' | 'r%' | 'm%' | 's%') object_chain_no_dot?
/// summary values:..,I%,R%,M%,S%
/// summary=(P|P|P|P|P)&?4OptionalSingle4?
Method ThisObjectSelf(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (P|P|P|P|P)&?4OptionalSingle4?
	if '..isStringInList($lb("..","I%","R%","M%","S%"),2) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ThisObjectSelf1Sub(.subElement,.addedElement)  {
		if $s(..ObjectChainNoDot(.subElement,.addedElement) :1,1:1)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// '..' | 'i%' | 'r%' | 'm%' | 's%'
/// summary=P|P|P|P|P
Method ThisObjectSelf1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
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

	set ok=$s(done:1,1:0)
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  this_object_this ::= ('$this' | '##this') object_chain?
/// summary values:$THIS,##THIS
/// summary=(P|P)&?4OptionalSingle4?
Method ThisObjectThis(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (P|P)&?4OptionalSingle4?
	if '..isStringSingle("##THIS",6),'..isStringSingle("$THIS",5) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ThisObjectThis1Sub(.subElement,.addedElement)  {
		if $s(..ObjectChain(.subElement,.addedElement) :1,1:1)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// '$this' | '##this'
/// summary=P|P
Method ThisObjectThis1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	if ..addPunctuation(.subElement,"$this")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"##this")  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

///  throw_command ::= 'throw' post_conditional? [ naked | expression ]
/// summary values:THROW
/// summary=K&?4OptionalSingle4?&[C|C]
Method ThrowCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?4OptionalSingle4?&[C|C]
	if '(..isKeyword("THROW")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"THROW")  {
		if $s(..PostConditional(.subElement,.addedElement) :1,1:1)  {
			if ..ThrowCommand1OptGrp(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=C|C
Method ThrowCommand1OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	; method start
	if ..Naked(.subElement,.addedElement)  {
		; or
	} elseif ..Expression(.subElement,.addedElement)  {
		; end compileRules
	}

	set ok=1
	quit ok
}

///  trollback_command ::= 'trollback' post_conditional? '1'?
/// summary values:TROLLBACK
/// summary=K&?4OptionalSingle4?&?4OptionalSingle4?
Method TrollbackCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?4OptionalSingle4?&?4OptionalSingle4?
	if '(..isKeyword("TROLLBACK")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"TROLLBACK")  {
		if $s(..PostConditional(.subElement,.addedElement) :1,1:1)  {
			if $s(..addPunctuation(.subElement,"1") :1,1:1)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  try_command ::= 'try' cos_code_block_curly cos_directive* 'catch' [ variable | ( '(' variable ')' ) ] cos_code_block_curly
/// summary values:TRY
/// summary=K&C&(C)*&K&[C|(P&C&P)]&C
Method TryCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C&(C)*&K&[C|(P&C&P)]&C
	if '(..isKeyword("TRY")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"TRY")  {
		if ..CosCodeBlockCurly(.subElement,.addedElement)  {
			if ..TryCommand1RepZero(.subElement,.addedElement)  {
				if ..addKeyword(.subElement,"CATCH")  {
					if ..TryCommand2OptGrp(.subElement,.addedElement)  {
						if ..CosCodeBlockCurly(.subElement,.addedElement)  {
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  cos_directive*
Method TryCommand1RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C
	set subElement=ParentElement
	; method start
	while ..CosDirective(.subElement,.addedElement)  {
		;
	}
	set ok=1
	quit ok
}

/// 
/// summary=C|(P&C&P)
Method TryCommand2OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|(P&C&P)
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Variable(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..TryCommand3Sub(.subElement,.addedElement)  {
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
Method TryCommand3Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&P
	if '..isPunctuation("(",1) { quit 0 /* normal */ }
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
		set ok=0
	}
	quit ok
}

///  tstart_command ::= ('tstart' | 'ts' ) post_conditional?
/// summary values:TSTART,TS
/// summary=(K|K)&?4OptionalSingle4?
Method TstartCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&?4OptionalSingle4?
	if '(..isKeywordInList($lb("TSTART","TS"))) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..TstartCommand1Sub(.subElement,.addedElement)  {
		if $s(..PostConditional(.subElement,.addedElement) :1,1:1)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 'tstart' | 'ts'
/// summary=K|K
Method TstartCommand1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"TSTART")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"TS")  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

///  use_argument ::= use_device [ ':' ( use_device_parameters_inbrackets | use_device_parameter_list ) ] [ ':' use_mnemonic_space ]
/// summary=C&[P&(C|C)]&[P&C]
Method UseArgument(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&[P&(C|C)]&[P&C]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..UseDevice(.subElement,.addedElement)  {
		if ..UseArgument1OptGrp(.subElement,.addedElement)  {
			if ..UseArgument3OptGrp(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary values::
/// summary=P&(C|C)
Method UseArgument1OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&(C|C)
	if '..isPunctuation(":",1) { quit 1 /* not found is OK */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,":")  {
		if ..UseArgument2Sub(.subElement,.addedElement)  {
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

///  use_device_parameters_inbrackets | use_device_parameter_list
/// summary=C|C
Method UseArgument2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..UseDeviceParametersInbrackets(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..UseDeviceParameterList(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

/// 
/// summary values::
/// summary=P&C
Method UseArgument3OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation(":",1) { quit 1 /* not found is OK */ }
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

///  use_argument_list ::= ','.use_argument+
/// summary=.C.
Method UseArgumentList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary .C.
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..UseArgumentList1RepSep(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ','.use_argument+
Method UseArgumentList1RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4String:4?
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set done=0 ; must be at least 1
	if ..UseArgument(.subElement,.addedElement) {
		set done=1,ok=1 ; found 1
		do {
			$$$BNFSTART(repElement)
			set ok=(..addPunctuation(.repElement,",")  && ..UseArgument(.repElement,.addedElement) )
			if ok {
				$$$BNFCOMMITCOPY(repElement,subElement)
			} else {
				$$$BNFROLLBACK(repElement)
			}
		} while ok
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	quit ok
}

///  use_command ::= ('use' | 'u') post_conditional? use_argument_list
/// summary values:USE,U
/// summary=(K|K)&?4OptionalSingle4?&C
Method UseCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&?4OptionalSingle4?&C
	if '(..isKeywordInList($lb("USE","U"))) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..UseCommand1Sub(.subElement,.addedElement)  {
		if $s(..PostConditional(.subElement,.addedElement) :1,1:1)  {
			if ..UseArgumentList(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 'use' | 'u'
/// summary=K|K
Method UseCommand1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"USE")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"U")  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  use_device_parameter ::= ('/' identifier [ '=' expression ] ) | expression
/// summary=(P&C&[P&C])|C
Method UseDeviceParameter(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (P&C&[P&C])|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..UseDeviceParameter1Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Expression(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// '/' identifier [ '=' expression ]
/// summary=P&C&[P&C]
Method UseDeviceParameter1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"/")  {
		if ..Identifier(.subElement,.addedElement)  {
			if ..UseDeviceParameter2OptGrp(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	quit ok
}

/// 
/// summary values:=
/// summary=P&C
Method UseDeviceParameter2OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation("=",1) { quit 1 /* not found is OK */ }
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

///  use_device_parameter_list ::= [use_device_parameter] ( ':' [use_device_parameter] )*
/// summary=[C]&(?4punctuation:4?)*
Method UseDeviceParameterList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary [C]&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..UseDeviceParameter(.subElement,.addedElement) :1,1:1) {
		if ..UseDeviceParameterList1RepZero(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ( ':' [use_device_parameter] )*
Method UseDeviceParameterList1RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	; method start
	while ..UseDeviceParameterList2Sub(.subElement,.addedElement)  {
		;
	}
	set ok=1
	quit ok
}

///  ':' [use_device_parameter]
/// summary values::
/// summary=P&[C]
Method UseDeviceParameterList2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&[C]
	if '..isPunctuation(":",1) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,":")  {
		if $S(..UseDeviceParameter(.subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	quit ok
}

///  use_device_parameters_inbrackets ::= '(' use_device_parameter_list ')'
/// summary values:(
/// summary=P&C&P
Method UseDeviceParametersInbrackets(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&P
	if '..isPunctuation("(",1) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if ..UseDeviceParameterList(.subElement,.addedElement)  {
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
		set ok=0
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  variable ::= variable_identifier array_parameter_list? object_chain?
/// summary=C&?4OptionalSingle4?&?4OptionalSingle4?
Method Variable(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&?4OptionalSingle4?&?4OptionalSingle4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..VariableIdentifier(.subElement,.addedElement)  {
		if $s(..ArrayParameterList(.subElement,.addedElement) :1,1:1)  {
			if $s(..ObjectChain(.subElement,.addedElement) :1,1:1)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
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

	set ok=$s(done:1,1:0)
	$$$DEBUGMethodEnd
	quit ok
}

///  variable_nodef ::= variable_identifier array_parameter_list? object_chain?
/// summary=C&?4OptionalSingle4?&?4OptionalSingle4?
Method VariableNodef(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&?4OptionalSingle4?&?4OptionalSingle4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..VariableIdentifier(.subElement,.addedElement)  {
		if $s(..ArrayParameterList(.subElement,.addedElement) :1,1:1)  {
			if $s(..ObjectChain(.subElement,.addedElement) :1,1:1)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  variable_set ::= variable_identifier array_parameter_list? object_chain?
/// summary=C&?4OptionalSingle4?&?4OptionalSingle4?
Method VariableSet(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&?4OptionalSingle4?&?4OptionalSingle4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..VariableIdentifier(.subElement,.addedElement)  {
		if $s(..ArrayParameterList(.subElement,.addedElement) :1,1:1)  {
			if $s(..ObjectChain(.subElement,.addedElement) :1,1:1)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
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
	if '(..isKeyword("VECTOR")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"VECTOR")  {
		if ..OpenBracket(.subElement,.addedElement)  {
			if ..Expression(.subElement,.addedElement)  {
				if ..VectorFunctionCall1OptGrp(.subElement,.addedElement)  {
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary values:,
/// summary=P&C&[P&C]
Method VectorFunctionCall1OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&[P&C]
	if '..isPunctuation(",",1) { quit 1 /* not found is OK */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..StarParameter(.subElement,.addedElement)  {
			if ..VectorFunctionCall2OptGrp(.subElement,.addedElement)  {
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
Method VectorFunctionCall2OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation(",",1) { quit 1 /* not found is OK */ }
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
	if '(..isKeyword("VECTOR")) { quit 0 /* normal */ }
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
		set ok=0
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  view_command ::= ('view' | 'v') post_conditional? ( view_offset_form | view_block_form )
/// summary values:VIEW,V
/// summary=(K|K)&?4OptionalSingle4?&(C|C)
Method ViewCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&?4OptionalSingle4?&(C|C)
	if '(..isKeywordInList($lb("VIEW","V"))) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ViewCommand1Sub(.subElement,.addedElement)  {
		if $s(..PostConditional(.subElement,.addedElement) :1,1:1)  {
			if ..ViewCommand2Sub(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 'view' | 'v'
/// summary=K|K
Method ViewCommand1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"VIEW")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"V")  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

///  view_offset_form | view_block_form
/// summary=C|C
Method ViewCommand2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..ViewOffsetForm(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ViewBlockForm(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
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
		set ok=0
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
		set ok=0
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
		set ok=0
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
		set ok=0
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  while_command ::= 'while' expression_list cos_code_block_curly
/// summary values:WHILE
/// summary=K&C&C
Method WhileCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C&C
	if '(..isKeyword("WHILE")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"WHILE")  {
		if ..ExpressionList(.subElement,.addedElement)  {
			if ..CosCodeBlockCurly(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  write_argument ::= expression | write_control_expression_list
/// summary=C|C
Method WriteArgument(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  write_argument_list ::= ','.write_argument+
/// summary=.C.
Method WriteArgumentList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary .C.
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..WriteArgumentList1RepSep(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ','.write_argument+
Method WriteArgumentList1RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4String:4?
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set done=0 ; must be at least 1
	if ..WriteArgument(.subElement,.addedElement) {
		set done=1,ok=1 ; found 1
		do {
			$$$BNFSTART(repElement)
			set ok=(..addPunctuation(.repElement,",")  && ..WriteArgument(.repElement,.addedElement) )
			if ok {
				$$$BNFCOMMITCOPY(repElement,subElement)
			} else {
				$$$BNFROLLBACK(repElement)
			}
		} while ok
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  write_command ::= ('write' | 'w') post_conditional? ( naked | write_argument_list )
/// summary values:WRITE,W
/// summary=(K|K)&?4OptionalSingle4?&(C|C)
Method WriteCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&?4OptionalSingle4?&(C|C)
	if '(..isKeywordInList($lb("WRITE","W"))) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..WriteCommand1Sub(.subElement,.addedElement)  {
		if $s(..PostConditional(.subElement,.addedElement) :1,1:1)  {
			if ..WriteCommand2Sub(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 'write' | 'w'
/// summary=K|K
Method WriteCommand1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"WRITE")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"W")  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

///  naked | write_argument_list
/// summary=C|C
Method WriteCommand2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..Naked(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..WriteArgumentList(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  write_control_expression_list ::= write_control_expression write_control_expression*
/// summary=C&(C)*
Method WriteControlExpressionList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&(C)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..WriteControlExpression(.subElement,.addedElement)  {
		if ..WriteControlExpressionList1RepZero(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  write_control_expression*
Method WriteControlExpressionList1RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C
	set subElement=ParentElement
	; method start
	while ..WriteControlExpression(.subElement,.addedElement)  {
		;
	}
	set ok=1
	quit ok
}

///  write_device_expression ::= '*-' expression
/// summary values:*-
/// summary=P&C
Method WriteDeviceExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C
	if '..isPunctuation("*-",2) { quit 0 /* normal */ }
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
		set ok=0
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
	if '..isPunctuation("*",1) { quit 0 /* normal */ }
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
		set ok=0
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
		set ok=0
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  write_mnemonic_expression ::= '/' identifier [ '(' write_mnemonic_list ')' ]
/// summary values:/
/// summary=P&C&[P&C&P]
Method WriteMnemonicExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&[P&C&P]
	if '..isPunctuation("/",1) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"/")  {
		if ..Identifier(.subElement,.addedElement)  {
			if ..WriteMnemonicExpression1OptGrp(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary values:(
/// summary=P&C&P
Method WriteMnemonicExpression1OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&P
	if '..isPunctuation("(",1) { quit 1 /* not found is OK */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if ..WriteMnemonicList(.subElement,.addedElement)  {
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

///  write_mnemonic_list ::= ','.expression+
/// summary=.C.
Method WriteMnemonicList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary .C.
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..WriteMnemonicList1RepSep(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ','.expression+
Method WriteMnemonicList1RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4String:4?
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set done=0 ; must be at least 1
	if ..Expression(.subElement,.addedElement) {
		set done=1,ok=1 ; found 1
		do {
			$$$BNFSTART(repElement)
			set ok=(..addPunctuation(.repElement,",")  && ..Expression(.repElement,.addedElement) )
			if ok {
				$$$BNFCOMMITCOPY(repElement,subElement)
			} else {
				$$$BNFROLLBACK(repElement)
			}
		} while ok
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	quit ok
}

///  write_pos_expression ::= '?' expression
/// summary values:?
/// summary=P&C
Method WritePosExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C
	if '..isPunctuation("?",1) { quit 0 /* normal */ }
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  xecute_arg ::= ( xecute_arg_with_params | xecute_arg_no_params ) post_conditional?
/// summary=(C|C)&?4OptionalSingle4?
Method XecuteArg(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (C|C)&?4OptionalSingle4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XecuteArg1Sub(.subElement,.addedElement)  {
		if $s(..PostConditional(.subElement,.addedElement) :1,1:1)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  xecute_arg_with_params | xecute_arg_no_params
/// summary=C|C
Method XecuteArg1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	if ..XecuteArgWithParams(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..XecuteArgNoParams(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

///  xecute_arg_list ::= ','.xecute_arg+
/// summary=.C.
Method XecuteArgList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary .C.
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XecuteArgList1RepSep(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ','.xecute_arg+
Method XecuteArgList1RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4String:4?
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set done=0 ; must be at least 1
	if ..XecuteArg(.subElement,.addedElement) {
		set done=1,ok=1 ; found 1
		do {
			$$$BNFSTART(repElement)
			set ok=(..addPunctuation(.repElement,",")  && ..XecuteArg(.repElement,.addedElement) )
			if ok {
				$$$BNFCOMMITCOPY(repElement,subElement)
			} else {
				$$$BNFROLLBACK(repElement)
			}
		} while ok
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  xecute_arg_with_params ::= '(' xecute_command_text ',' xecute_parameter_list ')'
/// summary values:(
/// summary=P&C&P&C&P
Method XecuteArgWithParams(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&P&C&P
	if '..isPunctuation("(",1) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if ..XecuteCommandText(.subElement,.addedElement)  {
			if ..addPunctuation(.subElement,",")  {
				if ..XecuteParameterList(.subElement,.addedElement)  {
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  xecute_command ::= ( 'xecute' | 'x') post_conditional? xecute_arg_list
/// summary values:XECUTE,X
/// summary=(K|K)&?4OptionalSingle4?&C
Method XecuteCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&?4OptionalSingle4?&C
	if '(..isKeywordInList($lb("XECUTE","X"))) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XecuteCommand1Sub(.subElement,.addedElement)  {
		if $s(..PostConditional(.subElement,.addedElement) :1,1:1)  {
			if ..XecuteArgList(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  'xecute' | 'x'
/// summary=K|K
Method XecuteCommand1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"XECUTE")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"X")  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
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
		set ok=0
	}
	$$$DEBUGMethodEnd
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
	if ..XecuteParameter1Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Expression(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// '.' variable
/// summary=P&C
Method XecuteParameter1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
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
		set ok=0
	}
	quit ok
}

///  xecute_parameter_list ::= ','.xecute_parameter+
/// summary=.C.
Method XecuteParameterList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary .C.
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..XecuteParameterList1RepSep(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ','.xecute_parameter+
Method XecuteParameterList1RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4String:4?
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set done=0 ; must be at least 1
	if ..XecuteParameter(.subElement,.addedElement) {
		set done=1,ok=1 ; found 1
		do {
			$$$BNFSTART(repElement)
			set ok=(..addPunctuation(.repElement,",")  && ..XecuteParameter(.repElement,.addedElement) )
			if ok {
				$$$BNFCOMMITCOPY(repElement,subElement)
			} else {
				$$$BNFROLLBACK(repElement)
			}
		} while ok
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	quit ok
}

///  zbreak_command ::= ('zbreak' | 'zb') post_conditional? [ (('/' identifier) | '$') [ ':' ( identifier | string ) [ ':' expression [ ':' expression ] ] ] ]
/// summary values:ZBREAK,ZB
/// summary=(K|K)&?4OptionalSingle4?&[((P&C)|P)&[P&(C|C)&[P&C&[P&C]]]]
Method ZbreakCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&?4OptionalSingle4?&[((P&C)|P)&[P&(C|C)&[P&C&[P&C]]]]
	if '(..isKeywordInList($lb("ZBREAK","ZB"))) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ZbreakCommand1Sub(.subElement,.addedElement)  {
		if $s(..PostConditional(.subElement,.addedElement) :1,1:1)  {
			if ..ZbreakCommand2OptGrp(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 'zbreak' | 'zb'
/// summary=K|K
Method ZbreakCommand1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"ZBREAK")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"ZB")  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

/// 
/// summary=((P&C)|P)&[P&(C|C)&[P&C&[P&C]]]
Method ZbreakCommand2OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ((P&C)|P)&[P&(C|C)&[P&C&[P&C]]]
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ZbreakCommand3Sub(.subElement,.addedElement)  {
		if ..ZbreakCommand5OptGrp(.subElement,.addedElement)  {
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
Method ZbreakCommand3Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary (P&C)|P
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ZbreakCommand4Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"$")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	quit ok
}

/// '/' identifier
/// summary values:/
/// summary=P&C
Method ZbreakCommand4Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation("/",1) { quit 0 /* normal */ }
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
		set ok=0
	}
	quit ok
}

/// 
/// summary values::
/// summary=P&(C|C)&[P&C&[P&C]]
Method ZbreakCommand5OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&(C|C)&[P&C&[P&C]]
	if '..isPunctuation(":",1) { quit 1 /* not found is OK */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,":")  {
		if ..ZbreakCommand6Sub(.subElement,.addedElement)  {
			if ..ZbreakCommand7OptGrp(.subElement,.addedElement)  {
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
Method ZbreakCommand6Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..Identifier(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..String(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

/// 
/// summary values::
/// summary=P&C&[P&C]
Method ZbreakCommand7OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&[P&C]
	if '..isPunctuation(":",1) { quit 1 /* not found is OK */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,":")  {
		if ..Expression(.subElement,.addedElement)  {
			if ..ZbreakCommand8OptGrp(.subElement,.addedElement)  {
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
Method ZbreakCommand8OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation(":",1) { quit 1 /* not found is OK */ }
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

///  zinsert_command ::= 'zinsert'
/// summary values:ZINSERT
/// summary=K
Method ZinsertCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeyword("ZINSERT")) { quit 0 /* normal */ }
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  zkill_command ::= ('zkill' | 'zk') post_conditional? kill_parameter_list?
/// summary values:ZKILL,ZK
/// summary=(K|K)&?4OptionalSingle4?&?4OptionalSingle4?
Method ZkillCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&?4OptionalSingle4?&?4OptionalSingle4?
	if '(..isKeywordInList($lb("ZKILL","ZK"))) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ZkillCommand1Sub(.subElement,.addedElement)  {
		if $s(..PostConditional(.subElement,.addedElement) :1,1:1)  {
			if $s(..KillParameterList(.subElement,.addedElement) :1,1:1)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 'zkill' | 'zk'
/// summary=K|K
Method ZkillCommand1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"ZKILL")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"ZK")  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

///  zload_command ::= 'zload'
/// summary values:ZLOAD
/// summary=K
Method ZloadCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeyword("ZLOAD")) { quit 0 /* normal */ }
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  znspace_command ::= ('znspace'|'zn') post_conditional? expression
/// summary values:ZNSPACE,ZN
/// summary=(K|K)&?4OptionalSingle4?&C
Method ZnspaceCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&?4OptionalSingle4?&C
	if '(..isKeywordInList($lb("ZNSPACE","ZN"))) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ZnspaceCommand1Sub(.subElement,.addedElement)  {
		if $s(..PostConditional(.subElement,.addedElement) :1,1:1)  {
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 'znspace'|'zn'
/// summary=K|K
Method ZnspaceCommand1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"ZNSPACE")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"ZN")  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

///  zobjclassmethod_function_call ::= 'zobjclassmethod' open_bracket classmethod_class ',' classmethod_method [ ',' function_parameter_list_items ] close_bracket object_chain?
/// summary values:ZOBJCLASSMETHOD
/// summary=K&C&C&P&C&[P&C]&C&?4OptionalSingle4?
Method ZobjclassmethodFunctionCall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C&C&P&C&[P&C]&C&?4OptionalSingle4?
	if '(..isKeyword("ZOBJCLASSMETHOD")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"ZOBJCLASSMETHOD")  {
		if ..OpenBracket(.subElement,.addedElement)  {
			if ..ClassmethodClass(.subElement,.addedElement)  {
				if ..addPunctuation(.subElement,",")  {
					if ..ClassmethodMethod(.subElement,.addedElement)  {
						if ..ZobjclassmethodFunctionCall1OptGrp(.subElement,.addedElement)  {
							if ..CloseBracket(.subElement,.addedElement)  {
								if $s(..ObjectChain(.subElement,.addedElement) :1,1:1)  {
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary values:,
/// summary=P&C
Method ZobjclassmethodFunctionCall1OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation(",",1) { quit 1 /* not found is OK */ }
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

///  zobjmethod_function_call ::= 'zobjmethod' open_bracket classmethod_class ',' classmethod_method [ ',' function_parameter_list_items ] close_bracket object_chain?
/// summary values:ZOBJMETHOD
/// summary=K&C&C&P&C&[P&C]&C&?4OptionalSingle4?
Method ZobjmethodFunctionCall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C&C&P&C&[P&C]&C&?4OptionalSingle4?
	if '(..isKeyword("ZOBJMETHOD")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"ZOBJMETHOD")  {
		if ..OpenBracket(.subElement,.addedElement)  {
			if ..ClassmethodClass(.subElement,.addedElement)  {
				if ..addPunctuation(.subElement,",")  {
					if ..ClassmethodMethod(.subElement,.addedElement)  {
						if ..ZobjmethodFunctionCall1OptGrp(.subElement,.addedElement)  {
							if ..CloseBracket(.subElement,.addedElement)  {
								if $s(..ObjectChain(.subElement,.addedElement) :1,1:1)  {
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary values:,
/// summary=P&C
Method ZobjmethodFunctionCall1OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation(",",1) { quit 1 /* not found is OK */ }
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

///  zprint_command ::= 'zprint' post_conditional? [ lineref1 [ ':' lineref2 ] ]
/// summary values:ZPRINT
/// summary=K&?4OptionalSingle4?&[C&[P&C]]
Method ZprintCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?4OptionalSingle4?&[C&[P&C]]
	if '(..isKeyword("ZPRINT")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"ZPRINT")  {
		if $s(..PostConditional(.subElement,.addedElement) :1,1:1)  {
			if ..ZprintCommand1OptGrp(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=C&[P&C]
Method ZprintCommand1OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&[P&C]
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Lineref1(.subElement,.addedElement)  {
		if ..ZprintCommand2OptGrp(.subElement,.addedElement)  {
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
Method ZprintCommand2OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation(":",1) { quit 1 /* not found is OK */ }
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
	if '(..isKeyword("ZQUIT")) { quit 0 /* normal */ }
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
		set ok=0
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
	if '(..isKeyword("ZREMOVE")) { quit 0 /* normal */ }
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
		set ok=0
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
	if '(..isKeyword("ZSAVE")) { quit 0 /* normal */ }
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  zsync_command ::= 'zsync' post_conditional?
/// summary values:ZSYNC
/// summary=K&?4OptionalSingle4?
Method ZsyncCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?4OptionalSingle4?
	if '(..isKeyword("ZSYNC")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"ZSYNC")  {
		if $s(..PostConditional(.subElement,.addedElement) :1,1:1)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ztrap_command ::= ('ztrap' | 'zt') post_conditional? [ naked | expression ]
/// summary values:ZTRAP,ZT
/// summary=(K|K)&?4OptionalSingle4?&[C|C]
Method ZtrapCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&?4OptionalSingle4?&[C|C]
	if '(..isKeywordInList($lb("ZTRAP","ZT"))) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ZtrapCommand1Sub(.subElement,.addedElement)  {
		if $s(..PostConditional(.subElement,.addedElement) :1,1:1)  {
			if ..ZtrapCommand2OptGrp(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 'ztrap' | 'zt'
/// summary=K|K
Method ZtrapCommand1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"ZTRAP")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"ZT")  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

/// 
/// summary=C|C
Method ZtrapCommand2OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	; method start
	if ..Naked(.subElement,.addedElement)  {
		; or
	} elseif ..Expression(.subElement,.addedElement)  {
		; end compileRules
	}

	set ok=1
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  zwrite_argument_list ::= ','.zwrite_argument+
/// summary=.C.
Method ZwriteArgumentList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary .C.
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ZwriteArgumentList1RepSep(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ','.zwrite_argument+
Method ZwriteArgumentList1RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4String:4?
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set done=0 ; must be at least 1
	if ..ZwriteArgument(.subElement,.addedElement) {
		set done=1,ok=1 ; found 1
		do {
			$$$BNFSTART(repElement)
			set ok=(..addPunctuation(.repElement,",")  && ..ZwriteArgument(.repElement,.addedElement) )
			if ok {
				$$$BNFCOMMITCOPY(repElement,subElement)
			} else {
				$$$BNFROLLBACK(repElement)
			}
		} while ok
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	quit ok
}

///  zwrite_command ::= ( 'zwrite' | 'zw' ) post_conditional? ( naked | zwrite_argument_list )
/// summary values:ZWRITE,ZW
/// summary=(K|K)&?4OptionalSingle4?&(C|C)
Method ZwriteCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K|K)&?4OptionalSingle4?&(C|C)
	if '(..isKeywordInList($lb("ZWRITE","ZW"))) { quit 0 /* normal */ /*1*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ZwriteCommand1Sub(.subElement,.addedElement)  {
		if $s(..PostConditional(.subElement,.addedElement) :1,1:1)  {
			if ..ZwriteCommand2Sub(.subElement,.addedElement)  {
				set done=1 ; end compileRules
			}
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  'zwrite' | 'zw'
/// summary=K|K
Method ZwriteCommand1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"ZWRITE")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"ZW")  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

///  naked | zwrite_argument_list
/// summary=C|C
Method ZwriteCommand2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..Naked(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ZwriteArgumentList(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
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
		if ..ZzCommand1Sub(.subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// naked | expression_list
/// summary=C|C
Method ZzCommand1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..Naked(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ExpressionList(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

///  ZZ_COMMAND_WORD ::= 'ZZ'
/// summary values:ZZ
/// summary=K
Method ZzCommandWord(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeyword("ZZ")) { quit 0 /* normal */ }
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  zzdump_command ::= 'zzdump' post_conditional? expression
/// summary values:ZZDUMP
/// summary=K&?4OptionalSingle4?&C
Method ZzdumpCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?4OptionalSingle4?&C
	if '(..isKeyword("ZZDUMP")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"ZZDUMP")  {
		if $s(..PostConditional(.subElement,.addedElement) :1,1:1)  {
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  zzwrite_command ::= 'zzwrite' post_conditional? expression
/// summary values:ZZWRITE
/// summary=K&?4OptionalSingle4?&C
Method ZzwriteCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?4OptionalSingle4?&C
	if '(..isKeyword("ZZWRITE")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"ZZWRITE")  {
		if $s(..PostConditional(.subElement,.addedElement) :1,1:1)  {
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

Method newElement(Type As %String) As PXW.DEV.BNF.Elements.COS
{
	quit ##class(PXW.DEV.BNF.Elements.COS).%New(Type)
}

}
