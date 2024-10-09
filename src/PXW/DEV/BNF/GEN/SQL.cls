/// Created: 2024-10-01 19:39:42 PXW.DEV.BNF.Compilers.Compiler1
Class PXW.DEV.BNF.GEN.SQL Extends PXW.DEV.BNF.super [ ProcedureBlock ]
{

Parameter KeywordPattern = "1.A";

Parameter Keywords = "ALL,AND,AS,ASC,AVG,BETWEEN,BOTH,BY,CALL,CASE,CAST,CLOSE,COUNT,CROSS,CURRENT,CURSOR,D,DATEADD,DATEDIFF,DATENAME,DATEPART,DAY,DAYOFYEAR,DD,DECLARE,DELETE,DESC,DISTINCT,DW,DY,E,ELSE,END,ESCAPE,EXECUTE,EXISTS,FETCH,FN,FOLLOWING,FOR,FROM,FULL,GROUP,H,HAVING,HH,HOUR,IN,INNER,INSERT,INTO,IS,JOIN,LEADING,LEFT,LENGTH,LIKE,LIST,M,MAX,MI,MILLISECOND,MIN,MINUTE,MM,MONTH,MS,N,NATURAL,NOT,NULL,ON,ONLY,OPEN,OR,ORDER,OUTER,OVER,PARTITION,PRECEDING,Q,QQ,QUARTER,READ,REFERENCES,RIGHT,ROW,ROWS,S,SECOND,SELECT,SET,SIZE,SOME,SQLTIMESTAMP,SS,STS,SUBSTRING,SUM,THEN,TOP,TRAILING,TRIM,UNBOUNDED,UNION,UPDATE,USER,USING,VALUE,VALUES,W,WEEK,WEEKDAY,WHEN,WHERE,WITH,WK,WW,Y,YEAR,YY,YYYY";

///  alias_name ::= identifier
Method AliasName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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

///  approximate_numeric_literal ::= mantissa 'E' exponent
Method ApproximateNumericLiteral(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&K&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Mantissa(subElement,.addedElement)  {
		if ..addKeyword(subElement,"E")  {
			if ..Exponent(subElement,.addedElement)  {
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

///  as_clause ::= [ 'AS' ] column_name
Method AsClause(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?&?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  call_command ::= 'CALL' stored_proc_call
/// summary values:CALL
Method CallCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  character_factor ::= character_primary
Method CharacterFactor(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CharacterPrimary(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  character_primary ::= value_expression_primary | string_value_function
Method CharacterPrimary(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ValueExpressionPrimary(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StringValueFunction(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  character_string_literal ::= '"' 'regexp:(((\%[a-zA-Z0-9])|(\$[a-zA-Z])|[a-zA-Z])[a-zA-Z0-9\.]*)' '"'
/// summary values:""
Method CharacterStringLiteral(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&P&P
	; first rule summary P
	if '(..isStringSingle("""",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"""")  {
		if ..addPunctuation(subElement,"regexp:(((\%[a-zA-Z0-9])|(\$[a-zA-Z])|[a-zA-Z])[a-zA-Z0-9\.]*)")  {
			if ..addPunctuation(subElement,"""")  {
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

///  character_substring_function ::= 'SUBSTRING' '(' character_value_expression ',' numeric_value_expression ',' numeric_value_expression ')'
/// summary values:SUBSTRING
Method CharacterSubstringFunction(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?&P&?1Rule?&P&?1Rule?&P
	; first rule summary K
	if '(..isKeywordInList($lb("SUBSTRING"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"SUBSTRING")  {
		if ..addPunctuation(subElement,"(")  {
			if ..CharacterValueExpression(subElement,.addedElement)  {
				if ..addPunctuation(subElement,",")  {
					if ..NumericValueExpression(subElement,.addedElement)  {
						if ..addPunctuation(subElement,",")  {
							if ..NumericValueExpression(subElement,.addedElement)  {
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

///  character_value_expression ::= concatenation | character_factor
Method CharacterValueExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Concatenation(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CharacterFactor(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  character_value_function ::= character_substring_function
Method CharacterValueFunction(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CharacterSubstringFunction(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  CHECKPRIV_command ::= '%CHECKPRIV' checkpriv_objpriv [ '(' column_name ( ',' column_name)* ')' ] 'ON' table_reference
/// summary values:%CHECKPRIV
Method CheckprivCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&?4?&K&?1Rule?
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
Method CheckprivCommand70OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&(?4?)*&P
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=1 /* failure rollsback but returns OK */
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  ( ',' column_name)*
Method CheckprivCommand71RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..CheckprivCommand72Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' column_name
/// summary values:,
Method CheckprivCommand72Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  checkpriv_objpriv ::= '%ALTER' | 'DELETE' | 'SELECT' | 'INSERT' | 'UPDATE' | 'EXECUTE' | 'REFERENCES'
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  close_command ::= 'CLOSE' cursor_name
/// summary values:CLOSE
Method CloseCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  col_list ::= column_reference ( ',' column_reference )*
Method ColList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ColumnReference(subElement,.addedElement)  {
		if ..ColList163RepZero(subElement,.addedElement)  {
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

///  ( ',' column_reference )*
Method ColList163RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ColList164Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' column_reference
/// summary values:,
Method ColList164Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  colon_sql_cos_variable ::= ':' sql_cos_variable
/// summary values::
Method ColonSqlCosVariable(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  column_name ::= identifier
Method ColumnName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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

///  column_name_list ::= column_name ( ',' column_name )*
Method ColumnNameList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  ( ',' column_name )*
Method ColumnNameList45RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ColumnNameList46Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' column_name
/// summary values:,
Method ColumnNameList46Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  column_reference ::= [ alias_name '.' ] column_name [column_reference_implicit]
Method ColumnReference(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?&?1Rule?&?4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ColumnReference169OptGrp(subElement,.addedElement)  {
		if ..ColumnName(subElement,.addedElement)  {
			if $S(..ColumnReferenceImplicit(subElement,.addedElement) :1,1:1) {
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

Method ColumnReference169OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&P
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=1 /* failure rollsback but returns OK */
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  column_reference_implicit ::= ('->' column_name)*
Method ColumnReferenceImplicit(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (?4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ColumnReferenceImplicit170RepZero(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  ('->' column_name)*
Method ColumnReferenceImplicit170RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ColumnReferenceImplicit171Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

/// '->' column_name
/// summary values:->
Method ColumnReferenceImplicit171Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  concatenation ::= character_value_expression '||' character_factor
Method Concatenation(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&P&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CharacterValueExpression(subElement,.addedElement)  {
		if ..addPunctuation(subElement,"||")  {
			if ..CharacterFactor(subElement,.addedElement)  {
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

///  condition_dyadicop ::= "+" | "-" | "\\" | "/" | "<>" | ">" | "'>" | ">=" | "<" | "'<" | "<=" | "=" | "'=" | "**" | "*" | "&&" | "&" | "]]" | "[" | "'[" | "!" | "||" | "_" | "#" | "AND" | "OR" | "%STARTSWITH" | "LIKE" | 'IS'
Method ConditionDyadicop(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|K|K|P|K|K
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
	} elseif ..addPunctuation(subElement,">")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"'>")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,">=")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"<")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"'<")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"<=")  {
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
	} elseif ..addKeyword(subElement,"AND")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"OR")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"%STARTSWITH")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"LIKE")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"IS")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  condition_expression ::= condition_factor ( condition_dyadicop condition_factor )*
Method ConditionExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ConditionFactor(subElement,.addedElement)  {
		if ..ConditionExpression73RepZero(subElement,.addedElement)  {
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

///  ( condition_dyadicop condition_factor )*
Method ConditionExpression73RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ConditionExpression74Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  condition_dyadicop condition_factor
Method ConditionExpression74Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ConditionDyadicop(subElement,.addedElement)  {
		if ..ConditionFactor(subElement,.addedElement)  {
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

///  condition_factor ::= [ condition_monadicop ] condition_term
Method ConditionFactor(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..ConditionMonadicop(subElement,.addedElement) :1,1:1) {
		if ..ConditionTerm(subElement,.addedElement)  {
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

///  condition_monadicop ::= "+" | "-" | 'NOT'
Method ConditionMonadicop(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|P|K
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"+")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"-")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"NOT")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  condition_primary ::= sql_number | sql_string | sql_cos_variable | sql_special_variable | column_reference | macrocall | ( '(' subquery_specification ')' ) | ( '(' sql_expression ')' )
Method ConditionPrimary(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SqlNumber(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlString(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlCosVariable(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlSpecialVariable(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ColumnReference(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Macrocall(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ConditionPrimary75Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ConditionPrimary76Sub(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  '(' subquery_specification ')'
/// summary values:(
Method ConditionPrimary75Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&P
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  '(' sql_expression ')'
/// summary values:(
Method ConditionPrimary76Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"(")  {
		if ..SqlExpression(subElement,.addedElement)  {
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

///  condition_term ::= condition_primary
Method ConditionTerm(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ConditionPrimary(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  correlation_name ::= identifier
Method CorrelationName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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

///  correlation_specification ::= [ 'AS' ] correlation_name
Method CorrelationSpecification(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..addKeyword(subElement,"AS") :1,1:1) {
		if ..CorrelationName(subElement,.addedElement)  {
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

///  cos_variable_identifier ::= ':' (['{' identifier '}'] | identifier )
/// summary values::
Method CosVariableIdentifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(":",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,":")  {
		if ..CosVariableIdentifier188Sub(subElement,.addedElement)  {
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

/// ['{' identifier '}'] | identifier
Method CosVariableIdentifier188Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CosVariableIdentifier189OptGrp(subElement,.addedElement)  {
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

/// 
/// summary values:{
Method CosVariableIdentifier189OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&P
	; first rule summary P
	if '(..isStringSingle("{",.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"{")  {
		if ..Identifier(subElement,.addedElement)  {
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

///  cross_join ::= table_reference 'CROSS' 'JOIN' table_reference
Method CrossJoin(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&K&K&?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  cursor_name ::= identifier
Method CursorName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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

///  declare_command ::= 'DECLARE' cursor_name 'CURSOR' 'FOR' query_specification [ 'FOR' ('UPDATE' | ('READ' 'ONLY'))]
/// summary values:DECLARE
Method DeclareCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?&K&K&?1Rule?&?4?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// 
/// summary values:FOR
Method DeclareCommand65OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=1 /* failure rollsback but returns OK */
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// 'UPDATE' | ('READ' 'ONLY')
Method DeclareCommand66Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// 'READ' 'ONLY'
/// summary values:READ
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  delete_command ::= 'DELETE' (update_keyword)* ['FROM'] direct_table [ where_clause ]
/// summary values:DELETE
Method DeleteCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&(?4?)*&?4?&?1Rule?&?4?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  (update_keyword)*
Method DeleteCommand68RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..DeleteCommand69Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

/// update_keyword
Method DeleteCommand69Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..UpdateKeyword(subElement,.addedElement)  {
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

///  derived_column ::= sql_expression [ as_clause ]
Method DerivedColumn(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  derived_column_list ::= column_name_list
Method DerivedColumnList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ColumnNameList(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  derived_table ::= table_subquery [ table_as_clause ]
Method DerivedTable(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  derived_table_noalias ::= table_subquery
Method DerivedTableNoalias(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..TableSubquery(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  direct_table ::= table_name [ table_as_clause ]
Method DirectTable(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  direct_table_noalias ::= table_name
Method DirectTableNoalias(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..TableName(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  exact_numeric_literal ::= (unsigned_integer [ '.' [ unsigned_integer ] ] ) | ('.' unsigned_integer)
Method ExactNumericLiteral(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ExactNumericLiteral183Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ExactNumericLiteral185Sub(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// unsigned_integer [ '.' [ unsigned_integer ] ]
Method ExactNumericLiteral183Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..UnsignedInteger(subElement,.addedElement)  {
		if ..ExactNumericLiteral184OptGrp(subElement,.addedElement)  {
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
Method ExactNumericLiteral184OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?4?
	; first rule summary P
	if '(..isStringSingle(".",.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,".")  {
		if $S(..UnsignedInteger(subElement,.addedElement) :1,1:1) {
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

/// '.' unsigned_integer
/// summary values:.
Method ExactNumericLiteral185Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(".",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,".")  {
		if ..UnsignedInteger(subElement,.addedElement)  {
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

///  exponent ::= signed_integer
Method Exponent(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SignedInteger(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  factor ::= [ sign ] numeric_primary
Method Factor(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..Sign(subElement,.addedElement) :1,1:1) {
		if ..NumericPrimary(subElement,.addedElement)  {
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

///  fetch_command ::= 'FETCH' cursor_name [ select_into ]
/// summary values:FETCH
Method FetchCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?&?4?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  from_clause ::= 'FROM' [from_optimise_list] ( table_reference) [ ( ',' table_reference )* ] ( join )*
/// summary values:FROM
Method FromClause(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?4?&?1Rule?&?4?&(?4?)*
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  table_reference
Method FromClause18Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..TableReference(subElement,.addedElement)  {
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

///  ( ',' table_reference )*
Method FromClause19RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..FromClause20Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' table_reference
/// summary values:,
Method FromClause20Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  ( join )*
Method FromClause21RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..FromClause22Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  join
Method FromClause22Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Join(subElement,.addedElement)  {
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

///  from_optimise ::= ('%firsttable' [alias_name]) | '%ALLINDEX' | '%STARTTABLE' | '%INORDER' | '%FULL' | '%NOFLATTEN' | '%NOMERGE' | '%NOREDUCE' | '%NOSVSO' | '%NOTOPOPT' | '%NOUNIONOROPT' | '%PARALLEL' | ('%IGNOREINDEX' index_reference_list ) | ('%IGNOREINDICES' index_reference_list )
Method FromOptimise(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|P|P|P|P|P|P|P|P|P|P|P|?1Rule?|?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// '%firsttable' [alias_name]
/// summary values:%FIRSTTABLE
Method FromOptimise25Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?4?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// '%IGNOREINDEX' index_reference_list
/// summary values:%IGNOREINDEX
Method FromOptimise26Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// '%IGNOREINDICES' index_reference_list
/// summary values:%IGNOREINDICES
Method FromOptimise27Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  from_optimise_list ::= from_optimise ( from_optimise )*
Method FromOptimiseList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  ( from_optimise )*
Method FromOptimiseList23RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..FromOptimiseList24Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  from_optimise
Method FromOptimiseList24Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..FromOptimise(subElement,.addedElement)  {
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

///  general_literal ::= character_string_literal
Method GeneralLiteral(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CharacterStringLiteral(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  general_value_specification ::= cos_variable_identifier | '?' | 'USER' | 'CURRENT_USER' | 'SESSION_USER' | 'SYSTEM_USER' | 'VALUE'
Method GeneralValueSpecification(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|P|K|P|P|P|K
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CosVariableIdentifier(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"?")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"USER")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"CURRENT_USER")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"SESSION_USER")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"SYSTEM_USER")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"VALUE")  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  group_by_clause ::= 'GROUP' 'BY' grouping_column_reference_list
/// summary values:GROUP
Method GroupByClause(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&K&?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  grouping_column_reference ::= sql_expression
Method GroupingColumnReference(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SqlExpression(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  grouping_column_reference_list ::= grouping_column_reference ( ',' grouping_column_reference )*
Method GroupingColumnReferenceList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  ( ',' grouping_column_reference )*
Method GroupingColumnReferenceList37RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..GroupingColumnReferenceList38Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' grouping_column_reference
/// summary values:,
Method GroupingColumnReferenceList38Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  having_clause ::= 'HAVING' sql_expression
/// summary values:HAVING
Method HavingClause(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?
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

///  index_reference ::= [ table_reference_noalias '.' ] identifier
Method IndexReference(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?&?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method IndexReference30OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&P
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=1 /* failure rollsback but returns OK */
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  index_reference_list ::= index_reference ( ',' index_reference )*
Method IndexReferenceList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  ( ',' index_reference )*
Method IndexReferenceList31RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..IndexReferenceList32Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' index_reference
/// summary values:,
Method IndexReferenceList32Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  insert_command ::= 'INSERT' (update_keyword)* ['INTO'] direct_table insert_method
/// summary values:INSERT
Method InsertCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&(?4?)*&?4?&?1Rule?&?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  (update_keyword)*
Method InsertCommand48RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..InsertCommand49Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

/// update_keyword
Method InsertCommand49Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..UpdateKeyword(subElement,.addedElement)  {
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

///  insert_method ::= insert_set_list | insert_values_list | insert_multirow
Method InsertMethod(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?|?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  insert_multirow ::= [ update_columns ] select_command
Method InsertMultirow(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?&?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  insert_set ::= column_reference '=' sql_expression
Method InsertSet(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&P&?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  insert_set_list ::= 'SET' insert_set (',' insert_set)*
/// summary values:SET
Method InsertSetList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?&(?4?)*
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  (',' insert_set)*
Method InsertSetList50RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..InsertSetList51Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

/// ',' insert_set
/// summary values:,
Method InsertSetList51Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  insert_values_list ::= update_columns 'VALUES' update_values
Method InsertValuesList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&K&?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  join ::= [('INNER' | 'OUTER' | 'LEFT' | 'RIGHT' | 'CROSS' | 'NATURAL' |'FULL' )*] 'JOIN' table_reference [ join_on ]
Method Join(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?&K&?1Rule?&?4?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// ('INNER' | 'OUTER' | 'LEFT' | 'RIGHT' | 'CROSS' | 'NATURAL' |'FULL' )*
Method Join28RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..Join29Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

/// 'INNER' | 'OUTER' | 'LEFT' | 'RIGHT' | 'CROSS' | 'NATURAL' |'FULL'
/// summary values:INNER,OUTER,LEFT,RIGHT,CROSS,NATURAL,FULL
Method Join29Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K|K|K|K|K|K
	if '(..isKeywordInList($lb("INNER","OUTER","LEFT","RIGHT","CROSS","NATURAL","FULL"),.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	s subElement=ParentElement
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
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  join_column_list ::= column_name_list
Method JoinColumnList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ColumnNameList(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  join_condition ::= 'ON' search_condition
/// summary values:ON
Method JoinCondition(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("ON"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"ON")  {
		if ..SearchCondition(subElement,.addedElement)  {
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

///  join_on ::= 'ON' sql_expression
/// summary values:ON
Method JoinOn(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  join_specification ::= join_condition | named_columns_join
Method JoinSpecification(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  join_type ::= 'INNER' | (outer_join_type [ 'OUTER' ])
Method JoinType(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// outer_join_type [ 'OUTER' ]
Method JoinType36Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  joined_table ::= cross_join | qualified_join | ('(' joined_table ')')
Method JoinedTable(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?|?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// '(' joined_table ')'
/// summary values:(
Method JoinedTable35Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&P
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  length_expression ::= 'LENGTH' '(' character_Value_expression ')'
/// summary values:LENGTH
Method LengthExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?&P
	; first rule summary K
	if '(..isKeywordInList($lb("LENGTH"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"LENGTH")  {
		if ..addPunctuation(subElement,"(")  {
			if ..CharacterValueExpression(subElement,.addedElement)  {
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

///  macro_identifier ::= identifier
Method MacroIdentifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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

///  macro_parameter ::= sql_expression
Method MacroParameter(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SqlExpression(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
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
		if ..MacroParameterList85OptGrp(subElement,.addedElement)  {
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

Method MacroParameterList85OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..MacroParameter(subElement,.addedElement) :1,1:1) {
		if ..MacroParameterList86RepZero(subElement,.addedElement)  {
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
Method MacroParameterList86RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..MacroParameterList87Sub(subElement,.addedElement)  {
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
Method MacroParameterList87Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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

///  macrocall ::= '$$$' macro_identifier [ macro_parameter_list | macro_parameter_text ]
/// summary values:$$$
Method Macrocall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&?4?
	; first rule summary P
	if '(..isStringSingle("$$$",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"$$$")  {
		if ..MacroIdentifier(subElement,.addedElement)  {
			if ..Macrocall84OptGrp(subElement,.addedElement)  {
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

Method Macrocall84OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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

///  mantissa ::= exact_numeric_literal
Method Mantissa(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ExactNumericLiteral(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  named_columns_join ::= 'USING' '(' join_column_list ')'
/// summary values:USING
Method NamedColumnsJoin(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?&P
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  non_join_query_expression ::= non_join_query_term
Method NonJoinQueryExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..NonJoinQueryTerm(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  non_join_query_primary ::= simple_table | ( '(' non_join_query_expression ')' )
Method NonJoinQueryPrimary(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  '(' non_join_query_expression ')'
/// summary values:(
Method NonJoinQueryPrimary44Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&P
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  non_join_query_term ::= non_join_query_primary
Method NonJoinQueryTerm(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..NonJoinQueryPrimary(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  number ::= ('regexp:[0-9]*' [ '.' 'regexp:[0-9]+'] [ ('e' | 'E') 'regexp:[0-9]+']) | ('.' 'regexp:[0-9]+' [ ('e' | 'E') 'regexp:[0-9]+'])
Method Number(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Number176Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Number180Sub(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
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
Method Number176Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?4?&?4?
	; first rule summary P
	if '(..isStringSingle("REGEXP:[0-9]*",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"regexp:[0-9]*")  {
		if ..Number177OptGrp(subElement,.addedElement)  {
			if ..Number178OptGrp(subElement,.addedElement)  {
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
Method Number177OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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

Method Number178OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&P
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Number179Sub(subElement,.addedElement)  {
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
Method Number179Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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
Method Number180Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&P&?4?
	; first rule summary P
	if '(..isStringSingle(".",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,".")  {
		if ..addPunctuation(subElement,"regexp:[0-9]+")  {
			if ..Number181OptGrp(subElement,.addedElement)  {
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

Method Number181OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&P
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Number182Sub(subElement,.addedElement)  {
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
Method Number182Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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

///  numeric_primary ::= value_expression_primary | numeric_value_function
Method NumericPrimary(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ValueExpressionPrimary(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..NumericValueFunction(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  numeric_value_expression ::= term | ( numeric_value_expression '+' term ) | ( numeric_value_expression '-' term )
Method NumericValueExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Term(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..NumericValueExpression165Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..NumericValueExpression166Sub(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  numeric_value_expression '+' term
Method NumericValueExpression165Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&P&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..NumericValueExpression(subElement,.addedElement)  {
		if ..addPunctuation(subElement,"+")  {
			if ..Term(subElement,.addedElement)  {
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

///  numeric_value_expression '-' term
Method NumericValueExpression166Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&P&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..NumericValueExpression(subElement,.addedElement)  {
		if ..addPunctuation(subElement,"-")  {
			if ..Term(subElement,.addedElement)  {
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

///  numeric_value_function ::= length_expression
Method NumericValueFunction(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LengthExpression(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  open_command ::= 'OPEN' cursor_name
/// summary values:OPEN
Method OpenCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  order_by_clause ::= 'ORDER' 'BY' ordering_column_reference_list
/// summary values:ORDER
Method OrderByClause(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&K&?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  ordering_column_reference ::= sql_expression [ 'ASC' | 'DESC']
Method OrderingColumnReference(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// 
/// summary values:ASC,DESC
Method OrderingColumnReference41OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K
	if '(..isKeywordInList($lb("ASC","DESC"),.value)) { quit 1 /* not found is OK */ }
	set subElement=ParentElement
	set done=0 ; method start
	s subElement=ParentElement
	if ..addKeyword(subElement,"ASC")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"DESC")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=1 /* failure rollsback but returns OK */
	}
	quit ret
}

///  ordering_column_reference_list ::= ordering_column_reference ( ',' ordering_column_reference )*
Method OrderingColumnReferenceList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  ( ',' ordering_column_reference )*
Method OrderingColumnReferenceList39RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..OrderingColumnReferenceList40Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' ordering_column_reference
/// summary values:,
Method OrderingColumnReferenceList40Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  outer_join_type ::= 'LEFT' | 'RIGHT' | 'FULL'
/// summary values:LEFT,RIGHT,FULL
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  qualified_identifier ::= identifier
Method QualifiedIdentifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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

///  qualified_join ::= table_reference [ 'NATURAL' ] [ join_type ] 'JOIN' table_reference [ join_specification ]
Method QualifiedJoin(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?&?4?&K&?1Rule?&?4?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  qualifier ::= table_name
Method Qualifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..TableName(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  query_expression ::= non_join_query_expression | joined_table
Method QueryExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  query_specification ::= [with_command ] select_command ( union select_command )*
Method QuerySpecification(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?&?1Rule?&(?4?)*
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  ( union select_command )*
Method QuerySpecification1RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..QuerySpecification2Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  union select_command
Method QuerySpecification2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  scalar_subquery ::= subquery
Method ScalarSubquery(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Subquery(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  schema_name ::= identifier
Method SchemaName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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

///  search_condition ::= condition_expression
Method SearchCondition(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ConditionExpression(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  select_command ::= 'SELECT' [ set_quantifier ] select_list [select_into] [ table_expression ]
/// summary values:SELECT
Method SelectCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?4?&?1Rule?&?4?&?4?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  select_into ::= 'INTO' select_into_variable ( ',' select_into_variable)*
/// summary values:INTO
Method SelectInto(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?&(?4?)*
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  ( ',' select_into_variable)*
Method SelectInto33RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..SelectInto34Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' select_into_variable
/// summary values:,
Method SelectInto34Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  select_into_variable ::= [':'] sql_cos_variable
Method SelectIntoVariable(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?&?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  select_list ::= select_sublist ( ',' select_sublist )*
Method SelectList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  ( ',' select_sublist )*
Method SelectList15RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..SelectList16Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' select_sublist
/// summary values:,
Method SelectList16Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  select_sublist ::= derived_column | (qualifier '.' '*')
Method SelectSublist(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// qualifier '.' '*'
Method SelectSublist17Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&P&P
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  set_quantifier ::= ( ( 'DISTINCT' ['BY' '(' sql_expression ( ',' sql_expression )* ')' ] ) | 'ALL' | ('TOP' sql_expression) | '%NOFPLAN' | '%NOLOCK' | '%NORUNTIME' | ('%PROFILE' ['ALL']) )*
Method SetQuantifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (?4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SetQuantifier7RepZero(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
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
/// summary values:BY
Method SetQuantifier10OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?&(?4?)*&P
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=1 /* failure rollsback but returns OK */
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  ( ',' sql_expression )*
Method SetQuantifier11RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..SetQuantifier12Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' sql_expression
/// summary values:,
Method SetQuantifier12Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// 'TOP' sql_expression
/// summary values:TOP
Method SetQuantifier13Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// '%PROFILE' ['ALL']
/// summary values:%PROFILE
Method SetQuantifier14Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?4?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  ( ( 'DISTINCT' ['BY' '(' sql_expression ( ',' sql_expression )* ')' ] ) | 'ALL' | ('TOP' sql_expression) | '%NOFPLAN' | '%NOLOCK' | '%NORUNTIME' | ('%PROFILE' ['ALL']) )*
Method SetQuantifier7RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..SetQuantifier8Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ( 'DISTINCT' ['BY' '(' sql_expression ( ',' sql_expression )* ')' ] ) | 'ALL' | ('TOP' sql_expression) | '%NOFPLAN' | '%NOLOCK' | '%NORUNTIME' | ('%PROFILE' ['ALL'])
Method SetQuantifier8Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|K|?1Rule?|P|P|P|?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  'DISTINCT' ['BY' '(' sql_expression ( ',' sql_expression )* ')' ]
/// summary values:DISTINCT
Method SetQuantifier9Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?4?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  sign ::= '+' | '-'
/// summary values:+,-
Method Sign(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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

///  signed_integer ::= [ sign ] unsigned_integer
Method SignedInteger(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..Sign(subElement,.addedElement) :1,1:1) {
		if ..UnsignedInteger(subElement,.addedElement)  {
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

///  simple_table ::= query_specification
Method SimpleTable(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..QuerySpecification(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  sql_case_expression ::= 'CASE' ( sql_case_expression1 | sql_case_expression2 ) ['ELSE' sql_expression ] 'END'
/// summary values:CASE
Method SqlCaseExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?&?4?&K
	; first rule summary K
	if '(..isKeywordInList($lb("CASE"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"CASE")  {
		if ..SqlCaseExpression157Sub(subElement,.addedElement)  {
			if ..SqlCaseExpression158OptGrp(subElement,.addedElement)  {
				if ..addKeyword(subElement,"END")  {
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

///  sql_case_expression1 ::= 'WHEN' sql_expression 'THEN' sql_expression ('WHEN' sql_expression 'THEN' sql_expression )*
/// summary values:WHEN
Method SqlCaseExpression1(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?&K&?1Rule?&(?4?)*
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
					if ..SqlCaseExpression1159RepZero(subElement,.addedElement)  {
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

///  ('WHEN' sql_expression 'THEN' sql_expression )*
Method SqlCaseExpression1159RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..SqlCaseExpression1160Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

/// 'WHEN' sql_expression 'THEN' sql_expression
/// summary values:WHEN
Method SqlCaseExpression1160Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?&K&?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  sql_case_expression1 | sql_case_expression2
Method SqlCaseExpression157Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SqlCaseExpression1(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlCaseExpression2(subElement,.addedElement)  {
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
/// summary values:ELSE
Method SqlCaseExpression158OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=1 /* failure rollsback but returns OK */
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  sql_case_expression2 ::= sql_expression ('WHEN' sql_expression 'THEN' sql_expression )*
Method SqlCaseExpression2(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SqlExpression(subElement,.addedElement)  {
		if ..SqlCaseExpression2161RepZero(subElement,.addedElement)  {
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

///  ('WHEN' sql_expression 'THEN' sql_expression )*
Method SqlCaseExpression2161RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..SqlCaseExpression2162Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

/// 'WHEN' sql_expression 'THEN' sql_expression
/// summary values:WHEN
Method SqlCaseExpression2162Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?&K&?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  sql_cos_variable ::= 'NEED COS VAR'
/// summary values:NEED COS VAR
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  sql_dyadicop ::= "+" | "-" | "\\" | "/" | "<>" | ">=" | ">" | "!>" | "<=" | "<" | "!<" | "=" | "!=" | "**" | "*" | "&&" | "&" | "]]" | "[" | "'[" | "!" | "||" | "_" | "#" | '\' | "AND" | "OR" | "NOT=" | "SIZE" | "ESCAPE" | sql_predicate | ("NOT" sql_predicate)
Method SqlDyadicop(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|K|K|P|K|K|?1Rule?|?1Rule?
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
	} elseif ..SqlDyadicop79Sub(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// "NOT" sql_predicate
/// summary values:NOT
Method SqlDyadicop79Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  sql_expression ::= sql_factor ( sql_dyadicop sql_factor )*
Method SqlExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SqlFactor(subElement,.addedElement)  {
		if ..SqlExpression77RepZero(subElement,.addedElement)  {
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

///  ( sql_dyadicop sql_factor )*
Method SqlExpression77RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..SqlExpression78Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  sql_dyadicop sql_factor
Method SqlExpression78Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  sql_factor ::= [ sql_monadicop ] sql_term
Method SqlFactor(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?&?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  sql_fn_function ::= '{' 'fn' sql_function '}'
/// summary values:{
Method SqlFnFunction(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&K&?1Rule?&P
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  sql_function ::= ('$' identifier '(' [ sql_expression ( ',' sql_expression)* ] ')') | ('%exact' sql_expression ) | ('count' '(' ['distinct' | 'all' ] ('*' | sql_expression) [ '%FOREACH' '(' col_list ')' ] ')' [ sql_window ] ) | ('min' '(' [ ( 'distinct' ['by' '(' col_list ')'] ) | 'all' ] ('*' | sql_expression) [ '%FOREACH' '(' col_list ')' ] ')' [ sql_window ] ) | ('max' '(' [ ( 'distinct' ['by' '(' col_list ')'] ) | 'all' ] ('*' | sql_expression) [ '%FOREACH' '(' col_list ')' ] ')' [ sql_window ] ) | ('sum' '(' [ ( 'distinct' ['by' '(' col_list ')'] ) | 'all' ] ('*' | sql_expression) [ '%FOREACH' '(' col_list ')' ] ')' [ sql_window ] ) | ('avg' '(' [ ( 'distinct' ['by' '(' col_list ')'] ) | 'all' ] ('*' | sql_expression) [ '%FOREACH' '(' col_list ')' ] ')' [ sql_window ] ) | ('cast' '(' sql_expression 'as' identifier ['(' sql_expression ( ',' sql_expression)* ')' ] ')' ) | ('exists' '(' subquery_specification ')' ) | ('list' '(' [ ( 'distinct' ['by' '(' col_list ')'] ) | 'all' ] ('*' | sql_expression) [ '%FOREACH' '(' col_list ')' ] ')') | ('%dlist' '(' [ ( 'distinct' ['by' '(' col_list ')'] ) | 'all' ] ('*' | sql_expression) [ '%FOREACH' '(' col_list ')' ] ')') | ('FOR' 'SOME' '%ELEMENT' '(' sql_expression ')' sql_expression ) | ('trim' '(' ['leading' | 'trailing' | 'both'] [(sql_expression 'from')] sql_expression ')' ) | ('dateadd' '(' sql_function_datepart_part ',' sql_expression ',' sql_expression ')' ) | ('datediff' '(' sql_function_datepart_part ',' sql_expression ',' sql_expression ')' ) | ('datename' '(' sql_function_datepart_part ',' sql_expression ')' ) | ('datepart' '(' sql_function_datepart_part ',' sql_expression ')' ) | (identifier '(' [ '*' | (sql_expression ( ',' sql_expression)*) ] ')' [ sql_window ] )
Method SqlFunction(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SqlFunction88Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlFunction92Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlFunction93Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlFunction97Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlFunction103Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlFunction109Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlFunction115Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlFunction121Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlFunction125Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlFunction126Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlFunction132Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlFunction138Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlFunction139Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlFunction142Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlFunction143Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlFunction144Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlFunction145Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlFunction146Sub(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
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
/// summary values:BY
Method SqlFunction100OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?&P
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=1 /* failure rollsback but returns OK */
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// '*' | sql_expression
Method SqlFunction101Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// 
/// summary values:%FOREACH
Method SqlFunction102OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&P&?1Rule?&P
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=1 /* failure rollsback but returns OK */
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// 'max' '(' [ ( 'distinct' ['by' '(' col_list ')'] ) | 'all' ] ('*' | sql_expression) [ '%FOREACH' '(' col_list ')' ] ')' [ sql_window ]
/// summary values:MAX
Method SqlFunction103Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?4?&?1Rule?&?4?&P&?4?
	; first rule summary K
	if '(..isKeywordInList($lb("MAX"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"MAX")  {
		if ..addPunctuation(subElement,"(")  {
			if ..SqlFunction104OptGrp(subElement,.addedElement)  {
				if ..SqlFunction107Sub(subElement,.addedElement)  {
					if ..SqlFunction108OptGrp(subElement,.addedElement)  {
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method SqlFunction104OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|K
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SqlFunction105Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"ALL")  {
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

///  'distinct' ['by' '(' col_list ')']
/// summary values:DISTINCT
Method SqlFunction105Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?4?
	; first rule summary K
	if '(..isKeywordInList($lb("DISTINCT"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"DISTINCT")  {
		if ..SqlFunction106OptGrp(subElement,.addedElement)  {
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
/// summary values:BY
Method SqlFunction106OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?&P
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=1 /* failure rollsback but returns OK */
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// '*' | sql_expression
Method SqlFunction107Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// 
/// summary values:%FOREACH
Method SqlFunction108OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&P&?1Rule?&P
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=1 /* failure rollsback but returns OK */
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// 'sum' '(' [ ( 'distinct' ['by' '(' col_list ')'] ) | 'all' ] ('*' | sql_expression) [ '%FOREACH' '(' col_list ')' ] ')' [ sql_window ]
/// summary values:SUM
Method SqlFunction109Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?4?&?1Rule?&?4?&P&?4?
	; first rule summary K
	if '(..isKeywordInList($lb("SUM"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"SUM")  {
		if ..addPunctuation(subElement,"(")  {
			if ..SqlFunction110OptGrp(subElement,.addedElement)  {
				if ..SqlFunction113Sub(subElement,.addedElement)  {
					if ..SqlFunction114OptGrp(subElement,.addedElement)  {
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method SqlFunction110OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|K
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SqlFunction111Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"ALL")  {
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

///  'distinct' ['by' '(' col_list ')']
/// summary values:DISTINCT
Method SqlFunction111Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?4?
	; first rule summary K
	if '(..isKeywordInList($lb("DISTINCT"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"DISTINCT")  {
		if ..SqlFunction112OptGrp(subElement,.addedElement)  {
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
/// summary values:BY
Method SqlFunction112OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?&P
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=1 /* failure rollsback but returns OK */
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// '*' | sql_expression
Method SqlFunction113Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// 
/// summary values:%FOREACH
Method SqlFunction114OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&P&?1Rule?&P
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=1 /* failure rollsback but returns OK */
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// 'avg' '(' [ ( 'distinct' ['by' '(' col_list ')'] ) | 'all' ] ('*' | sql_expression) [ '%FOREACH' '(' col_list ')' ] ')' [ sql_window ]
/// summary values:AVG
Method SqlFunction115Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?4?&?1Rule?&?4?&P&?4?
	; first rule summary K
	if '(..isKeywordInList($lb("AVG"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"AVG")  {
		if ..addPunctuation(subElement,"(")  {
			if ..SqlFunction116OptGrp(subElement,.addedElement)  {
				if ..SqlFunction119Sub(subElement,.addedElement)  {
					if ..SqlFunction120OptGrp(subElement,.addedElement)  {
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method SqlFunction116OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|K
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SqlFunction117Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"ALL")  {
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

///  'distinct' ['by' '(' col_list ')']
/// summary values:DISTINCT
Method SqlFunction117Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?4?
	; first rule summary K
	if '(..isKeywordInList($lb("DISTINCT"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"DISTINCT")  {
		if ..SqlFunction118OptGrp(subElement,.addedElement)  {
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
/// summary values:BY
Method SqlFunction118OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?&P
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=1 /* failure rollsback but returns OK */
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// '*' | sql_expression
Method SqlFunction119Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// 
/// summary values:%FOREACH
Method SqlFunction120OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&P&?1Rule?&P
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=1 /* failure rollsback but returns OK */
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// 'cast' '(' sql_expression 'as' identifier ['(' sql_expression ( ',' sql_expression)* ')' ] ')'
/// summary values:CAST
Method SqlFunction121Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?&K&?1Rule?&?4?&P
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
						if ..SqlFunction122OptGrp(subElement,.addedElement)  {
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
Method SqlFunction122OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&(?4?)*&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"(")  {
		if ..SqlExpression(subElement,.addedElement)  {
			if ..SqlFunction123RepZero(subElement,.addedElement)  {
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
		set ret=1 /* failure rollsback but returns OK */
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  ( ',' sql_expression)*
Method SqlFunction123RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..SqlFunction124Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' sql_expression
/// summary values:,
Method SqlFunction124Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// 'exists' '(' subquery_specification ')'
/// summary values:EXISTS
Method SqlFunction125Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?&P
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// 'list' '(' [ ( 'distinct' ['by' '(' col_list ')'] ) | 'all' ] ('*' | sql_expression) [ '%FOREACH' '(' col_list ')' ] ')'
/// summary values:LIST
Method SqlFunction126Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?4?&?1Rule?&?4?&P
	; first rule summary K
	if '(..isKeywordInList($lb("LIST"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"LIST")  {
		if ..addPunctuation(subElement,"(")  {
			if ..SqlFunction127OptGrp(subElement,.addedElement)  {
				if ..SqlFunction130Sub(subElement,.addedElement)  {
					if ..SqlFunction131OptGrp(subElement,.addedElement)  {
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method SqlFunction127OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|K
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SqlFunction128Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"ALL")  {
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

///  'distinct' ['by' '(' col_list ')']
/// summary values:DISTINCT
Method SqlFunction128Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?4?
	; first rule summary K
	if '(..isKeywordInList($lb("DISTINCT"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"DISTINCT")  {
		if ..SqlFunction129OptGrp(subElement,.addedElement)  {
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
/// summary values:BY
Method SqlFunction129OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?&P
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=1 /* failure rollsback but returns OK */
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// '*' | sql_expression
Method SqlFunction130Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// 
/// summary values:%FOREACH
Method SqlFunction131OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&P&?1Rule?&P
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=1 /* failure rollsback but returns OK */
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// '%dlist' '(' [ ( 'distinct' ['by' '(' col_list ')'] ) | 'all' ] ('*' | sql_expression) [ '%FOREACH' '(' col_list ')' ] ')'
/// summary values:%DLIST
Method SqlFunction132Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&P&?4?&?1Rule?&?4?&P
	; first rule summary P
	if '(..isStringSingle("%DLIST",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"%dlist")  {
		if ..addPunctuation(subElement,"(")  {
			if ..SqlFunction133OptGrp(subElement,.addedElement)  {
				if ..SqlFunction136Sub(subElement,.addedElement)  {
					if ..SqlFunction137OptGrp(subElement,.addedElement)  {
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method SqlFunction133OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|K
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SqlFunction134Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"ALL")  {
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

///  'distinct' ['by' '(' col_list ')']
/// summary values:DISTINCT
Method SqlFunction134Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?4?
	; first rule summary K
	if '(..isKeywordInList($lb("DISTINCT"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"DISTINCT")  {
		if ..SqlFunction135OptGrp(subElement,.addedElement)  {
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
/// summary values:BY
Method SqlFunction135OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?&P
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=1 /* failure rollsback but returns OK */
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// '*' | sql_expression
Method SqlFunction136Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// 
/// summary values:%FOREACH
Method SqlFunction137OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&P&?1Rule?&P
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=1 /* failure rollsback but returns OK */
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// 'FOR' 'SOME' '%ELEMENT' '(' sql_expression ')' sql_expression
/// summary values:FOR
Method SqlFunction138Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&K&P&P&?1Rule?&P&?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// 'trim' '(' ['leading' | 'trailing' | 'both'] [(sql_expression 'from')] sql_expression ')'
/// summary values:TRIM
Method SqlFunction139Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?4?&?4?&?1Rule?&P
	; first rule summary K
	if '(..isKeywordInList($lb("TRIM"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"TRIM")  {
		if ..addPunctuation(subElement,"(")  {
			if ..SqlFunction140OptGrp(subElement,.addedElement)  {
				if $S(..SqlFunction141Sub(subElement,.addedElement) :1,1:1) {
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// 
/// summary values:LEADING,TRAILING,BOTH
Method SqlFunction140OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K|K
	if '(..isKeywordInList($lb("LEADING","TRAILING","BOTH"),.value)) { quit 1 /* not found is OK */ }
	set subElement=ParentElement
	set done=0 ; method start
	s subElement=ParentElement
	if ..addKeyword(subElement,"LEADING")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"TRAILING")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"BOTH")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=1 /* failure rollsback but returns OK */
	}
	quit ret
}

/// sql_expression 'from'
Method SqlFunction141Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&K
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// 'dateadd' '(' sql_function_datepart_part ',' sql_expression ',' sql_expression ')'
/// summary values:DATEADD
Method SqlFunction142Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?&P&?1Rule?&P&?1Rule?&P
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// 'datediff' '(' sql_function_datepart_part ',' sql_expression ',' sql_expression ')'
/// summary values:DATEDIFF
Method SqlFunction143Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?&P&?1Rule?&P&?1Rule?&P
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// 'datename' '(' sql_function_datepart_part ',' sql_expression ')'
/// summary values:DATENAME
Method SqlFunction144Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?&P&?1Rule?&P
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// 'datepart' '(' sql_function_datepart_part ',' sql_expression ')'
/// summary values:DATEPART
Method SqlFunction145Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?&P&?1Rule?&P
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// identifier '(' [ '*' | (sql_expression ( ',' sql_expression)*) ] ')' [ sql_window ]
Method SqlFunction146Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&P&?4?&P&?4?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Identifier(subElement,.addedElement)  {
		if ..addPunctuation(subElement,"(")  {
			if ..SqlFunction147OptGrp(subElement,.addedElement)  {
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method SqlFunction147OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"*")  {
		set done=1 ; or
	} elseif ..SqlFunction148Sub(subElement,.addedElement)  {
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

/// sql_expression ( ',' sql_expression)*
Method SqlFunction148Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SqlExpression(subElement,.addedElement)  {
		if ..SqlFunction149RepZero(subElement,.addedElement)  {
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

///  ( ',' sql_expression)*
Method SqlFunction149RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..SqlFunction150Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' sql_expression
/// summary values:,
Method SqlFunction150Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// '$' identifier '(' [ sql_expression ( ',' sql_expression)* ] ')'
/// summary values:$
Method SqlFunction88Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&P&?4?&P
	; first rule summary P
	if '(..isStringSingle("$",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"$")  {
		if ..Identifier(subElement,.addedElement)  {
			if ..addPunctuation(subElement,"(")  {
				if ..SqlFunction89OptGrp(subElement,.addedElement)  {
					if ..addPunctuation(subElement,")")  {
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

Method SqlFunction89OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SqlExpression(subElement,.addedElement)  {
		if ..SqlFunction90RepZero(subElement,.addedElement)  {
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

///  ( ',' sql_expression)*
Method SqlFunction90RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..SqlFunction91Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' sql_expression
/// summary values:,
Method SqlFunction91Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// '%exact' sql_expression
/// summary values:%EXACT
Method SqlFunction92Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// 'count' '(' ['distinct' | 'all' ] ('*' | sql_expression) [ '%FOREACH' '(' col_list ')' ] ')' [ sql_window ]
/// summary values:COUNT
Method SqlFunction93Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?4?&?1Rule?&?4?&P&?4?
	; first rule summary K
	if '(..isKeywordInList($lb("COUNT"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"COUNT")  {
		if ..addPunctuation(subElement,"(")  {
			if ..SqlFunction94OptGrp(subElement,.addedElement)  {
				if ..SqlFunction95Sub(subElement,.addedElement)  {
					if ..SqlFunction96OptGrp(subElement,.addedElement)  {
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// 
/// summary values:DISTINCT,ALL
Method SqlFunction94OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K
	if '(..isKeywordInList($lb("DISTINCT","ALL"),.value)) { quit 1 /* not found is OK */ }
	set subElement=ParentElement
	set done=0 ; method start
	s subElement=ParentElement
	if ..addKeyword(subElement,"DISTINCT")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"ALL")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=1 /* failure rollsback but returns OK */
	}
	quit ret
}

/// '*' | sql_expression
Method SqlFunction95Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// 
/// summary values:%FOREACH
Method SqlFunction96OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&P&?1Rule?&P
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=1 /* failure rollsback but returns OK */
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// 'min' '(' [ ( 'distinct' ['by' '(' col_list ')'] ) | 'all' ] ('*' | sql_expression) [ '%FOREACH' '(' col_list ')' ] ')' [ sql_window ]
/// summary values:MIN
Method SqlFunction97Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?4?&?1Rule?&?4?&P&?4?
	; first rule summary K
	if '(..isKeywordInList($lb("MIN"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"MIN")  {
		if ..addPunctuation(subElement,"(")  {
			if ..SqlFunction98OptGrp(subElement,.addedElement)  {
				if ..SqlFunction101Sub(subElement,.addedElement)  {
					if ..SqlFunction102OptGrp(subElement,.addedElement)  {
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method SqlFunction98OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|K
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SqlFunction99Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"ALL")  {
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

///  'distinct' ['by' '(' col_list ')']
/// summary values:DISTINCT
Method SqlFunction99Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?4?
	; first rule summary K
	if '(..isKeywordInList($lb("DISTINCT"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"DISTINCT")  {
		if ..SqlFunction100OptGrp(subElement,.addedElement)  {
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

///  sql_function_datepart_part ::= sql_function_datepart_part_word | sql_string | colon_sql_cos_variable
Method SqlFunctionDatepartPart(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?|?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  sql_function_datepart_part_word ::= 'year' | 'yy' | 'yyyy' | 'quarter' | 'qq' | 'q' | 'month' | 'mm' | 'm' | 'week' | 'wk' | 'ww' | 'weekday' | 'dw' | 'w' | 'dayofyear' | 'dy' | 'y' | 'day' | 'dd' | 'd' | 'hour' | 'hh' | 'h' | 'minute' | 'mi' | 'n' | 'second' | 'ss' | 's' | 'millisecond' | 'ms' | 'sqltimestamp' | 'sts'
/// summary values:YEAR,YY,YYYY,QUARTER,QQ,Q,MONTH,MM,M,WEEK,WK,WW,WEEKDAY,DW,W,DAYOFYEAR,DY,Y,DAY,DD,D,HOUR,HH,H,MINUTE,MI,N,SECOND,SS,S,MILLISECOND,MS,SQLTIMESTAMP,STS
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  sql_monadicop ::= "+" | "-" | "NOT" | "%NOINDEX"
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  sql_number ::= 'NEED NUMBER'
/// summary values:NEED NUMBER
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  sql_predicate ::= "%STARTSWITH" | "BETWEEN" | "IS" | "IN" | "%INLIST" | "LIKE" | "%PATTERN" | "%MATCHES"
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  sql_primary ::= sql_number | sql_string | sql_case_expression | sql_fn_function | sql_function | colon_sql_cos_variable | stored_proc_call | column_reference | sql_special_variable | macrocall | ( '(' subquery_specification ')' ) | ( '(' sql_expression ( ',' sql_expression )* ')' )
Method SqlPrimary(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?
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
	} elseif ..SqlPrimary80Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlPrimary81Sub(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  '(' subquery_specification ')'
/// summary values:(
Method SqlPrimary80Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&P
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  '(' sql_expression ( ',' sql_expression )* ')'
/// summary values:(
Method SqlPrimary81Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&(?4?)*&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"(")  {
		if ..SqlExpression(subElement,.addedElement)  {
			if ..SqlPrimary82RepZero(subElement,.addedElement)  {
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

///  ( ',' sql_expression )*
Method SqlPrimary82RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..SqlPrimary83Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' sql_expression
/// summary values:,
Method SqlPrimary83Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  sql_program ::= query_specification | call_command | insert_command | update_command | declare_command | open_command | fetch_command | close_command | delete_command | CHECKPRIV_command
Method SqlProgram(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  sql_special_variable ::= 'NULL' | '?' | '$H' | '$ZNSPACE'
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  sql_string ::= 'NEED STRING'
/// summary values:NEED STRING
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  sql_term ::= sql_primary
Method SqlTerm(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SqlPrimary(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  sql_window ::= 'OVER' '(' [ sql_window_partition ] [ order_by_clause ] [ (sql_window_rows_between | sql_window_rows ) ] ')'
/// summary values:OVER
Method SqlWindow(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?4?&?4?&?4?&P
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
					if $S(..SqlWindow151Sub(subElement,.addedElement) :1,1:1) {
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// sql_window_rows_between | sql_window_rows
Method SqlWindow151Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SqlWindowRowsBetween(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlWindowRows(subElement,.addedElement)  {
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

///  sql_window_frame ::= ('UNBOUNDED' 'PRECEDING') | (sql_expression 'PRECEDING') | ('CURRENT' 'ROW') | ('UNBOUNDED' 'FOLLOWING') | (sql_expression 'FOLLOWING')
Method SqlWindowFrame(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SqlWindowFrame152Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlWindowFrame153Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlWindowFrame154Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlWindowFrame155Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlWindowFrame156Sub(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// 'UNBOUNDED' 'PRECEDING'
/// summary values:UNBOUNDED
Method SqlWindowFrame152Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// sql_expression 'PRECEDING'
Method SqlWindowFrame153Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&K
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// 'CURRENT' 'ROW'
/// summary values:CURRENT
Method SqlWindowFrame154Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// 'UNBOUNDED' 'FOLLOWING'
/// summary values:UNBOUNDED
Method SqlWindowFrame155Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// sql_expression 'FOLLOWING'
Method SqlWindowFrame156Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&K
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  sql_window_partition ::= 'PARTITION' 'BY' col_list
/// summary values:PARTITION
Method SqlWindowPartition(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&K&?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  sql_window_rows ::= 'ROWS' sql_window_frame
/// summary values:ROWS
Method SqlWindowRows(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  sql_window_rows_between ::= 'ROWS' 'BETWEEN' sql_window_frame 'AND' sql_window_frame
/// summary values:ROWS
Method SqlWindowRowsBetween(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&K&?1Rule?&K&?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  stored_proc_call ::= stored_proc_name stored_proc_parameter_list
Method StoredProcCall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  stored_proc_name ::= [ schema_name '.' ] qualified_identifier
Method StoredProcName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..StoredProcName175OptGrp(subElement,.addedElement)  {
		if ..QualifiedIdentifier(subElement,.addedElement)  {
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

Method StoredProcName175OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&P
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=1 /* failure rollsback but returns OK */
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  stored_proc_parameter ::= sql_expression
Method StoredProcParameter(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SqlExpression(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  stored_proc_parameter_list ::= '(' [ [stored_proc_parameter] ( ',' [stored_proc_parameter] )* ] ')'
/// summary values:(
Method StoredProcParameterList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?4?&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"(")  {
		if ..StoredProcParameterList172OptGrp(subElement,.addedElement)  {
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

Method StoredProcParameterList172OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..StoredProcParameter(subElement,.addedElement) :1,1:1) {
		if ..StoredProcParameterList173RepZero(subElement,.addedElement)  {
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

///  ( ',' [stored_proc_parameter] )*
Method StoredProcParameterList173RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..StoredProcParameterList174Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' [stored_proc_parameter]
/// summary values:,
Method StoredProcParameterList174Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?4?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  stored_proc_table ::= stored_proc_name stored_proc_parameter_list [ table_as_clause ]
Method StoredProcTable(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?1Rule?&?4?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  string_value_expression ::= character_value_expression
Method StringValueExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CharacterValueExpression(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  string_value_function ::= character_value_function
Method StringValueFunction(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CharacterValueFunction(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  subquery ::= '(' query_expression ')'
/// summary values:(
Method Subquery(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&P
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  subquery_specification ::= select_command ( union select_command )*
Method SubquerySpecification(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  ( union select_command )*
Method SubquerySpecification3RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..SubquerySpecification4Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  union select_command
Method SubquerySpecification4Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  table_as_clause ::= [ 'AS' ] alias_name
Method TableAsClause(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?&?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  table_expression ::= from_clause [ where_clause ] [ group_by_clause ] [ having_clause ] [ order_by_clause ]
Method TableExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?&?4?&?4?&?4?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  table_name ::= [ schema_name '.' ] qualified_identifier
Method TableName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?&?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method TableName47OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&P
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=1 /* failure rollsback but returns OK */
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  table_reference ::= stored_proc_table | direct_table | derived_table
Method TableReference(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?|?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  table_reference_noalias ::= direct_table_noalias | derived_table_noalias
Method TableReferenceNoalias(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  table_subquery ::= subquery
Method TableSubquery(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Subquery(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  term ::= factor | ( term '*' factor ) | ( term '/' factor )
Method Term(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Factor(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Term167Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Term168Sub(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  term '*' factor
Method Term167Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&P&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Term(subElement,.addedElement)  {
		if ..addPunctuation(subElement,"*")  {
			if ..Factor(subElement,.addedElement)  {
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

///  term '/' factor
Method Term168Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&P&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Term(subElement,.addedElement)  {
		if ..addPunctuation(subElement,"/")  {
			if ..Factor(subElement,.addedElement)  {
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

///  union ::= 'UNION' ('ALL' | '%PARALLEL')*
/// summary values:UNION
Method Union(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&(?4?)*
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  ('ALL' | '%PARALLEL')*
Method Union42RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..Union43Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

/// 'ALL' | '%PARALLEL'
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  unsigned_integer_ ::= ( '1' | '2' | '3' | '4' | '5' | '6' | '7' | '8' | '9' | '0')*
Method UnsignedInteger(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (?4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..UnsignedInteger186RepZero(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  ( '1' | '2' | '3' | '4' | '5' | '6' | '7' | '8' | '9' | '0')*
Method UnsignedInteger186RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..UnsignedInteger187Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  '1' | '2' | '3' | '4' | '5' | '6' | '7' | '8' | '9' | '0'
/// summary values:1,2,3,4,5,6,7,8,9,0
Method UnsignedInteger187Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|P|P|P|P|P|P|P|P|P
	if '(..isStringInList($lb("1","2","3","4","5","6","7","8","9","0"),1,.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	s subElement=ParentElement
	if ..addPunctuation(subElement,"1")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"2")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"3")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"4")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"5")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"6")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"7")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"8")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"9")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"0")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  unsigned_literal ::= unsigned_numeric_literal | general_literal
Method UnsignedLiteral(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..UnsignedNumericLiteral(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..GeneralLiteral(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  unsigned_numeric_literal ::= exact_numeric_literal | approximate_numeric_literal
Method UnsignedNumericLiteral(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ExactNumericLiteral(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ApproximateNumericLiteral(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  unsigned_value_specification ::= unsigned_literal | general_value_specification
Method UnsignedValueSpecification(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..UnsignedLiteral(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..GeneralValueSpecification(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  update_columns ::= '(' column_name ( ',' column_name)* ')'
/// summary values:(
Method UpdateColumns(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&(?4?)*&P
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  ( ',' column_name)*
Method UpdateColumns61RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..UpdateColumns62Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' column_name
/// summary values:,
Method UpdateColumns62Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  update_command ::= 'UPDATE' (update_keyword)* direct_table ( ('SET' update_set (',' update_set)* ) | ( update_columns (('VALUES' update_values) | select_command) ) ) [where_clause]
/// summary values:UPDATE
Method UpdateCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&(?4?)*&?1Rule?&?1Rule?&?4?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  (update_keyword)*
Method UpdateCommand52RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..UpdateCommand53Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

/// update_keyword
Method UpdateCommand53Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..UpdateKeyword(subElement,.addedElement)  {
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

///  ('SET' update_set (',' update_set)* ) | ( update_columns (('VALUES' update_values) | select_command) )
Method UpdateCommand54Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// 'SET' update_set (',' update_set)*
/// summary values:SET
Method UpdateCommand55Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?&(?4?)*
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  (',' update_set)*
Method UpdateCommand56RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..UpdateCommand57Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

/// ',' update_set
/// summary values:,
Method UpdateCommand57Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  update_columns (('VALUES' update_values) | select_command)
Method UpdateCommand58Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// ('VALUES' update_values) | select_command
Method UpdateCommand59Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// 'VALUES' update_values
/// summary values:VALUES
Method UpdateCommand60Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  update_keyword ::= '%NOCHECK' | '%NOFPLAN' | '%NOINDEX' | '%NOJOURN' | '%NOLOCK' | '%NOTRIGGER' | '%PROFILE_ALL' | '%PROFILE_ALL'
/// summary values:%NOCHECK,%NOFPLAN,%NOINDEX,%NOJOURN,%NOLOCK,%NOTRIGGER,%PROFILE_ALL,%PROFILE_ALL
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  update_set ::= column_reference '=' sql_expression
Method UpdateSet(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&P&?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  update_values ::= '(' sql_expression ( ',' sql_expression )* ')'
/// summary values:(
Method UpdateValues(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&(?4?)*&P
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  ( ',' sql_expression )*
Method UpdateValues63RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..UpdateValues64Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  ',' sql_expression
/// summary values:,
Method UpdateValues64Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  value_expression ::= numeric_value_expression | string_value_expression
Method ValueExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..NumericValueExpression(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StringValueExpression(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  value_expression_primary ::= number | column_reference
Method ValueExpressionPrimary(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Number(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ColumnReference(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  where_clause ::= 'WHERE' sql_expression
/// summary values:WHERE
Method WhereClause(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  with_clause ::= alias_name 'AS' '(' select_command ')'
Method WithClause(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&K&P&?1Rule?&P
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  with_command ::= 'WITH' with_clause (',' with_clause)*
/// summary values:WITH
Method WithCommand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?&(?4?)*
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  (',' with_clause)*
Method WithCommand5RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..WithCommand6Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

/// ',' with_clause
/// summary values:,
Method WithCommand6Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  with_name ::= identifier
Method WithName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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

Method newElement(Type As %String) As PXW.DEV.BNF.Elements.SQL
{
	quit ##class(PXW.DEV.BNF.Elements.SQL).%New(Type)
}

}
