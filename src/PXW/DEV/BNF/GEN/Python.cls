/// Created: 2025-11-26 18:09:29 PXW.DEV.BNF.Compilers.Compiler2
Class PXW.DEV.BNF.GEN.Python Extends PXW.DEV.BNF.super [ ProcedureBlock ]
{

Parameter KeywordPattern = "1A.AN";

Parameter Keywords = "AND,AS,ASSERT,ASYNC,AWAIT,BREAK,CLASS,CONTINUE,DEF,DEL,ELIF,ELSE,EXCEPT,FALSE,FINALLY,FOR,FROM,GLOBAL,IF,IMPORT,IN,IS,LAMBDA,NONE,NONLOCAL,NOT,OR,PASS,RAISE,RETURN,TRUE,TRY,WHILE,WITH,YIELD";

///  annotated_rhs: yield_expr | star_expressions
/// summary=C&?4punctuation:4?
Method AnnotatedRhs(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..YieldExpr(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..StarExpressions(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  annotation: ':' expression
/// summary=P&C
Method Annotation(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..addPunctuation(subElement,":")  && ..Expression(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  args: | ','.(starred_expression | ( assignment_expression | expression !':=') !'=')+ [',' kwargs ] | kwargs
/// summary=?4punctuation:4?&?4punctuation:4?
Method Args(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..Args323Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..Kwargs(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&?4RepeatSep4?&[P&C]
Method Args323Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Args324RepSep(subElement,.addedElement)  && ..Args337OptGrp(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  ','.(starred_expression | ( assignment_expression | expression !':=') !'=')+
Method Args324RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set done=0 ; must be at least 1
	if ..Args325Sub(subElement,.addedElement) {
		set done=1,ok=1 ; found 1
		do {
			$$$BNFSTART(repElement)
			set ok=(..addPunctuation(repElement,",")  && ..Args331Sub(repElement,.addedElement) )
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
		set ok=0 ; normal rollback
	}
	quit ok
}

/// starred_expression | ( assignment_expression | expression !':=') !'='
/// summary=C&?4punctuation:4?
Method Args325Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..StarredExpression(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Args326Or(subElement,.addedElement)  {
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

/// 
/// summary=&(C&?4punctuation:4?)&?4NotRule4?
Method Args326Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Args327Sub(subElement,.addedElement)  && ..Args330Not(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  assignment_expression | expression !':='
/// summary=C&?4punctuation:4?
Method Args327Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..AssignmentExpression(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Args328Or(subElement,.addedElement)  {
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

/// 
/// summary=&C&?4NotRule4?
Method Args328Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(subElement,.addedElement)  && ..Args329Not(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// ':='
Method Args329Not(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,":=")  { set done=1 }
	$$$BNFROLLBACK(subElement)
	if done {
		set ok=0
	} else {
		set ok=1
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// '='
Method Args330Not(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"=")  { set done=1 }
	$$$BNFROLLBACK(subElement)
	if done {
		set ok=0
	} else {
		set ok=1
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// starred_expression | ( assignment_expression | expression !':=') !'='
/// summary=C&?4punctuation:4?
Method Args331Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..StarredExpression(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Args332Or(subElement,.addedElement)  {
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

/// 
/// summary=&(C&?4punctuation:4?)&?4NotRule4?
Method Args332Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Args333Sub(subElement,.addedElement)  && ..Args336Not(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  assignment_expression | expression !':='
/// summary=C&?4punctuation:4?
Method Args333Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..AssignmentExpression(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Args334Or(subElement,.addedElement)  {
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

/// 
/// summary=&C&?4NotRule4?
Method Args334Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(subElement,.addedElement)  && ..Args335Not(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// ':='
Method Args335Not(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,":=")  { set done=1 }
	$$$BNFROLLBACK(subElement)
	if done {
		set ok=0
	} else {
		set ok=1
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// '='
Method Args336Not(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"=")  { set done=1 }
	$$$BNFROLLBACK(subElement)
	if done {
		set ok=0
	} else {
		set ok=1
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=P&C
Method Args337OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  && ..Kwargs(subElement,.addedElement)  {
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

///  arguments: | args [','] &')'
/// summary=?4punctuation:4?
Method Arguments(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..Arguments321Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&C&[P]&?4LookAhead4?
Method Arguments321Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Args(subElement,.addedElement)  && $S(..addPunctuation(subElement,",") :1,1:1) && ..Arguments322Peek(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  &')'
Method Arguments322Peek(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; ruleE=LookAheadRule :')'
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,")")  {
		set done=1
	}
	if done {
		set ok=1
		$$$BNFROLLBACK(subElement)
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  as_pattern: | or_pattern 'as' pattern_capture_target
/// summary=?4punctuation:4?
Method AsPattern(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..AsPattern134Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&C&K&C
Method AsPattern134Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..OrPattern(subElement,.addedElement)  && ..addKeyword(subElement,"AS")  && ..PatternCaptureTarget(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  assert_stmt: 'assert' expression [',' expression ]
/// summary=K&C&[P&C]
Method AssertStmt(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"ASSERT")  && ..Expression(subElement,.addedElement)  && ..AssertStmt29OptGrp(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=P&C
Method AssertStmt29OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  && ..Expression(subElement,.addedElement)  {
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

///  assignment: | NAME ':' expression ['=' annotated_rhs ] | ('(' single_target ')' | single_subscript_attribute_target) ':' expression ['=' annotated_rhs ] | (star_targets '=' )+ (yield_expr | star_expressions) !'=' [TYPE_COMMENT] | single_target augassign ~ (yield_expr | star_expressions)
/// summary=?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?
Method Assignment(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..Assignment9Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..Assignment11Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..Assignment14Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..Assignment19Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=P&C
Method Assignment10OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"=")  && ..AnnotatedRhs(subElement,.addedElement)  {
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

/// 
/// summary=&(P&C&P&?4punctuation:4?)&P&C&[P&C]
Method Assignment11Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Assignment12Sub(subElement,.addedElement)  && ..addPunctuation(subElement,":")  && ..Expression(subElement,.addedElement)  && ..Assignment13OptGrp(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

/// '(' single_target ')' | single_subscript_attribute_target
/// summary=P&C&P&?4punctuation:4?
Method Assignment12Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"(")  && ..SingleTarget(subElement,.addedElement)  && ..addPunctuation(subElement,")")  {
		set done=1 ; or
	} elseif ..SingleSubscriptAttributeTarget(subElement,.addedElement)  {
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

/// 
/// summary=P&C
Method Assignment13OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"=")  && ..AnnotatedRhs(subElement,.addedElement)  {
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

/// 
/// summary=&(?4punctuation:4?)+&(C&?4punctuation:4?)&?4NotRule4?&[C]
Method Assignment14Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Assignment15RepOne(subElement,.addedElement)  && ..Assignment17Sub(subElement,.addedElement)  && ..Assignment18Not(subElement,.addedElement)  && $S(..TypeComment(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  (star_targets '=' )+
Method Assignment15RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..Assignment16Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

/// star_targets '='
/// summary=C&P
Method Assignment16Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..StarTargets(subElement,.addedElement)  && ..addPunctuation(subElement,"=")  {
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

/// yield_expr | star_expressions
/// summary=C&?4punctuation:4?
Method Assignment17Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..YieldExpr(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StarExpressions(subElement,.addedElement)  {
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

/// '='
Method Assignment18Not(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"=")  { set done=1 }
	$$$BNFROLLBACK(subElement)
	if done {
		set ok=0
	} else {
		set ok=1
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&C&C&?4Force4?&(C&?4punctuation:4?)
Method Assignment19Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..SingleTarget(subElement,.addedElement)  && ..Augassign(subElement,.addedElement)  && 1 /* force means? */ && ..Assignment20Sub(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

/// yield_expr | star_expressions
/// summary=C&?4punctuation:4?
Method Assignment20Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..YieldExpr(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StarExpressions(subElement,.addedElement)  {
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

/// 
/// summary=&C&P&C&[P&C]
Method Assignment9Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Name(subElement,.addedElement)  && ..addPunctuation(subElement,":")  && ..Expression(subElement,.addedElement)  && ..Assignment10OptGrp(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  assignment_expression: | NAME ':=' ~ expression
/// summary=?4punctuation:4?
Method AssignmentExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..AssignmentExpression197Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&C&P&?4Force4?&C
Method AssignmentExpression197Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Name(subElement,.addedElement)  && ..addPunctuation(subElement,":=")  && 1 /* force means? */ && ..Expression(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  ASYNC : 'async'
/// summary=K
Method Async(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"ASYNC")  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  atom: | NAME | 'True' | 'False' | 'None' | strings | NUMBER | (tuple | group | genexp) | (list | listcomp) | (dict | set | dictcomp | setcomp) | '...'
/// summary=?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?
Method Atom(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..Name(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..addKeyword(subElement,"TRUE")  {
			set done=1 ; or
		} elseif ..addKeyword(subElement,"FALSE")  {
			set done=1 ; or
		} elseif ..addKeyword(subElement,"NONE")  {
			set done=1 ; or
		} elseif ..Strings(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..Number(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..Atom249Sub(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..Atom250Sub(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..Atom251Sub(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..addPunctuation(subElement,"...")  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// tuple | group | genexp
/// summary=C&?4punctuation:4?&?4punctuation:4?
Method Atom249Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Tuple(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Group(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Genexp(subElement,.addedElement)  {
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

/// list | listcomp
/// summary=C&?4punctuation:4?
Method Atom250Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..List(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Listcomp(subElement,.addedElement)  {
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

/// dict | set | dictcomp | setcomp
/// summary=C&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?
Method Atom251Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Dict(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Set(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Dictcomp(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Setcomp(subElement,.addedElement)  {
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

///  attr: | name_or_attr '.' NAME
/// summary=?4punctuation:4?
Method Attr(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..Attr153Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&C&P&C
Method Attr153Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..NameOrAttr(subElement,.addedElement)  && ..addPunctuation(subElement,".")  && ..Name(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  augassign: | '+=' | '-=' | '*=' | '@=' | '/=' | '%=' | '&=' | '|=' | '^=' | '<<=' | '>>=' | '**=' | '//='
/// summary=?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?
Method Augassign(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..addPunctuation(subElement,"+=")  {
			set done=1 ; or
		} elseif ..addPunctuation(subElement,"-=")  {
			set done=1 ; or
		} elseif ..addPunctuation(subElement,"*=")  {
			set done=1 ; or
		} elseif ..addPunctuation(subElement,"@=")  {
			set done=1 ; or
		} elseif ..addPunctuation(subElement,"/=")  {
			set done=1 ; or
		} elseif ..addPunctuation(subElement,"%=")  {
			set done=1 ; or
		} elseif ..addPunctuation(subElement,"&=")  {
			set done=1 ; or
		} elseif ..addPunctuation(subElement,"|=")  {
			set done=1 ; or
		} elseif ..addPunctuation(subElement,"^=")  {
			set done=1 ; or
		} elseif ..addPunctuation(subElement,"<<=")  {
			set done=1 ; or
		} elseif ..addPunctuation(subElement,">>=")  {
			set done=1 ; or
		} elseif ..addPunctuation(subElement,"**=")  {
			set done=1 ; or
		} elseif ..addPunctuation(subElement,"//=")  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  AWAIT : 'await'
/// summary=K
Method Await(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"AWAIT")  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  await_primary: | 'await' primary | primary
/// summary=?4punctuation:4?&?4punctuation:4?
Method AwaitPrimary(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..AwaitPrimary235Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..Primary(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&K&C
Method AwaitPrimary235Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"AWAIT")  && ..Primary(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  bitwise_and: | bitwise_and '&' shift_expr | shift_expr
Method BitwiseAnd(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	set done=0,ok=1,pos=..stream.pos,lastpos=pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set ok=($isobject(subElement))
		if ok $$$BNFCOMMITCOPY(subElement,ParentElement)
		quit ok
	}
	$$$BNFMEMOSET(pos,"")
	do ..getBookmark(.bm)
	while ok {
		$$$BNFSTART(subElement)
		do ..gotoBookmark(.bm)
		set rec=..BitwiseAnd216Recurse(subElement,.addedElement)
		if rec,..stream.pos>lastpos {
			$$$BNFMEMOSET(pos,addedElement)
			set done=1,lastpos=..stream.pos
		} else {
			set ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best 
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 1
		set ok=1
	} else {
		if $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=?4punctuation:4?&?4punctuation:4?
Method BitwiseAnd216Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..BitwiseAnd217Or(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ShiftExpr(subElement,.addedElement)  {
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

/// 
/// summary=&C&P&C
Method BitwiseAnd217Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..BitwiseAnd(subElement,.addedElement)  && ..addPunctuation(subElement,"&")  && ..ShiftExpr(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  bitwise_or: | bitwise_or '|' bitwise_xor | bitwise_xor
Method BitwiseOr(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	set done=0,ok=1,pos=..stream.pos,lastpos=pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set ok=($isobject(subElement))
		if ok $$$BNFCOMMITCOPY(subElement,ParentElement)
		quit ok
	}
	$$$BNFMEMOSET(pos,"")
	do ..getBookmark(.bm)
	while ok {
		$$$BNFSTART(subElement)
		do ..gotoBookmark(.bm)
		set rec=..BitwiseOr212Recurse(subElement,.addedElement)
		if rec,..stream.pos>lastpos {
			$$$BNFMEMOSET(pos,addedElement)
			set done=1,lastpos=..stream.pos
		} else {
			set ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best 
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 1
		set ok=1
	} else {
		if $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=?4punctuation:4?&?4punctuation:4?
Method BitwiseOr212Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..BitwiseOr213Or(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..BitwiseXor(subElement,.addedElement)  {
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

/// 
/// summary=&C&P&C
Method BitwiseOr213Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..BitwiseOr(subElement,.addedElement)  && ..addPunctuation(subElement,"|")  && ..BitwiseXor(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  bitwise_xor: | bitwise_xor '^' bitwise_and | bitwise_and
Method BitwiseXor(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	set done=0,ok=1,pos=..stream.pos,lastpos=pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set ok=($isobject(subElement))
		if ok $$$BNFCOMMITCOPY(subElement,ParentElement)
		quit ok
	}
	$$$BNFMEMOSET(pos,"")
	do ..getBookmark(.bm)
	while ok {
		$$$BNFSTART(subElement)
		do ..gotoBookmark(.bm)
		set rec=..BitwiseXor214Recurse(subElement,.addedElement)
		if rec,..stream.pos>lastpos {
			$$$BNFMEMOSET(pos,addedElement)
			set done=1,lastpos=..stream.pos
		} else {
			set ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best 
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 1
		set ok=1
	} else {
		if $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=?4punctuation:4?&?4punctuation:4?
Method BitwiseXor214Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..BitwiseXor215Or(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..BitwiseAnd(subElement,.addedElement)  {
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

/// 
/// summary=&C&P&C
Method BitwiseXor215Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..BitwiseXor(subElement,.addedElement)  && ..addPunctuation(subElement,"^")  && ..BitwiseAnd(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  block: | NEWLINE INDENT statements DEDENT | simple_stmts
/// summary=?4punctuation:4?&?4punctuation:4?
Method Block(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..Block47Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..SimpleStmts(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&C&C&C&C
Method Block47Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Newline(subElement,.addedElement)  && ..Indent(subElement,.addedElement)  && ..Statements(subElement,.addedElement)  && ..Dedent(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  capture_pattern: | pattern_capture_target
/// summary=?4punctuation:4?
Method CapturePattern(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..PatternCaptureTarget(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  case_block: | "case" patterns guard? ':' block
/// summary=?4punctuation:4?
Method CaseBlock(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..CaseBlock133Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&K&C&?4OptionalSingle4?&P&C
Method CaseBlock133Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"CASE")  && ..Patterns(subElement,.addedElement)  && $s(..Guard(subElement,.addedElement) :1,1:1)  && ..addPunctuation(subElement,":")  && ..Block(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  class_def: | decorators class_def_raw | class_def_raw
/// summary=?4punctuation:4?&?4punctuation:4?
Method ClassDef(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..ClassDef50Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..ClassDefRaw(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&C&C
Method ClassDef50Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Decorators(subElement,.addedElement)  && ..ClassDefRaw(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  class_def_raw: | 'class' NAME [type_params] ['(' [arguments] ')' ] ':' block
/// summary=?4punctuation:4?
Method ClassDefRaw(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..ClassDefRaw51Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&K&C&[C]&[P&[C]&P]&P&C
Method ClassDefRaw51Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"CLASS")  && ..Name(subElement,.addedElement)  && $S(..TypeParams(subElement,.addedElement) :1,1:1) && ..ClassDefRaw52OptGrp(subElement,.addedElement)  && ..addPunctuation(subElement,":")  && ..Block(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

/// 
/// summary=P&[C]&P
Method ClassDefRaw52OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"(")  && $S(..Arguments(subElement,.addedElement) :1,1:1) && ..addPunctuation(subElement,")")  {
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

///  class_pattern: | name_or_attr '(' ')' | name_or_attr '(' positional_patterns ','? ')' | name_or_attr '(' keyword_patterns ','? ')' | name_or_attr '(' positional_patterns ',' keyword_patterns ','? ')'
/// summary=?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?
Method ClassPattern(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..ClassPattern170Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..ClassPattern171Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..ClassPattern172Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..ClassPattern173Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&C&P&P
Method ClassPattern170Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..NameOrAttr(subElement,.addedElement)  && ..addPunctuation(subElement,"(")  && ..addPunctuation(subElement,")")  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

/// 
/// summary=&C&P&C&?4OptionalSingle4?&P
Method ClassPattern171Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..NameOrAttr(subElement,.addedElement)  && ..addPunctuation(subElement,"(")  && ..PositionalPatterns(subElement,.addedElement)  && $s(..addPunctuation(subElement,",") :1,1:1)  && ..addPunctuation(subElement,")")  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

/// 
/// summary=&C&P&C&?4OptionalSingle4?&P
Method ClassPattern172Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..NameOrAttr(subElement,.addedElement)  && ..addPunctuation(subElement,"(")  && ..KeywordPatterns(subElement,.addedElement)  && $s(..addPunctuation(subElement,",") :1,1:1)  && ..addPunctuation(subElement,")")  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

/// 
/// summary=&C&P&C&P&C&?4OptionalSingle4?&P
Method ClassPattern173Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..NameOrAttr(subElement,.addedElement)  && ..addPunctuation(subElement,"(")  && ..PositionalPatterns(subElement,.addedElement)  && ..addPunctuation(subElement,",")  && ..KeywordPatterns(subElement,.addedElement)  && $s(..addPunctuation(subElement,",") :1,1:1)  && ..addPunctuation(subElement,")")  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  closed_pattern: | literal_pattern | capture_pattern | wildcard_pattern | value_pattern | group_pattern | sequence_pattern | mapping_pattern | class_pattern
/// summary=?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?
Method ClosedPattern(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..LiteralPattern(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..CapturePattern(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..WildcardPattern(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..ValuePattern(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..GroupPattern(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..SequencePattern(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..MappingPattern(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..ClassPattern(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  compare_op_bitwise_or_pair: | eq_bitwise_or | noteq_bitwise_or | lte_bitwise_or | lt_bitwise_or | gte_bitwise_or | gt_bitwise_or | notin_bitwise_or | in_bitwise_or | isnot_bitwise_or | is_bitwise_or
/// summary=?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?
Method CompareOpBitwiseOrPair(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..EqBitwiseOr(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..NoteqBitwiseOr(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..LteBitwiseOr(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..LtBitwiseOr(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..GteBitwiseOr(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..GtBitwiseOr(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..NotinBitwiseOr(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..InBitwiseOr(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..IsnotBitwiseOr(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..IsBitwiseOr(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  comparison: | bitwise_or compare_op_bitwise_or_pair+ | bitwise_or
/// summary=?4punctuation:4?&?4punctuation:4?
Method Comparison(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..Comparison208Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..BitwiseOr(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&C&(?4Call:4?)+
Method Comparison208Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..BitwiseOr(subElement,.addedElement)  && ..Comparison209RepOne(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  compare_op_bitwise_or_pair+
Method Comparison209RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..CompareOpBitwiseOrPair(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  complex_number: | signed_real_number '+' imaginary_number | signed_real_number '-' imaginary_number
/// summary=?4punctuation:4?&?4punctuation:4?
Method ComplexNumber(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..ComplexNumber142Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..ComplexNumber143Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&C&P&C
Method ComplexNumber142Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..SignedRealNumber(subElement,.addedElement)  && ..addPunctuation(subElement,"+")  && ..ImaginaryNumber(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

/// 
/// summary=&C&P&C
Method ComplexNumber143Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..SignedRealNumber(subElement,.addedElement)  && ..addPunctuation(subElement,"-")  && ..ImaginaryNumber(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  compound_stmt: | function_def | if_stmt | class_def | with_stmt | for_stmt | try_stmt | while_stmt | match_stmt
/// summary=?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?
Method CompoundStmt(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..FunctionDef(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..IfStmt(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..ClassDef(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..WithStmt(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..ForStmt(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..TryStmt(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..WhileStmt(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..MatchStmt(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  conjunction: | inversion ('and' inversion )+ | inversion
/// summary=?4punctuation:4?&?4punctuation:4?
Method Conjunction(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..Conjunction203Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..Inversion(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&C&(?4punctuation:4?)+
Method Conjunction203Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Inversion(subElement,.addedElement)  && ..Conjunction204RepOne(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  ('and' inversion )+
Method Conjunction204RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..Conjunction205Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

/// 'and' inversion
/// summary=K&C
Method Conjunction205Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"AND")  && ..Inversion(subElement,.addedElement)  {
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

///  decorators: ('@' named_expression NEWLINE )+
/// summary=(?4punctuation:4?)+
Method Decorators(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..Decorators48RepOne(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ('@' named_expression NEWLINE )+
Method Decorators48RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..Decorators49Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

/// '@' named_expression NEWLINE
/// summary=P&C&C
Method Decorators49Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"@")  && ..NamedExpression(subElement,.addedElement)  && ..Newline(subElement,.addedElement)  {
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

///  DEDENT : 'code dedent'
/// summary=P
Method Dedent(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..addPunctuation(subElement,"code dedent")  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  default: '=' expression | invalid_default
/// summary=P&C&?4punctuation:4?
Method Default(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..addPunctuation(subElement,"=")  && ..Expression(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..InvalidDefault(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  del_stmt: | 'del' del_targets &(';' | NEWLINE)
/// summary=?4punctuation:4?
Method DelStmt(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..DelStmt26Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&K&C&?4LookAhead4?
Method DelStmt26Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"DEL")  && ..DelTargets(subElement,.addedElement)  && ..DelStmt27Peek(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  &(';' | NEWLINE)
Method DelStmt27Peek(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; ruleE=LookAheadRule :(';' | NEWLINE)
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..DelStmt28Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
		$$$BNFROLLBACK(subElement)
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// ';' | NEWLINE
/// summary=P&?4punctuation:4?
Method DelStmt28Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,";")  {
		set done=1 ; or
	} elseif ..Newline(subElement,.addedElement)  {
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

///  del_t_atom: | NAME | '(' del_target ')' | '(' [del_targets] ')' | '[' [del_targets] ']'
/// summary=?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?
Method DelTAtom(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..Name(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..DelTAtom389Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..DelTAtom390Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..DelTAtom391Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&P&C&P
Method DelTAtom389Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"(")  && ..DelTarget(subElement,.addedElement)  && ..addPunctuation(subElement,")")  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

/// 
/// summary=&P&[C]&P
Method DelTAtom390Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"(")  && $S(..DelTargets(subElement,.addedElement) :1,1:1) && ..addPunctuation(subElement,")")  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

/// 
/// summary=&P&[C]&P
Method DelTAtom391Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"[")  && $S(..DelTargets(subElement,.addedElement) :1,1:1) && ..addPunctuation(subElement,"]")  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  del_target: | t_primary '.' NAME !t_lookahead | t_primary '[' slices ']' !t_lookahead | del_t_atom
/// summary=?4punctuation:4?&?4punctuation:4?&?4punctuation:4?
Method DelTarget(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..DelTarget385Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..DelTarget387Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..DelTAtom(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&C&P&C&?4NotRule4?
Method DelTarget385Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..TPrimary(subElement,.addedElement)  && ..addPunctuation(subElement,".")  && ..Name(subElement,.addedElement)  && ..DelTarget386Not(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

/// t_lookahead
Method DelTarget386Not(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..TLookahead(subElement,.addedElement)  { set done=1 }
	$$$BNFROLLBACK(subElement)
	if done {
		set ok=0
	} else {
		set ok=1
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&C&P&C&P&?4NotRule4?
Method DelTarget387Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..TPrimary(subElement,.addedElement)  && ..addPunctuation(subElement,"[")  && ..Slices(subElement,.addedElement)  && ..addPunctuation(subElement,"]")  && ..DelTarget388Not(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

/// t_lookahead
Method DelTarget388Not(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..TLookahead(subElement,.addedElement)  { set done=1 }
	$$$BNFROLLBACK(subElement)
	if done {
		set ok=0
	} else {
		set ok=1
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  del_targets: ','.del_target+ [',']
/// summary=?4RepeatSep4?&[P]
Method DelTargets(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..DelTargets384RepSep(subElement,.addedElement)  && $S(..addPunctuation(subElement,",") :1,1:1) {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ','.del_target+
Method DelTargets384RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set done=0 ; must be at least 1
	if ..DelTarget(subElement,.addedElement) {
		set done=1,ok=1 ; found 1
		do {
			$$$BNFSTART(repElement)
			set ok=(..addPunctuation(repElement,",")  && ..DelTarget(repElement,.addedElement) )
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
		set ok=0 ; normal rollback
	}
	quit ok
}

///  dict: | '{' [double_starred_kvpairs] '}'
/// summary=?4punctuation:4?
Method Dict(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..Dict304Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&P&[C]&P
Method Dict304Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"{")  && $S(..DoubleStarredKvpairs(subElement,.addedElement) :1,1:1) && ..addPunctuation(subElement,"}")  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  dictcomp: | '{' kvpair for_if_clauses '}'
/// summary=?4punctuation:4?
Method Dictcomp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..Dictcomp320Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&P&C&C&P
Method Dictcomp320Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"{")  && ..Kvpair(subElement,.addedElement)  && ..ForIfClauses(subElement,.addedElement)  && ..addPunctuation(subElement,"}")  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  disjunction: | conjunction ('or' conjunction )+ | conjunction
/// summary=?4punctuation:4?&?4punctuation:4?
Method Disjunction(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..Disjunction200Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..Conjunction(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&C&(?4punctuation:4?)+
Method Disjunction200Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Conjunction(subElement,.addedElement)  && ..Disjunction201RepOne(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  ('or' conjunction )+
Method Disjunction201RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..Disjunction202Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

/// 'or' conjunction
/// summary=K&C
Method Disjunction202Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"OR")  && ..Conjunction(subElement,.addedElement)  {
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

///  dotted_as_name: | dotted_name ['as' NAME ]
/// summary=?4punctuation:4?
Method DottedAsName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..DottedAsName43Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&C&[K&C]
Method DottedAsName43Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..DottedName(subElement,.addedElement)  && ..DottedAsName44OptGrp(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

/// 
/// summary=K&C
Method DottedAsName44OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"AS")  && ..Name(subElement,.addedElement)  {
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

///  dotted_as_names: | ','.dotted_as_name+
/// summary=?4punctuation:4?
Method DottedAsNames(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..DottedAsNames42RepSep(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ','.dotted_as_name+
Method DottedAsNames42RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set done=0 ; must be at least 1
	if ..DottedAsName(subElement,.addedElement) {
		set done=1,ok=1 ; found 1
		do {
			$$$BNFSTART(repElement)
			set ok=(..addPunctuation(repElement,",")  && ..DottedAsName(repElement,.addedElement) )
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
		set ok=0 ; normal rollback
	}
	quit ok
}

///  dotted_name: | dotted_name '.' NAME | NAME
Method DottedName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	set done=0,ok=1,pos=..stream.pos,lastpos=pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set ok=($isobject(subElement))
		if ok $$$BNFCOMMITCOPY(subElement,ParentElement)
		quit ok
	}
	$$$BNFMEMOSET(pos,"")
	do ..getBookmark(.bm)
	while ok {
		$$$BNFSTART(subElement)
		do ..gotoBookmark(.bm)
		set rec=..DottedName45Recurse(subElement,.addedElement)
		if rec,..stream.pos>lastpos {
			$$$BNFMEMOSET(pos,addedElement)
			set done=1,lastpos=..stream.pos
		} else {
			set ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best 
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 1
		set ok=1
	} else {
		if $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=?4punctuation:4?&?4punctuation:4?
Method DottedName45Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..DottedName46Or(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Name(subElement,.addedElement)  {
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

/// 
/// summary=&C&P&C
Method DottedName46Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..DottedName(subElement,.addedElement)  && ..addPunctuation(subElement,".")  && ..Name(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  double_star_pattern: | '**' pattern_capture_target
/// summary=?4punctuation:4?
Method DoubleStarPattern(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..DoubleStarPattern169Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&P&C
Method DoubleStarPattern169Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"**")  && ..PatternCaptureTarget(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  double_starred_kvpair: | '**' bitwise_or | kvpair
/// summary=?4punctuation:4?&?4punctuation:4?
Method DoubleStarredKvpair(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..DoubleStarredKvpair306Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..Kvpair(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&P&C
Method DoubleStarredKvpair306Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"**")  && ..BitwiseOr(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  double_starred_kvpairs: ','.double_starred_kvpair+ [',']
/// summary=?4RepeatSep4?&[P]
Method DoubleStarredKvpairs(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..DoubleStarredKvpairs305RepSep(subElement,.addedElement)  && $S(..addPunctuation(subElement,",") :1,1:1) {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ','.double_starred_kvpair+
Method DoubleStarredKvpairs305RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set done=0 ; must be at least 1
	if ..DoubleStarredKvpair(subElement,.addedElement) {
		set done=1,ok=1 ; found 1
		do {
			$$$BNFSTART(repElement)
			set ok=(..addPunctuation(repElement,",")  && ..DoubleStarredKvpair(repElement,.addedElement) )
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
		set ok=0 ; normal rollback
	}
	quit ok
}

///  elif_stmt: | 'elif' named_expression ':' block elif_stmt | 'elif' named_expression ':' block [else_block]
Method ElifStmt(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	set done=0,ok=1,pos=..stream.pos,lastpos=pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set ok=($isobject(subElement))
		if ok $$$BNFCOMMITCOPY(subElement,ParentElement)
		quit ok
	}
	$$$BNFMEMOSET(pos,"")
	do ..getBookmark(.bm)
	while ok {
		$$$BNFSTART(subElement)
		do ..gotoBookmark(.bm)
		set rec=..ElifStmt101Recurse(subElement,.addedElement)
		if rec,..stream.pos>lastpos {
			$$$BNFMEMOSET(pos,addedElement)
			set done=1,lastpos=..stream.pos
		} else {
			set ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best 
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 1
		set ok=1
	} else {
		if $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=?4punctuation:4?&?4punctuation:4?
Method ElifStmt101Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..ElifStmt102Or(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ElifStmt103Or(subElement,.addedElement)  {
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

/// 
/// summary=&K&C&P&C&C
Method ElifStmt102Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"ELIF")  && ..NamedExpression(subElement,.addedElement)  && ..addPunctuation(subElement,":")  && ..Block(subElement,.addedElement)  && ..ElifStmt(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&K&C&P&C&[C]
Method ElifStmt103Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"ELIF")  && ..NamedExpression(subElement,.addedElement)  && ..addPunctuation(subElement,":")  && ..Block(subElement,.addedElement)  && $S(..ElseBlock(subElement,.addedElement) :1,1:1) {
		set done=1 ; end compileRules
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  else_block: | 'else' ':' block
/// summary=?4punctuation:4?
Method ElseBlock(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..ElseBlock104Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&K&P&C
Method ElseBlock104Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"ELSE")  && ..addPunctuation(subElement,":")  && ..Block(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  ENDMARKER : 'code endmarker'
/// summary=P
Method Endmarker(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..addPunctuation(subElement,"code endmarker")  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  eq_bitwise_or: '==' bitwise_or
/// summary=P&C
Method EqBitwiseOr(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..addPunctuation(subElement,"==")  && ..BitwiseOr(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  eval: expressions NEWLINE* ENDMARKER
/// summary=C&(?4Call:4?)*&C
Method Eval(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..Expressions(subElement,.addedElement)  && ..Eval1RepZero(subElement,.addedElement)  && ..Endmarker(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  NEWLINE*
Method Eval1RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	while ..Newline(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  except_block: | 'except' expression ['as' NAME ] ':' block | 'except' ':' block
/// summary=?4punctuation:4?&?4punctuation:4?
Method ExceptBlock(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..ExceptBlock124Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..ExceptBlock126Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&K&C&[K&C]&P&C
Method ExceptBlock124Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"EXCEPT")  && ..Expression(subElement,.addedElement)  && ..ExceptBlock125OptGrp(subElement,.addedElement)  && ..addPunctuation(subElement,":")  && ..Block(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

/// 
/// summary=K&C
Method ExceptBlock125OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"AS")  && ..Name(subElement,.addedElement)  {
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

/// 
/// summary=&K&P&C
Method ExceptBlock126Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"EXCEPT")  && ..addPunctuation(subElement,":")  && ..Block(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  except_star_block: | 'except' '*' expression ['as' NAME ] ':' block
/// summary=?4punctuation:4?
Method ExceptStarBlock(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..ExceptStarBlock127Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&K&P&C&[K&C]&P&C
Method ExceptStarBlock127Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"EXCEPT")  && ..addPunctuation(subElement,"*")  && ..Expression(subElement,.addedElement)  && ..ExceptStarBlock128OptGrp(subElement,.addedElement)  && ..addPunctuation(subElement,":")  && ..Block(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

/// 
/// summary=K&C
Method ExceptStarBlock128OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"AS")  && ..Name(subElement,.addedElement)  {
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

///  expression: | disjunction 'if' disjunction 'else' expression | disjunction | lambdef
Method Expression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	set done=0,ok=1,pos=..stream.pos,lastpos=pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set ok=($isobject(subElement))
		if ok $$$BNFCOMMITCOPY(subElement,ParentElement)
		quit ok
	}
	$$$BNFMEMOSET(pos,"")
	do ..getBookmark(.bm)
	while ok {
		$$$BNFSTART(subElement)
		do ..gotoBookmark(.bm)
		set rec=..Expression186Recurse(subElement,.addedElement)
		if rec,..stream.pos>lastpos {
			$$$BNFMEMOSET(pos,addedElement)
			set done=1,lastpos=..stream.pos
		} else {
			set ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best 
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 1
		set ok=1
	} else {
		if $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=?4punctuation:4?&?4punctuation:4?&?4punctuation:4?
Method Expression186Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..Expression187Or(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Disjunction(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Lambdef(subElement,.addedElement)  {
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

/// 
/// summary=&C&K&C&K&C
Method Expression187Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Disjunction(subElement,.addedElement)  && ..addKeyword(subElement,"IF")  && ..Disjunction(subElement,.addedElement)  && ..addKeyword(subElement,"ELSE")  && ..Expression(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  expressions: | expression (',' expression )+ [','] | expression ',' | expression
/// summary=?4punctuation:4?&?4punctuation:4?&?4punctuation:4?
Method Expressions(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..Expressions182Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..Expressions185Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..Expression(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&C&(?4punctuation:4?)+&[P]
Method Expressions182Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Expression(subElement,.addedElement)  && ..Expressions183RepOne(subElement,.addedElement)  && $S(..addPunctuation(subElement,",") :1,1:1) {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  (',' expression )+
Method Expressions183RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..Expressions184Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

/// ',' expression
/// summary=P&C
Method Expressions184Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  && ..Expression(subElement,.addedElement)  {
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

/// 
/// summary=&C&P
Method Expressions185Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Expression(subElement,.addedElement)  && ..addPunctuation(subElement,",")  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  factor: | '+' factor | '-' factor | '~' factor | power
Method Factor(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	set done=0,ok=1,pos=..stream.pos,lastpos=pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set ok=($isobject(subElement))
		if ok $$$BNFCOMMITCOPY(subElement,ParentElement)
		quit ok
	}
	$$$BNFMEMOSET(pos,"")
	do ..getBookmark(.bm)
	while ok {
		$$$BNFSTART(subElement)
		do ..gotoBookmark(.bm)
		set rec=..Factor230Recurse(subElement,.addedElement)
		if rec,..stream.pos>lastpos {
			$$$BNFMEMOSET(pos,addedElement)
			set done=1,lastpos=..stream.pos
		} else {
			set ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best 
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 1
		set ok=1
	} else {
		if $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?
Method Factor230Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..Factor231Or(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Factor232Or(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Factor233Or(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Power(subElement,.addedElement)  {
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

/// 
/// summary=&P&C
Method Factor231Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"+")  && ..Factor(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&P&C
Method Factor232Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"-")  && ..Factor(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&P&C
Method Factor233Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"~")  && ..Factor(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  file: [statements] ENDMARKER
/// summary=[C]&C
Method File(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if $S(..Statements(subElement,.addedElement) :1,1:1) && ..Endmarker(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  finally_block: | 'finally' ':' block
/// summary=?4punctuation:4?
Method FinallyBlock(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..FinallyBlock129Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&K&P&C
Method FinallyBlock129Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"FINALLY")  && ..addPunctuation(subElement,":")  && ..Block(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  for_if_clause: | 'async' 'for' star_targets 'in' ~ disjunction ('if' disjunction )* | 'for' star_targets 'in' ~ disjunction ('if' disjunction )*
/// summary=?4punctuation:4?&?4punctuation:4?
Method ForIfClause(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..ForIfClause308Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..ForIfClause311Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&K&K&C&K&?4Force4?&C&(?4punctuation:4?)*
Method ForIfClause308Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"ASYNC")  && ..addKeyword(subElement,"FOR")  && ..StarTargets(subElement,.addedElement)  && ..addKeyword(subElement,"IN")  && 1 /* force means? */ && ..Disjunction(subElement,.addedElement)  && ..ForIfClause309RepZero(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  ('if' disjunction )*
Method ForIfClause309RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	while ..ForIfClause310Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// 'if' disjunction
/// summary=K&C
Method ForIfClause310Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"IF")  && ..Disjunction(subElement,.addedElement)  {
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

/// 
/// summary=&K&C&K&?4Force4?&C&(?4punctuation:4?)*
Method ForIfClause311Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"FOR")  && ..StarTargets(subElement,.addedElement)  && ..addKeyword(subElement,"IN")  && 1 /* force means? */ && ..Disjunction(subElement,.addedElement)  && ..ForIfClause312RepZero(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  ('if' disjunction )*
Method ForIfClause312RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	while ..ForIfClause313Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// 'if' disjunction
/// summary=K&C
Method ForIfClause313Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"IF")  && ..Disjunction(subElement,.addedElement)  {
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

///  for_if_clauses: | for_if_clause+
/// summary=?4punctuation:4?
Method ForIfClauses(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..ForIfClauses307RepOne(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  for_if_clause+
Method ForIfClauses307RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..ForIfClause(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  for_stmt: | 'for' star_targets 'in' ~ star_expressions ':' [TYPE_COMMENT] block [else_block] | 'async' 'for' star_targets 'in' ~ star_expressions ':' [TYPE_COMMENT] block [else_block]
/// summary=?4punctuation:4?&?4punctuation:4?
Method ForStmt(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..ForStmt106Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..ForStmt107Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&K&C&K&?4Force4?&C&P&[C]&C&[C]
Method ForStmt106Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"FOR")  && ..StarTargets(subElement,.addedElement)  && ..addKeyword(subElement,"IN")  && 1 /* force means? */ && ..StarExpressions(subElement,.addedElement)  && ..addPunctuation(subElement,":")  && $S(..TypeComment(subElement,.addedElement) :1,1:1) && ..Block(subElement,.addedElement)  && $S(..ElseBlock(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

/// 
/// summary=&K&K&C&K&?4Force4?&C&P&[C]&C&[C]
Method ForStmt107Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"ASYNC")  && ..addKeyword(subElement,"FOR")  && ..StarTargets(subElement,.addedElement)  && ..addKeyword(subElement,"IN")  && 1 /* force means? */ && ..StarExpressions(subElement,.addedElement)  && ..addPunctuation(subElement,":")  && $S(..TypeComment(subElement,.addedElement) :1,1:1) && ..Block(subElement,.addedElement)  && $S(..ElseBlock(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  fstring: | FSTRING_START fstring_middle* FSTRING_END
/// summary=?4punctuation:4?
Method Fstring(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..Fstring296Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&C&(?4Call:4?)*&C
Method Fstring296Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..FstringStart(subElement,.addedElement)  && ..Fstring297RepZero(subElement,.addedElement)  && ..FstringEnd(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  fstring_middle*
Method Fstring297RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	while ..FstringMiddle(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  fstring_conversion: | "!" NAME
/// summary=?4punctuation:4?
Method FstringConversion(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..FstringConversion293Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&P&C
Method FstringConversion293Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"!")  && ..Name(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  FSTRING_END : 'code fstring_end'
/// summary=P
Method FstringEnd(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..addPunctuation(subElement,"code fstring_end")  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  fstring_format_spec: | FSTRING_MIDDLE | fstring_replacement_field
/// summary=?4punctuation:4?&?4punctuation:4?
Method FstringFormatSpec(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..FstringMiddle(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..FstringReplacementField(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  fstring_full_format_spec: | ':' fstring_format_spec*
/// summary=?4punctuation:4?
Method FstringFullFormatSpec(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..FstringFullFormatSpec294Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&P&(?4Call:4?)*
Method FstringFullFormatSpec294Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,":")  && ..FstringFullFormatSpec295RepZero(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  fstring_format_spec*
Method FstringFullFormatSpec295RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	while ..FstringFormatSpec(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  fstring_middle: | fstring_replacement_field | FSTRING_MIDDLE
Method FstringMiddle(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	set done=0,ok=1,pos=..stream.pos,lastpos=pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set ok=($isobject(subElement))
		if ok $$$BNFCOMMITCOPY(subElement,ParentElement)
		quit ok
	}
	$$$BNFMEMOSET(pos,"")
	do ..getBookmark(.bm)
	while ok {
		$$$BNFSTART(subElement)
		do ..gotoBookmark(.bm)
		set rec=..FstringMiddle291Recurse(subElement,.addedElement)
		if rec,..stream.pos>lastpos {
			$$$BNFMEMOSET(pos,addedElement)
			set done=1,lastpos=..stream.pos
		} else {
			set ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best 
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 1
		set ok=1
	} else {
		if $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=?4punctuation:4?&?4punctuation:4?
Method FstringMiddle291Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..FstringReplacementField(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..FstringMiddle(subElement,.addedElement)  {
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

///  fstring_replacement_field: | '{' annotated_rhs '='? [fstring_conversion] [fstring_full_format_spec] '}'
/// summary=?4punctuation:4?
Method FstringReplacementField(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..FstringReplacementField292Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&P&C&?4OptionalSingle4?&[C]&[C]&P
Method FstringReplacementField292Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"{")  && ..AnnotatedRhs(subElement,.addedElement)  && $s(..addPunctuation(subElement,"=") :1,1:1)  && $S(..FstringConversion(subElement,.addedElement) :1,1:1) && $S(..FstringFullFormatSpec(subElement,.addedElement) :1,1:1) && ..addPunctuation(subElement,"}")  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  FSTRING_START : 'code fstring_start'
/// summary=P
Method FstringStart(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..addPunctuation(subElement,"code fstring_start")  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  func_type: '(' [type_expressions] ')' '->' expression NEWLINE* ENDMARKER
/// summary=P&[C]&P&P&C&(?4Call:4?)*&C
Method FuncType(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..addPunctuation(subElement,"(")  && $S(..TypeExpressions(subElement,.addedElement) :1,1:1) && ..addPunctuation(subElement,")")  && ..addPunctuation(subElement,"->")  && ..Expression(subElement,.addedElement)  && ..FuncType2RepZero(subElement,.addedElement)  && ..Endmarker(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  NEWLINE*
Method FuncType2RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	while ..Newline(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  func_type_comment: | NEWLINE TYPE_COMMENT &(NEWLINE INDENT) | TYPE_COMMENT
/// summary=?4punctuation:4?&?4punctuation:4?
Method FuncTypeComment(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..FuncTypeComment402Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..TypeComment(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&C&C&?4LookAhead4?
Method FuncTypeComment402Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Newline(subElement,.addedElement)  && ..TypeComment(subElement,.addedElement)  && ..FuncTypeComment403Peek(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  &(NEWLINE INDENT)
Method FuncTypeComment403Peek(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; ruleE=LookAheadRule :(NEWLINE INDENT)
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..FuncTypeComment404Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
		$$$BNFROLLBACK(subElement)
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// NEWLINE INDENT
/// summary=C&C
Method FuncTypeComment404Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Newline(subElement,.addedElement)  && ..Indent(subElement,.addedElement)  {
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

///  function_def: | decorators function_def_raw | function_def_raw
/// summary=?4punctuation:4?&?4punctuation:4?
Method FunctionDef(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..FunctionDef53Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..FunctionDefRaw(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&C&C
Method FunctionDef53Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Decorators(subElement,.addedElement)  && ..FunctionDefRaw(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  function_def_raw: | 'def' NAME [type_params] '(' [params] ')' ['->' expression ] ':' [func_type_comment] block | 'async' 'def' NAME [type_params] '(' [params] ')' ['->' expression ] ':' [func_type_comment] block
/// summary=?4punctuation:4?&?4punctuation:4?
Method FunctionDefRaw(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..FunctionDefRaw54Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..FunctionDefRaw56Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&K&C&[C]&P&[C]&P&[P&C]&P&[C]&C
Method FunctionDefRaw54Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"DEF")  && ..Name(subElement,.addedElement)  && $S(..TypeParams(subElement,.addedElement) :1,1:1) && ..addPunctuation(subElement,"(")  && $S(..Params(subElement,.addedElement) :1,1:1) && ..addPunctuation(subElement,")")  && ..FunctionDefRaw55OptGrp(subElement,.addedElement)  && ..addPunctuation(subElement,":")  && $S(..FuncTypeComment(subElement,.addedElement) :1,1:1) && ..Block(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

/// 
/// summary=P&C
Method FunctionDefRaw55OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"->")  && ..Expression(subElement,.addedElement)  {
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

/// 
/// summary=&K&K&C&[C]&P&[C]&P&[P&C]&P&[C]&C
Method FunctionDefRaw56Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"ASYNC")  && ..addKeyword(subElement,"DEF")  && ..Name(subElement,.addedElement)  && $S(..TypeParams(subElement,.addedElement) :1,1:1) && ..addPunctuation(subElement,"(")  && $S(..Params(subElement,.addedElement) :1,1:1) && ..addPunctuation(subElement,")")  && ..FunctionDefRaw57OptGrp(subElement,.addedElement)  && ..addPunctuation(subElement,":")  && $S(..FuncTypeComment(subElement,.addedElement) :1,1:1) && ..Block(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

/// 
/// summary=P&C
Method FunctionDefRaw57OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"->")  && ..Expression(subElement,.addedElement)  {
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

///  genexp: | '(' ( assignment_expression | expression !':=') for_if_clauses ')'
/// summary=?4punctuation:4?
Method Genexp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..Genexp316Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&P&(C&?4punctuation:4?)&C&P
Method Genexp316Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"(")  && ..Genexp317Sub(subElement,.addedElement)  && ..ForIfClauses(subElement,.addedElement)  && ..addPunctuation(subElement,")")  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  assignment_expression | expression !':='
/// summary=C&?4punctuation:4?
Method Genexp317Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..AssignmentExpression(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Genexp318Or(subElement,.addedElement)  {
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

/// 
/// summary=&C&?4NotRule4?
Method Genexp318Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(subElement,.addedElement)  && ..Genexp319Not(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// ':='
Method Genexp319Not(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,":=")  { set done=1 }
	$$$BNFROLLBACK(subElement)
	if done {
		set ok=0
	} else {
		set ok=1
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  global_stmt: 'global' ','.NAME+
/// summary=K&?4RepeatSep4?
Method GlobalStmt(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"GLOBAL")  && ..GlobalStmt24RepSep(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ','.NAME+
Method GlobalStmt24RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set done=0 ; must be at least 1
	if ..Name(subElement,.addedElement) {
		set done=1,ok=1 ; found 1
		do {
			$$$BNFSTART(repElement)
			set ok=(..addPunctuation(repElement,",")  && ..Name(repElement,.addedElement) )
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
		set ok=0 ; normal rollback
	}
	quit ok
}

///  group: | '(' (yield_expr | named_expression) ')'
/// summary=?4punctuation:4?
Method Group(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..Group252Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&P&(C&?4punctuation:4?)&P
Method Group252Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"(")  && ..Group253Sub(subElement,.addedElement)  && ..addPunctuation(subElement,")")  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

/// yield_expr | named_expression
/// summary=C&?4punctuation:4?
Method Group253Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..YieldExpr(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..NamedExpression(subElement,.addedElement)  {
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

///  group_pattern: | '(' pattern ')'
/// summary=?4punctuation:4?
Method GroupPattern(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..GroupPattern154Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&P&C&P
Method GroupPattern154Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"(")  && ..Pattern(subElement,.addedElement)  && ..addPunctuation(subElement,")")  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  gt_bitwise_or: '>' bitwise_or
/// summary=P&C
Method GtBitwiseOr(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..addPunctuation(subElement,">")  && ..BitwiseOr(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  gte_bitwise_or: '>=' bitwise_or
/// summary=P&C
Method GteBitwiseOr(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..addPunctuation(subElement,">=")  && ..BitwiseOr(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  guard: 'if' named_expression
/// summary=K&C
Method Guard(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"IF")  && ..NamedExpression(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  if_stmt: | 'if' named_expression ':' block elif_stmt | 'if' named_expression ':' block [else_block]
/// summary=?4punctuation:4?&?4punctuation:4?
Method IfStmt(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..IfStmt99Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..IfStmt100Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&K&C&P&C&[C]
Method IfStmt100Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"IF")  && ..NamedExpression(subElement,.addedElement)  && ..addPunctuation(subElement,":")  && ..Block(subElement,.addedElement)  && $S(..ElseBlock(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

/// 
/// summary=&K&C&P&C&C
Method IfStmt99Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"IF")  && ..NamedExpression(subElement,.addedElement)  && ..addPunctuation(subElement,":")  && ..Block(subElement,.addedElement)  && ..ElifStmt(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  imaginary_number: | NUMBER
/// summary=?4punctuation:4?
Method ImaginaryNumber(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..Number(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  import_from: | 'from' ('.' | '...')* dotted_name 'import' import_from_targets | 'from' ('.' | '...')+ 'import' import_from_targets
/// summary=?4punctuation:4?&?4punctuation:4?
Method ImportFrom(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..ImportFrom30Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..ImportFrom33Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&K&(?4punctuation:4?)*&C&K&C
Method ImportFrom30Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"FROM")  && ..ImportFrom31RepZero(subElement,.addedElement)  && ..DottedName(subElement,.addedElement)  && ..addKeyword(subElement,"IMPORT")  && ..ImportFromTargets(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  ('.' | '...')*
Method ImportFrom31RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	while ..ImportFrom32Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// '.' | '...'
/// summary=P&?4punctuation:4?
Method ImportFrom32Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,".")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"...")  {
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

/// 
/// summary=&K&(?4punctuation:4?)+&K&C
Method ImportFrom33Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"FROM")  && ..ImportFrom34RepOne(subElement,.addedElement)  && ..addKeyword(subElement,"IMPORT")  && ..ImportFromTargets(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  ('.' | '...')+
Method ImportFrom34RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..ImportFrom35Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

/// '.' | '...'
/// summary=P&?4punctuation:4?
Method ImportFrom35Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,".")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"...")  {
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

///  import_from_as_name: | NAME ['as' NAME ]
/// summary=?4punctuation:4?
Method ImportFromAsName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..ImportFromAsName40Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&C&[K&C]
Method ImportFromAsName40Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Name(subElement,.addedElement)  && ..ImportFromAsName41OptGrp(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

/// 
/// summary=K&C
Method ImportFromAsName41OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"AS")  && ..Name(subElement,.addedElement)  {
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

///  import_from_as_names: | ','.import_from_as_name+
/// summary=?4punctuation:4?
Method ImportFromAsNames(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..ImportFromAsNames39RepSep(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ','.import_from_as_name+
Method ImportFromAsNames39RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set done=0 ; must be at least 1
	if ..ImportFromAsName(subElement,.addedElement) {
		set done=1,ok=1 ; found 1
		do {
			$$$BNFSTART(repElement)
			set ok=(..addPunctuation(repElement,",")  && ..ImportFromAsName(repElement,.addedElement) )
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
		set ok=0 ; normal rollback
	}
	quit ok
}

///  import_from_targets: | '(' import_from_as_names [','] ')' | import_from_as_names !',' | '*'
/// summary=?4punctuation:4?&?4punctuation:4?&?4punctuation:4?
Method ImportFromTargets(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..ImportFromTargets36Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..ImportFromTargets37Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..addPunctuation(subElement,"*")  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&P&C&[P]&P
Method ImportFromTargets36Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"(")  && ..ImportFromAsNames(subElement,.addedElement)  && $S(..addPunctuation(subElement,",") :1,1:1) && ..addPunctuation(subElement,")")  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

/// 
/// summary=&C&?4NotRule4?
Method ImportFromTargets37Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..ImportFromAsNames(subElement,.addedElement)  && ..ImportFromTargets38Not(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

/// ','
Method ImportFromTargets38Not(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  { set done=1 }
	$$$BNFROLLBACK(subElement)
	if done {
		set ok=0
	} else {
		set ok=1
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  import_name: 'import' dotted_as_names
/// summary=K&C
Method ImportName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"IMPORT")  && ..DottedAsNames(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  import_stmt: | import_name | import_from
/// summary=?4punctuation:4?&?4punctuation:4?
Method ImportStmt(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..ImportName(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..ImportFrom(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  in_bitwise_or: 'in' bitwise_or
/// summary=K&C
Method InBitwiseOr(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"IN")  && ..BitwiseOr(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  INDENT : 'code indent'
/// summary=P
Method Indent(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..addPunctuation(subElement,"code indent")  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  interactive: statement_newline
/// summary=C
Method Interactive(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..StatementNewline(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  invalid_default : 'code invalid_default'
/// summary=P
Method InvalidDefault(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..addPunctuation(subElement,"code invalid_default")  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  inversion: | 'not' inversion | comparison
Method Inversion(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	set done=0,ok=1,pos=..stream.pos,lastpos=pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set ok=($isobject(subElement))
		if ok $$$BNFCOMMITCOPY(subElement,ParentElement)
		quit ok
	}
	$$$BNFMEMOSET(pos,"")
	do ..getBookmark(.bm)
	while ok {
		$$$BNFSTART(subElement)
		do ..gotoBookmark(.bm)
		set rec=..Inversion206Recurse(subElement,.addedElement)
		if rec,..stream.pos>lastpos {
			$$$BNFMEMOSET(pos,addedElement)
			set done=1,lastpos=..stream.pos
		} else {
			set ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best 
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 1
		set ok=1
	} else {
		if $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=?4punctuation:4?&?4punctuation:4?
Method Inversion206Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..Inversion207Or(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Comparison(subElement,.addedElement)  {
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

/// 
/// summary=&K&C
Method Inversion207Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"NOT")  && ..Inversion(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  is_bitwise_or: 'is' bitwise_or
/// summary=K&C
Method IsBitwiseOr(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"IS")  && ..BitwiseOr(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  isnot_bitwise_or: 'is' 'not' bitwise_or
/// summary=K&K&C
Method IsnotBitwiseOr(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"IS")  && ..addKeyword(subElement,"NOT")  && ..BitwiseOr(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  items_pattern: | ','.key_value_pattern+
/// summary=?4punctuation:4?
Method ItemsPattern(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..ItemsPattern166RepSep(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ','.key_value_pattern+
Method ItemsPattern166RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set done=0 ; must be at least 1
	if ..KeyValuePattern(subElement,.addedElement) {
		set done=1,ok=1 ; found 1
		do {
			$$$BNFSTART(repElement)
			set ok=(..addPunctuation(repElement,",")  && ..KeyValuePattern(repElement,.addedElement) )
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
		set ok=0 ; normal rollback
	}
	quit ok
}

///  key_value_pattern: | (literal_expr | attr) ':' pattern
/// summary=?4punctuation:4?
Method KeyValuePattern(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..KeyValuePattern167Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&(C&?4punctuation:4?)&P&C
Method KeyValuePattern167Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..KeyValuePattern168Sub(subElement,.addedElement)  && ..addPunctuation(subElement,":")  && ..Pattern(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

/// literal_expr | attr
/// summary=C&?4punctuation:4?
Method KeyValuePattern168Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LiteralExpr(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Attr(subElement,.addedElement)  {
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

///  keyword_pattern: | NAME '=' pattern
/// summary=?4punctuation:4?
Method KeywordPattern(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..KeywordPattern176Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&C&P&C
Method KeywordPattern176Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Name(subElement,.addedElement)  && ..addPunctuation(subElement,"=")  && ..Pattern(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  keyword_patterns: | ','.keyword_pattern+
/// summary=?4punctuation:4?
Method KeywordPatterns(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..KeywordPatterns175RepSep(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ','.keyword_pattern+
Method KeywordPatterns175RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set done=0 ; must be at least 1
	if ..KeywordPattern(subElement,.addedElement) {
		set done=1,ok=1 ; found 1
		do {
			$$$BNFSTART(repElement)
			set ok=(..addPunctuation(repElement,",")  && ..KeywordPattern(repElement,.addedElement) )
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
		set ok=0 ; normal rollback
	}
	quit ok
}

///  kvpair: expression ':' expression
/// summary=C&P&C
Method Kvpair(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..Expression(subElement,.addedElement)  && ..addPunctuation(subElement,":")  && ..Expression(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  kwarg_or_double_starred: | NAME '=' expression | '**' expression
/// summary=?4punctuation:4?&?4punctuation:4?
Method KwargOrDoubleStarred(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..KwargOrDoubleStarred345Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..KwargOrDoubleStarred346Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&C&P&C
Method KwargOrDoubleStarred345Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Name(subElement,.addedElement)  && ..addPunctuation(subElement,"=")  && ..Expression(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

/// 
/// summary=&P&C
Method KwargOrDoubleStarred346Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"**")  && ..Expression(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  kwarg_or_starred: | NAME '=' expression | starred_expression
/// summary=?4punctuation:4?&?4punctuation:4?
Method KwargOrStarred(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..KwargOrStarred344Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..StarredExpression(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&C&P&C
Method KwargOrStarred344Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Name(subElement,.addedElement)  && ..addPunctuation(subElement,"=")  && ..Expression(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  kwargs: | ','.kwarg_or_starred+ ',' ','.kwarg_or_double_starred+ | ','.kwarg_or_starred+ | ','.kwarg_or_double_starred+
/// summary=?4punctuation:4?&?4punctuation:4?&?4punctuation:4?
Method Kwargs(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..Kwargs338Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..Kwargs341RepSep(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..Kwargs342RepSep(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&?4RepeatSep4?&P&?4RepeatSep4?
Method Kwargs338Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Kwargs339RepSep(subElement,.addedElement)  && ..addPunctuation(subElement,",")  && ..Kwargs340RepSep(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  ','.kwarg_or_starred+
Method Kwargs339RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set done=0 ; must be at least 1
	if ..KwargOrStarred(subElement,.addedElement) {
		set done=1,ok=1 ; found 1
		do {
			$$$BNFSTART(repElement)
			set ok=(..addPunctuation(repElement,",")  && ..KwargOrStarred(repElement,.addedElement) )
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
		set ok=0 ; normal rollback
	}
	quit ok
}

///  ','.kwarg_or_double_starred+
Method Kwargs340RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set done=0 ; must be at least 1
	if ..KwargOrDoubleStarred(subElement,.addedElement) {
		set done=1,ok=1 ; found 1
		do {
			$$$BNFSTART(repElement)
			set ok=(..addPunctuation(repElement,",")  && ..KwargOrDoubleStarred(repElement,.addedElement) )
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
		set ok=0 ; normal rollback
	}
	quit ok
}

///  ','.kwarg_or_starred+
Method Kwargs341RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set done=0 ; must be at least 1
	if ..KwargOrStarred(subElement,.addedElement) {
		set done=1,ok=1 ; found 1
		do {
			$$$BNFSTART(repElement)
			set ok=(..addPunctuation(repElement,",")  && ..KwargOrStarred(repElement,.addedElement) )
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
		set ok=0 ; normal rollback
	}
	quit ok
}

///  ','.kwarg_or_double_starred+
Method Kwargs342RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set done=0 ; must be at least 1
	if ..KwargOrDoubleStarred(subElement,.addedElement) {
		set done=1,ok=1 ; found 1
		do {
			$$$BNFSTART(repElement)
			set ok=(..addPunctuation(repElement,",")  && ..KwargOrDoubleStarred(repElement,.addedElement) )
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
		set ok=0 ; normal rollback
	}
	quit ok
}

///  kwds: | '**' param_no_default
/// summary=?4punctuation:4?
Method Kwds(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..Kwds86Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&P&C
Method Kwds86Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"**")  && ..ParamNoDefault(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  lambda_kwds: | '**' lambda_param_no_default
/// summary=?4punctuation:4?
Method LambdaKwds(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..LambdaKwds281Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&P&C
Method LambdaKwds281Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"**")  && ..LambdaParamNoDefault(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  lambda_param: NAME
/// summary=C
Method LambdaParam(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..Name(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  lambda_param_maybe_default: | lambda_param default? ',' | lambda_param default? &':'
/// summary=?4punctuation:4?&?4punctuation:4?
Method LambdaParamMaybeDefault(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..LambdaParamMaybeDefault288Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..LambdaParamMaybeDefault289Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&C&?4OptionalSingle4?&P
Method LambdaParamMaybeDefault288Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..LambdaParam(subElement,.addedElement)  && $s(..Default(subElement,.addedElement) :1,1:1)  && ..addPunctuation(subElement,",")  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

/// 
/// summary=&C&?4OptionalSingle4?&?4LookAhead4?
Method LambdaParamMaybeDefault289Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..LambdaParam(subElement,.addedElement)  && $s(..Default(subElement,.addedElement) :1,1:1)  && ..LambdaParamMaybeDefault290Peek(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  &':'
Method LambdaParamMaybeDefault290Peek(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; ruleE=LookAheadRule :':'
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,":")  {
		set done=1
	}
	if done {
		set ok=1
		$$$BNFROLLBACK(subElement)
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  lambda_param_no_default: | lambda_param ',' | lambda_param &':'
/// summary=?4punctuation:4?&?4punctuation:4?
Method LambdaParamNoDefault(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..LambdaParamNoDefault282Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..LambdaParamNoDefault283Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&C&P
Method LambdaParamNoDefault282Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..LambdaParam(subElement,.addedElement)  && ..addPunctuation(subElement,",")  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

/// 
/// summary=&C&?4LookAhead4?
Method LambdaParamNoDefault283Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..LambdaParam(subElement,.addedElement)  && ..LambdaParamNoDefault284Peek(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  &':'
Method LambdaParamNoDefault284Peek(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; ruleE=LookAheadRule :':'
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,":")  {
		set done=1
	}
	if done {
		set ok=1
		$$$BNFROLLBACK(subElement)
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  lambda_param_with_default: | lambda_param default ',' | lambda_param default &':'
/// summary=?4punctuation:4?&?4punctuation:4?
Method LambdaParamWithDefault(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..LambdaParamWithDefault285Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..LambdaParamWithDefault286Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&C&C&P
Method LambdaParamWithDefault285Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..LambdaParam(subElement,.addedElement)  && ..Default(subElement,.addedElement)  && ..addPunctuation(subElement,",")  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

/// 
/// summary=&C&C&?4LookAhead4?
Method LambdaParamWithDefault286Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..LambdaParam(subElement,.addedElement)  && ..Default(subElement,.addedElement)  && ..LambdaParamWithDefault287Peek(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  &':'
Method LambdaParamWithDefault287Peek(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; ruleE=LookAheadRule :':'
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,":")  {
		set done=1
	}
	if done {
		set ok=1
		$$$BNFROLLBACK(subElement)
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  lambda_parameters: | lambda_slash_no_default lambda_param_no_default* lambda_param_with_default* [lambda_star_etc] | lambda_slash_with_default lambda_param_with_default* [lambda_star_etc] | lambda_param_no_default+ lambda_param_with_default* [lambda_star_etc] | lambda_param_with_default+ [lambda_star_etc] | lambda_star_etc
/// summary=?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?
Method LambdaParameters(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..LambdaParameters255Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..LambdaParameters258Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..LambdaParameters260Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..LambdaParameters263Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..LambdaStarEtc(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&C&(?4Call:4?)*&(?4Call:4?)*&[C]
Method LambdaParameters255Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..LambdaSlashNoDefault(subElement,.addedElement)  && ..LambdaParameters256RepZero(subElement,.addedElement)  && ..LambdaParameters257RepZero(subElement,.addedElement)  && $S(..LambdaStarEtc(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  lambda_param_no_default*
Method LambdaParameters256RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	while ..LambdaParamNoDefault(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  lambda_param_with_default*
Method LambdaParameters257RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	while ..LambdaParamWithDefault(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// 
/// summary=&C&(?4Call:4?)*&[C]
Method LambdaParameters258Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..LambdaSlashWithDefault(subElement,.addedElement)  && ..LambdaParameters259RepZero(subElement,.addedElement)  && $S(..LambdaStarEtc(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  lambda_param_with_default*
Method LambdaParameters259RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	while ..LambdaParamWithDefault(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// 
/// summary=&(?4Call:4?)+&(?4Call:4?)*&[C]
Method LambdaParameters260Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..LambdaParameters261RepOne(subElement,.addedElement)  && ..LambdaParameters262RepZero(subElement,.addedElement)  && $S(..LambdaStarEtc(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  lambda_param_no_default+
Method LambdaParameters261RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..LambdaParamNoDefault(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  lambda_param_with_default*
Method LambdaParameters262RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	while ..LambdaParamWithDefault(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// 
/// summary=&(?4Call:4?)+&[C]
Method LambdaParameters263Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..LambdaParameters264RepOne(subElement,.addedElement)  && $S(..LambdaStarEtc(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  lambda_param_with_default+
Method LambdaParameters264RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..LambdaParamWithDefault(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  lambda_params: | lambda_parameters
/// summary=?4punctuation:4?
Method LambdaParams(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..LambdaParameters(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  lambda_slash_no_default: | lambda_param_no_default+ '/' ',' | lambda_param_no_default+ '/' &':'
/// summary=?4punctuation:4?&?4punctuation:4?
Method LambdaSlashNoDefault(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..LambdaSlashNoDefault265Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..LambdaSlashNoDefault267Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&(?4Call:4?)+&P&P
Method LambdaSlashNoDefault265Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..LambdaSlashNoDefault266RepOne(subElement,.addedElement)  && ..addPunctuation(subElement,"/")  && ..addPunctuation(subElement,",")  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  lambda_param_no_default+
Method LambdaSlashNoDefault266RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..LambdaParamNoDefault(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

/// 
/// summary=&(?4Call:4?)+&P&?4LookAhead4?
Method LambdaSlashNoDefault267Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..LambdaSlashNoDefault268RepOne(subElement,.addedElement)  && ..addPunctuation(subElement,"/")  && ..LambdaSlashNoDefault269Peek(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  lambda_param_no_default+
Method LambdaSlashNoDefault268RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..LambdaParamNoDefault(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  &':'
Method LambdaSlashNoDefault269Peek(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; ruleE=LookAheadRule :':'
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,":")  {
		set done=1
	}
	if done {
		set ok=1
		$$$BNFROLLBACK(subElement)
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  lambda_slash_with_default: | lambda_param_no_default* lambda_param_with_default+ '/' ',' | lambda_param_no_default* lambda_param_with_default+ '/' &':'
/// summary=?4punctuation:4?&?4punctuation:4?
Method LambdaSlashWithDefault(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..LambdaSlashWithDefault270Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..LambdaSlashWithDefault273Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&(?4Call:4?)*&(?4Call:4?)+&P&P
Method LambdaSlashWithDefault270Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..LambdaSlashWithDefault271RepZero(subElement,.addedElement)  && ..LambdaSlashWithDefault272RepOne(subElement,.addedElement)  && ..addPunctuation(subElement,"/")  && ..addPunctuation(subElement,",")  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  lambda_param_no_default*
Method LambdaSlashWithDefault271RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	while ..LambdaParamNoDefault(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  lambda_param_with_default+
Method LambdaSlashWithDefault272RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..LambdaParamWithDefault(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

/// 
/// summary=&(?4Call:4?)*&(?4Call:4?)+&P&?4LookAhead4?
Method LambdaSlashWithDefault273Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..LambdaSlashWithDefault274RepZero(subElement,.addedElement)  && ..LambdaSlashWithDefault275RepOne(subElement,.addedElement)  && ..addPunctuation(subElement,"/")  && ..LambdaSlashWithDefault276Peek(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  lambda_param_no_default*
Method LambdaSlashWithDefault274RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	while ..LambdaParamNoDefault(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  lambda_param_with_default+
Method LambdaSlashWithDefault275RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..LambdaParamWithDefault(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  &':'
Method LambdaSlashWithDefault276Peek(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; ruleE=LookAheadRule :':'
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,":")  {
		set done=1
	}
	if done {
		set ok=1
		$$$BNFROLLBACK(subElement)
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  lambda_star_etc: | '*' lambda_param_no_default lambda_param_maybe_default* [lambda_kwds] | '*' ',' lambda_param_maybe_default+ [lambda_kwds] | lambda_kwds
/// summary=?4punctuation:4?&?4punctuation:4?&?4punctuation:4?
Method LambdaStarEtc(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..LambdaStarEtc277Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..LambdaStarEtc279Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..LambdaKwds(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&P&C&(?4Call:4?)*&[C]
Method LambdaStarEtc277Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"*")  && ..LambdaParamNoDefault(subElement,.addedElement)  && ..LambdaStarEtc278RepZero(subElement,.addedElement)  && $S(..LambdaKwds(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  lambda_param_maybe_default*
Method LambdaStarEtc278RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	while ..LambdaParamMaybeDefault(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// 
/// summary=&P&P&(?4Call:4?)+&[C]
Method LambdaStarEtc279Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"*")  && ..addPunctuation(subElement,",")  && ..LambdaStarEtc280RepOne(subElement,.addedElement)  && $S(..LambdaKwds(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  lambda_param_maybe_default+
Method LambdaStarEtc280RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..LambdaParamMaybeDefault(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  lambdef: | 'lambda' [lambda_params] ':' expression
/// summary=?4punctuation:4?
Method Lambdef(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..Lambdef254Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&K&[C]&P&C
Method Lambdef254Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"LAMBDA")  && $S(..LambdaParams(subElement,.addedElement) :1,1:1) && ..addPunctuation(subElement,":")  && ..Expression(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  list: | '[' [star_named_expressions] ']'
/// summary=?4punctuation:4?
Method List(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..List301Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&P&[C]&P
Method List301Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"[")  && $S(..StarNamedExpressions(subElement,.addedElement) :1,1:1) && ..addPunctuation(subElement,"]")  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  listcomp: | '[' named_expression for_if_clauses ']'
/// summary=?4punctuation:4?
Method Listcomp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..Listcomp314Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&P&C&C&P
Method Listcomp314Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"[")  && ..NamedExpression(subElement,.addedElement)  && ..ForIfClauses(subElement,.addedElement)  && ..addPunctuation(subElement,"]")  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  literal_expr: | signed_number !('+' | '-') | complex_number | strings | 'None' | 'True' | 'False'
/// summary=?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?
Method LiteralExpr(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..LiteralExpr139Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..ComplexNumber(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..Strings(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..addKeyword(subElement,"NONE")  {
			set done=1 ; or
		} elseif ..addKeyword(subElement,"TRUE")  {
			set done=1 ; or
		} elseif ..addKeyword(subElement,"FALSE")  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&C&?4NotRule4?
Method LiteralExpr139Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..SignedNumber(subElement,.addedElement)  && ..LiteralExpr140Not(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

/// ('+' | '-')
Method LiteralExpr140Not(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LiteralExpr141Sub(subElement,.addedElement)  { set done=1 }
	$$$BNFROLLBACK(subElement)
	if done {
		set ok=0
	} else {
		set ok=1
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// '+' | '-'
/// summary=P&?4punctuation:4?
Method LiteralExpr141Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"+")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"-")  {
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

///  literal_pattern: | signed_number !('+' | '-') | complex_number | strings | 'None' | 'True' | 'False'
/// summary=?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?
Method LiteralPattern(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..LiteralPattern136Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..ComplexNumber(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..Strings(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..addKeyword(subElement,"NONE")  {
			set done=1 ; or
		} elseif ..addKeyword(subElement,"TRUE")  {
			set done=1 ; or
		} elseif ..addKeyword(subElement,"FALSE")  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&C&?4NotRule4?
Method LiteralPattern136Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..SignedNumber(subElement,.addedElement)  && ..LiteralPattern137Not(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

/// ('+' | '-')
Method LiteralPattern137Not(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LiteralPattern138Sub(subElement,.addedElement)  { set done=1 }
	$$$BNFROLLBACK(subElement)
	if done {
		set ok=0
	} else {
		set ok=1
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// '+' | '-'
/// summary=P&?4punctuation:4?
Method LiteralPattern138Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"+")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"-")  {
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

///  lt_bitwise_or: '<' bitwise_or
/// summary=P&C
Method LtBitwiseOr(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..addPunctuation(subElement,"<")  && ..BitwiseOr(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  lte_bitwise_or: '<=' bitwise_or
/// summary=P&C
Method LteBitwiseOr(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..addPunctuation(subElement,"<=")  && ..BitwiseOr(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  mapping_pattern: | '{' '}' | '{' double_star_pattern ','? '}' | '{' items_pattern ',' double_star_pattern ','? '}' | '{' items_pattern ','? '}'
/// summary=?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?
Method MappingPattern(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..MappingPattern162Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..MappingPattern163Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..MappingPattern164Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..MappingPattern165Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&P&P
Method MappingPattern162Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"{")  && ..addPunctuation(subElement,"}")  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

/// 
/// summary=&P&C&?4OptionalSingle4?&P
Method MappingPattern163Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"{")  && ..DoubleStarPattern(subElement,.addedElement)  && $s(..addPunctuation(subElement,",") :1,1:1)  && ..addPunctuation(subElement,"}")  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

/// 
/// summary=&P&C&P&C&?4OptionalSingle4?&P
Method MappingPattern164Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"{")  && ..ItemsPattern(subElement,.addedElement)  && ..addPunctuation(subElement,",")  && ..DoubleStarPattern(subElement,.addedElement)  && $s(..addPunctuation(subElement,",") :1,1:1)  && ..addPunctuation(subElement,"}")  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

/// 
/// summary=&P&C&?4OptionalSingle4?&P
Method MappingPattern165Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"{")  && ..ItemsPattern(subElement,.addedElement)  && $s(..addPunctuation(subElement,",") :1,1:1)  && ..addPunctuation(subElement,"}")  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  match_stmt: | "match" subject_expr ':' NEWLINE INDENT case_block+ DEDENT
/// summary=?4punctuation:4?
Method MatchStmt(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..MatchStmt130Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&K&C&P&C&C&(?4Call:4?)+&C
Method MatchStmt130Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"MATCH")  && ..SubjectExpr(subElement,.addedElement)  && ..addPunctuation(subElement,":")  && ..Newline(subElement,.addedElement)  && ..Indent(subElement,.addedElement)  && ..MatchStmt131RepOne(subElement,.addedElement)  && ..Dedent(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  case_block+
Method MatchStmt131RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..CaseBlock(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  maybe_sequence_pattern: | ','.maybe_star_pattern+ ','?
/// summary=?4punctuation:4?
Method MaybeSequencePattern(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..MaybeSequencePattern158Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&?4RepeatSep4?&?4OptionalSingle4?
Method MaybeSequencePattern158Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..MaybeSequencePattern159RepSep(subElement,.addedElement)  && $s(..addPunctuation(subElement,",") :1,1:1)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  ','.maybe_star_pattern+
Method MaybeSequencePattern159RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set done=0 ; must be at least 1
	if ..MaybeStarPattern(subElement,.addedElement) {
		set done=1,ok=1 ; found 1
		do {
			$$$BNFSTART(repElement)
			set ok=(..addPunctuation(repElement,",")  && ..MaybeStarPattern(repElement,.addedElement) )
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
		set ok=0 ; normal rollback
	}
	quit ok
}

///  maybe_star_pattern: | star_pattern | pattern
/// summary=?4punctuation:4?&?4punctuation:4?
Method MaybeStarPattern(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..StarPattern(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..Pattern(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  NAME : 'code name'
/// summary=P
Method Name(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..addPunctuation(subElement,"code name")  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  name_or_attr: | attr | NAME
/// summary=?4punctuation:4?&?4punctuation:4?
Method NameOrAttr(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..Attr(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..Name(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  named_expression: | assignment_expression | expression !':='
/// summary=?4punctuation:4?&?4punctuation:4?
Method NamedExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..AssignmentExpression(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..NamedExpression198Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&C&?4NotRule4?
Method NamedExpression198Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Expression(subElement,.addedElement)  && ..NamedExpression199Not(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

/// ':='
Method NamedExpression199Not(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,":=")  { set done=1 }
	$$$BNFROLLBACK(subElement)
	if done {
		set ok=0
	} else {
		set ok=1
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  NEWLINE : 'code newline'
/// summary=P
Method Newline(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..addPunctuation(subElement,"code newline")  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  nonlocal_stmt: 'nonlocal' ','.NAME+
/// summary=K&?4RepeatSep4?
Method NonlocalStmt(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"NONLOCAL")  && ..NonlocalStmt25RepSep(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ','.NAME+
Method NonlocalStmt25RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set done=0 ; must be at least 1
	if ..Name(subElement,.addedElement) {
		set done=1,ok=1 ; found 1
		do {
			$$$BNFSTART(repElement)
			set ok=(..addPunctuation(repElement,",")  && ..Name(repElement,.addedElement) )
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
		set ok=0 ; normal rollback
	}
	quit ok
}

///  noteq_bitwise_or: | ('!=' ) bitwise_or
/// summary=?4punctuation:4?
Method NoteqBitwiseOr(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..NoteqBitwiseOr210Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&(P)&C
Method NoteqBitwiseOr210Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..NoteqBitwiseOr211Sub(subElement,.addedElement)  && ..BitwiseOr(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

/// '!='
/// summary=P
Method NoteqBitwiseOr211Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	if ..addPunctuation(subElement,"!=")  {
		set done=1 ; end compileRules
	}
	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  notin_bitwise_or: 'not' 'in' bitwise_or
/// summary=K&K&C
Method NotinBitwiseOr(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"NOT")  && ..addKeyword(subElement,"IN")  && ..BitwiseOr(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  NUMBER : 'code number'
/// summary=P
Method Number(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..addPunctuation(subElement,"code number")  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  open_sequence_pattern: | maybe_star_pattern ',' maybe_sequence_pattern?
/// summary=?4punctuation:4?
Method OpenSequencePattern(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..OpenSequencePattern157Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&C&P&?4OptionalSingle4?
Method OpenSequencePattern157Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..MaybeStarPattern(subElement,.addedElement)  && ..addPunctuation(subElement,",")  && $s(..MaybeSequencePattern(subElement,.addedElement) :1,1:1)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  or_pattern: | '|'.closed_pattern+
/// summary=?4punctuation:4?
Method OrPattern(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..OrPattern135RepSep(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  '|'.closed_pattern+
Method OrPattern135RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set done=0 ; must be at least 1
	if ..ClosedPattern(subElement,.addedElement) {
		set done=1,ok=1 ; found 1
		do {
			$$$BNFSTART(repElement)
			set ok=(..addPunctuation(repElement,"|")  && ..ClosedPattern(repElement,.addedElement) )
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
		set ok=0 ; normal rollback
	}
	quit ok
}

///  param: NAME annotation?
/// summary=C&?4OptionalSingle4?
Method Param(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..Name(subElement,.addedElement)  && $s(..Annotation(subElement,.addedElement) :1,1:1)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  param_maybe_default: | param default? ',' TYPE_COMMENT? | param default? TYPE_COMMENT? &')'
/// summary=?4punctuation:4?&?4punctuation:4?
Method ParamMaybeDefault(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..ParamMaybeDefault96Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..ParamMaybeDefault97Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&C&?4OptionalSingle4?&P&?4OptionalSingle4?
Method ParamMaybeDefault96Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Param(subElement,.addedElement)  && $s(..Default(subElement,.addedElement) :1,1:1)  && ..addPunctuation(subElement,",")  && $s(..TypeComment(subElement,.addedElement) :1,1:1)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

/// 
/// summary=&C&?4OptionalSingle4?&?4OptionalSingle4?&?4LookAhead4?
Method ParamMaybeDefault97Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Param(subElement,.addedElement)  && $s(..Default(subElement,.addedElement) :1,1:1)  && $s(..TypeComment(subElement,.addedElement) :1,1:1)  && ..ParamMaybeDefault98Peek(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  &')'
Method ParamMaybeDefault98Peek(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; ruleE=LookAheadRule :')'
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,")")  {
		set done=1
	}
	if done {
		set ok=1
		$$$BNFROLLBACK(subElement)
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  param_no_default: | param ',' TYPE_COMMENT? | param TYPE_COMMENT? &')'
/// summary=?4punctuation:4?&?4punctuation:4?
Method ParamNoDefault(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..ParamNoDefault87Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..ParamNoDefault88Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&C&P&?4OptionalSingle4?
Method ParamNoDefault87Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Param(subElement,.addedElement)  && ..addPunctuation(subElement,",")  && $s(..TypeComment(subElement,.addedElement) :1,1:1)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

/// 
/// summary=&C&?4OptionalSingle4?&?4LookAhead4?
Method ParamNoDefault88Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Param(subElement,.addedElement)  && $s(..TypeComment(subElement,.addedElement) :1,1:1)  && ..ParamNoDefault89Peek(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  &')'
Method ParamNoDefault89Peek(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; ruleE=LookAheadRule :')'
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,")")  {
		set done=1
	}
	if done {
		set ok=1
		$$$BNFROLLBACK(subElement)
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  param_no_default_star_annotation: | param_star_annotation ',' TYPE_COMMENT? | param_star_annotation TYPE_COMMENT? &')'
/// summary=?4punctuation:4?&?4punctuation:4?
Method ParamNoDefaultStarAnnotation(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..ParamNoDefaultStarAnnotation90Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..ParamNoDefaultStarAnnotation91Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&C&P&?4OptionalSingle4?
Method ParamNoDefaultStarAnnotation90Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..ParamStarAnnotation(subElement,.addedElement)  && ..addPunctuation(subElement,",")  && $s(..TypeComment(subElement,.addedElement) :1,1:1)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

/// 
/// summary=&C&?4OptionalSingle4?&?4LookAhead4?
Method ParamNoDefaultStarAnnotation91Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..ParamStarAnnotation(subElement,.addedElement)  && $s(..TypeComment(subElement,.addedElement) :1,1:1)  && ..ParamNoDefaultStarAnnotation92Peek(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  &')'
Method ParamNoDefaultStarAnnotation92Peek(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; ruleE=LookAheadRule :')'
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,")")  {
		set done=1
	}
	if done {
		set ok=1
		$$$BNFROLLBACK(subElement)
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  param_star_annotation: NAME star_annotation
/// summary=C&C
Method ParamStarAnnotation(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..Name(subElement,.addedElement)  && ..StarAnnotation(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  param_with_default: | param default ',' TYPE_COMMENT? | param default TYPE_COMMENT? &')'
/// summary=?4punctuation:4?&?4punctuation:4?
Method ParamWithDefault(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..ParamWithDefault93Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..ParamWithDefault94Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&C&C&P&?4OptionalSingle4?
Method ParamWithDefault93Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Param(subElement,.addedElement)  && ..Default(subElement,.addedElement)  && ..addPunctuation(subElement,",")  && $s(..TypeComment(subElement,.addedElement) :1,1:1)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

/// 
/// summary=&C&C&?4OptionalSingle4?&?4LookAhead4?
Method ParamWithDefault94Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Param(subElement,.addedElement)  && ..Default(subElement,.addedElement)  && $s(..TypeComment(subElement,.addedElement) :1,1:1)  && ..ParamWithDefault95Peek(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  &')'
Method ParamWithDefault95Peek(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; ruleE=LookAheadRule :')'
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,")")  {
		set done=1
	}
	if done {
		set ok=1
		$$$BNFROLLBACK(subElement)
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  parameters: | slash_no_default param_no_default* param_with_default* [star_etc] | slash_with_default param_with_default* [star_etc] | param_no_default+ param_with_default* [star_etc] | param_with_default+ [star_etc] | star_etc
/// summary=?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?
Method Parameters(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..Parameters58Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..Parameters61Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..Parameters63Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..Parameters66Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..StarEtc(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&C&(?4Call:4?)*&(?4Call:4?)*&[C]
Method Parameters58Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..SlashNoDefault(subElement,.addedElement)  && ..Parameters59RepZero(subElement,.addedElement)  && ..Parameters60RepZero(subElement,.addedElement)  && $S(..StarEtc(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  param_no_default*
Method Parameters59RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	while ..ParamNoDefault(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  param_with_default*
Method Parameters60RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	while ..ParamWithDefault(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// 
/// summary=&C&(?4Call:4?)*&[C]
Method Parameters61Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..SlashWithDefault(subElement,.addedElement)  && ..Parameters62RepZero(subElement,.addedElement)  && $S(..StarEtc(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  param_with_default*
Method Parameters62RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	while ..ParamWithDefault(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// 
/// summary=&(?4Call:4?)+&(?4Call:4?)*&[C]
Method Parameters63Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Parameters64RepOne(subElement,.addedElement)  && ..Parameters65RepZero(subElement,.addedElement)  && $S(..StarEtc(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  param_no_default+
Method Parameters64RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..ParamNoDefault(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  param_with_default*
Method Parameters65RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	while ..ParamWithDefault(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// 
/// summary=&(?4Call:4?)+&[C]
Method Parameters66Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Parameters67RepOne(subElement,.addedElement)  && $S(..StarEtc(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  param_with_default+
Method Parameters67RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..ParamWithDefault(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  params: | parameters
/// summary=?4punctuation:4?
Method Params(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..Parameters(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  pattern: | as_pattern | or_pattern
/// summary=?4punctuation:4?&?4punctuation:4?
Method Pattern(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..AsPattern(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..OrPattern(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  pattern_capture_target: | !"_" NAME !('.' | '(' | '=')
/// summary=?4punctuation:4?
Method PatternCaptureTarget(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..PatternCaptureTarget146Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&?4NotRule4?&C&?4NotRule4?
Method PatternCaptureTarget146Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..PatternCaptureTarget147Not(subElement,.addedElement)  && ..Name(subElement,.addedElement)  && ..PatternCaptureTarget148Not(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

/// "_"
Method PatternCaptureTarget147Not(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"_")  { set done=1 }
	$$$BNFROLLBACK(subElement)
	if done {
		set ok=0
	} else {
		set ok=1
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// ('.' | '(' | '=')
Method PatternCaptureTarget148Not(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..PatternCaptureTarget149Sub(subElement,.addedElement)  { set done=1 }
	$$$BNFROLLBACK(subElement)
	if done {
		set ok=0
	} else {
		set ok=1
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// '.' | '(' | '='
/// summary=P&?4punctuation:4?&?4punctuation:4?
Method PatternCaptureTarget149Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,".")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"(")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"=")  {
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

///  patterns: | open_sequence_pattern | pattern
/// summary=?4punctuation:4?&?4punctuation:4?
Method Patterns(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..OpenSequencePattern(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..Pattern(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  positional_patterns: | ','.pattern+
/// summary=?4punctuation:4?
Method PositionalPatterns(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..PositionalPatterns174RepSep(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ','.pattern+
Method PositionalPatterns174RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set done=0 ; must be at least 1
	if ..Pattern(subElement,.addedElement) {
		set done=1,ok=1 ; found 1
		do {
			$$$BNFSTART(repElement)
			set ok=(..addPunctuation(repElement,",")  && ..Pattern(repElement,.addedElement) )
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
		set ok=0 ; normal rollback
	}
	quit ok
}

///  power: | await_primary '**' factor | await_primary
/// summary=?4punctuation:4?&?4punctuation:4?
Method Power(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..Power234Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..AwaitPrimary(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&C&P&C
Method Power234Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..AwaitPrimary(subElement,.addedElement)  && ..addPunctuation(subElement,"**")  && ..Factor(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  primary: | primary '.' NAME | primary genexp | primary '(' [arguments] ')' | primary '[' slices ']' | atom
Method Primary(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	set done=0,ok=1,pos=..stream.pos,lastpos=pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set ok=($isobject(subElement))
		if ok $$$BNFCOMMITCOPY(subElement,ParentElement)
		quit ok
	}
	$$$BNFMEMOSET(pos,"")
	do ..getBookmark(.bm)
	while ok {
		$$$BNFSTART(subElement)
		do ..gotoBookmark(.bm)
		set rec=..Primary236Recurse(subElement,.addedElement)
		if rec,..stream.pos>lastpos {
			$$$BNFMEMOSET(pos,addedElement)
			set done=1,lastpos=..stream.pos
		} else {
			set ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best 
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 1
		set ok=1
	} else {
		if $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?
Method Primary236Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..Primary237Or(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Primary238Or(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Primary239Or(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Primary240Or(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Atom(subElement,.addedElement)  {
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

/// 
/// summary=&C&P&C
Method Primary237Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Primary(subElement,.addedElement)  && ..addPunctuation(subElement,".")  && ..Name(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&C&C
Method Primary238Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Primary(subElement,.addedElement)  && ..Genexp(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&C&P&[C]&P
Method Primary239Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Primary(subElement,.addedElement)  && ..addPunctuation(subElement,"(")  && $S(..Arguments(subElement,.addedElement) :1,1:1) && ..addPunctuation(subElement,")")  {
		set done=1 ; end compileRules
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&C&P&C&P
Method Primary240Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Primary(subElement,.addedElement)  && ..addPunctuation(subElement,"[")  && ..Slices(subElement,.addedElement)  && ..addPunctuation(subElement,"]")  {
		set done=1 ; end compileRules
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  raise_stmt: | 'raise' expression ['from' expression ] | 'raise'
/// summary=?4punctuation:4?&?4punctuation:4?
Method RaiseStmt(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..RaiseStmt22Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..addKeyword(subElement,"RAISE")  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&K&C&[K&C]
Method RaiseStmt22Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"RAISE")  && ..Expression(subElement,.addedElement)  && ..RaiseStmt23OptGrp(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

/// 
/// summary=K&C
Method RaiseStmt23OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"FROM")  && ..Expression(subElement,.addedElement)  {
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

///  real_number: | NUMBER
/// summary=?4punctuation:4?
Method RealNumber(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..Number(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  return_stmt: | 'return' [star_expressions]
/// summary=?4punctuation:4?
Method ReturnStmt(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..ReturnStmt21Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&K&[C]
Method ReturnStmt21Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"RETURN")  && $S(..StarExpressions(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  sequence_pattern: | '[' maybe_sequence_pattern? ']' | '(' open_sequence_pattern? ')'
/// summary=?4punctuation:4?&?4punctuation:4?
Method SequencePattern(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..SequencePattern155Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..SequencePattern156Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&P&?4OptionalSingle4?&P
Method SequencePattern155Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"[")  && $s(..MaybeSequencePattern(subElement,.addedElement) :1,1:1)  && ..addPunctuation(subElement,"]")  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

/// 
/// summary=&P&?4OptionalSingle4?&P
Method SequencePattern156Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"(")  && $s(..OpenSequencePattern(subElement,.addedElement) :1,1:1)  && ..addPunctuation(subElement,")")  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  set: '{' star_named_expressions '}'
/// summary=P&C&P
Method Set(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..addPunctuation(subElement,"{")  && ..StarNamedExpressions(subElement,.addedElement)  && ..addPunctuation(subElement,"}")  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  setcomp: | '{' named_expression for_if_clauses '}'
/// summary=?4punctuation:4?
Method Setcomp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..Setcomp315Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&P&C&C&P
Method Setcomp315Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"{")  && ..NamedExpression(subElement,.addedElement)  && ..ForIfClauses(subElement,.addedElement)  && ..addPunctuation(subElement,"}")  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  shift_expr: | shift_expr '<<' sum | shift_expr '>>' sum | sum
Method ShiftExpr(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	set done=0,ok=1,pos=..stream.pos,lastpos=pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set ok=($isobject(subElement))
		if ok $$$BNFCOMMITCOPY(subElement,ParentElement)
		quit ok
	}
	$$$BNFMEMOSET(pos,"")
	do ..getBookmark(.bm)
	while ok {
		$$$BNFSTART(subElement)
		do ..gotoBookmark(.bm)
		set rec=..ShiftExpr218Recurse(subElement,.addedElement)
		if rec,..stream.pos>lastpos {
			$$$BNFMEMOSET(pos,addedElement)
			set done=1,lastpos=..stream.pos
		} else {
			set ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best 
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 1
		set ok=1
	} else {
		if $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=?4punctuation:4?&?4punctuation:4?&?4punctuation:4?
Method ShiftExpr218Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..ShiftExpr219Or(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ShiftExpr220Or(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Sum(subElement,.addedElement)  {
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

/// 
/// summary=&C&P&C
Method ShiftExpr219Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ShiftExpr(subElement,.addedElement)  && ..addPunctuation(subElement,"<<")  && ..Sum(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&C&P&C
Method ShiftExpr220Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ShiftExpr(subElement,.addedElement)  && ..addPunctuation(subElement,">>")  && ..Sum(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  signed_number: | NUMBER | '-' NUMBER
/// summary=?4punctuation:4?&?4punctuation:4?
Method SignedNumber(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..Number(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..SignedNumber144Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&P&C
Method SignedNumber144Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"-")  && ..Number(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  signed_real_number: | real_number | '-' real_number
/// summary=?4punctuation:4?&?4punctuation:4?
Method SignedRealNumber(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..RealNumber(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..SignedRealNumber145Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&P&C
Method SignedRealNumber145Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"-")  && ..RealNumber(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  simple_stmt: | assignment | type_alias | star_expressions | return_stmt | import_stmt | raise_stmt | 'pass' | del_stmt | yield_stmt | assert_stmt | 'break' | 'continue' | global_stmt | nonlocal_stmt
/// summary=?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?
Method SimpleStmt(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..Assignment(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..TypeAlias(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..StarExpressions(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..ReturnStmt(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..ImportStmt(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..RaiseStmt(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..addKeyword(subElement,"PASS")  {
			set done=1 ; or
		} elseif ..DelStmt(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..YieldStmt(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..AssertStmt(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..addKeyword(subElement,"BREAK")  {
			set done=1 ; or
		} elseif ..addKeyword(subElement,"CONTINUE")  {
			set done=1 ; or
		} elseif ..GlobalStmt(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..NonlocalStmt(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  simple_stmts: | simple_stmt !';' NEWLINE | ';'.simple_stmt+ [';'] NEWLINE
/// summary=?4punctuation:4?&?4punctuation:4?
Method SimpleStmts(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..SimpleStmts5Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..SimpleStmts7Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&C&?4NotRule4?&C
Method SimpleStmts5Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..SimpleStmt(subElement,.addedElement)  && ..SimpleStmts6Not(subElement,.addedElement)  && ..Newline(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

/// ';'
Method SimpleStmts6Not(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,";")  { set done=1 }
	$$$BNFROLLBACK(subElement)
	if done {
		set ok=0
	} else {
		set ok=1
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&?4RepeatSep4?&[P]&C
Method SimpleStmts7Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..SimpleStmts8RepSep(subElement,.addedElement)  && $S(..addPunctuation(subElement,";") :1,1:1) && ..Newline(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  ';'.simple_stmt+
Method SimpleStmts8RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set done=0 ; must be at least 1
	if ..SimpleStmt(subElement,.addedElement) {
		set done=1,ok=1 ; found 1
		do {
			$$$BNFSTART(repElement)
			set ok=(..addPunctuation(repElement,";")  && ..SimpleStmt(repElement,.addedElement) )
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
		set ok=0 ; normal rollback
	}
	quit ok
}

///  single_subscript_attribute_target: | t_primary '.' NAME !t_lookahead | t_primary '[' slices ']' !t_lookahead
/// summary=?4punctuation:4?&?4punctuation:4?
Method SingleSubscriptAttributeTarget(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..SingleSubscriptAttributeTarget369Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..SingleSubscriptAttributeTarget371Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&C&P&C&?4NotRule4?
Method SingleSubscriptAttributeTarget369Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..TPrimary(subElement,.addedElement)  && ..addPunctuation(subElement,".")  && ..Name(subElement,.addedElement)  && ..SingleSubscriptAttributeTarget370Not(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

/// t_lookahead
Method SingleSubscriptAttributeTarget370Not(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..TLookahead(subElement,.addedElement)  { set done=1 }
	$$$BNFROLLBACK(subElement)
	if done {
		set ok=0
	} else {
		set ok=1
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&C&P&C&P&?4NotRule4?
Method SingleSubscriptAttributeTarget371Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..TPrimary(subElement,.addedElement)  && ..addPunctuation(subElement,"[")  && ..Slices(subElement,.addedElement)  && ..addPunctuation(subElement,"]")  && ..SingleSubscriptAttributeTarget372Not(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

/// t_lookahead
Method SingleSubscriptAttributeTarget372Not(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..TLookahead(subElement,.addedElement)  { set done=1 }
	$$$BNFROLLBACK(subElement)
	if done {
		set ok=0
	} else {
		set ok=1
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  single_target: | single_subscript_attribute_target | NAME | '(' single_target ')'
Method SingleTarget(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	set done=0,ok=1,pos=..stream.pos,lastpos=pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set ok=($isobject(subElement))
		if ok $$$BNFCOMMITCOPY(subElement,ParentElement)
		quit ok
	}
	$$$BNFMEMOSET(pos,"")
	do ..getBookmark(.bm)
	while ok {
		$$$BNFSTART(subElement)
		do ..gotoBookmark(.bm)
		set rec=..SingleTarget367Recurse(subElement,.addedElement)
		if rec,..stream.pos>lastpos {
			$$$BNFMEMOSET(pos,addedElement)
			set done=1,lastpos=..stream.pos
		} else {
			set ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best 
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 1
		set ok=1
	} else {
		if $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=?4punctuation:4?&?4punctuation:4?&?4punctuation:4?
Method SingleTarget367Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..SingleSubscriptAttributeTarget(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Name(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SingleTarget368Or(subElement,.addedElement)  {
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

/// 
/// summary=&P&C&P
Method SingleTarget368Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"(")  && ..SingleTarget(subElement,.addedElement)  && ..addPunctuation(subElement,")")  {
		set done=1 ; end compileRules
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  slash_no_default: | param_no_default+ '/' ',' | param_no_default+ '/' &')'
/// summary=?4punctuation:4?&?4punctuation:4?
Method SlashNoDefault(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..SlashNoDefault68Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..SlashNoDefault70Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&(?4Call:4?)+&P&P
Method SlashNoDefault68Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..SlashNoDefault69RepOne(subElement,.addedElement)  && ..addPunctuation(subElement,"/")  && ..addPunctuation(subElement,",")  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  param_no_default+
Method SlashNoDefault69RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..ParamNoDefault(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

/// 
/// summary=&(?4Call:4?)+&P&?4LookAhead4?
Method SlashNoDefault70Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..SlashNoDefault71RepOne(subElement,.addedElement)  && ..addPunctuation(subElement,"/")  && ..SlashNoDefault72Peek(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  param_no_default+
Method SlashNoDefault71RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..ParamNoDefault(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  &')'
Method SlashNoDefault72Peek(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; ruleE=LookAheadRule :')'
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,")")  {
		set done=1
	}
	if done {
		set ok=1
		$$$BNFROLLBACK(subElement)
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  slash_with_default: | param_no_default* param_with_default+ '/' ',' | param_no_default* param_with_default+ '/' &')'
/// summary=?4punctuation:4?&?4punctuation:4?
Method SlashWithDefault(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..SlashWithDefault73Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..SlashWithDefault76Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&(?4Call:4?)*&(?4Call:4?)+&P&P
Method SlashWithDefault73Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..SlashWithDefault74RepZero(subElement,.addedElement)  && ..SlashWithDefault75RepOne(subElement,.addedElement)  && ..addPunctuation(subElement,"/")  && ..addPunctuation(subElement,",")  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  param_no_default*
Method SlashWithDefault74RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	while ..ParamNoDefault(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  param_with_default+
Method SlashWithDefault75RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..ParamWithDefault(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

/// 
/// summary=&(?4Call:4?)*&(?4Call:4?)+&P&?4LookAhead4?
Method SlashWithDefault76Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..SlashWithDefault77RepZero(subElement,.addedElement)  && ..SlashWithDefault78RepOne(subElement,.addedElement)  && ..addPunctuation(subElement,"/")  && ..SlashWithDefault79Peek(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  param_no_default*
Method SlashWithDefault77RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	while ..ParamNoDefault(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  param_with_default+
Method SlashWithDefault78RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..ParamWithDefault(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  &')'
Method SlashWithDefault79Peek(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; ruleE=LookAheadRule :')'
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,")")  {
		set done=1
	}
	if done {
		set ok=1
		$$$BNFROLLBACK(subElement)
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  slice: | [expression] ':' [expression] [':' [expression] ] | named_expression
/// summary=?4punctuation:4?&?4punctuation:4?
Method Slice(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..Slice247Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..NamedExpression(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&[C]&P&[C]&[P&[C]]
Method Slice247Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if $S(..Expression(subElement,.addedElement) :1,1:1) && ..addPunctuation(subElement,":")  && $S(..Expression(subElement,.addedElement) :1,1:1) && ..Slice248OptGrp(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

/// 
/// summary=P&[C]
Method Slice248OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,":")  && $S(..Expression(subElement,.addedElement) :1,1:1) {
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

///  slices: | slice !',' | ','.(slice | starred_expression)+ [',']
/// summary=?4punctuation:4?&?4punctuation:4?
Method Slices(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..Slices241Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..Slices243Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&C&?4NotRule4?
Method Slices241Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Slice(subElement,.addedElement)  && ..Slices242Not(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

/// ','
Method Slices242Not(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  { set done=1 }
	$$$BNFROLLBACK(subElement)
	if done {
		set ok=0
	} else {
		set ok=1
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&?4RepeatSep4?&[P]
Method Slices243Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Slices244RepSep(subElement,.addedElement)  && $S(..addPunctuation(subElement,",") :1,1:1) {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  ','.(slice | starred_expression)+
Method Slices244RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set done=0 ; must be at least 1
	if ..Slices245Sub(subElement,.addedElement) {
		set done=1,ok=1 ; found 1
		do {
			$$$BNFSTART(repElement)
			set ok=(..addPunctuation(repElement,",")  && ..Slices246Sub(repElement,.addedElement) )
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
		set ok=0 ; normal rollback
	}
	quit ok
}

/// slice | starred_expression
/// summary=C&?4punctuation:4?
Method Slices245Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Slice(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StarredExpression(subElement,.addedElement)  {
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

/// slice | starred_expression
/// summary=C&?4punctuation:4?
Method Slices246Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Slice(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StarredExpression(subElement,.addedElement)  {
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

///  star_annotation: ':' star_expression
/// summary=P&C
Method StarAnnotation(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..addPunctuation(subElement,":")  && ..StarExpression(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  star_atom: | NAME | '(' target_with_star_atom ')' | '(' [star_targets_tuple_seq] ')' | '[' [star_targets_list_seq] ']'
/// summary=?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?
Method StarAtom(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..Name(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..StarAtom364Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..StarAtom365Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..StarAtom366Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&P&C&P
Method StarAtom364Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"(")  && ..TargetWithStarAtom(subElement,.addedElement)  && ..addPunctuation(subElement,")")  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

/// 
/// summary=&P&[C]&P
Method StarAtom365Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"(")  && $S(..StarTargetsTupleSeq(subElement,.addedElement) :1,1:1) && ..addPunctuation(subElement,")")  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

/// 
/// summary=&P&[C]&P
Method StarAtom366Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"[")  && $S(..StarTargetsListSeq(subElement,.addedElement) :1,1:1) && ..addPunctuation(subElement,"]")  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  star_etc: | '*' param_no_default param_maybe_default* [kwds] | '*' param_no_default_star_annotation param_maybe_default* [kwds] | '*' ',' param_maybe_default+ [kwds] | kwds
/// summary=?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?
Method StarEtc(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..StarEtc80Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..StarEtc82Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..StarEtc84Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..Kwds(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&P&C&(?4Call:4?)*&[C]
Method StarEtc80Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"*")  && ..ParamNoDefault(subElement,.addedElement)  && ..StarEtc81RepZero(subElement,.addedElement)  && $S(..Kwds(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  param_maybe_default*
Method StarEtc81RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	while ..ParamMaybeDefault(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// 
/// summary=&P&C&(?4Call:4?)*&[C]
Method StarEtc82Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"*")  && ..ParamNoDefaultStarAnnotation(subElement,.addedElement)  && ..StarEtc83RepZero(subElement,.addedElement)  && $S(..Kwds(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  param_maybe_default*
Method StarEtc83RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	while ..ParamMaybeDefault(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// 
/// summary=&P&P&(?4Call:4?)+&[C]
Method StarEtc84Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"*")  && ..addPunctuation(subElement,",")  && ..StarEtc85RepOne(subElement,.addedElement)  && $S(..Kwds(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  param_maybe_default+
Method StarEtc85RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..ParamMaybeDefault(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  star_expression: | '*' bitwise_or | expression
/// summary=?4punctuation:4?&?4punctuation:4?
Method StarExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..StarExpression194Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..Expression(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&P&C
Method StarExpression194Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"*")  && ..BitwiseOr(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  star_expressions: | star_expression (',' star_expression )+ [','] | star_expression ',' | star_expression
/// summary=?4punctuation:4?&?4punctuation:4?&?4punctuation:4?
Method StarExpressions(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..StarExpressions190Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..StarExpressions193Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..StarExpression(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&C&(?4punctuation:4?)+&[P]
Method StarExpressions190Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..StarExpression(subElement,.addedElement)  && ..StarExpressions191RepOne(subElement,.addedElement)  && $S(..addPunctuation(subElement,",") :1,1:1) {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  (',' star_expression )+
Method StarExpressions191RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..StarExpressions192Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

/// ',' star_expression
/// summary=P&C
Method StarExpressions192Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  && ..StarExpression(subElement,.addedElement)  {
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

/// 
/// summary=&C&P
Method StarExpressions193Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..StarExpression(subElement,.addedElement)  && ..addPunctuation(subElement,",")  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  star_named_expression: | '*' bitwise_or | named_expression
/// summary=?4punctuation:4?&?4punctuation:4?
Method StarNamedExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..StarNamedExpression196Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..NamedExpression(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&P&C
Method StarNamedExpression196Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"*")  && ..BitwiseOr(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  star_named_expressions: ','.star_named_expression+ [',']
/// summary=?4RepeatSep4?&[P]
Method StarNamedExpressions(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..StarNamedExpressions195RepSep(subElement,.addedElement)  && $S(..addPunctuation(subElement,",") :1,1:1) {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ','.star_named_expression+
Method StarNamedExpressions195RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set done=0 ; must be at least 1
	if ..StarNamedExpression(subElement,.addedElement) {
		set done=1,ok=1 ; found 1
		do {
			$$$BNFSTART(repElement)
			set ok=(..addPunctuation(repElement,",")  && ..StarNamedExpression(repElement,.addedElement) )
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
		set ok=0 ; normal rollback
	}
	quit ok
}

///  star_pattern: | '*' pattern_capture_target | '*' wildcard_pattern
/// summary=?4punctuation:4?&?4punctuation:4?
Method StarPattern(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..StarPattern160Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..StarPattern161Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&P&C
Method StarPattern160Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"*")  && ..PatternCaptureTarget(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

/// 
/// summary=&P&C
Method StarPattern161Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"*")  && ..WildcardPattern(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  star_target: | '*' (!'*' star_target) | target_with_star_atom
/// summary=?4punctuation:4?&?4punctuation:4?
Method StarTarget(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..StarTarget357Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..TargetWithStarAtom(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&P&(?4NotRule4?&C)
Method StarTarget357Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"*")  && ..StarTarget358Sub(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

/// !'*' star_target
/// summary=?4NotRule4?&C
Method StarTarget358Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..StarTarget359Not(subElement,.addedElement)  && ..StarTarget(subElement,.addedElement)  {
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

/// '*'
Method StarTarget359Not(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"*")  { set done=1 }
	$$$BNFROLLBACK(subElement)
	if done {
		set ok=0
	} else {
		set ok=1
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  star_targets: | star_target !',' | star_target (',' star_target )* [',']
/// summary=?4punctuation:4?&?4punctuation:4?
Method StarTargets(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..StarTargets347Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..StarTargets349Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&C&?4NotRule4?
Method StarTargets347Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..StarTarget(subElement,.addedElement)  && ..StarTargets348Not(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

/// ','
Method StarTargets348Not(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  { set done=1 }
	$$$BNFROLLBACK(subElement)
	if done {
		set ok=0
	} else {
		set ok=1
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&C&(?4punctuation:4?)*&[P]
Method StarTargets349Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..StarTarget(subElement,.addedElement)  && ..StarTargets350RepZero(subElement,.addedElement)  && $S(..addPunctuation(subElement,",") :1,1:1) {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  (',' star_target )*
Method StarTargets350RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	while ..StarTargets351Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// ',' star_target
/// summary=P&C
Method StarTargets351Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  && ..StarTarget(subElement,.addedElement)  {
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

///  star_targets_list_seq: ','.star_target+ [',']
/// summary=?4RepeatSep4?&[P]
Method StarTargetsListSeq(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..StarTargetsListSeq352RepSep(subElement,.addedElement)  && $S(..addPunctuation(subElement,",") :1,1:1) {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ','.star_target+
Method StarTargetsListSeq352RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set done=0 ; must be at least 1
	if ..StarTarget(subElement,.addedElement) {
		set done=1,ok=1 ; found 1
		do {
			$$$BNFSTART(repElement)
			set ok=(..addPunctuation(repElement,",")  && ..StarTarget(repElement,.addedElement) )
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
		set ok=0 ; normal rollback
	}
	quit ok
}

///  star_targets_tuple_seq: | star_target (',' star_target )+ [','] | star_target ','
/// summary=?4punctuation:4?&?4punctuation:4?
Method StarTargetsTupleSeq(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..StarTargetsTupleSeq353Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..StarTargetsTupleSeq356Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&C&(?4punctuation:4?)+&[P]
Method StarTargetsTupleSeq353Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..StarTarget(subElement,.addedElement)  && ..StarTargetsTupleSeq354RepOne(subElement,.addedElement)  && $S(..addPunctuation(subElement,",") :1,1:1) {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  (',' star_target )+
Method StarTargetsTupleSeq354RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..StarTargetsTupleSeq355Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

/// ',' star_target
/// summary=P&C
Method StarTargetsTupleSeq355Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  && ..StarTarget(subElement,.addedElement)  {
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

/// 
/// summary=&C&P
Method StarTargetsTupleSeq356Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..StarTarget(subElement,.addedElement)  && ..addPunctuation(subElement,",")  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  starred_expression: | '*' expression
/// summary=?4punctuation:4?
Method StarredExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..StarredExpression343Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&P&C
Method StarredExpression343Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"*")  && ..Expression(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  statement: compound_stmt | simple_stmts
/// summary=C&?4punctuation:4?
Method Statement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..CompoundStmt(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..SimpleStmts(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  statement_newline: | compound_stmt NEWLINE | simple_stmts | NEWLINE | ENDMARKER
/// summary=?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?
Method StatementNewline(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..StatementNewline4Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..SimpleStmts(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..Newline(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..Endmarker(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&C&C
Method StatementNewline4Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..CompoundStmt(subElement,.addedElement)  && ..Newline(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  statements: statement+
/// summary=(?4Call:4?)+
Method Statements(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..Statements3RepOne(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  statement+
Method Statements3RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..Statement(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  string: STRING
Method String(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	set done=0,ok=1,pos=..stream.pos,lastpos=pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set ok=($isobject(subElement))
		if ok $$$BNFCOMMITCOPY(subElement,ParentElement)
		quit ok
	}
	$$$BNFMEMOSET(pos,"")
	do ..getBookmark(.bm)
	while ok {
		$$$BNFSTART(subElement)
		do ..gotoBookmark(.bm)
		set rec=..String298Recurse(subElement,.addedElement)
		if rec,..stream.pos>lastpos {
			$$$BNFMEMOSET(pos,addedElement)
			set done=1,lastpos=..stream.pos
		} else {
			set ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best 
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 1
		set ok=1
	} else {
		if $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=C
Method String298Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..String(subElement,.addedElement)  {
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

///  strings: (fstring|string)+
/// summary=(?4punctuation:4?)+
Method Strings(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..Strings299RepOne(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  (fstring|string)+
Method Strings299RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..Strings300Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

/// fstring|string
/// summary=C&?4punctuation:4?
Method Strings300Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Fstring(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..String(subElement,.addedElement)  {
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

///  subject_expr: | star_named_expression ',' star_named_expressions? | named_expression
/// summary=?4punctuation:4?&?4punctuation:4?
Method SubjectExpr(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..SubjectExpr132Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..NamedExpression(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&C&P&?4OptionalSingle4?
Method SubjectExpr132Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..StarNamedExpression(subElement,.addedElement)  && ..addPunctuation(subElement,",")  && $s(..StarNamedExpressions(subElement,.addedElement) :1,1:1)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  sum: | sum '+' term | sum '-' term | term
Method Sum(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	set done=0,ok=1,pos=..stream.pos,lastpos=pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set ok=($isobject(subElement))
		if ok $$$BNFCOMMITCOPY(subElement,ParentElement)
		quit ok
	}
	$$$BNFMEMOSET(pos,"")
	do ..getBookmark(.bm)
	while ok {
		$$$BNFSTART(subElement)
		do ..gotoBookmark(.bm)
		set rec=..Sum221Recurse(subElement,.addedElement)
		if rec,..stream.pos>lastpos {
			$$$BNFMEMOSET(pos,addedElement)
			set done=1,lastpos=..stream.pos
		} else {
			set ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best 
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 1
		set ok=1
	} else {
		if $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=?4punctuation:4?&?4punctuation:4?&?4punctuation:4?
Method Sum221Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..Sum222Or(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Sum223Or(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Term(subElement,.addedElement)  {
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

/// 
/// summary=&C&P&C
Method Sum222Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Sum(subElement,.addedElement)  && ..addPunctuation(subElement,"+")  && ..Term(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&C&P&C
Method Sum223Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Sum(subElement,.addedElement)  && ..addPunctuation(subElement,"-")  && ..Term(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  t_lookahead: '(' | '[' | '.'
/// summary=P&?4punctuation:4?&?4punctuation:4?
Method TLookahead(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..addPunctuation(subElement,"(")  {
			set done=1 ; or
		} elseif ..addPunctuation(subElement,"[")  {
			set done=1 ; or
		} elseif ..addPunctuation(subElement,".")  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  t_primary: | t_primary '.' NAME &t_lookahead | t_primary '[' slices ']' &t_lookahead | t_primary genexp &t_lookahead | t_primary '(' [arguments] ')' &t_lookahead | atom &t_lookahead
Method TPrimary(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	set done=0,ok=1,pos=..stream.pos,lastpos=pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set ok=($isobject(subElement))
		if ok $$$BNFCOMMITCOPY(subElement,ParentElement)
		quit ok
	}
	$$$BNFMEMOSET(pos,"")
	do ..getBookmark(.bm)
	while ok {
		$$$BNFSTART(subElement)
		do ..gotoBookmark(.bm)
		set rec=..TPrimary373Recurse(subElement,.addedElement)
		if rec,..stream.pos>lastpos {
			$$$BNFMEMOSET(pos,addedElement)
			set done=1,lastpos=..stream.pos
		} else {
			set ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best 
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 1
		set ok=1
	} else {
		if $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?
Method TPrimary373Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..TPrimary374Or(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..TPrimary376Or(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..TPrimary378Or(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..TPrimary380Or(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..TPrimary382Or(subElement,.addedElement)  {
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

/// 
/// summary=&C&P&C&?4LookAhead4?
Method TPrimary374Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..TPrimary(subElement,.addedElement)  && ..addPunctuation(subElement,".")  && ..Name(subElement,.addedElement)  && ..TPrimary375Peek(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  &t_lookahead
Method TPrimary375Peek(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; ruleE=LookAheadRule :t_lookahead
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..TLookahead(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
		$$$BNFROLLBACK(subElement)
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&C&P&C&P&?4LookAhead4?
Method TPrimary376Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..TPrimary(subElement,.addedElement)  && ..addPunctuation(subElement,"[")  && ..Slices(subElement,.addedElement)  && ..addPunctuation(subElement,"]")  && ..TPrimary377Peek(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  &t_lookahead
Method TPrimary377Peek(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; ruleE=LookAheadRule :t_lookahead
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..TLookahead(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
		$$$BNFROLLBACK(subElement)
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&C&C&?4LookAhead4?
Method TPrimary378Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..TPrimary(subElement,.addedElement)  && ..Genexp(subElement,.addedElement)  && ..TPrimary379Peek(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  &t_lookahead
Method TPrimary379Peek(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; ruleE=LookAheadRule :t_lookahead
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..TLookahead(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
		$$$BNFROLLBACK(subElement)
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&C&P&[C]&P&?4LookAhead4?
Method TPrimary380Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..TPrimary(subElement,.addedElement)  && ..addPunctuation(subElement,"(")  && $S(..Arguments(subElement,.addedElement) :1,1:1) && ..addPunctuation(subElement,")")  && ..TPrimary381Peek(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  &t_lookahead
Method TPrimary381Peek(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; ruleE=LookAheadRule :t_lookahead
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..TLookahead(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
		$$$BNFROLLBACK(subElement)
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&C&?4LookAhead4?
Method TPrimary382Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Atom(subElement,.addedElement)  && ..TPrimary383Peek(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  &t_lookahead
Method TPrimary383Peek(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; ruleE=LookAheadRule :t_lookahead
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..TLookahead(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
		$$$BNFROLLBACK(subElement)
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  target_with_star_atom: | t_primary '.' NAME !t_lookahead | t_primary '[' slices ']' !t_lookahead | star_atom
/// summary=?4punctuation:4?&?4punctuation:4?&?4punctuation:4?
Method TargetWithStarAtom(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..TargetWithStarAtom360Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..TargetWithStarAtom362Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..StarAtom(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&C&P&C&?4NotRule4?
Method TargetWithStarAtom360Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..TPrimary(subElement,.addedElement)  && ..addPunctuation(subElement,".")  && ..Name(subElement,.addedElement)  && ..TargetWithStarAtom361Not(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

/// t_lookahead
Method TargetWithStarAtom361Not(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..TLookahead(subElement,.addedElement)  { set done=1 }
	$$$BNFROLLBACK(subElement)
	if done {
		set ok=0
	} else {
		set ok=1
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&C&P&C&P&?4NotRule4?
Method TargetWithStarAtom362Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..TPrimary(subElement,.addedElement)  && ..addPunctuation(subElement,"[")  && ..Slices(subElement,.addedElement)  && ..addPunctuation(subElement,"]")  && ..TargetWithStarAtom363Not(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

/// t_lookahead
Method TargetWithStarAtom363Not(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..TLookahead(subElement,.addedElement)  { set done=1 }
	$$$BNFROLLBACK(subElement)
	if done {
		set ok=0
	} else {
		set ok=1
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  term: | term '*' factor | term '/' factor | term '//' factor | term '%' factor | term '@' factor | factor
Method Term(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	set done=0,ok=1,pos=..stream.pos,lastpos=pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set ok=($isobject(subElement))
		if ok $$$BNFCOMMITCOPY(subElement,ParentElement)
		quit ok
	}
	$$$BNFMEMOSET(pos,"")
	do ..getBookmark(.bm)
	while ok {
		$$$BNFSTART(subElement)
		do ..gotoBookmark(.bm)
		set rec=..Term224Recurse(subElement,.addedElement)
		if rec,..stream.pos>lastpos {
			$$$BNFMEMOSET(pos,addedElement)
			set done=1,lastpos=..stream.pos
		} else {
			set ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best 
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 1
		set ok=1
	} else {
		if $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?
Method Term224Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..Term225Or(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Term226Or(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Term227Or(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Term228Or(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Term229Or(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Factor(subElement,.addedElement)  {
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

/// 
/// summary=&C&P&C
Method Term225Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Term(subElement,.addedElement)  && ..addPunctuation(subElement,"*")  && ..Factor(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&C&P&C
Method Term226Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Term(subElement,.addedElement)  && ..addPunctuation(subElement,"/")  && ..Factor(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&C&P&C
Method Term227Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Term(subElement,.addedElement)  && ..addPunctuation(subElement,"//")  && ..Factor(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&C&P&C
Method Term228Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Term(subElement,.addedElement)  && ..addPunctuation(subElement,"%")  && ..Factor(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&C&P&C
Method Term229Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Term(subElement,.addedElement)  && ..addPunctuation(subElement,"@")  && ..Factor(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  try_stmt: | 'try' ':' block finally_block | 'try' ':' block except_block+ [else_block] [finally_block] | 'try' ':' block except_star_block+ [else_block] [finally_block]
/// summary=?4punctuation:4?&?4punctuation:4?&?4punctuation:4?
Method TryStmt(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..TryStmt119Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..TryStmt120Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..TryStmt122Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&K&P&C&C
Method TryStmt119Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"TRY")  && ..addPunctuation(subElement,":")  && ..Block(subElement,.addedElement)  && ..FinallyBlock(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

/// 
/// summary=&K&P&C&(?4Call:4?)+&[C]&[C]
Method TryStmt120Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"TRY")  && ..addPunctuation(subElement,":")  && ..Block(subElement,.addedElement)  && ..TryStmt121RepOne(subElement,.addedElement)  && $S(..ElseBlock(subElement,.addedElement) :1,1:1) && $S(..FinallyBlock(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  except_block+
Method TryStmt121RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..ExceptBlock(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

/// 
/// summary=&K&P&C&(?4Call:4?)+&[C]&[C]
Method TryStmt122Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"TRY")  && ..addPunctuation(subElement,":")  && ..Block(subElement,.addedElement)  && ..TryStmt123RepOne(subElement,.addedElement)  && $S(..ElseBlock(subElement,.addedElement) :1,1:1) && $S(..FinallyBlock(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  except_star_block+
Method TryStmt123RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..ExceptStarBlock(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  tuple: | '(' [star_named_expression ',' [star_named_expressions] ] ')'
/// summary=?4punctuation:4?
Method Tuple(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..Tuple302Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&P&[C&P&[C]]&P
Method Tuple302Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"(")  && ..Tuple303OptGrp(subElement,.addedElement)  && ..addPunctuation(subElement,")")  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

/// 
/// summary=C&P&[C]
Method Tuple303OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..StarNamedExpression(subElement,.addedElement)  && ..addPunctuation(subElement,",")  && $S(..StarNamedExpressions(subElement,.addedElement) :1,1:1) {
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

///  type_alias: | "type" NAME [type_params] '=' expression
/// summary=?4punctuation:4?
Method TypeAlias(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..TypeAlias177Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&K&C&[C]&P&C
Method TypeAlias177Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"TYPE")  && ..Name(subElement,.addedElement)  && $S(..TypeParams(subElement,.addedElement) :1,1:1) && ..addPunctuation(subElement,"=")  && ..Expression(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  TYPE_COMMENT : 'code type_comment'
/// summary=P
Method TypeComment(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..addPunctuation(subElement,"code type_comment")  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  type_expressions: | ','.expression+ ',' '*' expression ',' '**' expression | ','.expression+ ',' '*' expression | ','.expression+ ',' '**' expression | '*' expression ',' '**' expression | '*' expression | '**' expression | ','.expression+
/// summary=?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?
Method TypeExpressions(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..TypeExpressions392Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..TypeExpressions394Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..TypeExpressions396Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..TypeExpressions398Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..TypeExpressions399Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..TypeExpressions400Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..TypeExpressions401RepSep(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&?4RepeatSep4?&P&P&C&P&P&C
Method TypeExpressions392Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..TypeExpressions393RepSep(subElement,.addedElement)  && ..addPunctuation(subElement,",")  && ..addPunctuation(subElement,"*")  && ..Expression(subElement,.addedElement)  && ..addPunctuation(subElement,",")  && ..addPunctuation(subElement,"**")  && ..Expression(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  ','.expression+
Method TypeExpressions393RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set done=0 ; must be at least 1
	if ..Expression(subElement,.addedElement) {
		set done=1,ok=1 ; found 1
		do {
			$$$BNFSTART(repElement)
			set ok=(..addPunctuation(repElement,",")  && ..Expression(repElement,.addedElement) )
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
		set ok=0 ; normal rollback
	}
	quit ok
}

/// 
/// summary=&?4RepeatSep4?&P&P&C
Method TypeExpressions394Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..TypeExpressions395RepSep(subElement,.addedElement)  && ..addPunctuation(subElement,",")  && ..addPunctuation(subElement,"*")  && ..Expression(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  ','.expression+
Method TypeExpressions395RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set done=0 ; must be at least 1
	if ..Expression(subElement,.addedElement) {
		set done=1,ok=1 ; found 1
		do {
			$$$BNFSTART(repElement)
			set ok=(..addPunctuation(repElement,",")  && ..Expression(repElement,.addedElement) )
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
		set ok=0 ; normal rollback
	}
	quit ok
}

/// 
/// summary=&?4RepeatSep4?&P&P&C
Method TypeExpressions396Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..TypeExpressions397RepSep(subElement,.addedElement)  && ..addPunctuation(subElement,",")  && ..addPunctuation(subElement,"**")  && ..Expression(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  ','.expression+
Method TypeExpressions397RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set done=0 ; must be at least 1
	if ..Expression(subElement,.addedElement) {
		set done=1,ok=1 ; found 1
		do {
			$$$BNFSTART(repElement)
			set ok=(..addPunctuation(repElement,",")  && ..Expression(repElement,.addedElement) )
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
		set ok=0 ; normal rollback
	}
	quit ok
}

/// 
/// summary=&P&C&P&P&C
Method TypeExpressions398Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"*")  && ..Expression(subElement,.addedElement)  && ..addPunctuation(subElement,",")  && ..addPunctuation(subElement,"**")  && ..Expression(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

/// 
/// summary=&P&C
Method TypeExpressions399Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"*")  && ..Expression(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

/// 
/// summary=&P&C
Method TypeExpressions400Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"**")  && ..Expression(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  ','.expression+
Method TypeExpressions401RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set done=0 ; must be at least 1
	if ..Expression(subElement,.addedElement) {
		set done=1,ok=1 ; found 1
		do {
			$$$BNFSTART(repElement)
			set ok=(..addPunctuation(repElement,",")  && ..Expression(repElement,.addedElement) )
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
		set ok=0 ; normal rollback
	}
	quit ok
}

///  type_param: | NAME [type_param_bound] [type_param_default] | '*' NAME [type_param_starred_default] | '**' NAME [type_param_default]
/// summary=?4punctuation:4?&?4punctuation:4?&?4punctuation:4?
Method TypeParam(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..TypeParam179Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..TypeParam180Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..TypeParam181Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&C&[C]&[C]
Method TypeParam179Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Name(subElement,.addedElement)  && $S(..TypeParamBound(subElement,.addedElement) :1,1:1) && $S(..TypeParamDefault(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

/// 
/// summary=&P&C&[C]
Method TypeParam180Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"*")  && ..Name(subElement,.addedElement)  && $S(..TypeParamStarredDefault(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

/// 
/// summary=&P&C&[C]
Method TypeParam181Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"**")  && ..Name(subElement,.addedElement)  && $S(..TypeParamDefault(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  type_param_bound: ':' expression
/// summary=P&C
Method TypeParamBound(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..addPunctuation(subElement,":")  && ..Expression(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  type_param_default: '=' expression
/// summary=P&C
Method TypeParamDefault(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..addPunctuation(subElement,"=")  && ..Expression(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  type_param_seq: ','.type_param+ [',']
/// summary=?4RepeatSep4?&[P]
Method TypeParamSeq(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..TypeParamSeq178RepSep(subElement,.addedElement)  && $S(..addPunctuation(subElement,",") :1,1:1) {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  ','.type_param+
Method TypeParamSeq178RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set done=0 ; must be at least 1
	if ..TypeParam(subElement,.addedElement) {
		set done=1,ok=1 ; found 1
		do {
			$$$BNFSTART(repElement)
			set ok=(..addPunctuation(repElement,",")  && ..TypeParam(repElement,.addedElement) )
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
		set ok=0 ; normal rollback
	}
	quit ok
}

///  type_param_starred_default: '=' star_expression
/// summary=P&C
Method TypeParamStarredDefault(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..addPunctuation(subElement,"=")  && ..StarExpression(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  type_params: '[' type_param_seq ']'
/// summary=P&C&P
Method TypeParams(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..addPunctuation(subElement,"[")  && ..TypeParamSeq(subElement,.addedElement)  && ..addPunctuation(subElement,"]")  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  value_pattern: | attr !('.' | '(' | '=')
/// summary=?4punctuation:4?
Method ValuePattern(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..ValuePattern150Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&C&?4NotRule4?
Method ValuePattern150Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Attr(subElement,.addedElement)  && ..ValuePattern151Not(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

/// ('.' | '(' | '=')
Method ValuePattern151Not(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ValuePattern152Sub(subElement,.addedElement)  { set done=1 }
	$$$BNFROLLBACK(subElement)
	if done {
		set ok=0
	} else {
		set ok=1
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// '.' | '(' | '='
/// summary=P&?4punctuation:4?&?4punctuation:4?
Method ValuePattern152Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,".")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"(")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"=")  {
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

///  while_stmt: | 'while' named_expression ':' block [else_block]
/// summary=?4punctuation:4?
Method WhileStmt(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..WhileStmt105Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&K&C&P&C&[C]
Method WhileStmt105Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"WHILE")  && ..NamedExpression(subElement,.addedElement)  && ..addPunctuation(subElement,":")  && ..Block(subElement,.addedElement)  && $S(..ElseBlock(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  wildcard_pattern: | "_"
/// summary=?4punctuation:4?
Method WildcardPattern(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..addPunctuation(subElement,"_")  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  with_item: | expression 'as' star_target &(',' | ')' | ':') | expression
/// summary=?4punctuation:4?&?4punctuation:4?
Method WithItem(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..WithItem116Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..Expression(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&C&K&C&?4LookAhead4?
Method WithItem116Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Expression(subElement,.addedElement)  && ..addKeyword(subElement,"AS")  && ..StarTarget(subElement,.addedElement)  && ..WithItem117Peek(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  &(',' | ')' | ':')
Method WithItem117Peek(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; ruleE=LookAheadRule :(',' | ')' | ':')
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..WithItem118Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
		$$$BNFROLLBACK(subElement)
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// ',' | ')' | ':'
/// summary=P&?4punctuation:4?&?4punctuation:4?
Method WithItem118Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,")")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,":")  {
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

///  with_stmt: | 'with' '(' ','.with_item+ ','? ')' ':' [TYPE_COMMENT] block | 'with' ','.with_item+ ':' [TYPE_COMMENT] block | 'async' 'with' '(' ','.with_item+ ','? ')' ':' block | 'async' 'with' ','.with_item+ ':' [TYPE_COMMENT] block
/// summary=?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?
Method WithStmt(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..WithStmt108Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..WithStmt110Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..WithStmt112Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..WithStmt114Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&K&P&?4RepeatSep4?&?4OptionalSingle4?&P&P&[C]&C
Method WithStmt108Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"WITH")  && ..addPunctuation(subElement,"(")  && ..WithStmt109RepSep(subElement,.addedElement)  && $s(..addPunctuation(subElement,",") :1,1:1)  && ..addPunctuation(subElement,")")  && ..addPunctuation(subElement,":")  && $S(..TypeComment(subElement,.addedElement) :1,1:1) && ..Block(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  ','.with_item+
Method WithStmt109RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set done=0 ; must be at least 1
	if ..WithItem(subElement,.addedElement) {
		set done=1,ok=1 ; found 1
		do {
			$$$BNFSTART(repElement)
			set ok=(..addPunctuation(repElement,",")  && ..WithItem(repElement,.addedElement) )
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
		set ok=0 ; normal rollback
	}
	quit ok
}

/// 
/// summary=&K&?4RepeatSep4?&P&[C]&C
Method WithStmt110Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"WITH")  && ..WithStmt111RepSep(subElement,.addedElement)  && ..addPunctuation(subElement,":")  && $S(..TypeComment(subElement,.addedElement) :1,1:1) && ..Block(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  ','.with_item+
Method WithStmt111RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set done=0 ; must be at least 1
	if ..WithItem(subElement,.addedElement) {
		set done=1,ok=1 ; found 1
		do {
			$$$BNFSTART(repElement)
			set ok=(..addPunctuation(repElement,",")  && ..WithItem(repElement,.addedElement) )
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
		set ok=0 ; normal rollback
	}
	quit ok
}

/// 
/// summary=&K&K&P&?4RepeatSep4?&?4OptionalSingle4?&P&P&C
Method WithStmt112Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"ASYNC")  && ..addKeyword(subElement,"WITH")  && ..addPunctuation(subElement,"(")  && ..WithStmt113RepSep(subElement,.addedElement)  && $s(..addPunctuation(subElement,",") :1,1:1)  && ..addPunctuation(subElement,")")  && ..addPunctuation(subElement,":")  && ..Block(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  ','.with_item+
Method WithStmt113RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set done=0 ; must be at least 1
	if ..WithItem(subElement,.addedElement) {
		set done=1,ok=1 ; found 1
		do {
			$$$BNFSTART(repElement)
			set ok=(..addPunctuation(repElement,",")  && ..WithItem(repElement,.addedElement) )
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
		set ok=0 ; normal rollback
	}
	quit ok
}

/// 
/// summary=&K&K&?4RepeatSep4?&P&[C]&C
Method WithStmt114Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"ASYNC")  && ..addKeyword(subElement,"WITH")  && ..WithStmt115RepSep(subElement,.addedElement)  && ..addPunctuation(subElement,":")  && $S(..TypeComment(subElement,.addedElement) :1,1:1) && ..Block(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  ','.with_item+
Method WithStmt115RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set done=0 ; must be at least 1
	if ..WithItem(subElement,.addedElement) {
		set done=1,ok=1 ; found 1
		do {
			$$$BNFSTART(repElement)
			set ok=(..addPunctuation(repElement,",")  && ..WithItem(repElement,.addedElement) )
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
		set ok=0 ; normal rollback
	}
	quit ok
}

///  yield_expr: | 'yield' 'from' expression | 'yield' [star_expressions]
/// summary=?4punctuation:4?&?4punctuation:4?
Method YieldExpr(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..YieldExpr188Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..YieldExpr189Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=&K&K&C
Method YieldExpr188Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"YIELD")  && ..addKeyword(subElement,"FROM")  && ..Expression(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

/// 
/// summary=&K&[C]
Method YieldExpr189Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"YIELD")  && $S(..StarExpressions(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ok=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ok=0
		}
		$$$DEBUGMethodEnd
		quit ok
}

///  yield_stmt: yield_expr
/// summary=C
Method YieldStmt(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set pos=..stream.pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set done=$isobject(subElement)
	} else {
		if ..YieldExpr(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

Method newElement(Type As %String) As PXW.DEV.BNF.Elements.Python
{
	quit ##class(PXW.DEV.BNF.Elements.Python).%New(Type)
}

}
