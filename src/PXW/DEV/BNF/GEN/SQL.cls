/// Created: 2024-10-26 12:15:58 PXW.DEV.BNF.Compilers.Compiler1
Class PXW.DEV.BNF.GEN.SQL Extends PXW.DEV.BNF.super [ ProcedureBlock ]
{

Parameter KeywordPattern = "1.A";

Parameter Keywords = "ALL,AND,AS,ASC,AVG,BETWEEN,BOTH,BY,CALL,CASE,CAST,CLOSE,COUNT,CROSS,CURRENT,CURSOR,D,DATEADD,DATEDIFF,DATENAME,DATEPART,DAY,DAYOFYEAR,DD,DECLARE,DELETE,DESC,DISTINCT,DW,DY,E,ELSE,END,ESCAPE,EXECUTE,EXISTS,FETCH,FN,FOLLOWING,FOR,FROM,FULL,GROUP,H,HAVING,HH,HOUR,IN,INNER,INSERT,INTO,IS,JOIN,LEADING,LEFT,LIKE,LIST,M,MAX,MI,MILLISECOND,MIN,MINUTE,MM,MONTH,MS,N,NATURAL,NOT,NULL,ON,ONLY,OPEN,OR,ORDER,OUTER,OVER,PARTITION,PRECEDING,Q,QQ,QUARTER,READ,REFERENCES,RIGHT,ROW,ROWS,S,SECOND,SELECT,SET,SIZE,SOME,SQLTIMESTAMP,SS,STS,SUM,THEN,TOP,TRAILING,TRIM,UNBOUNDED,UNION,UPDATE,USING,VALUES,W,WEEK,WEEKDAY,WHEN,WHERE,WITH,WK,WW,Y,YEAR,YY,YYYY";

///  alias_name ::= identifier
/// summary=C
Method AliasName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Identifier(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
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
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  as_clause ::= [ 'AS' ] column_name
/// summary=[K]&C
Method AsClause(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary [K]&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..addKeyword(subElement,"AS") :1,1:1) {
		if ..ColumnName(subElement,.addedElement)  {
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

///  call_command ::= 'CALL' stored_proc_call
/// summary values:CALL
/// summary=K&C
Method CallCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C
	; first rule summary K
	if '(..isKeywordInList($lb("CALL"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"CALL")  {
		if ..StoredProcCall(subElement,.addedElement)  {
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

///  CHECKPRIV_command ::= '%CHECKPRIV' checkpriv_objpriv [ '(' column_name ( ',' column_name)* ')' ] 'ON' table_reference
/// summary values:%CHECKPRIV
/// summary=P&C&[P&C&(?4punctuation:4?)*&P]&K&C
Method CheckprivCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&[P&C&(?4punctuation:4?)*&P]&K&C
	; first rule summary P
	if '(..isStringSingle("%CHECKPRIV",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"%CHECKPRIV")  {
		if ..CheckprivObjpriv(subElement,.addedElement)  {
			if ..CheckprivCommand70OptGrp(subElement,.addedElement)  {
				if ..addKeyword(subElement,"ON")  {
					if ..TableReference(subElement,.addedElement)  {
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
/// summary values:(
/// summary=P&C&(?4punctuation:4?)*&P
Method CheckprivCommand70OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&(?4punctuation:4?)*&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"(")  {
		if ..ColumnName(subElement,.addedElement)  {
			if ..CheckprivCommand71RepZero(subElement,.addedElement)  {
				if ..addPunctuation(subElement,")")  {
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
		set ok=1 /* failure rollsback but returns OK */
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ( ',' column_name)*
Method CheckprivCommand71RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..CheckprivCommand72Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' column_name
/// summary values:,
/// summary=P&C
Method CheckprivCommand72Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..ColumnName(subElement,.addedElement)  {
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
	$$$DEBUGMethodEnd
	quit ok
}

///  checkpriv_objpriv ::= '%ALTER' | 'DELETE' | 'SELECT' | 'INSERT' | 'UPDATE' | 'EXECUTE' | 'REFERENCES'
/// summary=P|K|K|K|K|K|K
Method CheckprivObjpriv(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|K|K|K|K|K|K
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"%ALTER")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"DELETE")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"SELECT")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"INSERT")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"UPDATE")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"EXECUTE")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"REFERENCES")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  close_command ::= 'CLOSE' cursor_name
/// summary values:CLOSE
/// summary=K&C
Method CloseCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C
	; first rule summary K
	if '(..isKeywordInList($lb("CLOSE"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"CLOSE")  {
		if ..CursorName(subElement,.addedElement)  {
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

///  col_list ::= column_reference ( ',' column_reference )*
/// summary=C&(?4punctuation:4?)*
Method ColList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ColumnReference(subElement,.addedElement)  {
		if ..ColList159RepZero(subElement,.addedElement)  {
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

///  ( ',' column_reference )*
Method ColList159RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ColList160Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' column_reference
/// summary values:,
/// summary=P&C
Method ColList160Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..ColumnReference(subElement,.addedElement)  {
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
	$$$DEBUGMethodEnd
	quit ok
}

///  colon_sql_cos_variable ::= ':' sql_cos_variable
/// summary values::
/// summary=P&C
Method ColonSqlCosVariable(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(":",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,":")  {
		if ..SqlCosVariable(subElement,.addedElement)  {
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

///  column_name ::= identifier
/// summary=C
Method ColumnName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Identifier(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  column_name_list ::= column_name ( ',' column_name )*
/// summary=C&(?4punctuation:4?)*
Method ColumnNameList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ColumnName(subElement,.addedElement)  {
		if ..ColumnNameList45RepZero(subElement,.addedElement)  {
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

///  ( ',' column_name )*
Method ColumnNameList45RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ColumnNameList46Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' column_name
/// summary values:,
/// summary=P&C
Method ColumnNameList46Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..ColumnName(subElement,.addedElement)  {
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
	$$$DEBUGMethodEnd
	quit ok
}

///  column_reference ::= [ alias_name '.' ] column_name [column_reference_implicit]
/// summary=[C&P]&C&[C]
Method ColumnReference(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary [C&P]&C&[C]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ColumnReference161OptGrp(subElement,.addedElement)  {
		if ..ColumnName(subElement,.addedElement)  {
			if $S(..ColumnReferenceImplicit(subElement,.addedElement) :1,1:1) {
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
/// summary=C&P
Method ColumnReference161OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&P
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..AliasName(subElement,.addedElement)  {
		if ..addPunctuation(subElement,".")  {
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
	$$$DEBUGMethodEnd
	quit ok
}

///  column_reference_implicit ::= ('->' column_name)*
/// summary=(?4punctuation:4?)*
Method ColumnReferenceImplicit(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ColumnReferenceImplicit162RepZero(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ('->' column_name)*
Method ColumnReferenceImplicit162RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ColumnReferenceImplicit163Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// '->' column_name
/// summary values:->
/// summary=P&C
Method ColumnReferenceImplicit163Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle("->",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"->")  {
		if ..ColumnName(subElement,.addedElement)  {
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
	$$$DEBUGMethodEnd
	quit ok
}

///  cross_join ::= table_reference 'CROSS' 'JOIN' table_reference
/// summary=C&K&K&C
Method CrossJoin(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&K&K&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..TableReference(subElement,.addedElement)  {
		if ..addKeyword(subElement,"CROSS")  {
			if ..addKeyword(subElement,"JOIN")  {
				if ..TableReference(subElement,.addedElement)  {
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

///  cursor_name ::= identifier
/// summary=C
Method CursorName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Identifier(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  declare_command ::= 'DECLARE' cursor_name 'CURSOR' 'FOR' query_specification [ 'FOR' ('UPDATE' | ('READ' 'ONLY'))]
/// summary values:DECLARE
/// summary=K&C&K&K&C&[K&K|K&K]
Method DeclareCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C&K&K&C&[K&K|K&K]
	; first rule summary K
	if '(..isKeywordInList($lb("DECLARE"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"DECLARE")  {
		if ..CursorName(subElement,.addedElement)  {
			if ..addKeyword(subElement,"CURSOR")  {
				if ..addKeyword(subElement,"FOR")  {
					if ..QuerySpecification(subElement,.addedElement)  {
						if ..DeclareCommand65OptGrp(subElement,.addedElement)  {
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
/// summary values:FOR
/// summary=K&K|K&K
Method DeclareCommand65OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&K|K&K
	; first rule summary K
	if '(..isKeywordInList($lb("FOR"),.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"FOR")  {
		if ..DeclareCommand66Sub(subElement,.addedElement)  {
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
	$$$DEBUGMethodEnd
	quit ok
}

/// 'UPDATE' | ('READ' 'ONLY')
/// summary=K|K&K
Method DeclareCommand66Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K&K
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"UPDATE")  {
		set done=1 ; or
	} elseif ..DeclareCommand67Sub(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 'READ' 'ONLY'
/// summary values:READ
/// summary=K&K
Method DeclareCommand67Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&K
	; first rule summary K
	if '(..isKeywordInList($lb("READ"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"READ")  {
		if ..addKeyword(subElement,"ONLY")  {
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
	$$$DEBUGMethodEnd
	quit ok
}

///  delete_command ::= 'DELETE' (update_keyword)* ['FROM'] direct_table [ where_clause ]
/// summary values:DELETE
/// summary=K&(?4punctuation:4?)*&[K]&C&[C]
Method DeleteCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&(?4punctuation:4?)*&[K]&C&[C]
	; first rule summary K
	if '(..isKeywordInList($lb("DELETE"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"DELETE")  {
		if ..DeleteCommand68RepZero(subElement,.addedElement)  {
			if $S(..addKeyword(subElement,"FROM") :1,1:1) {
				if ..DirectTable(subElement,.addedElement)  {
					if $S(..WhereClause(subElement,.addedElement) :1,1:1) {
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

///  (update_keyword)*
Method DeleteCommand68RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..DeleteCommand69Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// update_keyword
/// summary=C
Method DeleteCommand69Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
	if ..UpdateKeyword(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  derived_column ::= sql_expression [ as_clause ]
/// summary=C&[C]
Method DerivedColumn(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&[C]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SqlExpression(subElement,.addedElement)  {
		if $S(..AsClause(subElement,.addedElement) :1,1:1) {
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

///  derived_table ::= table_subquery [ table_as_clause ]
/// summary=C&[C]
Method DerivedTable(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&[C]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..TableSubquery(subElement,.addedElement)  {
		if $S(..TableAsClause(subElement,.addedElement) :1,1:1) {
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

///  derived_table_noalias ::= table_subquery
/// summary=C
Method DerivedTableNoalias(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..TableSubquery(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  direct_table ::= table_name [ table_as_clause ]
/// summary=C&[C]
Method DirectTable(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&[C]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..TableName(subElement,.addedElement)  {
		if $S(..TableAsClause(subElement,.addedElement) :1,1:1) {
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

///  direct_table_noalias ::= table_name
/// summary=C
Method DirectTableNoalias(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..TableName(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  fetch_command ::= 'FETCH' cursor_name [ select_into ]
/// summary values:FETCH
/// summary=K&C&[C]
Method FetchCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C&[C]
	; first rule summary K
	if '(..isKeywordInList($lb("FETCH"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"FETCH")  {
		if ..CursorName(subElement,.addedElement)  {
			if $S(..SelectInto(subElement,.addedElement) :1,1:1) {
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

///  from_clause ::= 'FROM' [from_optimise_list] ( table_reference) [ ( ',' table_reference )* ] ( join )*
/// summary values:FROM
/// summary=K&[C]&C&[(?4punctuation:4?)*]&(?4punctuation:4?)*
Method FromClause(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&[C]&C&[(?4punctuation:4?)*]&(?4punctuation:4?)*
	; first rule summary K
	if '(..isKeywordInList($lb("FROM"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"FROM")  {
		if $S(..FromOptimiseList(subElement,.addedElement) :1,1:1) {
			if ..FromClause18Sub(subElement,.addedElement)  {
				if $S(..FromClause19RepZero(subElement,.addedElement) :1,1:1) {
					if ..FromClause21RepZero(subElement,.addedElement)  {
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

///  table_reference
/// summary=C
Method FromClause18Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
	if ..TableReference(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  ( ',' table_reference )*
Method FromClause19RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..FromClause20Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' table_reference
/// summary values:,
/// summary=P&C
Method FromClause20Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..TableReference(subElement,.addedElement)  {
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
	$$$DEBUGMethodEnd
	quit ok
}

///  ( join )*
Method FromClause21RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..FromClause22Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  join
/// summary=C
Method FromClause22Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
	if ..Join(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  from_optimise ::= ('%firsttable' [alias_name]) | '%ALLINDEX' | '%STARTTABLE' | '%INORDER' | '%FULL' | '%NOFLATTEN' | '%NOMERGE' | '%NOREDUCE' | '%NOSVSO' | '%NOTOPOPT' | '%NOUNIONOROPT' | '%PARALLEL' | ('%IGNOREINDEX' index_reference_list ) | ('%IGNOREINDICES' index_reference_list )
/// summary=P&[C]|P|P|P|P|P|P|P|P|P|P|P|P&C|P&C
Method FromOptimise(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&[C]|P|P|P|P|P|P|P|P|P|P|P|P&C|P&C
	; first rule summary P&[C]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..FromOptimise25Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"%ALLINDEX")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"%STARTTABLE")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"%INORDER")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"%FULL")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"%NOFLATTEN")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"%NOMERGE")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"%NOREDUCE")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"%NOSVSO")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"%NOTOPOPT")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"%NOUNIONOROPT")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"%PARALLEL")  {
		set done=1 ; or
	} elseif ..FromOptimise26Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..FromOptimise27Sub(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// '%firsttable' [alias_name]
/// summary values:%FIRSTTABLE
/// summary=P&[C]
Method FromOptimise25Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&[C]
	; first rule summary P
	if '(..isStringSingle("%FIRSTTABLE",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"%firsttable")  {
		if $S(..AliasName(subElement,.addedElement) :1,1:1) {
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
	$$$DEBUGMethodEnd
	quit ok
}

/// '%IGNOREINDEX' index_reference_list
/// summary values:%IGNOREINDEX
/// summary=P&C
Method FromOptimise26Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle("%IGNOREINDEX",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"%IGNOREINDEX")  {
		if ..IndexReferenceList(subElement,.addedElement)  {
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
	$$$DEBUGMethodEnd
	quit ok
}

/// '%IGNOREINDICES' index_reference_list
/// summary values:%IGNOREINDICES
/// summary=P&C
Method FromOptimise27Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle("%IGNOREINDICES",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"%IGNOREINDICES")  {
		if ..IndexReferenceList(subElement,.addedElement)  {
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
	$$$DEBUGMethodEnd
	quit ok
}

///  from_optimise_list ::= from_optimise ( from_optimise )*
/// summary=C&(?4punctuation:4?)*
Method FromOptimiseList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..FromOptimise(subElement,.addedElement)  {
		if ..FromOptimiseList23RepZero(subElement,.addedElement)  {
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

///  ( from_optimise )*
Method FromOptimiseList23RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..FromOptimiseList24Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  from_optimise
/// summary=C
Method FromOptimiseList24Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
	if ..FromOptimise(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  group_by_clause ::= 'GROUP' 'BY' grouping_column_reference_list
/// summary values:GROUP
/// summary=K&K&C
Method GroupByClause(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&K&C
	; first rule summary K
	if '(..isKeywordInList($lb("GROUP"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"GROUP")  {
		if ..addKeyword(subElement,"BY")  {
			if ..GroupingColumnReferenceList(subElement,.addedElement)  {
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

///  grouping_column_reference ::= sql_expression
/// summary=C
Method GroupingColumnReference(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SqlExpression(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  grouping_column_reference_list ::= grouping_column_reference ( ',' grouping_column_reference )*
/// summary=C&(?4punctuation:4?)*
Method GroupingColumnReferenceList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..GroupingColumnReference(subElement,.addedElement)  {
		if ..GroupingColumnReferenceList37RepZero(subElement,.addedElement)  {
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

///  ( ',' grouping_column_reference )*
Method GroupingColumnReferenceList37RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..GroupingColumnReferenceList38Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' grouping_column_reference
/// summary values:,
/// summary=P&C
Method GroupingColumnReferenceList38Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..GroupingColumnReference(subElement,.addedElement)  {
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
	$$$DEBUGMethodEnd
	quit ok
}

///  having_clause ::= 'HAVING' sql_expression
/// summary values:HAVING
/// summary=K&C
Method HavingClause(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C
	; first rule summary K
	if '(..isKeywordInList($lb("HAVING"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"HAVING")  {
		if ..SqlExpression(subElement,.addedElement)  {
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

///  identifier ::= 'regexp:(((\%[a-zA-Z0-9])|(\$[a-zA-Z])|[a-zA-Z])[a-zA-Z0-9\.]*)'
/// summary values:REGEXP:(((\%[A-ZA-Z0-9])|(\$[A-ZA-Z])|[A-ZA-Z])[A-ZA-Z0-9\.]*)
/// summary=P
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
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  index_reference ::= [ table_reference_noalias '.' ] identifier
/// summary=[C&P]&C
Method IndexReference(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary [C&P]&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..IndexReference30OptGrp(subElement,.addedElement)  {
		if ..Identifier(subElement,.addedElement)  {
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
Method IndexReference30OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&P
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..TableReferenceNoalias(subElement,.addedElement)  {
		if ..addPunctuation(subElement,".")  {
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
	$$$DEBUGMethodEnd
	quit ok
}

///  index_reference_list ::= index_reference ( ',' index_reference )*
/// summary=C&(?4punctuation:4?)*
Method IndexReferenceList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..IndexReference(subElement,.addedElement)  {
		if ..IndexReferenceList31RepZero(subElement,.addedElement)  {
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

///  ( ',' index_reference )*
Method IndexReferenceList31RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..IndexReferenceList32Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' index_reference
/// summary values:,
/// summary=P&C
Method IndexReferenceList32Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..IndexReference(subElement,.addedElement)  {
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
	$$$DEBUGMethodEnd
	quit ok
}

///  insert_command ::= 'INSERT' (update_keyword)* ['INTO'] direct_table insert_method
/// summary values:INSERT
/// summary=K&(?4punctuation:4?)*&[K]&C&C
Method InsertCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&(?4punctuation:4?)*&[K]&C&C
	; first rule summary K
	if '(..isKeywordInList($lb("INSERT"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"INSERT")  {
		if ..InsertCommand48RepZero(subElement,.addedElement)  {
			if $S(..addKeyword(subElement,"INTO") :1,1:1) {
				if ..DirectTable(subElement,.addedElement)  {
					if ..InsertMethod(subElement,.addedElement)  {
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

///  (update_keyword)*
Method InsertCommand48RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..InsertCommand49Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// update_keyword
/// summary=C
Method InsertCommand49Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
	if ..UpdateKeyword(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  insert_method ::= insert_set_list | insert_values_list | insert_multirow
/// summary=C|C|C
Method InsertMethod(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..InsertSetList(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..InsertValuesList(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..InsertMultirow(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  insert_multirow ::= [ update_columns ] select_command
/// summary=[C]&C
Method InsertMultirow(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary [C]&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..UpdateColumns(subElement,.addedElement) :1,1:1) {
		if ..SelectCommand(subElement,.addedElement)  {
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

///  insert_set ::= column_reference '=' sql_expression
/// summary=C&P&C
Method InsertSet(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&P&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ColumnReference(subElement,.addedElement)  {
		if ..addPunctuation(subElement,"=")  {
			if ..SqlExpression(subElement,.addedElement)  {
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

///  insert_set_list ::= 'SET' insert_set (',' insert_set)*
/// summary values:SET
/// summary=K&C&(?4punctuation:4?)*
Method InsertSetList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C&(?4punctuation:4?)*
	; first rule summary K
	if '(..isKeywordInList($lb("SET"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"SET")  {
		if ..InsertSet(subElement,.addedElement)  {
			if ..InsertSetList50RepZero(subElement,.addedElement)  {
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

///  (',' insert_set)*
Method InsertSetList50RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..InsertSetList51Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// ',' insert_set
/// summary values:,
/// summary=P&C
Method InsertSetList51Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..InsertSet(subElement,.addedElement)  {
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
	$$$DEBUGMethodEnd
	quit ok
}

///  insert_values_list ::= update_columns 'VALUES' update_values
/// summary=C&K&C
Method InsertValuesList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&K&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..UpdateColumns(subElement,.addedElement)  {
		if ..addKeyword(subElement,"VALUES")  {
			if ..UpdateValues(subElement,.addedElement)  {
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

///  join ::= [('INNER' | 'OUTER' | 'LEFT' | 'RIGHT' | 'CROSS' | 'NATURAL' |'FULL' )*] 'JOIN' table_reference [ join_on ]
/// summary=[(?4punctuation:4?)*]&K&C&[C]
Method Join(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary [(?4punctuation:4?)*]&K&C&[C]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..Join28RepZero(subElement,.addedElement) :1,1:1) {
		if ..addKeyword(subElement,"JOIN")  {
			if ..TableReference(subElement,.addedElement)  {
				if $S(..JoinOn(subElement,.addedElement) :1,1:1) {
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

/// ('INNER' | 'OUTER' | 'LEFT' | 'RIGHT' | 'CROSS' | 'NATURAL' |'FULL' )*
Method Join28RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..Join29Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// 'INNER' | 'OUTER' | 'LEFT' | 'RIGHT' | 'CROSS' | 'NATURAL' |'FULL'
/// summary values:INNER,OUTER,LEFT,RIGHT,CROSS,NATURAL,FULL
/// summary=K|K|K|K|K|K|K
Method Join29Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K|K|K|K|K|K
	if '(..isKeywordInList($lb("INNER","OUTER","LEFT","RIGHT","CROSS","NATURAL","FULL"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
	if ..addKeyword(subElement,"INNER")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"OUTER")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"LEFT")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"RIGHT")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"CROSS")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"NATURAL")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"FULL")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  join_column_list ::= column_name_list
/// summary=C
Method JoinColumnList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ColumnNameList(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  join_condition ::= 'ON' sql_expression
/// summary values:ON
/// summary=K&C
Method JoinCondition(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C
	; first rule summary K
	if '(..isKeywordInList($lb("ON"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"ON")  {
		if ..SqlExpression(subElement,.addedElement)  {
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

///  join_on ::= 'ON' sql_expression
/// summary values:ON
/// summary=K&C
Method JoinOn(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C
	; first rule summary K
	if '(..isKeywordInList($lb("ON"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"ON")  {
		if ..SqlExpression(subElement,.addedElement)  {
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

///  join_specification ::= join_condition | named_columns_join
/// summary=C|C
Method JoinSpecification(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..JoinCondition(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..NamedColumnsJoin(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  join_type ::= 'INNER' | (outer_join_type [ 'OUTER' ])
/// summary=K|C&[K]
Method JoinType(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|C&[K]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"INNER")  {
		set done=1 ; or
	} elseif ..JoinType36Sub(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// outer_join_type [ 'OUTER' ]
/// summary=C&[K]
Method JoinType36Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&[K]
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OuterJoinType(subElement,.addedElement)  {
		if $S(..addKeyword(subElement,"OUTER") :1,1:1) {
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
	$$$DEBUGMethodEnd
	quit ok
}

///  joined_table ::= cross_join | qualified_join | ('(' joined_table ')')
/// summary=C|C|P&C&P
Method JoinedTable(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C|P&C&P
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CrossJoin(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..QualifiedJoin(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..JoinedTable35Sub(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// '(' joined_table ')'
/// summary values:(
/// summary=P&C&P
Method JoinedTable35Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"(")  {
		if ..JoinedTable(subElement,.addedElement)  {
			if ..addPunctuation(subElement,")")  {
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
	$$$DEBUGMethodEnd
	quit ok
}

///  macro_identifier ::= identifier
/// summary=C
Method MacroIdentifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Identifier(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  macro_parameter ::= sql_expression
/// summary=C
Method MacroParameter(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SqlExpression(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  macro_parameter_list ::= '(' [ [macro_parameter] ( ',' [macro_parameter] )* ] ')'
/// summary values:(
/// summary=P&[[C]&(?4punctuation:4?)*]&P
Method MacroParameterList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&[[C]&(?4punctuation:4?)*]&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"(")  {
		if ..MacroParameterList81OptGrp(subElement,.addedElement)  {
			if ..addPunctuation(subElement,")")  {
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
Method MacroParameterList81OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary [C]&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..MacroParameter(subElement,.addedElement) :1,1:1) {
		if ..MacroParameterList82RepZero(subElement,.addedElement)  {
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
	$$$DEBUGMethodEnd
	quit ok
}

///  ( ',' [macro_parameter] )*
Method MacroParameterList82RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..MacroParameterList83Sub(subElement,.addedElement)  {
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
Method MacroParameterList83Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&[C]
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
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  macro_parameter_text ::= '(' any_text_upto_close_bracket ')'
/// summary values:(
/// summary=P&C&P
Method MacroParameterText(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&P
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
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  macrocall ::= '$$$' macro_identifier [ macro_parameter_list | macro_parameter_text ]
/// summary values:$$$
/// summary=P&C&[C|C]
Method Macrocall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&[C|C]
	; first rule summary P
	if '(..isStringSingle("$$$",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"$$$")  {
		if ..MacroIdentifier(subElement,.addedElement)  {
			if ..Macrocall80OptGrp(subElement,.addedElement)  {
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
Method Macrocall80OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
	if ..MacroParameterList(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..MacroParameterText(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=1 /* failure rollsback but returns OK */
	}
	quit ok
}

///  named_columns_join ::= 'USING' '(' join_column_list ')'
/// summary values:USING
/// summary=K&P&C&P
Method NamedColumnsJoin(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&C&P
	; first rule summary K
	if '(..isKeywordInList($lb("USING"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"USING")  {
		if ..addPunctuation(subElement,"(")  {
			if ..JoinColumnList(subElement,.addedElement)  {
				if ..addPunctuation(subElement,")")  {
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

///  non_join_query_expression ::= non_join_query_term
/// summary=C
Method NonJoinQueryExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..NonJoinQueryTerm(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  non_join_query_primary ::= simple_table | ( '(' non_join_query_expression ')' )
/// summary=C|P&C&P
Method NonJoinQueryPrimary(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|P&C&P
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SimpleTable(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..NonJoinQueryPrimary44Sub(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  '(' non_join_query_expression ')'
/// summary values:(
/// summary=P&C&P
Method NonJoinQueryPrimary44Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"(")  {
		if ..NonJoinQueryExpression(subElement,.addedElement)  {
			if ..addPunctuation(subElement,")")  {
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
	$$$DEBUGMethodEnd
	quit ok
}

///  non_join_query_term ::= non_join_query_primary
/// summary=C
Method NonJoinQueryTerm(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..NonJoinQueryPrimary(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  number ::= ('regexp:[0-9]*' [ '.' 'regexp:[0-9]+'] [ ('e' | 'E') 'regexp:[0-9]+']) | ('.' 'regexp:[0-9]+' [ ('e' | 'E') 'regexp:[0-9]+'])
/// summary=P&[P&P]&[K|K&P]|P&P&[K|K&P]
Method Number(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&[P&P]&[K|K&P]|P&P&[K|K&P]
	; first rule summary P&[P&P]&[K|K&P]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Number168Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Number172Sub(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
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
/// summary values:REGEXP:[0-9]*
/// summary=P&[P&P]&[K|K&P]
Method Number168Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&[P&P]&[K|K&P]
	; first rule summary P
	if '(..isStringSingle("REGEXP:[0-9]*",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"regexp:[0-9]*")  {
		if ..Number169OptGrp(subElement,.addedElement)  {
			if ..Number170OptGrp(subElement,.addedElement)  {
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
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary values:.
/// summary=P&P
Method Number169OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=1 /* failure rollsback but returns OK */
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=K|K&P
Method Number170OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K&P
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Number171Sub(subElement,.addedElement)  {
		if ..addPunctuation(subElement,"regexp:[0-9]+")  {
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
	$$$DEBUGMethodEnd
	quit ok
}

/// 'e' | 'E'
/// summary values:E,E
/// summary=K|K
Method Number171Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

/// '.' 'regexp:[0-9]+' [ ('e' | 'E') 'regexp:[0-9]+']
/// summary values:.
/// summary=P&P&[K|K&P]
Method Number172Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&P&[K|K&P]
	; first rule summary P
	if '(..isStringSingle(".",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,".")  {
		if ..addPunctuation(subElement,"regexp:[0-9]+")  {
			if ..Number173OptGrp(subElement,.addedElement)  {
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
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=K|K&P
Method Number173OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K&P
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Number174Sub(subElement,.addedElement)  {
		if ..addPunctuation(subElement,"regexp:[0-9]+")  {
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
	$$$DEBUGMethodEnd
	quit ok
}

/// 'e' | 'E'
/// summary values:E,E
/// summary=K|K
Method Number174Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  open_command ::= 'OPEN' cursor_name
/// summary values:OPEN
/// summary=K&C
Method OpenCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C
	; first rule summary K
	if '(..isKeywordInList($lb("OPEN"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"OPEN")  {
		if ..CursorName(subElement,.addedElement)  {
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

///  order_by_clause ::= 'ORDER' 'BY' ordering_column_reference_list
/// summary values:ORDER
/// summary=K&K&C
Method OrderByClause(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&K&C
	; first rule summary K
	if '(..isKeywordInList($lb("ORDER"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"ORDER")  {
		if ..addKeyword(subElement,"BY")  {
			if ..OrderingColumnReferenceList(subElement,.addedElement)  {
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

///  ordering_column_reference ::= sql_expression [ 'ASC' | 'DESC']
/// summary=C&[K|K]
Method OrderingColumnReference(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&[K|K]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SqlExpression(subElement,.addedElement)  {
		if ..OrderingColumnReference41OptGrp(subElement,.addedElement)  {
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
/// summary values:ASC,DESC
/// summary=K|K
Method OrderingColumnReference41OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K
	if '(..isKeywordInList($lb("ASC","DESC"),.value)) { quit 1 /* not found is OK */ }
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
	if ..addKeyword(subElement,"ASC")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"DESC")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=1 /* failure rollsback but returns OK */
	}
	quit ok
}

///  ordering_column_reference_list ::= ordering_column_reference ( ',' ordering_column_reference )*
/// summary=C&(?4punctuation:4?)*
Method OrderingColumnReferenceList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OrderingColumnReference(subElement,.addedElement)  {
		if ..OrderingColumnReferenceList39RepZero(subElement,.addedElement)  {
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

///  ( ',' ordering_column_reference )*
Method OrderingColumnReferenceList39RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..OrderingColumnReferenceList40Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' ordering_column_reference
/// summary values:,
/// summary=P&C
Method OrderingColumnReferenceList40Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..OrderingColumnReference(subElement,.addedElement)  {
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
	$$$DEBUGMethodEnd
	quit ok
}

///  outer_join_type ::= 'LEFT' | 'RIGHT' | 'FULL'
/// summary values:LEFT,RIGHT,FULL
/// summary=K|K|K
Method OuterJoinType(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K|K
	if '(..isKeywordInList($lb("LEFT","RIGHT","FULL"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"LEFT")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"RIGHT")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"FULL")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  qualified_identifier ::= identifier
/// summary=C
Method QualifiedIdentifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Identifier(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  qualified_join ::= table_reference [ 'NATURAL' ] [ join_type ] 'JOIN' table_reference [ join_specification ]
/// summary=C&[K]&[C]&K&C&[C]
Method QualifiedJoin(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&[K]&[C]&K&C&[C]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..TableReference(subElement,.addedElement)  {
		if $S(..addKeyword(subElement,"NATURAL") :1,1:1) {
			if $S(..JoinType(subElement,.addedElement) :1,1:1) {
				if ..addKeyword(subElement,"JOIN")  {
					if ..TableReference(subElement,.addedElement)  {
						if $S(..JoinSpecification(subElement,.addedElement) :1,1:1) {
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

///  qualifier ::= table_name
/// summary=C
Method Qualifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..TableName(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  query_expression ::= non_join_query_expression | joined_table
/// summary=C|C
Method QueryExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..NonJoinQueryExpression(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..JoinedTable(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  query_specification ::= [with_command ] select_command ( union select_command )*
/// summary=[C]&C&(?4punctuation:4?)*
Method QuerySpecification(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary [C]&C&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..WithCommand(subElement,.addedElement) :1,1:1) {
		if ..SelectCommand(subElement,.addedElement)  {
			if ..QuerySpecification1RepZero(subElement,.addedElement)  {
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

///  ( union select_command )*
Method QuerySpecification1RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..QuerySpecification2Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  union select_command
/// summary=C&C
Method QuerySpecification2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&C
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Union(subElement,.addedElement)  {
		if ..SelectCommand(subElement,.addedElement)  {
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
	$$$DEBUGMethodEnd
	quit ok
}

///  schema_name ::= identifier
/// summary=C
Method SchemaName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Identifier(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  select_command ::= 'SELECT' [ set_quantifier ] select_list [select_into] [ table_expression ]
/// summary values:SELECT
/// summary=K&[C]&C&[C]&[C]
Method SelectCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&[C]&C&[C]&[C]
	; first rule summary K
	if '(..isKeywordInList($lb("SELECT"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"SELECT")  {
		if $S(..SetQuantifier(subElement,.addedElement) :1,1:1) {
			if ..SelectList(subElement,.addedElement)  {
				if $S(..SelectInto(subElement,.addedElement) :1,1:1) {
					if $S(..TableExpression(subElement,.addedElement) :1,1:1) {
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

///  select_into ::= 'INTO' select_into_variable ( ',' select_into_variable)*
/// summary values:INTO
/// summary=K&C&(?4punctuation:4?)*
Method SelectInto(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C&(?4punctuation:4?)*
	; first rule summary K
	if '(..isKeywordInList($lb("INTO"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"INTO")  {
		if ..SelectIntoVariable(subElement,.addedElement)  {
			if ..SelectInto33RepZero(subElement,.addedElement)  {
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

///  ( ',' select_into_variable)*
Method SelectInto33RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..SelectInto34Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' select_into_variable
/// summary values:,
/// summary=P&C
Method SelectInto34Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..SelectIntoVariable(subElement,.addedElement)  {
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
	$$$DEBUGMethodEnd
	quit ok
}

///  select_into_variable ::= [':'] sql_cos_variable
/// summary=[P]&C
Method SelectIntoVariable(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary [P]&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..addPunctuation(subElement,":") :1,1:1) {
		if ..SqlCosVariable(subElement,.addedElement)  {
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

///  select_list ::= select_sublist ( ',' select_sublist )*
/// summary=C&(?4punctuation:4?)*
Method SelectList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SelectSublist(subElement,.addedElement)  {
		if ..SelectList15RepZero(subElement,.addedElement)  {
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

///  ( ',' select_sublist )*
Method SelectList15RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..SelectList16Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' select_sublist
/// summary values:,
/// summary=P&C
Method SelectList16Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..SelectSublist(subElement,.addedElement)  {
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
	$$$DEBUGMethodEnd
	quit ok
}

///  select_sublist ::= derived_column | (qualifier '.' '*')
/// summary=C|C&P&P
Method SelectSublist(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C&P&P
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..DerivedColumn(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SelectSublist17Sub(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// qualifier '.' '*'
/// summary=C&P&P
Method SelectSublist17Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&P&P
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Qualifier(subElement,.addedElement)  {
		if ..addPunctuation(subElement,".")  {
			if ..addPunctuation(subElement,"*")  {
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
	$$$DEBUGMethodEnd
	quit ok
}

///  set_quantifier ::= ( ( 'DISTINCT' ['BY' '(' sql_expression ( ',' sql_expression )* ')' ] ) | 'ALL' | ('TOP' sql_expression) | '%NOFPLAN' | '%NOLOCK' | '%NORUNTIME' | ('%PROFILE' ['ALL']) )*
/// summary=(?4punctuation:4?)*
Method SetQuantifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SetQuantifier7RepZero(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
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
/// summary values:BY
/// summary=K&P&C&(?4punctuation:4?)*&P
Method SetQuantifier10OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&C&(?4punctuation:4?)*&P
	; first rule summary K
	if '(..isKeywordInList($lb("BY"),.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"BY")  {
		if ..addPunctuation(subElement,"(")  {
			if ..SqlExpression(subElement,.addedElement)  {
				if ..SetQuantifier11RepZero(subElement,.addedElement)  {
					if ..addPunctuation(subElement,")")  {
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
		set ok=1 /* failure rollsback but returns OK */
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ( ',' sql_expression )*
Method SetQuantifier11RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..SetQuantifier12Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' sql_expression
/// summary values:,
/// summary=P&C
Method SetQuantifier12Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..SqlExpression(subElement,.addedElement)  {
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
	$$$DEBUGMethodEnd
	quit ok
}

/// 'TOP' sql_expression
/// summary values:TOP
/// summary=K&C
Method SetQuantifier13Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C
	; first rule summary K
	if '(..isKeywordInList($lb("TOP"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"TOP")  {
		if ..SqlExpression(subElement,.addedElement)  {
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
	$$$DEBUGMethodEnd
	quit ok
}

/// '%PROFILE' ['ALL']
/// summary values:%PROFILE
/// summary=P&[K]
Method SetQuantifier14Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&[K]
	; first rule summary P
	if '(..isStringSingle("%PROFILE",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"%PROFILE")  {
		if $S(..addKeyword(subElement,"ALL") :1,1:1) {
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
	$$$DEBUGMethodEnd
	quit ok
}

///  ( ( 'DISTINCT' ['BY' '(' sql_expression ( ',' sql_expression )* ')' ] ) | 'ALL' | ('TOP' sql_expression) | '%NOFPLAN' | '%NOLOCK' | '%NORUNTIME' | ('%PROFILE' ['ALL']) )*
Method SetQuantifier7RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..SetQuantifier8Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ( 'DISTINCT' ['BY' '(' sql_expression ( ',' sql_expression )* ')' ] ) | 'ALL' | ('TOP' sql_expression) | '%NOFPLAN' | '%NOLOCK' | '%NORUNTIME' | ('%PROFILE' ['ALL'])
/// summary=K&[K&P&C&(?4punctuation:4?)*&P]|K|K&C|P|P|P|P&[K]
Method SetQuantifier8Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&[K&P&C&(?4punctuation:4?)*&P]|K|K&C|P|P|P|P&[K]
	; first rule summary K&[K&P&C&(?4punctuation:4?)*&P]
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SetQuantifier9Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"ALL")  {
		set done=1 ; or
	} elseif ..SetQuantifier13Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"%NOFPLAN")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"%NOLOCK")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"%NORUNTIME")  {
		set done=1 ; or
	} elseif ..SetQuantifier14Sub(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  'DISTINCT' ['BY' '(' sql_expression ( ',' sql_expression )* ')' ]
/// summary values:DISTINCT
/// summary=K&[K&P&C&(?4punctuation:4?)*&P]
Method SetQuantifier9Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&[K&P&C&(?4punctuation:4?)*&P]
	; first rule summary K
	if '(..isKeywordInList($lb("DISTINCT"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"DISTINCT")  {
		if ..SetQuantifier10OptGrp(subElement,.addedElement)  {
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
	$$$DEBUGMethodEnd
	quit ok
}

///  simple_table ::= query_specification
/// summary=C
Method SimpleTable(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..QuerySpecification(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  sql_case_expression ::= 'CASE' ( sql_case_expression1 | sql_case_expression2 ) ['ELSE' sql_expression ] 'END'
/// summary values:CASE
/// summary=K&C|C&[K&C]&K
Method SqlCaseExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C|C&[K&C]&K
	; first rule summary K
	if '(..isKeywordInList($lb("CASE"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"CASE")  {
		if ..SqlCaseExpression153Sub(subElement,.addedElement)  {
			if ..SqlCaseExpression154OptGrp(subElement,.addedElement)  {
				if ..addKeyword(subElement,"END")  {
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

///  sql_case_expression1 ::= 'WHEN' sql_expression 'THEN' sql_expression ('WHEN' sql_expression 'THEN' sql_expression )*
/// summary values:WHEN
/// summary=K&C&K&C&(?4punctuation:4?)*
Method SqlCaseExpression1(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C&K&C&(?4punctuation:4?)*
	; first rule summary K
	if '(..isKeywordInList($lb("WHEN"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"WHEN")  {
		if ..SqlExpression(subElement,.addedElement)  {
			if ..addKeyword(subElement,"THEN")  {
				if ..SqlExpression(subElement,.addedElement)  {
					if ..SqlCaseExpression1155RepZero(subElement,.addedElement)  {
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

///  ('WHEN' sql_expression 'THEN' sql_expression )*
Method SqlCaseExpression1155RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..SqlCaseExpression1156Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// 'WHEN' sql_expression 'THEN' sql_expression
/// summary values:WHEN
/// summary=K&C&K&C
Method SqlCaseExpression1156Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C&K&C
	; first rule summary K
	if '(..isKeywordInList($lb("WHEN"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"WHEN")  {
		if ..SqlExpression(subElement,.addedElement)  {
			if ..addKeyword(subElement,"THEN")  {
				if ..SqlExpression(subElement,.addedElement)  {
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
	$$$DEBUGMethodEnd
	quit ok
}

///  sql_case_expression1 | sql_case_expression2
/// summary=C|C
Method SqlCaseExpression153Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
	if ..SqlCaseExpression1(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlCaseExpression2(subElement,.addedElement)  {
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
/// summary values:ELSE
/// summary=K&C
Method SqlCaseExpression154OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C
	; first rule summary K
	if '(..isKeywordInList($lb("ELSE"),.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"ELSE")  {
		if ..SqlExpression(subElement,.addedElement)  {
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
	$$$DEBUGMethodEnd
	quit ok
}

///  sql_case_expression2 ::= sql_expression ('WHEN' sql_expression 'THEN' sql_expression )*
/// summary=C&(?4punctuation:4?)*
Method SqlCaseExpression2(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SqlExpression(subElement,.addedElement)  {
		if ..SqlCaseExpression2157RepZero(subElement,.addedElement)  {
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

///  ('WHEN' sql_expression 'THEN' sql_expression )*
Method SqlCaseExpression2157RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..SqlCaseExpression2158Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// 'WHEN' sql_expression 'THEN' sql_expression
/// summary values:WHEN
/// summary=K&C&K&C
Method SqlCaseExpression2158Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C&K&C
	; first rule summary K
	if '(..isKeywordInList($lb("WHEN"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"WHEN")  {
		if ..SqlExpression(subElement,.addedElement)  {
			if ..addKeyword(subElement,"THEN")  {
				if ..SqlExpression(subElement,.addedElement)  {
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
	$$$DEBUGMethodEnd
	quit ok
}

///  sql_cos_variable ::= 'NEED COS VAR'
/// summary values:NEED COS VAR
/// summary=P
Method SqlCosVariable(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("NEED COS VAR",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"NEED COS VAR")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  sql_dyadicop ::= "+" | "-" | "\\" | "/" | "<>" | ">=" | ">" | "!>" | "<=" | "<" | "!<" | "=" | "!=" | "**" | "*" | "&&" | "&" | "]]" | "[" | "'[" | "!" | "||" | "_" | "#" | '\' | "AND" | "OR" | "NOT=" | "SIZE" | "ESCAPE" | sql_predicate | ("NOT" sql_predicate)
/// summary=P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|K|K|P|K|K|C|K&C
Method SqlDyadicop(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|K|K|P|K|K|C|K&C
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
	} elseif ..addPunctuation(subElement,"<>")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,">=")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,">")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"!>")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"<=")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"<")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"!<")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"=")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"!=")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"**")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"*")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"&&")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"&")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"]]")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"[")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"'[")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"!")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"||")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"_")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"#")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"\")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"AND")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"OR")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"NOT=")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"SIZE")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"ESCAPE")  {
		set done=1 ; or
	} elseif ..SqlPredicate(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlDyadicop75Sub(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// "NOT" sql_predicate
/// summary values:NOT
/// summary=K&C
Method SqlDyadicop75Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C
	; first rule summary K
	if '(..isKeywordInList($lb("NOT"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"NOT")  {
		if ..SqlPredicate(subElement,.addedElement)  {
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
	$$$DEBUGMethodEnd
	quit ok
}

///  sql_expression ::= sql_factor ( sql_dyadicop sql_factor )*
/// summary=C&(?4punctuation:4?)*
Method SqlExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SqlFactor(subElement,.addedElement)  {
		if ..SqlExpression73RepZero(subElement,.addedElement)  {
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

///  ( sql_dyadicop sql_factor )*
Method SqlExpression73RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..SqlExpression74Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  sql_dyadicop sql_factor
/// summary=C&C
Method SqlExpression74Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&C
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SqlDyadicop(subElement,.addedElement)  {
		if ..SqlFactor(subElement,.addedElement)  {
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
	$$$DEBUGMethodEnd
	quit ok
}

///  sql_factor ::= [ sql_monadicop ] sql_term
/// summary=[C]&C
Method SqlFactor(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary [C]&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..SqlMonadicop(subElement,.addedElement) :1,1:1) {
		if ..SqlTerm(subElement,.addedElement)  {
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

///  sql_fn_function ::= '{' 'fn' sql_function '}'
/// summary values:{
/// summary=P&K&C&P
Method SqlFnFunction(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&K&C&P
	; first rule summary P
	if '(..isStringSingle("{",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"{")  {
		if ..addKeyword(subElement,"FN")  {
			if ..SqlFunction(subElement,.addedElement)  {
				if ..addPunctuation(subElement,"}")  {
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

///  sql_function ::= ('$' identifier '(' [ sql_expression ( ',' sql_expression)* ] ')') | ('%exact' sql_expression ) | ('count' '(' ['distinct' | 'all' ] ('*' | sql_expression) [ '%FOREACH' '(' col_list ')' ] ')' [ sql_window ] ) | ('min' '(' [ ( 'distinct' ['by' '(' col_list ')'] ) | 'all' ] ('*' | sql_expression) [ '%FOREACH' '(' col_list ')' ] ')' [ sql_window ] ) | ('max' '(' [ ( 'distinct' ['by' '(' col_list ')'] ) | 'all' ] ('*' | sql_expression) [ '%FOREACH' '(' col_list ')' ] ')' [ sql_window ] ) | ('sum' '(' [ ( 'distinct' ['by' '(' col_list ')'] ) | 'all' ] ('*' | sql_expression) [ '%FOREACH' '(' col_list ')' ] ')' [ sql_window ] ) | ('avg' '(' [ ( 'distinct' ['by' '(' col_list ')'] ) | 'all' ] ('*' | sql_expression) [ '%FOREACH' '(' col_list ')' ] ')' [ sql_window ] ) | ('cast' '(' sql_expression 'as' identifier ['(' sql_expression ( ',' sql_expression)* ')' ] ')' ) | ('exists' '(' subquery_specification ')' ) | ('list' '(' [ ( 'distinct' ['by' '(' col_list ')'] ) | 'all' ] ('*' | sql_expression) [ '%FOREACH' '(' col_list ')' ] ')') | ('%dlist' '(' [ ( 'distinct' ['by' '(' col_list ')'] ) | 'all' ] ('*' | sql_expression) [ '%FOREACH' '(' col_list ')' ] ')') | ('FOR' 'SOME' '%ELEMENT' '(' sql_expression ')' sql_expression ) | ('trim' '(' ['leading' | 'trailing' | 'both'] [(sql_expression 'from')] sql_expression ')' ) | ('dateadd' '(' sql_function_datepart_part ',' sql_expression ',' sql_expression ')' ) | ('datediff' '(' sql_function_datepart_part ',' sql_expression ',' sql_expression ')' ) | ('datename' '(' sql_function_datepart_part ',' sql_expression ')' ) | ('datepart' '(' sql_function_datepart_part ',' sql_expression ')' ) | (identifier '(' [ '*' | (sql_expression ( ',' sql_expression)*) ] ')' [ sql_window ] )
/// summary=P&C&P&[C&(?4punctuation:4?)*]&P|P&C|K&P&[K|K]&P|C&[P&P&C&P]&P&[C]|K&P&[K&[K&P&C&P]|K]&P|C&[P&P&C&P]&P&[C]|K&P&[K&[K&P&C&P]|K]&P|C&[P&P&C&P]&P&[C]|K&P&[K&[K&P&C&P]|K]&P|C&[P&P&C&P]&P&[C]|K&P&[K&[K&P&C&P]|K]&P|C&[P&P&C&P]&P&[C]|K&P&C&K&C&[P&C&(?4punctuation:4?)*&P]&P|K&P&C&P|K&P&[K&[K&P&C&P]|K]&P|C&[P&P&C&P]&P|P&P&[K&[K&P&C&P]|K]&P|C&[P&P&C&P]&P|K&K&P&P&C&P&C|K&P&[K|K|K]&[C&K]&C&P|K&P&C&P&C&P&C&P|K&P&C&P&C&P&C&P|K&P&C&P&C&P|K&P&C&P&C&P|C&P&[P|C&(?4punctuation:4?)*]&P&[C]
Method SqlFunction(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&P&[C&(?4punctuation:4?)*]&P|P&C|K&P&[K|K]&P|C&[P&P&C&P]&P&[C]|K&P&[K&[K&P&C&P]|K]&P|C&[P&P&C&P]&P&[C]|K&P&[K&[K&P&C&P]|K]&P|C&[P&P&C&P]&P&[C]|K&P&[K&[K&P&C&P]|K]&P|C&[P&P&C&P]&P&[C]|K&P&[K&[K&P&C&P]|K]&P|C&[P&P&C&P]&P&[C]|K&P&C&K&C&[P&C&(?4punctuation:4?)*&P]&P|K&P&C&P|K&P&[K&[K&P&C&P]|K]&P|C&[P&P&C&P]&P|P&P&[K&[K&P&C&P]|K]&P|C&[P&P&C&P]&P|K&K&P&P&C&P&C|K&P&[K|K|K]&[C&K]&C&P|K&P&C&P&C&P&C&P|K&P&C&P&C&P&C&P|K&P&C&P&C&P|K&P&C&P&C&P|C&P&[P|C&(?4punctuation:4?)*]&P&[C]
	; first rule summary P&C&P&[C&(?4punctuation:4?)*]&P
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SqlFunction84Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlFunction88Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlFunction89Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlFunction93Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlFunction99Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlFunction105Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlFunction111Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlFunction117Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlFunction121Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlFunction122Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlFunction128Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlFunction134Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlFunction135Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlFunction138Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlFunction139Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlFunction140Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlFunction141Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlFunction142Sub(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
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
/// summary=K&[K&P&C&P]|K
Method SqlFunction100OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&[K&P&C&P]|K
	; first rule summary K&[K&P&C&P]
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SqlFunction101Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"ALL")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=1 /* failure rollsback but returns OK */
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  'distinct' ['by' '(' col_list ')']
/// summary values:DISTINCT
/// summary=K&[K&P&C&P]
Method SqlFunction101Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&[K&P&C&P]
	; first rule summary K
	if '(..isKeywordInList($lb("DISTINCT"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"DISTINCT")  {
		if ..SqlFunction102OptGrp(subElement,.addedElement)  {
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
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary values:BY
/// summary=K&P&C&P
Method SqlFunction102OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&C&P
	; first rule summary K
	if '(..isKeywordInList($lb("BY"),.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"BY")  {
		if ..addPunctuation(subElement,"(")  {
			if ..ColList(subElement,.addedElement)  {
				if ..addPunctuation(subElement,")")  {
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
		set ok=1 /* failure rollsback but returns OK */
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// '*' | sql_expression
/// summary=P|C
Method SqlFunction103Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|C
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"*")  {
		set done=1 ; or
	} elseif ..SqlExpression(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary values:%FOREACH
/// summary=P&P&C&P
Method SqlFunction104OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&P&C&P
	; first rule summary P
	if '(..isStringSingle("%FOREACH",.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"%FOREACH")  {
		if ..addPunctuation(subElement,"(")  {
			if ..ColList(subElement,.addedElement)  {
				if ..addPunctuation(subElement,")")  {
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
		set ok=1 /* failure rollsback but returns OK */
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 'sum' '(' [ ( 'distinct' ['by' '(' col_list ')'] ) | 'all' ] ('*' | sql_expression) [ '%FOREACH' '(' col_list ')' ] ')' [ sql_window ]
/// summary values:SUM
/// summary=K&P&[K&[K&P&C&P]|K]&P|C&[P&P&C&P]&P&[C]
Method SqlFunction105Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&[K&[K&P&C&P]|K]&P|C&[P&P&C&P]&P&[C]
	; first rule summary K
	if '(..isKeywordInList($lb("SUM"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"SUM")  {
		if ..addPunctuation(subElement,"(")  {
			if ..SqlFunction106OptGrp(subElement,.addedElement)  {
				if ..SqlFunction109Sub(subElement,.addedElement)  {
					if ..SqlFunction110OptGrp(subElement,.addedElement)  {
						if ..addPunctuation(subElement,")")  {
							if $S(..SqlWindow(subElement,.addedElement) :1,1:1) {
								set done=1 ; end compileRules
							}
						}
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
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=K&[K&P&C&P]|K
Method SqlFunction106OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&[K&P&C&P]|K
	; first rule summary K&[K&P&C&P]
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SqlFunction107Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"ALL")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=1 /* failure rollsback but returns OK */
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  'distinct' ['by' '(' col_list ')']
/// summary values:DISTINCT
/// summary=K&[K&P&C&P]
Method SqlFunction107Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&[K&P&C&P]
	; first rule summary K
	if '(..isKeywordInList($lb("DISTINCT"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"DISTINCT")  {
		if ..SqlFunction108OptGrp(subElement,.addedElement)  {
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
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary values:BY
/// summary=K&P&C&P
Method SqlFunction108OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&C&P
	; first rule summary K
	if '(..isKeywordInList($lb("BY"),.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"BY")  {
		if ..addPunctuation(subElement,"(")  {
			if ..ColList(subElement,.addedElement)  {
				if ..addPunctuation(subElement,")")  {
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
		set ok=1 /* failure rollsback but returns OK */
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// '*' | sql_expression
/// summary=P|C
Method SqlFunction109Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|C
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"*")  {
		set done=1 ; or
	} elseif ..SqlExpression(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary values:%FOREACH
/// summary=P&P&C&P
Method SqlFunction110OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&P&C&P
	; first rule summary P
	if '(..isStringSingle("%FOREACH",.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"%FOREACH")  {
		if ..addPunctuation(subElement,"(")  {
			if ..ColList(subElement,.addedElement)  {
				if ..addPunctuation(subElement,")")  {
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
		set ok=1 /* failure rollsback but returns OK */
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 'avg' '(' [ ( 'distinct' ['by' '(' col_list ')'] ) | 'all' ] ('*' | sql_expression) [ '%FOREACH' '(' col_list ')' ] ')' [ sql_window ]
/// summary values:AVG
/// summary=K&P&[K&[K&P&C&P]|K]&P|C&[P&P&C&P]&P&[C]
Method SqlFunction111Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&[K&[K&P&C&P]|K]&P|C&[P&P&C&P]&P&[C]
	; first rule summary K
	if '(..isKeywordInList($lb("AVG"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"AVG")  {
		if ..addPunctuation(subElement,"(")  {
			if ..SqlFunction112OptGrp(subElement,.addedElement)  {
				if ..SqlFunction115Sub(subElement,.addedElement)  {
					if ..SqlFunction116OptGrp(subElement,.addedElement)  {
						if ..addPunctuation(subElement,")")  {
							if $S(..SqlWindow(subElement,.addedElement) :1,1:1) {
								set done=1 ; end compileRules
							}
						}
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
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=K&[K&P&C&P]|K
Method SqlFunction112OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&[K&P&C&P]|K
	; first rule summary K&[K&P&C&P]
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SqlFunction113Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"ALL")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=1 /* failure rollsback but returns OK */
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  'distinct' ['by' '(' col_list ')']
/// summary values:DISTINCT
/// summary=K&[K&P&C&P]
Method SqlFunction113Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&[K&P&C&P]
	; first rule summary K
	if '(..isKeywordInList($lb("DISTINCT"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"DISTINCT")  {
		if ..SqlFunction114OptGrp(subElement,.addedElement)  {
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
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary values:BY
/// summary=K&P&C&P
Method SqlFunction114OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&C&P
	; first rule summary K
	if '(..isKeywordInList($lb("BY"),.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"BY")  {
		if ..addPunctuation(subElement,"(")  {
			if ..ColList(subElement,.addedElement)  {
				if ..addPunctuation(subElement,")")  {
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
		set ok=1 /* failure rollsback but returns OK */
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// '*' | sql_expression
/// summary=P|C
Method SqlFunction115Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|C
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"*")  {
		set done=1 ; or
	} elseif ..SqlExpression(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary values:%FOREACH
/// summary=P&P&C&P
Method SqlFunction116OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&P&C&P
	; first rule summary P
	if '(..isStringSingle("%FOREACH",.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"%FOREACH")  {
		if ..addPunctuation(subElement,"(")  {
			if ..ColList(subElement,.addedElement)  {
				if ..addPunctuation(subElement,")")  {
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
		set ok=1 /* failure rollsback but returns OK */
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 'cast' '(' sql_expression 'as' identifier ['(' sql_expression ( ',' sql_expression)* ')' ] ')'
/// summary values:CAST
/// summary=K&P&C&K&C&[P&C&(?4punctuation:4?)*&P]&P
Method SqlFunction117Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&C&K&C&[P&C&(?4punctuation:4?)*&P]&P
	; first rule summary K
	if '(..isKeywordInList($lb("CAST"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"CAST")  {
		if ..addPunctuation(subElement,"(")  {
			if ..SqlExpression(subElement,.addedElement)  {
				if ..addKeyword(subElement,"AS")  {
					if ..Identifier(subElement,.addedElement)  {
						if ..SqlFunction118OptGrp(subElement,.addedElement)  {
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
		$$$BNFCOMMITCOPY(subElement,ParentElement)
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
/// summary=P&C&(?4punctuation:4?)*&P
Method SqlFunction118OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&(?4punctuation:4?)*&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"(")  {
		if ..SqlExpression(subElement,.addedElement)  {
			if ..SqlFunction119RepZero(subElement,.addedElement)  {
				if ..addPunctuation(subElement,")")  {
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
		set ok=1 /* failure rollsback but returns OK */
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ( ',' sql_expression)*
Method SqlFunction119RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..SqlFunction120Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' sql_expression
/// summary values:,
/// summary=P&C
Method SqlFunction120Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..SqlExpression(subElement,.addedElement)  {
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
	$$$DEBUGMethodEnd
	quit ok
}

/// 'exists' '(' subquery_specification ')'
/// summary values:EXISTS
/// summary=K&P&C&P
Method SqlFunction121Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&C&P
	; first rule summary K
	if '(..isKeywordInList($lb("EXISTS"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"EXISTS")  {
		if ..addPunctuation(subElement,"(")  {
			if ..SubquerySpecification(subElement,.addedElement)  {
				if ..addPunctuation(subElement,")")  {
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
	$$$DEBUGMethodEnd
	quit ok
}

/// 'list' '(' [ ( 'distinct' ['by' '(' col_list ')'] ) | 'all' ] ('*' | sql_expression) [ '%FOREACH' '(' col_list ')' ] ')'
/// summary values:LIST
/// summary=K&P&[K&[K&P&C&P]|K]&P|C&[P&P&C&P]&P
Method SqlFunction122Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&[K&[K&P&C&P]|K]&P|C&[P&P&C&P]&P
	; first rule summary K
	if '(..isKeywordInList($lb("LIST"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"LIST")  {
		if ..addPunctuation(subElement,"(")  {
			if ..SqlFunction123OptGrp(subElement,.addedElement)  {
				if ..SqlFunction126Sub(subElement,.addedElement)  {
					if ..SqlFunction127OptGrp(subElement,.addedElement)  {
						if ..addPunctuation(subElement,")")  {
							set done=1 ; end compileRules
						}
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
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=K&[K&P&C&P]|K
Method SqlFunction123OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&[K&P&C&P]|K
	; first rule summary K&[K&P&C&P]
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SqlFunction124Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"ALL")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=1 /* failure rollsback but returns OK */
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  'distinct' ['by' '(' col_list ')']
/// summary values:DISTINCT
/// summary=K&[K&P&C&P]
Method SqlFunction124Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&[K&P&C&P]
	; first rule summary K
	if '(..isKeywordInList($lb("DISTINCT"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"DISTINCT")  {
		if ..SqlFunction125OptGrp(subElement,.addedElement)  {
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
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary values:BY
/// summary=K&P&C&P
Method SqlFunction125OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&C&P
	; first rule summary K
	if '(..isKeywordInList($lb("BY"),.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"BY")  {
		if ..addPunctuation(subElement,"(")  {
			if ..ColList(subElement,.addedElement)  {
				if ..addPunctuation(subElement,")")  {
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
		set ok=1 /* failure rollsback but returns OK */
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// '*' | sql_expression
/// summary=P|C
Method SqlFunction126Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|C
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"*")  {
		set done=1 ; or
	} elseif ..SqlExpression(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary values:%FOREACH
/// summary=P&P&C&P
Method SqlFunction127OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&P&C&P
	; first rule summary P
	if '(..isStringSingle("%FOREACH",.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"%FOREACH")  {
		if ..addPunctuation(subElement,"(")  {
			if ..ColList(subElement,.addedElement)  {
				if ..addPunctuation(subElement,")")  {
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
		set ok=1 /* failure rollsback but returns OK */
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// '%dlist' '(' [ ( 'distinct' ['by' '(' col_list ')'] ) | 'all' ] ('*' | sql_expression) [ '%FOREACH' '(' col_list ')' ] ')'
/// summary values:%DLIST
/// summary=P&P&[K&[K&P&C&P]|K]&P|C&[P&P&C&P]&P
Method SqlFunction128Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&P&[K&[K&P&C&P]|K]&P|C&[P&P&C&P]&P
	; first rule summary P
	if '(..isStringSingle("%DLIST",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"%dlist")  {
		if ..addPunctuation(subElement,"(")  {
			if ..SqlFunction129OptGrp(subElement,.addedElement)  {
				if ..SqlFunction132Sub(subElement,.addedElement)  {
					if ..SqlFunction133OptGrp(subElement,.addedElement)  {
						if ..addPunctuation(subElement,")")  {
							set done=1 ; end compileRules
						}
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
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=K&[K&P&C&P]|K
Method SqlFunction129OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&[K&P&C&P]|K
	; first rule summary K&[K&P&C&P]
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SqlFunction130Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"ALL")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=1 /* failure rollsback but returns OK */
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  'distinct' ['by' '(' col_list ')']
/// summary values:DISTINCT
/// summary=K&[K&P&C&P]
Method SqlFunction130Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&[K&P&C&P]
	; first rule summary K
	if '(..isKeywordInList($lb("DISTINCT"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"DISTINCT")  {
		if ..SqlFunction131OptGrp(subElement,.addedElement)  {
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
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary values:BY
/// summary=K&P&C&P
Method SqlFunction131OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&C&P
	; first rule summary K
	if '(..isKeywordInList($lb("BY"),.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"BY")  {
		if ..addPunctuation(subElement,"(")  {
			if ..ColList(subElement,.addedElement)  {
				if ..addPunctuation(subElement,")")  {
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
		set ok=1 /* failure rollsback but returns OK */
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// '*' | sql_expression
/// summary=P|C
Method SqlFunction132Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|C
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"*")  {
		set done=1 ; or
	} elseif ..SqlExpression(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary values:%FOREACH
/// summary=P&P&C&P
Method SqlFunction133OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&P&C&P
	; first rule summary P
	if '(..isStringSingle("%FOREACH",.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"%FOREACH")  {
		if ..addPunctuation(subElement,"(")  {
			if ..ColList(subElement,.addedElement)  {
				if ..addPunctuation(subElement,")")  {
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
		set ok=1 /* failure rollsback but returns OK */
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 'FOR' 'SOME' '%ELEMENT' '(' sql_expression ')' sql_expression
/// summary values:FOR
/// summary=K&K&P&P&C&P&C
Method SqlFunction134Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&K&P&P&C&P&C
	; first rule summary K
	if '(..isKeywordInList($lb("FOR"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"FOR")  {
		if ..addKeyword(subElement,"SOME")  {
			if ..addPunctuation(subElement,"%ELEMENT")  {
				if ..addPunctuation(subElement,"(")  {
					if ..SqlExpression(subElement,.addedElement)  {
						if ..addPunctuation(subElement,")")  {
							if ..SqlExpression(subElement,.addedElement)  {
								set done=1 ; end compileRules
							}
						}
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
	$$$DEBUGMethodEnd
	quit ok
}

/// 'trim' '(' ['leading' | 'trailing' | 'both'] [(sql_expression 'from')] sql_expression ')'
/// summary values:TRIM
/// summary=K&P&[K|K|K]&[C&K]&C&P
Method SqlFunction135Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&[K|K|K]&[C&K]&C&P
	; first rule summary K
	if '(..isKeywordInList($lb("TRIM"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"TRIM")  {
		if ..addPunctuation(subElement,"(")  {
			if ..SqlFunction136OptGrp(subElement,.addedElement)  {
				if $S(..SqlFunction137Sub(subElement,.addedElement) :1,1:1) {
					if ..SqlExpression(subElement,.addedElement)  {
						if ..addPunctuation(subElement,")")  {
							set done=1 ; end compileRules
						}
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
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary values:LEADING,TRAILING,BOTH
/// summary=K|K|K
Method SqlFunction136OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K|K
	if '(..isKeywordInList($lb("LEADING","TRAILING","BOTH"),.value)) { quit 1 /* not found is OK */ }
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
	if ..addKeyword(subElement,"LEADING")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"TRAILING")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"BOTH")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=1 /* failure rollsback but returns OK */
	}
	quit ok
}

/// sql_expression 'from'
/// summary=C&K
Method SqlFunction137Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&K
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SqlExpression(subElement,.addedElement)  {
		if ..addKeyword(subElement,"FROM")  {
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
	$$$DEBUGMethodEnd
	quit ok
}

/// 'dateadd' '(' sql_function_datepart_part ',' sql_expression ',' sql_expression ')'
/// summary values:DATEADD
/// summary=K&P&C&P&C&P&C&P
Method SqlFunction138Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&C&P&C&P&C&P
	; first rule summary K
	if '(..isKeywordInList($lb("DATEADD"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"DATEADD")  {
		if ..addPunctuation(subElement,"(")  {
			if ..SqlFunctionDatepartPart(subElement,.addedElement)  {
				if ..addPunctuation(subElement,",")  {
					if ..SqlExpression(subElement,.addedElement)  {
						if ..addPunctuation(subElement,",")  {
							if ..SqlExpression(subElement,.addedElement)  {
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
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 'datediff' '(' sql_function_datepart_part ',' sql_expression ',' sql_expression ')'
/// summary values:DATEDIFF
/// summary=K&P&C&P&C&P&C&P
Method SqlFunction139Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&C&P&C&P&C&P
	; first rule summary K
	if '(..isKeywordInList($lb("DATEDIFF"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"DATEDIFF")  {
		if ..addPunctuation(subElement,"(")  {
			if ..SqlFunctionDatepartPart(subElement,.addedElement)  {
				if ..addPunctuation(subElement,",")  {
					if ..SqlExpression(subElement,.addedElement)  {
						if ..addPunctuation(subElement,",")  {
							if ..SqlExpression(subElement,.addedElement)  {
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
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 'datename' '(' sql_function_datepart_part ',' sql_expression ')'
/// summary values:DATENAME
/// summary=K&P&C&P&C&P
Method SqlFunction140Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&C&P&C&P
	; first rule summary K
	if '(..isKeywordInList($lb("DATENAME"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"DATENAME")  {
		if ..addPunctuation(subElement,"(")  {
			if ..SqlFunctionDatepartPart(subElement,.addedElement)  {
				if ..addPunctuation(subElement,",")  {
					if ..SqlExpression(subElement,.addedElement)  {
						if ..addPunctuation(subElement,")")  {
							set done=1 ; end compileRules
						}
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
	$$$DEBUGMethodEnd
	quit ok
}

/// 'datepart' '(' sql_function_datepart_part ',' sql_expression ')'
/// summary values:DATEPART
/// summary=K&P&C&P&C&P
Method SqlFunction141Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&C&P&C&P
	; first rule summary K
	if '(..isKeywordInList($lb("DATEPART"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"DATEPART")  {
		if ..addPunctuation(subElement,"(")  {
			if ..SqlFunctionDatepartPart(subElement,.addedElement)  {
				if ..addPunctuation(subElement,",")  {
					if ..SqlExpression(subElement,.addedElement)  {
						if ..addPunctuation(subElement,")")  {
							set done=1 ; end compileRules
						}
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
	$$$DEBUGMethodEnd
	quit ok
}

/// identifier '(' [ '*' | (sql_expression ( ',' sql_expression)*) ] ')' [ sql_window ]
/// summary=C&P&[P|C&(?4punctuation:4?)*]&P&[C]
Method SqlFunction142Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&P&[P|C&(?4punctuation:4?)*]&P&[C]
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Identifier(subElement,.addedElement)  {
		if ..addPunctuation(subElement,"(")  {
			if ..SqlFunction143OptGrp(subElement,.addedElement)  {
				if ..addPunctuation(subElement,")")  {
					if $S(..SqlWindow(subElement,.addedElement) :1,1:1) {
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
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=P|C&(?4punctuation:4?)*
Method SqlFunction143OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|C&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"*")  {
		set done=1 ; or
	} elseif ..SqlFunction144Sub(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=1 /* failure rollsback but returns OK */
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// sql_expression ( ',' sql_expression)*
/// summary=C&(?4punctuation:4?)*
Method SqlFunction144Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SqlExpression(subElement,.addedElement)  {
		if ..SqlFunction145RepZero(subElement,.addedElement)  {
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
	$$$DEBUGMethodEnd
	quit ok
}

///  ( ',' sql_expression)*
Method SqlFunction145RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..SqlFunction146Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' sql_expression
/// summary values:,
/// summary=P&C
Method SqlFunction146Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..SqlExpression(subElement,.addedElement)  {
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
	$$$DEBUGMethodEnd
	quit ok
}

/// '$' identifier '(' [ sql_expression ( ',' sql_expression)* ] ')'
/// summary values:$
/// summary=P&C&P&[C&(?4punctuation:4?)*]&P
Method SqlFunction84Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&P&[C&(?4punctuation:4?)*]&P
	; first rule summary P
	if '(..isStringSingle("$",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"$")  {
		if ..Identifier(subElement,.addedElement)  {
			if ..addPunctuation(subElement,"(")  {
				if ..SqlFunction85OptGrp(subElement,.addedElement)  {
					if ..addPunctuation(subElement,")")  {
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
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=C&(?4punctuation:4?)*
Method SqlFunction85OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SqlExpression(subElement,.addedElement)  {
		if ..SqlFunction86RepZero(subElement,.addedElement)  {
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
	$$$DEBUGMethodEnd
	quit ok
}

///  ( ',' sql_expression)*
Method SqlFunction86RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..SqlFunction87Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' sql_expression
/// summary values:,
/// summary=P&C
Method SqlFunction87Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..SqlExpression(subElement,.addedElement)  {
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
	$$$DEBUGMethodEnd
	quit ok
}

/// '%exact' sql_expression
/// summary values:%EXACT
/// summary=P&C
Method SqlFunction88Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle("%EXACT",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"%exact")  {
		if ..SqlExpression(subElement,.addedElement)  {
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
	$$$DEBUGMethodEnd
	quit ok
}

/// 'count' '(' ['distinct' | 'all' ] ('*' | sql_expression) [ '%FOREACH' '(' col_list ')' ] ')' [ sql_window ]
/// summary values:COUNT
/// summary=K&P&[K|K]&P|C&[P&P&C&P]&P&[C]
Method SqlFunction89Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&[K|K]&P|C&[P&P&C&P]&P&[C]
	; first rule summary K
	if '(..isKeywordInList($lb("COUNT"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"COUNT")  {
		if ..addPunctuation(subElement,"(")  {
			if ..SqlFunction90OptGrp(subElement,.addedElement)  {
				if ..SqlFunction91Sub(subElement,.addedElement)  {
					if ..SqlFunction92OptGrp(subElement,.addedElement)  {
						if ..addPunctuation(subElement,")")  {
							if $S(..SqlWindow(subElement,.addedElement) :1,1:1) {
								set done=1 ; end compileRules
							}
						}
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
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary values:DISTINCT,ALL
/// summary=K|K
Method SqlFunction90OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K
	if '(..isKeywordInList($lb("DISTINCT","ALL"),.value)) { quit 1 /* not found is OK */ }
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
	if ..addKeyword(subElement,"DISTINCT")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"ALL")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=1 /* failure rollsback but returns OK */
	}
	quit ok
}

/// '*' | sql_expression
/// summary=P|C
Method SqlFunction91Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|C
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"*")  {
		set done=1 ; or
	} elseif ..SqlExpression(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary values:%FOREACH
/// summary=P&P&C&P
Method SqlFunction92OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&P&C&P
	; first rule summary P
	if '(..isStringSingle("%FOREACH",.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"%FOREACH")  {
		if ..addPunctuation(subElement,"(")  {
			if ..ColList(subElement,.addedElement)  {
				if ..addPunctuation(subElement,")")  {
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
		set ok=1 /* failure rollsback but returns OK */
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 'min' '(' [ ( 'distinct' ['by' '(' col_list ')'] ) | 'all' ] ('*' | sql_expression) [ '%FOREACH' '(' col_list ')' ] ')' [ sql_window ]
/// summary values:MIN
/// summary=K&P&[K&[K&P&C&P]|K]&P|C&[P&P&C&P]&P&[C]
Method SqlFunction93Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&[K&[K&P&C&P]|K]&P|C&[P&P&C&P]&P&[C]
	; first rule summary K
	if '(..isKeywordInList($lb("MIN"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"MIN")  {
		if ..addPunctuation(subElement,"(")  {
			if ..SqlFunction94OptGrp(subElement,.addedElement)  {
				if ..SqlFunction97Sub(subElement,.addedElement)  {
					if ..SqlFunction98OptGrp(subElement,.addedElement)  {
						if ..addPunctuation(subElement,")")  {
							if $S(..SqlWindow(subElement,.addedElement) :1,1:1) {
								set done=1 ; end compileRules
							}
						}
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
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=K&[K&P&C&P]|K
Method SqlFunction94OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&[K&P&C&P]|K
	; first rule summary K&[K&P&C&P]
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SqlFunction95Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"ALL")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=1 /* failure rollsback but returns OK */
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  'distinct' ['by' '(' col_list ')']
/// summary values:DISTINCT
/// summary=K&[K&P&C&P]
Method SqlFunction95Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&[K&P&C&P]
	; first rule summary K
	if '(..isKeywordInList($lb("DISTINCT"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"DISTINCT")  {
		if ..SqlFunction96OptGrp(subElement,.addedElement)  {
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
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary values:BY
/// summary=K&P&C&P
Method SqlFunction96OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&C&P
	; first rule summary K
	if '(..isKeywordInList($lb("BY"),.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"BY")  {
		if ..addPunctuation(subElement,"(")  {
			if ..ColList(subElement,.addedElement)  {
				if ..addPunctuation(subElement,")")  {
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
		set ok=1 /* failure rollsback but returns OK */
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// '*' | sql_expression
/// summary=P|C
Method SqlFunction97Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|C
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"*")  {
		set done=1 ; or
	} elseif ..SqlExpression(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary values:%FOREACH
/// summary=P&P&C&P
Method SqlFunction98OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&P&C&P
	; first rule summary P
	if '(..isStringSingle("%FOREACH",.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"%FOREACH")  {
		if ..addPunctuation(subElement,"(")  {
			if ..ColList(subElement,.addedElement)  {
				if ..addPunctuation(subElement,")")  {
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
		set ok=1 /* failure rollsback but returns OK */
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 'max' '(' [ ( 'distinct' ['by' '(' col_list ')'] ) | 'all' ] ('*' | sql_expression) [ '%FOREACH' '(' col_list ')' ] ')' [ sql_window ]
/// summary values:MAX
/// summary=K&P&[K&[K&P&C&P]|K]&P|C&[P&P&C&P]&P&[C]
Method SqlFunction99Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&[K&[K&P&C&P]|K]&P|C&[P&P&C&P]&P&[C]
	; first rule summary K
	if '(..isKeywordInList($lb("MAX"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"MAX")  {
		if ..addPunctuation(subElement,"(")  {
			if ..SqlFunction100OptGrp(subElement,.addedElement)  {
				if ..SqlFunction103Sub(subElement,.addedElement)  {
					if ..SqlFunction104OptGrp(subElement,.addedElement)  {
						if ..addPunctuation(subElement,")")  {
							if $S(..SqlWindow(subElement,.addedElement) :1,1:1) {
								set done=1 ; end compileRules
							}
						}
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
	$$$DEBUGMethodEnd
	quit ok
}

///  sql_function_datepart_part ::= sql_function_datepart_part_word | sql_string | colon_sql_cos_variable
/// summary=C|C|C
Method SqlFunctionDatepartPart(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SqlFunctionDatepartPartWord(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlString(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ColonSqlCosVariable(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  sql_function_datepart_part_word ::= 'year' | 'yy' | 'yyyy' | 'quarter' | 'qq' | 'q' | 'month' | 'mm' | 'm' | 'week' | 'wk' | 'ww' | 'weekday' | 'dw' | 'w' | 'dayofyear' | 'dy' | 'y' | 'day' | 'dd' | 'd' | 'hour' | 'hh' | 'h' | 'minute' | 'mi' | 'n' | 'second' | 'ss' | 's' | 'millisecond' | 'ms' | 'sqltimestamp' | 'sts'
/// summary values:YEAR,YY,YYYY,QUARTER,QQ,Q,MONTH,MM,M,WEEK,WK,WW,WEEKDAY,DW,W,DAYOFYEAR,DY,Y,DAY,DD,D,HOUR,HH,H,MINUTE,MI,N,SECOND,SS,S,MILLISECOND,MS,SQLTIMESTAMP,STS
/// summary=K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K
Method SqlFunctionDatepartPartWord(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K
	if '(..isKeywordInList($lb("YEAR","YY","YYYY","QUARTER","QQ","Q","MONTH","MM","M","WEEK","WK","WW","WEEKDAY","DW","W","DAYOFYEAR","DY","Y","DAY","DD","D","HOUR","HH","H","MINUTE","MI","N","SECOND","SS","S","MILLISECOND","MS","SQLTIMESTAMP","STS"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"YEAR")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"YY")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"YYYY")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"QUARTER")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"QQ")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"Q")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"MONTH")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"MM")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"M")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"WEEK")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"WK")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"WW")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"WEEKDAY")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"DW")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"W")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"DAYOFYEAR")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"DY")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"Y")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"DAY")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"DD")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"D")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"HOUR")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"HH")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"H")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"MINUTE")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"MI")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"N")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"SECOND")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"SS")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"S")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"MILLISECOND")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"MS")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"SQLTIMESTAMP")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"STS")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  sql_monadicop ::= "+" | "-" | "NOT" | "%NOINDEX"
/// summary=P|P|K|P
Method SqlMonadicop(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|P|K|P
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"+")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"-")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"NOT")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"%NOINDEX")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  sql_number ::= 'NEED NUMBER'
/// summary values:NEED NUMBER
/// summary=P
Method SqlNumber(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("NEED NUMBER",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"NEED NUMBER")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  sql_predicate ::= "%STARTSWITH" | "BETWEEN" | "IS" | "IN" | "%INLIST" | "LIKE" | "%PATTERN" | "%MATCHES"
/// summary=P|K|K|K|P|K|P|P
Method SqlPredicate(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|K|K|K|P|K|P|P
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"%STARTSWITH")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"BETWEEN")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"IS")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"IN")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"%INLIST")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"LIKE")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"%PATTERN")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"%MATCHES")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  sql_primary ::= sql_number | sql_string | sql_case_expression | sql_fn_function | sql_function | colon_sql_cos_variable | stored_proc_call | column_reference | sql_special_variable | macrocall | ( '(' subquery_specification ')' ) | ( '(' sql_expression ( ',' sql_expression )* ')' )
/// summary=C|C|C|C|C|C|C|C|C|C|P&C&P|P&C&(?4punctuation:4?)*&P
Method SqlPrimary(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C|C|C|C|C|C|C|C|C|P&C&P|P&C&(?4punctuation:4?)*&P
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SqlNumber(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlString(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlCaseExpression(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlFnFunction(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlFunction(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ColonSqlCosVariable(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StoredProcCall(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ColumnReference(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlSpecialVariable(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Macrocall(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlPrimary76Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlPrimary77Sub(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  '(' subquery_specification ')'
/// summary values:(
/// summary=P&C&P
Method SqlPrimary76Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"(")  {
		if ..SubquerySpecification(subElement,.addedElement)  {
			if ..addPunctuation(subElement,")")  {
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
	$$$DEBUGMethodEnd
	quit ok
}

///  '(' sql_expression ( ',' sql_expression )* ')'
/// summary values:(
/// summary=P&C&(?4punctuation:4?)*&P
Method SqlPrimary77Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&(?4punctuation:4?)*&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"(")  {
		if ..SqlExpression(subElement,.addedElement)  {
			if ..SqlPrimary78RepZero(subElement,.addedElement)  {
				if ..addPunctuation(subElement,")")  {
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
	$$$DEBUGMethodEnd
	quit ok
}

///  ( ',' sql_expression )*
Method SqlPrimary78RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..SqlPrimary79Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' sql_expression
/// summary values:,
/// summary=P&C
Method SqlPrimary79Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..SqlExpression(subElement,.addedElement)  {
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
	$$$DEBUGMethodEnd
	quit ok
}

///  sql_program ::= query_specification | call_command | insert_command | update_command | declare_command | open_command | fetch_command | close_command | delete_command | CHECKPRIV_command
/// summary=C|C|C|C|C|C|C|C|C|C
Method SqlProgram(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C|C|C|C|C|C|C|C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..QuerySpecification(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CallCommand(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..InsertCommand(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..UpdateCommand(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..DeclareCommand(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OpenCommand(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..FetchCommand(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CloseCommand(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..DeleteCommand(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CheckprivCommand(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  sql_special_variable ::= 'NULL' | '?' | '$H' | '$ZNSPACE'
/// summary=K|P|P|P
Method SqlSpecialVariable(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|P|P|P
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"NULL")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"?")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"$H")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"$ZNSPACE")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  sql_string ::= 'NEED STRING'
/// summary values:NEED STRING
/// summary=P
Method SqlString(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("NEED STRING",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"NEED STRING")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  sql_term ::= sql_primary
/// summary=C
Method SqlTerm(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SqlPrimary(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  sql_window ::= 'OVER' '(' [ sql_window_partition ] [ order_by_clause ] [ (sql_window_rows_between | sql_window_rows ) ] ')'
/// summary values:OVER
/// summary=K&P&[C]&[C]&[C|C]&P
Method SqlWindow(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&[C]&[C]&[C|C]&P
	; first rule summary K
	if '(..isKeywordInList($lb("OVER"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"OVER")  {
		if ..addPunctuation(subElement,"(")  {
			if $S(..SqlWindowPartition(subElement,.addedElement) :1,1:1) {
				if $S(..OrderByClause(subElement,.addedElement) :1,1:1) {
					if $S(..SqlWindow147Sub(subElement,.addedElement) :1,1:1) {
						if ..addPunctuation(subElement,")")  {
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

/// sql_window_rows_between | sql_window_rows
/// summary=C|C
Method SqlWindow147Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
	if ..SqlWindowRowsBetween(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlWindowRows(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  sql_window_frame ::= ('UNBOUNDED' 'PRECEDING') | (sql_expression 'PRECEDING') | ('CURRENT' 'ROW') | ('UNBOUNDED' 'FOLLOWING') | (sql_expression 'FOLLOWING')
/// summary=K&K|C&K|K&K|K&K|C&K
Method SqlWindowFrame(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&K|C&K|K&K|K&K|C&K
	; first rule summary K&K
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SqlWindowFrame148Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlWindowFrame149Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlWindowFrame150Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlWindowFrame151Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlWindowFrame152Sub(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 'UNBOUNDED' 'PRECEDING'
/// summary values:UNBOUNDED
/// summary=K&K
Method SqlWindowFrame148Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&K
	; first rule summary K
	if '(..isKeywordInList($lb("UNBOUNDED"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"UNBOUNDED")  {
		if ..addKeyword(subElement,"PRECEDING")  {
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
	$$$DEBUGMethodEnd
	quit ok
}

/// sql_expression 'PRECEDING'
/// summary=C&K
Method SqlWindowFrame149Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&K
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SqlExpression(subElement,.addedElement)  {
		if ..addKeyword(subElement,"PRECEDING")  {
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
	$$$DEBUGMethodEnd
	quit ok
}

/// 'CURRENT' 'ROW'
/// summary values:CURRENT
/// summary=K&K
Method SqlWindowFrame150Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&K
	; first rule summary K
	if '(..isKeywordInList($lb("CURRENT"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"CURRENT")  {
		if ..addKeyword(subElement,"ROW")  {
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
	$$$DEBUGMethodEnd
	quit ok
}

/// 'UNBOUNDED' 'FOLLOWING'
/// summary values:UNBOUNDED
/// summary=K&K
Method SqlWindowFrame151Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&K
	; first rule summary K
	if '(..isKeywordInList($lb("UNBOUNDED"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"UNBOUNDED")  {
		if ..addKeyword(subElement,"FOLLOWING")  {
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
	$$$DEBUGMethodEnd
	quit ok
}

/// sql_expression 'FOLLOWING'
/// summary=C&K
Method SqlWindowFrame152Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&K
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SqlExpression(subElement,.addedElement)  {
		if ..addKeyword(subElement,"FOLLOWING")  {
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
	$$$DEBUGMethodEnd
	quit ok
}

///  sql_window_partition ::= 'PARTITION' 'BY' col_list
/// summary values:PARTITION
/// summary=K&K&C
Method SqlWindowPartition(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&K&C
	; first rule summary K
	if '(..isKeywordInList($lb("PARTITION"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"PARTITION")  {
		if ..addKeyword(subElement,"BY")  {
			if ..ColList(subElement,.addedElement)  {
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

///  sql_window_rows ::= 'ROWS' sql_window_frame
/// summary values:ROWS
/// summary=K&C
Method SqlWindowRows(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C
	; first rule summary K
	if '(..isKeywordInList($lb("ROWS"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"ROWS")  {
		if ..SqlWindowFrame(subElement,.addedElement)  {
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

///  sql_window_rows_between ::= 'ROWS' 'BETWEEN' sql_window_frame 'AND' sql_window_frame
/// summary values:ROWS
/// summary=K&K&C&K&C
Method SqlWindowRowsBetween(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&K&C&K&C
	; first rule summary K
	if '(..isKeywordInList($lb("ROWS"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"ROWS")  {
		if ..addKeyword(subElement,"BETWEEN")  {
			if ..SqlWindowFrame(subElement,.addedElement)  {
				if ..addKeyword(subElement,"AND")  {
					if ..SqlWindowFrame(subElement,.addedElement)  {
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

///  stored_proc_call ::= stored_proc_name stored_proc_parameter_list
/// summary=C&C
Method StoredProcCall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..StoredProcName(subElement,.addedElement)  {
		if ..StoredProcParameterList(subElement,.addedElement)  {
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

///  stored_proc_name ::= [ schema_name '.' ] qualified_identifier
/// summary=[C&P]&C
Method StoredProcName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary [C&P]&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..StoredProcName167OptGrp(subElement,.addedElement)  {
		if ..QualifiedIdentifier(subElement,.addedElement)  {
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
Method StoredProcName167OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&P
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SchemaName(subElement,.addedElement)  {
		if ..addPunctuation(subElement,".")  {
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
	$$$DEBUGMethodEnd
	quit ok
}

///  stored_proc_parameter ::= sql_expression
/// summary=C
Method StoredProcParameter(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SqlExpression(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  stored_proc_parameter_list ::= '(' [ [stored_proc_parameter] ( ',' [stored_proc_parameter] )* ] ')'
/// summary values:(
/// summary=P&[[C]&(?4punctuation:4?)*]&P
Method StoredProcParameterList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&[[C]&(?4punctuation:4?)*]&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"(")  {
		if ..StoredProcParameterList164OptGrp(subElement,.addedElement)  {
			if ..addPunctuation(subElement,")")  {
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
Method StoredProcParameterList164OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary [C]&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..StoredProcParameter(subElement,.addedElement) :1,1:1) {
		if ..StoredProcParameterList165RepZero(subElement,.addedElement)  {
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
	$$$DEBUGMethodEnd
	quit ok
}

///  ( ',' [stored_proc_parameter] )*
Method StoredProcParameterList165RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..StoredProcParameterList166Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' [stored_proc_parameter]
/// summary values:,
/// summary=P&[C]
Method StoredProcParameterList166Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&[C]
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if $S(..StoredProcParameter(subElement,.addedElement) :1,1:1) {
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
	$$$DEBUGMethodEnd
	quit ok
}

///  stored_proc_table ::= stored_proc_name stored_proc_parameter_list [ table_as_clause ]
/// summary=C&C&[C]
Method StoredProcTable(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&C&[C]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..StoredProcName(subElement,.addedElement)  {
		if ..StoredProcParameterList(subElement,.addedElement)  {
			if $S(..TableAsClause(subElement,.addedElement) :1,1:1) {
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

///  subquery ::= '(' query_expression ')'
/// summary values:(
/// summary=P&C&P
Method Subquery(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"(")  {
		if ..QueryExpression(subElement,.addedElement)  {
			if ..addPunctuation(subElement,")")  {
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

///  subquery_specification ::= select_command ( union select_command )*
/// summary=C&(?4punctuation:4?)*
Method SubquerySpecification(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SelectCommand(subElement,.addedElement)  {
		if ..SubquerySpecification3RepZero(subElement,.addedElement)  {
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

///  ( union select_command )*
Method SubquerySpecification3RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..SubquerySpecification4Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  union select_command
/// summary=C&C
Method SubquerySpecification4Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&C
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Union(subElement,.addedElement)  {
		if ..SelectCommand(subElement,.addedElement)  {
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
	$$$DEBUGMethodEnd
	quit ok
}

///  table_as_clause ::= [ 'AS' ] alias_name
/// summary=[K]&C
Method TableAsClause(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary [K]&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..addKeyword(subElement,"AS") :1,1:1) {
		if ..AliasName(subElement,.addedElement)  {
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

///  table_expression ::= from_clause [ where_clause ] [ group_by_clause ] [ having_clause ] [ order_by_clause ]
/// summary=C&[C]&[C]&[C]&[C]
Method TableExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&[C]&[C]&[C]&[C]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..FromClause(subElement,.addedElement)  {
		if $S(..WhereClause(subElement,.addedElement) :1,1:1) {
			if $S(..GroupByClause(subElement,.addedElement) :1,1:1) {
				if $S(..HavingClause(subElement,.addedElement) :1,1:1) {
					if $S(..OrderByClause(subElement,.addedElement) :1,1:1) {
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

///  table_name ::= [ schema_name '.' ] qualified_identifier
/// summary=[C&P]&C
Method TableName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary [C&P]&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..TableName47OptGrp(subElement,.addedElement)  {
		if ..QualifiedIdentifier(subElement,.addedElement)  {
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
Method TableName47OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&P
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SchemaName(subElement,.addedElement)  {
		if ..addPunctuation(subElement,".")  {
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
	$$$DEBUGMethodEnd
	quit ok
}

///  table_reference ::= stored_proc_table | direct_table | derived_table
/// summary=C|C|C
Method TableReference(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..StoredProcTable(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..DirectTable(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..DerivedTable(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  table_reference_noalias ::= direct_table_noalias | derived_table_noalias
/// summary=C|C
Method TableReferenceNoalias(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..DirectTableNoalias(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..DerivedTableNoalias(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  table_subquery ::= subquery
/// summary=C
Method TableSubquery(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Subquery(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  union ::= 'UNION' ('ALL' | '%PARALLEL')*
/// summary values:UNION
/// summary=K&(?4punctuation:4?)*
Method Union(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&(?4punctuation:4?)*
	; first rule summary K
	if '(..isKeywordInList($lb("UNION"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"UNION")  {
		if ..Union42RepZero(subElement,.addedElement)  {
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

///  ('ALL' | '%PARALLEL')*
Method Union42RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..Union43Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// 'ALL' | '%PARALLEL'
/// summary=K|P
Method Union43Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|P
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"ALL")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"%PARALLEL")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  update_columns ::= '(' column_name ( ',' column_name)* ')'
/// summary values:(
/// summary=P&C&(?4punctuation:4?)*&P
Method UpdateColumns(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&(?4punctuation:4?)*&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"(")  {
		if ..ColumnName(subElement,.addedElement)  {
			if ..UpdateColumns61RepZero(subElement,.addedElement)  {
				if ..addPunctuation(subElement,")")  {
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

///  ( ',' column_name)*
Method UpdateColumns61RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..UpdateColumns62Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' column_name
/// summary values:,
/// summary=P&C
Method UpdateColumns62Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..ColumnName(subElement,.addedElement)  {
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
	$$$DEBUGMethodEnd
	quit ok
}

///  update_command ::= 'UPDATE' (update_keyword)* direct_table ( ('SET' update_set (',' update_set)* ) | ( update_columns (('VALUES' update_values) | select_command) ) ) [where_clause]
/// summary values:UPDATE
/// summary=K&(?4punctuation:4?)*&C&K&C&(?4punctuation:4?)*|C&K&C|C&[C]
Method UpdateCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&(?4punctuation:4?)*&C&K&C&(?4punctuation:4?)*|C&K&C|C&[C]
	; first rule summary K
	if '(..isKeywordInList($lb("UPDATE"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"UPDATE")  {
		if ..UpdateCommand52RepZero(subElement,.addedElement)  {
			if ..DirectTable(subElement,.addedElement)  {
				if ..UpdateCommand54Sub(subElement,.addedElement)  {
					if $S(..WhereClause(subElement,.addedElement) :1,1:1) {
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

///  (update_keyword)*
Method UpdateCommand52RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..UpdateCommand53Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// update_keyword
/// summary=C
Method UpdateCommand53Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
	if ..UpdateKeyword(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  ('SET' update_set (',' update_set)* ) | ( update_columns (('VALUES' update_values) | select_command) )
/// summary=K&C&(?4punctuation:4?)*|C&K&C|C
Method UpdateCommand54Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C&(?4punctuation:4?)*|C&K&C|C
	; first rule summary K&C&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..UpdateCommand55Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..UpdateCommand58Sub(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 'SET' update_set (',' update_set)*
/// summary values:SET
/// summary=K&C&(?4punctuation:4?)*
Method UpdateCommand55Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C&(?4punctuation:4?)*
	; first rule summary K
	if '(..isKeywordInList($lb("SET"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"SET")  {
		if ..UpdateSet(subElement,.addedElement)  {
			if ..UpdateCommand56RepZero(subElement,.addedElement)  {
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
	$$$DEBUGMethodEnd
	quit ok
}

///  (',' update_set)*
Method UpdateCommand56RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..UpdateCommand57Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// ',' update_set
/// summary values:,
/// summary=P&C
Method UpdateCommand57Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..UpdateSet(subElement,.addedElement)  {
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
	$$$DEBUGMethodEnd
	quit ok
}

///  update_columns (('VALUES' update_values) | select_command)
/// summary=C&K&C|C
Method UpdateCommand58Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&K&C|C
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..UpdateColumns(subElement,.addedElement)  {
		if ..UpdateCommand59Sub(subElement,.addedElement)  {
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
	$$$DEBUGMethodEnd
	quit ok
}

/// ('VALUES' update_values) | select_command
/// summary=K&C|C
Method UpdateCommand59Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C|C
	; first rule summary K&C
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..UpdateCommand60Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SelectCommand(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 'VALUES' update_values
/// summary values:VALUES
/// summary=K&C
Method UpdateCommand60Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C
	; first rule summary K
	if '(..isKeywordInList($lb("VALUES"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"VALUES")  {
		if ..UpdateValues(subElement,.addedElement)  {
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
	$$$DEBUGMethodEnd
	quit ok
}

///  update_keyword ::= '%NOCHECK' | '%NOFPLAN' | '%NOINDEX' | '%NOJOURN' | '%NOLOCK' | '%NOTRIGGER' | '%PROFILE_ALL' | '%PROFILE_ALL'
/// summary values:%NOCHECK,%NOFPLAN,%NOINDEX,%NOJOURN,%NOLOCK,%NOTRIGGER,%PROFILE_ALL,%PROFILE_ALL
/// summary=P|P|P|P|P|P|P|P
Method UpdateKeyword(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|P|P|P|P|P|P|P
	if '(..isStringInList($lb("%NOCHECK","%NOFPLAN","%NOINDEX","%NOJOURN","%NOLOCK","%NOTRIGGER","%PROFILE_ALL","%PROFILE_ALL"),12,.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"%NOCHECK")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"%NOFPLAN")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"%NOINDEX")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"%NOJOURN")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"%NOLOCK")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"%NOTRIGGER")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"%PROFILE_ALL")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"%PROFILE_ALL")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  update_set ::= column_reference '=' sql_expression
/// summary=C&P&C
Method UpdateSet(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&P&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ColumnReference(subElement,.addedElement)  {
		if ..addPunctuation(subElement,"=")  {
			if ..SqlExpression(subElement,.addedElement)  {
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

///  update_values ::= '(' sql_expression ( ',' sql_expression )* ')'
/// summary values:(
/// summary=P&C&(?4punctuation:4?)*&P
Method UpdateValues(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&(?4punctuation:4?)*&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"(")  {
		if ..SqlExpression(subElement,.addedElement)  {
			if ..UpdateValues63RepZero(subElement,.addedElement)  {
				if ..addPunctuation(subElement,")")  {
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

///  ( ',' sql_expression )*
Method UpdateValues63RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..UpdateValues64Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' sql_expression
/// summary values:,
/// summary=P&C
Method UpdateValues64Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..SqlExpression(subElement,.addedElement)  {
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
	$$$DEBUGMethodEnd
	quit ok
}

///  where_clause ::= 'WHERE' sql_expression
/// summary values:WHERE
/// summary=K&C
Method WhereClause(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C
	; first rule summary K
	if '(..isKeywordInList($lb("WHERE"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"WHERE")  {
		if ..SqlExpression(subElement,.addedElement)  {
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

///  with_clause ::= alias_name 'AS' '(' select_command ')'
/// summary=C&K&P&C&P
Method WithClause(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&K&P&C&P
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..AliasName(subElement,.addedElement)  {
		if ..addKeyword(subElement,"AS")  {
			if ..addPunctuation(subElement,"(")  {
				if ..SelectCommand(subElement,.addedElement)  {
					if ..addPunctuation(subElement,")")  {
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

///  with_command ::= 'WITH' with_clause (',' with_clause)*
/// summary values:WITH
/// summary=K&C&(?4punctuation:4?)*
Method WithCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C&(?4punctuation:4?)*
	; first rule summary K
	if '(..isKeywordInList($lb("WITH"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"WITH")  {
		if ..WithClause(subElement,.addedElement)  {
			if ..WithCommand5RepZero(subElement,.addedElement)  {
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

///  (',' with_clause)*
Method WithCommand5RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..WithCommand6Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// ',' with_clause
/// summary values:,
/// summary=P&C
Method WithCommand6Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..WithClause(subElement,.addedElement)  {
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
	$$$DEBUGMethodEnd
	quit ok
}

Method newElement(Type As %String) As PXW.DEV.BNF.Elements.SQL
{
	quit ##class(PXW.DEV.BNF.Elements.SQL).%New(Type)
}

}
