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
		if ..Args1Or(subElement,.addedElement)  {
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
/// summary=&(C&?4punctuation:4?)&?4NotRule4?
Method Args10Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Args11Sub(subElement,.addedElement)  && ..Args14Not(subElement,.addedElement)  {
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
Method Args11Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..AssignmentExpression(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Args12Or(subElement,.addedElement)  {
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
Method Args12Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(subElement,.addedElement)  && ..Args13Not(subElement,.addedElement)  {
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
Method Args13Not(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method Args14Not(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method Args15OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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

/// 
/// summary=&?4RepeatSep4?&[P&C]
Method Args1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Args2RepSep(subElement,.addedElement)  && ..Args15OptGrp(subElement,.addedElement)  {
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
Method Args2RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set done=0 ; must be at least 1
	if ..Args3Sub(subElement,.addedElement) {
		set done=1,ok=1 ; found 1
		do {
			$$$BNFSTART(repElement)
			set ok=(..addPunctuation(repElement,",")  && ..Args9Sub(repElement,.addedElement) )
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
Method Args3Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..StarredExpression(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Args4Or(subElement,.addedElement)  {
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
Method Args4Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Args5Sub(subElement,.addedElement)  && ..Args8Not(subElement,.addedElement)  {
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
Method Args5Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..AssignmentExpression(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Args6Or(subElement,.addedElement)  {
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
Method Args6Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(subElement,.addedElement)  && ..Args7Not(subElement,.addedElement)  {
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
Method Args7Not(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method Args8Not(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method Args9Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..StarredExpression(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Args10Or(subElement,.addedElement)  {
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
		if ..Arguments1Or(subElement,.addedElement)  {
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
Method Arguments1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Args(subElement,.addedElement)  && $S(..addPunctuation(subElement,",") :1,1:1) && ..Arguments2Peek(subElement,.addedElement)  {
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
Method Arguments2Peek(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..AsPattern1Or(subElement,.addedElement)  {
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
Method AsPattern1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..addKeyword(subElement,"ASSERT")  && ..Expression(subElement,.addedElement)  && ..AssertStmt1OptGrp(subElement,.addedElement)  {
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
Method AssertStmt1OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..Assignment1Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..Assignment3Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..Assignment6Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..Assignment11Or(subElement,.addedElement)  {
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

/// '='
Method Assignment10Not(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method Assignment11Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..SingleTarget(subElement,.addedElement)  && ..Augassign(subElement,.addedElement)  && 1 /* force means? */ && ..Assignment12Sub(subElement,.addedElement)  {
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
Method Assignment12Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method Assignment1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Name(subElement,.addedElement)  && ..addPunctuation(subElement,":")  && ..Expression(subElement,.addedElement)  && ..Assignment2OptGrp(subElement,.addedElement)  {
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
Method Assignment2OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method Assignment3Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Assignment4Sub(subElement,.addedElement)  && ..addPunctuation(subElement,":")  && ..Expression(subElement,.addedElement)  && ..Assignment5OptGrp(subElement,.addedElement)  {
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
Method Assignment4Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method Assignment5OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method Assignment6Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Assignment7RepOne(subElement,.addedElement)  && ..Assignment9Sub(subElement,.addedElement)  && ..Assignment10Not(subElement,.addedElement)  && $S(..TypeComment(subElement,.addedElement) :1,1:1) {
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
Method Assignment7RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..Assignment8Sub(subElement,.addedElement)  {
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
Method Assignment8Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method Assignment9Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..AssignmentExpression1Or(subElement,.addedElement)  {
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
Method AssignmentExpression1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		} elseif ..Atom1Sub(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..Atom2Sub(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..Atom3Sub(subElement,.addedElement)  {
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
Method Atom1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method Atom2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method Atom3Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..Attr1Or(subElement,.addedElement)  {
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
Method Attr1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..AwaitPrimary1Or(subElement,.addedElement)  {
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
Method AwaitPrimary1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		set rec=..BitwiseAnd1Recurse(subElement,.addedElement)
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
Method BitwiseAnd1Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..BitwiseAnd2Or(subElement,.addedElement)  {
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
Method BitwiseAnd2Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		set rec=..BitwiseOr1Recurse(subElement,.addedElement)
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
Method BitwiseOr1Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..BitwiseOr2Or(subElement,.addedElement)  {
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
Method BitwiseOr2Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		set rec=..BitwiseXor1Recurse(subElement,.addedElement)
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
Method BitwiseXor1Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..BitwiseXor2Or(subElement,.addedElement)  {
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
Method BitwiseXor2Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..Block1Or(subElement,.addedElement)  {
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
Method Block1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..CaseBlock1Or(subElement,.addedElement)  {
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
Method CaseBlock1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..ClassDef1Or(subElement,.addedElement)  {
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
Method ClassDef1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..ClassDefRaw1Or(subElement,.addedElement)  {
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
Method ClassDefRaw1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"CLASS")  && ..Name(subElement,.addedElement)  && $S(..TypeParams(subElement,.addedElement) :1,1:1) && ..ClassDefRaw2OptGrp(subElement,.addedElement)  && ..addPunctuation(subElement,":")  && ..Block(subElement,.addedElement)  {
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
Method ClassDefRaw2OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..ClassPattern1Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..ClassPattern2Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..ClassPattern3Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..ClassPattern4Or(subElement,.addedElement)  {
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
Method ClassPattern1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method ClassPattern2Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method ClassPattern3Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method ClassPattern4Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..Comparison1Or(subElement,.addedElement)  {
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
Method Comparison1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..BitwiseOr(subElement,.addedElement)  && ..Comparison2RepOne(subElement,.addedElement)  {
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
Method Comparison2RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..ComplexNumber1Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..ComplexNumber2Or(subElement,.addedElement)  {
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
Method ComplexNumber1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method ComplexNumber2Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..Conjunction1Or(subElement,.addedElement)  {
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
Method Conjunction1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Inversion(subElement,.addedElement)  && ..Conjunction2RepOne(subElement,.addedElement)  {
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
Method Conjunction2RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..Conjunction3Sub(subElement,.addedElement)  {
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
Method Conjunction3Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..Decorators1RepOne(subElement,.addedElement)  {
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
Method Decorators1RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..Decorators2Sub(subElement,.addedElement)  {
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
Method Decorators2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..DelStmt1Or(subElement,.addedElement)  {
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
Method DelStmt1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"DEL")  && ..DelTargets(subElement,.addedElement)  && ..DelStmt2Peek(subElement,.addedElement)  {
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
Method DelStmt2Peek(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; ruleE=LookAheadRule :(';' | NEWLINE)
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..DelStmt3Sub(subElement,.addedElement)  {
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
Method DelStmt3Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		} elseif ..DelTAtom1Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..DelTAtom2Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..DelTAtom3Or(subElement,.addedElement)  {
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
Method DelTAtom1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method DelTAtom2Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method DelTAtom3Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..DelTarget1Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..DelTarget3Or(subElement,.addedElement)  {
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
Method DelTarget1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..TPrimary(subElement,.addedElement)  && ..addPunctuation(subElement,".")  && ..Name(subElement,.addedElement)  && ..DelTarget2Not(subElement,.addedElement)  {
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
Method DelTarget2Not(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method DelTarget3Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..TPrimary(subElement,.addedElement)  && ..addPunctuation(subElement,"[")  && ..Slices(subElement,.addedElement)  && ..addPunctuation(subElement,"]")  && ..DelTarget4Not(subElement,.addedElement)  {
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
Method DelTarget4Not(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..DelTargets1RepSep(subElement,.addedElement)  && $S(..addPunctuation(subElement,",") :1,1:1) {
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
Method DelTargets1RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..Dict1Or(subElement,.addedElement)  {
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
Method Dict1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..Dictcomp1Or(subElement,.addedElement)  {
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
Method Dictcomp1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..Disjunction1Or(subElement,.addedElement)  {
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
Method Disjunction1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Conjunction(subElement,.addedElement)  && ..Disjunction2RepOne(subElement,.addedElement)  {
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
Method Disjunction2RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..Disjunction3Sub(subElement,.addedElement)  {
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
Method Disjunction3Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..DottedAsName1Or(subElement,.addedElement)  {
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
Method DottedAsName1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..DottedName(subElement,.addedElement)  && ..DottedAsName2OptGrp(subElement,.addedElement)  {
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
Method DottedAsName2OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..DottedAsNames1RepSep(subElement,.addedElement)  {
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
Method DottedAsNames1RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		set rec=..DottedName1Recurse(subElement,.addedElement)
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
Method DottedName1Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..DottedName2Or(subElement,.addedElement)  {
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
Method DottedName2Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..DoubleStarPattern1Or(subElement,.addedElement)  {
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
Method DoubleStarPattern1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..DoubleStarredKvpair1Or(subElement,.addedElement)  {
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
Method DoubleStarredKvpair1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..DoubleStarredKvpairs1RepSep(subElement,.addedElement)  && $S(..addPunctuation(subElement,",") :1,1:1) {
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
Method DoubleStarredKvpairs1RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		set rec=..ElifStmt1Recurse(subElement,.addedElement)
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
Method ElifStmt1Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..ElifStmt2Or(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ElifStmt3Or(subElement,.addedElement)  {
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
Method ElifStmt2Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method ElifStmt3Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..ElseBlock1Or(subElement,.addedElement)  {
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
Method ElseBlock1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
	; method start
	while ..Newline(subElement,.addedElement)  {
		;
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
		if ..ExceptBlock1Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..ExceptBlock3Or(subElement,.addedElement)  {
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
Method ExceptBlock1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"EXCEPT")  && ..Expression(subElement,.addedElement)  && ..ExceptBlock2OptGrp(subElement,.addedElement)  && ..addPunctuation(subElement,":")  && ..Block(subElement,.addedElement)  {
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
Method ExceptBlock2OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method ExceptBlock3Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..ExceptStarBlock1Or(subElement,.addedElement)  {
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
Method ExceptStarBlock1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"EXCEPT")  && ..addPunctuation(subElement,"*")  && ..Expression(subElement,.addedElement)  && ..ExceptStarBlock2OptGrp(subElement,.addedElement)  && ..addPunctuation(subElement,":")  && ..Block(subElement,.addedElement)  {
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
Method ExceptStarBlock2OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		set rec=..Expression1Recurse(subElement,.addedElement)
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
Method Expression1Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..Expression2Or(subElement,.addedElement)  {
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
Method Expression2Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..Expressions1Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..Expressions4Or(subElement,.addedElement)  {
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
Method Expressions1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Expression(subElement,.addedElement)  && ..Expressions2RepOne(subElement,.addedElement)  && $S(..addPunctuation(subElement,",") :1,1:1) {
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
Method Expressions2RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..Expressions3Sub(subElement,.addedElement)  {
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
Method Expressions3Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method Expressions4Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		set rec=..Factor1Recurse(subElement,.addedElement)
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
Method Factor1Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..Factor2Or(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Factor3Or(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Factor4Or(subElement,.addedElement)  {
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
Method Factor2Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method Factor3Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method Factor4Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..FinallyBlock1Or(subElement,.addedElement)  {
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
Method FinallyBlock1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..ForIfClause1Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..ForIfClause4Or(subElement,.addedElement)  {
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
Method ForIfClause1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"ASYNC")  && ..addKeyword(subElement,"FOR")  && ..StarTargets(subElement,.addedElement)  && ..addKeyword(subElement,"IN")  && 1 /* force means? */ && ..Disjunction(subElement,.addedElement)  && ..ForIfClause2RepZero(subElement,.addedElement)  {
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
Method ForIfClause2RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	; method start
	while ..ForIfClause3Sub(subElement,.addedElement)  {
		;
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
Method ForIfClause3Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method ForIfClause4Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"FOR")  && ..StarTargets(subElement,.addedElement)  && ..addKeyword(subElement,"IN")  && 1 /* force means? */ && ..Disjunction(subElement,.addedElement)  && ..ForIfClause5RepZero(subElement,.addedElement)  {
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
Method ForIfClause5RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	; method start
	while ..ForIfClause6Sub(subElement,.addedElement)  {
		;
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
Method ForIfClause6Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..ForIfClauses1RepOne(subElement,.addedElement)  {
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
Method ForIfClauses1RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..ForStmt1Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..ForStmt2Or(subElement,.addedElement)  {
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
Method ForStmt1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method ForStmt2Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..Fstring1Or(subElement,.addedElement)  {
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
Method Fstring1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..FstringStart(subElement,.addedElement)  && ..Fstring2RepZero(subElement,.addedElement)  && ..FstringEnd(subElement,.addedElement)  {
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
Method Fstring2RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	; method start
	while ..FstringMiddle(subElement,.addedElement)  {
		;
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
		if ..FstringConversion1Or(subElement,.addedElement)  {
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
Method FstringConversion1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..FstringFullFormatSpec1Or(subElement,.addedElement)  {
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
Method FstringFullFormatSpec1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,":")  && ..FstringFullFormatSpec2RepZero(subElement,.addedElement)  {
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
Method FstringFullFormatSpec2RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	; method start
	while ..FstringFormatSpec(subElement,.addedElement)  {
		;
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
		set rec=..FstringMiddle1Recurse(subElement,.addedElement)
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
Method FstringMiddle1Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..FstringReplacementField1Or(subElement,.addedElement)  {
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
Method FstringReplacementField1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..addPunctuation(subElement,"(")  && $S(..TypeExpressions(subElement,.addedElement) :1,1:1) && ..addPunctuation(subElement,")")  && ..addPunctuation(subElement,"->")  && ..Expression(subElement,.addedElement)  && ..FuncType1RepZero(subElement,.addedElement)  && ..Endmarker(subElement,.addedElement)  {
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
Method FuncType1RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	; method start
	while ..Newline(subElement,.addedElement)  {
		;
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
		if ..FuncTypeComment1Or(subElement,.addedElement)  {
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
Method FuncTypeComment1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Newline(subElement,.addedElement)  && ..TypeComment(subElement,.addedElement)  && ..FuncTypeComment2Peek(subElement,.addedElement)  {
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
Method FuncTypeComment2Peek(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; ruleE=LookAheadRule :(NEWLINE INDENT)
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..FuncTypeComment3Sub(subElement,.addedElement)  {
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
Method FuncTypeComment3Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..FunctionDef1Or(subElement,.addedElement)  {
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
Method FunctionDef1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..FunctionDefRaw1Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..FunctionDefRaw3Or(subElement,.addedElement)  {
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
Method FunctionDefRaw1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"DEF")  && ..Name(subElement,.addedElement)  && $S(..TypeParams(subElement,.addedElement) :1,1:1) && ..addPunctuation(subElement,"(")  && $S(..Params(subElement,.addedElement) :1,1:1) && ..addPunctuation(subElement,")")  && ..FunctionDefRaw2OptGrp(subElement,.addedElement)  && ..addPunctuation(subElement,":")  && $S(..FuncTypeComment(subElement,.addedElement) :1,1:1) && ..Block(subElement,.addedElement)  {
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
Method FunctionDefRaw2OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method FunctionDefRaw3Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"ASYNC")  && ..addKeyword(subElement,"DEF")  && ..Name(subElement,.addedElement)  && $S(..TypeParams(subElement,.addedElement) :1,1:1) && ..addPunctuation(subElement,"(")  && $S(..Params(subElement,.addedElement) :1,1:1) && ..addPunctuation(subElement,")")  && ..FunctionDefRaw4OptGrp(subElement,.addedElement)  && ..addPunctuation(subElement,":")  && $S(..FuncTypeComment(subElement,.addedElement) :1,1:1) && ..Block(subElement,.addedElement)  {
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
Method FunctionDefRaw4OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..Genexp1Or(subElement,.addedElement)  {
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
Method Genexp1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"(")  && ..Genexp2Sub(subElement,.addedElement)  && ..ForIfClauses(subElement,.addedElement)  && ..addPunctuation(subElement,")")  {
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
Method Genexp2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..AssignmentExpression(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Genexp3Or(subElement,.addedElement)  {
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
Method Genexp3Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(subElement,.addedElement)  && ..Genexp4Not(subElement,.addedElement)  {
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
Method Genexp4Not(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..addKeyword(subElement,"GLOBAL")  && ..GlobalStmt1RepSep(subElement,.addedElement)  {
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
Method GlobalStmt1RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..Group1Or(subElement,.addedElement)  {
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
Method Group1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"(")  && ..Group2Sub(subElement,.addedElement)  && ..addPunctuation(subElement,")")  {
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
Method Group2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..GroupPattern1Or(subElement,.addedElement)  {
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
Method GroupPattern1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..IfStmt1Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..IfStmt2Or(subElement,.addedElement)  {
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
/// summary=&K&C&P&C&C
Method IfStmt1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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

/// 
/// summary=&K&C&P&C&[C]
Method IfStmt2Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..ImportFrom1Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..ImportFrom4Or(subElement,.addedElement)  {
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
Method ImportFrom1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"FROM")  && ..ImportFrom2RepZero(subElement,.addedElement)  && ..DottedName(subElement,.addedElement)  && ..addKeyword(subElement,"IMPORT")  && ..ImportFromTargets(subElement,.addedElement)  {
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
Method ImportFrom2RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	; method start
	while ..ImportFrom3Sub(subElement,.addedElement)  {
		;
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
Method ImportFrom3Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method ImportFrom4Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"FROM")  && ..ImportFrom5RepOne(subElement,.addedElement)  && ..addKeyword(subElement,"IMPORT")  && ..ImportFromTargets(subElement,.addedElement)  {
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
Method ImportFrom5RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..ImportFrom6Sub(subElement,.addedElement)  {
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
Method ImportFrom6Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..ImportFromAsName1Or(subElement,.addedElement)  {
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
Method ImportFromAsName1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Name(subElement,.addedElement)  && ..ImportFromAsName2OptGrp(subElement,.addedElement)  {
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
Method ImportFromAsName2OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..ImportFromAsNames1RepSep(subElement,.addedElement)  {
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
Method ImportFromAsNames1RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..ImportFromTargets1Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..ImportFromTargets2Or(subElement,.addedElement)  {
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
Method ImportFromTargets1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method ImportFromTargets2Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..ImportFromAsNames(subElement,.addedElement)  && ..ImportFromTargets3Not(subElement,.addedElement)  {
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
Method ImportFromTargets3Not(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		set rec=..Inversion1Recurse(subElement,.addedElement)
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
Method Inversion1Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..Inversion2Or(subElement,.addedElement)  {
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
Method Inversion2Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..ItemsPattern1RepSep(subElement,.addedElement)  {
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
Method ItemsPattern1RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..KeyValuePattern1Or(subElement,.addedElement)  {
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
Method KeyValuePattern1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..KeyValuePattern2Sub(subElement,.addedElement)  && ..addPunctuation(subElement,":")  && ..Pattern(subElement,.addedElement)  {
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
Method KeyValuePattern2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..KeywordPattern1Or(subElement,.addedElement)  {
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
Method KeywordPattern1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..KeywordPatterns1RepSep(subElement,.addedElement)  {
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
Method KeywordPatterns1RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..KwargOrDoubleStarred1Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..KwargOrDoubleStarred2Or(subElement,.addedElement)  {
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
Method KwargOrDoubleStarred1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method KwargOrDoubleStarred2Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..KwargOrStarred1Or(subElement,.addedElement)  {
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
Method KwargOrStarred1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..Kwargs1Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..Kwargs4RepSep(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..Kwargs5RepSep(subElement,.addedElement)  {
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
Method Kwargs1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Kwargs2RepSep(subElement,.addedElement)  && ..addPunctuation(subElement,",")  && ..Kwargs3RepSep(subElement,.addedElement)  {
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
Method Kwargs2RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method Kwargs3RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method Kwargs4RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method Kwargs5RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..Kwds1Or(subElement,.addedElement)  {
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
Method Kwds1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..LambdaKwds1Or(subElement,.addedElement)  {
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
Method LambdaKwds1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..LambdaParamMaybeDefault1Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..LambdaParamMaybeDefault2Or(subElement,.addedElement)  {
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
Method LambdaParamMaybeDefault1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method LambdaParamMaybeDefault2Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..LambdaParam(subElement,.addedElement)  && $s(..Default(subElement,.addedElement) :1,1:1)  && ..LambdaParamMaybeDefault3Peek(subElement,.addedElement)  {
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
Method LambdaParamMaybeDefault3Peek(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..LambdaParamNoDefault1Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..LambdaParamNoDefault2Or(subElement,.addedElement)  {
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
Method LambdaParamNoDefault1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method LambdaParamNoDefault2Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..LambdaParam(subElement,.addedElement)  && ..LambdaParamNoDefault3Peek(subElement,.addedElement)  {
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
Method LambdaParamNoDefault3Peek(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..LambdaParamWithDefault1Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..LambdaParamWithDefault2Or(subElement,.addedElement)  {
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
Method LambdaParamWithDefault1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method LambdaParamWithDefault2Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..LambdaParam(subElement,.addedElement)  && ..Default(subElement,.addedElement)  && ..LambdaParamWithDefault3Peek(subElement,.addedElement)  {
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
Method LambdaParamWithDefault3Peek(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..LambdaParameters1Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..LambdaParameters4Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..LambdaParameters6Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..LambdaParameters9Or(subElement,.addedElement)  {
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

///  lambda_param_with_default+
Method LambdaParameters10RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
/// summary=&C&(?4Call:4?)*&(?4Call:4?)*&[C]
Method LambdaParameters1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..LambdaSlashNoDefault(subElement,.addedElement)  && ..LambdaParameters2RepZero(subElement,.addedElement)  && ..LambdaParameters3RepZero(subElement,.addedElement)  && $S(..LambdaStarEtc(subElement,.addedElement) :1,1:1) {
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
Method LambdaParameters2RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	; method start
	while ..LambdaParamNoDefault(subElement,.addedElement)  {
		;
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  lambda_param_with_default*
Method LambdaParameters3RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	; method start
	while ..LambdaParamWithDefault(subElement,.addedElement)  {
		;
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
Method LambdaParameters4Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..LambdaSlashWithDefault(subElement,.addedElement)  && ..LambdaParameters5RepZero(subElement,.addedElement)  && $S(..LambdaStarEtc(subElement,.addedElement) :1,1:1) {
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
Method LambdaParameters5RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	; method start
	while ..LambdaParamWithDefault(subElement,.addedElement)  {
		;
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
Method LambdaParameters6Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..LambdaParameters7RepOne(subElement,.addedElement)  && ..LambdaParameters8RepZero(subElement,.addedElement)  && $S(..LambdaStarEtc(subElement,.addedElement) :1,1:1) {
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
Method LambdaParameters7RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method LambdaParameters8RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	; method start
	while ..LambdaParamWithDefault(subElement,.addedElement)  {
		;
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
Method LambdaParameters9Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..LambdaParameters10RepOne(subElement,.addedElement)  && $S(..LambdaStarEtc(subElement,.addedElement) :1,1:1) {
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
		if ..LambdaSlashNoDefault1Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..LambdaSlashNoDefault3Or(subElement,.addedElement)  {
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
Method LambdaSlashNoDefault1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..LambdaSlashNoDefault2RepOne(subElement,.addedElement)  && ..addPunctuation(subElement,"/")  && ..addPunctuation(subElement,",")  {
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
Method LambdaSlashNoDefault2RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method LambdaSlashNoDefault3Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..LambdaSlashNoDefault4RepOne(subElement,.addedElement)  && ..addPunctuation(subElement,"/")  && ..LambdaSlashNoDefault5Peek(subElement,.addedElement)  {
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
Method LambdaSlashNoDefault4RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method LambdaSlashNoDefault5Peek(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..LambdaSlashWithDefault1Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..LambdaSlashWithDefault4Or(subElement,.addedElement)  {
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
Method LambdaSlashWithDefault1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..LambdaSlashWithDefault2RepZero(subElement,.addedElement)  && ..LambdaSlashWithDefault3RepOne(subElement,.addedElement)  && ..addPunctuation(subElement,"/")  && ..addPunctuation(subElement,",")  {
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
Method LambdaSlashWithDefault2RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	; method start
	while ..LambdaParamNoDefault(subElement,.addedElement)  {
		;
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  lambda_param_with_default+
Method LambdaSlashWithDefault3RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method LambdaSlashWithDefault4Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..LambdaSlashWithDefault5RepZero(subElement,.addedElement)  && ..LambdaSlashWithDefault6RepOne(subElement,.addedElement)  && ..addPunctuation(subElement,"/")  && ..LambdaSlashWithDefault7Peek(subElement,.addedElement)  {
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
Method LambdaSlashWithDefault5RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	; method start
	while ..LambdaParamNoDefault(subElement,.addedElement)  {
		;
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  lambda_param_with_default+
Method LambdaSlashWithDefault6RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method LambdaSlashWithDefault7Peek(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..LambdaStarEtc1Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..LambdaStarEtc3Or(subElement,.addedElement)  {
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
Method LambdaStarEtc1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"*")  && ..LambdaParamNoDefault(subElement,.addedElement)  && ..LambdaStarEtc2RepZero(subElement,.addedElement)  && $S(..LambdaKwds(subElement,.addedElement) :1,1:1) {
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
Method LambdaStarEtc2RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	; method start
	while ..LambdaParamMaybeDefault(subElement,.addedElement)  {
		;
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
Method LambdaStarEtc3Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"*")  && ..addPunctuation(subElement,",")  && ..LambdaStarEtc4RepOne(subElement,.addedElement)  && $S(..LambdaKwds(subElement,.addedElement) :1,1:1) {
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
Method LambdaStarEtc4RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..Lambdef1Or(subElement,.addedElement)  {
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
Method Lambdef1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..List1Or(subElement,.addedElement)  {
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
Method List1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..Listcomp1Or(subElement,.addedElement)  {
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
Method Listcomp1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..LiteralExpr1Or(subElement,.addedElement)  {
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
Method LiteralExpr1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..SignedNumber(subElement,.addedElement)  && ..LiteralExpr2Not(subElement,.addedElement)  {
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
Method LiteralExpr2Not(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LiteralExpr3Sub(subElement,.addedElement)  { set done=1 }
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
Method LiteralExpr3Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..LiteralPattern1Or(subElement,.addedElement)  {
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
Method LiteralPattern1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..SignedNumber(subElement,.addedElement)  && ..LiteralPattern2Not(subElement,.addedElement)  {
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
Method LiteralPattern2Not(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LiteralPattern3Sub(subElement,.addedElement)  { set done=1 }
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
Method LiteralPattern3Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..MappingPattern1Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..MappingPattern2Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..MappingPattern3Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..MappingPattern4Or(subElement,.addedElement)  {
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
Method MappingPattern1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method MappingPattern2Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method MappingPattern3Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method MappingPattern4Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..MatchStmt1Or(subElement,.addedElement)  {
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
Method MatchStmt1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"MATCH")  && ..SubjectExpr(subElement,.addedElement)  && ..addPunctuation(subElement,":")  && ..Newline(subElement,.addedElement)  && ..Indent(subElement,.addedElement)  && ..MatchStmt2RepOne(subElement,.addedElement)  && ..Dedent(subElement,.addedElement)  {
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
Method MatchStmt2RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..MaybeSequencePattern1Or(subElement,.addedElement)  {
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
Method MaybeSequencePattern1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..MaybeSequencePattern2RepSep(subElement,.addedElement)  && $s(..addPunctuation(subElement,",") :1,1:1)  {
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
Method MaybeSequencePattern2RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		} elseif ..NamedExpression1Or(subElement,.addedElement)  {
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
Method NamedExpression1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Expression(subElement,.addedElement)  && ..NamedExpression2Not(subElement,.addedElement)  {
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
Method NamedExpression2Not(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..addKeyword(subElement,"NONLOCAL")  && ..NonlocalStmt1RepSep(subElement,.addedElement)  {
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
Method NonlocalStmt1RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..NoteqBitwiseOr1Or(subElement,.addedElement)  {
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
Method NoteqBitwiseOr1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..NoteqBitwiseOr2Sub(subElement,.addedElement)  && ..BitwiseOr(subElement,.addedElement)  {
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
Method NoteqBitwiseOr2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..OpenSequencePattern1Or(subElement,.addedElement)  {
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
Method OpenSequencePattern1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..OrPattern1RepSep(subElement,.addedElement)  {
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
Method OrPattern1RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..ParamMaybeDefault1Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..ParamMaybeDefault2Or(subElement,.addedElement)  {
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
Method ParamMaybeDefault1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method ParamMaybeDefault2Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Param(subElement,.addedElement)  && $s(..Default(subElement,.addedElement) :1,1:1)  && $s(..TypeComment(subElement,.addedElement) :1,1:1)  && ..ParamMaybeDefault3Peek(subElement,.addedElement)  {
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
Method ParamMaybeDefault3Peek(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..ParamNoDefault1Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..ParamNoDefault2Or(subElement,.addedElement)  {
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
Method ParamNoDefault1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method ParamNoDefault2Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Param(subElement,.addedElement)  && $s(..TypeComment(subElement,.addedElement) :1,1:1)  && ..ParamNoDefault3Peek(subElement,.addedElement)  {
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
Method ParamNoDefault3Peek(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..ParamNoDefaultStarAnnotation1Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..ParamNoDefaultStarAnnotation2Or(subElement,.addedElement)  {
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
Method ParamNoDefaultStarAnnotation1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method ParamNoDefaultStarAnnotation2Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..ParamStarAnnotation(subElement,.addedElement)  && $s(..TypeComment(subElement,.addedElement) :1,1:1)  && ..ParamNoDefaultStarAnnotation3Peek(subElement,.addedElement)  {
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
Method ParamNoDefaultStarAnnotation3Peek(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..ParamWithDefault1Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..ParamWithDefault2Or(subElement,.addedElement)  {
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
Method ParamWithDefault1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method ParamWithDefault2Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Param(subElement,.addedElement)  && ..Default(subElement,.addedElement)  && $s(..TypeComment(subElement,.addedElement) :1,1:1)  && ..ParamWithDefault3Peek(subElement,.addedElement)  {
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
Method ParamWithDefault3Peek(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..Parameters1Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..Parameters4Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..Parameters6Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..Parameters9Or(subElement,.addedElement)  {
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

///  param_with_default+
Method Parameters10RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
/// summary=&C&(?4Call:4?)*&(?4Call:4?)*&[C]
Method Parameters1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..SlashNoDefault(subElement,.addedElement)  && ..Parameters2RepZero(subElement,.addedElement)  && ..Parameters3RepZero(subElement,.addedElement)  && $S(..StarEtc(subElement,.addedElement) :1,1:1) {
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
Method Parameters2RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	; method start
	while ..ParamNoDefault(subElement,.addedElement)  {
		;
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  param_with_default*
Method Parameters3RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	; method start
	while ..ParamWithDefault(subElement,.addedElement)  {
		;
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
Method Parameters4Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..SlashWithDefault(subElement,.addedElement)  && ..Parameters5RepZero(subElement,.addedElement)  && $S(..StarEtc(subElement,.addedElement) :1,1:1) {
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
Method Parameters5RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	; method start
	while ..ParamWithDefault(subElement,.addedElement)  {
		;
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
Method Parameters6Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Parameters7RepOne(subElement,.addedElement)  && ..Parameters8RepZero(subElement,.addedElement)  && $S(..StarEtc(subElement,.addedElement) :1,1:1) {
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
Method Parameters7RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method Parameters8RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	; method start
	while ..ParamWithDefault(subElement,.addedElement)  {
		;
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
Method Parameters9Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Parameters10RepOne(subElement,.addedElement)  && $S(..StarEtc(subElement,.addedElement) :1,1:1) {
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
		if ..PatternCaptureTarget1Or(subElement,.addedElement)  {
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
Method PatternCaptureTarget1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..PatternCaptureTarget2Not(subElement,.addedElement)  && ..Name(subElement,.addedElement)  && ..PatternCaptureTarget3Not(subElement,.addedElement)  {
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
Method PatternCaptureTarget2Not(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method PatternCaptureTarget3Not(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..PatternCaptureTarget4Sub(subElement,.addedElement)  { set done=1 }
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
Method PatternCaptureTarget4Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..PositionalPatterns1RepSep(subElement,.addedElement)  {
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
Method PositionalPatterns1RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..Power1Or(subElement,.addedElement)  {
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
Method Power1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		set rec=..Primary1Recurse(subElement,.addedElement)
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
Method Primary1Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..Primary2Or(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Primary3Or(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Primary4Or(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Primary5Or(subElement,.addedElement)  {
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
Method Primary2Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method Primary3Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method Primary4Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method Primary5Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..RaiseStmt1Or(subElement,.addedElement)  {
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
Method RaiseStmt1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"RAISE")  && ..Expression(subElement,.addedElement)  && ..RaiseStmt2OptGrp(subElement,.addedElement)  {
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
Method RaiseStmt2OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..ReturnStmt1Or(subElement,.addedElement)  {
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
Method ReturnStmt1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..SequencePattern1Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..SequencePattern2Or(subElement,.addedElement)  {
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
Method SequencePattern1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method SequencePattern2Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..Setcomp1Or(subElement,.addedElement)  {
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
Method Setcomp1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		set rec=..ShiftExpr1Recurse(subElement,.addedElement)
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
Method ShiftExpr1Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..ShiftExpr2Or(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ShiftExpr3Or(subElement,.addedElement)  {
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
Method ShiftExpr2Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method ShiftExpr3Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		} elseif ..SignedNumber1Or(subElement,.addedElement)  {
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
Method SignedNumber1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		} elseif ..SignedRealNumber1Or(subElement,.addedElement)  {
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
Method SignedRealNumber1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..SimpleStmts1Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..SimpleStmts3Or(subElement,.addedElement)  {
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
Method SimpleStmts1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..SimpleStmt(subElement,.addedElement)  && ..SimpleStmts2Not(subElement,.addedElement)  && ..Newline(subElement,.addedElement)  {
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
Method SimpleStmts2Not(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method SimpleStmts3Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..SimpleStmts4RepSep(subElement,.addedElement)  && $S(..addPunctuation(subElement,";") :1,1:1) && ..Newline(subElement,.addedElement)  {
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
Method SimpleStmts4RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..SingleSubscriptAttributeTarget1Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..SingleSubscriptAttributeTarget3Or(subElement,.addedElement)  {
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
Method SingleSubscriptAttributeTarget1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..TPrimary(subElement,.addedElement)  && ..addPunctuation(subElement,".")  && ..Name(subElement,.addedElement)  && ..SingleSubscriptAttributeTarget2Not(subElement,.addedElement)  {
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
Method SingleSubscriptAttributeTarget2Not(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method SingleSubscriptAttributeTarget3Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..TPrimary(subElement,.addedElement)  && ..addPunctuation(subElement,"[")  && ..Slices(subElement,.addedElement)  && ..addPunctuation(subElement,"]")  && ..SingleSubscriptAttributeTarget4Not(subElement,.addedElement)  {
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
Method SingleSubscriptAttributeTarget4Not(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		set rec=..SingleTarget1Recurse(subElement,.addedElement)
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
Method SingleTarget1Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..SingleSubscriptAttributeTarget(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Name(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SingleTarget2Or(subElement,.addedElement)  {
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
Method SingleTarget2Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..SlashNoDefault1Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..SlashNoDefault3Or(subElement,.addedElement)  {
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
Method SlashNoDefault1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..SlashNoDefault2RepOne(subElement,.addedElement)  && ..addPunctuation(subElement,"/")  && ..addPunctuation(subElement,",")  {
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
Method SlashNoDefault2RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method SlashNoDefault3Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..SlashNoDefault4RepOne(subElement,.addedElement)  && ..addPunctuation(subElement,"/")  && ..SlashNoDefault5Peek(subElement,.addedElement)  {
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
Method SlashNoDefault4RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method SlashNoDefault5Peek(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..SlashWithDefault1Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..SlashWithDefault4Or(subElement,.addedElement)  {
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
Method SlashWithDefault1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..SlashWithDefault2RepZero(subElement,.addedElement)  && ..SlashWithDefault3RepOne(subElement,.addedElement)  && ..addPunctuation(subElement,"/")  && ..addPunctuation(subElement,",")  {
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
Method SlashWithDefault2RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	; method start
	while ..ParamNoDefault(subElement,.addedElement)  {
		;
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  param_with_default+
Method SlashWithDefault3RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method SlashWithDefault4Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..SlashWithDefault5RepZero(subElement,.addedElement)  && ..SlashWithDefault6RepOne(subElement,.addedElement)  && ..addPunctuation(subElement,"/")  && ..SlashWithDefault7Peek(subElement,.addedElement)  {
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
Method SlashWithDefault5RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	; method start
	while ..ParamNoDefault(subElement,.addedElement)  {
		;
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  param_with_default+
Method SlashWithDefault6RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method SlashWithDefault7Peek(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..Slice1Or(subElement,.addedElement)  {
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
Method Slice1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if $S(..Expression(subElement,.addedElement) :1,1:1) && ..addPunctuation(subElement,":")  && $S(..Expression(subElement,.addedElement) :1,1:1) && ..Slice2OptGrp(subElement,.addedElement)  {
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
Method Slice2OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..Slices1Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..Slices3Or(subElement,.addedElement)  {
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
Method Slices1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Slice(subElement,.addedElement)  && ..Slices2Not(subElement,.addedElement)  {
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
Method Slices2Not(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method Slices3Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Slices4RepSep(subElement,.addedElement)  && $S(..addPunctuation(subElement,",") :1,1:1) {
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
Method Slices4RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set done=0 ; must be at least 1
	if ..Slices5Sub(subElement,.addedElement) {
		set done=1,ok=1 ; found 1
		do {
			$$$BNFSTART(repElement)
			set ok=(..addPunctuation(repElement,",")  && ..Slices6Sub(repElement,.addedElement) )
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
Method Slices5Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method Slices6Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		} elseif ..StarAtom1Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..StarAtom2Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..StarAtom3Or(subElement,.addedElement)  {
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
Method StarAtom1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method StarAtom2Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method StarAtom3Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..StarEtc1Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..StarEtc3Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..StarEtc5Or(subElement,.addedElement)  {
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
Method StarEtc1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"*")  && ..ParamNoDefault(subElement,.addedElement)  && ..StarEtc2RepZero(subElement,.addedElement)  && $S(..Kwds(subElement,.addedElement) :1,1:1) {
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
Method StarEtc2RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	; method start
	while ..ParamMaybeDefault(subElement,.addedElement)  {
		;
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
Method StarEtc3Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"*")  && ..ParamNoDefaultStarAnnotation(subElement,.addedElement)  && ..StarEtc4RepZero(subElement,.addedElement)  && $S(..Kwds(subElement,.addedElement) :1,1:1) {
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
Method StarEtc4RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	; method start
	while ..ParamMaybeDefault(subElement,.addedElement)  {
		;
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
Method StarEtc5Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"*")  && ..addPunctuation(subElement,",")  && ..StarEtc6RepOne(subElement,.addedElement)  && $S(..Kwds(subElement,.addedElement) :1,1:1) {
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
Method StarEtc6RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..StarExpression1Or(subElement,.addedElement)  {
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
Method StarExpression1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..StarExpressions1Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..StarExpressions4Or(subElement,.addedElement)  {
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
Method StarExpressions1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..StarExpression(subElement,.addedElement)  && ..StarExpressions2RepOne(subElement,.addedElement)  && $S(..addPunctuation(subElement,",") :1,1:1) {
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
Method StarExpressions2RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..StarExpressions3Sub(subElement,.addedElement)  {
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
Method StarExpressions3Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method StarExpressions4Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..StarNamedExpression1Or(subElement,.addedElement)  {
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
Method StarNamedExpression1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..StarNamedExpressions1RepSep(subElement,.addedElement)  && $S(..addPunctuation(subElement,",") :1,1:1) {
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
Method StarNamedExpressions1RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..StarPattern1Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..StarPattern2Or(subElement,.addedElement)  {
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
Method StarPattern1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method StarPattern2Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..StarTarget1Or(subElement,.addedElement)  {
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
Method StarTarget1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"*")  && ..StarTarget2Sub(subElement,.addedElement)  {
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
Method StarTarget2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..StarTarget3Not(subElement,.addedElement)  && ..StarTarget(subElement,.addedElement)  {
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
Method StarTarget3Not(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..StarTargets1Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..StarTargets3Or(subElement,.addedElement)  {
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
Method StarTargets1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..StarTarget(subElement,.addedElement)  && ..StarTargets2Not(subElement,.addedElement)  {
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
Method StarTargets2Not(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method StarTargets3Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..StarTarget(subElement,.addedElement)  && ..StarTargets4RepZero(subElement,.addedElement)  && $S(..addPunctuation(subElement,",") :1,1:1) {
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
Method StarTargets4RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	; method start
	while ..StarTargets5Sub(subElement,.addedElement)  {
		;
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
Method StarTargets5Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..StarTargetsListSeq1RepSep(subElement,.addedElement)  && $S(..addPunctuation(subElement,",") :1,1:1) {
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
Method StarTargetsListSeq1RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..StarTargetsTupleSeq1Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..StarTargetsTupleSeq4Or(subElement,.addedElement)  {
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
Method StarTargetsTupleSeq1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..StarTarget(subElement,.addedElement)  && ..StarTargetsTupleSeq2RepOne(subElement,.addedElement)  && $S(..addPunctuation(subElement,",") :1,1:1) {
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
Method StarTargetsTupleSeq2RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..StarTargetsTupleSeq3Sub(subElement,.addedElement)  {
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
Method StarTargetsTupleSeq3Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method StarTargetsTupleSeq4Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..StarredExpression1Or(subElement,.addedElement)  {
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
Method StarredExpression1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..StatementNewline1Or(subElement,.addedElement)  {
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
Method StatementNewline1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..Statements1RepOne(subElement,.addedElement)  {
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
Method Statements1RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		set rec=..String1Recurse(subElement,.addedElement)
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
Method String1Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..Strings1RepOne(subElement,.addedElement)  {
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
Method Strings1RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..Strings2Sub(subElement,.addedElement)  {
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
Method Strings2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..SubjectExpr1Or(subElement,.addedElement)  {
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
Method SubjectExpr1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		set rec=..Sum1Recurse(subElement,.addedElement)
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
Method Sum1Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..Sum2Or(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Sum3Or(subElement,.addedElement)  {
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
Method Sum2Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method Sum3Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		set rec=..TPrimary1Recurse(subElement,.addedElement)
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
/// summary=&C&?4LookAhead4?
Method TPrimary10Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Atom(subElement,.addedElement)  && ..TPrimary11Peek(subElement,.addedElement)  {
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
Method TPrimary11Peek(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
/// summary=?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?
Method TPrimary1Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..TPrimary2Or(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..TPrimary4Or(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..TPrimary6Or(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..TPrimary8Or(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..TPrimary10Or(subElement,.addedElement)  {
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
Method TPrimary2Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..TPrimary(subElement,.addedElement)  && ..addPunctuation(subElement,".")  && ..Name(subElement,.addedElement)  && ..TPrimary3Peek(subElement,.addedElement)  {
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
Method TPrimary3Peek(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method TPrimary4Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..TPrimary(subElement,.addedElement)  && ..addPunctuation(subElement,"[")  && ..Slices(subElement,.addedElement)  && ..addPunctuation(subElement,"]")  && ..TPrimary5Peek(subElement,.addedElement)  {
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
Method TPrimary5Peek(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method TPrimary6Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..TPrimary(subElement,.addedElement)  && ..Genexp(subElement,.addedElement)  && ..TPrimary7Peek(subElement,.addedElement)  {
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
Method TPrimary7Peek(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method TPrimary8Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..TPrimary(subElement,.addedElement)  && ..addPunctuation(subElement,"(")  && $S(..Arguments(subElement,.addedElement) :1,1:1) && ..addPunctuation(subElement,")")  && ..TPrimary9Peek(subElement,.addedElement)  {
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
Method TPrimary9Peek(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..TargetWithStarAtom1Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..TargetWithStarAtom3Or(subElement,.addedElement)  {
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
Method TargetWithStarAtom1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..TPrimary(subElement,.addedElement)  && ..addPunctuation(subElement,".")  && ..Name(subElement,.addedElement)  && ..TargetWithStarAtom2Not(subElement,.addedElement)  {
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
Method TargetWithStarAtom2Not(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method TargetWithStarAtom3Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..TPrimary(subElement,.addedElement)  && ..addPunctuation(subElement,"[")  && ..Slices(subElement,.addedElement)  && ..addPunctuation(subElement,"]")  && ..TargetWithStarAtom4Not(subElement,.addedElement)  {
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
Method TargetWithStarAtom4Not(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		set rec=..Term1Recurse(subElement,.addedElement)
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
Method Term1Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..Term2Or(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Term3Or(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Term4Or(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Term5Or(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Term6Or(subElement,.addedElement)  {
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
Method Term2Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method Term3Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method Term4Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method Term5Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method Term6Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..TryStmt1Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..TryStmt2Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..TryStmt4Or(subElement,.addedElement)  {
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
Method TryStmt1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method TryStmt2Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"TRY")  && ..addPunctuation(subElement,":")  && ..Block(subElement,.addedElement)  && ..TryStmt3RepOne(subElement,.addedElement)  && $S(..ElseBlock(subElement,.addedElement) :1,1:1) && $S(..FinallyBlock(subElement,.addedElement) :1,1:1) {
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
Method TryStmt3RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method TryStmt4Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"TRY")  && ..addPunctuation(subElement,":")  && ..Block(subElement,.addedElement)  && ..TryStmt5RepOne(subElement,.addedElement)  && $S(..ElseBlock(subElement,.addedElement) :1,1:1) && $S(..FinallyBlock(subElement,.addedElement) :1,1:1) {
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
Method TryStmt5RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..Tuple1Or(subElement,.addedElement)  {
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
Method Tuple1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"(")  && ..Tuple2OptGrp(subElement,.addedElement)  && ..addPunctuation(subElement,")")  {
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
Method Tuple2OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..TypeAlias1Or(subElement,.addedElement)  {
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
Method TypeAlias1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..TypeExpressions1Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..TypeExpressions3Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..TypeExpressions5Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..TypeExpressions7Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..TypeExpressions8Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..TypeExpressions9Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..TypeExpressions10RepSep(subElement,.addedElement)  {
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

///  ','.expression+
Method TypeExpressions10RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
/// summary=&?4RepeatSep4?&P&P&C&P&P&C
Method TypeExpressions1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..TypeExpressions2RepSep(subElement,.addedElement)  && ..addPunctuation(subElement,",")  && ..addPunctuation(subElement,"*")  && ..Expression(subElement,.addedElement)  && ..addPunctuation(subElement,",")  && ..addPunctuation(subElement,"**")  && ..Expression(subElement,.addedElement)  {
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
Method TypeExpressions2RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method TypeExpressions3Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..TypeExpressions4RepSep(subElement,.addedElement)  && ..addPunctuation(subElement,",")  && ..addPunctuation(subElement,"*")  && ..Expression(subElement,.addedElement)  {
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
Method TypeExpressions4RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method TypeExpressions5Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..TypeExpressions6RepSep(subElement,.addedElement)  && ..addPunctuation(subElement,",")  && ..addPunctuation(subElement,"**")  && ..Expression(subElement,.addedElement)  {
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
Method TypeExpressions6RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method TypeExpressions7Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method TypeExpressions8Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method TypeExpressions9Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..TypeParam1Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..TypeParam2Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..TypeParam3Or(subElement,.addedElement)  {
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
Method TypeParam1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method TypeParam2Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method TypeParam3Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..TypeParamSeq1RepSep(subElement,.addedElement)  && $S(..addPunctuation(subElement,",") :1,1:1) {
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
Method TypeParamSeq1RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..ValuePattern1Or(subElement,.addedElement)  {
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
Method ValuePattern1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Attr(subElement,.addedElement)  && ..ValuePattern2Not(subElement,.addedElement)  {
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
Method ValuePattern2Not(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ValuePattern3Sub(subElement,.addedElement)  { set done=1 }
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
Method ValuePattern3Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..WhileStmt1Or(subElement,.addedElement)  {
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
Method WhileStmt1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..WithItem1Or(subElement,.addedElement)  {
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
Method WithItem1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Expression(subElement,.addedElement)  && ..addKeyword(subElement,"AS")  && ..StarTarget(subElement,.addedElement)  && ..WithItem2Peek(subElement,.addedElement)  {
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
Method WithItem2Peek(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; ruleE=LookAheadRule :(',' | ')' | ':')
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..WithItem3Sub(subElement,.addedElement)  {
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
Method WithItem3Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..WithStmt1Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..WithStmt3Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..WithStmt5Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..WithStmt7Or(subElement,.addedElement)  {
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
Method WithStmt1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"WITH")  && ..addPunctuation(subElement,"(")  && ..WithStmt2RepSep(subElement,.addedElement)  && $s(..addPunctuation(subElement,",") :1,1:1)  && ..addPunctuation(subElement,")")  && ..addPunctuation(subElement,":")  && $S(..TypeComment(subElement,.addedElement) :1,1:1) && ..Block(subElement,.addedElement)  {
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
Method WithStmt2RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method WithStmt3Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"WITH")  && ..WithStmt4RepSep(subElement,.addedElement)  && ..addPunctuation(subElement,":")  && $S(..TypeComment(subElement,.addedElement) :1,1:1) && ..Block(subElement,.addedElement)  {
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
Method WithStmt4RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method WithStmt5Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"ASYNC")  && ..addKeyword(subElement,"WITH")  && ..addPunctuation(subElement,"(")  && ..WithStmt6RepSep(subElement,.addedElement)  && $s(..addPunctuation(subElement,",") :1,1:1)  && ..addPunctuation(subElement,")")  && ..addPunctuation(subElement,":")  && ..Block(subElement,.addedElement)  {
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
Method WithStmt6RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method WithStmt7Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"ASYNC")  && ..addKeyword(subElement,"WITH")  && ..WithStmt8RepSep(subElement,.addedElement)  && ..addPunctuation(subElement,":")  && $S(..TypeComment(subElement,.addedElement) :1,1:1) && ..Block(subElement,.addedElement)  {
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
Method WithStmt8RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		if ..YieldExpr1Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..YieldExpr2Or(subElement,.addedElement)  {
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
Method YieldExpr1Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method YieldExpr2Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
