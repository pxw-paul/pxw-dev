/// Created: 2024-10-20 14:41:52 PXW.DEV.BNF.Compilers.Compiler2
Class PXW.DEV.BNF.GEN.Python Extends PXW.DEV.BNF.super [ ProcedureBlock ]
{

Parameter KeywordPattern = "1A.AN";

Parameter Keywords = "AND,AS,ASSERT,ASYNC,AWAIT,BREAK,CLASS,CONTINUE,DEF,DEL,ELIF,ELSE,EXCEPT,FALSE,FINALLY,FOR,FROM,GLOBAL,IF,IMPORT,IN,IS,LAMBDA,NONE,NONLOCAL,NOT,OR,PASS,RAISE,RETURN,TRUE,TRY,WHILE,WITH,YIELD";

///  annotated_rhs: yield_expr | star_expressions
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  annotation: ':' expression
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  args: | ','.(starred_expression | ( assignment_expression | expression !':=') !'=')+ [',' kwargs ] | kwargs
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
		if ..Args324Or(subElement,.addedElement)  {
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method Args324Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Args325RepSep(subElement,.addedElement)  && ..Args338OptGrp(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  ','.(starred_expression | ( assignment_expression | expression !':=') !'=')+
Method Args325RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	set done=0 ; must be at least 1
	if ..Args326Sub(subElement,.addedElement) {
		set done=1,ok=1 ; found 1
		do {
			$$$BNFSTART(repElement)
			set ok=(..addPunctuation(repElement,",")  && ..Args332Sub(repElement,.addedElement) )
			if ok {
				$$$BNFCOMMIT(repElement,subElement)
			} else {
				$$$BNFROLLBACK(repElement)
			}
		} while ok
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// starred_expression | ( assignment_expression | expression !':=') !'='
Method Args326Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..StarredExpression(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Args327Or(subElement,.addedElement)  {
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

Method Args327Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Args328Sub(subElement,.addedElement)  && ..Args331Not(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  assignment_expression | expression !':='
Method Args328Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..AssignmentExpression(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Args329Or(subElement,.addedElement)  {
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

Method Args329Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(subElement,.addedElement)  && ..Args330Not(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// ':='
Method Args330Not(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,":=")  { set done=1 }
	$$$BNFROLLBACK(subElement)
	if done {
		set ret=0
	} else {
		set ret=1
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// '='
Method Args331Not(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"=")  { set done=1 }
	$$$BNFROLLBACK(subElement)
	if done {
		set ret=0
	} else {
		set ret=1
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// starred_expression | ( assignment_expression | expression !':=') !'='
Method Args332Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..StarredExpression(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Args333Or(subElement,.addedElement)  {
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

Method Args333Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Args334Sub(subElement,.addedElement)  && ..Args337Not(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  assignment_expression | expression !':='
Method Args334Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..AssignmentExpression(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Args335Or(subElement,.addedElement)  {
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

Method Args335Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(subElement,.addedElement)  && ..Args336Not(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// ':='
Method Args336Not(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,":=")  { set done=1 }
	$$$BNFROLLBACK(subElement)
	if done {
		set ret=0
	} else {
		set ret=1
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// '='
Method Args337Not(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"=")  { set done=1 }
	$$$BNFROLLBACK(subElement)
	if done {
		set ret=0
	} else {
		set ret=1
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method Args338OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  && ..Kwargs(subElement,.addedElement)  {
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

///  arguments: | args [','] &')'
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
		if ..Arguments322Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method Arguments322Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Args(subElement,.addedElement)  && $S(..addPunctuation(subElement,",") :1,1:1) && ..Arguments323Peek(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  &')'
Method Arguments323Peek(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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
		set ret=1
		$$$BNFROLLBACK(subElement)
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  as_pattern: | or_pattern 'as' pattern_capture_target
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method AsPattern134Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..OrPattern(subElement,.addedElement)  && ..addKeyword(subElement,"AS")  && ..PatternCaptureTarget(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  assert_stmt: 'assert' expression [',' expression ]
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method AssertStmt29OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  && ..Expression(subElement,.addedElement)  {
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

///  assignment: | NAME ':' expression ['=' annotated_rhs ] | ('(' single_target ')' | single_subscript_attribute_target) ':' expression ['=' annotated_rhs ] | (star_targets '=' )+ (yield_expr | star_expressions) !'=' [TYPE_COMMENT] | single_target augassign ~ (yield_expr | star_expressions)
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method Assignment10OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"=")  && ..AnnotatedRhs(subElement,.addedElement)  {
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

Method Assignment11Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Assignment12Sub(subElement,.addedElement)  && ..addPunctuation(subElement,":")  && ..Expression(subElement,.addedElement)  && ..Assignment13OptGrp(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

/// '(' single_target ')' | single_subscript_attribute_target
Method Assignment12Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"(")  && ..SingleTarget(subElement,.addedElement)  && ..addPunctuation(subElement,")")  {
		set done=1 ; or
	} elseif ..SingleSubscriptAttributeTarget(subElement,.addedElement)  {
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

Method Assignment13OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"=")  && ..AnnotatedRhs(subElement,.addedElement)  {
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

Method Assignment14Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Assignment15RepOne(subElement,.addedElement)  && ..Assignment17Sub(subElement,.addedElement)  && ..Assignment18Not(subElement,.addedElement)  && $S(..TypeComment(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  (star_targets '=' )+
Method Assignment15RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..Assignment16Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

/// star_targets '='
Method Assignment16Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..StarTargets(subElement,.addedElement)  && ..addPunctuation(subElement,"=")  {
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

/// yield_expr | star_expressions
Method Assignment17Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..YieldExpr(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StarExpressions(subElement,.addedElement)  {
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

/// '='
Method Assignment18Not(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"=")  { set done=1 }
	$$$BNFROLLBACK(subElement)
	if done {
		set ret=0
	} else {
		set ret=1
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method Assignment19Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..SingleTarget(subElement,.addedElement)  && ..Augassign(subElement,.addedElement)  && 1 /* force means? */ && ..Assignment20Sub(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

/// yield_expr | star_expressions
Method Assignment20Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..YieldExpr(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StarExpressions(subElement,.addedElement)  {
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

Method Assignment9Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Name(subElement,.addedElement)  && ..addPunctuation(subElement,":")  && ..Expression(subElement,.addedElement)  && ..Assignment10OptGrp(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  assignment_expression: | NAME ':=' ~ expression
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method AssignmentExpression197Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Name(subElement,.addedElement)  && ..addPunctuation(subElement,":=")  && 1 /* force means? */ && ..Expression(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  ASYNC : 'async'
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  atom: | NAME | 'True' | 'False' | 'None' | strings | NUMBER | (tuple | group | genexp) | (list | listcomp) | (dict | set | dictcomp | setcomp) | '...'
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// tuple | group | genexp
Method Atom249Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// list | listcomp
Method Atom250Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..List(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Listcomp(subElement,.addedElement)  {
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

/// dict | set | dictcomp | setcomp
Method Atom251Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  attr: | name_or_attr '.' NAME
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method Attr153Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..NameOrAttr(subElement,.addedElement)  && ..addPunctuation(subElement,".")  && ..Name(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  augassign: | '+=' | '-=' | '*=' | '@=' | '/=' | '%=' | '&=' | '|=' | '^=' | '<<=' | '>>=' | '**=' | '//='
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  AWAIT : 'await'
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  await_primary: | AWAIT primary | primary
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method AwaitPrimary235Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Await(subElement,.addedElement)  && ..Primary(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  bitwise_and: | bitwise_and '&' shift_expr | shift_expr
Method BitwiseAnd(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	set done=0,ok=1,pos=..stream.pos,lastpos=pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set ret=($isobject(subElement))
		if ret $$$BNFCOMMITCOPY(subElement,ParentElement)
		quit ret
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
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		if $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method BitwiseAnd216Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method BitwiseAnd217Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..BitwiseAnd(subElement,.addedElement)  && ..addPunctuation(subElement,"&")  && ..ShiftExpr(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  bitwise_or: | bitwise_or '|' bitwise_xor | bitwise_xor
Method BitwiseOr(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	set done=0,ok=1,pos=..stream.pos,lastpos=pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set ret=($isobject(subElement))
		if ret $$$BNFCOMMITCOPY(subElement,ParentElement)
		quit ret
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
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		if $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method BitwiseOr212Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method BitwiseOr213Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..BitwiseOr(subElement,.addedElement)  && ..addPunctuation(subElement,"|")  && ..BitwiseXor(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  bitwise_xor: | bitwise_xor '^' bitwise_and | bitwise_and
Method BitwiseXor(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	set done=0,ok=1,pos=..stream.pos,lastpos=pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set ret=($isobject(subElement))
		if ret $$$BNFCOMMITCOPY(subElement,ParentElement)
		quit ret
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
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		if $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method BitwiseXor214Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method BitwiseXor215Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..BitwiseXor(subElement,.addedElement)  && ..addPunctuation(subElement,"^")  && ..BitwiseAnd(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  block: | NEWLINE INDENT statements DEDENT | simple_stmts
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method Block47Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Newline(subElement,.addedElement)  && ..Indent(subElement,.addedElement)  && ..Statements(subElement,.addedElement)  && ..Dedent(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  capture_pattern: | pattern_capture_target
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  case_block: | "case" patterns guard? ':' block
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method CaseBlock133Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"CASE")  && ..Patterns(subElement,.addedElement)  && $s(..Guard(subElement,.addedElement) :1,1:1)  && ..addPunctuation(subElement,":")  && ..Block(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  class_def: | decorators class_def_raw | class_def_raw
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method ClassDef50Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Decorators(subElement,.addedElement)  && ..ClassDefRaw(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  class_def_raw: | 'class' NAME [type_params] ['(' [arguments] ')' ] ':' block
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method ClassDefRaw51Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"CLASS")  && ..Name(subElement,.addedElement)  && $S(..TypeParams(subElement,.addedElement) :1,1:1) && ..ClassDefRaw52OptGrp(subElement,.addedElement)  && ..addPunctuation(subElement,":")  && ..Block(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

Method ClassDefRaw52OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"(")  && $S(..Arguments(subElement,.addedElement) :1,1:1) && ..addPunctuation(subElement,")")  {
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

///  class_pattern: | name_or_attr '(' ')' | name_or_attr '(' positional_patterns ','? ')' | name_or_attr '(' keyword_patterns ','? ')' | name_or_attr '(' positional_patterns ',' keyword_patterns ','? ')'
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method ClassPattern170Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..NameOrAttr(subElement,.addedElement)  && ..addPunctuation(subElement,"(")  && ..addPunctuation(subElement,")")  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

Method ClassPattern171Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..NameOrAttr(subElement,.addedElement)  && ..addPunctuation(subElement,"(")  && ..PositionalPatterns(subElement,.addedElement)  && $s(..addPunctuation(subElement,",") :1,1:1)  && ..addPunctuation(subElement,")")  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

Method ClassPattern172Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..NameOrAttr(subElement,.addedElement)  && ..addPunctuation(subElement,"(")  && ..KeywordPatterns(subElement,.addedElement)  && $s(..addPunctuation(subElement,",") :1,1:1)  && ..addPunctuation(subElement,")")  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

Method ClassPattern173Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..NameOrAttr(subElement,.addedElement)  && ..addPunctuation(subElement,"(")  && ..PositionalPatterns(subElement,.addedElement)  && ..addPunctuation(subElement,",")  && ..KeywordPatterns(subElement,.addedElement)  && $s(..addPunctuation(subElement,",") :1,1:1)  && ..addPunctuation(subElement,")")  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  closed_pattern: | literal_pattern | capture_pattern | wildcard_pattern | value_pattern | group_pattern | sequence_pattern | mapping_pattern | class_pattern
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  compare_op_bitwise_or_pair: | eq_bitwise_or | noteq_bitwise_or | lte_bitwise_or | lt_bitwise_or | gte_bitwise_or | gt_bitwise_or | notin_bitwise_or | in_bitwise_or | isnot_bitwise_or | is_bitwise_or
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  comparison: | bitwise_or compare_op_bitwise_or_pair+ | bitwise_or
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method Comparison208Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..BitwiseOr(subElement,.addedElement)  && ..Comparison209RepOne(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  compare_op_bitwise_or_pair+
Method Comparison209RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..CompareOpBitwiseOrPair(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  complex_number: | signed_real_number '+' imaginary_number | signed_real_number '-' imaginary_number
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method ComplexNumber142Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..SignedRealNumber(subElement,.addedElement)  && ..addPunctuation(subElement,"+")  && ..ImaginaryNumber(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

Method ComplexNumber143Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..SignedRealNumber(subElement,.addedElement)  && ..addPunctuation(subElement,"-")  && ..ImaginaryNumber(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  compound_stmt: | function_def | if_stmt | class_def | with_stmt | for_stmt | try_stmt | while_stmt | match_stmt
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  conjunction: | inversion ('and' inversion )+ | inversion
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method Conjunction203Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Inversion(subElement,.addedElement)  && ..Conjunction204RepOne(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  ('and' inversion )+
Method Conjunction204RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..Conjunction205Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

/// 'and' inversion
Method Conjunction205Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"AND")  && ..Inversion(subElement,.addedElement)  {
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

///  decorators: ('@' named_expression NEWLINE )+
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  ('@' named_expression NEWLINE )+
Method Decorators48RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..Decorators49Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

/// '@' named_expression NEWLINE
Method Decorators49Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"@")  && ..NamedExpression(subElement,.addedElement)  && ..Newline(subElement,.addedElement)  {
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

///  DEDENT : 'code dedent'
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  default: '=' expression | invalid_default
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  del_stmt: | 'del' del_targets &(';' | NEWLINE)
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method DelStmt26Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"DEL")  && ..DelTargets(subElement,.addedElement)  && ..DelStmt27Peek(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  &(';' | NEWLINE)
Method DelStmt27Peek(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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
		set ret=1
		$$$BNFROLLBACK(subElement)
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// ';' | NEWLINE
Method DelStmt28Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,";")  {
		set done=1 ; or
	} elseif ..Newline(subElement,.addedElement)  {
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

///  del_t_atom: | NAME | '(' del_target ')' | '(' [del_targets] ')' | '[' [del_targets] ']'
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
		} elseif ..DelTAtom390Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..DelTAtom391Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..DelTAtom392Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method DelTAtom390Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"(")  && ..DelTarget(subElement,.addedElement)  && ..addPunctuation(subElement,")")  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

Method DelTAtom391Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"(")  && $S(..DelTargets(subElement,.addedElement) :1,1:1) && ..addPunctuation(subElement,")")  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

Method DelTAtom392Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"[")  && $S(..DelTargets(subElement,.addedElement) :1,1:1) && ..addPunctuation(subElement,"]")  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  del_target: | t_primary '.' NAME !t_lookahead | t_primary '[' slices ']' !t_lookahead | del_t_atom
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
		if ..DelTarget386Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..DelTarget388Or(subElement,.addedElement)  {
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method DelTarget386Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..TPrimary(subElement,.addedElement)  && ..addPunctuation(subElement,".")  && ..Name(subElement,.addedElement)  && ..DelTarget387Not(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

/// t_lookahead
Method DelTarget387Not(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..TLookahead(subElement,.addedElement)  { set done=1 }
	$$$BNFROLLBACK(subElement)
	if done {
		set ret=0
	} else {
		set ret=1
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method DelTarget388Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..TPrimary(subElement,.addedElement)  && ..addPunctuation(subElement,"[")  && ..Slices(subElement,.addedElement)  && ..addPunctuation(subElement,"]")  && ..DelTarget389Not(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

/// t_lookahead
Method DelTarget389Not(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..TLookahead(subElement,.addedElement)  { set done=1 }
	$$$BNFROLLBACK(subElement)
	if done {
		set ret=0
	} else {
		set ret=1
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  del_targets: ','.del_target+ [',']
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
		if ..DelTargets385RepSep(subElement,.addedElement)  && $S(..addPunctuation(subElement,",") :1,1:1) {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  ','.del_target+
Method DelTargets385RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
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
				$$$BNFCOMMIT(repElement,subElement)
			} else {
				$$$BNFROLLBACK(repElement)
			}
		} while ok
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  dict: | '{' [double_starred_kvpairs] '}'
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
		if ..Dict305Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method Dict305Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"{")  && $S(..DoubleStarredKvpairs(subElement,.addedElement) :1,1:1) && ..addPunctuation(subElement,"}")  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  dictcomp: | '{' kvpair for_if_clauses '}'
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
		if ..Dictcomp321Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method Dictcomp321Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"{")  && ..Kvpair(subElement,.addedElement)  && ..ForIfClauses(subElement,.addedElement)  && ..addPunctuation(subElement,"}")  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  disjunction: | conjunction ('or' conjunction )+ | conjunction
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method Disjunction200Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Conjunction(subElement,.addedElement)  && ..Disjunction201RepOne(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  ('or' conjunction )+
Method Disjunction201RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..Disjunction202Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

/// 'or' conjunction
Method Disjunction202Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"OR")  && ..Conjunction(subElement,.addedElement)  {
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

///  dotted_as_name: | dotted_name ['as' NAME ]
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method DottedAsName43Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..DottedName(subElement,.addedElement)  && ..DottedAsName44OptGrp(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

Method DottedAsName44OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"AS")  && ..Name(subElement,.addedElement)  {
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

///  dotted_as_names: | ','.dotted_as_name+
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  ','.dotted_as_name+
Method DottedAsNames42RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
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
				$$$BNFCOMMIT(repElement,subElement)
			} else {
				$$$BNFROLLBACK(repElement)
			}
		} while ok
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  dotted_name: | dotted_name '.' NAME | NAME
Method DottedName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	set done=0,ok=1,pos=..stream.pos,lastpos=pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set ret=($isobject(subElement))
		if ret $$$BNFCOMMITCOPY(subElement,ParentElement)
		quit ret
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
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		if $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method DottedName45Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method DottedName46Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..DottedName(subElement,.addedElement)  && ..addPunctuation(subElement,".")  && ..Name(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  double_star_pattern: | '**' pattern_capture_target
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method DoubleStarPattern169Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"**")  && ..PatternCaptureTarget(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  double_starred_kvpair: | '**' bitwise_or | kvpair
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
		if ..DoubleStarredKvpair307Or(subElement,.addedElement)  {
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method DoubleStarredKvpair307Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"**")  && ..BitwiseOr(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  double_starred_kvpairs: ','.double_starred_kvpair+ [',']
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
		if ..DoubleStarredKvpairs306RepSep(subElement,.addedElement)  && $S(..addPunctuation(subElement,",") :1,1:1) {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  ','.double_starred_kvpair+
Method DoubleStarredKvpairs306RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
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
				$$$BNFCOMMIT(repElement,subElement)
			} else {
				$$$BNFROLLBACK(repElement)
			}
		} while ok
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  elif_stmt: | 'elif' named_expression ':' block elif_stmt | 'elif' named_expression ':' block [else_block]
Method ElifStmt(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	set done=0,ok=1,pos=..stream.pos,lastpos=pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set ret=($isobject(subElement))
		if ret $$$BNFCOMMITCOPY(subElement,ParentElement)
		quit ret
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
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		if $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method ElifStmt101Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method ElifStmt102Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"ELIF")  && ..NamedExpression(subElement,.addedElement)  && ..addPunctuation(subElement,":")  && ..Block(subElement,.addedElement)  && ..ElifStmt(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method ElifStmt103Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"ELIF")  && ..NamedExpression(subElement,.addedElement)  && ..addPunctuation(subElement,":")  && ..Block(subElement,.addedElement)  && $S(..ElseBlock(subElement,.addedElement) :1,1:1) {
		set done=1 ; end compileRules
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  else_block: | 'else' ':' block
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method ElseBlock104Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"ELSE")  && ..addPunctuation(subElement,":")  && ..Block(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  ENDMARKER : 'code endmarker'
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  eq_bitwise_or: '==' bitwise_or
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  eval: expressions NEWLINE* ENDMARKER
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  NEWLINE*
Method Eval1RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	while ..Newline(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  except_block: | 'except' expression ['as' NAME ] ':' block | 'except' ':' block
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method ExceptBlock124Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"EXCEPT")  && ..Expression(subElement,.addedElement)  && ..ExceptBlock125OptGrp(subElement,.addedElement)  && ..addPunctuation(subElement,":")  && ..Block(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

Method ExceptBlock125OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"AS")  && ..Name(subElement,.addedElement)  {
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

Method ExceptBlock126Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"EXCEPT")  && ..addPunctuation(subElement,":")  && ..Block(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  except_star_block: | 'except' '*' expression ['as' NAME ] ':' block
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method ExceptStarBlock127Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"EXCEPT")  && ..addPunctuation(subElement,"*")  && ..Expression(subElement,.addedElement)  && ..ExceptStarBlock128OptGrp(subElement,.addedElement)  && ..addPunctuation(subElement,":")  && ..Block(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

Method ExceptStarBlock128OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"AS")  && ..Name(subElement,.addedElement)  {
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

///  expression: | disjunction 'if' disjunction 'else' expression | disjunction | lambdef
Method Expression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	set done=0,ok=1,pos=..stream.pos,lastpos=pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set ret=($isobject(subElement))
		if ret $$$BNFCOMMITCOPY(subElement,ParentElement)
		quit ret
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
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		if $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method Expression186Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method Expression187Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Disjunction(subElement,.addedElement)  && ..addKeyword(subElement,"IF")  && ..Disjunction(subElement,.addedElement)  && ..addKeyword(subElement,"ELSE")  && ..Expression(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  expressions: | expression (',' expression )+ [','] | expression ',' | expression
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method Expressions182Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Expression(subElement,.addedElement)  && ..Expressions183RepOne(subElement,.addedElement)  && $S(..addPunctuation(subElement,",") :1,1:1) {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  (',' expression )+
Method Expressions183RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..Expressions184Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

/// ',' expression
Method Expressions184Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  && ..Expression(subElement,.addedElement)  {
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

Method Expressions185Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Expression(subElement,.addedElement)  && ..addPunctuation(subElement,",")  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  factor: | '+' factor | '-' factor | '~' factor | power
Method Factor(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	set done=0,ok=1,pos=..stream.pos,lastpos=pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set ret=($isobject(subElement))
		if ret $$$BNFCOMMITCOPY(subElement,ParentElement)
		quit ret
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
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		if $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method Factor230Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method Factor231Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"+")  && ..Factor(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method Factor232Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"-")  && ..Factor(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method Factor233Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"~")  && ..Factor(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  file: [statements] ENDMARKER
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  finally_block: | 'finally' ':' block
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method FinallyBlock129Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"FINALLY")  && ..addPunctuation(subElement,":")  && ..Block(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  for_if_clause: | ASYNC 'for' star_targets 'in' ~ disjunction ('if' disjunction )* | 'for' star_targets 'in' ~ disjunction ('if' disjunction )*
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
		if ..ForIfClause309Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..ForIfClause312Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method ForIfClause309Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Async(subElement,.addedElement)  && ..addKeyword(subElement,"FOR")  && ..StarTargets(subElement,.addedElement)  && ..addKeyword(subElement,"IN")  && 1 /* force means? */ && ..Disjunction(subElement,.addedElement)  && ..ForIfClause310RepZero(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  ('if' disjunction )*
Method ForIfClause310RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	while ..ForIfClause311Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

/// 'if' disjunction
Method ForIfClause311Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"IF")  && ..Disjunction(subElement,.addedElement)  {
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

Method ForIfClause312Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"FOR")  && ..StarTargets(subElement,.addedElement)  && ..addKeyword(subElement,"IN")  && 1 /* force means? */ && ..Disjunction(subElement,.addedElement)  && ..ForIfClause313RepZero(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  ('if' disjunction )*
Method ForIfClause313RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	while ..ForIfClause314Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

/// 'if' disjunction
Method ForIfClause314Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"IF")  && ..Disjunction(subElement,.addedElement)  {
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

///  for_if_clauses: | for_if_clause+
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
		if ..ForIfClauses308RepOne(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  for_if_clause+
Method ForIfClauses308RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..ForIfClause(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  for_stmt: | 'for' star_targets 'in' ~ star_expressions ':' [TYPE_COMMENT] block [else_block] | ASYNC 'for' star_targets 'in' ~ star_expressions ':' [TYPE_COMMENT] block [else_block]
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method ForStmt106Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"FOR")  && ..StarTargets(subElement,.addedElement)  && ..addKeyword(subElement,"IN")  && 1 /* force means? */ && ..StarExpressions(subElement,.addedElement)  && ..addPunctuation(subElement,":")  && $S(..TypeComment(subElement,.addedElement) :1,1:1) && ..Block(subElement,.addedElement)  && $S(..ElseBlock(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

Method ForStmt107Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Async(subElement,.addedElement)  && ..addKeyword(subElement,"FOR")  && ..StarTargets(subElement,.addedElement)  && ..addKeyword(subElement,"IN")  && 1 /* force means? */ && ..StarExpressions(subElement,.addedElement)  && ..addPunctuation(subElement,":")  && $S(..TypeComment(subElement,.addedElement) :1,1:1) && ..Block(subElement,.addedElement)  && $S(..ElseBlock(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  fstring: | FSTRING_START fstring_middle* FSTRING_END
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
		if ..Fstring297Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method Fstring297Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..FstringStart(subElement,.addedElement)  && ..Fstring298RepZero(subElement,.addedElement)  && ..FstringEnd(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  fstring_middle*
Method Fstring298RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	while ..FstringMiddle(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  fstring_conversion: | "!" NAME
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
		if ..FstringConversion294Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method FstringConversion294Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"!")  && ..Name(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  FSTRING_END : 'code fstring_end'
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  fstring_format_spec: | FSTRING_MIDDLE | fstring_replacement_field
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  fstring_full_format_spec: | ':' fstring_format_spec*
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
		if ..FstringFullFormatSpec295Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method FstringFullFormatSpec295Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,":")  && ..FstringFullFormatSpec296RepZero(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  fstring_format_spec*
Method FstringFullFormatSpec296RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	while ..FstringFormatSpec(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  fstring_middle: | fstring_replacement_field | FSTRING_MIDDLE
Method FstringMiddle(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	set done=0,ok=1,pos=..stream.pos,lastpos=pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set ret=($isobject(subElement))
		if ret $$$BNFCOMMITCOPY(subElement,ParentElement)
		quit ret
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
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		if $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method FstringMiddle291Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  fstring_replacement_field: | '{' (yield_expr | star_expressions) '='? [fstring_conversion] [fstring_full_format_spec] '}'
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method FstringReplacementField292Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"{")  && ..FstringReplacementField293Sub(subElement,.addedElement)  && $s(..addPunctuation(subElement,"=") :1,1:1)  && $S(..FstringConversion(subElement,.addedElement) :1,1:1) && $S(..FstringFullFormatSpec(subElement,.addedElement) :1,1:1) && ..addPunctuation(subElement,"}")  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

/// yield_expr | star_expressions
Method FstringReplacementField293Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..YieldExpr(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StarExpressions(subElement,.addedElement)  {
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

///  FSTRING_START : 'code fstring_start'
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  func_type: '(' [type_expressions] ')' '->' expression NEWLINE* ENDMARKER
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  NEWLINE*
Method FuncType2RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	while ..Newline(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  func_type_comment: | NEWLINE TYPE_COMMENT &(NEWLINE INDENT) | TYPE_COMMENT
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
		if ..FuncTypeComment403Or(subElement,.addedElement)  {
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method FuncTypeComment403Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Newline(subElement,.addedElement)  && ..TypeComment(subElement,.addedElement)  && ..FuncTypeComment404Peek(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  &(NEWLINE INDENT)
Method FuncTypeComment404Peek(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; ruleE=LookAheadRule :(NEWLINE INDENT)
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..FuncTypeComment405Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
		$$$BNFROLLBACK(subElement)
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// NEWLINE INDENT
Method FuncTypeComment405Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Newline(subElement,.addedElement)  && ..Indent(subElement,.addedElement)  {
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

///  function_def: | decorators function_def_raw | function_def_raw
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method FunctionDef53Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Decorators(subElement,.addedElement)  && ..FunctionDefRaw(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  function_def_raw: | 'def' NAME [type_params] '(' [params] ')' ['->' expression ] ':' [func_type_comment] block | ASYNC 'def' NAME [type_params] '(' [params] ')' ['->' expression ] ':' [func_type_comment] block
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method FunctionDefRaw54Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"DEF")  && ..Name(subElement,.addedElement)  && $S(..TypeParams(subElement,.addedElement) :1,1:1) && ..addPunctuation(subElement,"(")  && $S(..Params(subElement,.addedElement) :1,1:1) && ..addPunctuation(subElement,")")  && ..FunctionDefRaw55OptGrp(subElement,.addedElement)  && ..addPunctuation(subElement,":")  && $S(..FuncTypeComment(subElement,.addedElement) :1,1:1) && ..Block(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

Method FunctionDefRaw55OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"->")  && ..Expression(subElement,.addedElement)  {
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

Method FunctionDefRaw56Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Async(subElement,.addedElement)  && ..addKeyword(subElement,"DEF")  && ..Name(subElement,.addedElement)  && $S(..TypeParams(subElement,.addedElement) :1,1:1) && ..addPunctuation(subElement,"(")  && $S(..Params(subElement,.addedElement) :1,1:1) && ..addPunctuation(subElement,")")  && ..FunctionDefRaw57OptGrp(subElement,.addedElement)  && ..addPunctuation(subElement,":")  && $S(..FuncTypeComment(subElement,.addedElement) :1,1:1) && ..Block(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

Method FunctionDefRaw57OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"->")  && ..Expression(subElement,.addedElement)  {
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

///  genexp: | '(' ( assignment_expression | expression !':=') for_if_clauses ')'
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
		if ..Genexp317Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method Genexp317Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"(")  && ..Genexp318Sub(subElement,.addedElement)  && ..ForIfClauses(subElement,.addedElement)  && ..addPunctuation(subElement,")")  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  assignment_expression | expression !':='
Method Genexp318Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..AssignmentExpression(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Genexp319Or(subElement,.addedElement)  {
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

Method Genexp319Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Expression(subElement,.addedElement)  && ..Genexp320Not(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// ':='
Method Genexp320Not(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,":=")  { set done=1 }
	$$$BNFROLLBACK(subElement)
	if done {
		set ret=0
	} else {
		set ret=1
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  global_stmt: 'global' ','.NAME+
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  ','.NAME+
Method GlobalStmt24RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
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
				$$$BNFCOMMIT(repElement,subElement)
			} else {
				$$$BNFROLLBACK(repElement)
			}
		} while ok
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  group: | '(' (yield_expr | named_expression) ')'
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method Group252Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"(")  && ..Group253Sub(subElement,.addedElement)  && ..addPunctuation(subElement,")")  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

/// yield_expr | named_expression
Method Group253Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..YieldExpr(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..NamedExpression(subElement,.addedElement)  {
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

///  group_pattern: | '(' pattern ')'
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method GroupPattern154Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"(")  && ..Pattern(subElement,.addedElement)  && ..addPunctuation(subElement,")")  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  gt_bitwise_or: '>' bitwise_or
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  gte_bitwise_or: '>=' bitwise_or
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  guard: 'if' named_expression
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  if_stmt: | 'if' named_expression ':' block elif_stmt | 'if' named_expression ':' block [else_block]
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method IfStmt100Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"IF")  && ..NamedExpression(subElement,.addedElement)  && ..addPunctuation(subElement,":")  && ..Block(subElement,.addedElement)  && $S(..ElseBlock(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

Method IfStmt99Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"IF")  && ..NamedExpression(subElement,.addedElement)  && ..addPunctuation(subElement,":")  && ..Block(subElement,.addedElement)  && ..ElifStmt(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  imaginary_number: | NUMBER
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  import_from: | 'from' ('.' | '...')* dotted_name 'import' import_from_targets | 'from' ('.' | '...')+ 'import' import_from_targets
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method ImportFrom30Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"FROM")  && ..ImportFrom31RepZero(subElement,.addedElement)  && ..DottedName(subElement,.addedElement)  && ..addKeyword(subElement,"IMPORT")  && ..ImportFromTargets(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  ('.' | '...')*
Method ImportFrom31RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	while ..ImportFrom32Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

/// '.' | '...'
Method ImportFrom32Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,".")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"...")  {
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

Method ImportFrom33Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"FROM")  && ..ImportFrom34RepOne(subElement,.addedElement)  && ..addKeyword(subElement,"IMPORT")  && ..ImportFromTargets(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  ('.' | '...')+
Method ImportFrom34RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..ImportFrom35Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

/// '.' | '...'
Method ImportFrom35Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,".")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"...")  {
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

///  import_from_as_name: | NAME ['as' NAME ]
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method ImportFromAsName40Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Name(subElement,.addedElement)  && ..ImportFromAsName41OptGrp(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

Method ImportFromAsName41OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"AS")  && ..Name(subElement,.addedElement)  {
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

///  import_from_as_names: | ','.import_from_as_name+
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  ','.import_from_as_name+
Method ImportFromAsNames39RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
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
				$$$BNFCOMMIT(repElement,subElement)
			} else {
				$$$BNFROLLBACK(repElement)
			}
		} while ok
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  import_from_targets: | '(' import_from_as_names [','] ')' | import_from_as_names !',' | '*'
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method ImportFromTargets36Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"(")  && ..ImportFromAsNames(subElement,.addedElement)  && $S(..addPunctuation(subElement,",") :1,1:1) && ..addPunctuation(subElement,")")  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

Method ImportFromTargets37Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..ImportFromAsNames(subElement,.addedElement)  && ..ImportFromTargets38Not(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

/// ','
Method ImportFromTargets38Not(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  { set done=1 }
	$$$BNFROLLBACK(subElement)
	if done {
		set ret=0
	} else {
		set ret=1
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  import_name: 'import' dotted_as_names
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  import_stmt: | import_name | import_from
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  in_bitwise_or: 'in' bitwise_or
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  INDENT : 'code indent'
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  interactive: statement_newline
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  invalid_default : 'code invalid_default'
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  inversion: | 'not' inversion | comparison
Method Inversion(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	set done=0,ok=1,pos=..stream.pos,lastpos=pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set ret=($isobject(subElement))
		if ret $$$BNFCOMMITCOPY(subElement,ParentElement)
		quit ret
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
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		if $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method Inversion206Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method Inversion207Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"NOT")  && ..Inversion(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  is_bitwise_or: 'is' bitwise_or
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  isnot_bitwise_or: 'is' 'not' bitwise_or
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  items_pattern: | ','.key_value_pattern+
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  ','.key_value_pattern+
Method ItemsPattern166RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
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
				$$$BNFCOMMIT(repElement,subElement)
			} else {
				$$$BNFROLLBACK(repElement)
			}
		} while ok
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  key_value_pattern: | (literal_expr | attr) ':' pattern
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method KeyValuePattern167Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..KeyValuePattern168Sub(subElement,.addedElement)  && ..addPunctuation(subElement,":")  && ..Pattern(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

/// literal_expr | attr
Method KeyValuePattern168Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LiteralExpr(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Attr(subElement,.addedElement)  {
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

///  keyword_pattern: | NAME '=' pattern
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method KeywordPattern176Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Name(subElement,.addedElement)  && ..addPunctuation(subElement,"=")  && ..Pattern(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  keyword_patterns: | ','.keyword_pattern+
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  ','.keyword_pattern+
Method KeywordPatterns175RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
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
				$$$BNFCOMMIT(repElement,subElement)
			} else {
				$$$BNFROLLBACK(repElement)
			}
		} while ok
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  kvpair: expression ':' expression
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  kwarg_or_double_starred: | NAME '=' expression | '**' expression
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
		if ..KwargOrDoubleStarred346Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..KwargOrDoubleStarred347Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method KwargOrDoubleStarred346Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Name(subElement,.addedElement)  && ..addPunctuation(subElement,"=")  && ..Expression(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

Method KwargOrDoubleStarred347Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"**")  && ..Expression(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  kwarg_or_starred: | NAME '=' expression | starred_expression
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
		if ..KwargOrStarred345Or(subElement,.addedElement)  {
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method KwargOrStarred345Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Name(subElement,.addedElement)  && ..addPunctuation(subElement,"=")  && ..Expression(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  kwargs: | ','.kwarg_or_starred+ ',' ','.kwarg_or_double_starred+ | ','.kwarg_or_starred+ | ','.kwarg_or_double_starred+
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
		if ..Kwargs339Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..Kwargs342RepSep(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..Kwargs343RepSep(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method Kwargs339Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Kwargs340RepSep(subElement,.addedElement)  && ..addPunctuation(subElement,",")  && ..Kwargs341RepSep(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  ','.kwarg_or_starred+
Method Kwargs340RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
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
				$$$BNFCOMMIT(repElement,subElement)
			} else {
				$$$BNFROLLBACK(repElement)
			}
		} while ok
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  ','.kwarg_or_double_starred+
Method Kwargs341RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
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
				$$$BNFCOMMIT(repElement,subElement)
			} else {
				$$$BNFROLLBACK(repElement)
			}
		} while ok
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  ','.kwarg_or_starred+
Method Kwargs342RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
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
				$$$BNFCOMMIT(repElement,subElement)
			} else {
				$$$BNFROLLBACK(repElement)
			}
		} while ok
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  ','.kwarg_or_double_starred+
Method Kwargs343RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
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
				$$$BNFCOMMIT(repElement,subElement)
			} else {
				$$$BNFROLLBACK(repElement)
			}
		} while ok
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  kwds: | '**' param_no_default
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method Kwds86Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"**")  && ..ParamNoDefault(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  lambda_kwds: | '**' lambda_param_no_default
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method LambdaKwds281Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"**")  && ..LambdaParamNoDefault(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  lambda_param: NAME
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  lambda_param_maybe_default: | lambda_param default? ',' | lambda_param default? &':'
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method LambdaParamMaybeDefault288Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..LambdaParam(subElement,.addedElement)  && $s(..Default(subElement,.addedElement) :1,1:1)  && ..addPunctuation(subElement,",")  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

Method LambdaParamMaybeDefault289Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..LambdaParam(subElement,.addedElement)  && $s(..Default(subElement,.addedElement) :1,1:1)  && ..LambdaParamMaybeDefault290Peek(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  &':'
Method LambdaParamMaybeDefault290Peek(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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
		set ret=1
		$$$BNFROLLBACK(subElement)
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  lambda_param_no_default: | lambda_param ',' | lambda_param &':'
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method LambdaParamNoDefault282Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..LambdaParam(subElement,.addedElement)  && ..addPunctuation(subElement,",")  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

Method LambdaParamNoDefault283Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..LambdaParam(subElement,.addedElement)  && ..LambdaParamNoDefault284Peek(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  &':'
Method LambdaParamNoDefault284Peek(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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
		set ret=1
		$$$BNFROLLBACK(subElement)
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  lambda_param_with_default: | lambda_param default ',' | lambda_param default &':'
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method LambdaParamWithDefault285Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..LambdaParam(subElement,.addedElement)  && ..Default(subElement,.addedElement)  && ..addPunctuation(subElement,",")  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

Method LambdaParamWithDefault286Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..LambdaParam(subElement,.addedElement)  && ..Default(subElement,.addedElement)  && ..LambdaParamWithDefault287Peek(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  &':'
Method LambdaParamWithDefault287Peek(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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
		set ret=1
		$$$BNFROLLBACK(subElement)
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  lambda_parameters: | lambda_slash_no_default lambda_param_no_default* lambda_param_with_default* [lambda_star_etc] | lambda_slash_with_default lambda_param_with_default* [lambda_star_etc] | lambda_param_no_default+ lambda_param_with_default* [lambda_star_etc] | lambda_param_with_default+ [lambda_star_etc] | lambda_star_etc
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method LambdaParameters255Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..LambdaSlashNoDefault(subElement,.addedElement)  && ..LambdaParameters256RepZero(subElement,.addedElement)  && ..LambdaParameters257RepZero(subElement,.addedElement)  && $S(..LambdaStarEtc(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  lambda_param_no_default*
Method LambdaParameters256RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	while ..LambdaParamNoDefault(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  lambda_param_with_default*
Method LambdaParameters257RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	while ..LambdaParamWithDefault(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

Method LambdaParameters258Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..LambdaSlashWithDefault(subElement,.addedElement)  && ..LambdaParameters259RepZero(subElement,.addedElement)  && $S(..LambdaStarEtc(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  lambda_param_with_default*
Method LambdaParameters259RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	while ..LambdaParamWithDefault(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

Method LambdaParameters260Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..LambdaParameters261RepOne(subElement,.addedElement)  && ..LambdaParameters262RepZero(subElement,.addedElement)  && $S(..LambdaStarEtc(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  lambda_param_no_default+
Method LambdaParameters261RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..LambdaParamNoDefault(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  lambda_param_with_default*
Method LambdaParameters262RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	while ..LambdaParamWithDefault(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

Method LambdaParameters263Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..LambdaParameters264RepOne(subElement,.addedElement)  && $S(..LambdaStarEtc(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  lambda_param_with_default+
Method LambdaParameters264RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..LambdaParamWithDefault(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  lambda_params: | lambda_parameters
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  lambda_slash_no_default: | lambda_param_no_default+ '/' ',' | lambda_param_no_default+ '/' &':'
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method LambdaSlashNoDefault265Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..LambdaSlashNoDefault266RepOne(subElement,.addedElement)  && ..addPunctuation(subElement,"/")  && ..addPunctuation(subElement,",")  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  lambda_param_no_default+
Method LambdaSlashNoDefault266RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..LambdaParamNoDefault(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

Method LambdaSlashNoDefault267Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..LambdaSlashNoDefault268RepOne(subElement,.addedElement)  && ..addPunctuation(subElement,"/")  && ..LambdaSlashNoDefault269Peek(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  lambda_param_no_default+
Method LambdaSlashNoDefault268RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..LambdaParamNoDefault(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  &':'
Method LambdaSlashNoDefault269Peek(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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
		set ret=1
		$$$BNFROLLBACK(subElement)
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  lambda_slash_with_default: | lambda_param_no_default* lambda_param_with_default+ '/' ',' | lambda_param_no_default* lambda_param_with_default+ '/' &':'
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method LambdaSlashWithDefault270Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..LambdaSlashWithDefault271RepZero(subElement,.addedElement)  && ..LambdaSlashWithDefault272RepOne(subElement,.addedElement)  && ..addPunctuation(subElement,"/")  && ..addPunctuation(subElement,",")  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  lambda_param_no_default*
Method LambdaSlashWithDefault271RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	while ..LambdaParamNoDefault(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  lambda_param_with_default+
Method LambdaSlashWithDefault272RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..LambdaParamWithDefault(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

Method LambdaSlashWithDefault273Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..LambdaSlashWithDefault274RepZero(subElement,.addedElement)  && ..LambdaSlashWithDefault275RepOne(subElement,.addedElement)  && ..addPunctuation(subElement,"/")  && ..LambdaSlashWithDefault276Peek(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  lambda_param_no_default*
Method LambdaSlashWithDefault274RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	while ..LambdaParamNoDefault(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  lambda_param_with_default+
Method LambdaSlashWithDefault275RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..LambdaParamWithDefault(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  &':'
Method LambdaSlashWithDefault276Peek(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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
		set ret=1
		$$$BNFROLLBACK(subElement)
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  lambda_star_etc: | '*' lambda_param_no_default lambda_param_maybe_default* [lambda_kwds] | '*' ',' lambda_param_maybe_default+ [lambda_kwds] | lambda_kwds
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method LambdaStarEtc277Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"*")  && ..LambdaParamNoDefault(subElement,.addedElement)  && ..LambdaStarEtc278RepZero(subElement,.addedElement)  && $S(..LambdaKwds(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  lambda_param_maybe_default*
Method LambdaStarEtc278RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	while ..LambdaParamMaybeDefault(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

Method LambdaStarEtc279Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"*")  && ..addPunctuation(subElement,",")  && ..LambdaStarEtc280RepOne(subElement,.addedElement)  && $S(..LambdaKwds(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  lambda_param_maybe_default+
Method LambdaStarEtc280RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..LambdaParamMaybeDefault(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  lambdef: | 'lambda' [lambda_params] ':' expression
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method Lambdef254Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"LAMBDA")  && $S(..LambdaParams(subElement,.addedElement) :1,1:1) && ..addPunctuation(subElement,":")  && ..Expression(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  list: | '[' [star_named_expressions] ']'
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
		if ..List302Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method List302Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"[")  && $S(..StarNamedExpressions(subElement,.addedElement) :1,1:1) && ..addPunctuation(subElement,"]")  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  listcomp: | '[' named_expression for_if_clauses ']'
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
		if ..Listcomp315Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method Listcomp315Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"[")  && ..NamedExpression(subElement,.addedElement)  && ..ForIfClauses(subElement,.addedElement)  && ..addPunctuation(subElement,"]")  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  literal_expr: | signed_number !('+' | '-') | complex_number | strings | 'None' | 'True' | 'False'
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method LiteralExpr139Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..SignedNumber(subElement,.addedElement)  && ..LiteralExpr140Not(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

/// ('+' | '-')
Method LiteralExpr140Not(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LiteralExpr141Sub(subElement,.addedElement)  { set done=1 }
	$$$BNFROLLBACK(subElement)
	if done {
		set ret=0
	} else {
		set ret=1
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// '+' | '-'
Method LiteralExpr141Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"+")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"-")  {
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

///  literal_pattern: | signed_number !('+' | '-') | complex_number | strings | 'None' | 'True' | 'False'
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method LiteralPattern136Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..SignedNumber(subElement,.addedElement)  && ..LiteralPattern137Not(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

/// ('+' | '-')
Method LiteralPattern137Not(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LiteralPattern138Sub(subElement,.addedElement)  { set done=1 }
	$$$BNFROLLBACK(subElement)
	if done {
		set ret=0
	} else {
		set ret=1
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// '+' | '-'
Method LiteralPattern138Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"+")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"-")  {
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

///  lt_bitwise_or: '<' bitwise_or
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  lte_bitwise_or: '<=' bitwise_or
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  mapping_pattern: | '{' '}' | '{' double_star_pattern ','? '}' | '{' items_pattern ',' double_star_pattern ','? '}' | '{' items_pattern ','? '}'
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method MappingPattern162Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"{")  && ..addPunctuation(subElement,"}")  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

Method MappingPattern163Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"{")  && ..DoubleStarPattern(subElement,.addedElement)  && $s(..addPunctuation(subElement,",") :1,1:1)  && ..addPunctuation(subElement,"}")  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

Method MappingPattern164Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"{")  && ..ItemsPattern(subElement,.addedElement)  && ..addPunctuation(subElement,",")  && ..DoubleStarPattern(subElement,.addedElement)  && $s(..addPunctuation(subElement,",") :1,1:1)  && ..addPunctuation(subElement,"}")  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

Method MappingPattern165Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"{")  && ..ItemsPattern(subElement,.addedElement)  && $s(..addPunctuation(subElement,",") :1,1:1)  && ..addPunctuation(subElement,"}")  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  match_stmt: | "match" subject_expr ':' NEWLINE INDENT case_block+ DEDENT
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method MatchStmt130Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"MATCH")  && ..SubjectExpr(subElement,.addedElement)  && ..addPunctuation(subElement,":")  && ..Newline(subElement,.addedElement)  && ..Indent(subElement,.addedElement)  && ..MatchStmt131RepOne(subElement,.addedElement)  && ..Dedent(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  case_block+
Method MatchStmt131RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..CaseBlock(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  maybe_sequence_pattern: | ','.maybe_star_pattern+ ','?
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method MaybeSequencePattern158Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..MaybeSequencePattern159RepSep(subElement,.addedElement)  && $s(..addPunctuation(subElement,",") :1,1:1)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  ','.maybe_star_pattern+
Method MaybeSequencePattern159RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
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
				$$$BNFCOMMIT(repElement,subElement)
			} else {
				$$$BNFROLLBACK(repElement)
			}
		} while ok
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  maybe_star_pattern: | star_pattern | pattern
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  NAME : 'code name'
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  name_or_attr: | attr | NAME
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  named_expression: | assignment_expression | expression !':='
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method NamedExpression198Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Expression(subElement,.addedElement)  && ..NamedExpression199Not(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

/// ':='
Method NamedExpression199Not(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,":=")  { set done=1 }
	$$$BNFROLLBACK(subElement)
	if done {
		set ret=0
	} else {
		set ret=1
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  NEWLINE : 'code newline'
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  nonlocal_stmt: 'nonlocal' ','.NAME+
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  ','.NAME+
Method NonlocalStmt25RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
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
				$$$BNFCOMMIT(repElement,subElement)
			} else {
				$$$BNFROLLBACK(repElement)
			}
		} while ok
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  noteq_bitwise_or: | ('!=' ) bitwise_or
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method NoteqBitwiseOr210Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..NoteqBitwiseOr211Sub(subElement,.addedElement)  && ..BitwiseOr(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

/// '!='
Method NoteqBitwiseOr211Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	Set subElement=ParentElement
	if ..addPunctuation(subElement,"!=")  {
		set done=1 ; end compileRules
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  notin_bitwise_or: 'not' 'in' bitwise_or
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  NUMBER : 'code number'
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  open_sequence_pattern: | maybe_star_pattern ',' maybe_sequence_pattern?
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method OpenSequencePattern157Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..MaybeStarPattern(subElement,.addedElement)  && ..addPunctuation(subElement,",")  && $s(..MaybeSequencePattern(subElement,.addedElement) :1,1:1)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  or_pattern: | '|'.closed_pattern+
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  '|'.closed_pattern+
Method OrPattern135RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
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
				$$$BNFCOMMIT(repElement,subElement)
			} else {
				$$$BNFROLLBACK(repElement)
			}
		} while ok
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  param: NAME annotation?
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  param_maybe_default: | param default? ',' TYPE_COMMENT? | param default? TYPE_COMMENT? &')'
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method ParamMaybeDefault96Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Param(subElement,.addedElement)  && $s(..Default(subElement,.addedElement) :1,1:1)  && ..addPunctuation(subElement,",")  && $s(..TypeComment(subElement,.addedElement) :1,1:1)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

Method ParamMaybeDefault97Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Param(subElement,.addedElement)  && $s(..Default(subElement,.addedElement) :1,1:1)  && $s(..TypeComment(subElement,.addedElement) :1,1:1)  && ..ParamMaybeDefault98Peek(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  &')'
Method ParamMaybeDefault98Peek(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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
		set ret=1
		$$$BNFROLLBACK(subElement)
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  param_no_default: | param ',' TYPE_COMMENT? | param TYPE_COMMENT? &')'
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method ParamNoDefault87Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Param(subElement,.addedElement)  && ..addPunctuation(subElement,",")  && $s(..TypeComment(subElement,.addedElement) :1,1:1)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

Method ParamNoDefault88Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Param(subElement,.addedElement)  && $s(..TypeComment(subElement,.addedElement) :1,1:1)  && ..ParamNoDefault89Peek(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  &')'
Method ParamNoDefault89Peek(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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
		set ret=1
		$$$BNFROLLBACK(subElement)
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  param_no_default_star_annotation: | param_star_annotation ',' TYPE_COMMENT? | param_star_annotation TYPE_COMMENT? &')'
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method ParamNoDefaultStarAnnotation90Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..ParamStarAnnotation(subElement,.addedElement)  && ..addPunctuation(subElement,",")  && $s(..TypeComment(subElement,.addedElement) :1,1:1)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

Method ParamNoDefaultStarAnnotation91Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..ParamStarAnnotation(subElement,.addedElement)  && $s(..TypeComment(subElement,.addedElement) :1,1:1)  && ..ParamNoDefaultStarAnnotation92Peek(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  &')'
Method ParamNoDefaultStarAnnotation92Peek(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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
		set ret=1
		$$$BNFROLLBACK(subElement)
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  param_star_annotation: NAME star_annotation
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  param_with_default: | param default ',' TYPE_COMMENT? | param default TYPE_COMMENT? &')'
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method ParamWithDefault93Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Param(subElement,.addedElement)  && ..Default(subElement,.addedElement)  && ..addPunctuation(subElement,",")  && $s(..TypeComment(subElement,.addedElement) :1,1:1)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

Method ParamWithDefault94Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Param(subElement,.addedElement)  && ..Default(subElement,.addedElement)  && $s(..TypeComment(subElement,.addedElement) :1,1:1)  && ..ParamWithDefault95Peek(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  &')'
Method ParamWithDefault95Peek(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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
		set ret=1
		$$$BNFROLLBACK(subElement)
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  parameters: | slash_no_default param_no_default* param_with_default* [star_etc] | slash_with_default param_with_default* [star_etc] | param_no_default+ param_with_default* [star_etc] | param_with_default+ [star_etc] | star_etc
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method Parameters58Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..SlashNoDefault(subElement,.addedElement)  && ..Parameters59RepZero(subElement,.addedElement)  && ..Parameters60RepZero(subElement,.addedElement)  && $S(..StarEtc(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  param_no_default*
Method Parameters59RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	while ..ParamNoDefault(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  param_with_default*
Method Parameters60RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	while ..ParamWithDefault(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

Method Parameters61Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..SlashWithDefault(subElement,.addedElement)  && ..Parameters62RepZero(subElement,.addedElement)  && $S(..StarEtc(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  param_with_default*
Method Parameters62RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	while ..ParamWithDefault(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

Method Parameters63Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Parameters64RepOne(subElement,.addedElement)  && ..Parameters65RepZero(subElement,.addedElement)  && $S(..StarEtc(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  param_no_default+
Method Parameters64RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..ParamNoDefault(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  param_with_default*
Method Parameters65RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	while ..ParamWithDefault(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

Method Parameters66Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Parameters67RepOne(subElement,.addedElement)  && $S(..StarEtc(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  param_with_default+
Method Parameters67RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..ParamWithDefault(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  params: | parameters
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  pattern: | as_pattern | or_pattern
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  pattern_capture_target: | !"_" NAME !('.' | '(' | '=')
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method PatternCaptureTarget146Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..PatternCaptureTarget147Not(subElement,.addedElement)  && ..Name(subElement,.addedElement)  && ..PatternCaptureTarget148Not(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

/// "_"
Method PatternCaptureTarget147Not(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"_")  { set done=1 }
	$$$BNFROLLBACK(subElement)
	if done {
		set ret=0
	} else {
		set ret=1
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// ('.' | '(' | '=')
Method PatternCaptureTarget148Not(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..PatternCaptureTarget149Sub(subElement,.addedElement)  { set done=1 }
	$$$BNFROLLBACK(subElement)
	if done {
		set ret=0
	} else {
		set ret=1
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// '.' | '(' | '='
Method PatternCaptureTarget149Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  patterns: | open_sequence_pattern | pattern
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  positional_patterns: | ','.pattern+
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  ','.pattern+
Method PositionalPatterns174RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
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
				$$$BNFCOMMIT(repElement,subElement)
			} else {
				$$$BNFROLLBACK(repElement)
			}
		} while ok
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  power: | await_primary '**' factor | await_primary
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method Power234Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..AwaitPrimary(subElement,.addedElement)  && ..addPunctuation(subElement,"**")  && ..Factor(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  primary: | primary '.' NAME | primary genexp | primary '(' [arguments] ')' | primary '[' slices ']' | atom
Method Primary(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	set done=0,ok=1,pos=..stream.pos,lastpos=pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set ret=($isobject(subElement))
		if ret $$$BNFCOMMITCOPY(subElement,ParentElement)
		quit ret
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
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		if $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method Primary236Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method Primary237Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Primary(subElement,.addedElement)  && ..addPunctuation(subElement,".")  && ..Name(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method Primary238Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Primary(subElement,.addedElement)  && ..Genexp(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method Primary239Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Primary(subElement,.addedElement)  && ..addPunctuation(subElement,"(")  && $S(..Arguments(subElement,.addedElement) :1,1:1) && ..addPunctuation(subElement,")")  {
		set done=1 ; end compileRules
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method Primary240Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Primary(subElement,.addedElement)  && ..addPunctuation(subElement,"[")  && ..Slices(subElement,.addedElement)  && ..addPunctuation(subElement,"]")  {
		set done=1 ; end compileRules
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  raise_stmt: | 'raise' expression ['from' expression ] | 'raise'
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method RaiseStmt22Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"RAISE")  && ..Expression(subElement,.addedElement)  && ..RaiseStmt23OptGrp(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

Method RaiseStmt23OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"FROM")  && ..Expression(subElement,.addedElement)  {
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

///  real_number: | NUMBER
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  return_stmt: | 'return' [star_expressions]
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method ReturnStmt21Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"RETURN")  && $S(..StarExpressions(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  sequence_pattern: | '[' maybe_sequence_pattern? ']' | '(' open_sequence_pattern? ')'
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method SequencePattern155Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"[")  && $s(..MaybeSequencePattern(subElement,.addedElement) :1,1:1)  && ..addPunctuation(subElement,"]")  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

Method SequencePattern156Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"(")  && $s(..OpenSequencePattern(subElement,.addedElement) :1,1:1)  && ..addPunctuation(subElement,")")  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  set: '{' star_named_expressions '}'
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  setcomp: | '{' named_expression for_if_clauses '}'
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
		if ..Setcomp316Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method Setcomp316Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"{")  && ..NamedExpression(subElement,.addedElement)  && ..ForIfClauses(subElement,.addedElement)  && ..addPunctuation(subElement,"}")  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  shift_expr: | shift_expr '<<' sum | shift_expr '>>' sum | sum
Method ShiftExpr(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	set done=0,ok=1,pos=..stream.pos,lastpos=pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set ret=($isobject(subElement))
		if ret $$$BNFCOMMITCOPY(subElement,ParentElement)
		quit ret
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
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		if $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method ShiftExpr218Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method ShiftExpr219Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ShiftExpr(subElement,.addedElement)  && ..addPunctuation(subElement,"<<")  && ..Sum(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method ShiftExpr220Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ShiftExpr(subElement,.addedElement)  && ..addPunctuation(subElement,">>")  && ..Sum(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  signed_number: | NUMBER | '-' NUMBER
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method SignedNumber144Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"-")  && ..Number(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  signed_real_number: | real_number | '-' real_number
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method SignedRealNumber145Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"-")  && ..RealNumber(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  simple_stmt: | assignment | type_alias | star_expressions | return_stmt | import_stmt | raise_stmt | 'pass' | del_stmt | yield_stmt | assert_stmt | 'break' | 'continue' | global_stmt | nonlocal_stmt
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  simple_stmts: | simple_stmt !';' NEWLINE | ';'.simple_stmt+ [';'] NEWLINE
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method SimpleStmts5Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..SimpleStmt(subElement,.addedElement)  && ..SimpleStmts6Not(subElement,.addedElement)  && ..Newline(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

/// ';'
Method SimpleStmts6Not(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,";")  { set done=1 }
	$$$BNFROLLBACK(subElement)
	if done {
		set ret=0
	} else {
		set ret=1
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method SimpleStmts7Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..SimpleStmts8RepSep(subElement,.addedElement)  && $S(..addPunctuation(subElement,";") :1,1:1) && ..Newline(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  ';'.simple_stmt+
Method SimpleStmts8RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
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
				$$$BNFCOMMIT(repElement,subElement)
			} else {
				$$$BNFROLLBACK(repElement)
			}
		} while ok
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  single_subscript_attribute_target: | t_primary '.' NAME !t_lookahead | t_primary '[' slices ']' !t_lookahead
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
		if ..SingleSubscriptAttributeTarget370Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..SingleSubscriptAttributeTarget372Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method SingleSubscriptAttributeTarget370Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..TPrimary(subElement,.addedElement)  && ..addPunctuation(subElement,".")  && ..Name(subElement,.addedElement)  && ..SingleSubscriptAttributeTarget371Not(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

/// t_lookahead
Method SingleSubscriptAttributeTarget371Not(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..TLookahead(subElement,.addedElement)  { set done=1 }
	$$$BNFROLLBACK(subElement)
	if done {
		set ret=0
	} else {
		set ret=1
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method SingleSubscriptAttributeTarget372Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..TPrimary(subElement,.addedElement)  && ..addPunctuation(subElement,"[")  && ..Slices(subElement,.addedElement)  && ..addPunctuation(subElement,"]")  && ..SingleSubscriptAttributeTarget373Not(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

/// t_lookahead
Method SingleSubscriptAttributeTarget373Not(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..TLookahead(subElement,.addedElement)  { set done=1 }
	$$$BNFROLLBACK(subElement)
	if done {
		set ret=0
	} else {
		set ret=1
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  single_target: | single_subscript_attribute_target | NAME | '(' single_target ')'
Method SingleTarget(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	set done=0,ok=1,pos=..stream.pos,lastpos=pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set ret=($isobject(subElement))
		if ret $$$BNFCOMMITCOPY(subElement,ParentElement)
		quit ret
	}
	$$$BNFMEMOSET(pos,"")
	do ..getBookmark(.bm)
	while ok {
	$$$BNFSTART(subElement)
		do ..gotoBookmark(.bm)
		set rec=..SingleTarget368Recurse(subElement,.addedElement)
		if rec,..stream.pos>lastpos {
			$$$BNFMEMOSET(pos,addedElement)
			set done=1,lastpos=..stream.pos
		} else {
			set ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best 
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		if $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method SingleTarget368Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..SingleSubscriptAttributeTarget(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Name(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SingleTarget369Or(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method SingleTarget369Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"(")  && ..SingleTarget(subElement,.addedElement)  && ..addPunctuation(subElement,")")  {
		set done=1 ; end compileRules
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  slash_no_default: | param_no_default+ '/' ',' | param_no_default+ '/' &')'
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method SlashNoDefault68Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..SlashNoDefault69RepOne(subElement,.addedElement)  && ..addPunctuation(subElement,"/")  && ..addPunctuation(subElement,",")  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  param_no_default+
Method SlashNoDefault69RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..ParamNoDefault(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

Method SlashNoDefault70Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..SlashNoDefault71RepOne(subElement,.addedElement)  && ..addPunctuation(subElement,"/")  && ..SlashNoDefault72Peek(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  param_no_default+
Method SlashNoDefault71RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..ParamNoDefault(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  &')'
Method SlashNoDefault72Peek(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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
		set ret=1
		$$$BNFROLLBACK(subElement)
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  slash_with_default: | param_no_default* param_with_default+ '/' ',' | param_no_default* param_with_default+ '/' &')'
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method SlashWithDefault73Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..SlashWithDefault74RepZero(subElement,.addedElement)  && ..SlashWithDefault75RepOne(subElement,.addedElement)  && ..addPunctuation(subElement,"/")  && ..addPunctuation(subElement,",")  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  param_no_default*
Method SlashWithDefault74RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	while ..ParamNoDefault(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  param_with_default+
Method SlashWithDefault75RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..ParamWithDefault(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

Method SlashWithDefault76Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..SlashWithDefault77RepZero(subElement,.addedElement)  && ..SlashWithDefault78RepOne(subElement,.addedElement)  && ..addPunctuation(subElement,"/")  && ..SlashWithDefault79Peek(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  param_no_default*
Method SlashWithDefault77RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	while ..ParamNoDefault(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  param_with_default+
Method SlashWithDefault78RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..ParamWithDefault(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  &')'
Method SlashWithDefault79Peek(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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
		set ret=1
		$$$BNFROLLBACK(subElement)
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  slice: | [expression] ':' [expression] [':' [expression] ] | named_expression
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method Slice247Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if $S(..Expression(subElement,.addedElement) :1,1:1) && ..addPunctuation(subElement,":")  && $S(..Expression(subElement,.addedElement) :1,1:1) && ..Slice248OptGrp(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

Method Slice248OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,":")  && $S(..Expression(subElement,.addedElement) :1,1:1) {
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

///  slices: | slice !',' | ','.(slice | starred_expression)+ [',']
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method Slices241Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Slice(subElement,.addedElement)  && ..Slices242Not(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

/// ','
Method Slices242Not(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  { set done=1 }
	$$$BNFROLLBACK(subElement)
	if done {
		set ret=0
	} else {
		set ret=1
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method Slices243Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Slices244RepSep(subElement,.addedElement)  && $S(..addPunctuation(subElement,",") :1,1:1) {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  ','.(slice | starred_expression)+
Method Slices244RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
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
				$$$BNFCOMMIT(repElement,subElement)
			} else {
				$$$BNFROLLBACK(repElement)
			}
		} while ok
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// slice | starred_expression
Method Slices245Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Slice(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StarredExpression(subElement,.addedElement)  {
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

/// slice | starred_expression
Method Slices246Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Slice(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StarredExpression(subElement,.addedElement)  {
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

///  star_annotation: ':' star_expression
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  star_atom: | NAME | '(' target_with_star_atom ')' | '(' [star_targets_tuple_seq] ')' | '[' [star_targets_list_seq] ']'
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
		} elseif ..StarAtom365Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..StarAtom366Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..StarAtom367Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method StarAtom365Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"(")  && ..TargetWithStarAtom(subElement,.addedElement)  && ..addPunctuation(subElement,")")  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

Method StarAtom366Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"(")  && $S(..StarTargetsTupleSeq(subElement,.addedElement) :1,1:1) && ..addPunctuation(subElement,")")  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

Method StarAtom367Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"[")  && $S(..StarTargetsListSeq(subElement,.addedElement) :1,1:1) && ..addPunctuation(subElement,"]")  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  star_etc: | '*' param_no_default param_maybe_default* [kwds] | '*' param_no_default_star_annotation param_maybe_default* [kwds] | '*' ',' param_maybe_default+ [kwds] | kwds
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method StarEtc80Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"*")  && ..ParamNoDefault(subElement,.addedElement)  && ..StarEtc81RepZero(subElement,.addedElement)  && $S(..Kwds(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  param_maybe_default*
Method StarEtc81RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	while ..ParamMaybeDefault(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

Method StarEtc82Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"*")  && ..ParamNoDefaultStarAnnotation(subElement,.addedElement)  && ..StarEtc83RepZero(subElement,.addedElement)  && $S(..Kwds(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  param_maybe_default*
Method StarEtc83RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	while ..ParamMaybeDefault(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

Method StarEtc84Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"*")  && ..addPunctuation(subElement,",")  && ..StarEtc85RepOne(subElement,.addedElement)  && $S(..Kwds(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  param_maybe_default+
Method StarEtc85RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..ParamMaybeDefault(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  star_expression: | '*' bitwise_or | expression
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method StarExpression194Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"*")  && ..BitwiseOr(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  star_expressions: | star_expression (',' star_expression )+ [','] | star_expression ',' | star_expression
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method StarExpressions190Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..StarExpression(subElement,.addedElement)  && ..StarExpressions191RepOne(subElement,.addedElement)  && $S(..addPunctuation(subElement,",") :1,1:1) {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  (',' star_expression )+
Method StarExpressions191RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..StarExpressions192Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

/// ',' star_expression
Method StarExpressions192Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  && ..StarExpression(subElement,.addedElement)  {
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

Method StarExpressions193Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..StarExpression(subElement,.addedElement)  && ..addPunctuation(subElement,",")  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  star_named_expression: | '*' bitwise_or | named_expression
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method StarNamedExpression196Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"*")  && ..BitwiseOr(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  star_named_expressions: ','.star_named_expression+ [',']
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  ','.star_named_expression+
Method StarNamedExpressions195RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
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
				$$$BNFCOMMIT(repElement,subElement)
			} else {
				$$$BNFROLLBACK(repElement)
			}
		} while ok
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  star_pattern: | '*' pattern_capture_target | '*' wildcard_pattern
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method StarPattern160Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"*")  && ..PatternCaptureTarget(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

Method StarPattern161Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"*")  && ..WildcardPattern(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  star_target: | '*' (!'*' star_target) | target_with_star_atom
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
		if ..StarTarget358Or(subElement,.addedElement)  {
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method StarTarget358Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"*")  && ..StarTarget359Sub(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

/// !'*' star_target
Method StarTarget359Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..StarTarget360Not(subElement,.addedElement)  && ..StarTarget(subElement,.addedElement)  {
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

/// '*'
Method StarTarget360Not(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"*")  { set done=1 }
	$$$BNFROLLBACK(subElement)
	if done {
		set ret=0
	} else {
		set ret=1
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  star_targets: | star_target !',' | star_target (',' star_target )* [',']
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
		if ..StarTargets348Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..StarTargets350Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method StarTargets348Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..StarTarget(subElement,.addedElement)  && ..StarTargets349Not(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

/// ','
Method StarTargets349Not(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  { set done=1 }
	$$$BNFROLLBACK(subElement)
	if done {
		set ret=0
	} else {
		set ret=1
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method StarTargets350Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..StarTarget(subElement,.addedElement)  && ..StarTargets351RepZero(subElement,.addedElement)  && $S(..addPunctuation(subElement,",") :1,1:1) {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  (',' star_target )*
Method StarTargets351RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	while ..StarTargets352Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

/// ',' star_target
Method StarTargets352Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  && ..StarTarget(subElement,.addedElement)  {
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

///  star_targets_list_seq: ','.star_target+ [',']
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
		if ..StarTargetsListSeq353RepSep(subElement,.addedElement)  && $S(..addPunctuation(subElement,",") :1,1:1) {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  ','.star_target+
Method StarTargetsListSeq353RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
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
				$$$BNFCOMMIT(repElement,subElement)
			} else {
				$$$BNFROLLBACK(repElement)
			}
		} while ok
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  star_targets_tuple_seq: | star_target (',' star_target )+ [','] | star_target ','
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
		if ..StarTargetsTupleSeq354Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..StarTargetsTupleSeq357Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method StarTargetsTupleSeq354Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..StarTarget(subElement,.addedElement)  && ..StarTargetsTupleSeq355RepOne(subElement,.addedElement)  && $S(..addPunctuation(subElement,",") :1,1:1) {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  (',' star_target )+
Method StarTargetsTupleSeq355RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..StarTargetsTupleSeq356Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

/// ',' star_target
Method StarTargetsTupleSeq356Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  && ..StarTarget(subElement,.addedElement)  {
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

Method StarTargetsTupleSeq357Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..StarTarget(subElement,.addedElement)  && ..addPunctuation(subElement,",")  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  starred_expression: | '*' expression
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
		if ..StarredExpression344Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method StarredExpression344Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"*")  && ..Expression(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  statement: compound_stmt | simple_stmts
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  statement_newline: | compound_stmt NEWLINE | simple_stmts | NEWLINE | ENDMARKER
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method StatementNewline4Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..CompoundStmt(subElement,.addedElement)  && ..Newline(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  statements: statement+
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  statement+
Method Statements3RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..Statement(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  string: STRING
Method String(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	set done=0,ok=1,pos=..stream.pos,lastpos=pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set ret=($isobject(subElement))
		if ret $$$BNFCOMMITCOPY(subElement,ParentElement)
		quit ret
	}
	$$$BNFMEMOSET(pos,"")
	do ..getBookmark(.bm)
	while ok {
	$$$BNFSTART(subElement)
		do ..gotoBookmark(.bm)
		set rec=..String299Recurse(subElement,.addedElement)
		if rec,..stream.pos>lastpos {
			$$$BNFMEMOSET(pos,addedElement)
			set done=1,lastpos=..stream.pos
		} else {
			set ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best 
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		if $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method String299Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..String(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  strings: (fstring|string)+
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
		if ..Strings300RepOne(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  (fstring|string)+
Method Strings300RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..Strings301Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

/// fstring|string
Method Strings301Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Fstring(subElement,.addedElement)  {
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

///  subject_expr: | star_named_expression ',' star_named_expressions? | named_expression
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method SubjectExpr132Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..StarNamedExpression(subElement,.addedElement)  && ..addPunctuation(subElement,",")  && $s(..StarNamedExpressions(subElement,.addedElement) :1,1:1)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  sum: | sum '+' term | sum '-' term | term
Method Sum(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	set done=0,ok=1,pos=..stream.pos,lastpos=pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set ret=($isobject(subElement))
		if ret $$$BNFCOMMITCOPY(subElement,ParentElement)
		quit ret
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
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		if $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method Sum221Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method Sum222Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Sum(subElement,.addedElement)  && ..addPunctuation(subElement,"+")  && ..Term(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method Sum223Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Sum(subElement,.addedElement)  && ..addPunctuation(subElement,"-")  && ..Term(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  t_lookahead: '(' | '[' | '.'
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  t_primary: | t_primary '.' NAME &t_lookahead | t_primary '[' slices ']' &t_lookahead | t_primary genexp &t_lookahead | t_primary '(' [arguments] ')' &t_lookahead | atom &t_lookahead
Method TPrimary(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	set done=0,ok=1,pos=..stream.pos,lastpos=pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set ret=($isobject(subElement))
		if ret $$$BNFCOMMITCOPY(subElement,ParentElement)
		quit ret
	}
	$$$BNFMEMOSET(pos,"")
	do ..getBookmark(.bm)
	while ok {
	$$$BNFSTART(subElement)
		do ..gotoBookmark(.bm)
		set rec=..TPrimary374Recurse(subElement,.addedElement)
		if rec,..stream.pos>lastpos {
			$$$BNFMEMOSET(pos,addedElement)
			set done=1,lastpos=..stream.pos
		} else {
			set ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best 
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		if $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method TPrimary374Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..TPrimary375Or(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..TPrimary377Or(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..TPrimary379Or(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..TPrimary381Or(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..TPrimary383Or(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method TPrimary375Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..TPrimary(subElement,.addedElement)  && ..addPunctuation(subElement,".")  && ..Name(subElement,.addedElement)  && ..TPrimary376Peek(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  &t_lookahead
Method TPrimary376Peek(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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
		set ret=1
		$$$BNFROLLBACK(subElement)
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method TPrimary377Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..TPrimary(subElement,.addedElement)  && ..addPunctuation(subElement,"[")  && ..Slices(subElement,.addedElement)  && ..addPunctuation(subElement,"]")  && ..TPrimary378Peek(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  &t_lookahead
Method TPrimary378Peek(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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
		set ret=1
		$$$BNFROLLBACK(subElement)
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method TPrimary379Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..TPrimary(subElement,.addedElement)  && ..Genexp(subElement,.addedElement)  && ..TPrimary380Peek(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  &t_lookahead
Method TPrimary380Peek(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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
		set ret=1
		$$$BNFROLLBACK(subElement)
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method TPrimary381Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..TPrimary(subElement,.addedElement)  && ..addPunctuation(subElement,"(")  && $S(..Arguments(subElement,.addedElement) :1,1:1) && ..addPunctuation(subElement,")")  && ..TPrimary382Peek(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  &t_lookahead
Method TPrimary382Peek(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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
		set ret=1
		$$$BNFROLLBACK(subElement)
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method TPrimary383Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Atom(subElement,.addedElement)  && ..TPrimary384Peek(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  &t_lookahead
Method TPrimary384Peek(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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
		set ret=1
		$$$BNFROLLBACK(subElement)
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  target_with_star_atom: | t_primary '.' NAME !t_lookahead | t_primary '[' slices ']' !t_lookahead | star_atom
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
		if ..TargetWithStarAtom361Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..TargetWithStarAtom363Or(subElement,.addedElement)  {
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method TargetWithStarAtom361Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..TPrimary(subElement,.addedElement)  && ..addPunctuation(subElement,".")  && ..Name(subElement,.addedElement)  && ..TargetWithStarAtom362Not(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

/// t_lookahead
Method TargetWithStarAtom362Not(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..TLookahead(subElement,.addedElement)  { set done=1 }
	$$$BNFROLLBACK(subElement)
	if done {
		set ret=0
	} else {
		set ret=1
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method TargetWithStarAtom363Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..TPrimary(subElement,.addedElement)  && ..addPunctuation(subElement,"[")  && ..Slices(subElement,.addedElement)  && ..addPunctuation(subElement,"]")  && ..TargetWithStarAtom364Not(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

/// t_lookahead
Method TargetWithStarAtom364Not(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..TLookahead(subElement,.addedElement)  { set done=1 }
	$$$BNFROLLBACK(subElement)
	if done {
		set ret=0
	} else {
		set ret=1
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  term: | term '*' factor | term '/' factor | term '//' factor | term '%' factor | term '@' factor | factor
Method Term(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	set done=0,ok=1,pos=..stream.pos,lastpos=pos
	if $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		set ret=($isobject(subElement))
		if ret $$$BNFCOMMITCOPY(subElement,ParentElement)
		quit ret
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
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		if $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method Term224Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method Term225Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Term(subElement,.addedElement)  && ..addPunctuation(subElement,"*")  && ..Factor(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method Term226Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Term(subElement,.addedElement)  && ..addPunctuation(subElement,"/")  && ..Factor(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method Term227Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Term(subElement,.addedElement)  && ..addPunctuation(subElement,"//")  && ..Factor(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method Term228Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Term(subElement,.addedElement)  && ..addPunctuation(subElement,"%")  && ..Factor(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method Term229Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Term(subElement,.addedElement)  && ..addPunctuation(subElement,"@")  && ..Factor(subElement,.addedElement)  {
		set done=1 ; end compileRules
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  try_stmt: | 'try' ':' block finally_block | 'try' ':' block except_block+ [else_block] [finally_block] | 'try' ':' block except_star_block+ [else_block] [finally_block]
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method TryStmt119Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"TRY")  && ..addPunctuation(subElement,":")  && ..Block(subElement,.addedElement)  && ..FinallyBlock(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

Method TryStmt120Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"TRY")  && ..addPunctuation(subElement,":")  && ..Block(subElement,.addedElement)  && ..TryStmt121RepOne(subElement,.addedElement)  && $S(..ElseBlock(subElement,.addedElement) :1,1:1) && $S(..FinallyBlock(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  except_block+
Method TryStmt121RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..ExceptBlock(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

Method TryStmt122Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"TRY")  && ..addPunctuation(subElement,":")  && ..Block(subElement,.addedElement)  && ..TryStmt123RepOne(subElement,.addedElement)  && $S(..ElseBlock(subElement,.addedElement) :1,1:1) && $S(..FinallyBlock(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  except_star_block+
Method TryStmt123RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..ExceptStarBlock(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  tuple: | '(' [star_named_expression ',' [star_named_expressions] ] ')'
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
		if ..Tuple303Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method Tuple303Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"(")  && ..Tuple304OptGrp(subElement,.addedElement)  && ..addPunctuation(subElement,")")  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

Method Tuple304OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..StarNamedExpression(subElement,.addedElement)  && ..addPunctuation(subElement,",")  && $S(..StarNamedExpressions(subElement,.addedElement) :1,1:1) {
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

///  type_alias: | "type" NAME [type_params] '=' expression
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method TypeAlias177Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"TYPE")  && ..Name(subElement,.addedElement)  && $S(..TypeParams(subElement,.addedElement) :1,1:1) && ..addPunctuation(subElement,"=")  && ..Expression(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  TYPE_COMMENT : 'code type_comment'
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  type_expressions: | ','.expression+ ',' '*' expression ',' '**' expression | ','.expression+ ',' '*' expression | ','.expression+ ',' '**' expression | '*' expression ',' '**' expression | '*' expression | '**' expression | ','.expression+
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
		if ..TypeExpressions393Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..TypeExpressions395Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..TypeExpressions397Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..TypeExpressions399Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..TypeExpressions400Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..TypeExpressions401Or(subElement,.addedElement)  {
			set done=1 ; or
		} elseif ..TypeExpressions402RepSep(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	if done {
		$$$BNFMEMOSET(pos,subElement)
	} else {
	}
	if done {
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method TypeExpressions393Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..TypeExpressions394RepSep(subElement,.addedElement)  && ..addPunctuation(subElement,",")  && ..addPunctuation(subElement,"*")  && ..Expression(subElement,.addedElement)  && ..addPunctuation(subElement,",")  && ..addPunctuation(subElement,"**")  && ..Expression(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  ','.expression+
Method TypeExpressions394RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
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
				$$$BNFCOMMIT(repElement,subElement)
			} else {
				$$$BNFROLLBACK(repElement)
			}
		} while ok
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method TypeExpressions395Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..TypeExpressions396RepSep(subElement,.addedElement)  && ..addPunctuation(subElement,",")  && ..addPunctuation(subElement,"*")  && ..Expression(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  ','.expression+
Method TypeExpressions396RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
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
				$$$BNFCOMMIT(repElement,subElement)
			} else {
				$$$BNFROLLBACK(repElement)
			}
		} while ok
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method TypeExpressions397Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..TypeExpressions398RepSep(subElement,.addedElement)  && ..addPunctuation(subElement,",")  && ..addPunctuation(subElement,"**")  && ..Expression(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  ','.expression+
Method TypeExpressions398RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
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
				$$$BNFCOMMIT(repElement,subElement)
			} else {
				$$$BNFROLLBACK(repElement)
			}
		} while ok
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method TypeExpressions399Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"*")  && ..Expression(subElement,.addedElement)  && ..addPunctuation(subElement,",")  && ..addPunctuation(subElement,"**")  && ..Expression(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

Method TypeExpressions400Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"*")  && ..Expression(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

Method TypeExpressions401Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"**")  && ..Expression(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  ','.expression+
Method TypeExpressions402RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
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
				$$$BNFCOMMIT(repElement,subElement)
			} else {
				$$$BNFROLLBACK(repElement)
			}
		} while ok
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  type_param: | NAME [type_param_bound] | '*' NAME | '**' NAME
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method TypeParam179Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Name(subElement,.addedElement)  && $S(..TypeParamBound(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

Method TypeParam180Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"*")  && ..Name(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

Method TypeParam181Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"**")  && ..Name(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  type_param_bound: ':' expression
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  type_param_seq: ','.type_param+ [',']
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  ','.type_param+
Method TypeParamSeq178RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
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
				$$$BNFCOMMIT(repElement,subElement)
			} else {
				$$$BNFROLLBACK(repElement)
			}
		} while ok
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  type_params: '[' type_param_seq ']'
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  value_pattern: | attr !('.' | '(' | '=')
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method ValuePattern150Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Attr(subElement,.addedElement)  && ..ValuePattern151Not(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

/// ('.' | '(' | '=')
Method ValuePattern151Not(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ValuePattern152Sub(subElement,.addedElement)  { set done=1 }
	$$$BNFROLLBACK(subElement)
	if done {
		set ret=0
	} else {
		set ret=1
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// '.' | '(' | '='
Method ValuePattern152Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  while_stmt: | 'while' named_expression ':' block [else_block]
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method WhileStmt105Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"WHILE")  && ..NamedExpression(subElement,.addedElement)  && ..addPunctuation(subElement,":")  && ..Block(subElement,.addedElement)  && $S(..ElseBlock(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  wildcard_pattern: | "_"
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  with_item: | expression 'as' star_target &(',' | ')' | ':') | expression
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method WithItem116Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Expression(subElement,.addedElement)  && ..addKeyword(subElement,"AS")  && ..StarTarget(subElement,.addedElement)  && ..WithItem117Peek(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  &(',' | ')' | ':')
Method WithItem117Peek(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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
		set ret=1
		$$$BNFROLLBACK(subElement)
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// ',' | ')' | ':'
Method WithItem118Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
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
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  with_stmt: | 'with' '(' ','.with_item+ ','? ')' ':' block | 'with' ','.with_item+ ':' [TYPE_COMMENT] block | ASYNC 'with' '(' ','.with_item+ ','? ')' ':' block | ASYNC 'with' ','.with_item+ ':' [TYPE_COMMENT] block
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method WithStmt108Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"WITH")  && ..addPunctuation(subElement,"(")  && ..WithStmt109RepSep(subElement,.addedElement)  && $s(..addPunctuation(subElement,",") :1,1:1)  && ..addPunctuation(subElement,")")  && ..addPunctuation(subElement,":")  && ..Block(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  ','.with_item+
Method WithStmt109RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
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
				$$$BNFCOMMIT(repElement,subElement)
			} else {
				$$$BNFROLLBACK(repElement)
			}
		} while ok
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method WithStmt110Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"WITH")  && ..WithStmt111RepSep(subElement,.addedElement)  && ..addPunctuation(subElement,":")  && $S(..TypeComment(subElement,.addedElement) :1,1:1) && ..Block(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  ','.with_item+
Method WithStmt111RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
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
				$$$BNFCOMMIT(repElement,subElement)
			} else {
				$$$BNFROLLBACK(repElement)
			}
		} while ok
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method WithStmt112Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Async(subElement,.addedElement)  && ..addKeyword(subElement,"WITH")  && ..addPunctuation(subElement,"(")  && ..WithStmt113RepSep(subElement,.addedElement)  && $s(..addPunctuation(subElement,",") :1,1:1)  && ..addPunctuation(subElement,")")  && ..addPunctuation(subElement,":")  && ..Block(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  ','.with_item+
Method WithStmt113RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
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
				$$$BNFCOMMIT(repElement,subElement)
			} else {
				$$$BNFROLLBACK(repElement)
			}
		} while ok
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method WithStmt114Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Async(subElement,.addedElement)  && ..addKeyword(subElement,"WITH")  && ..WithStmt115RepSep(subElement,.addedElement)  && ..addPunctuation(subElement,":")  && $S(..TypeComment(subElement,.addedElement) :1,1:1) && ..Block(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  ','.with_item+
Method WithStmt115RepSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
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
				$$$BNFCOMMIT(repElement,subElement)
			} else {
				$$$BNFROLLBACK(repElement)
			}
		} while ok
	}
	if done {
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  yield_expr: | 'yield' 'from' expression | 'yield' [star_expressions]
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method YieldExpr188Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"YIELD")  && ..addKeyword(subElement,"FROM")  && ..Expression(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

Method YieldExpr189Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"YIELD")  && $S(..StarExpressions(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}
		if done {
			$$$BNFCOMMITCOPY(subElement,ParentElement)
			set ret=1
		} else {
			$$$BNFROLLBACK(subElement)
			set ret=0
		}
		$$$DEBUGMethodEnd
		quit ret
}

///  yield_stmt: yield_expr
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
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method newElement(Type As %String) As PXW.DEV.BNF.Elements.Python
{
	quit ##class(PXW.DEV.BNF.Elements.Python).%New(Type)
}

}
