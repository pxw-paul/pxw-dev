/// Created: 2024-09-25 19:34:12 PXW.DEV.BNF.Compilers.Compiler1
Class PXW.DEV.BNF.GEN.JS Extends PXW.DEV.BNF.super [ ProcedureBlock ]
{

Parameter KeywordPattern = "1.A";

Parameter Keywords = "A,AS,ASYNC,AWAIT,B,BREAK,C,CASE,CATCH,CLASS,CONST,CONTINUE,D,DEBUGGER,DEFAULT,DELETE,DO,E,ELSE,ENUM,EXPORT,EXTENDS,F,FALSE,FINALLY,FOR,FROM,FUNCTION,GET,IF,IMPLEMENTS,IMPORT,IN,INSTANCEOF,INTERFACE,LET,N,NEW,NULL,OF,PACKAGE,PRIVATE,PROTECTED,PUBLIC,RETURN,SET,STATIC,SUPER,SWITCH,THIS,THROW,TRUE,TRY,TYPEOF,VAR,VOID,WHILE,WITH,YIELD";

///  alias_Name ::= identifier_Name ["As" identifier_Name]
Method AliasName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..IdentifierName(subElement,.addedElement)  {
		if ..AliasName8OptGrp(subElement,.addedElement)  {
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
/// summary values:AS
Method AliasName8OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("AS"),.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"AS")  {
		if ..IdentifierName(subElement,.addedElement)  {
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

///  And ::= '&&'
/// summary values:&&
Method And(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("&&",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"&&")  {
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

///  anonymous_Function ::= (["Async"] "Function" ['*'] '(' [formal_Parameter_List] ')' function_Body) | (["Async"] arrow_Function_Parameters '=>' arrow_Function_Body )
Method AnonymousFunction(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..AnonymousFunction150Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AnonymousFunction151Sub(subElement,.addedElement)  {
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

/// ["Async"] "Function" ['*'] '(' [formal_Parameter_List] ')' function_Body
Method AnonymousFunction150Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?&K&?4?&P&?4?&P&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..addKeyword(subElement,"ASYNC") :1,1:1) {
		if ..addKeyword(subElement,"FUNCTION")  {
			if $S(..addPunctuation(subElement,"*") :1,1:1) {
				if ..addPunctuation(subElement,"(")  {
					if $S(..FormalParameterList(subElement,.addedElement) :1,1:1) {
						if ..addPunctuation(subElement,")")  {
							if ..FunctionBody(subElement,.addedElement)  {
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

/// ["Async"] arrow_Function_Parameters '=>' arrow_Function_Body
Method AnonymousFunction151Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?&?1Rule?&P&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..addKeyword(subElement,"ASYNC") :1,1:1) {
		if ..ArrowFunctionParameters(subElement,.addedElement)  {
			if ..addPunctuation(subElement,"=>")  {
				if ..ArrowFunctionBody(subElement,.addedElement)  {
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

///  argument ::= [Ellipsis] (single_Expression | identifier)
Method Argument(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..Ellipsis(subElement,.addedElement) :1,1:1) {
		if ..Argument64Sub(subElement,.addedElement)  {
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

/// single_Expression | identifier
Method Argument64Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SingleExpression(subElement,.addedElement)  {
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

///  arguments ::= '(' [argument (',' argument)*] ')'
/// summary values:(
Method Arguments(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?4?&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"(")  {
		if ..Arguments61OptGrp(subElement,.addedElement)  {
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

Method Arguments61OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Argument(subElement,.addedElement)  {
		if ..Arguments62RepZero(subElement,.addedElement)  {
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

///  (',' argument)*
Method Arguments62RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..Arguments63Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

/// ',' argument
/// summary values:,
Method Arguments63Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..Argument(subElement,.addedElement)  {
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

///  array_Element ::= [Ellipsis] single_Expression
Method ArrayElement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..Ellipsis(subElement,.addedElement) :1,1:1) {
		if ..SingleExpression(subElement,.addedElement)  {
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

///  array_Literal ::= '[' element_List ']'
/// summary values:[
Method ArrayLiteral(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&P
	; first rule summary P
	if '(..isStringSingle("[",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"[")  {
		if ..ElementList(subElement,.addedElement)  {
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

///  ARROW ::= '=>'
/// summary values:=>
Method Arrow(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("=>",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"=>")  {
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

///  arrow_Function_Body ::= single_Expression | function_Body
Method ArrowFunctionBody(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SingleExpression(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..FunctionBody(subElement,.addedElement)  {
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

///  arrow_Function_Parameters ::= identifier | ('(' [formal_Parameter_List] ')')
Method ArrowFunctionParameters(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Identifier(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ArrowFunctionParameters152Sub(subElement,.addedElement)  {
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

/// '(' [formal_Parameter_List] ')'
/// summary values:(
Method ArrowFunctionParameters152Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?4?&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"(")  {
		if $S(..FormalParameterList(subElement,.addedElement) :1,1:1) {
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

///  Assign ::= '='
/// summary values:=
Method Assign(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("=",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"=")  {
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

///  assignable ::= identifier | array_Literal | object_Literal
Method Assignable(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Identifier(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ArrayLiteral(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ObjectLiteral(subElement,.addedElement)  {
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

///  assignment_Operator ::= '*=' | '/=' | '%=' | '+=' | '-=' | '<<=' | '>>=' | '>>>=' | '&=' | '^=' | '|=' | '**=' | '??='
/// summary values:*=,/=,%=,+=,-=,<<=,>>=,>>>=,&=,^=,|=,**=,??=
Method AssignmentOperator(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|P|P|P|P|P|P|P|P|P|P|P|P
	if '(..isStringInList($lb("*=","/=","%=","+=","-=","<<=",">>=",">>>=","&=","^=","|=","**=","??="),4,.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"*=")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"/=")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"%=")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"+=")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"-=")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"<<=")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,">>=")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,">>>=")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"&=")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"^=")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"|=")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"**=")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"??=")  {
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

///  Big_Binary_Integer_Literal::= ('0b' | '0B') ('0' | '1' )* 'n'
Method BigBinaryIntegerLiteral(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*&K
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..BigBinaryIntegerLiteral168Sub(subElement,.addedElement)  {
		if ..BigBinaryIntegerLiteral169RepZero(subElement,.addedElement)  {
			if ..addKeyword(subElement,"N")  {
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

/// '0b' | '0B'
/// summary values:0B,0B
Method BigBinaryIntegerLiteral168Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|P
	if '(..isStringInList($lb("0B","0B"),2,.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	s subElement=ParentElement
	if ..addPunctuation(subElement,"0b")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"0B")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  ('0' | '1' )*
Method BigBinaryIntegerLiteral169RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..BigBinaryIntegerLiteral170Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

/// '0' | '1'
/// summary values:0,1
Method BigBinaryIntegerLiteral170Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|P
	if '(..isStringInList($lb("0","1"),1,.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	s subElement=ParentElement
	if ..addPunctuation(subElement,"0")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"1")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  Big_Decimal_Integer_Literal ::= decimal_integer_literal 'n'
Method BigDecimalIntegerLiteral(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&K
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..DecimalIntegerLiteral(subElement,.addedElement)  {
		if ..addKeyword(subElement,"N")  {
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

///  Big_Hex_Integer_Literal ::= ('0x' | '0X') ('0' | '1' | '2' | '3' | '4' | '5' | '6' | '7' | '8' | '9' | 'A' | 'B' | 'C' | 'D' | 'E' | 'F' )* 'n'
Method BigHexIntegerLiteral(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*&K
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..BigHexIntegerLiteral162Sub(subElement,.addedElement)  {
		if ..BigHexIntegerLiteral163RepZero(subElement,.addedElement)  {
			if ..addKeyword(subElement,"N")  {
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

/// '0x' | '0X'
/// summary values:0X,0X
Method BigHexIntegerLiteral162Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|P
	if '(..isStringInList($lb("0X","0X"),2,.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	s subElement=ParentElement
	if ..addPunctuation(subElement,"0x")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"0X")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  ('0' | '1' | '2' | '3' | '4' | '5' | '6' | '7' | '8' | '9' | 'A' | 'B' | 'C' | 'D' | 'E' | 'F' )*
Method BigHexIntegerLiteral163RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..BigHexIntegerLiteral164Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

/// '0' | '1' | '2' | '3' | '4' | '5' | '6' | '7' | '8' | '9' | 'A' | 'B' | 'C' | 'D' | 'E' | 'F'
Method BigHexIntegerLiteral164Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|P|P|P|P|P|P|P|P|P|K|K|K|K|K|K
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"0")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"1")  {
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
	} elseif ..addKeyword(subElement,"A")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"B")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"C")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"D")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"E")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"F")  {
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

///  Big_Octal_Integer_Literal ::= ('0o' | '0O') ('0' | '1' | '2' | '3' | '4' | '5' | '6' | '7' )* 'n'
Method BigOctalIntegerLiteral(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*&K
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..BigOctalIntegerLiteral165Sub(subElement,.addedElement)  {
		if ..BigOctalIntegerLiteral166RepZero(subElement,.addedElement)  {
			if ..addKeyword(subElement,"N")  {
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

/// '0o' | '0O'
/// summary values:0O,0O
Method BigOctalIntegerLiteral165Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|P
	if '(..isStringInList($lb("0O","0O"),2,.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	s subElement=ParentElement
	if ..addPunctuation(subElement,"0o")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"0O")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  ('0' | '1' | '2' | '3' | '4' | '5' | '6' | '7' )*
Method BigOctalIntegerLiteral166RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..BigOctalIntegerLiteral167Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

/// '0' | '1' | '2' | '3' | '4' | '5' | '6' | '7'
/// summary values:0,1,2,3,4,5,6,7
Method BigOctalIntegerLiteral167Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|P|P|P|P|P|P|P
	if '(..isStringInList($lb("0","1","2","3","4","5","6","7"),1,.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	s subElement=ParentElement
	if ..addPunctuation(subElement,"0")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"1")  {
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
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  bigint_Literal ::= Big_Decimal_Integer_Literal | Big_Hex_Integer_Literal | Big_Octal_Integer_Literal | Big_Binary_Integer_Literal
Method BigintLiteral(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?|?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..BigDecimalIntegerLiteral(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..BigHexIntegerLiteral(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..BigOctalIntegerLiteral(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..BigBinaryIntegerLiteral(subElement,.addedElement)  {
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

///  Binary_Integer_Literal::= ('0b' | '0B') ('0' | '1' )*
Method BinaryIntegerLiteral(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..BinaryIntegerLiteral159Sub(subElement,.addedElement)  {
		if ..BinaryIntegerLiteral160RepZero(subElement,.addedElement)  {
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

/// '0b' | '0B'
/// summary values:0B,0B
Method BinaryIntegerLiteral159Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|P
	if '(..isStringInList($lb("0B","0B"),2,.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	s subElement=ParentElement
	if ..addPunctuation(subElement,"0b")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"0B")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  ('0' | '1' )*
Method BinaryIntegerLiteral160RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..BinaryIntegerLiteral161Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

/// '0' | '1'
/// summary values:0,1
Method BinaryIntegerLiteral161Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|P
	if '(..isStringInList($lb("0","1"),1,.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	s subElement=ParentElement
	if ..addPunctuation(subElement,"0")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"1")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  BitAnd ::= '&'
/// summary values:&
Method Bitand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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

///  BitAndAssign ::= '&='
/// summary values:&=
Method Bitandassign(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("&=",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"&=")  {
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

///  BitNot ::= '~'
/// summary values:~
Method Bitnot(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("~",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"~")  {
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

///  BitOr ::= '|'
/// summary values:|
Method Bitor(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("|",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"|")  {
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

///  BitOrAssign ::= '|='
/// summary values:|=
Method Bitorassign(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("|=",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"|=")  {
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

///  BitXOr ::= '^'
/// summary values:^
Method Bitxor(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("^",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"^")  {
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

///  BitXorAssign ::= '^='
/// summary values:^=
Method Bitxorassign(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("^=",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"^=")  {
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

///  block ::= '{' [statement_List] '}'
/// summary values:{
Method Block(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?4?&P
	; first rule summary P
	if '(..isStringSingle("{",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"{")  {
		if $S(..StatementList(subElement,.addedElement) :1,1:1) {
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

///  boolean_literal ::= 'true' | 'false'
/// summary values:TRUE,FALSE
Method BooleanLiteral(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K
	if '(..isKeywordInList($lb("TRUE","FALSE"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"TRUE")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"FALSE")  {
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

///  break_Statement ::= "Break" [ identifier] eos
/// summary values:BREAK
Method BreakStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?4?&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("BREAK"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"BREAK")  {
		if $S(..Identifier(subElement,.addedElement) :1,1:1) {
			if ..Eos(subElement,.addedElement)  {
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

///  case_Block ::= '{' [case_Clauses] [default_Clause [case_Clauses]] '}'
/// summary values:{
Method CaseBlock(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?4?&?4?&P
	; first rule summary P
	if '(..isStringSingle("{",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"{")  {
		if $S(..CaseClauses(subElement,.addedElement) :1,1:1) {
			if ..CaseBlock30OptGrp(subElement,.addedElement)  {
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

Method CaseBlock30OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..DefaultClause(subElement,.addedElement)  {
		if $S(..CaseClauses(subElement,.addedElement) :1,1:1) {
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

///  case_Clause ::= "Case" expression_Sequence ':' [statement_List]
/// summary values:CASE
Method CaseClause(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?&P&?4?
	; first rule summary K
	if '(..isKeywordInList($lb("CASE"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"CASE")  {
		if ..ExpressionSequence(subElement,.addedElement)  {
			if ..addPunctuation(subElement,":")  {
				if $S(..StatementList(subElement,.addedElement) :1,1:1) {
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

///  case_Clauses ::= case_Clause*
Method CaseClauses(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (?4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CaseClauses31RepZero(subElement,.addedElement)  {
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

///  case_Clause*
Method CaseClauses31RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..CaseClause(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  catch_Production ::= "Catch" ['(' assignable? ')'] block
/// summary values:CATCH
Method CatchProduction(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?4?&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("CATCH"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"CATCH")  {
		if ..CatchProduction34OptGrp(subElement,.addedElement)  {
			if ..Block(subElement,.addedElement)  {
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
Method CatchProduction34OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?4?&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"(")  {
		if $s(..Assignable(subElement,.addedElement) :1,1:1)  {
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

///  class_Declaration ::= "Class" identifier class_Tail
/// summary values:CLASS
Method ClassDeclaration(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("CLASS"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"CLASS")  {
		if ..Identifier(subElement,.addedElement)  {
			if ..ClassTail(subElement,.addedElement)  {
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

///  class_Element ::= ([["Static"] identifier] method_Definition) | ([["Static"] identifier] field_Definition) | ([["Static"] identifier] block) | empty_Statement
Method ClassElement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?|?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ClassElement37Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ClassElement39Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ClassElement41Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..EmptyStatement(subElement,.addedElement)  {
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

/// [["Static"] identifier] method_Definition
Method ClassElement37Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ClassElement38OptGrp(subElement,.addedElement)  {
		if ..MethodDefinition(subElement,.addedElement)  {
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

Method ClassElement38OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..addKeyword(subElement,"STATIC") :1,1:1) {
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

/// [["Static"] identifier] field_Definition
Method ClassElement39Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ClassElement40OptGrp(subElement,.addedElement)  {
		if ..FieldDefinition(subElement,.addedElement)  {
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

Method ClassElement40OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..addKeyword(subElement,"STATIC") :1,1:1) {
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

/// [["Static"] identifier] block
Method ClassElement41Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ClassElement42OptGrp(subElement,.addedElement)  {
		if ..Block(subElement,.addedElement)  {
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

Method ClassElement42OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..addKeyword(subElement,"STATIC") :1,1:1) {
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

///  class_Element_Name ::= property_Name | private_Identifier
Method ClassElementName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..PropertyName(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..PrivateIdentifier(subElement,.addedElement)  {
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

///  class_Tail ::= ["Extends" single_Expression] '{' class_Element* '}'
Method ClassTail(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?&P&(?4?)*&P
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ClassTail35OptGrp(subElement,.addedElement)  {
		if ..addPunctuation(subElement,"{")  {
			if ..ClassTail36RepZero(subElement,.addedElement)  {
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

/// 
/// summary values:EXTENDS
Method ClassTail35OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("EXTENDS"),.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"EXTENDS")  {
		if ..SingleExpression(subElement,.addedElement)  {
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

///  class_Element*
Method ClassTail36RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ClassElement(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  CloseBrace ::= '}'
/// summary values:}
Method Closebrace(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("}",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"}")  {
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

///  CloseBracket ::=']'
/// summary values:]
Method Closebracket(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("]",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"]")  {
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

///  CloseParen ::= ')'
/// summary values:)
Method Closeparen(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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

///  Colon ::= ':'
/// summary values::
Method Colon(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle(":",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,":")  {
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

///  Comma ::= ','
/// summary values:,
Method Comma(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
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

///  continue_Statement ::= "Continue" [ identifier] eos
/// summary values:CONTINUE
Method ContinueStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?4?&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("CONTINUE"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"CONTINUE")  {
		if $S(..Identifier(subElement,.addedElement) :1,1:1) {
			if ..Eos(subElement,.addedElement)  {
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

///  debugger_Statement ::= "Debugger" eos
/// summary values:DEBUGGER
Method DebuggerStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("DEBUGGER"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"DEBUGGER")  {
		if ..Eos(subElement,.addedElement)  {
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

///  decimal_integer_literal ::= 'NEED decimal_integer_literal'
/// summary values:NEED DECIMAL_INTEGER_LITERAL
Method DecimalIntegerLiteral(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("NEED DECIMAL_INTEGER_LITERAL",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"NEED decimal_integer_literal")  {
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

///  Decimal_literal ::= 'NEED decimal_literal'
/// summary values:NEED DECIMAL_LITERAL
Method DecimalLiteral(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("NEED DECIMAL_LITERAL",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"NEED decimal_literal")  {
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

///  declaration ::= variable_Statement | class_Declaration | function_Declaration
Method Declaration(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..VariableStatement(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ClassDeclaration(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..FunctionDeclaration(subElement,.addedElement)  {
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

///  default_Clause ::= "Default" ':' [ statement_List ]
/// summary values:DEFAULT
Method DefaultClause(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?4?
	; first rule summary K
	if '(..isKeywordInList($lb("DEFAULT"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"DEFAULT")  {
		if ..addPunctuation(subElement,":")  {
			if $S(..StatementList(subElement,.addedElement) :1,1:1) {
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

///  Divide ::= '/'
/// summary values:/
Method Divide(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("/",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"/")  {
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

///  DivideAssign ::= '/='
/// summary values:/=
Method Divideassign(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("/=",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"/=")  {
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

///  Dot ::= '.'
/// summary values:.
Method Dot(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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

///  dyadicop ::= ('?' primary ':') | '++' | '--' | '**' | '*' | '/' | '%' | '+' | '-' |'??' | '<<' | '>>' | '>>>' | '<' | '>' | '<=' | '>=' | '==' | '!=' | '===' | '!==' | '&' | '^' | '|' | '&&' | '||' | '=' | "InstanceOf" | "In"
Method Dyadicop(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|K|K
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Dyadicop117Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"++")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"--")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"**")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"*")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"/")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"%")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"+")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"-")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"??")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"<<")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,">>")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,">>>")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"<")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,">")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"<=")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,">=")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"==")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"!=")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"===")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"!==")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"&")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"^")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"|")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"&&")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"||")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"=")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"INSTANCEOF")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"IN")  {
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

/// '?' primary ':'
/// summary values:?
Method Dyadicop117Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&P
	; first rule summary P
	if '(..isStringSingle("?",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"?")  {
		if ..Primary(subElement,.addedElement)  {
			if ..addPunctuation(subElement,":")  {
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

///  element_List ::= [array_Element] (',' array_Element)*
Method ElementList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..ArrayElement(subElement,.addedElement) :1,1:1) {
		if ..ElementList52RepZero(subElement,.addedElement)  {
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

///  (',' array_Element)*
Method ElementList52RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ElementList53Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

/// ',' array_Element
/// summary values:,
Method ElementList53Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..ArrayElement(subElement,.addedElement)  {
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

///  Ellipsis ::= '...'
/// summary values:...
Method Ellipsis(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("...",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"...")  {
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

///  empty_Statement ::= ';'
/// summary values:;
Method EmptyStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle(";",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,";")  {
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

///  end_of_file ::= 'NEED end_of_file'
/// summary values:NEED END_OF_FILE
Method EndOfFile(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("NEED END_OF_FILE",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"NEED end_of_file")  {
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

///  eos ::= SemiColon | end_of_file
Method Eos(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Semicolon(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..EndOfFile(subElement,.addedElement)  {
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

///  Equals ::= '=='
/// summary values:==
Method Equals(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("==",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"==")  {
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

///  export_Alias_name ::= module_Export_Name [("As" module_Export_Name)]
Method ExportAliasName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ModuleExportName(subElement,.addedElement)  {
		if $S(..ExportAliasName16Sub(subElement,.addedElement) :1,1:1) {
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

/// "As" module_Export_Name
/// summary values:AS
Method ExportAliasName16Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("AS"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"AS")  {
		if ..ModuleExportName(subElement,.addedElement)  {
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

///  export_From_Block ::= (import_Namespace import_From eos) | (export_Module_Items [import_From] eos)
Method ExportFromBlock(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ExportFromBlock12Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ExportFromBlock13Sub(subElement,.addedElement)  {
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

/// import_Namespace import_From eos
Method ExportFromBlock12Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?1Rule?&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ImportNamespace(subElement,.addedElement)  {
		if ..ImportFrom(subElement,.addedElement)  {
			if ..Eos(subElement,.addedElement)  {
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

/// export_Module_Items [import_From] eos
Method ExportFromBlock13Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ExportModuleItems(subElement,.addedElement)  {
		if $S(..ImportFrom(subElement,.addedElement) :1,1:1) {
			if ..Eos(subElement,.addedElement)  {
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

///  export_Module_Items ::= '{' export_Alias_Name (',' export_Alias_Name )* '}'
/// summary values:{
Method ExportModuleItems(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&(?4?)*&P
	; first rule summary P
	if '(..isStringSingle("{",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"{")  {
		if ..ExportAliasName(subElement,.addedElement)  {
			if ..ExportModuleItems14RepZero(subElement,.addedElement)  {
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

///  (',' export_Alias_Name )*
Method ExportModuleItems14RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ExportModuleItems15Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

/// ',' export_Alias_Name
/// summary values:,
Method ExportModuleItems15Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..ExportAliasName(subElement,.addedElement)  {
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

///  export_Statement ::= ("Export" ["Default"] (export_From_Block | declaration) eos) | ("Export" "Default" single_Expression eos)
Method ExportStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ExportStatement9Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ExportStatement11Sub(subElement,.addedElement)  {
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

/// export_From_Block | declaration
Method ExportStatement10Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ExportFromBlock(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Declaration(subElement,.addedElement)  {
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

/// "Export" "Default" single_Expression eos
/// summary values:EXPORT
Method ExportStatement11Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&K&?1Rule?&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("EXPORT"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"EXPORT")  {
		if ..addKeyword(subElement,"DEFAULT")  {
			if ..SingleExpression(subElement,.addedElement)  {
				if ..Eos(subElement,.addedElement)  {
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

/// "Export" ["Default"] (export_From_Block | declaration) eos
/// summary values:EXPORT
Method ExportStatement9Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?4?&?1Rule?&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("EXPORT"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"EXPORT")  {
		if $S(..addKeyword(subElement,"DEFAULT") :1,1:1) {
			if ..ExportStatement10Sub(subElement,.addedElement)  {
				if ..Eos(subElement,.addedElement)  {
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

///  expression_Sequence ::= single_Expression (',' single_Expression)*
Method ExpressionSequence(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SingleExpression(subElement,.addedElement)  {
		if ..ExpressionSequence65RepZero(subElement,.addedElement)  {
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

///  (',' single_Expression)*
Method ExpressionSequence65RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ExpressionSequence66Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

/// ',' single_Expression
/// summary values:,
Method ExpressionSequence66Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..SingleExpression(subElement,.addedElement)  {
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

///  expression_Statement ::= expression_Sequence eos
Method ExpressionStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ExpressionSequence(subElement,.addedElement)  {
		if ..Eos(subElement,.addedElement)  {
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

///  factor ::= ( monadicop )* primary
Method Factor(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (?4?)*&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Factor115RepZero(subElement,.addedElement)  {
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
Method Factor115RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..Factor116Sub(subElement,.addedElement)  {
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
Method Factor116Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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

///  field_Definition ::= class_Element_Name [initializer]
Method FieldDefinition(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ClassElementName(subElement,.addedElement)  {
		if $S(..Initializer(subElement,.addedElement) :1,1:1) {
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

///  finally_Production ::= "Finally" block
/// summary values:FINALLY
Method FinallyProduction(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("FINALLY"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"FINALLY")  {
		if ..Block(subElement,.addedElement)  {
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

///  formal_Parameter_Arg ::= assignable ['=' single_Expression]
Method FormalParameterArg(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Assignable(subElement,.addedElement)  {
		if ..FormalParameterArg50OptGrp(subElement,.addedElement)  {
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
/// summary values:=
Method FormalParameterArg50OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle("=",.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"=")  {
		if ..SingleExpression(subElement,.addedElement)  {
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

///  formal_Parameter_List ::= (formal_Parameter_Arg (',' formal_Parameter_Arg)* [',' last_Formal_Parameter_Arg]) | last_Formal_Parameter_Arg
Method FormalParameterList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..FormalParameterList46Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..LastFormalParameterArg(subElement,.addedElement)  {
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

/// formal_Parameter_Arg (',' formal_Parameter_Arg)* [',' last_Formal_Parameter_Arg]
Method FormalParameterList46Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*&?4?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..FormalParameterArg(subElement,.addedElement)  {
		if ..FormalParameterList47RepZero(subElement,.addedElement)  {
			if ..FormalParameterList49OptGrp(subElement,.addedElement)  {
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

///  (',' formal_Parameter_Arg)*
Method FormalParameterList47RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..FormalParameterList48Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

/// ',' formal_Parameter_Arg
/// summary values:,
Method FormalParameterList48Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..FormalParameterArg(subElement,.addedElement)  {
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
/// summary values:,
Method FormalParameterList49OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..LastFormalParameterArg(subElement,.addedElement)  {
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

///  function ::= identifier '(' expression_sequence ')'
Method Function(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&P&?1Rule?&P
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Identifier(subElement,.addedElement)  {
		if ..addPunctuation(subElement,"(")  {
			if ..ExpressionSequence(subElement,.addedElement)  {
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

///  function_Body ::= '{' [source_Elements] '}'
/// summary values:{
Method FunctionBody(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?4?&P
	; first rule summary P
	if '(..isStringSingle("{",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"{")  {
		if $S(..SourceElements(subElement,.addedElement) :1,1:1) {
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

///  function_Declaration ::= ["Async"] "Function" ['*'] identifier '(' [formal_Parameter_List] ')' function_Body
Method FunctionDeclaration(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?&K&?4?&?1Rule?&P&?4?&P&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..addKeyword(subElement,"ASYNC") :1,1:1) {
		if ..addKeyword(subElement,"FUNCTION")  {
			if $S(..addPunctuation(subElement,"*") :1,1:1) {
				if ..Identifier(subElement,.addedElement)  {
					if ..addPunctuation(subElement,"(")  {
						if $S(..FormalParameterList(subElement,.addedElement) :1,1:1) {
							if ..addPunctuation(subElement,")")  {
								if ..FunctionBody(subElement,.addedElement)  {
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

///  getter ::= "get" identifier class_Element_Name
/// summary values:GET
Method Getter(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("GET"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"GET")  {
		if ..Identifier(subElement,.addedElement)  {
			if ..ClassElementName(subElement,.addedElement)  {
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

///  GreaterThanEquals ::= '>='
/// summary values:>=
Method Greaterthanequals(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle(">=",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,">=")  {
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

///  Hashtag ::= '#'
/// summary values:#
Method Hashtag(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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

///  Hex_Integer_Literal ::= ('0x' | '0X') ('0' | '1' | '2' | '3' | '4' | '5' | '6' | '7' | '8' | '9' | 'A' | 'B' | 'C' | 'D' | 'E' | 'F' )*
Method HexIntegerLiteral(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..HexIntegerLiteral153Sub(subElement,.addedElement)  {
		if ..HexIntegerLiteral154RepZero(subElement,.addedElement)  {
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

/// '0x' | '0X'
/// summary values:0X,0X
Method HexIntegerLiteral153Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|P
	if '(..isStringInList($lb("0X","0X"),2,.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	s subElement=ParentElement
	if ..addPunctuation(subElement,"0x")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"0X")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  ('0' | '1' | '2' | '3' | '4' | '5' | '6' | '7' | '8' | '9' | 'A' | 'B' | 'C' | 'D' | 'E' | 'F' )*
Method HexIntegerLiteral154RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..HexIntegerLiteral155Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

/// '0' | '1' | '2' | '3' | '4' | '5' | '6' | '7' | '8' | '9' | 'A' | 'B' | 'C' | 'D' | 'E' | 'F'
Method HexIntegerLiteral155Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|P|P|P|P|P|P|P|P|P|K|K|K|K|K|K
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"0")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"1")  {
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
	} elseif ..addKeyword(subElement,"A")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"B")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"C")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"D")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"E")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"F")  {
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

///  identifier ::= "NEED IDENTIFIER"
/// summary values:NEED IDENTIFIER
Method Identifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("NEED IDENTIFIER",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"NEED IDENTIFIER")  {
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

///  identifier_Name ::= identifier | reserved_Word
Method IdentifierName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Identifier(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ReservedWord(subElement,.addedElement)  {
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

///  IdentityEquals ::= '==='
/// summary values:===
Method Identityequals(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("===",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"===")  {
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

///  IdentityNotEquals ::= '!=='
/// summary values:!==
Method Identitynotequals(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("!==",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"!==")  {
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

///  if_Statement ::= "If" '(' expression_Sequence ')' statement [("Else" statement)]
/// summary values:IF
Method IfStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?&P&?1Rule?&?4?
	; first rule summary K
	if '(..isKeywordInList($lb("IF"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"IF")  {
		if ..addPunctuation(subElement,"(")  {
			if ..ExpressionSequence(subElement,.addedElement)  {
				if ..addPunctuation(subElement,")")  {
					if ..Statement(subElement,.addedElement)  {
						if $S(..IfStatement20Sub(subElement,.addedElement) :1,1:1) {
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

/// "Else" statement
/// summary values:ELSE
Method IfStatement20Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("ELSE"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"ELSE")  {
		if ..Statement(subElement,.addedElement)  {
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

///  import_Alias_Name ::= module_Export_Name [("As" imported_Binding)]
Method ImportAliasName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ModuleExportName(subElement,.addedElement)  {
		if $S(..ImportAliasName5Sub(subElement,.addedElement) :1,1:1) {
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

/// "As" imported_Binding
/// summary values:AS
Method ImportAliasName5Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("AS"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"AS")  {
		if ..ImportedBinding(subElement,.addedElement)  {
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

///  import_Default ::= alias_Name ','
Method ImportDefault(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&P
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..AliasName(subElement,.addedElement)  {
		if ..addPunctuation(subElement,",")  {
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

///  import_From ::= "From" String_Literal
/// summary values:FROM
Method ImportFrom(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("FROM"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"FROM")  {
		if ..StringLiteral(subElement,.addedElement)  {
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

///  import_From_Block ::= [import_Default] (import_Namespace | import_Module_Items) import_From eos | String_Literal eos
Method ImportFromBlock(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?&?1Rule?&?1Rule?&?1Rule?|?1Rule?&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..ImportDefault(subElement,.addedElement) :1,1:1) {
		if ..ImportFromBlock2Sub(subElement,.addedElement)  {
			if ..ImportFrom(subElement,.addedElement)  {
				if ..Eos(subElement,.addedElement)  {
					set done=1 ; or
				} elseif ..StringLiteral(subElement,.addedElement)  {
					if ..Eos(subElement,.addedElement)  {
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

/// import_Namespace | import_Module_Items
Method ImportFromBlock2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ImportNamespace(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ImportModuleItems(subElement,.addedElement)  {
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

///  import_Module_Items ::= '{' import_Alias_Name (',' import_Alias_Name )* '}'
/// summary values:{
Method ImportModuleItems(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&(?4?)*&P
	; first rule summary P
	if '(..isStringSingle("{",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"{")  {
		if ..ImportAliasName(subElement,.addedElement)  {
			if ..ImportModuleItems3RepZero(subElement,.addedElement)  {
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

///  (',' import_Alias_Name )*
Method ImportModuleItems3RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ImportModuleItems4Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

/// ',' import_Alias_Name
/// summary values:,
Method ImportModuleItems4Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..ImportAliasName(subElement,.addedElement)  {
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

///  import_Namespace ::= ('*' | identifier_Name) [("As" identifier_Name)]
Method ImportNamespace(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ImportNamespace6Sub(subElement,.addedElement)  {
		if $S(..ImportNamespace7Sub(subElement,.addedElement) :1,1:1) {
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

/// '*' | identifier_Name
Method ImportNamespace6Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"*")  {
		set done=1 ; or
	} elseif ..IdentifierName(subElement,.addedElement)  {
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

/// "As" identifier_Name
/// summary values:AS
Method ImportNamespace7Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("AS"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"AS")  {
		if ..IdentifierName(subElement,.addedElement)  {
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

///  import_Statement ::= "Import" import_From_Block
/// summary values:IMPORT
Method ImportStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("IMPORT"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"IMPORT")  {
		if ..ImportFromBlock(subElement,.addedElement)  {
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

///  imported_Binding ::= Identifier | "Yield" | "Await"
Method ImportedBinding(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|K|K
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Identifier(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"YIELD")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"AWAIT")  {
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

///  initializer ::= '=' single_Expression
/// summary values:=
Method Initializer(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle("=",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"=")  {
		if ..SingleExpression(subElement,.addedElement)  {
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

///  iteration_Statement ::= ("Do" statement "While" '(' expression_Sequence ')' eos) | ("While" '(' expression_Sequence ')' statement ) | ( "for" "(" "var" Variable_Declaration ";" [ single_Expression ] ";" [ single_Expression ] ")" Statement ) | ("For" '(' [expression_Sequence | variable_Declaration_List] ';' [expression_Sequence] ';' [expression_Sequence] ')' statement ) | ("For" '(' (single_Expression | variable_Declaration_List) "In" expression_Sequence ')' statement ) | ("For" ["Await"] '(' (single_Expression | variable_Declaration_List) "Of" expression_Sequence ')' statement )
Method IterationStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..IterationStatement21Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..IterationStatement22Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..IterationStatement23Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..IterationStatement24Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..IterationStatement26Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..IterationStatement28Sub(subElement,.addedElement)  {
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

/// "Do" statement "While" '(' expression_Sequence ')' eos
/// summary values:DO
Method IterationStatement21Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?&K&P&?1Rule?&P&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("DO"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"DO")  {
		if ..Statement(subElement,.addedElement)  {
			if ..addKeyword(subElement,"WHILE")  {
				if ..addPunctuation(subElement,"(")  {
					if ..ExpressionSequence(subElement,.addedElement)  {
						if ..addPunctuation(subElement,")")  {
							if ..Eos(subElement,.addedElement)  {
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

/// "While" '(' expression_Sequence ')' statement
/// summary values:WHILE
Method IterationStatement22Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?&P&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("WHILE"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"WHILE")  {
		if ..addPunctuation(subElement,"(")  {
			if ..ExpressionSequence(subElement,.addedElement)  {
				if ..addPunctuation(subElement,")")  {
					if ..Statement(subElement,.addedElement)  {
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

///  "for" "(" "var" Variable_Declaration ";" [ single_Expression ] ";" [ single_Expression ] ")" Statement
/// summary values:FOR
Method IterationStatement23Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&K&?1Rule?&P&?4?&P&?4?&P&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("FOR"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"FOR")  {
		if ..addPunctuation(subElement,"(")  {
			if ..addKeyword(subElement,"VAR")  {
				if ..VariableDeclaration(subElement,.addedElement)  {
					if ..addPunctuation(subElement,";")  {
						if $S(..SingleExpression(subElement,.addedElement) :1,1:1) {
							if ..addPunctuation(subElement,";")  {
								if $S(..SingleExpression(subElement,.addedElement) :1,1:1) {
									if ..addPunctuation(subElement,")")  {
										if ..Statement(subElement,.addedElement)  {
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
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

/// "For" '(' [expression_Sequence | variable_Declaration_List] ';' [expression_Sequence] ';' [expression_Sequence] ')' statement
/// summary values:FOR
Method IterationStatement24Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?4?&P&?4?&P&?4?&P&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("FOR"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"FOR")  {
		if ..addPunctuation(subElement,"(")  {
			if ..IterationStatement25OptGrp(subElement,.addedElement)  {
				if ..addPunctuation(subElement,";")  {
					if $S(..ExpressionSequence(subElement,.addedElement) :1,1:1) {
						if ..addPunctuation(subElement,";")  {
							if $S(..ExpressionSequence(subElement,.addedElement) :1,1:1) {
								if ..addPunctuation(subElement,")")  {
									if ..Statement(subElement,.addedElement)  {
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
		$$$BNFCOMMITCOPY(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

Method IterationStatement25OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ExpressionSequence(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..VariableDeclarationList(subElement,.addedElement)  {
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

/// "For" '(' (single_Expression | variable_Declaration_List) "In" expression_Sequence ')' statement
/// summary values:FOR
Method IterationStatement26Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?&K&?1Rule?&P&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("FOR"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"FOR")  {
		if ..addPunctuation(subElement,"(")  {
			if ..IterationStatement27Sub(subElement,.addedElement)  {
				if ..addKeyword(subElement,"IN")  {
					if ..ExpressionSequence(subElement,.addedElement)  {
						if ..addPunctuation(subElement,")")  {
							if ..Statement(subElement,.addedElement)  {
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

/// single_Expression | variable_Declaration_List
Method IterationStatement27Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SingleExpression(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..VariableDeclarationList(subElement,.addedElement)  {
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

/// "For" ["Await"] '(' (single_Expression | variable_Declaration_List) "Of" expression_Sequence ')' statement
/// summary values:FOR
Method IterationStatement28Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?4?&P&?1Rule?&K&?1Rule?&P&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("FOR"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"FOR")  {
		if $S(..addKeyword(subElement,"AWAIT") :1,1:1) {
			if ..addPunctuation(subElement,"(")  {
				if ..IterationStatement29Sub(subElement,.addedElement)  {
					if ..addKeyword(subElement,"OF")  {
						if ..ExpressionSequence(subElement,.addedElement)  {
							if ..addPunctuation(subElement,")")  {
								if ..Statement(subElement,.addedElement)  {
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

/// single_Expression | variable_Declaration_List
Method IterationStatement29Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SingleExpression(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..VariableDeclarationList(subElement,.addedElement)  {
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

///  keyword ::= "Break" | "Do" | "Instanceof" | "Typeof" | "Case" | "Else" | "New" | "Var" | "Catch" | "Finally" | "Return" | "Void" | "Continue" | "For" | "Switch" | "While" | "Debugger" | "Function" | "This" | "With" | "Default" | "If" | "Throw" | "Delete" | "In" | "Try" | "Class" | "Enum" | "Extends" | "Super" | "Const" | "Export" | "Import" | "Implements" | "let" | "Private" | "Public" | "Interface" | "Package" | "Protected" | "Static" | "Yield" | "Async" | "Await" | "From" | "As" | "Of"
/// summary values:BREAK,DO,INSTANCEOF,TYPEOF,CASE,ELSE,NEW,VAR,CATCH,FINALLY,RETURN,VOID,CONTINUE,FOR,SWITCH,WHILE,DEBUGGER,FUNCTION,THIS,WITH,DEFAULT,IF,THROW,DELETE,IN,TRY,CLASS,ENUM,EXTENDS,SUPER,CONST,EXPORT,IMPORT,IMPLEMENTS,LET,PRIVATE,PUBLIC,INTERFACE,PACKAGE,PROTECTED,STATIC,YIELD,ASYNC,AWAIT,FROM,AS,OF
Method Keyword(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K
	if '(..isKeywordInList($lb("BREAK","DO","INSTANCEOF","TYPEOF","CASE","ELSE","NEW","VAR","CATCH","FINALLY","RETURN","VOID","CONTINUE","FOR","SWITCH","WHILE","DEBUGGER","FUNCTION","THIS","WITH","DEFAULT","IF","THROW","DELETE","IN","TRY","CLASS","ENUM","EXTENDS","SUPER","CONST","EXPORT","IMPORT","IMPLEMENTS","LET","PRIVATE","PUBLIC","INTERFACE","PACKAGE","PROTECTED","STATIC","YIELD","ASYNC","AWAIT","FROM","AS","OF"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"BREAK")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"DO")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"INSTANCEOF")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"TYPEOF")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"CASE")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"ELSE")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"NEW")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"VAR")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"CATCH")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"FINALLY")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"RETURN")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"VOID")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"CONTINUE")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"FOR")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"SWITCH")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"WHILE")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"DEBUGGER")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"FUNCTION")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"THIS")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"WITH")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"DEFAULT")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"IF")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"THROW")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"DELETE")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"IN")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"TRY")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"CLASS")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"ENUM")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"EXTENDS")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"SUPER")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"CONST")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"EXPORT")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"IMPORT")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"IMPLEMENTS")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"LET")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"PRIVATE")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"PUBLIC")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"INTERFACE")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"PACKAGE")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"PROTECTED")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"STATIC")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"YIELD")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"ASYNC")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"AWAIT")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"FROM")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"AS")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"OF")  {
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

///  labelled_Statement ::= identifier ':' statement
Method LabelledStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&P&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Identifier(subElement,.addedElement)  {
		if ..addPunctuation(subElement,":")  {
			if ..Statement(subElement,.addedElement)  {
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

///  last_Formal_Parameter_Arg ::= Ellipsis single_Expression
Method LastFormalParameterArg(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Ellipsis(subElement,.addedElement)  {
		if ..SingleExpression(subElement,.addedElement)  {
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

///  LeftShiftArithmetic ::= '<<'
/// summary values:<<
Method Leftshiftarithmetic(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("<<",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"<<")  {
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

///  LeftShiftArithmeticAssign ::= '<<='
/// summary values:<<=
Method Leftshiftarithmeticassign(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("<<=",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"<<=")  {
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

///  LessThan ::= '<'
/// summary values:<
Method Lessthan(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("<",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"<")  {
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

///  LessThanEquals ::= '<='
/// summary values:<=
Method Lessthanequals(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("<=",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"<=")  {
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

///  let ::= "let"
/// summary values:LET
Method Let(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeywordInList($lb("LET"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"LET")  {
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

///  literal ::= Null_Literal | Boolean_Literal | String_Literal | Regular_Expression_Literal | numeric_Literal | bigint_Literal
Method Literal(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..NullLiteral(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..BooleanLiteral(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StringLiteral(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..RegularExpressionLiteral(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..NumericLiteral(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..BigintLiteral(subElement,.addedElement)  {
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

///  macro ::= '$$$' identifier ['(' expression_sequence ')']
/// summary values:$$$
Method Macro(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&?4?
	; first rule summary P
	if '(..isStringSingle("$$$",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"$$$")  {
		if ..Identifier(subElement,.addedElement)  {
			if ..Macro146OptGrp(subElement,.addedElement)  {
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
Method Macro146OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 1 /* not found is OK */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"(")  {
		if ..ExpressionSequence(subElement,.addedElement)  {
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

///  Member_Expression_Part ::= ( "[" single_Expression "]" ) | ( "." Identifier [( "(" [ expression_Sequence ] ")" )] )
Method MemberExpressionPart(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..MemberExpressionPart143Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..MemberExpressionPart144Sub(subElement,.addedElement)  {
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

///  "[" single_Expression "]"
/// summary values:[
Method MemberExpressionPart143Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&P
	; first rule summary P
	if '(..isStringSingle("[",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"[")  {
		if ..SingleExpression(subElement,.addedElement)  {
			if ..addPunctuation(subElement,"]")  {
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

///  "." Identifier [( "(" [ expression_Sequence ] ")" )]
/// summary values:.
Method MemberExpressionPart144Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&?4?
	; first rule summary P
	if '(..isStringSingle(".",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,".")  {
		if ..Identifier(subElement,.addedElement)  {
			if $S(..MemberExpressionPart145Sub(subElement,.addedElement) :1,1:1) {
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

///  "(" [ expression_Sequence ] ")"
/// summary values:(
Method MemberExpressionPart145Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?4?&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"(")  {
		if $S(..ExpressionSequence(subElement,.addedElement) :1,1:1) {
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

///  method_Definition ::= (["Async"] ['*'] class_Element_Name '(' [formal_Parameter_List ] ')' function_Body) | (['*'] getter '(' ')' function_Body) | (['*'] setter '(' formal_Parameter_List? ')' function_Body)
Method MethodDefinition(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..MethodDefinition43Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..MethodDefinition44Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..MethodDefinition45Sub(subElement,.addedElement)  {
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

/// ["Async"] ['*'] class_Element_Name '(' [formal_Parameter_List ] ')' function_Body
Method MethodDefinition43Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?&?4?&?1Rule?&P&?4?&P&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..addKeyword(subElement,"ASYNC") :1,1:1) {
		if $S(..addPunctuation(subElement,"*") :1,1:1) {
			if ..ClassElementName(subElement,.addedElement)  {
				if ..addPunctuation(subElement,"(")  {
					if $S(..FormalParameterList(subElement,.addedElement) :1,1:1) {
						if ..addPunctuation(subElement,")")  {
							if ..FunctionBody(subElement,.addedElement)  {
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

/// ['*'] getter '(' ')' function_Body
Method MethodDefinition44Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?&?1Rule?&P&P&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..addPunctuation(subElement,"*") :1,1:1) {
		if ..Getter(subElement,.addedElement)  {
			if ..addPunctuation(subElement,"(")  {
				if ..addPunctuation(subElement,")")  {
					if ..FunctionBody(subElement,.addedElement)  {
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

/// ['*'] setter '(' formal_Parameter_List? ')' function_Body
Method MethodDefinition45Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?&?1Rule?&P&?4?&P&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..addPunctuation(subElement,"*") :1,1:1) {
		if ..Setter(subElement,.addedElement)  {
			if ..addPunctuation(subElement,"(")  {
				if $s(..FormalParameterList(subElement,.addedElement) :1,1:1)  {
					if ..addPunctuation(subElement,")")  {
						if ..FunctionBody(subElement,.addedElement)  {
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

///  Minus ::= '-'
/// summary values:-
Method Minus(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("-",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"-")  {
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

///  MinusAssign ::= '-='
/// summary values:-=
Method Minusassign(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("-=",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"-=")  {
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

///  MinusMinus ::= '--'
/// summary values:--
Method Minusminus(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("--",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"--")  {
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

///  module_Export_Name ::= identifier_Name | String_Literal
Method ModuleExportName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..IdentifierName(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StringLiteral(subElement,.addedElement)  {
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

///  Modulus ::= '%'
/// summary values:%
Method Modulus(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("%",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"%")  {
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

///  ModulusAssign ::= '%='
/// summary values:%=
Method Modulusassign(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("%=",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"%=")  {
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

///  monadicop ::= "++" | "--" | "+" | "-" | "~" | "!"
/// summary values:++,--,+,-,~,!
Method Monadicop(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|P|P|P|P|P
	if '(..isStringInList($lb("++","--","+","-","~","!"),2,.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"++")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"--")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"+")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"-")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"~")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"!")  {
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

///  MoreThan ::= '>'
/// summary values:>
Method Morethan(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle(">",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,">")  {
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

///  Multiply ::= '*'
/// summary values:*
Method Multiply(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("*",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"*")  {
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

///  MultiplyAssign ::= '*='
/// summary values:*=
Method Multiplyassign(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("*=",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"*=")  {
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

///  Not ::= '!'
/// summary values:!
Method Not(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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

///  NotEquals ::= '!='
/// summary values:!=
Method Notequals(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("!=",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"!=")  {
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

///  null_literal ::= 'null'
/// summary values:NULL
Method NullLiteral(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeywordInList($lb("NULL"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"NULL")  {
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

///  NullCoalesce ::= '??'
/// summary values:??
Method Nullcoalesce(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("??",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"??")  {
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

///  NullishCoalescingAssign ::= '??='
/// summary values:??=
Method Nullishcoalescingassign(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("??=",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"??=")  {
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

///  numeric_Literal ::= Decimal_Literal | Hex_Integer_Literal | Octal_Integer_Literal | Octal_Integer_Literal2 | Binary_Integer_Literal
Method NumericLiteral(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..DecimalLiteral(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..HexIntegerLiteral(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OctalIntegerLiteral(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OctalIntegerLiteral2(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..BinaryIntegerLiteral(subElement,.addedElement)  {
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

///  object_Literal ::= '{' [property_Assignment (',' property_Assignment)* ] '}'
/// summary values:{
Method ObjectLiteral(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?4?&P
	; first rule summary P
	if '(..isStringSingle("{",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"{")  {
		if ..ObjectLiteral147OptGrp(subElement,.addedElement)  {
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

Method ObjectLiteral147OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..PropertyAssignment(subElement,.addedElement)  {
		if ..ObjectLiteral148RepZero(subElement,.addedElement)  {
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

///  (',' property_Assignment)*
Method ObjectLiteral148RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ObjectLiteral149Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

/// ',' property_Assignment
/// summary values:,
Method ObjectLiteral149Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..PropertyAssignment(subElement,.addedElement)  {
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

///  Octal_Integer_Literal ::= ('0o' | '0O') ('0' | '1' | '2' | '3' | '4' | '5' | '6' | '7' )*
Method OctalIntegerLiteral(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OctalIntegerLiteral156Sub(subElement,.addedElement)  {
		if ..OctalIntegerLiteral157RepZero(subElement,.addedElement)  {
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

/// '0o' | '0O'
/// summary values:0O,0O
Method OctalIntegerLiteral156Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|P
	if '(..isStringInList($lb("0O","0O"),2,.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	s subElement=ParentElement
	if ..addPunctuation(subElement,"0o")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"0O")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  ('0' | '1' | '2' | '3' | '4' | '5' | '6' | '7' )*
Method OctalIntegerLiteral157RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..OctalIntegerLiteral158Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

/// '0' | '1' | '2' | '3' | '4' | '5' | '6' | '7'
/// summary values:0,1,2,3,4,5,6,7
Method OctalIntegerLiteral158Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|P|P|P|P|P|P|P
	if '(..isStringInList($lb("0","1","2","3","4","5","6","7"),1,.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	s subElement=ParentElement
	if ..addPunctuation(subElement,"0")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"1")  {
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
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  Octal_Integer_Literal2 ::= Octal_Integer_Literal
Method OctalIntegerLiteral2(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OctalIntegerLiteral(subElement,.addedElement)  {
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

///  oldsingle_Expression ::= anonymous_Function | ( 'Class' identifier? class_Tail ) | ( single_Expression '?.' single_Expression ) | ( single_Expression ['?.'] '[' expression_Sequence ']') | ( single_Expression ['?'] '.' ['#'] identifier_Name ) | ( "New" identifier arguments) | ( "New" single_Expression arguments) | ( "New" single_Expression) | ( single_Expression arguments) | ( "New" '.' identifier ) | ( single_Expression '++' ) | ( single_Expression '--' ) | ( "Delete" single_Expression ) | ( "Void" single_Expression ) | ( "Typeof" single_Expression ) | ('++' single_Expression ) | ('--' single_Expression ) | ('+' single_Expression ) | ('-' single_Expression ) | ('~' single_Expression ) | ('!' single_Expression ) | ("Await" single_Expression ) | ( single_Expression '**' single_Expression ) | ( single_Expression ('*' | '/' | '%') single_Expression ) | ( single_Expression ('+' | '-') single_Expression ) | ( single_Expression '??' single_Expression ) | ( single_Expression ('<<' | '>>' | '>>>') single_Expression ) | ( single_Expression ('<' | '>' | '<=' | '>=') single_Expression ) | ( single_Expression "Instanceof" single_Expression ) | ( single_Expression "In" single_Expression ) | ( single_Expression ('==' | '!=' | '===' | '!==') single_Expression ) | ( single_Expression '&' single_Expression ) | ( single_Expression '^' single_Expression ) | ( single_Expression '|' single_Expression ) | ( single_Expression '&&' single_Expression ) | ( single_Expression '||' single_Expression ) | ( single_Expression '?' single_Expression ':' single_Expression ) | ( single_Expression '=' single_Expression ) | ( single_Expression assignment_Operator single_Expression ) | ( "Import" '(' single_Expression ')' ) | ( yield_Statement ) | "This" | identifier | "Super" | literal | array_Literal | object_Literal | ('(' expression_Sequence ')')
Method OldsingleExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|K|?1Rule?|K|?1Rule?|?1Rule?|?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..AnonymousFunction(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression67Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression68Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression69Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression70Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression71Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression72Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression73Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression74Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression75Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression76Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression77Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression78Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression79Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression80Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression81Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression82Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression83Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression84Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression85Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression86Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression87Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression88Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression89Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression91Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression93Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression94Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression96Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression98Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression99Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression100Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression102Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression103Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression104Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression105Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression106Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression107Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression108Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression109Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression110Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression111Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"THIS")  {
		set done=1 ; or
	} elseif ..Identifier(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"SUPER")  {
		set done=1 ; or
	} elseif ..Literal(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ArrayLiteral(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ObjectLiteral(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression112Sub(subElement,.addedElement)  {
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

///  single_Expression ('==' | '!=' | '===' | '!==') single_Expression
Method OldsingleExpression100Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?1Rule?&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SingleExpression(subElement,.addedElement)  {
		if ..OldsingleExpression101Sub(subElement,.addedElement)  {
			if ..SingleExpression(subElement,.addedElement)  {
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

/// '==' | '!=' | '===' | '!=='
/// summary values:==,!=,===,!==
Method OldsingleExpression101Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|P|P|P
	if '(..isStringInList($lb("==","!=","===","!=="),3,.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	s subElement=ParentElement
	if ..addPunctuation(subElement,"==")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"!=")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"===")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"!==")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  single_Expression '&' single_Expression
Method OldsingleExpression102Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&P&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SingleExpression(subElement,.addedElement)  {
		if ..addPunctuation(subElement,"&")  {
			if ..SingleExpression(subElement,.addedElement)  {
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

///  single_Expression '^' single_Expression
Method OldsingleExpression103Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&P&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SingleExpression(subElement,.addedElement)  {
		if ..addPunctuation(subElement,"^")  {
			if ..SingleExpression(subElement,.addedElement)  {
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

///  single_Expression '|' single_Expression
Method OldsingleExpression104Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&P&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SingleExpression(subElement,.addedElement)  {
		if ..addPunctuation(subElement,"|")  {
			if ..SingleExpression(subElement,.addedElement)  {
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

///  single_Expression '&&' single_Expression
Method OldsingleExpression105Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&P&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SingleExpression(subElement,.addedElement)  {
		if ..addPunctuation(subElement,"&&")  {
			if ..SingleExpression(subElement,.addedElement)  {
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

///  single_Expression '||' single_Expression
Method OldsingleExpression106Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&P&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SingleExpression(subElement,.addedElement)  {
		if ..addPunctuation(subElement,"||")  {
			if ..SingleExpression(subElement,.addedElement)  {
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

///  single_Expression '?' single_Expression ':' single_Expression
Method OldsingleExpression107Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&P&?1Rule?&P&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SingleExpression(subElement,.addedElement)  {
		if ..addPunctuation(subElement,"?")  {
			if ..SingleExpression(subElement,.addedElement)  {
				if ..addPunctuation(subElement,":")  {
					if ..SingleExpression(subElement,.addedElement)  {
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

///  single_Expression '=' single_Expression
Method OldsingleExpression108Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&P&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SingleExpression(subElement,.addedElement)  {
		if ..addPunctuation(subElement,"=")  {
			if ..SingleExpression(subElement,.addedElement)  {
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

///  single_Expression assignment_Operator single_Expression
Method OldsingleExpression109Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?1Rule?&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SingleExpression(subElement,.addedElement)  {
		if ..AssignmentOperator(subElement,.addedElement)  {
			if ..SingleExpression(subElement,.addedElement)  {
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

///  "Import" '(' single_Expression ')'
/// summary values:IMPORT
Method OldsingleExpression110Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?&P
	; first rule summary K
	if '(..isKeywordInList($lb("IMPORT"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"IMPORT")  {
		if ..addPunctuation(subElement,"(")  {
			if ..SingleExpression(subElement,.addedElement)  {
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

///  yield_Statement
Method OldsingleExpression111Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..YieldStatement(subElement,.addedElement)  {
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

/// '(' expression_Sequence ')'
/// summary values:(
Method OldsingleExpression112Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"(")  {
		if ..ExpressionSequence(subElement,.addedElement)  {
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

///  'Class' identifier? class_Tail
/// summary values:CLASS
Method OldsingleExpression67Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?4?&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("CLASS"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"CLASS")  {
		if $s(..Identifier(subElement,.addedElement) :1,1:1)  {
			if ..ClassTail(subElement,.addedElement)  {
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

///  single_Expression '?.' single_Expression
Method OldsingleExpression68Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&P&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SingleExpression(subElement,.addedElement)  {
		if ..addPunctuation(subElement,"?.")  {
			if ..SingleExpression(subElement,.addedElement)  {
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

///  single_Expression ['?.'] '[' expression_Sequence ']'
Method OldsingleExpression69Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?&P&?1Rule?&P
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SingleExpression(subElement,.addedElement)  {
		if $S(..addPunctuation(subElement,"?.") :1,1:1) {
			if ..addPunctuation(subElement,"[")  {
				if ..ExpressionSequence(subElement,.addedElement)  {
					if ..addPunctuation(subElement,"]")  {
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

///  single_Expression ['?'] '.' ['#'] identifier_Name
Method OldsingleExpression70Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?&P&?4?&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SingleExpression(subElement,.addedElement)  {
		if $S(..addPunctuation(subElement,"?") :1,1:1) {
			if ..addPunctuation(subElement,".")  {
				if $S(..addPunctuation(subElement,"#") :1,1:1) {
					if ..IdentifierName(subElement,.addedElement)  {
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

///  "New" identifier arguments
/// summary values:NEW
Method OldsingleExpression71Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("NEW"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"NEW")  {
		if ..Identifier(subElement,.addedElement)  {
			if ..Arguments(subElement,.addedElement)  {
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

///  "New" single_Expression arguments
/// summary values:NEW
Method OldsingleExpression72Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("NEW"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"NEW")  {
		if ..SingleExpression(subElement,.addedElement)  {
			if ..Arguments(subElement,.addedElement)  {
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

///  "New" single_Expression
/// summary values:NEW
Method OldsingleExpression73Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("NEW"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"NEW")  {
		if ..SingleExpression(subElement,.addedElement)  {
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

///  single_Expression arguments
Method OldsingleExpression74Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SingleExpression(subElement,.addedElement)  {
		if ..Arguments(subElement,.addedElement)  {
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

///  "New" '.' identifier
/// summary values:NEW
Method OldsingleExpression75Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("NEW"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"NEW")  {
		if ..addPunctuation(subElement,".")  {
			if ..Identifier(subElement,.addedElement)  {
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

///  single_Expression '++'
Method OldsingleExpression76Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&P
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SingleExpression(subElement,.addedElement)  {
		if ..addPunctuation(subElement,"++")  {
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

///  single_Expression '--'
Method OldsingleExpression77Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&P
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SingleExpression(subElement,.addedElement)  {
		if ..addPunctuation(subElement,"--")  {
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

///  "Delete" single_Expression
/// summary values:DELETE
Method OldsingleExpression78Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("DELETE"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"DELETE")  {
		if ..SingleExpression(subElement,.addedElement)  {
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

///  "Void" single_Expression
/// summary values:VOID
Method OldsingleExpression79Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("VOID"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"VOID")  {
		if ..SingleExpression(subElement,.addedElement)  {
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

///  "Typeof" single_Expression
/// summary values:TYPEOF
Method OldsingleExpression80Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("TYPEOF"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"TYPEOF")  {
		if ..SingleExpression(subElement,.addedElement)  {
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

/// '++' single_Expression
/// summary values:++
Method OldsingleExpression81Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle("++",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"++")  {
		if ..SingleExpression(subElement,.addedElement)  {
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

/// '--' single_Expression
/// summary values:--
Method OldsingleExpression82Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle("--",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"--")  {
		if ..SingleExpression(subElement,.addedElement)  {
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

/// '+' single_Expression
/// summary values:+
Method OldsingleExpression83Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle("+",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"+")  {
		if ..SingleExpression(subElement,.addedElement)  {
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

/// '-' single_Expression
/// summary values:-
Method OldsingleExpression84Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle("-",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"-")  {
		if ..SingleExpression(subElement,.addedElement)  {
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

/// '~' single_Expression
/// summary values:~
Method OldsingleExpression85Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle("~",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"~")  {
		if ..SingleExpression(subElement,.addedElement)  {
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

/// '!' single_Expression
/// summary values:!
Method OldsingleExpression86Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle("!",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"!")  {
		if ..SingleExpression(subElement,.addedElement)  {
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

/// "Await" single_Expression
/// summary values:AWAIT
Method OldsingleExpression87Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("AWAIT"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"AWAIT")  {
		if ..SingleExpression(subElement,.addedElement)  {
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

///  single_Expression '**' single_Expression
Method OldsingleExpression88Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&P&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SingleExpression(subElement,.addedElement)  {
		if ..addPunctuation(subElement,"**")  {
			if ..SingleExpression(subElement,.addedElement)  {
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

///  single_Expression ('*' | '/' | '%') single_Expression
Method OldsingleExpression89Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?1Rule?&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SingleExpression(subElement,.addedElement)  {
		if ..OldsingleExpression90Sub(subElement,.addedElement)  {
			if ..SingleExpression(subElement,.addedElement)  {
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

/// '*' | '/' | '%'
/// summary values:*,/,%
Method OldsingleExpression90Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|P|P
	if '(..isStringInList($lb("*","/","%"),1,.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	s subElement=ParentElement
	if ..addPunctuation(subElement,"*")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"/")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"%")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  single_Expression ('+' | '-') single_Expression
Method OldsingleExpression91Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?1Rule?&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SingleExpression(subElement,.addedElement)  {
		if ..OldsingleExpression92Sub(subElement,.addedElement)  {
			if ..SingleExpression(subElement,.addedElement)  {
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

/// '+' | '-'
/// summary values:+,-
Method OldsingleExpression92Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|P
	if '(..isStringInList($lb("+","-"),1,.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	s subElement=ParentElement
	if ..addPunctuation(subElement,"+")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"-")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  single_Expression '??' single_Expression
Method OldsingleExpression93Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&P&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SingleExpression(subElement,.addedElement)  {
		if ..addPunctuation(subElement,"??")  {
			if ..SingleExpression(subElement,.addedElement)  {
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

///  single_Expression ('<<' | '>>' | '>>>') single_Expression
Method OldsingleExpression94Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?1Rule?&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SingleExpression(subElement,.addedElement)  {
		if ..OldsingleExpression95Sub(subElement,.addedElement)  {
			if ..SingleExpression(subElement,.addedElement)  {
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

/// '<<' | '>>' | '>>>'
/// summary values:<<,>>,>>>
Method OldsingleExpression95Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|P|P
	if '(..isStringInList($lb("<<",">>",">>>"),3,.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	s subElement=ParentElement
	if ..addPunctuation(subElement,"<<")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,">>")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,">>>")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  single_Expression ('<' | '>' | '<=' | '>=') single_Expression
Method OldsingleExpression96Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?1Rule?&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SingleExpression(subElement,.addedElement)  {
		if ..OldsingleExpression97Sub(subElement,.addedElement)  {
			if ..SingleExpression(subElement,.addedElement)  {
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

/// '<' | '>' | '<=' | '>='
/// summary values:<,>,<=,>=
Method OldsingleExpression97Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|P|P|P
	if '(..isStringInList($lb("<",">","<=",">="),2,.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	s subElement=ParentElement
	if ..addPunctuation(subElement,"<")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,">")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,"<=")  {
		set done=1 ; or
	} elseif ..addPunctuation(subElement,">=")  {
		set done=1 ; end compileRules
	}

	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  single_Expression "Instanceof" single_Expression
Method OldsingleExpression98Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&K&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SingleExpression(subElement,.addedElement)  {
		if ..addKeyword(subElement,"INSTANCEOF")  {
			if ..SingleExpression(subElement,.addedElement)  {
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

///  single_Expression "In" single_Expression
Method OldsingleExpression99Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&K&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SingleExpression(subElement,.addedElement)  {
		if ..addKeyword(subElement,"IN")  {
			if ..SingleExpression(subElement,.addedElement)  {
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

///  OpenBrace ::= '{'
/// summary values:{
Method Openbrace(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("{",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"{")  {
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

///  OpenBracket ::='['
/// summary values:[
Method Openbracket(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("[",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"[")  {
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

///  OpenParen ::= '('
/// summary values:(
Method Openparen(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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

///  Or ::= '||'
/// summary values:||
Method Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("||",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"||")  {
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

///  Plus ::= '+'
/// summary values:+
Method Plus(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("+",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"+")  {
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

///  PlusAssign ::= '+='
/// summary values:+=
Method Plusassign(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("+=",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"+=")  {
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

///  PlusPlus ::= '++'
/// summary values:++
Method Plusplus(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("++",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"++")  {
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

///  Power ::= '**'
/// summary values:**
Method Power(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("**",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"**")  {
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

///  PowerAssign ::= '**='
/// summary values:**=
Method Powerassign(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("**=",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"**=")  {
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

///  primary ::= anonymous_Function | ('[' expression_sequence ']') | ( 'Class' identifier? class_Tail ) | ( "New" identifier arguments) | ( "New" single_Expression arguments) | ( "New" single_Expression) | ( "New" '.' identifier ) | ( "Delete" single_Expression ) | ( "Void" single_Expression ) | ( "Typeof" single_Expression ) | ("Await" single_Expression ) | ( "Import" '(' single_Expression ')' ) | ( yield_Statement ) | ("This" (member_expression_part)* ) | macro | (function (member_expression_part)* ) | (identifier (member_expression_part)* ) | "Super" | literal | (array_Literal (member_expression_part)*) | object_Literal | ('(' expression_Sequence ')')
Method Primary(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|K|?1Rule?|?1Rule?|?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..AnonymousFunction(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Primary118Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Primary119Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Primary120Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Primary121Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Primary122Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Primary123Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Primary124Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Primary125Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Primary126Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Primary127Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Primary128Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Primary129Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Primary130Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Macro(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Primary133Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Primary136Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"SUPER")  {
		set done=1 ; or
	} elseif ..Literal(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Primary139Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ObjectLiteral(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Primary142Sub(subElement,.addedElement)  {
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

/// '[' expression_sequence ']'
/// summary values:[
Method Primary118Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&P
	; first rule summary P
	if '(..isStringSingle("[",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"[")  {
		if ..ExpressionSequence(subElement,.addedElement)  {
			if ..addPunctuation(subElement,"]")  {
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

///  'Class' identifier? class_Tail
/// summary values:CLASS
Method Primary119Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?4?&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("CLASS"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"CLASS")  {
		if $s(..Identifier(subElement,.addedElement) :1,1:1)  {
			if ..ClassTail(subElement,.addedElement)  {
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

///  "New" identifier arguments
/// summary values:NEW
Method Primary120Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("NEW"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"NEW")  {
		if ..Identifier(subElement,.addedElement)  {
			if ..Arguments(subElement,.addedElement)  {
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

///  "New" single_Expression arguments
/// summary values:NEW
Method Primary121Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("NEW"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"NEW")  {
		if ..SingleExpression(subElement,.addedElement)  {
			if ..Arguments(subElement,.addedElement)  {
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

///  "New" single_Expression
/// summary values:NEW
Method Primary122Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("NEW"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"NEW")  {
		if ..SingleExpression(subElement,.addedElement)  {
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

///  "New" '.' identifier
/// summary values:NEW
Method Primary123Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("NEW"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"NEW")  {
		if ..addPunctuation(subElement,".")  {
			if ..Identifier(subElement,.addedElement)  {
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

///  "Delete" single_Expression
/// summary values:DELETE
Method Primary124Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("DELETE"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"DELETE")  {
		if ..SingleExpression(subElement,.addedElement)  {
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

///  "Void" single_Expression
/// summary values:VOID
Method Primary125Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("VOID"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"VOID")  {
		if ..SingleExpression(subElement,.addedElement)  {
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

///  "Typeof" single_Expression
/// summary values:TYPEOF
Method Primary126Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("TYPEOF"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"TYPEOF")  {
		if ..SingleExpression(subElement,.addedElement)  {
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

/// "Await" single_Expression
/// summary values:AWAIT
Method Primary127Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("AWAIT"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"AWAIT")  {
		if ..SingleExpression(subElement,.addedElement)  {
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

///  "Import" '(' single_Expression ')'
/// summary values:IMPORT
Method Primary128Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?&P
	; first rule summary K
	if '(..isKeywordInList($lb("IMPORT"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"IMPORT")  {
		if ..addPunctuation(subElement,"(")  {
			if ..SingleExpression(subElement,.addedElement)  {
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

///  yield_Statement
Method Primary129Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..YieldStatement(subElement,.addedElement)  {
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

/// "This" (member_expression_part)*
/// summary values:THIS
Method Primary130Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&(?4?)*
	; first rule summary K
	if '(..isKeywordInList($lb("THIS"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"THIS")  {
		if ..Primary131RepZero(subElement,.addedElement)  {
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

///  (member_expression_part)*
Method Primary131RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..Primary132Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

/// member_expression_part
Method Primary132Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..MemberExpressionPart(subElement,.addedElement)  {
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

/// function (member_expression_part)*
Method Primary133Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Function(subElement,.addedElement)  {
		if ..Primary134RepZero(subElement,.addedElement)  {
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

///  (member_expression_part)*
Method Primary134RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..Primary135Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

/// member_expression_part
Method Primary135Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..MemberExpressionPart(subElement,.addedElement)  {
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

/// identifier (member_expression_part)*
Method Primary136Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Identifier(subElement,.addedElement)  {
		if ..Primary137RepZero(subElement,.addedElement)  {
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

///  (member_expression_part)*
Method Primary137RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..Primary138Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

/// member_expression_part
Method Primary138Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..MemberExpressionPart(subElement,.addedElement)  {
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

/// array_Literal (member_expression_part)*
Method Primary139Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ArrayLiteral(subElement,.addedElement)  {
		if ..Primary140RepZero(subElement,.addedElement)  {
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

///  (member_expression_part)*
Method Primary140RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..Primary141Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

/// member_expression_part
Method Primary141Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..MemberExpressionPart(subElement,.addedElement)  {
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

/// '(' expression_Sequence ')'
/// summary values:(
Method Primary142Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"(")  {
		if ..ExpressionSequence(subElement,.addedElement)  {
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

///  private_Identifier ::= '#' identifier_Name
/// summary values:#
Method PrivateIdentifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle("#",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"#")  {
		if ..IdentifierName(subElement,.addedElement)  {
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

///  property_Assignment ::= (property_Name ':' single_Expression ) | ('[' single_Expression ']' ':' single_Expression) | ([ "Async" ] ['*'] property_Name '(' [formal_Parameter_List] ')' function_Body ) | (getter '(' ')' function_Body ) | (setter '(' formal_Parameter_Arg ')' function_Body ) | ([Ellipsis] single_Expression )
Method PropertyAssignment(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..PropertyAssignment54Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..PropertyAssignment55Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..PropertyAssignment56Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..PropertyAssignment57Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..PropertyAssignment58Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..PropertyAssignment59Sub(subElement,.addedElement)  {
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

/// property_Name ':' single_Expression
Method PropertyAssignment54Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&P&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..PropertyName(subElement,.addedElement)  {
		if ..addPunctuation(subElement,":")  {
			if ..SingleExpression(subElement,.addedElement)  {
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

/// '[' single_Expression ']' ':' single_Expression
/// summary values:[
Method PropertyAssignment55Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&P&P&?1Rule?
	; first rule summary P
	if '(..isStringSingle("[",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"[")  {
		if ..SingleExpression(subElement,.addedElement)  {
			if ..addPunctuation(subElement,"]")  {
				if ..addPunctuation(subElement,":")  {
					if ..SingleExpression(subElement,.addedElement)  {
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

/// [ "Async" ] ['*'] property_Name '(' [formal_Parameter_List] ')' function_Body
Method PropertyAssignment56Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?&?4?&?1Rule?&P&?4?&P&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..addKeyword(subElement,"ASYNC") :1,1:1) {
		if $S(..addPunctuation(subElement,"*") :1,1:1) {
			if ..PropertyName(subElement,.addedElement)  {
				if ..addPunctuation(subElement,"(")  {
					if $S(..FormalParameterList(subElement,.addedElement) :1,1:1) {
						if ..addPunctuation(subElement,")")  {
							if ..FunctionBody(subElement,.addedElement)  {
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

/// getter '(' ')' function_Body
Method PropertyAssignment57Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&P&P&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Getter(subElement,.addedElement)  {
		if ..addPunctuation(subElement,"(")  {
			if ..addPunctuation(subElement,")")  {
				if ..FunctionBody(subElement,.addedElement)  {
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

/// setter '(' formal_Parameter_Arg ')' function_Body
Method PropertyAssignment58Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&P&?1Rule?&P&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Setter(subElement,.addedElement)  {
		if ..addPunctuation(subElement,"(")  {
			if ..FormalParameterArg(subElement,.addedElement)  {
				if ..addPunctuation(subElement,")")  {
					if ..FunctionBody(subElement,.addedElement)  {
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

/// [Ellipsis] single_Expression
Method PropertyAssignment59Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..Ellipsis(subElement,.addedElement) :1,1:1) {
		if ..SingleExpression(subElement,.addedElement)  {
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

///  property_Name ::= identifier_Name | String_Literal | numeric_Literal | ('[' single_Expression ']')
Method PropertyName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?|?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..IdentifierName(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StringLiteral(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..NumericLiteral(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..PropertyName60Sub(subElement,.addedElement)  {
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

/// '[' single_Expression ']'
/// summary values:[
Method PropertyName60Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?&P
	; first rule summary P
	if '(..isStringSingle("[",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"[")  {
		if ..SingleExpression(subElement,.addedElement)  {
			if ..addPunctuation(subElement,"]")  {
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

///  QuestionMark ::= '?'
/// summary values:?
Method Questionmark(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("?",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"?")  {
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

///  QuestionMarkDot ::= '?.'
/// summary values:?.
Method Questionmarkdot(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("?.",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"?.")  {
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

///  regular_expression_literal ::= 'NEED regex literal'
/// summary values:NEED REGEX LITERAL
Method RegularExpressionLiteral(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("NEED REGEX LITERAL",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"NEED regex literal")  {
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

///  reserved_Word ::= keyword | Null_Literal | Boolean_Literal
Method ReservedWord(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Keyword(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..NullLiteral(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..BooleanLiteral(subElement,.addedElement)  {
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

///  return_Statement ::= "Return" [ expression_Sequence] eos
/// summary values:RETURN
Method ReturnStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?4?&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("RETURN"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"RETURN")  {
		if $S(..ExpressionSequence(subElement,.addedElement) :1,1:1) {
			if ..Eos(subElement,.addedElement)  {
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

///  RightShiftArithmetic ::= '>>'
/// summary values:>>
Method Rightshiftarithmetic(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle(">>",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,">>")  {
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

///  RightShiftArithmeticAssign ::= '>>='
/// summary values:>>=
Method Rightshiftarithmeticassign(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle(">>=",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,">>=")  {
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

///  RightShiftLogical ::= '>>>'
/// summary values:>>>
Method Rightshiftlogical(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle(">>>",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,">>>")  {
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

///  RightShiftLogicalAssign ::= '>>>='
/// summary values:>>>=
Method Rightshiftlogicalassign(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle(">>>=",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,">>>=")  {
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

///  SemiColon ::= ';'
/// summary values:;
Method Semicolon(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle(";",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,";")  {
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

///  setter ::= "set" identifier class_Element_Name
/// summary values:SET
Method Setter(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("SET"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"SET")  {
		if ..Identifier(subElement,.addedElement)  {
			if ..ClassElementName(subElement,.addedElement)  {
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

///  single_expression ::= factor ( dyadicop factor )*
Method SingleExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Factor(subElement,.addedElement)  {
		if ..SingleExpression113RepZero(subElement,.addedElement)  {
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

///  ( dyadicop factor )*
Method SingleExpression113RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..SingleExpression114Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  dyadicop factor
Method SingleExpression114Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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

///  source_Element ::= statement
Method SourceElement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Statement(subElement,.addedElement)  {
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

///  source_Elements ::= source_Element*
Method SourceElements(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (?4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SourceElements51RepZero(subElement,.addedElement)  {
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

///  source_Element*
Method SourceElements51RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..SourceElement(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  statement ::= block | variable_Statement | import_Statement | export_Statement | empty_Statement | class_Declaration | function_Declaration | expression_Statement | if_Statement | iteration_Statement | continue_Statement | break_Statement | return_Statement | yield_Statement | with_Statement | labelled_Statement | switch_Statement | throw_Statement | try_Statement | debugger_Statement
Method Statement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Block(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..VariableStatement(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ImportStatement(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ExportStatement(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..EmptyStatement(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ClassDeclaration(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..FunctionDeclaration(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ExpressionStatement(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..IfStatement(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..IterationStatement(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ContinueStatement(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..BreakStatement(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ReturnStatement(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..YieldStatement(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..WithStatement(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..LabelledStatement(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SwitchStatement(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ThrowStatement(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..TryStatement(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..DebuggerStatement(subElement,.addedElement)  {
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

///  statement_List ::= statement*
Method StatementList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (?4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..StatementList1RepZero(subElement,.addedElement)  {
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

///  statement*
Method StatementList1RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..Statement(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

///  string_literal ::= 'NEED string literal'
/// summary values:NEED STRING LITERAL
Method StringLiteral(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("NEED STRING LITERAL",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"NEED string literal")  {
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

///  switch_Statement ::= "Switch" '(' expression_Sequence ')' case_Block
/// summary values:SWITCH
Method SwitchStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?&P&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("SWITCH"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"SWITCH")  {
		if ..addPunctuation(subElement,"(")  {
			if ..ExpressionSequence(subElement,.addedElement)  {
				if ..addPunctuation(subElement,")")  {
					if ..CaseBlock(subElement,.addedElement)  {
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

///  throw_Statement ::= "Throw" expression_Sequence eos
/// summary values:THROW
Method ThrowStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("THROW"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"THROW")  {
		if ..ExpressionSequence(subElement,.addedElement)  {
			if ..Eos(subElement,.addedElement)  {
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

///  try_Statement ::= "Try" block ((catch_Production [finally_Production]) | finally_Production)
/// summary values:TRY
Method TryStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?1Rule?&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("TRY"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"TRY")  {
		if ..Block(subElement,.addedElement)  {
			if ..TryStatement32Sub(subElement,.addedElement)  {
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

/// (catch_Production [finally_Production]) | finally_Production
Method TryStatement32Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..TryStatement33Sub(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..FinallyProduction(subElement,.addedElement)  {
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

/// catch_Production [finally_Production]
Method TryStatement33Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CatchProduction(subElement,.addedElement)  {
		if $S(..FinallyProduction(subElement,.addedElement) :1,1:1) {
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

///  var_Modifier ::= "Var" | "let" | "Const"
/// summary values:VAR,LET,CONST
Method VarModifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K|K
	if '(..isKeywordInList($lb("VAR","LET","CONST"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"VAR")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"LET")  {
		set done=1 ; or
	} elseif ..addKeyword(subElement,"CONST")  {
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

///  variable_Declaration ::= assignable [('=' single_Expression)]
Method VariableDeclaration(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?4?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Assignable(subElement,.addedElement)  {
		if $S(..VariableDeclaration19Sub(subElement,.addedElement) :1,1:1) {
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

/// '=' single_Expression
/// summary values:=
Method VariableDeclaration19Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle("=",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"=")  {
		if ..SingleExpression(subElement,.addedElement)  {
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

///  variable_Declaration_List ::= var_Modifier variable_Declaration (',' variable_Declaration)*
Method VariableDeclarationList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?1Rule?&(?4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..VarModifier(subElement,.addedElement)  {
		if ..VariableDeclaration(subElement,.addedElement)  {
			if ..VariableDeclarationList17RepZero(subElement,.addedElement)  {
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

///  (',' variable_Declaration)*
Method VariableDeclarationList17RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..VariableDeclarationList18Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=1 /* nothing found is ok in RZ */
	}
	quit ret
}

/// ',' variable_Declaration
/// summary values:,
Method VariableDeclarationList18Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&?1Rule?
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",")  {
		if ..VariableDeclaration(subElement,.addedElement)  {
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

///  variable_Statement ::= variable_Declaration_List eos
Method VariableStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..VariableDeclarationList(subElement,.addedElement)  {
		if ..Eos(subElement,.addedElement)  {
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

///  with_Statement ::= "With" '(' expression_Sequence ')' statement
/// summary values:WITH
Method WithStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&?1Rule?&P&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("WITH"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"WITH")  {
		if ..addPunctuation(subElement,"(")  {
			if ..ExpressionSequence(subElement,.addedElement)  {
				if ..addPunctuation(subElement,")")  {
					if ..Statement(subElement,.addedElement)  {
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

///  yield_Statement ::= "Yield" [ expression_Sequence] eos
/// summary values:YIELD
Method YieldStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&?4?&?1Rule?
	; first rule summary K
	if '(..isKeywordInList($lb("YIELD"),.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"YIELD")  {
		if $S(..ExpressionSequence(subElement,.addedElement) :1,1:1) {
			if ..Eos(subElement,.addedElement)  {
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

Method newElement(Type As %String) As PXW.DEV.BNF.Element
{
	quit ##class(PXW.DEV.BNF.Element).%New(Type)
}

}
