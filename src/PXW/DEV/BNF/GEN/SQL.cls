Class PXW.DEV.BNF.GEN.SQL Extends PXW.DEV.BNF.super [ ProcedureBlock ]
{

Parameter KeywordPattern = "1.A";

Parameter Keywords = "ALL,AND,AS,ASC,AVG,BETWEEN,BOTH,BY,CALL,CASE,CAST,CLOSE,COUNT,CROSS,CURRENT,CURSOR,D,DATEADD,DATEDIFF,DATENAME,DATEPART,DAY,DAYOFYEAR,DD,DECLARE,DELETE,DESC,DISTINCT,DROP,DW,DY,E,ELSE,END,ESCAPE,EXECUTE,EXISTS,FETCH,FN,FOLLOWING,FOR,FROM,FULL,GROUP,H,HAVING,HH,HOUR,IN,INNER,INSERT,INTO,IS,JOIN,LEADING,LEFT,LIKE,LIST,M,MAX,MI,MILLISECOND,MIN,MINUTE,MM,MONTH,MS,N,NATURAL,NOT,NULL,ON,ONLY,OPEN,OR,ORDER,OUTER,OVER,PARTITION,PRECEDING,Q,QQ,QUARTER,READ,REFERENCES,RIGHT,ROW,ROWS,S,SECOND,SELECT,SET,SIZE,SOME,SQLTIMESTAMP,SS,STS,SUM,TABLE,THEN,TOP,TRAILING,TRIM,UNBOUNDED,UNION,UPDATE,USING,VALUES,VIEW,W,WEEK,WEEKDAY,WHEN,WHERE,WITH,WK,WW,Y,YEAR,YY,YYYY";

///  alias_name ::= identifier
/// summary=C
Method AliasName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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

///  as_clause ::= [ 'AS' ] column_name
/// summary=[K]&C
Method AsClause(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary [K]&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..addKeyword(.subElement,"AS") :1,1:1) {
		if ..ColumnName(.subElement,.addedElement)  {
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

///  bracket_table ::= '(' ( (bracket_table join*) | (table_reference join*) ) ')'
/// summary values:(
/// summary=P&((C&(?4Call:4?)*)|(C&(?4Call:4?)*))&P
Method BracketTable(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&((C&(?4Call:4?)*)|(C&(?4Call:4?)*))&P
	if '..isPunctuation("(",1) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if ..BracketTable1Sub(.subElement,.addedElement)  {
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

///  (bracket_table join*) | (table_reference join*)
/// summary=(C&(?4Call:4?)*)|(C&(?4Call:4?)*)
Method BracketTable1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary (C&(?4Call:4?)*)|(C&(?4Call:4?)*)
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..BracketTable2Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..BracketTable4Sub(.subElement,.addedElement)  {
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

/// bracket_table join*
/// summary=C&(?4Call:4?)*
Method BracketTable2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&(?4Call:4?)*
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..BracketTable(.subElement,.addedElement)  {
		if ..BracketTable3RepZero(.subElement,.addedElement)  {
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

///  join*
Method BracketTable3RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4Call:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..Join(.subElement,.addedElement)  {
		set done=1
	}
	set ok=1
	quit ok
}

/// table_reference join*
/// summary=C&(?4Call:4?)*
Method BracketTable4Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&(?4Call:4?)*
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..TableReference(.subElement,.addedElement)  {
		if ..BracketTable5RepZero(.subElement,.addedElement)  {
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

///  join*
Method BracketTable5RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4Call:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..Join(.subElement,.addedElement)  {
		set done=1
	}
	set ok=1
	quit ok
}

///  call_command ::= 'CALL' stored_proc_call
/// summary values:CALL
/// summary=K&C
Method CallCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C
	if '(..isKeyword("CALL")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"CALL")  {
		if ..StoredProcCall(.subElement,.addedElement)  {
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

///  CHECKPRIV_command ::= '%CHECKPRIV' checkpriv_objpriv [ '(' column_name ( ',' column_name)* ')' ] 'ON' table_reference
/// summary values:%CHECKPRIV
/// summary=P&C&[P&C&(?4punctuation:4?)*&P]&K&C
Method CheckprivCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&[P&C&(?4punctuation:4?)*&P]&K&C
	if '..isPunctuation("%CHECKPRIV",10) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"%CHECKPRIV")  {
		if ..CheckprivObjpriv(.subElement,.addedElement)  {
			if ..CheckprivCommand1OptGrp(.subElement,.addedElement)  {
				if ..addKeyword(.subElement,"ON")  {
					if ..TableReference(.subElement,.addedElement)  {
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
/// summary values:(
/// summary=P&C&(?4punctuation:4?)*&P
Method CheckprivCommand1OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&(?4punctuation:4?)*&P
	if '..isPunctuation("(",1) { quit 1 /* not found is OK */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if ..ColumnName(.subElement,.addedElement)  {
			if ..CheckprivCommand2RepZero(.subElement,.addedElement)  {
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
		set ok=1 /* failure rollsback but returns OK */
	}
	quit ok
}

///  ( ',' column_name)*
Method CheckprivCommand2RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..CheckprivCommand3Sub(.subElement,.addedElement)  {
		set done=1
	}
	set ok=1
	quit ok
}

///  ',' column_name
/// summary values:,
/// summary=P&C
Method CheckprivCommand3Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation(",",1) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..ColumnName(.subElement,.addedElement)  {
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

///  checkpriv_objpriv ::= '%ALTER' | 'DELETE' | 'SELECT' | 'INSERT' | 'UPDATE' | 'EXECUTE' | 'REFERENCES'
/// summary=P|K|K|K|K|K|K
Method CheckprivObjpriv(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|K|K|K|K|K|K
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"%ALTER")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"DELETE")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"SELECT")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"INSERT")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"UPDATE")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"EXECUTE")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"REFERENCES")  {
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

///  close_command ::= 'CLOSE' cursor_name
/// summary values:CLOSE
/// summary=K&C
Method CloseCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C
	if '(..isKeyword("CLOSE")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"CLOSE")  {
		if ..CursorName(.subElement,.addedElement)  {
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

///  col_list ::= column_reference ( ',' column_reference )*
/// summary=C&(?4punctuation:4?)*
Method ColList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ColumnReference(.subElement,.addedElement)  {
		if ..ColList1RepZero(.subElement,.addedElement)  {
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

///  ( ',' column_reference )*
Method ColList1RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ColList2Sub(.subElement,.addedElement)  {
		set done=1
	}
	set ok=1
	quit ok
}

///  ',' column_reference
/// summary values:,
/// summary=P&C
Method ColList2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation(",",1) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..ColumnReference(.subElement,.addedElement)  {
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

///  colon_sql_cos_variable ::= ':' sql_cos_variable
/// summary values::
/// summary=P&C
Method ColonSqlCosVariable(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C
	if '..isPunctuation(":",1) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,":")  {
		if ..SqlCosVariable(.subElement,.addedElement)  {
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

///  column_name ::= identifier
/// summary=C
Method ColumnName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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
		set ok=0
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
	if ..ColumnName(.subElement,.addedElement)  {
		if ..ColumnNameList1RepZero(.subElement,.addedElement)  {
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

///  ( ',' column_name )*
Method ColumnNameList1RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ColumnNameList2Sub(.subElement,.addedElement)  {
		set done=1
	}
	set ok=1
	quit ok
}

///  ',' column_name
/// summary values:,
/// summary=P&C
Method ColumnNameList2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation(",",1) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..ColumnName(.subElement,.addedElement)  {
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

///  column_reference ::= [ alias_name '.' ] column_name [column_reference_implicit]
/// summary=[C&P]&C&[C]
Method ColumnReference(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary [C&P]&C&[C]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ColumnReference1OptGrp(.subElement,.addedElement)  {
		if ..ColumnName(.subElement,.addedElement)  {
			if $S(..ColumnReferenceImplicit(.subElement,.addedElement) :1,1:1) {
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
/// summary=C&P
Method ColumnReference1OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&P
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..AliasName(.subElement,.addedElement)  {
		if ..addPunctuation(.subElement,".")  {
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

///  column_reference_implicit ::= ('->' column_name)*
/// summary=(?4punctuation:4?)*
Method ColumnReferenceImplicit(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ColumnReferenceImplicit1RepZero(.subElement,.addedElement)  {
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

///  ('->' column_name)*
Method ColumnReferenceImplicit1RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ColumnReferenceImplicit2Sub(.subElement,.addedElement)  {
		set done=1
	}
	set ok=1
	quit ok
}

/// '->' column_name
/// summary values:->
/// summary=P&C
Method ColumnReferenceImplicit2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation("->",2) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"->")  {
		if ..ColumnName(.subElement,.addedElement)  {
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

///  cross_join ::= table_reference 'CROSS' 'JOIN' table_reference
/// summary=C&K&K&C
Method CrossJoin(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&K&K&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..TableReference(.subElement,.addedElement)  {
		if ..addKeyword(.subElement,"CROSS")  {
			if ..addKeyword(.subElement,"JOIN")  {
				if ..TableReference(.subElement,.addedElement)  {
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

///  cursor_name ::= identifier
/// summary=C
Method CursorName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  declare_command ::= 'DECLARE' cursor_name 'CURSOR' 'FOR' query_specification [ 'FOR' ('UPDATE' | ('READ' 'ONLY'))]
/// summary values:DECLARE
/// summary=K&C&K&K&C&[K&(K|(K&K))]
Method DeclareCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C&K&K&C&[K&(K|(K&K))]
	if '(..isKeyword("DECLARE")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"DECLARE")  {
		if ..CursorName(.subElement,.addedElement)  {
			if ..addKeyword(.subElement,"CURSOR")  {
				if ..addKeyword(.subElement,"FOR")  {
					if ..QuerySpecification(.subElement,.addedElement)  {
						if ..DeclareCommand1OptGrp(.subElement,.addedElement)  {
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

/// 
/// summary values:FOR
/// summary=K&(K|(K&K))
Method DeclareCommand1OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&(K|(K&K))
	if '(..isKeyword("FOR")) { quit 1 /* not found is OK */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"FOR")  {
		if ..DeclareCommand2Sub(.subElement,.addedElement)  {
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

/// 'UPDATE' | ('READ' 'ONLY')
/// summary=K|(K&K)
Method DeclareCommand2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K|(K&K)
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"UPDATE")  {
		set done=1 ; or
	} elseif ..DeclareCommand3Sub(.subElement,.addedElement)  {
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

/// 'READ' 'ONLY'
/// summary values:READ
/// summary=K&K
Method DeclareCommand3Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&K
	if '(..isKeyword("READ")) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"READ")  {
		if ..addKeyword(.subElement,"ONLY")  {
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

///  delete_command ::= 'DELETE' (update_keyword)* ['FROM'] direct_table [ where_clause ]
/// summary values:DELETE
/// summary=K&(?4punctuation:4?)*&[K]&C&[C]
Method DeleteCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&(?4punctuation:4?)*&[K]&C&[C]
	if '(..isKeyword("DELETE")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"DELETE")  {
		if ..DeleteCommand1RepZero(.subElement,.addedElement)  {
			if $S(..addKeyword(.subElement,"FROM") :1,1:1) {
				if ..DirectTable(.subElement,.addedElement)  {
					if $S(..WhereClause(.subElement,.addedElement) :1,1:1) {
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

///  (update_keyword)*
Method DeleteCommand1RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..DeleteCommand2Sub(.subElement,.addedElement)  {
		set done=1
	}
	set ok=1
	quit ok
}

/// update_keyword
/// summary=C
Method DeleteCommand2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C
	set subElement=ParentElement
	set done=0 ; method start
	if ..UpdateKeyword(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
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
	if ..SqlExpression(.subElement,.addedElement)  {
		if $S(..AsClause(.subElement,.addedElement) :1,1:1) {
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

///  derived_table ::= table_subquery [ table_as_clause ]
/// summary=C&[C]
Method DerivedTable(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&[C]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..TableSubquery(.subElement,.addedElement)  {
		if $S(..TableAsClause(.subElement,.addedElement) :1,1:1) {
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

///  derived_table_noalias ::= table_subquery
/// summary=C
Method DerivedTableNoalias(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..TableSubquery(.subElement,.addedElement)  {
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

///  direct_table ::= table_name [ table_as_clause ]
/// summary=C&[C]
Method DirectTable(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&[C]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..TableName(.subElement,.addedElement)  {
		if $S(..TableAsClause(.subElement,.addedElement) :1,1:1) {
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

///  direct_table_noalias ::= table_name
/// summary=C
Method DirectTableNoalias(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..TableName(.subElement,.addedElement)  {
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

///  drop_command ::= 'DROP' ( 'VIEW' | 'TABLE' ) direct_table
/// summary values:DROP
/// summary=K&(K|K)&C
Method DropCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&(K|K)&C
	if '(..isKeyword("DROP")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"DROP")  {
		if ..DropCommand1Sub(.subElement,.addedElement)  {
			if ..DirectTable(.subElement,.addedElement)  {
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

///  'VIEW' | 'TABLE'
/// summary values:VIEW,TABLE
/// summary=K|K
Method DropCommand1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K|K
	if '(..isKeywordInList($lb("VIEW","TABLE"))) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"VIEW")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"TABLE")  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

///  fetch_command ::= 'FETCH' cursor_name [ select_into ]
/// summary values:FETCH
/// summary=K&C&[C]
Method FetchCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C&[C]
	if '(..isKeyword("FETCH")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"FETCH")  {
		if ..CursorName(.subElement,.addedElement)  {
			if $S(..SelectInto(.subElement,.addedElement) :1,1:1) {
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

///  from_clause ::= 'FROM' [from_optimise_list] ( bracket_table | (( table_reference) [ ( ',' table_reference )* ] ( join )*) )
/// summary values:FROM
/// summary=K&[C]&(C|((C)&[(?4punctuation:4?)*]&(?4punctuation:4?)*))
Method FromClause(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&[C]&(C|((C)&[(?4punctuation:4?)*]&(?4punctuation:4?)*))
	if '(..isKeyword("FROM")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"FROM")  {
		if $S(..FromOptimiseList(.subElement,.addedElement) :1,1:1) {
			if ..FromClause1Sub(.subElement,.addedElement)  {
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

///  bracket_table | (( table_reference) [ ( ',' table_reference )* ] ( join )*)
/// summary=C|((C)&[(?4punctuation:4?)*]&(?4punctuation:4?)*)
Method FromClause1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|((C)&[(?4punctuation:4?)*]&(?4punctuation:4?)*)
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..BracketTable(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..FromClause2Sub(.subElement,.addedElement)  {
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

/// ( table_reference) [ ( ',' table_reference )* ] ( join )*
/// summary=(C)&[(?4punctuation:4?)*]&(?4punctuation:4?)*
Method FromClause2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary (C)&[(?4punctuation:4?)*]&(?4punctuation:4?)*
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..FromClause3Sub(.subElement,.addedElement)  {
		if $S(..FromClause4RepZero(.subElement,.addedElement) :1,1:1) {
			if ..FromClause6RepZero(.subElement,.addedElement)  {
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

///  table_reference
/// summary=C
Method FromClause3Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C
	set subElement=ParentElement
	set done=0 ; method start
	if ..TableReference(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

///  ( ',' table_reference )*
Method FromClause4RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..FromClause5Sub(.subElement,.addedElement)  {
		set done=1
	}
	set ok=1
	quit ok
}

///  ',' table_reference
/// summary values:,
/// summary=P&C
Method FromClause5Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation(",",1) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..TableReference(.subElement,.addedElement)  {
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

///  ( join )*
Method FromClause6RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..FromClause7Sub(.subElement,.addedElement)  {
		set done=1
	}
	set ok=1
	quit ok
}

///  join
/// summary=C
Method FromClause7Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C
	set subElement=ParentElement
	set done=0 ; method start
	if ..Join(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

///  from_optimise ::= ('%firsttable' [alias_name]) | '%ALLINDEX' | '%STARTTABLE' | '%INORDER' | '%FULL' | '%NOFLATTEN' | '%NOMERGE' | '%NOREDUCE' | '%NOSVSO' | '%NOTOPOPT' | '%NOUNIONOROPT' | '%PARALLEL' | '%NOPARALLEL' | ('%IGNOREINDEX' ( '*' | index_reference_list )) | ('%IGNOREINDICES' ('*' | index_reference_list ))
/// summary=(P&[C])|P|P|P|P|P|P|P|P|P|P|P|P|(P&(P|C))|(P&(P|C))
Method FromOptimise(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (P&[C])|P|P|P|P|P|P|P|P|P|P|P|P|(P&(P|C))|(P&(P|C))
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..FromOptimise1Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"%ALLINDEX")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"%STARTTABLE")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"%INORDER")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"%FULL")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"%NOFLATTEN")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"%NOMERGE")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"%NOREDUCE")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"%NOSVSO")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"%NOTOPOPT")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"%NOUNIONOROPT")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"%PARALLEL")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"%NOPARALLEL")  {
		set done=1 ; or
	} elseif ..FromOptimise2Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..FromOptimise4Sub(.subElement,.addedElement)  {
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

/// '%firsttable' [alias_name]
/// summary=P&[C]
Method FromOptimise1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"%firsttable")  {
		if $S(..AliasName(.subElement,.addedElement) :1,1:1) {
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

/// '%IGNOREINDEX' ( '*' | index_reference_list )
/// summary values:%IGNOREINDEX
/// summary=P&(P|C)
Method FromOptimise2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&(P|C)
	if '..isPunctuation("%IGNOREINDEX",12) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"%IGNOREINDEX")  {
		if ..FromOptimise3Sub(.subElement,.addedElement)  {
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

///  '*' | index_reference_list
/// summary=P|C
Method FromOptimise3Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P|C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"*")  {
		set done=1 ; or
	} elseif ..IndexReferenceList(.subElement,.addedElement)  {
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

/// '%IGNOREINDICES' ('*' | index_reference_list )
/// summary values:%IGNOREINDICES
/// summary=P&(P|C)
Method FromOptimise4Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&(P|C)
	if '..isPunctuation("%IGNOREINDICES",14) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"%IGNOREINDICES")  {
		if ..FromOptimise5Sub(.subElement,.addedElement)  {
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

/// '*' | index_reference_list
/// summary=P|C
Method FromOptimise5Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P|C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"*")  {
		set done=1 ; or
	} elseif ..IndexReferenceList(.subElement,.addedElement)  {
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

///  from_optimise_list ::= from_optimise ( from_optimise )*
/// summary=C&(?4punctuation:4?)*
Method FromOptimiseList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..FromOptimise(.subElement,.addedElement)  {
		if ..FromOptimiseList1RepZero(.subElement,.addedElement)  {
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

///  ( from_optimise )*
Method FromOptimiseList1RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..FromOptimiseList2Sub(.subElement,.addedElement)  {
		set done=1
	}
	set ok=1
	quit ok
}

///  from_optimise
/// summary=C
Method FromOptimiseList2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C
	set subElement=ParentElement
	set done=0 ; method start
	if ..FromOptimise(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

///  group_by_clause ::= 'GROUP' 'BY' grouping_column_reference_list
/// summary values:GROUP
/// summary=K&K&C
Method GroupByClause(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&K&C
	if '(..isKeyword("GROUP")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"GROUP")  {
		if ..addKeyword(.subElement,"BY")  {
			if ..GroupingColumnReferenceList(.subElement,.addedElement)  {
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

///  grouping_column_reference ::= sql_expression
/// summary=C
Method GroupingColumnReference(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SqlExpression(.subElement,.addedElement)  {
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

///  grouping_column_reference_list ::= grouping_column_reference ( ',' grouping_column_reference )*
/// summary=C&(?4punctuation:4?)*
Method GroupingColumnReferenceList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..GroupingColumnReference(.subElement,.addedElement)  {
		if ..GroupingColumnReferenceList1RepZero(.subElement,.addedElement)  {
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

///  ( ',' grouping_column_reference )*
Method GroupingColumnReferenceList1RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..GroupingColumnReferenceList2Sub(.subElement,.addedElement)  {
		set done=1
	}
	set ok=1
	quit ok
}

///  ',' grouping_column_reference
/// summary values:,
/// summary=P&C
Method GroupingColumnReferenceList2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation(",",1) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..GroupingColumnReference(.subElement,.addedElement)  {
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

///  having_clause ::= 'HAVING' sql_expression
/// summary values:HAVING
/// summary=K&C
Method HavingClause(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C
	if '(..isKeyword("HAVING")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"HAVING")  {
		if ..SqlExpression(.subElement,.addedElement)  {
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

///  index_reference ::= [ table_reference_noalias '.' ] identifier
/// summary=[C&P]&C
Method IndexReference(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary [C&P]&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..IndexReference1OptGrp(.subElement,.addedElement)  {
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

/// 
/// summary=C&P
Method IndexReference1OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&P
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..TableReferenceNoalias(.subElement,.addedElement)  {
		if ..addPunctuation(.subElement,".")  {
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

///  index_reference_list ::= index_reference ( ',' index_reference )*
/// summary=C&(?4punctuation:4?)*
Method IndexReferenceList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..IndexReference(.subElement,.addedElement)  {
		if ..IndexReferenceList1RepZero(.subElement,.addedElement)  {
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

///  ( ',' index_reference )*
Method IndexReferenceList1RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..IndexReferenceList2Sub(.subElement,.addedElement)  {
		set done=1
	}
	set ok=1
	quit ok
}

///  ',' index_reference
/// summary values:,
/// summary=P&C
Method IndexReferenceList2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation(",",1) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..IndexReference(.subElement,.addedElement)  {
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

///  insert_command ::= 'INSERT' (update_keyword)* ['INTO'] direct_table insert_method
/// summary values:INSERT
/// summary=K&(?4punctuation:4?)*&[K]&C&C
Method InsertCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&(?4punctuation:4?)*&[K]&C&C
	if '(..isKeyword("INSERT")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"INSERT")  {
		if ..InsertCommand1RepZero(.subElement,.addedElement)  {
			if $S(..addKeyword(.subElement,"INTO") :1,1:1) {
				if ..DirectTable(.subElement,.addedElement)  {
					if ..InsertMethod(.subElement,.addedElement)  {
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

///  (update_keyword)*
Method InsertCommand1RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..InsertCommand2Sub(.subElement,.addedElement)  {
		set done=1
	}
	set ok=1
	quit ok
}

/// update_keyword
/// summary=C
Method InsertCommand2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C
	set subElement=ParentElement
	set done=0 ; method start
	if ..UpdateKeyword(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
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
	if ..InsertSetList(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..InsertValuesList(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..InsertMultirow(.subElement,.addedElement)  {
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

///  insert_multirow ::= [ update_columns ] select_command
/// summary=[C]&C
Method InsertMultirow(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary [C]&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..UpdateColumns(.subElement,.addedElement) :1,1:1) {
		if ..SelectCommand(.subElement,.addedElement)  {
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

///  insert_set ::= column_reference '=' sql_expression
/// summary=C&P&C
Method InsertSet(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&P&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ColumnReference(.subElement,.addedElement)  {
		if ..addPunctuation(.subElement,"=")  {
			if ..SqlExpression(.subElement,.addedElement)  {
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

///  insert_set_list ::= 'SET' insert_set (',' insert_set)*
/// summary values:SET
/// summary=K&C&(?4punctuation:4?)*
Method InsertSetList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C&(?4punctuation:4?)*
	if '(..isKeyword("SET")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"SET")  {
		if ..InsertSet(.subElement,.addedElement)  {
			if ..InsertSetList1RepZero(.subElement,.addedElement)  {
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

///  (',' insert_set)*
Method InsertSetList1RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..InsertSetList2Sub(.subElement,.addedElement)  {
		set done=1
	}
	set ok=1
	quit ok
}

/// ',' insert_set
/// summary values:,
/// summary=P&C
Method InsertSetList2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation(",",1) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..InsertSet(.subElement,.addedElement)  {
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

///  insert_values_list ::= update_columns 'VALUES' update_values
/// summary=C&K&C
Method InsertValuesList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&K&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..UpdateColumns(.subElement,.addedElement)  {
		if ..addKeyword(.subElement,"VALUES")  {
			if ..UpdateValues(.subElement,.addedElement)  {
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

///  join ::= [('INNER' | 'OUTER' | 'LEFT' | 'RIGHT' | 'CROSS' | 'NATURAL' |'FULL' )*] 'JOIN' table_reference [ join_on ]
/// summary=[(?4punctuation:4?)*]&K&C&[C]
Method Join(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary [(?4punctuation:4?)*]&K&C&[C]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..Join1RepZero(.subElement,.addedElement) :1,1:1) {
		if ..addKeyword(.subElement,"JOIN")  {
			if ..TableReference(.subElement,.addedElement)  {
				if $S(..JoinOn(.subElement,.addedElement) :1,1:1) {
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

/// ('INNER' | 'OUTER' | 'LEFT' | 'RIGHT' | 'CROSS' | 'NATURAL' |'FULL' )*
Method Join1RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..Join2Sub(.subElement,.addedElement)  {
		set done=1
	}
	set ok=1
	quit ok
}

/// 'INNER' | 'OUTER' | 'LEFT' | 'RIGHT' | 'CROSS' | 'NATURAL' |'FULL'
/// summary values:INNER,OUTER,LEFT,RIGHT,CROSS,NATURAL,FULL
/// summary=K|K|K|K|K|K|K
Method Join2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K|K|K|K|K|K|K
	if '(..isKeywordInList($lb("INNER","OUTER","LEFT","RIGHT","CROSS","NATURAL","FULL"))) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"INNER")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"OUTER")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"LEFT")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"RIGHT")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"CROSS")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"NATURAL")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"FULL")  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
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
	if ..ColumnNameList(.subElement,.addedElement)  {
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

///  join_condition ::= 'ON' sql_expression
/// summary values:ON
/// summary=K&C
Method JoinCondition(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C
	if '(..isKeyword("ON")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"ON")  {
		if ..SqlExpression(.subElement,.addedElement)  {
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

///  join_on ::= 'ON' sql_expression
/// summary values:ON
/// summary=K&C
Method JoinOn(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C
	if '(..isKeyword("ON")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"ON")  {
		if ..SqlExpression(.subElement,.addedElement)  {
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

///  join_specification ::= join_condition | named_columns_join
/// summary=C|C
Method JoinSpecification(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..JoinCondition(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..NamedColumnsJoin(.subElement,.addedElement)  {
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

///  join_type ::= 'INNER' | (outer_join_type [ 'OUTER' ])
/// summary=K|(C&[K])
Method JoinType(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|(C&[K])
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"INNER")  {
		set done=1 ; or
	} elseif ..JoinType1Sub(.subElement,.addedElement)  {
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

/// outer_join_type [ 'OUTER' ]
/// summary=C&[K]
Method JoinType1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&[K]
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OuterJoinType(.subElement,.addedElement)  {
		if $S(..addKeyword(.subElement,"OUTER") :1,1:1) {
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

///  joined_table ::= cross_join | qualified_join | ('(' joined_table ')')
/// summary=C|C|(P&C&P)
Method JoinedTable(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C|(P&C&P)
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CrossJoin(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..QualifiedJoin(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..JoinedTable1Sub(.subElement,.addedElement)  {
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

/// '(' joined_table ')'
/// summary values:(
/// summary=P&C&P
Method JoinedTable1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&P
	if '..isPunctuation("(",1) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if ..JoinedTable(.subElement,.addedElement)  {
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

///  macro_identifier ::= identifier
/// summary=C
Method MacroIdentifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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
		set ok=0
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
	if ..SqlExpression(.subElement,.addedElement)  {
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

///  macro_parameter_list ::= '(' [ [macro_parameter] ( ',' [macro_parameter] )* ] ')'
/// summary values:(
/// summary=P&[[C]&(?4punctuation:4?)*]&P
Method MacroParameterList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&[[C]&(?4punctuation:4?)*]&P
	if '..isPunctuation("(",1) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if ..MacroParameterList1OptGrp(.subElement,.addedElement)  {
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

/// 
/// summary=[C]&(?4punctuation:4?)*
Method MacroParameterList1OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary [C]&(?4punctuation:4?)*
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..MacroParameter(.subElement,.addedElement) :1,1:1) {
		if ..MacroParameterList2RepZero(.subElement,.addedElement)  {
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
Method MacroParameterList2RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..MacroParameterList3Sub(.subElement,.addedElement)  {
		set done=1
	}
	set ok=1
	quit ok
}

///  ',' [macro_parameter]
/// summary values:,
/// summary=P&[C]
Method MacroParameterList3Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&[C]
	if '..isPunctuation(",",1) { quit 0 /* normal */ }
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

///  macrocall ::= '$$$' macro_identifier [ macro_parameter_list | macro_parameter_text ]
/// summary values:$$$
/// summary=P&C&[C|C]
Method Macrocall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&[C|C]
	if '..isPunctuation("$$$",3) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"$$$")  {
		if ..MacroIdentifier(.subElement,.addedElement)  {
			if ..Macrocall1OptGrp(.subElement,.addedElement)  {
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
Method Macrocall1OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..MacroParameterList(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..MacroParameterText(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	set ok=1
	quit ok
}

///  named_columns_join ::= 'USING' '(' join_column_list ')'
/// summary values:USING
/// summary=K&P&C&P
Method NamedColumnsJoin(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&C&P
	if '(..isKeyword("USING")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"USING")  {
		if ..addPunctuation(.subElement,"(")  {
			if ..JoinColumnList(.subElement,.addedElement)  {
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
		set ok=0
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
	if ..NonJoinQueryTerm(.subElement,.addedElement)  {
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

///  non_join_query_primary ::= simple_table | ( '(' non_join_query_expression ')' )
/// summary=C|(P&C&P)
Method NonJoinQueryPrimary(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|(P&C&P)
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SimpleTable(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..NonJoinQueryPrimary1Sub(.subElement,.addedElement)  {
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

///  '(' non_join_query_expression ')'
/// summary values:(
/// summary=P&C&P
Method NonJoinQueryPrimary1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&P
	if '..isPunctuation("(",1) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if ..NonJoinQueryExpression(.subElement,.addedElement)  {
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

///  non_join_query_term ::= non_join_query_primary
/// summary=C
Method NonJoinQueryTerm(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..NonJoinQueryPrimary(.subElement,.addedElement)  {
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

///  number ::= ('regexp:[0-9]*' [ '.' 'regexp:[0-9]+'] [ ('e' | 'E') 'regexp:[0-9]+']) | ('.' 'regexp:[0-9]+' [ ('e' | 'E') 'regexp:[0-9]+'])
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

/// 'regexp:[0-9]*' [ '.' 'regexp:[0-9]+'] [ ('e' | 'E') 'regexp:[0-9]+']
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

///  open_command ::= 'OPEN' cursor_name
/// summary values:OPEN
/// summary=K&C
Method OpenCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C
	if '(..isKeyword("OPEN")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"OPEN")  {
		if ..CursorName(.subElement,.addedElement)  {
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

///  order_by_clause ::= 'ORDER' 'BY' ordering_column_reference_list
/// summary values:ORDER
/// summary=K&K&C
Method OrderByClause(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&K&C
	if '(..isKeyword("ORDER")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"ORDER")  {
		if ..addKeyword(.subElement,"BY")  {
			if ..OrderingColumnReferenceList(.subElement,.addedElement)  {
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

///  ordering_column_reference ::= sql_expression [ 'ASC' | 'DESC']
/// summary=C&[K|K]
Method OrderingColumnReference(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&[K|K]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SqlExpression(.subElement,.addedElement)  {
		if ..OrderingColumnReference1OptGrp(.subElement,.addedElement)  {
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
/// summary values:ASC,DESC
/// summary=K|K
Method OrderingColumnReference1OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K|K
	if '(..isKeywordInList($lb("ASC","DESC"))) { quit 1 /* not found is OK */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"ASC")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"DESC")  {
		set done=1 ; end compileRules
	}

	set ok=1
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
	if ..OrderingColumnReference(.subElement,.addedElement)  {
		if ..OrderingColumnReferenceList1RepZero(.subElement,.addedElement)  {
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

///  ( ',' ordering_column_reference )*
Method OrderingColumnReferenceList1RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..OrderingColumnReferenceList2Sub(.subElement,.addedElement)  {
		set done=1
	}
	set ok=1
	quit ok
}

///  ',' ordering_column_reference
/// summary values:,
/// summary=P&C
Method OrderingColumnReferenceList2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation(",",1) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..OrderingColumnReference(.subElement,.addedElement)  {
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

///  outer_join_type ::= 'LEFT' | 'RIGHT' | 'FULL'
/// summary values:LEFT,RIGHT,FULL
/// summary=K|K|K
Method OuterJoinType(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K|K
	if '(..isKeywordInList($lb("LEFT","RIGHT","FULL"))) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"LEFT")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"RIGHT")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"FULL")  {
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

///  qualified_identifier ::= identifier
/// summary=C
Method QualifiedIdentifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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
		set ok=0
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
	if ..TableReference(.subElement,.addedElement)  {
		if $S(..addKeyword(.subElement,"NATURAL") :1,1:1) {
			if $S(..JoinType(.subElement,.addedElement) :1,1:1) {
				if ..addKeyword(.subElement,"JOIN")  {
					if ..TableReference(.subElement,.addedElement)  {
						if $S(..JoinSpecification(.subElement,.addedElement) :1,1:1) {
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

///  qualifier ::= table_name
/// summary=C
Method Qualifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..TableName(.subElement,.addedElement)  {
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

///  query_expression ::= non_join_query_expression | joined_table
/// summary=C|C
Method QueryExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..NonJoinQueryExpression(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..JoinedTable(.subElement,.addedElement)  {
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

///  query_specification ::= [with_command ] select_command ( union select_command )*
/// summary=[C]&C&(?4punctuation:4?)*
Method QuerySpecification(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary [C]&C&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..WithCommand(.subElement,.addedElement) :1,1:1) {
		if ..SelectCommand(.subElement,.addedElement)  {
			if ..QuerySpecification1RepZero(.subElement,.addedElement)  {
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

///  ( union select_command )*
Method QuerySpecification1RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..QuerySpecification2Sub(.subElement,.addedElement)  {
		set done=1
	}
	set ok=1
	quit ok
}

///  union select_command
/// summary=C&C
Method QuerySpecification2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Union(.subElement,.addedElement)  {
		if ..SelectCommand(.subElement,.addedElement)  {
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

///  schema_name ::= identifier
/// summary=C
Method SchemaName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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
		set ok=0
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
	if '(..isKeyword("SELECT")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"SELECT")  {
		if $S(..SetQuantifier(.subElement,.addedElement) :1,1:1) {
			if ..SelectList(.subElement,.addedElement)  {
				if $S(..SelectInto(.subElement,.addedElement) :1,1:1) {
					if $S(..TableExpression(.subElement,.addedElement) :1,1:1) {
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

///  select_into ::= 'INTO' select_into_variable ( ',' select_into_variable)*
/// summary values:INTO
/// summary=K&C&(?4punctuation:4?)*
Method SelectInto(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C&(?4punctuation:4?)*
	if '(..isKeyword("INTO")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"INTO")  {
		if ..SelectIntoVariable(.subElement,.addedElement)  {
			if ..SelectInto1RepZero(.subElement,.addedElement)  {
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

///  ( ',' select_into_variable)*
Method SelectInto1RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..SelectInto2Sub(.subElement,.addedElement)  {
		set done=1
	}
	set ok=1
	quit ok
}

///  ',' select_into_variable
/// summary values:,
/// summary=P&C
Method SelectInto2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation(",",1) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..SelectIntoVariable(.subElement,.addedElement)  {
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

///  select_into_variable ::= [':'] sql_cos_variable
/// summary=[P]&C
Method SelectIntoVariable(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary [P]&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..addPunctuation(.subElement,":") :1,1:1) {
		if ..SqlCosVariable(.subElement,.addedElement)  {
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

///  select_list ::= select_sublist ( ',' select_sublist )*
/// summary=C&(?4punctuation:4?)*
Method SelectList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SelectSublist(.subElement,.addedElement)  {
		if ..SelectList1RepZero(.subElement,.addedElement)  {
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

///  ( ',' select_sublist )*
Method SelectList1RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..SelectList2Sub(.subElement,.addedElement)  {
		set done=1
	}
	set ok=1
	quit ok
}

///  ',' select_sublist
/// summary values:,
/// summary=P&C
Method SelectList2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation(",",1) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..SelectSublist(.subElement,.addedElement)  {
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

///  select_sublist ::= derived_column | (qualifier '.' '*')
/// summary=C|(C&P&P)
Method SelectSublist(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|(C&P&P)
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..DerivedColumn(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SelectSublist1Sub(.subElement,.addedElement)  {
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

/// qualifier '.' '*'
/// summary=C&P&P
Method SelectSublist1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&P&P
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Qualifier(.subElement,.addedElement)  {
		if ..addPunctuation(.subElement,".")  {
			if ..addPunctuation(.subElement,"*")  {
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

///  set_quantifier ::= ( ( 'DISTINCT' ['BY' '(' sql_expression ( ',' sql_expression )* ')' ] ) | 'ALL' | ('TOP' sql_expression) | '%NOFPLAN' | '%NOLOCK' | '%NORUNTIME' | ('%PROFILE' ['ALL']) )*
/// summary=(?4punctuation:4?)*
Method SetQuantifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SetQuantifier1RepZero(.subElement,.addedElement)  {
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

///  ( ( 'DISTINCT' ['BY' '(' sql_expression ( ',' sql_expression )* ')' ] ) | 'ALL' | ('TOP' sql_expression) | '%NOFPLAN' | '%NOLOCK' | '%NORUNTIME' | ('%PROFILE' ['ALL']) )*
Method SetQuantifier1RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..SetQuantifier2Sub(.subElement,.addedElement)  {
		set done=1
	}
	set ok=1
	quit ok
}

///  ( 'DISTINCT' ['BY' '(' sql_expression ( ',' sql_expression )* ')' ] ) | 'ALL' | ('TOP' sql_expression) | '%NOFPLAN' | '%NOLOCK' | '%NORUNTIME' | ('%PROFILE' ['ALL'])
/// summary=(K&[K&P&C&(?4punctuation:4?)*&P])|K|(K&C)|P|P|P|(P&[K])
Method SetQuantifier2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary (K&[K&P&C&(?4punctuation:4?)*&P])|K|(K&C)|P|P|P|(P&[K])
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SetQuantifier3Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"ALL")  {
		set done=1 ; or
	} elseif ..SetQuantifier7Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"%NOFPLAN")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"%NOLOCK")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"%NORUNTIME")  {
		set done=1 ; or
	} elseif ..SetQuantifier8Sub(.subElement,.addedElement)  {
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

///  'DISTINCT' ['BY' '(' sql_expression ( ',' sql_expression )* ')' ]
/// summary values:DISTINCT
/// summary=K&[K&P&C&(?4punctuation:4?)*&P]
Method SetQuantifier3Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&[K&P&C&(?4punctuation:4?)*&P]
	if '(..isKeyword("DISTINCT")) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"DISTINCT")  {
		if ..SetQuantifier4OptGrp(.subElement,.addedElement)  {
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
/// summary values:BY
/// summary=K&P&C&(?4punctuation:4?)*&P
Method SetQuantifier4OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&P&C&(?4punctuation:4?)*&P
	if '(..isKeyword("BY")) { quit 1 /* not found is OK */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"BY")  {
		if ..addPunctuation(.subElement,"(")  {
			if ..SqlExpression(.subElement,.addedElement)  {
				if ..SetQuantifier5RepZero(.subElement,.addedElement)  {
					if ..addPunctuation(.subElement,")")  {
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
	quit ok
}

///  ( ',' sql_expression )*
Method SetQuantifier5RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..SetQuantifier6Sub(.subElement,.addedElement)  {
		set done=1
	}
	set ok=1
	quit ok
}

///  ',' sql_expression
/// summary values:,
/// summary=P&C
Method SetQuantifier6Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation(",",1) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..SqlExpression(.subElement,.addedElement)  {
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

/// 'TOP' sql_expression
/// summary values:TOP
/// summary=K&C
Method SetQuantifier7Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&C
	if '(..isKeyword("TOP")) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"TOP")  {
		if ..SqlExpression(.subElement,.addedElement)  {
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

/// '%PROFILE' ['ALL']
/// summary values:%PROFILE
/// summary=P&[K]
Method SetQuantifier8Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&[K]
	if '..isPunctuation("%PROFILE",8) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"%PROFILE")  {
		if $S(..addKeyword(.subElement,"ALL") :1,1:1) {
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

///  simple_table ::= query_specification
/// summary=C
Method SimpleTable(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..QuerySpecification(.subElement,.addedElement)  {
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

///  sql_case_else ::= 'ELSE' sql_expression
/// summary values:ELSE
/// summary=K&C
Method SqlCaseElse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C
	if '(..isKeyword("ELSE")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"ELSE")  {
		if ..SqlExpression(.subElement,.addedElement)  {
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

///  sql_case_end ::= 'END'
/// summary values:END
/// summary=K
Method SqlCaseEnd(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeyword("END")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"END")  {
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

///  sql_case_expression ::= 'CASE' ( sql_case_expression1 | sql_case_expression2 ) [ sql_case_else ] sql_case_end
/// summary values:CASE
/// summary=K&(C|C)&[C]&C
Method SqlCaseExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&(C|C)&[C]&C
	if '(..isKeyword("CASE")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"CASE")  {
		if ..SqlCaseExpression1Sub(.subElement,.addedElement)  {
			if $S(..SqlCaseElse(.subElement,.addedElement) :1,1:1) {
				if ..SqlCaseEnd(.subElement,.addedElement)  {
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

///  sql_case_expression1 ::= sql_case_when ( sql_case_when )*
/// summary=C&(?4punctuation:4?)*
Method SqlCaseExpression1(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SqlCaseWhen(.subElement,.addedElement)  {
		if ..SqlCaseExpression11RepZero(.subElement,.addedElement)  {
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

///  ( sql_case_when )*
Method SqlCaseExpression11RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..SqlCaseExpression12Sub(.subElement,.addedElement)  {
		set done=1
	}
	set ok=1
	quit ok
}

///  sql_case_when
/// summary=C
Method SqlCaseExpression12Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C
	set subElement=ParentElement
	set done=0 ; method start
	if ..SqlCaseWhen(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

///  sql_case_expression1 | sql_case_expression2
/// summary=C|C
Method SqlCaseExpression1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..SqlCaseExpression1(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlCaseExpression2(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

///  sql_case_expression2 ::= sql_expression ( sql_case_when )*
/// summary=C&(?4punctuation:4?)*
Method SqlCaseExpression2(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SqlExpression(.subElement,.addedElement)  {
		if ..SqlCaseExpression21RepZero(.subElement,.addedElement)  {
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

///  ( sql_case_when )*
Method SqlCaseExpression21RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..SqlCaseExpression22Sub(.subElement,.addedElement)  {
		set done=1
	}
	set ok=1
	quit ok
}

///  sql_case_when
/// summary=C
Method SqlCaseExpression22Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C
	set subElement=ParentElement
	set done=0 ; method start
	if ..SqlCaseWhen(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

///  sql_case_when ::= 'WHEN' sql_expression 'THEN' sql_expression
/// summary values:WHEN
/// summary=K&C&K&C
Method SqlCaseWhen(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C&K&C
	if '(..isKeyword("WHEN")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"WHEN")  {
		if ..SqlExpression(.subElement,.addedElement)  {
			if ..addKeyword(.subElement,"THEN")  {
				if ..SqlExpression(.subElement,.addedElement)  {
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

///  sql_cos_variable ::= 'NEED COS VAR'
/// summary values:NEED COS VAR
/// summary=P
Method SqlCosVariable(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("NEED COS VAR",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"NEED COS VAR")  {
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

///  sql_dyadicop ::= "+" | "-" | "\\" | "/" | "<>" | ">=" | ">" | "!>" | "<=" | "<" | "!<" | "*=" | "=*" | "=" | "!=" | "**" | "*" | "&&" | "&" | "]]" | "]" | "[" | "'[" | "!" | "||" | "_" | "#" | '\' | "AND" | "OR" | "NOT=" | "SIZE" | "ESCAPE" | sql_predicate | ("NOT" sql_predicate)
/// summary=P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|K|K|P|K|K|C|(K&C)
Method SqlDyadicop(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|K|K|P|K|K|C|(K&C)
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
	} elseif ..addPunctuation(.subElement,"<>")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,">=")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,">")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"!>")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"<=")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"<")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"!<")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"*=")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"=*")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"=")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"!=")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"**")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"*")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"&&")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"&")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"]]")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"]")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"[")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"'[")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"!")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"||")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"_")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"#")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"\")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"AND")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"OR")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"NOT=")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"SIZE")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"ESCAPE")  {
		set done=1 ; or
	} elseif ..SqlPredicate(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlDyadicop1Sub(.subElement,.addedElement)  {
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

/// "NOT" sql_predicate
/// summary values:NOT
/// summary=K&C
Method SqlDyadicop1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&C
	if '(..isKeyword("NOT")) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"NOT")  {
		if ..SqlPredicate(.subElement,.addedElement)  {
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

///  sql_expression ::= sql_factor ( sql_dyadicop sql_factor )*
/// summary=C&(?4punctuation:4?)*
Method SqlExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SqlFactor(.subElement,.addedElement)  {
		if ..SqlExpression1RepZero(.subElement,.addedElement)  {
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

///  ( sql_dyadicop sql_factor )*
Method SqlExpression1RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..SqlExpression2Sub(.subElement,.addedElement)  {
		set done=1
	}
	set ok=1
	quit ok
}

///  sql_dyadicop sql_factor
/// summary=C&C
Method SqlExpression2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SqlDyadicop(.subElement,.addedElement)  {
		if ..SqlFactor(.subElement,.addedElement)  {
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

///  sql_factor ::= [ sql_monadicop ] sql_term
/// summary=[C]&C
Method SqlFactor(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary [C]&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..SqlMonadicop(.subElement,.addedElement) :1,1:1) {
		if ..SqlTerm(.subElement,.addedElement)  {
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

///  sql_fn_function ::= '{' 'fn' sql_function '}'
/// summary values:{
/// summary=P&K&C&P
Method SqlFnFunction(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&K&C&P
	if '..isPunctuation("{",1) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"{")  {
		if ..addKeyword(.subElement,"FN")  {
			if ..SqlFunction(.subElement,.addedElement)  {
				if ..addPunctuation(.subElement,"}")  {
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

///  sql_function ::= ('$' identifier '(' [ sql_expression ( ',' sql_expression)* ] ')') | ('%exact' sql_expression ) | ('count' '(' ')' [ sql_window ] ) | ('count' '(' ['distinct' | 'all' ] ('*' | sql_expression) [ '%FOREACH' '(' col_list ')' ] ')' [ sql_window ] ) | ('min' '(' [ ( 'distinct' ['by' '(' col_list ')'] ) | 'all' ] ('*' | sql_expression) [ '%FOREACH' '(' col_list ')' ] ')' [ sql_window ] ) | ('max' '(' [ ( 'distinct' ['by' '(' col_list ')'] ) | 'all' ] ('*' | sql_expression) [ '%FOREACH' '(' col_list ')' ] ')' [ sql_window ] ) | ('sum' '(' [ ( 'distinct' ['by' '(' col_list ')'] ) | 'all' ] ('*' | sql_expression) [ '%FOREACH' '(' col_list ')' ] ')' [ sql_window ] ) | ('avg' '(' [ ( 'distinct' ['by' '(' col_list ')'] ) | 'all' ] ('*' | sql_expression) [ '%FOREACH' '(' col_list ')' ] ')' [ sql_window ] ) | ('cast' '(' sql_expression 'as' identifier ['(' sql_expression ( ',' sql_expression)* ')' ] ')' ) | ('exists' '(' subquery_specification ')' ) | ('list' '(' [ ( 'distinct' ['by' '(' col_list ')'] ) | 'all' ] ('*' | sql_expression) [ '%FOREACH' '(' col_list ')' ] ')') | ('%dlist' '(' [ ( 'distinct' ['by' '(' col_list ')'] ) | 'all' ] ('*' | sql_expression) [ '%FOREACH' '(' col_list ')' ] ')') | ('FOR' 'SOME' '%ELEMENT' '(' sql_expression ')' sql_expression ) | ('trim' '(' ['leading' | 'trailing' | 'both'] [(sql_expression 'from')] sql_expression ')' ) | ('dateadd' '(' sql_function_datepart_part ',' sql_expression ',' sql_expression ')' ) | ('datediff' '(' sql_function_datepart_part ',' sql_expression ',' sql_expression ')' ) | ('datename' '(' sql_function_datepart_part ',' sql_expression ')' ) | ('datepart' '(' sql_function_datepart_part ',' sql_expression ')' ) | (identifier '(' [ '*' | (sql_expression ( ',' sql_expression)*) ] ')' [ sql_window ] )
/// summary=(P&C&P&[C&(?4punctuation:4?)*]&P)|(P&C)|(K&P&P&[C])|(K&P&[K|K]&(P|C)&[P&P&C&P]&P&[C])|(K&P&[(K&[K&P&C&P])|K]&(P|C)&[P&P&C&P]&P&[C])|(K&P&[(K&[K&P&C&P])|K]&(P|C)&[P&P&C&P]&P&[C])|(K&P&[(K&[K&P&C&P])|K]&(P|C)&[P&P&C&P]&P&[C])|(K&P&[(K&[K&P&C&P])|K]&(P|C)&[P&P&C&P]&P&[C])|(K&P&C&K&C&[P&C&(?4punctuation:4?)*&P]&P)|(K&P&C&P)|(K&P&[(K&[K&P&C&P])|K]&(P|C)&[P&P&C&P]&P)|(P&P&[(K&[K&P&C&P])|K]&(P|C)&[P&P&C&P]&P)|(K&K&P&P&C&P&C)|(K&P&[K|K|K]&[(C&K)]&C&P)|(K&P&C&P&C&P&C&P)|(K&P&C&P&C&P&C&P)|(K&P&C&P&C&P)|(K&P&C&P&C&P)|(C&P&[P|(C&(?4punctuation:4?)*)]&P&[C])
Method SqlFunction(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (P&C&P&[C&(?4punctuation:4?)*]&P)|(P&C)|(K&P&P&[C])|(K&P&[K|K]&(P|C)&[P&P&C&P]&P&[C])|(K&P&[(K&[K&P&C&P])|K]&(P|C)&[P&P&C&P]&P&[C])|(K&P&[(K&[K&P&C&P])|K]&(P|C)&[P&P&C&P]&P&[C])|(K&P&[(K&[K&P&C&P])|K]&(P|C)&[P&P&C&P]&P&[C])|(K&P&[(K&[K&P&C&P])|K]&(P|C)&[P&P&C&P]&P&[C])|(K&P&C&K&C&[P&C&(?4punctuation:4?)*&P]&P)|(K&P&C&P)|(K&P&[(K&[K&P&C&P])|K]&(P|C)&[P&P&C&P]&P)|(P&P&[(K&[K&P&C&P])|K]&(P|C)&[P&P&C&P]&P)|(K&K&P&P&C&P&C)|(K&P&[K|K|K]&[(C&K)]&C&P)|(K&P&C&P&C&P&C&P)|(K&P&C&P&C&P&C&P)|(K&P&C&P&C&P)|(K&P&C&P&C&P)|(C&P&[P|(C&(?4punctuation:4?)*)]&P&[C])
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SqlFunction1Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlFunction5Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlFunction6Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlFunction7Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlFunction11Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlFunction17Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlFunction23Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlFunction29Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlFunction35Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlFunction39Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlFunction40Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlFunction46Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlFunction52Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlFunction53Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlFunction56Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlFunction57Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlFunction58Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlFunction59Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlFunction60Sub(.subElement,.addedElement)  {
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

/// 
/// summary values:%FOREACH
/// summary=P&P&C&P
Method SqlFunction10OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&P&C&P
	if '..isPunctuation("%FOREACH",8) { quit 1 /* not found is OK */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"%FOREACH")  {
		if ..addPunctuation(.subElement,"(")  {
			if ..ColList(.subElement,.addedElement)  {
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
		set ok=1 /* failure rollsback but returns OK */
	}
	quit ok
}

/// 'min' '(' [ ( 'distinct' ['by' '(' col_list ')'] ) | 'all' ] ('*' | sql_expression) [ '%FOREACH' '(' col_list ')' ] ')' [ sql_window ]
/// summary values:MIN
/// summary=K&P&[(K&[K&P&C&P])|K]&(P|C)&[P&P&C&P]&P&[C]
Method SqlFunction11Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&P&[(K&[K&P&C&P])|K]&(P|C)&[P&P&C&P]&P&[C]
	if '(..isKeyword("MIN")) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"MIN")  {
		if ..addPunctuation(.subElement,"(")  {
			if ..SqlFunction12OptGrp(.subElement,.addedElement)  {
				if ..SqlFunction15Sub(.subElement,.addedElement)  {
					if ..SqlFunction16OptGrp(.subElement,.addedElement)  {
						if ..addPunctuation(.subElement,")")  {
							if $S(..SqlWindow(.subElement,.addedElement) :1,1:1) {
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
		set ok=0
	}
	quit ok
}

/// 
/// summary=(K&[K&P&C&P])|K
Method SqlFunction12OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary (K&[K&P&C&P])|K
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SqlFunction13Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"ALL")  {
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

///  'distinct' ['by' '(' col_list ')']
/// summary values:DISTINCT
/// summary=K&[K&P&C&P]
Method SqlFunction13Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&[K&P&C&P]
	if '(..isKeyword("DISTINCT")) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"DISTINCT")  {
		if ..SqlFunction14OptGrp(.subElement,.addedElement)  {
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
/// summary values:BY
/// summary=K&P&C&P
Method SqlFunction14OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&P&C&P
	if '(..isKeyword("BY")) { quit 1 /* not found is OK */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"BY")  {
		if ..addPunctuation(.subElement,"(")  {
			if ..ColList(.subElement,.addedElement)  {
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
		set ok=1 /* failure rollsback but returns OK */
	}
	quit ok
}

/// '*' | sql_expression
/// summary=P|C
Method SqlFunction15Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P|C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"*")  {
		set done=1 ; or
	} elseif ..SqlExpression(.subElement,.addedElement)  {
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

/// 
/// summary values:%FOREACH
/// summary=P&P&C&P
Method SqlFunction16OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&P&C&P
	if '..isPunctuation("%FOREACH",8) { quit 1 /* not found is OK */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"%FOREACH")  {
		if ..addPunctuation(.subElement,"(")  {
			if ..ColList(.subElement,.addedElement)  {
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
		set ok=1 /* failure rollsback but returns OK */
	}
	quit ok
}

/// 'max' '(' [ ( 'distinct' ['by' '(' col_list ')'] ) | 'all' ] ('*' | sql_expression) [ '%FOREACH' '(' col_list ')' ] ')' [ sql_window ]
/// summary values:MAX
/// summary=K&P&[(K&[K&P&C&P])|K]&(P|C)&[P&P&C&P]&P&[C]
Method SqlFunction17Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&P&[(K&[K&P&C&P])|K]&(P|C)&[P&P&C&P]&P&[C]
	if '(..isKeyword("MAX")) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"MAX")  {
		if ..addPunctuation(.subElement,"(")  {
			if ..SqlFunction18OptGrp(.subElement,.addedElement)  {
				if ..SqlFunction21Sub(.subElement,.addedElement)  {
					if ..SqlFunction22OptGrp(.subElement,.addedElement)  {
						if ..addPunctuation(.subElement,")")  {
							if $S(..SqlWindow(.subElement,.addedElement) :1,1:1) {
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
		set ok=0
	}
	quit ok
}

/// 
/// summary=(K&[K&P&C&P])|K
Method SqlFunction18OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary (K&[K&P&C&P])|K
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SqlFunction19Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"ALL")  {
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

///  'distinct' ['by' '(' col_list ')']
/// summary values:DISTINCT
/// summary=K&[K&P&C&P]
Method SqlFunction19Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&[K&P&C&P]
	if '(..isKeyword("DISTINCT")) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"DISTINCT")  {
		if ..SqlFunction20OptGrp(.subElement,.addedElement)  {
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

/// '$' identifier '(' [ sql_expression ( ',' sql_expression)* ] ')'
/// summary=P&C&P&[C&(?4punctuation:4?)*]&P
Method SqlFunction1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"$")  {
		if ..Identifier(.subElement,.addedElement)  {
			if ..addPunctuation(.subElement,"(")  {
				if ..SqlFunction2OptGrp(.subElement,.addedElement)  {
					if ..addPunctuation(.subElement,")")  {
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
		set ok=0
	}
	quit ok
}

/// 
/// summary values:BY
/// summary=K&P&C&P
Method SqlFunction20OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&P&C&P
	if '(..isKeyword("BY")) { quit 1 /* not found is OK */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"BY")  {
		if ..addPunctuation(.subElement,"(")  {
			if ..ColList(.subElement,.addedElement)  {
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
		set ok=1 /* failure rollsback but returns OK */
	}
	quit ok
}

/// '*' | sql_expression
/// summary=P|C
Method SqlFunction21Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P|C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"*")  {
		set done=1 ; or
	} elseif ..SqlExpression(.subElement,.addedElement)  {
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

/// 
/// summary values:%FOREACH
/// summary=P&P&C&P
Method SqlFunction22OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&P&C&P
	if '..isPunctuation("%FOREACH",8) { quit 1 /* not found is OK */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"%FOREACH")  {
		if ..addPunctuation(.subElement,"(")  {
			if ..ColList(.subElement,.addedElement)  {
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
		set ok=1 /* failure rollsback but returns OK */
	}
	quit ok
}

/// 'sum' '(' [ ( 'distinct' ['by' '(' col_list ')'] ) | 'all' ] ('*' | sql_expression) [ '%FOREACH' '(' col_list ')' ] ')' [ sql_window ]
/// summary values:SUM
/// summary=K&P&[(K&[K&P&C&P])|K]&(P|C)&[P&P&C&P]&P&[C]
Method SqlFunction23Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&P&[(K&[K&P&C&P])|K]&(P|C)&[P&P&C&P]&P&[C]
	if '(..isKeyword("SUM")) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"SUM")  {
		if ..addPunctuation(.subElement,"(")  {
			if ..SqlFunction24OptGrp(.subElement,.addedElement)  {
				if ..SqlFunction27Sub(.subElement,.addedElement)  {
					if ..SqlFunction28OptGrp(.subElement,.addedElement)  {
						if ..addPunctuation(.subElement,")")  {
							if $S(..SqlWindow(.subElement,.addedElement) :1,1:1) {
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
		set ok=0
	}
	quit ok
}

/// 
/// summary=(K&[K&P&C&P])|K
Method SqlFunction24OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary (K&[K&P&C&P])|K
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SqlFunction25Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"ALL")  {
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

///  'distinct' ['by' '(' col_list ')']
/// summary values:DISTINCT
/// summary=K&[K&P&C&P]
Method SqlFunction25Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&[K&P&C&P]
	if '(..isKeyword("DISTINCT")) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"DISTINCT")  {
		if ..SqlFunction26OptGrp(.subElement,.addedElement)  {
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
/// summary values:BY
/// summary=K&P&C&P
Method SqlFunction26OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&P&C&P
	if '(..isKeyword("BY")) { quit 1 /* not found is OK */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"BY")  {
		if ..addPunctuation(.subElement,"(")  {
			if ..ColList(.subElement,.addedElement)  {
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
		set ok=1 /* failure rollsback but returns OK */
	}
	quit ok
}

/// '*' | sql_expression
/// summary=P|C
Method SqlFunction27Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P|C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"*")  {
		set done=1 ; or
	} elseif ..SqlExpression(.subElement,.addedElement)  {
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

/// 
/// summary values:%FOREACH
/// summary=P&P&C&P
Method SqlFunction28OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&P&C&P
	if '..isPunctuation("%FOREACH",8) { quit 1 /* not found is OK */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"%FOREACH")  {
		if ..addPunctuation(.subElement,"(")  {
			if ..ColList(.subElement,.addedElement)  {
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
		set ok=1 /* failure rollsback but returns OK */
	}
	quit ok
}

/// 'avg' '(' [ ( 'distinct' ['by' '(' col_list ')'] ) | 'all' ] ('*' | sql_expression) [ '%FOREACH' '(' col_list ')' ] ')' [ sql_window ]
/// summary values:AVG
/// summary=K&P&[(K&[K&P&C&P])|K]&(P|C)&[P&P&C&P]&P&[C]
Method SqlFunction29Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&P&[(K&[K&P&C&P])|K]&(P|C)&[P&P&C&P]&P&[C]
	if '(..isKeyword("AVG")) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"AVG")  {
		if ..addPunctuation(.subElement,"(")  {
			if ..SqlFunction30OptGrp(.subElement,.addedElement)  {
				if ..SqlFunction33Sub(.subElement,.addedElement)  {
					if ..SqlFunction34OptGrp(.subElement,.addedElement)  {
						if ..addPunctuation(.subElement,")")  {
							if $S(..SqlWindow(.subElement,.addedElement) :1,1:1) {
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
		set ok=0
	}
	quit ok
}

/// 
/// summary=C&(?4punctuation:4?)*
Method SqlFunction2OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&(?4punctuation:4?)*
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SqlExpression(.subElement,.addedElement)  {
		if ..SqlFunction3RepZero(.subElement,.addedElement)  {
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
/// summary=(K&[K&P&C&P])|K
Method SqlFunction30OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary (K&[K&P&C&P])|K
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SqlFunction31Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"ALL")  {
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

///  'distinct' ['by' '(' col_list ')']
/// summary values:DISTINCT
/// summary=K&[K&P&C&P]
Method SqlFunction31Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&[K&P&C&P]
	if '(..isKeyword("DISTINCT")) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"DISTINCT")  {
		if ..SqlFunction32OptGrp(.subElement,.addedElement)  {
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
/// summary values:BY
/// summary=K&P&C&P
Method SqlFunction32OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&P&C&P
	if '(..isKeyword("BY")) { quit 1 /* not found is OK */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"BY")  {
		if ..addPunctuation(.subElement,"(")  {
			if ..ColList(.subElement,.addedElement)  {
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
		set ok=1 /* failure rollsback but returns OK */
	}
	quit ok
}

/// '*' | sql_expression
/// summary=P|C
Method SqlFunction33Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P|C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"*")  {
		set done=1 ; or
	} elseif ..SqlExpression(.subElement,.addedElement)  {
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

/// 
/// summary values:%FOREACH
/// summary=P&P&C&P
Method SqlFunction34OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&P&C&P
	if '..isPunctuation("%FOREACH",8) { quit 1 /* not found is OK */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"%FOREACH")  {
		if ..addPunctuation(.subElement,"(")  {
			if ..ColList(.subElement,.addedElement)  {
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
		set ok=1 /* failure rollsback but returns OK */
	}
	quit ok
}

/// 'cast' '(' sql_expression 'as' identifier ['(' sql_expression ( ',' sql_expression)* ')' ] ')'
/// summary values:CAST
/// summary=K&P&C&K&C&[P&C&(?4punctuation:4?)*&P]&P
Method SqlFunction35Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&P&C&K&C&[P&C&(?4punctuation:4?)*&P]&P
	if '(..isKeyword("CAST")) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"CAST")  {
		if ..addPunctuation(.subElement,"(")  {
			if ..SqlExpression(.subElement,.addedElement)  {
				if ..addKeyword(.subElement,"AS")  {
					if ..Identifier(.subElement,.addedElement)  {
						if ..SqlFunction36OptGrp(.subElement,.addedElement)  {
							if ..addPunctuation(.subElement,")")  {
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
		set ok=0
	}
	quit ok
}

/// 
/// summary values:(
/// summary=P&C&(?4punctuation:4?)*&P
Method SqlFunction36OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&(?4punctuation:4?)*&P
	if '..isPunctuation("(",1) { quit 1 /* not found is OK */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if ..SqlExpression(.subElement,.addedElement)  {
			if ..SqlFunction37RepZero(.subElement,.addedElement)  {
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
		set ok=1 /* failure rollsback but returns OK */
	}
	quit ok
}

///  ( ',' sql_expression)*
Method SqlFunction37RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..SqlFunction38Sub(.subElement,.addedElement)  {
		set done=1
	}
	set ok=1
	quit ok
}

///  ',' sql_expression
/// summary values:,
/// summary=P&C
Method SqlFunction38Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation(",",1) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..SqlExpression(.subElement,.addedElement)  {
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

/// 'exists' '(' subquery_specification ')'
/// summary values:EXISTS
/// summary=K&P&C&P
Method SqlFunction39Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&P&C&P
	if '(..isKeyword("EXISTS")) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"EXISTS")  {
		if ..addPunctuation(.subElement,"(")  {
			if ..SubquerySpecification(.subElement,.addedElement)  {
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
		set ok=0
	}
	quit ok
}

///  ( ',' sql_expression)*
Method SqlFunction3RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..SqlFunction4Sub(.subElement,.addedElement)  {
		set done=1
	}
	set ok=1
	quit ok
}

/// 'list' '(' [ ( 'distinct' ['by' '(' col_list ')'] ) | 'all' ] ('*' | sql_expression) [ '%FOREACH' '(' col_list ')' ] ')'
/// summary values:LIST
/// summary=K&P&[(K&[K&P&C&P])|K]&(P|C)&[P&P&C&P]&P
Method SqlFunction40Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&P&[(K&[K&P&C&P])|K]&(P|C)&[P&P&C&P]&P
	if '(..isKeyword("LIST")) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"LIST")  {
		if ..addPunctuation(.subElement,"(")  {
			if ..SqlFunction41OptGrp(.subElement,.addedElement)  {
				if ..SqlFunction44Sub(.subElement,.addedElement)  {
					if ..SqlFunction45OptGrp(.subElement,.addedElement)  {
						if ..addPunctuation(.subElement,")")  {
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
		set ok=0
	}
	quit ok
}

/// 
/// summary=(K&[K&P&C&P])|K
Method SqlFunction41OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary (K&[K&P&C&P])|K
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SqlFunction42Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"ALL")  {
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

///  'distinct' ['by' '(' col_list ')']
/// summary values:DISTINCT
/// summary=K&[K&P&C&P]
Method SqlFunction42Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&[K&P&C&P]
	if '(..isKeyword("DISTINCT")) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"DISTINCT")  {
		if ..SqlFunction43OptGrp(.subElement,.addedElement)  {
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
/// summary values:BY
/// summary=K&P&C&P
Method SqlFunction43OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&P&C&P
	if '(..isKeyword("BY")) { quit 1 /* not found is OK */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"BY")  {
		if ..addPunctuation(.subElement,"(")  {
			if ..ColList(.subElement,.addedElement)  {
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
		set ok=1 /* failure rollsback but returns OK */
	}
	quit ok
}

/// '*' | sql_expression
/// summary=P|C
Method SqlFunction44Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P|C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"*")  {
		set done=1 ; or
	} elseif ..SqlExpression(.subElement,.addedElement)  {
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

/// 
/// summary values:%FOREACH
/// summary=P&P&C&P
Method SqlFunction45OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&P&C&P
	if '..isPunctuation("%FOREACH",8) { quit 1 /* not found is OK */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"%FOREACH")  {
		if ..addPunctuation(.subElement,"(")  {
			if ..ColList(.subElement,.addedElement)  {
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
		set ok=1 /* failure rollsback but returns OK */
	}
	quit ok
}

/// '%dlist' '(' [ ( 'distinct' ['by' '(' col_list ')'] ) | 'all' ] ('*' | sql_expression) [ '%FOREACH' '(' col_list ')' ] ')'
/// summary values:%DLIST
/// summary=P&P&[(K&[K&P&C&P])|K]&(P|C)&[P&P&C&P]&P
Method SqlFunction46Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&P&[(K&[K&P&C&P])|K]&(P|C)&[P&P&C&P]&P
	if '..isPunctuation("%DLIST",6) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"%dlist")  {
		if ..addPunctuation(.subElement,"(")  {
			if ..SqlFunction47OptGrp(.subElement,.addedElement)  {
				if ..SqlFunction50Sub(.subElement,.addedElement)  {
					if ..SqlFunction51OptGrp(.subElement,.addedElement)  {
						if ..addPunctuation(.subElement,")")  {
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
		set ok=0
	}
	quit ok
}

/// 
/// summary=(K&[K&P&C&P])|K
Method SqlFunction47OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary (K&[K&P&C&P])|K
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SqlFunction48Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"ALL")  {
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

///  'distinct' ['by' '(' col_list ')']
/// summary values:DISTINCT
/// summary=K&[K&P&C&P]
Method SqlFunction48Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&[K&P&C&P]
	if '(..isKeyword("DISTINCT")) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"DISTINCT")  {
		if ..SqlFunction49OptGrp(.subElement,.addedElement)  {
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
/// summary values:BY
/// summary=K&P&C&P
Method SqlFunction49OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&P&C&P
	if '(..isKeyword("BY")) { quit 1 /* not found is OK */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"BY")  {
		if ..addPunctuation(.subElement,"(")  {
			if ..ColList(.subElement,.addedElement)  {
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
		set ok=1 /* failure rollsback but returns OK */
	}
	quit ok
}

///  ',' sql_expression
/// summary values:,
/// summary=P&C
Method SqlFunction4Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation(",",1) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..SqlExpression(.subElement,.addedElement)  {
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

/// '*' | sql_expression
/// summary=P|C
Method SqlFunction50Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P|C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"*")  {
		set done=1 ; or
	} elseif ..SqlExpression(.subElement,.addedElement)  {
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

/// 
/// summary values:%FOREACH
/// summary=P&P&C&P
Method SqlFunction51OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&P&C&P
	if '..isPunctuation("%FOREACH",8) { quit 1 /* not found is OK */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"%FOREACH")  {
		if ..addPunctuation(.subElement,"(")  {
			if ..ColList(.subElement,.addedElement)  {
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
		set ok=1 /* failure rollsback but returns OK */
	}
	quit ok
}

/// 'FOR' 'SOME' '%ELEMENT' '(' sql_expression ')' sql_expression
/// summary values:FOR
/// summary=K&K&P&P&C&P&C
Method SqlFunction52Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&K&P&P&C&P&C
	if '(..isKeyword("FOR")) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"FOR")  {
		if ..addKeyword(.subElement,"SOME")  {
			if ..addPunctuation(.subElement,"%ELEMENT")  {
				if ..addPunctuation(.subElement,"(")  {
					if ..SqlExpression(.subElement,.addedElement)  {
						if ..addPunctuation(.subElement,")")  {
							if ..SqlExpression(.subElement,.addedElement)  {
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
		set ok=0
	}
	quit ok
}

/// 'trim' '(' ['leading' | 'trailing' | 'both'] [(sql_expression 'from')] sql_expression ')'
/// summary values:TRIM
/// summary=K&P&[K|K|K]&[(C&K)]&C&P
Method SqlFunction53Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&P&[K|K|K]&[(C&K)]&C&P
	if '(..isKeyword("TRIM")) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"TRIM")  {
		if ..addPunctuation(.subElement,"(")  {
			if ..SqlFunction54OptGrp(.subElement,.addedElement)  {
				if $S(..SqlFunction55Sub(.subElement,.addedElement) :1,1:1) {
					if ..SqlExpression(.subElement,.addedElement)  {
						if ..addPunctuation(.subElement,")")  {
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
		set ok=0
	}
	quit ok
}

/// 
/// summary values:LEADING,TRAILING,BOTH
/// summary=K|K|K
Method SqlFunction54OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K|K|K
	if '(..isKeywordInList($lb("LEADING","TRAILING","BOTH"))) { quit 1 /* not found is OK */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"LEADING")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"TRAILING")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"BOTH")  {
		set done=1 ; end compileRules
	}

	set ok=1
	quit ok
}

/// sql_expression 'from'
/// summary=C&K
Method SqlFunction55Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&K
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SqlExpression(.subElement,.addedElement)  {
		if ..addKeyword(.subElement,"FROM")  {
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

/// 'dateadd' '(' sql_function_datepart_part ',' sql_expression ',' sql_expression ')'
/// summary values:DATEADD
/// summary=K&P&C&P&C&P&C&P
Method SqlFunction56Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&P&C&P&C&P&C&P
	if '(..isKeyword("DATEADD")) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"DATEADD")  {
		if ..addPunctuation(.subElement,"(")  {
			if ..SqlFunctionDatepartPart(.subElement,.addedElement)  {
				if ..addPunctuation(.subElement,",")  {
					if ..SqlExpression(.subElement,.addedElement)  {
						if ..addPunctuation(.subElement,",")  {
							if ..SqlExpression(.subElement,.addedElement)  {
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
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	quit ok
}

/// 'datediff' '(' sql_function_datepart_part ',' sql_expression ',' sql_expression ')'
/// summary values:DATEDIFF
/// summary=K&P&C&P&C&P&C&P
Method SqlFunction57Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&P&C&P&C&P&C&P
	if '(..isKeyword("DATEDIFF")) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"DATEDIFF")  {
		if ..addPunctuation(.subElement,"(")  {
			if ..SqlFunctionDatepartPart(.subElement,.addedElement)  {
				if ..addPunctuation(.subElement,",")  {
					if ..SqlExpression(.subElement,.addedElement)  {
						if ..addPunctuation(.subElement,",")  {
							if ..SqlExpression(.subElement,.addedElement)  {
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
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	quit ok
}

/// 'datename' '(' sql_function_datepart_part ',' sql_expression ')'
/// summary values:DATENAME
/// summary=K&P&C&P&C&P
Method SqlFunction58Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&P&C&P&C&P
	if '(..isKeyword("DATENAME")) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"DATENAME")  {
		if ..addPunctuation(.subElement,"(")  {
			if ..SqlFunctionDatepartPart(.subElement,.addedElement)  {
				if ..addPunctuation(.subElement,",")  {
					if ..SqlExpression(.subElement,.addedElement)  {
						if ..addPunctuation(.subElement,")")  {
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
		set ok=0
	}
	quit ok
}

/// 'datepart' '(' sql_function_datepart_part ',' sql_expression ')'
/// summary values:DATEPART
/// summary=K&P&C&P&C&P
Method SqlFunction59Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&P&C&P&C&P
	if '(..isKeyword("DATEPART")) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"DATEPART")  {
		if ..addPunctuation(.subElement,"(")  {
			if ..SqlFunctionDatepartPart(.subElement,.addedElement)  {
				if ..addPunctuation(.subElement,",")  {
					if ..SqlExpression(.subElement,.addedElement)  {
						if ..addPunctuation(.subElement,")")  {
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
		set ok=0
	}
	quit ok
}

/// '%exact' sql_expression
/// summary values:%EXACT
/// summary=P&C
Method SqlFunction5Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation("%EXACT",6) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"%exact")  {
		if ..SqlExpression(.subElement,.addedElement)  {
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

/// identifier '(' [ '*' | (sql_expression ( ',' sql_expression)*) ] ')' [ sql_window ]
/// summary=C&P&[P|(C&(?4punctuation:4?)*)]&P&[C]
Method SqlFunction60Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&P&[P|(C&(?4punctuation:4?)*)]&P&[C]
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Identifier(.subElement,.addedElement)  {
		if ..addPunctuation(.subElement,"(")  {
			if ..SqlFunction61OptGrp(.subElement,.addedElement)  {
				if ..addPunctuation(.subElement,")")  {
					if $S(..SqlWindow(.subElement,.addedElement) :1,1:1) {
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
		set ok=0
	}
	quit ok
}

/// 
/// summary=P|(C&(?4punctuation:4?)*)
Method SqlFunction61OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P|(C&(?4punctuation:4?)*)
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"*")  {
		set done=1 ; or
	} elseif ..SqlFunction62Sub(.subElement,.addedElement)  {
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

/// sql_expression ( ',' sql_expression)*
/// summary=C&(?4punctuation:4?)*
Method SqlFunction62Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&(?4punctuation:4?)*
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SqlExpression(.subElement,.addedElement)  {
		if ..SqlFunction63RepZero(.subElement,.addedElement)  {
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

///  ( ',' sql_expression)*
Method SqlFunction63RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..SqlFunction64Sub(.subElement,.addedElement)  {
		set done=1
	}
	set ok=1
	quit ok
}

///  ',' sql_expression
/// summary values:,
/// summary=P&C
Method SqlFunction64Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation(",",1) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..SqlExpression(.subElement,.addedElement)  {
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

/// 'count' '(' ')' [ sql_window ]
/// summary values:COUNT
/// summary=K&P&P&[C]
Method SqlFunction6Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&P&P&[C]
	if '(..isKeyword("COUNT")) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"COUNT")  {
		if ..addPunctuation(.subElement,"(")  {
			if ..addPunctuation(.subElement,")")  {
				if $S(..SqlWindow(.subElement,.addedElement) :1,1:1) {
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

/// 'count' '(' ['distinct' | 'all' ] ('*' | sql_expression) [ '%FOREACH' '(' col_list ')' ] ')' [ sql_window ]
/// summary values:COUNT
/// summary=K&P&[K|K]&(P|C)&[P&P&C&P]&P&[C]
Method SqlFunction7Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&P&[K|K]&(P|C)&[P&P&C&P]&P&[C]
	if '(..isKeyword("COUNT")) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"COUNT")  {
		if ..addPunctuation(.subElement,"(")  {
			if ..SqlFunction8OptGrp(.subElement,.addedElement)  {
				if ..SqlFunction9Sub(.subElement,.addedElement)  {
					if ..SqlFunction10OptGrp(.subElement,.addedElement)  {
						if ..addPunctuation(.subElement,")")  {
							if $S(..SqlWindow(.subElement,.addedElement) :1,1:1) {
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
		set ok=0
	}
	quit ok
}

/// 
/// summary values:DISTINCT,ALL
/// summary=K|K
Method SqlFunction8OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K|K
	if '(..isKeywordInList($lb("DISTINCT","ALL"))) { quit 1 /* not found is OK */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(.subElement,"DISTINCT")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"ALL")  {
		set done=1 ; end compileRules
	}

	set ok=1
	quit ok
}

/// '*' | sql_expression
/// summary=P|C
Method SqlFunction9Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P|C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"*")  {
		set done=1 ; or
	} elseif ..SqlExpression(.subElement,.addedElement)  {
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

///  sql_function_datepart_part ::= sql_function_datepart_part_word | sql_string | colon_sql_cos_variable
/// summary=C|C|C
Method SqlFunctionDatepartPart(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SqlFunctionDatepartPartWord(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlString(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ColonSqlCosVariable(.subElement,.addedElement)  {
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

///  sql_function_datepart_part_word ::= 'year' | 'yy' | 'yyyy' | 'quarter' | 'qq' | 'q' | 'month' | 'mm' | 'm' | 'week' | 'wk' | 'ww' | 'weekday' | 'dw' | 'w' | 'dayofyear' | 'dy' | 'y' | 'day' | 'dd' | 'd' | 'hour' | 'hh' | 'h' | 'minute' | 'mi' | 'n' | 'second' | 'ss' | 's' | 'millisecond' | 'ms' | 'sqltimestamp' | 'sts'
/// summary values:YEAR,YY,YYYY,QUARTER,QQ,Q,MONTH,MM,M,WEEK,WK,WW,WEEKDAY,DW,W,DAYOFYEAR,DY,Y,DAY,DD,D,HOUR,HH,H,MINUTE,MI,N,SECOND,SS,S,MILLISECOND,MS,SQLTIMESTAMP,STS
/// summary=K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K
Method SqlFunctionDatepartPartWord(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K
	if '(..isKeywordInList($lb("YEAR","YY","YYYY","QUARTER","QQ","Q","MONTH","MM","M","WEEK","WK","WW","WEEKDAY","DW","W","DAYOFYEAR","DY","Y","DAY","DD","D","HOUR","HH","H","MINUTE","MI","N","SECOND","SS","S","MILLISECOND","MS","SQLTIMESTAMP","STS"))) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"YEAR")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"YY")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"YYYY")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"QUARTER")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"QQ")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"Q")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"MONTH")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"MM")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"M")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"WEEK")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"WK")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"WW")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"WEEKDAY")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"DW")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"W")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"DAYOFYEAR")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"DY")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"Y")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"DAY")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"DD")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"D")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"HOUR")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"HH")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"H")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"MINUTE")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"MI")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"N")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"SECOND")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"SS")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"S")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"MILLISECOND")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"MS")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"SQLTIMESTAMP")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"STS")  {
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

///  sql_monadicop ::= "+" | "-" | "NOT" | "%NOINDEX"
/// summary=P|P|K|P
Method SqlMonadicop(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|P|K|P
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"+")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"-")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"NOT")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"%NOINDEX")  {
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

///  sql_number ::= 'NEED NUMBER'
/// summary values:NEED NUMBER
/// summary=P
Method SqlNumber(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("NEED NUMBER",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"NEED NUMBER")  {
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

///  sql_predicate ::= "%STARTSWITH" | "BETWEEN" | "IS" | "IN" | "%INLIST" | "LIKE" | "%PATTERN" | "%MATCHES"
/// summary=P|K|K|K|P|K|P|P
Method SqlPredicate(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|K|K|K|P|K|P|P
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"%STARTSWITH")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"BETWEEN")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"IS")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"IN")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"%INLIST")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"LIKE")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"%PATTERN")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"%MATCHES")  {
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

///  sql_primary ::= sql_number | sql_string | sql_case_expression | sql_fn_function | sql_function | colon_sql_cos_variable | stored_proc_call | column_reference | sql_special_variable | macrocall | ( '(' subquery_specification ')' ) | ( '(' sql_expression ( ',' sql_expression )* ')' )
/// summary=C|C|C|C|C|C|C|C|C|C|(P&C&P)|(P&C&(?4punctuation:4?)*&P)
Method SqlPrimary(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C|C|C|C|C|C|C|C|C|(P&C&P)|(P&C&(?4punctuation:4?)*&P)
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SqlNumber(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlString(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlCaseExpression(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlFnFunction(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlFunction(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ColonSqlCosVariable(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StoredProcCall(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ColumnReference(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlSpecialVariable(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Macrocall(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlPrimary1Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlPrimary2Sub(.subElement,.addedElement)  {
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

///  '(' subquery_specification ')'
/// summary values:(
/// summary=P&C&P
Method SqlPrimary1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&P
	if '..isPunctuation("(",1) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if ..SubquerySpecification(.subElement,.addedElement)  {
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

///  '(' sql_expression ( ',' sql_expression )* ')'
/// summary values:(
/// summary=P&C&(?4punctuation:4?)*&P
Method SqlPrimary2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&(?4punctuation:4?)*&P
	if '..isPunctuation("(",1) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if ..SqlExpression(.subElement,.addedElement)  {
			if ..SqlPrimary3RepZero(.subElement,.addedElement)  {
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
		set ok=0
	}
	quit ok
}

///  ( ',' sql_expression )*
Method SqlPrimary3RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..SqlPrimary4Sub(.subElement,.addedElement)  {
		set done=1
	}
	set ok=1
	quit ok
}

///  ',' sql_expression
/// summary values:,
/// summary=P&C
Method SqlPrimary4Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation(",",1) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..SqlExpression(.subElement,.addedElement)  {
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

///  sql_program ::= query_specification | call_command | insert_command | update_command | declare_command | open_command | fetch_command | close_command | delete_command | CHECKPRIV_command | drop_command | ( select_into_variable '=' call_command )
/// summary=C|C|C|C|C|C|C|C|C|C|C|(C&P&C)
Method SqlProgram(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C|C|C|C|C|C|C|C|C|C|(C&P&C)
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..QuerySpecification(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CallCommand(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..InsertCommand(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..UpdateCommand(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..DeclareCommand(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OpenCommand(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..FetchCommand(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CloseCommand(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..DeleteCommand(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CheckprivCommand(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..DropCommand(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlProgram1Sub(.subElement,.addedElement)  {
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

///  select_into_variable '=' call_command
/// summary=C&P&C
Method SqlProgram1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&P&C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SelectIntoVariable(.subElement,.addedElement)  {
		if ..addPunctuation(.subElement,"=")  {
			if ..CallCommand(.subElement,.addedElement)  {
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

///  sql_special_variable ::= 'NULL' | '?' | '$H' | '$ZNSPACE' | '$NAMESPACE' | '$USERNAME'
/// summary=K|P|P|P|P|P
Method SqlSpecialVariable(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|P|P|P|P|P
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"NULL")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"?")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"$H")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"$ZNSPACE")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"$NAMESPACE")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"$USERNAME")  {
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

///  sql_string ::= 'NEED STRING'
/// summary values:NEED STRING
/// summary=P
Method SqlString(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("NEED STRING",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"NEED STRING")  {
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

///  sql_term ::= sql_primary
/// summary=C
Method SqlTerm(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SqlPrimary(.subElement,.addedElement)  {
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

///  sql_window ::= 'OVER' '(' [ sql_window_partition ] [ order_by_clause ] [ (sql_window_rows_between | sql_window_rows ) ] ')'
/// summary values:OVER
/// summary=K&P&[C]&[C]&[(C|C)]&P
Method SqlWindow(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&[C]&[C]&[(C|C)]&P
	if '(..isKeyword("OVER")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"OVER")  {
		if ..addPunctuation(.subElement,"(")  {
			if $S(..SqlWindowPartition(.subElement,.addedElement) :1,1:1) {
				if $S(..OrderByClause(.subElement,.addedElement) :1,1:1) {
					if $S(..SqlWindow1Sub(.subElement,.addedElement) :1,1:1) {
						if ..addPunctuation(.subElement,")")  {
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

/// sql_window_rows_between | sql_window_rows
/// summary=C|C
Method SqlWindow1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..SqlWindowRowsBetween(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlWindowRows(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

///  sql_window_frame ::= ('UNBOUNDED' 'PRECEDING') | (sql_expression 'PRECEDING') | ('CURRENT' 'ROW') | ('UNBOUNDED' 'FOLLOWING') | (sql_expression 'FOLLOWING')
/// summary=(K&K)|(C&K)|(K&K)|(K&K)|(C&K)
Method SqlWindowFrame(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K&K)|(C&K)|(K&K)|(K&K)|(C&K)
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SqlWindowFrame1Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlWindowFrame2Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlWindowFrame3Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlWindowFrame4Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlWindowFrame5Sub(.subElement,.addedElement)  {
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

/// 'UNBOUNDED' 'PRECEDING'
/// summary=K&K
Method SqlWindowFrame1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"UNBOUNDED")  {
		if ..addKeyword(.subElement,"PRECEDING")  {
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

/// sql_expression 'PRECEDING'
/// summary=C&K
Method SqlWindowFrame2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&K
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SqlExpression(.subElement,.addedElement)  {
		if ..addKeyword(.subElement,"PRECEDING")  {
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

/// 'CURRENT' 'ROW'
/// summary values:CURRENT
/// summary=K&K
Method SqlWindowFrame3Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&K
	if '(..isKeyword("CURRENT")) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"CURRENT")  {
		if ..addKeyword(.subElement,"ROW")  {
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

/// 'UNBOUNDED' 'FOLLOWING'
/// summary values:UNBOUNDED
/// summary=K&K
Method SqlWindowFrame4Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&K
	if '(..isKeyword("UNBOUNDED")) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"UNBOUNDED")  {
		if ..addKeyword(.subElement,"FOLLOWING")  {
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

/// sql_expression 'FOLLOWING'
/// summary=C&K
Method SqlWindowFrame5Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&K
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SqlExpression(.subElement,.addedElement)  {
		if ..addKeyword(.subElement,"FOLLOWING")  {
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

///  sql_window_partition ::= 'PARTITION' 'BY' col_list
/// summary values:PARTITION
/// summary=K&K&C
Method SqlWindowPartition(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&K&C
	if '(..isKeyword("PARTITION")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"PARTITION")  {
		if ..addKeyword(.subElement,"BY")  {
			if ..ColList(.subElement,.addedElement)  {
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

///  sql_window_rows ::= 'ROWS' sql_window_frame
/// summary values:ROWS
/// summary=K&C
Method SqlWindowRows(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C
	if '(..isKeyword("ROWS")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"ROWS")  {
		if ..SqlWindowFrame(.subElement,.addedElement)  {
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

///  sql_window_rows_between ::= 'ROWS' 'BETWEEN' sql_window_frame 'AND' sql_window_frame
/// summary values:ROWS
/// summary=K&K&C&K&C
Method SqlWindowRowsBetween(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&K&C&K&C
	if '(..isKeyword("ROWS")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"ROWS")  {
		if ..addKeyword(.subElement,"BETWEEN")  {
			if ..SqlWindowFrame(.subElement,.addedElement)  {
				if ..addKeyword(.subElement,"AND")  {
					if ..SqlWindowFrame(.subElement,.addedElement)  {
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

///  stored_proc_call ::= stored_proc_name stored_proc_parameter_list
/// summary=C&C
Method StoredProcCall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..StoredProcName(.subElement,.addedElement)  {
		if ..StoredProcParameterList(.subElement,.addedElement)  {
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

///  stored_proc_name ::= [ schema_name '.' ] qualified_identifier
/// summary=[C&P]&C
Method StoredProcName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary [C&P]&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..StoredProcName1OptGrp(.subElement,.addedElement)  {
		if ..QualifiedIdentifier(.subElement,.addedElement)  {
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
/// summary=C&P
Method StoredProcName1OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&P
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SchemaName(.subElement,.addedElement)  {
		if ..addPunctuation(.subElement,".")  {
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

///  stored_proc_parameter ::= sql_expression
/// summary=C
Method StoredProcParameter(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SqlExpression(.subElement,.addedElement)  {
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

///  stored_proc_parameter_list ::= '(' [ [stored_proc_parameter] ( ',' [stored_proc_parameter] )* ] ')'
/// summary values:(
/// summary=P&[[C]&(?4punctuation:4?)*]&P
Method StoredProcParameterList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&[[C]&(?4punctuation:4?)*]&P
	if '..isPunctuation("(",1) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if ..StoredProcParameterList1OptGrp(.subElement,.addedElement)  {
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

/// 
/// summary=[C]&(?4punctuation:4?)*
Method StoredProcParameterList1OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary [C]&(?4punctuation:4?)*
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..StoredProcParameter(.subElement,.addedElement) :1,1:1) {
		if ..StoredProcParameterList2RepZero(.subElement,.addedElement)  {
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

///  ( ',' [stored_proc_parameter] )*
Method StoredProcParameterList2RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..StoredProcParameterList3Sub(.subElement,.addedElement)  {
		set done=1
	}
	set ok=1
	quit ok
}

///  ',' [stored_proc_parameter]
/// summary values:,
/// summary=P&[C]
Method StoredProcParameterList3Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&[C]
	if '..isPunctuation(",",1) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if $S(..StoredProcParameter(.subElement,.addedElement) :1,1:1) {
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

///  stored_proc_table ::= stored_proc_name stored_proc_parameter_list [ table_as_clause ]
/// summary=C&C&[C]
Method StoredProcTable(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&C&[C]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..StoredProcName(.subElement,.addedElement)  {
		if ..StoredProcParameterList(.subElement,.addedElement)  {
			if $S(..TableAsClause(.subElement,.addedElement) :1,1:1) {
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

///  subquery ::= '(' query_expression ')'
/// summary values:(
/// summary=P&C&P
Method Subquery(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&P
	if '..isPunctuation("(",1) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if ..QueryExpression(.subElement,.addedElement)  {
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

///  subquery_specification ::= select_command ( union select_command )*
/// summary=C&(?4punctuation:4?)*
Method SubquerySpecification(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SelectCommand(.subElement,.addedElement)  {
		if ..SubquerySpecification1RepZero(.subElement,.addedElement)  {
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

///  ( union select_command )*
Method SubquerySpecification1RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..SubquerySpecification2Sub(.subElement,.addedElement)  {
		set done=1
	}
	set ok=1
	quit ok
}

///  union select_command
/// summary=C&C
Method SubquerySpecification2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Union(.subElement,.addedElement)  {
		if ..SelectCommand(.subElement,.addedElement)  {
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

///  table_as_clause ::= [ 'AS' ] alias_name
/// summary=[K]&C
Method TableAsClause(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary [K]&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..addKeyword(.subElement,"AS") :1,1:1) {
		if ..AliasName(.subElement,.addedElement)  {
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

///  table_expression ::= from_clause [ where_clause ] [ group_by_clause ] [ having_clause ] [ order_by_clause ]
/// summary=C&[C]&[C]&[C]&[C]
Method TableExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&[C]&[C]&[C]&[C]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..FromClause(.subElement,.addedElement)  {
		if $S(..WhereClause(.subElement,.addedElement) :1,1:1) {
			if $S(..GroupByClause(.subElement,.addedElement) :1,1:1) {
				if $S(..HavingClause(.subElement,.addedElement) :1,1:1) {
					if $S(..OrderByClause(.subElement,.addedElement) :1,1:1) {
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

///  table_name ::= [ schema_name '.' ] qualified_identifier
/// summary=[C&P]&C
Method TableName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary [C&P]&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..TableName1OptGrp(.subElement,.addedElement)  {
		if ..QualifiedIdentifier(.subElement,.addedElement)  {
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
/// summary=C&P
Method TableName1OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&P
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SchemaName(.subElement,.addedElement)  {
		if ..addPunctuation(.subElement,".")  {
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

///  table_reference ::= stored_proc_table | direct_table | derived_table
/// summary=C|C|C
Method TableReference(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..StoredProcTable(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..DirectTable(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..DerivedTable(.subElement,.addedElement)  {
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

///  table_reference_noalias ::= direct_table_noalias | derived_table_noalias
/// summary=C|C
Method TableReferenceNoalias(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..DirectTableNoalias(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..DerivedTableNoalias(.subElement,.addedElement)  {
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

///  table_subquery ::= subquery
/// summary=C
Method TableSubquery(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Subquery(.subElement,.addedElement)  {
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

///  union ::= 'UNION' ('ALL' | '%PARALLEL')*
/// summary values:UNION
/// summary=K&(?4punctuation:4?)*
Method Union(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&(?4punctuation:4?)*
	if '(..isKeyword("UNION")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"UNION")  {
		if ..Union1RepZero(.subElement,.addedElement)  {
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

///  ('ALL' | '%PARALLEL')*
Method Union1RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..Union2Sub(.subElement,.addedElement)  {
		set done=1
	}
	set ok=1
	quit ok
}

/// 'ALL' | '%PARALLEL'
/// summary=K|P
Method Union2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K|P
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"ALL")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"%PARALLEL")  {
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

///  update_columns ::= '(' column_name ( ',' column_name)* ')'
/// summary values:(
/// summary=P&C&(?4punctuation:4?)*&P
Method UpdateColumns(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&(?4punctuation:4?)*&P
	if '..isPunctuation("(",1) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if ..ColumnName(.subElement,.addedElement)  {
			if ..UpdateColumns1RepZero(.subElement,.addedElement)  {
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ( ',' column_name)*
Method UpdateColumns1RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..UpdateColumns2Sub(.subElement,.addedElement)  {
		set done=1
	}
	set ok=1
	quit ok
}

///  ',' column_name
/// summary values:,
/// summary=P&C
Method UpdateColumns2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation(",",1) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..ColumnName(.subElement,.addedElement)  {
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

///  update_command ::= 'UPDATE' (update_keyword)* direct_table ( ('SET' update_set (',' update_set)* ) | ( update_columns (('VALUES' update_values) | select_command) ) ) [from_clause] [where_clause]
/// summary values:UPDATE
/// summary=K&(?4punctuation:4?)*&C&((K&C&(?4punctuation:4?)*)|(C&((K&C)|C)))&[C]&[C]
Method UpdateCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&(?4punctuation:4?)*&C&((K&C&(?4punctuation:4?)*)|(C&((K&C)|C)))&[C]&[C]
	if '(..isKeyword("UPDATE")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"UPDATE")  {
		if ..UpdateCommand1RepZero(.subElement,.addedElement)  {
			if ..DirectTable(.subElement,.addedElement)  {
				if ..UpdateCommand3Sub(.subElement,.addedElement)  {
					if $S(..FromClause(.subElement,.addedElement) :1,1:1) {
						if $S(..WhereClause(.subElement,.addedElement) :1,1:1) {
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

///  (update_keyword)*
Method UpdateCommand1RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..UpdateCommand2Sub(.subElement,.addedElement)  {
		set done=1
	}
	set ok=1
	quit ok
}

/// update_keyword
/// summary=C
Method UpdateCommand2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C
	set subElement=ParentElement
	set done=0 ; method start
	if ..UpdateKeyword(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

///  ('SET' update_set (',' update_set)* ) | ( update_columns (('VALUES' update_values) | select_command) )
/// summary=(K&C&(?4punctuation:4?)*)|(C&((K&C)|C))
Method UpdateCommand3Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary (K&C&(?4punctuation:4?)*)|(C&((K&C)|C))
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..UpdateCommand4Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..UpdateCommand7Sub(.subElement,.addedElement)  {
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

/// 'SET' update_set (',' update_set)*
/// summary values:SET
/// summary=K&C&(?4punctuation:4?)*
Method UpdateCommand4Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&C&(?4punctuation:4?)*
	if '(..isKeyword("SET")) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"SET")  {
		if ..UpdateSet(.subElement,.addedElement)  {
			if ..UpdateCommand5RepZero(.subElement,.addedElement)  {
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

///  (',' update_set)*
Method UpdateCommand5RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..UpdateCommand6Sub(.subElement,.addedElement)  {
		set done=1
	}
	set ok=1
	quit ok
}

/// ',' update_set
/// summary values:,
/// summary=P&C
Method UpdateCommand6Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation(",",1) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..UpdateSet(.subElement,.addedElement)  {
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

///  update_columns (('VALUES' update_values) | select_command)
/// summary=C&((K&C)|C)
Method UpdateCommand7Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&((K&C)|C)
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..UpdateColumns(.subElement,.addedElement)  {
		if ..UpdateCommand8Sub(.subElement,.addedElement)  {
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

/// ('VALUES' update_values) | select_command
/// summary=(K&C)|C
Method UpdateCommand8Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary (K&C)|C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..UpdateCommand9Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SelectCommand(.subElement,.addedElement)  {
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

/// 'VALUES' update_values
/// summary values:VALUES
/// summary=K&C
Method UpdateCommand9Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&C
	if '(..isKeyword("VALUES")) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"VALUES")  {
		if ..UpdateValues(.subElement,.addedElement)  {
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

///  update_keyword ::= '%NOCHECK' | '%NOFPLAN' | '%NOINDEX' | '%NOJOURN' | '%NOLOCK' | '%NOTRIGGER' | '%PROFILE_ALL' | '%PROFILE_ALL'
/// summary values:%NOCHECK,%NOFPLAN,%NOINDEX,%NOJOURN,%NOLOCK,%NOTRIGGER,%PROFILE_ALL,%PROFILE_ALL
/// summary=P|P|P|P|P|P|P|P
Method UpdateKeyword(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|P|P|P|P|P|P|P
	if '..isPunctuationInList($lb("%PROFILE_ALL","%PROFILE_ALL"),12),'..isPunctuation("%NOTRIGGER",10),'..isPunctuationInList($lb("%NOCHECK","%NOFPLAN","%NOINDEX","%NOJOURN"),8),'..isPunctuation("%NOLOCK",7) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"%NOCHECK")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"%NOFPLAN")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"%NOINDEX")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"%NOJOURN")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"%NOLOCK")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"%NOTRIGGER")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"%PROFILE_ALL")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"%PROFILE_ALL")  {
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

///  update_set ::= column_reference '=' sql_expression
/// summary=C&P&C
Method UpdateSet(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&P&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ColumnReference(.subElement,.addedElement)  {
		if ..addPunctuation(.subElement,"=")  {
			if ..SqlExpression(.subElement,.addedElement)  {
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

///  update_values ::= '(' sql_expression ( ',' sql_expression )* ')'
/// summary values:(
/// summary=P&C&(?4punctuation:4?)*&P
Method UpdateValues(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&(?4punctuation:4?)*&P
	if '..isPunctuation("(",1) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if ..SqlExpression(.subElement,.addedElement)  {
			if ..UpdateValues1RepZero(.subElement,.addedElement)  {
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ( ',' sql_expression )*
Method UpdateValues1RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..UpdateValues2Sub(.subElement,.addedElement)  {
		set done=1
	}
	set ok=1
	quit ok
}

///  ',' sql_expression
/// summary values:,
/// summary=P&C
Method UpdateValues2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation(",",1) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..SqlExpression(.subElement,.addedElement)  {
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

///  where_clause ::= 'WHERE' sql_expression
/// summary values:WHERE
/// summary=K&C
Method WhereClause(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C
	if '(..isKeyword("WHERE")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"WHERE")  {
		if ..SqlExpression(.subElement,.addedElement)  {
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

///  with_clause ::= alias_name 'AS' '(' select_command ')'
/// summary=C&K&P&C&P
Method WithClause(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&K&P&C&P
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..AliasName(.subElement,.addedElement)  {
		if ..addKeyword(.subElement,"AS")  {
			if ..addPunctuation(.subElement,"(")  {
				if ..SelectCommand(.subElement,.addedElement)  {
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

///  with_command ::= 'WITH' with_clause (',' with_clause)*
/// summary values:WITH
/// summary=K&C&(?4punctuation:4?)*
Method WithCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C&(?4punctuation:4?)*
	if '(..isKeyword("WITH")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"WITH")  {
		if ..WithClause(.subElement,.addedElement)  {
			if ..WithCommand1RepZero(.subElement,.addedElement)  {
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

///  (',' with_clause)*
Method WithCommand1RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..WithCommand2Sub(.subElement,.addedElement)  {
		set done=1
	}
	set ok=1
	quit ok
}

/// ',' with_clause
/// summary values:,
/// summary=P&C
Method WithCommand2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation(",",1) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..WithClause(.subElement,.addedElement)  {
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

Method newElement(Type As %String) As PXW.DEV.BNF.Elements.SQL
{
	quit ##class(PXW.DEV.BNF.Elements.SQL).%New(Type)
}

}
