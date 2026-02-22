Class PXW.DEV.BNF.GEN.JS Extends PXW.DEV.BNF.super [ ProcedureBlock ]
{

Parameter KeywordPattern = "1.A";

Parameter Keywords = "A,AS,ASYNC,AWAIT,B,BREAK,C,CASE,CATCH,CLASS,CONST,CONTINUE,D,DEBUGGER,DEFAULT,DELETE,DO,E,ELSE,ENUM,EXPORT,EXTENDS,F,FALSE,FINALLY,FOR,FROM,FUNCTION,GET,IF,IMPLEMENTS,IMPORT,IN,INSTANCEOF,INTERFACE,LET,N,NEW,NULL,OF,PACKAGE,PRIVATE,PROTECTED,PUBLIC,RETURN,SET,STATIC,SUPER,SWITCH,THIS,THROW,TRUE,TRY,TYPEOF,VAR,VOID,WHILE,WITH,YIELD";

///  alias_Name ::= identifier_Name ["As" identifier_Name]
/// summary=C&[K&C]
Method AliasName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&[K&C]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..IdentifierName(.subElement,.addedElement)  {
		if ..AliasName1OptGrp(.subElement,.addedElement)  {
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
/// summary values:AS
/// summary=K&C
Method AliasName1OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&C
	if '(..isKeyword("AS")) { quit 1 /* not found is OK */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"AS")  {
		if ..IdentifierName(.subElement,.addedElement)  {
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

///  And ::= '&&'
/// summary values:&&
/// summary=P
Method And(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("&&",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"&&")  {
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

///  anonymous_Function ::= (["Async"] "Function" ['*'] [ identifier ] '(' [formal_Parameter_List] ')' function_Body) | (["Async"] arrow_Function_Parameters '=>' arrow_Function_Body )
/// summary=([K]&K&[P]&[C]&P&[C]&P&C)|([K]&C&P&C)
Method AnonymousFunction(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ([K]&K&[P]&[C]&P&[C]&P&C)|([K]&C&P&C)
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..AnonymousFunction1Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AnonymousFunction2Sub(.subElement,.addedElement)  {
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

/// ["Async"] "Function" ['*'] [ identifier ] '(' [formal_Parameter_List] ')' function_Body
/// summary=[K]&K&[P]&[C]&P&[C]&P&C
Method AnonymousFunction1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..addKeyword(.subElement,"ASYNC") :1,1:1) {
		if ..addKeyword(.subElement,"FUNCTION")  {
			if $S(..addPunctuation(.subElement,"*") :1,1:1) {
				if $S(..Identifier(.subElement,.addedElement) :1,1:1) {
					if ..addPunctuation(.subElement,"(")  {
						if $S(..FormalParameterList(.subElement,.addedElement) :1,1:1) {
							if ..addPunctuation(.subElement,")")  {
								if ..FunctionBody(.subElement,.addedElement)  {
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

/// ["Async"] arrow_Function_Parameters '=>' arrow_Function_Body
/// summary=[K]&C&P&C
Method AnonymousFunction2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary [K]&C&P&C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..addKeyword(.subElement,"ASYNC") :1,1:1) {
		if ..ArrowFunctionParameters(.subElement,.addedElement)  {
			if ..addPunctuation(.subElement,"=>")  {
				if ..ArrowFunctionBody(.subElement,.addedElement)  {
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

///  argument ::= [Ellipsis] (single_Expression | identifier)
/// summary=[C]&(C|C)
Method Argument(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary [C]&(C|C)
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..Ellipsis(.subElement,.addedElement) :1,1:1) {
		if ..Argument1Sub(.subElement,.addedElement)  {
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

/// single_Expression | identifier
/// summary=C|C
Method Argument1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..SingleExpression(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Identifier(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

///  arguments ::= '(' [argument (',' argument)*] ')'
/// summary values:(
/// summary=P&[C&(?4punctuation:4?)*]&P
Method Arguments(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&[C&(?4punctuation:4?)*]&P
	if '..isPunctuation("(",1) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if ..Arguments1OptGrp(.subElement,.addedElement)  {
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
/// summary=C&(?4punctuation:4?)*
Method Arguments1OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&(?4punctuation:4?)*
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Argument(.subElement,.addedElement)  {
		if ..Arguments2RepZero(.subElement,.addedElement)  {
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

///  (',' argument)*
Method Arguments2RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..Arguments3Sub(.subElement,.addedElement)  {
		set done=1
	}
	set ok=1
	quit ok
}

/// ',' argument
/// summary values:,
/// summary=P&C
Method Arguments3Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation(",",1) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..Argument(.subElement,.addedElement)  {
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

///  array_Element ::= [Ellipsis] single_Expression
/// summary=[C]&C
Method ArrayElement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary [C]&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..Ellipsis(.subElement,.addedElement) :1,1:1) {
		if ..SingleExpression(.subElement,.addedElement)  {
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

///  array_Literal ::= '[' element_List ']'
/// summary values:[
/// summary=P&C&P
Method ArrayLiteral(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&P
	if '..isPunctuation("[",1) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"[")  {
		if ..ElementList(.subElement,.addedElement)  {
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

///  ARROW ::= '=>'
/// summary values:=>
/// summary=P
Method Arrow(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("=>",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"=>")  {
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

///  arrow_Function_Body ::= single_Expression | function_Body
/// summary=C|C
Method ArrowFunctionBody(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SingleExpression(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..FunctionBody(.subElement,.addedElement)  {
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

///  arrow_Function_Parameters ::= identifier | ('(' [formal_Parameter_List] ')')
/// summary=C|(P&[C]&P)
Method ArrowFunctionParameters(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|(P&[C]&P)
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Identifier(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ArrowFunctionParameters1Sub(.subElement,.addedElement)  {
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

/// '(' [formal_Parameter_List] ')'
/// summary values:(
/// summary=P&[C]&P
Method ArrowFunctionParameters1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&[C]&P
	if '..isPunctuation("(",1) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if $S(..FormalParameterList(.subElement,.addedElement) :1,1:1) {
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

///  Assign ::= '='
/// summary values:=
/// summary=P
Method Assign(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("=",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"=")  {
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

///  assignable ::= identifier | array_Literal | object_Literal
/// summary=C|C|C
Method Assignable(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Identifier(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ArrayLiteral(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ObjectLiteral(.subElement,.addedElement)  {
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

///  assignment_Operator ::= '*=' | '/=' | '%=' | '+=' | '-=' | '<<=' | '>>=' | '>>>=' | '&=' | '^=' | '|=' | '**=' | '??='
/// summary values:*=,/=,%=,+=,-=,<<=,>>=,>>>=,&=,^=,|=,**=,??=
/// summary=P|P|P|P|P|P|P|P|P|P|P|P|P
Method AssignmentOperator(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|P|P|P|P|P|P|P|P|P|P|P|P
	if '..isPunctuation(">>>=",4),'..isPunctuationInList($lb("<<=",">>=","**=","??="),3),'..isPunctuationInList($lb("*=","/=","%=","+=","-=","&=","^=","|="),2) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"*=")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"/=")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"%=")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"+=")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"-=")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"<<=")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,">>=")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,">>>=")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"&=")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"^=")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"|=")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"**=")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"??=")  {
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

///  Big_Binary_Integer_Literal::= ('0b' | '0B') ('0' | '1' )* 'n'
/// summary values:0B,0B
/// summary=(P|P)&(?4punctuation:4?)*&K
Method BigBinaryIntegerLiteral(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (P|P)&(?4punctuation:4?)*&K
	if '..isPunctuationInList($lb("0B","0B"),2) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..BigBinaryIntegerLiteral1Sub(.subElement,.addedElement)  {
		if ..BigBinaryIntegerLiteral2RepZero(.subElement,.addedElement)  {
			if ..addKeyword(.subElement,"N")  {
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

/// '0b' | '0B'
/// summary=P|P
Method BigBinaryIntegerLiteral1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	if ..addPunctuation(.subElement,"0b")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"0B")  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

///  ('0' | '1' )*
Method BigBinaryIntegerLiteral2RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..BigBinaryIntegerLiteral3Sub(.subElement,.addedElement)  {
		set done=1
	}
	set ok=1
	quit ok
}

/// '0' | '1'
/// summary values:0,1
/// summary=P|P
Method BigBinaryIntegerLiteral3Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P|P
	if '..isPunctuationInList($lb("0","1"),1) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addPunctuation(.subElement,"0")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"1")  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

///  Big_Decimal_Integer_Literal ::= decimal_integer_literal 'n'
/// summary=C&K
Method BigDecimalIntegerLiteral(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&K
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..DecimalIntegerLiteral(.subElement,.addedElement)  {
		if ..addKeyword(.subElement,"N")  {
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

///  Big_Hex_Integer_Literal ::= ('0x' | '0X') ('0' | '1' | '2' | '3' | '4' | '5' | '6' | '7' | '8' | '9' | 'A' | 'B' | 'C' | 'D' | 'E' | 'F' )* 'n'
/// summary values:0X,0X
/// summary=(P|P)&(?4punctuation:4?)*&K
Method BigHexIntegerLiteral(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (P|P)&(?4punctuation:4?)*&K
	if '..isPunctuationInList($lb("0X","0X"),2) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..BigHexIntegerLiteral1Sub(.subElement,.addedElement)  {
		if ..BigHexIntegerLiteral2RepZero(.subElement,.addedElement)  {
			if ..addKeyword(.subElement,"N")  {
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

/// '0x' | '0X'
/// summary=P|P
Method BigHexIntegerLiteral1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	if ..addPunctuation(.subElement,"0x")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"0X")  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

///  ('0' | '1' | '2' | '3' | '4' | '5' | '6' | '7' | '8' | '9' | 'A' | 'B' | 'C' | 'D' | 'E' | 'F' )*
Method BigHexIntegerLiteral2RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..BigHexIntegerLiteral3Sub(.subElement,.addedElement)  {
		set done=1
	}
	set ok=1
	quit ok
}

/// '0' | '1' | '2' | '3' | '4' | '5' | '6' | '7' | '8' | '9' | 'A' | 'B' | 'C' | 'D' | 'E' | 'F'
/// summary=P|P|P|P|P|P|P|P|P|P|K|K|K|K|K|K
Method BigHexIntegerLiteral3Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P|P|P|P|P|P|P|P|P|P|K|K|K|K|K|K
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"0")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"1")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"2")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"3")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"4")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"5")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"6")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"7")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"8")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"9")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"A")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"B")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"C")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"D")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"E")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"F")  {
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

///  Big_Octal_Integer_Literal ::= ('0o' | '0O') ('0' | '1' | '2' | '3' | '4' | '5' | '6' | '7' )* 'n'
/// summary values:0O,0O
/// summary=(P|P)&(?4punctuation:4?)*&K
Method BigOctalIntegerLiteral(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (P|P)&(?4punctuation:4?)*&K
	if '..isPunctuationInList($lb("0O","0O"),2) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..BigOctalIntegerLiteral1Sub(.subElement,.addedElement)  {
		if ..BigOctalIntegerLiteral2RepZero(.subElement,.addedElement)  {
			if ..addKeyword(.subElement,"N")  {
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

/// '0o' | '0O'
/// summary=P|P
Method BigOctalIntegerLiteral1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	if ..addPunctuation(.subElement,"0o")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"0O")  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

///  ('0' | '1' | '2' | '3' | '4' | '5' | '6' | '7' )*
Method BigOctalIntegerLiteral2RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..BigOctalIntegerLiteral3Sub(.subElement,.addedElement)  {
		set done=1
	}
	set ok=1
	quit ok
}

/// '0' | '1' | '2' | '3' | '4' | '5' | '6' | '7'
/// summary values:0,1,2,3,4,5,6,7
/// summary=P|P|P|P|P|P|P|P
Method BigOctalIntegerLiteral3Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P|P|P|P|P|P|P|P
	if '..isPunctuationInList($lb("0","1","2","3","4","5","6","7"),1) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addPunctuation(.subElement,"0")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"1")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"2")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"3")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"4")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"5")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"6")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"7")  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

///  bigint_Literal ::= Big_Decimal_Integer_Literal | Big_Hex_Integer_Literal | Big_Octal_Integer_Literal | Big_Binary_Integer_Literal
/// summary=C|C|C|C
Method BigintLiteral(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C|C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..BigDecimalIntegerLiteral(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..BigHexIntegerLiteral(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..BigOctalIntegerLiteral(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..BigBinaryIntegerLiteral(.subElement,.addedElement)  {
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

///  Binary_Integer_Literal::= ('0b' | '0B') ('0' | '1' )*
/// summary values:0B,0B
/// summary=(P|P)&(?4punctuation:4?)*
Method BinaryIntegerLiteral(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (P|P)&(?4punctuation:4?)*
	if '..isPunctuationInList($lb("0B","0B"),2) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..BinaryIntegerLiteral1Sub(.subElement,.addedElement)  {
		if ..BinaryIntegerLiteral2RepZero(.subElement,.addedElement)  {
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

/// '0b' | '0B'
/// summary=P|P
Method BinaryIntegerLiteral1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	if ..addPunctuation(.subElement,"0b")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"0B")  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

///  ('0' | '1' )*
Method BinaryIntegerLiteral2RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..BinaryIntegerLiteral3Sub(.subElement,.addedElement)  {
		set done=1
	}
	set ok=1
	quit ok
}

/// '0' | '1'
/// summary values:0,1
/// summary=P|P
Method BinaryIntegerLiteral3Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P|P
	if '..isPunctuationInList($lb("0","1"),1) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addPunctuation(.subElement,"0")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"1")  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

///  BitAnd ::= '&'
/// summary values:&
/// summary=P
Method Bitand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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

///  BitAndAssign ::= '&='
/// summary values:&=
/// summary=P
Method Bitandassign(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("&=",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"&=")  {
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

///  BitNot ::= '~'
/// summary values:~
/// summary=P
Method Bitnot(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("~",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"~")  {
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

///  BitOr ::= '|'
/// summary values:|
/// summary=P
Method Bitor(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("|",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"|")  {
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

///  BitOrAssign ::= '|='
/// summary values:|=
/// summary=P
Method Bitorassign(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("|=",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"|=")  {
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

///  BitXOr ::= '^'
/// summary values:^
/// summary=P
Method Bitxor(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("^",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"^")  {
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

///  BitXorAssign ::= '^='
/// summary values:^=
/// summary=P
Method Bitxorassign(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("^=",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"^=")  {
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

///  block ::= '{' [statement_List] '}'
/// summary values:{
/// summary=P&[C]&P
Method Block(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&[C]&P
	if '..isPunctuation("{",1) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"{")  {
		if $S(..StatementList(.subElement,.addedElement) :1,1:1) {
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

///  boolean_literal ::= 'true' | 'false'
/// summary values:TRUE,FALSE
/// summary=K|K
Method BooleanLiteral(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K
	if '(..isKeywordInList($lb("TRUE","FALSE"))) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"TRUE")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"FALSE")  {
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

///  break_Statement ::= "Break" [is_not_Line_Terminator identifier] eos
/// summary values:BREAK
/// summary=K&[C&C]&C
Method BreakStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&[C&C]&C
	if '(..isKeyword("BREAK")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"BREAK")  {
		if ..BreakStatement1OptGrp(.subElement,.addedElement)  {
			if ..Eos(.subElement,.addedElement)  {
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
/// summary=C&C
Method BreakStatement1OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..IsNotLineTerminator(.subElement,.addedElement)  {
		if ..Identifier(.subElement,.addedElement)  {
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

///  case_Block ::= '{' [case_Clauses] [default_Clause [case_Clauses]] '}'
/// summary values:{
/// summary=P&[C]&[C&[C]]&P
Method CaseBlock(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&[C]&[C&[C]]&P
	if '..isPunctuation("{",1) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"{")  {
		if $S(..CaseClauses(.subElement,.addedElement) :1,1:1) {
			if ..CaseBlock1OptGrp(.subElement,.addedElement)  {
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

/// 
/// summary=C&[C]
Method CaseBlock1OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&[C]
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..DefaultClause(.subElement,.addedElement)  {
		if $S(..CaseClauses(.subElement,.addedElement) :1,1:1) {
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

///  case_Clause ::= "Case" expression_Sequence ':' ( !'case' statement )*
/// summary values:CASE
/// summary=K&C&P&(?4punctuation:4?)*
Method CaseClause(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C&P&(?4punctuation:4?)*
	if '(..isKeyword("CASE")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"CASE")  {
		if ..ExpressionSequence(.subElement,.addedElement)  {
			if ..addPunctuation(.subElement,":")  {
				if ..CaseClause1RepZero(.subElement,.addedElement)  {
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

///  ( !'case' statement )*
Method CaseClause1RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..CaseClause2Sub(.subElement,.addedElement)  {
		set done=1
	}
	set ok=1
	quit ok
}

///  !'case' statement
/// summary=?4NotRule4?&C
Method CaseClause2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4NotRule4?&C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if '..addKeyword(.subElement,"CASE")  {
		if ..Statement(.subElement,.addedElement)  {
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

///  case_Clauses ::= case_Clause*
/// summary=(?4Call:4?)*
Method CaseClauses(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (?4Call:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CaseClauses1RepZero(.subElement,.addedElement)  {
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

///  case_Clause*
Method CaseClauses1RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4Call:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..CaseClause(.subElement,.addedElement)  {
		set done=1
	}
	set ok=1
	quit ok
}

///  catch_Production ::= "Catch" ['(' assignable? ')'] block
/// summary values:CATCH
/// summary=K&[P&?4OptionalSingle4?&P]&C
Method CatchProduction(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&[P&?4OptionalSingle4?&P]&C
	if '(..isKeyword("CATCH")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"CATCH")  {
		if ..CatchProduction1OptGrp(.subElement,.addedElement)  {
			if ..Block(.subElement,.addedElement)  {
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
/// summary=P&?4OptionalSingle4?&P
Method CatchProduction1OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&?4OptionalSingle4?&P
	if '..isPunctuation("(",1) { quit 1 /* not found is OK */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if $s(..Assignable(.subElement,.addedElement) :1,1:1)  {
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

///  class_Declaration ::= "Class" identifier class_Tail
/// summary values:CLASS
/// summary=K&C&C
Method ClassDeclaration(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C&C
	if '(..isKeyword("CLASS")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"CLASS")  {
		if ..Identifier(.subElement,.addedElement)  {
			if ..ClassTail(.subElement,.addedElement)  {
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

///  class_Element ::= ([["Static"] identifier] method_Definition) | ([["Static"] identifier] field_Definition) | ([["Static"] identifier] block) | empty_Statement
/// summary=([[K]&C]&C)|([[K]&C]&C)|([[K]&C]&C)|C
Method ClassElement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ([[K]&C]&C)|([[K]&C]&C)|([[K]&C]&C)|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ClassElement1Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ClassElement3Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ClassElement5Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..EmptyStatement(.subElement,.addedElement)  {
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

/// [["Static"] identifier] method_Definition
/// summary=[[K]&C]&C
Method ClassElement1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ClassElement2OptGrp(.subElement,.addedElement)  {
		if ..MethodDefinition(.subElement,.addedElement)  {
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
/// summary=[K]&C
Method ClassElement2OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary [K]&C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..addKeyword(.subElement,"STATIC") :1,1:1) {
		if ..Identifier(.subElement,.addedElement)  {
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

/// [["Static"] identifier] field_Definition
/// summary=[[K]&C]&C
Method ClassElement3Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary [[K]&C]&C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ClassElement4OptGrp(.subElement,.addedElement)  {
		if ..FieldDefinition(.subElement,.addedElement)  {
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
/// summary=[K]&C
Method ClassElement4OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary [K]&C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..addKeyword(.subElement,"STATIC") :1,1:1) {
		if ..Identifier(.subElement,.addedElement)  {
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

/// [["Static"] identifier] block
/// summary=[[K]&C]&C
Method ClassElement5Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary [[K]&C]&C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ClassElement6OptGrp(.subElement,.addedElement)  {
		if ..Block(.subElement,.addedElement)  {
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
/// summary=[K]&C
Method ClassElement6OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary [K]&C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..addKeyword(.subElement,"STATIC") :1,1:1) {
		if ..Identifier(.subElement,.addedElement)  {
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

///  class_Element_Name ::= property_Name | private_Identifier
/// summary=C|C
Method ClassElementName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..PropertyName(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..PrivateIdentifier(.subElement,.addedElement)  {
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

///  class_Tail ::= ["Extends" single_Expression] '{' class_Element* '}'
/// summary=[K&C]&P&(?4Call:4?)*&P
Method ClassTail(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary [K&C]&P&(?4Call:4?)*&P
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ClassTail1OptGrp(.subElement,.addedElement)  {
		if ..addPunctuation(.subElement,"{")  {
			if ..ClassTail2RepZero(.subElement,.addedElement)  {
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

/// 
/// summary values:EXTENDS
/// summary=K&C
Method ClassTail1OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&C
	if '(..isKeyword("EXTENDS")) { quit 1 /* not found is OK */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"EXTENDS")  {
		if ..SingleExpression(.subElement,.addedElement)  {
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

///  class_Element*
Method ClassTail2RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4Call:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ClassElement(.subElement,.addedElement)  {
		set done=1
	}
	set ok=1
	quit ok
}

///  CloseBrace ::= '}'
/// summary values:}
/// summary=P
Method Closebrace(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("}",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"}")  {
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

///  CloseBracket ::=']'
/// summary values:]
/// summary=P
Method Closebracket(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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

///  CloseParen ::= ')'
/// summary values:)
/// summary=P
Method Closeparen(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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

///  Colon ::= ':'
/// summary values::
/// summary=P
Method Colon(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle(":",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,":")  {
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

///  Comma ::= ','
/// summary values:,
/// summary=P
Method Comma(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
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

///  continue_Statement ::= "Continue" [ identifier] eos
/// summary values:CONTINUE
/// summary=K&[C]&C
Method ContinueStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&[C]&C
	if '(..isKeyword("CONTINUE")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"CONTINUE")  {
		if $S(..Identifier(.subElement,.addedElement) :1,1:1) {
			if ..Eos(.subElement,.addedElement)  {
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

///  cos_expression ::= cos_expression_compiletime | cos_expression_runtime | cos_expression_other | cos_expression_server | cos_expression_call
/// summary=C|C|C|C|C
Method CosExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C|C|C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CosExpressionCompiletime(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CosExpressionRuntime(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CosExpressionOther(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CosExpressionServer(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CosExpressionCall(.subElement,.addedElement)  {
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

///  cos_expression_body ::= 'NEEDS COS EXPRESSION BODY'
/// summary values:NEEDS COS EXPRESSION BODY
/// summary=P
Method CosExpressionBody(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("NEEDS COS EXPRESSION BODY",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"NEEDS COS EXPRESSION BODY")  {
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

///  cos_expression_call ::= '#call(' cos_method_reference '(' [ expression_sequence ] ')' ')#'
/// summary values:#CALL(
/// summary=P&C&P&[C]&P&P
Method CosExpressionCall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&P&[C]&P&P
	if '..isPunctuation("#CALL(",6) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"#call(")  {
		if ..CosMethodReference(.subElement,.addedElement)  {
			if ..addPunctuation(.subElement,"(")  {
				if $S(..ExpressionSequence(.subElement,.addedElement) :1,1:1) {
					if ..addPunctuation(.subElement,")")  {
						if ..addPunctuation(.subElement,")#")  {
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

///  cos_expression_compiletime ::= '##(' cos_expression_body ')##'
/// summary values:##(
/// summary=P&C&P
Method CosExpressionCompiletime(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&P
	if '..isPunctuation("##(",3) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"##(")  {
		if ..CosExpressionBody(.subElement,.addedElement)  {
			if ..addPunctuation(.subElement,")##")  {
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

///  cos_expression_other ::= '<%=' cos_expression_body '%>'
/// summary values:<%=
/// summary=P&C&P
Method CosExpressionOther(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&P
	if '..isPunctuation("<%=",3) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"<%=")  {
		if ..CosExpressionBody(.subElement,.addedElement)  {
			if ..addPunctuation(.subElement,"%>")  {
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

///  cos_expression_runtime ::= '#(' cos_expression_body ')#'
/// summary values:#(
/// summary=P&C&P
Method CosExpressionRuntime(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&P
	if '..isPunctuation("#(",2) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"#(")  {
		if ..CosExpressionBody(.subElement,.addedElement)  {
			if ..addPunctuation(.subElement,")#")  {
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

///  cos_expression_server ::= '#server(' cos_method_reference '(' [ expression_sequence ] ')' ')#'
/// summary values:#SERVER(
/// summary=P&C&P&[C]&P&P
Method CosExpressionServer(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&P&[C]&P&P
	if '..isPunctuation("#SERVER(",8) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"#server(")  {
		if ..CosMethodReference(.subElement,.addedElement)  {
			if ..addPunctuation(.subElement,"(")  {
				if $S(..ExpressionSequence(.subElement,.addedElement) :1,1:1) {
					if ..addPunctuation(.subElement,")")  {
						if ..addPunctuation(.subElement,")#")  {
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

///  cos_gt_lt ::= '&gt;' | '&lt;'
/// summary values:&GT;,&LT;
/// summary=P|P
Method CosGtLt(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|P
	if '..isPunctuationInList($lb("&GT;","&LT;"),4) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"&gt;")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"&lt;")  {
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

///  cos_method_reference ::= 'NEEDS class_reference.method OR ..method'
/// summary values:NEEDS CLASS_REFERENCE.METHOD OR ..METHOD
/// summary=P
Method CosMethodReference(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("NEEDS CLASS_REFERENCE.METHOD OR ..METHOD",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"NEEDS class_reference.method OR ..method")  {
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

///  debugger_Statement ::= "Debugger" eos
/// summary values:DEBUGGER
/// summary=K&C
Method DebuggerStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C
	if '(..isKeyword("DEBUGGER")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"DEBUGGER")  {
		if ..Eos(.subElement,.addedElement)  {
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

///  decimal_integer_literal ::= 'NEED decimal_integer_literal'
/// summary values:NEED DECIMAL_INTEGER_LITERAL
/// summary=P
Method DecimalIntegerLiteral(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("NEED DECIMAL_INTEGER_LITERAL",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"NEED decimal_integer_literal")  {
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

///  Decimal_literal ::= 'NEED decimal_literal'
/// summary values:NEED DECIMAL_LITERAL
/// summary=P
Method DecimalLiteral(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("NEED DECIMAL_LITERAL",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"NEED decimal_literal")  {
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

///  declaration ::= variable_Statement | class_Declaration | function_Declaration
/// summary=C|C|C
Method Declaration(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..VariableStatement(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ClassDeclaration(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..FunctionDeclaration(.subElement,.addedElement)  {
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

///  default_Clause ::= "Default" ':' ( !'case' statement )*
/// summary values:DEFAULT
/// summary=K&P&(?4punctuation:4?)*
Method DefaultClause(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&(?4punctuation:4?)*
	if '(..isKeyword("DEFAULT")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"DEFAULT")  {
		if ..addPunctuation(.subElement,":")  {
			if ..DefaultClause1RepZero(.subElement,.addedElement)  {
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

///  ( !'case' statement )*
Method DefaultClause1RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..DefaultClause2Sub(.subElement,.addedElement)  {
		set done=1
	}
	set ok=1
	quit ok
}

///  !'case' statement
/// summary=?4NotRule4?&C
Method DefaultClause2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4NotRule4?&C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if '..addKeyword(.subElement,"CASE")  {
		if ..Statement(.subElement,.addedElement)  {
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

///  Divide ::= '/'
/// summary values:/
/// summary=P
Method Divide(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("/",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"/")  {
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

///  DivideAssign ::= '/='
/// summary values:/=
/// summary=P
Method Divideassign(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("/=",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"/=")  {
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

///  Dot ::= '.'
/// summary values:.
/// summary=P
Method Dot(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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
		set ok=0
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  dyadicop ::= ('?' single_expression ':') | '===' | '>>>' | '!==' | cos_gt_lt | '**' |'??' | '<<' | '>>' | '<=' | '>=' | '==' | '!=' | '&&' | '||' | '+=' | '-=' | '*=' | '*' | '/' | '%' | '+' | '-' | '&' | '^' | '|' | '=' | '<' | ('>' is_not_Line_Terminator) | cos_expression_runtime | "InstanceOf"
/// summary=(P&C&P)|P|P|P|C|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|(P&C)|C|K
Method Dyadicop(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (P&C&P)|P|P|P|C|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|P|(P&C)|C|K
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Dyadicop1Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"===")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,">>>")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"!==")  {
		set done=1 ; or
	} elseif ..CosGtLt(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"**")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"??")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"<<")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,">>")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"<=")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,">=")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"==")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"!=")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"&&")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"||")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"+=")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"-=")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"*=")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"*")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"/")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"%")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"+")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"-")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"&")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"^")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"|")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"=")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"<")  {
		set done=1 ; or
	} elseif ..Dyadicop2Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CosExpressionRuntime(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"INSTANCEOF")  {
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

/// '?' single_expression ':'
/// summary=P&C&P
Method Dyadicop1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"?")  {
		if ..SingleExpression(.subElement,.addedElement)  {
			if ..addPunctuation(.subElement,":")  {
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

/// '>' is_not_Line_Terminator
/// summary values:>
/// summary=P&C
Method Dyadicop2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation(">",1) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,">")  {
		if ..IsNotLineTerminator(.subElement,.addedElement)  {
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

///  element_List ::= [array_Element] (',' [array_Element])*
/// summary=[C]&(?4punctuation:4?)*
Method ElementList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary [C]&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..ArrayElement(.subElement,.addedElement) :1,1:1) {
		if ..ElementList1RepZero(.subElement,.addedElement)  {
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

///  (',' [array_Element])*
Method ElementList1RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ElementList2Sub(.subElement,.addedElement)  {
		set done=1
	}
	set ok=1
	quit ok
}

/// ',' [array_Element]
/// summary values:,
/// summary=P&[C]
Method ElementList2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&[C]
	if '..isPunctuation(",",1) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if $S(..ArrayElement(.subElement,.addedElement) :1,1:1) {
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

///  Ellipsis ::= '...'
/// summary values:...
/// summary=P
Method Ellipsis(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("...",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"...")  {
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

///  empty_Statement ::= ';'
/// summary values:;
/// summary=P
Method EmptyStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle(";",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,";")  {
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

///  end_of_file ::= 'NEED end_of_file'
/// summary values:NEED END_OF_FILE
/// summary=P
Method EndOfFile(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("NEED END_OF_FILE",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"NEED end_of_file")  {
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

///  eos ::= SemiColon | end_of_file
/// summary=C|C
Method Eos(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Semicolon(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..EndOfFile(.subElement,.addedElement)  {
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

///  Equals ::= '=='
/// summary values:==
/// summary=P
Method Equals(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("==",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"==")  {
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

///  export_Alias_name ::= module_Export_Name [("As" module_Export_Name)]
/// summary=C&[(K&C)]
Method ExportAliasName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&[(K&C)]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ModuleExportName(.subElement,.addedElement)  {
		if $S(..ExportAliasName1Sub(.subElement,.addedElement) :1,1:1) {
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

/// "As" module_Export_Name
/// summary values:AS
/// summary=K&C
Method ExportAliasName1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&C
	if '(..isKeyword("AS")) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"AS")  {
		if ..ModuleExportName(.subElement,.addedElement)  {
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

///  export_From_Block ::= (import_Namespace import_From eos) | (export_Module_Items [import_From] eos)
/// summary=(C&C&C)|(C&[C]&C)
Method ExportFromBlock(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (C&C&C)|(C&[C]&C)
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ExportFromBlock1Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ExportFromBlock2Sub(.subElement,.addedElement)  {
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

/// import_Namespace import_From eos
/// summary=C&C&C
Method ExportFromBlock1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ImportNamespace(.subElement,.addedElement)  {
		if ..ImportFrom(.subElement,.addedElement)  {
			if ..Eos(.subElement,.addedElement)  {
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

/// export_Module_Items [import_From] eos
/// summary=C&[C]&C
Method ExportFromBlock2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&[C]&C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ExportModuleItems(.subElement,.addedElement)  {
		if $S(..ImportFrom(.subElement,.addedElement) :1,1:1) {
			if ..Eos(.subElement,.addedElement)  {
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

///  export_Module_Items ::= '{' export_Alias_Name (',' export_Alias_Name )* '}'
/// summary values:{
/// summary=P&C&(?4punctuation:4?)*&P
Method ExportModuleItems(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&(?4punctuation:4?)*&P
	if '..isPunctuation("{",1) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"{")  {
		if ..ExportAliasName(.subElement,.addedElement)  {
			if ..ExportModuleItems1RepZero(.subElement,.addedElement)  {
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

///  (',' export_Alias_Name )*
Method ExportModuleItems1RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ExportModuleItems2Sub(.subElement,.addedElement)  {
		set done=1
	}
	set ok=1
	quit ok
}

/// ',' export_Alias_Name
/// summary values:,
/// summary=P&C
Method ExportModuleItems2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation(",",1) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..ExportAliasName(.subElement,.addedElement)  {
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

///  export_Statement ::= ("Export" ["Default"] (export_From_Block | declaration) eos) | ("Export" "Default" single_Expression eos)
/// summary=(K&[K]&(C|C)&C)|(K&K&C&C)
Method ExportStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K&[K]&(C|C)&C)|(K&K&C&C)
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ExportStatement1Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ExportStatement3Sub(.subElement,.addedElement)  {
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

/// "Export" ["Default"] (export_From_Block | declaration) eos
/// summary=K&[K]&(C|C)&C
Method ExportStatement1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"EXPORT")  {
		if $S(..addKeyword(.subElement,"DEFAULT") :1,1:1) {
			if ..ExportStatement2Sub(.subElement,.addedElement)  {
				if ..Eos(.subElement,.addedElement)  {
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

/// export_From_Block | declaration
/// summary=C|C
Method ExportStatement2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..ExportFromBlock(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Declaration(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

/// "Export" "Default" single_Expression eos
/// summary values:EXPORT
/// summary=K&K&C&C
Method ExportStatement3Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&K&C&C
	if '(..isKeyword("EXPORT")) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"EXPORT")  {
		if ..addKeyword(.subElement,"DEFAULT")  {
			if ..SingleExpression(.subElement,.addedElement)  {
				if ..Eos(.subElement,.addedElement)  {
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

///  expression_Sequence ::= single_Expression (',' single_Expression)*
/// summary=C&(?4punctuation:4?)*
Method ExpressionSequence(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SingleExpression(.subElement,.addedElement)  {
		if ..ExpressionSequence1RepZero(.subElement,.addedElement)  {
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

///  (',' single_Expression)*
Method ExpressionSequence1RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ExpressionSequence2Sub(.subElement,.addedElement)  {
		set done=1
	}
	set ok=1
	quit ok
}

/// ',' single_Expression
/// summary values:,
/// summary=P&C
Method ExpressionSequence2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation(",",1) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..SingleExpression(.subElement,.addedElement)  {
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

///  expression_Statement ::= expression_Sequence eos
/// summary=C&C
Method ExpressionStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ExpressionSequence(.subElement,.addedElement)  {
		if ..Eos(.subElement,.addedElement)  {
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

///  factor ::= ( monadicop )* primary [ '++' | '--']
/// summary=(?4punctuation:4?)*&C&[P|P]
Method Factor(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (?4punctuation:4?)*&C&[P|P]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Factor1RepZero(.subElement,.addedElement)  {
		if ..Primary(.subElement,.addedElement)  {
			if ..Factor3OptGrp(.subElement,.addedElement)  {
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

///  ( monadicop )*
Method Factor1RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..Factor2Sub(.subElement,.addedElement)  {
		set done=1
	}
	set ok=1
	quit ok
}

///  monadicop
/// summary=C
Method Factor2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C
	set subElement=ParentElement
	set done=0 ; method start
	if ..Monadicop(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

/// 
/// summary values:++,--
/// summary=P|P
Method Factor3OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P|P
	if '..isPunctuationInList($lb("++","--"),2) { quit 1 /* not found is OK */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addPunctuation(.subElement,"++")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"--")  {
		set done=1 ; end compileRules
	}

	set ok=1
	quit ok
}

///  field_Definition ::= class_Element_Name [initializer]
/// summary=C&[C]
Method FieldDefinition(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&[C]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ClassElementName(.subElement,.addedElement)  {
		if $S(..Initializer(.subElement,.addedElement) :1,1:1) {
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

///  finally_Production ::= "Finally" block
/// summary values:FINALLY
/// summary=K&C
Method FinallyProduction(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C
	if '(..isKeyword("FINALLY")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"FINALLY")  {
		if ..Block(.subElement,.addedElement)  {
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

///  formal_Parameter_Arg ::= assignable ['=' single_Expression]
/// summary=C&[P&C]
Method FormalParameterArg(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&[P&C]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Assignable(.subElement,.addedElement)  {
		if ..FormalParameterArg1OptGrp(.subElement,.addedElement)  {
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
/// summary values:=
/// summary=P&C
Method FormalParameterArg1OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation("=",1) { quit 1 /* not found is OK */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"=")  {
		if ..SingleExpression(.subElement,.addedElement)  {
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

///  formal_Parameter_List ::= (formal_Parameter_Arg (',' formal_Parameter_Arg)* [',' last_Formal_Parameter_Arg]) | last_Formal_Parameter_Arg
/// summary=(C&(?4punctuation:4?)*&[P&C])|C
Method FormalParameterList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (C&(?4punctuation:4?)*&[P&C])|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..FormalParameterList1Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..LastFormalParameterArg(.subElement,.addedElement)  {
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

/// formal_Parameter_Arg (',' formal_Parameter_Arg)* [',' last_Formal_Parameter_Arg]
/// summary=C&(?4punctuation:4?)*&[P&C]
Method FormalParameterList1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..FormalParameterArg(.subElement,.addedElement)  {
		if ..FormalParameterList2RepZero(.subElement,.addedElement)  {
			if ..FormalParameterList4OptGrp(.subElement,.addedElement)  {
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

///  (',' formal_Parameter_Arg)*
Method FormalParameterList2RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..FormalParameterList3Sub(.subElement,.addedElement)  {
		set done=1
	}
	set ok=1
	quit ok
}

/// ',' formal_Parameter_Arg
/// summary values:,
/// summary=P&C
Method FormalParameterList3Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation(",",1) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..FormalParameterArg(.subElement,.addedElement)  {
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
/// summary values:,
/// summary=P&C
Method FormalParameterList4OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation(",",1) { quit 1 /* not found is OK */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..LastFormalParameterArg(.subElement,.addedElement)  {
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

///  function ::= identifier ['[' single_expression ']'] '(' [expression_sequence] ')'
/// summary=C&[P&C&P]&P&[C]&P
Method Function(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&[P&C&P]&P&[C]&P
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Identifier(.subElement,.addedElement)  {
		if ..Function1OptGrp(.subElement,.addedElement)  {
			if ..addPunctuation(.subElement,"(")  {
				if $S(..ExpressionSequence(.subElement,.addedElement) :1,1:1) {
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

/// 
/// summary values:[
/// summary=P&C&P
Method Function1OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&P
	if '..isPunctuation("[",1) { quit 1 /* not found is OK */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"[")  {
		if ..SingleExpression(.subElement,.addedElement)  {
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
		set ok=1 /* failure rollsback but returns OK */
	}
	quit ok
}

///  function_Body ::= '{' [source_Elements] '}'
/// summary values:{
/// summary=P&[C]&P
Method FunctionBody(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&[C]&P
	if '..isPunctuation("{",1) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"{")  {
		if $S(..SourceElements(.subElement,.addedElement) :1,1:1) {
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

///  function_Declaration ::= ["Async"] "Function" ['*'] identifier '(' [formal_Parameter_List] ')' function_Body
/// summary=[K]&K&[P]&C&P&[C]&P&C
Method FunctionDeclaration(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary [K]&K&[P]&C&P&[C]&P&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..addKeyword(.subElement,"ASYNC") :1,1:1) {
		if ..addKeyword(.subElement,"FUNCTION")  {
			if $S(..addPunctuation(.subElement,"*") :1,1:1) {
				if ..Identifier(.subElement,.addedElement)  {
					if ..addPunctuation(.subElement,"(")  {
						if $S(..FormalParameterList(.subElement,.addedElement) :1,1:1) {
							if ..addPunctuation(.subElement,")")  {
								if ..FunctionBody(.subElement,.addedElement)  {
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

///  getter ::= "get" identifier class_Element_Name
/// summary values:GET
/// summary=K&C&C
Method Getter(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C&C
	if '(..isKeyword("GET")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"GET")  {
		if ..Identifier(.subElement,.addedElement)  {
			if ..ClassElementName(.subElement,.addedElement)  {
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

///  GreaterThanEquals ::= '>='
/// summary values:>=
/// summary=P
Method Greaterthanequals(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle(">=",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,">=")  {
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

///  Hashtag ::= '#'
/// summary values:#
/// summary=P
Method Hashtag(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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

///  Hex_Integer_Literal ::= ('0x' | '0X') ('0' | '1' | '2' | '3' | '4' | '5' | '6' | '7' | '8' | '9' | 'A' | 'B' | 'C' | 'D' | 'E' | 'F' )*
/// summary values:0X,0X
/// summary=(P|P)&(?4punctuation:4?)*
Method HexIntegerLiteral(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (P|P)&(?4punctuation:4?)*
	if '..isPunctuationInList($lb("0X","0X"),2) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..HexIntegerLiteral1Sub(.subElement,.addedElement)  {
		if ..HexIntegerLiteral2RepZero(.subElement,.addedElement)  {
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

/// '0x' | '0X'
/// summary=P|P
Method HexIntegerLiteral1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	if ..addPunctuation(.subElement,"0x")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"0X")  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

///  ('0' | '1' | '2' | '3' | '4' | '5' | '6' | '7' | '8' | '9' | 'A' | 'B' | 'C' | 'D' | 'E' | 'F' )*
Method HexIntegerLiteral2RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..HexIntegerLiteral3Sub(.subElement,.addedElement)  {
		set done=1
	}
	set ok=1
	quit ok
}

/// '0' | '1' | '2' | '3' | '4' | '5' | '6' | '7' | '8' | '9' | 'A' | 'B' | 'C' | 'D' | 'E' | 'F'
/// summary=P|P|P|P|P|P|P|P|P|P|K|K|K|K|K|K
Method HexIntegerLiteral3Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P|P|P|P|P|P|P|P|P|P|K|K|K|K|K|K
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"0")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"1")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"2")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"3")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"4")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"5")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"6")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"7")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"8")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"9")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"A")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"B")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"C")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"D")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"E")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"F")  {
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

///  identifier ::= "NEED IDENTIFIER"
/// summary values:NEED IDENTIFIER
/// summary=P
Method Identifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("NEED IDENTIFIER",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"NEED IDENTIFIER")  {
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

///  identifier_Name ::= identifier | reserved_Word
/// summary=C|C
Method IdentifierName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Identifier(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ReservedWord(.subElement,.addedElement)  {
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

///  IdentityEquals ::= '==='
/// summary values:===
/// summary=P
Method Identityequals(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("===",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"===")  {
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

///  IdentityNotEquals ::= '!=='
/// summary values:!==
/// summary=P
Method Identitynotequals(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("!==",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"!==")  {
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

///  if_Statement ::= "If" '(' expression_Sequence ['in' expression_sequence] ')' statement [("Else" statement)]
/// summary values:IF
/// summary=K&P&C&[K&C]&P&C&[(K&C)]
Method IfStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&C&[K&C]&P&C&[(K&C)]
	if '(..isKeyword("IF")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"IF")  {
		if ..addPunctuation(.subElement,"(")  {
			if ..ExpressionSequence(.subElement,.addedElement)  {
				if ..IfStatement1OptGrp(.subElement,.addedElement)  {
					if ..addPunctuation(.subElement,")")  {
						if ..Statement(.subElement,.addedElement)  {
							if $S(..IfStatement2Sub(.subElement,.addedElement) :1,1:1) {
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
/// summary values:IN
/// summary=K&C
Method IfStatement1OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&C
	if '(..isKeyword("IN")) { quit 1 /* not found is OK */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"IN")  {
		if ..ExpressionSequence(.subElement,.addedElement)  {
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

/// "Else" statement
/// summary values:ELSE
/// summary=K&C
Method IfStatement2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&C
	if '(..isKeyword("ELSE")) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"ELSE")  {
		if ..Statement(.subElement,.addedElement)  {
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

///  import_Alias_Name ::= module_Export_Name [("As" imported_Binding)]
/// summary=C&[(K&C)]
Method ImportAliasName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&[(K&C)]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ModuleExportName(.subElement,.addedElement)  {
		if $S(..ImportAliasName1Sub(.subElement,.addedElement) :1,1:1) {
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

/// "As" imported_Binding
/// summary values:AS
/// summary=K&C
Method ImportAliasName1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&C
	if '(..isKeyword("AS")) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"AS")  {
		if ..ImportedBinding(.subElement,.addedElement)  {
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

///  import_Default ::= alias_Name ','
/// summary=C&P
Method ImportDefault(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&P
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..AliasName(.subElement,.addedElement)  {
		if ..addPunctuation(.subElement,",")  {
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

///  import_From ::= "From" String_Literal
/// summary values:FROM
/// summary=K&C
Method ImportFrom(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C
	if '(..isKeyword("FROM")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"FROM")  {
		if ..StringLiteral(.subElement,.addedElement)  {
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

///  import_From_Block ::= [import_Default] (import_Namespace | import_Module_Items) import_From eos | String_Literal eos
/// summary=[C]&(C|C)&C&C|C&C
Method ImportFromBlock(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary [C]&(C|C)&C&C|C&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..ImportDefault(.subElement,.addedElement) :1,1:1) {
		if ..ImportFromBlock1Sub(.subElement,.addedElement)  {
			if ..ImportFrom(.subElement,.addedElement)  {
				if ..Eos(.subElement,.addedElement)  {
					set done=1 ; or
				} elseif ..StringLiteral(.subElement,.addedElement)  {
					if ..Eos(.subElement,.addedElement)  {
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

/// import_Namespace | import_Module_Items
/// summary=C|C
Method ImportFromBlock1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..ImportNamespace(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ImportModuleItems(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

///  import_Module_Items ::= '{' import_Alias_Name (',' import_Alias_Name )* '}'
/// summary values:{
/// summary=P&C&(?4punctuation:4?)*&P
Method ImportModuleItems(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&(?4punctuation:4?)*&P
	if '..isPunctuation("{",1) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"{")  {
		if ..ImportAliasName(.subElement,.addedElement)  {
			if ..ImportModuleItems1RepZero(.subElement,.addedElement)  {
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

///  (',' import_Alias_Name )*
Method ImportModuleItems1RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ImportModuleItems2Sub(.subElement,.addedElement)  {
		set done=1
	}
	set ok=1
	quit ok
}

/// ',' import_Alias_Name
/// summary values:,
/// summary=P&C
Method ImportModuleItems2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation(",",1) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..ImportAliasName(.subElement,.addedElement)  {
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

///  import_Namespace ::= ('*' | identifier_Name) [("As" identifier_Name)]
/// summary=(P|C)&[(K&C)]
Method ImportNamespace(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (P|C)&[(K&C)]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ImportNamespace1Sub(.subElement,.addedElement)  {
		if $S(..ImportNamespace2Sub(.subElement,.addedElement) :1,1:1) {
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

/// '*' | identifier_Name
/// summary=P|C
Method ImportNamespace1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"*")  {
		set done=1 ; or
	} elseif ..IdentifierName(.subElement,.addedElement)  {
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

/// "As" identifier_Name
/// summary values:AS
/// summary=K&C
Method ImportNamespace2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&C
	if '(..isKeyword("AS")) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"AS")  {
		if ..IdentifierName(.subElement,.addedElement)  {
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

///  import_Statement ::= "Import" import_From_Block
/// summary values:IMPORT
/// summary=K&C
Method ImportStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C
	if '(..isKeyword("IMPORT")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"IMPORT")  {
		if ..ImportFromBlock(.subElement,.addedElement)  {
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

///  imported_Binding ::= Identifier | "Yield" | "Await"
/// summary=C|K|K
Method ImportedBinding(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|K|K
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Identifier(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"YIELD")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"AWAIT")  {
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

///  initializer ::= '=' single_Expression
/// summary values:=
/// summary=P&C
Method Initializer(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C
	if '..isPunctuation("=",1) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"=")  {
		if ..SingleExpression(.subElement,.addedElement)  {
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

///  is_not_Line_Terminator ::= 'NEEDS is_not_Line_Terminator'
/// summary values:NEEDS IS_NOT_LINE_TERMINATOR
/// summary=P
Method IsNotLineTerminator(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("NEEDS IS_NOT_LINE_TERMINATOR",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"NEEDS is_not_Line_Terminator")  {
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

///  iteration_Statement ::= ("Do" statement "While" '(' expression_Sequence ')' eos) | ("While" '(' expression_Sequence ')' statement ) | ( "for" "(" "var" Variable_Declaration ";" [ single_Expression ] ";" [ single_Expression ] ")" Statement ) | ("For" '(' [variable_Declaration_List | expression_Sequence ] ';' [expression_Sequence] ';' [expression_Sequence] ')' statement ) | ("For" '(' (variable_Declaration_List | single_Expression ) "In" expression_Sequence ')' statement ) | ("For" ["Await"] '(' (variable_Declaration_List | single_Expression ) "Of" expression_Sequence ')' statement )
/// summary=(K&C&K&P&C&P&C)|(K&P&C&P&C)|(K&P&K&C&P&[C]&P&[C]&P&C)|(K&P&[C|C]&P&[C]&P&[C]&P&C)|(K&P&(C|C)&K&C&P&C)|(K&[K]&P&(C|C)&K&C&P&C)
Method IterationStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (K&C&K&P&C&P&C)|(K&P&C&P&C)|(K&P&K&C&P&[C]&P&[C]&P&C)|(K&P&[C|C]&P&[C]&P&[C]&P&C)|(K&P&(C|C)&K&C&P&C)|(K&[K]&P&(C|C)&K&C&P&C)
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..IterationStatement1Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..IterationStatement2Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..IterationStatement3Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..IterationStatement4Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..IterationStatement6Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..IterationStatement8Sub(.subElement,.addedElement)  {
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

/// "Do" statement "While" '(' expression_Sequence ')' eos
/// summary=K&C&K&P&C&P&C
Method IterationStatement1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"DO")  {
		if ..Statement(.subElement,.addedElement)  {
			if ..addKeyword(.subElement,"WHILE")  {
				if ..addPunctuation(.subElement,"(")  {
					if ..ExpressionSequence(.subElement,.addedElement)  {
						if ..addPunctuation(.subElement,")")  {
							if ..Eos(.subElement,.addedElement)  {
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

/// "While" '(' expression_Sequence ')' statement
/// summary values:WHILE
/// summary=K&P&C&P&C
Method IterationStatement2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&P&C&P&C
	if '(..isKeyword("WHILE")) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"WHILE")  {
		if ..addPunctuation(.subElement,"(")  {
			if ..ExpressionSequence(.subElement,.addedElement)  {
				if ..addPunctuation(.subElement,")")  {
					if ..Statement(.subElement,.addedElement)  {
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

///  "for" "(" "var" Variable_Declaration ";" [ single_Expression ] ";" [ single_Expression ] ")" Statement
/// summary values:FOR
/// summary=K&P&K&C&P&[C]&P&[C]&P&C
Method IterationStatement3Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&P&K&C&P&[C]&P&[C]&P&C
	if '(..isKeyword("FOR")) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"FOR")  {
		if ..addPunctuation(.subElement,"(")  {
			if ..addKeyword(.subElement,"VAR")  {
				if ..VariableDeclaration(.subElement,.addedElement)  {
					if ..addPunctuation(.subElement,";")  {
						if $S(..SingleExpression(.subElement,.addedElement) :1,1:1) {
							if ..addPunctuation(.subElement,";")  {
								if $S(..SingleExpression(.subElement,.addedElement) :1,1:1) {
									if ..addPunctuation(.subElement,")")  {
										if ..Statement(.subElement,.addedElement)  {
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
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	quit ok
}

/// "For" '(' [variable_Declaration_List | expression_Sequence ] ';' [expression_Sequence] ';' [expression_Sequence] ')' statement
/// summary values:FOR
/// summary=K&P&[C|C]&P&[C]&P&[C]&P&C
Method IterationStatement4Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&P&[C|C]&P&[C]&P&[C]&P&C
	if '(..isKeyword("FOR")) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"FOR")  {
		if ..addPunctuation(.subElement,"(")  {
			if ..IterationStatement5OptGrp(.subElement,.addedElement)  {
				if ..addPunctuation(.subElement,";")  {
					if $S(..ExpressionSequence(.subElement,.addedElement) :1,1:1) {
						if ..addPunctuation(.subElement,";")  {
							if $S(..ExpressionSequence(.subElement,.addedElement) :1,1:1) {
								if ..addPunctuation(.subElement,")")  {
									if ..Statement(.subElement,.addedElement)  {
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
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0
	}
	quit ok
}

/// 
/// summary=C|C
Method IterationStatement5OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..VariableDeclarationList(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ExpressionSequence(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	set ok=1
	quit ok
}

/// "For" '(' (variable_Declaration_List | single_Expression ) "In" expression_Sequence ')' statement
/// summary values:FOR
/// summary=K&P&(C|C)&K&C&P&C
Method IterationStatement6Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&P&(C|C)&K&C&P&C
	if '(..isKeyword("FOR")) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"FOR")  {
		if ..addPunctuation(.subElement,"(")  {
			if ..IterationStatement7Sub(.subElement,.addedElement)  {
				if ..addKeyword(.subElement,"IN")  {
					if ..ExpressionSequence(.subElement,.addedElement)  {
						if ..addPunctuation(.subElement,")")  {
							if ..Statement(.subElement,.addedElement)  {
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

/// variable_Declaration_List | single_Expression
/// summary=C|C
Method IterationStatement7Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..VariableDeclarationList(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SingleExpression(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

/// "For" ["Await"] '(' (variable_Declaration_List | single_Expression ) "Of" expression_Sequence ')' statement
/// summary values:FOR
/// summary=K&[K]&P&(C|C)&K&C&P&C
Method IterationStatement8Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&[K]&P&(C|C)&K&C&P&C
	if '(..isKeyword("FOR")) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"FOR")  {
		if $S(..addKeyword(.subElement,"AWAIT") :1,1:1) {
			if ..addPunctuation(.subElement,"(")  {
				if ..IterationStatement9Sub(.subElement,.addedElement)  {
					if ..addKeyword(.subElement,"OF")  {
						if ..ExpressionSequence(.subElement,.addedElement)  {
							if ..addPunctuation(.subElement,")")  {
								if ..Statement(.subElement,.addedElement)  {
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

/// variable_Declaration_List | single_Expression
/// summary=C|C
Method IterationStatement9Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..VariableDeclarationList(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SingleExpression(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

///  keyword ::= "Break" | "Do" | "Instanceof" | "Typeof" | "Case" | "Else" | "New" | "Var" | "Catch" | "Finally" | "Return" | "Void" | "Continue" | "For" | "Switch" | "While" | "Debugger" | "Function" | "This" | "With" | "Default" | "If" | "Throw" | "Delete" | "In" | "Try" | "Class" | "Enum" | "Extends" | "Super" | "Const" | "Export" | "Import" | "Implements" | "let" | "Private" | "Public" | "Interface" | "Package" | "Protected" | "Static" | "Yield" | "Async" | "Await" | "From" | "As" | "Of"
/// summary values:BREAK,DO,INSTANCEOF,TYPEOF,CASE,ELSE,NEW,VAR,CATCH,FINALLY,RETURN,VOID,CONTINUE,FOR,SWITCH,WHILE,DEBUGGER,FUNCTION,THIS,WITH,DEFAULT,IF,THROW,DELETE,IN,TRY,CLASS,ENUM,EXTENDS,SUPER,CONST,EXPORT,IMPORT,IMPLEMENTS,LET,PRIVATE,PUBLIC,INTERFACE,PACKAGE,PROTECTED,STATIC,YIELD,ASYNC,AWAIT,FROM,AS,OF
/// summary=K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K
Method Keyword(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K
	if '(..isKeywordInList($lb("BREAK","DO","INSTANCEOF","TYPEOF","CASE","ELSE","NEW","VAR","CATCH","FINALLY","RETURN","VOID","CONTINUE","FOR","SWITCH","WHILE","DEBUGGER","FUNCTION","THIS","WITH","DEFAULT","IF","THROW","DELETE","IN","TRY","CLASS","ENUM","EXTENDS","SUPER","CONST","EXPORT","IMPORT","IMPLEMENTS","LET","PRIVATE","PUBLIC","INTERFACE","PACKAGE","PROTECTED","STATIC","YIELD","ASYNC","AWAIT","FROM","AS","OF"))) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"BREAK")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"DO")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"INSTANCEOF")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"TYPEOF")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"CASE")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"ELSE")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"NEW")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"VAR")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"CATCH")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"FINALLY")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"RETURN")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"VOID")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"CONTINUE")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"FOR")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"SWITCH")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"WHILE")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"DEBUGGER")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"FUNCTION")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"THIS")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"WITH")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"DEFAULT")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"IF")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"THROW")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"DELETE")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"IN")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"TRY")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"CLASS")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"ENUM")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"EXTENDS")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"SUPER")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"CONST")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"EXPORT")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"IMPORT")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"IMPLEMENTS")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"LET")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"PRIVATE")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"PUBLIC")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"INTERFACE")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"PACKAGE")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"PROTECTED")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"STATIC")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"YIELD")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"ASYNC")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"AWAIT")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"FROM")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"AS")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"OF")  {
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

///  labelled_Statement ::= identifier ':' statement
/// summary=C&P&C
Method LabelledStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&P&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Identifier(.subElement,.addedElement)  {
		if ..addPunctuation(.subElement,":")  {
			if ..Statement(.subElement,.addedElement)  {
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

///  last_Formal_Parameter_Arg ::= Ellipsis single_Expression
/// summary=C&C
Method LastFormalParameterArg(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Ellipsis(.subElement,.addedElement)  {
		if ..SingleExpression(.subElement,.addedElement)  {
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

///  LeftShiftArithmetic ::= '<<'
/// summary values:<<
/// summary=P
Method Leftshiftarithmetic(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("<<",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"<<")  {
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

///  LeftShiftArithmeticAssign ::= '<<='
/// summary values:<<=
/// summary=P
Method Leftshiftarithmeticassign(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("<<=",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"<<=")  {
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

///  LessThan ::= '<'
/// summary values:<
/// summary=P
Method Lessthan(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("<",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"<")  {
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

///  LessThanEquals ::= '<='
/// summary values:<=
/// summary=P
Method Lessthanequals(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("<=",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"<=")  {
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

///  let ::= "let"
/// summary values:LET
/// summary=K
Method Let(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeyword("LET")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"LET")  {
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

///  literal ::= Null_Literal | Boolean_Literal | (String_Literal (member_expression_part)*) | (Regular_Expression_Literal (member_expression_part)*) | numeric_Literal | bigint_Literal
/// summary=C|C|(C&(?4punctuation:4?)*)|(C&(?4punctuation:4?)*)|C|C
Method Literal(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C|(C&(?4punctuation:4?)*)|(C&(?4punctuation:4?)*)|C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..NullLiteral(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..BooleanLiteral(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Literal1Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Literal4Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..NumericLiteral(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..BigintLiteral(.subElement,.addedElement)  {
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

/// String_Literal (member_expression_part)*
/// summary=C&(?4punctuation:4?)*
Method Literal1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&(?4punctuation:4?)*
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..StringLiteral(.subElement,.addedElement)  {
		if ..Literal2RepZero(.subElement,.addedElement)  {
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

///  (member_expression_part)*
Method Literal2RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..Literal3Sub(.subElement,.addedElement)  {
		set done=1
	}
	set ok=1
	quit ok
}

/// member_expression_part
/// summary=C
Method Literal3Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C
	set subElement=ParentElement
	set done=0 ; method start
	if ..MemberExpressionPart(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

/// Regular_Expression_Literal (member_expression_part)*
/// summary=C&(?4punctuation:4?)*
Method Literal4Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&(?4punctuation:4?)*
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..RegularExpressionLiteral(.subElement,.addedElement)  {
		if ..Literal5RepZero(.subElement,.addedElement)  {
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

///  (member_expression_part)*
Method Literal5RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..Literal6Sub(.subElement,.addedElement)  {
		set done=1
	}
	set ok=1
	quit ok
}

/// member_expression_part
/// summary=C
Method Literal6Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C
	set subElement=ParentElement
	set done=0 ; method start
	if ..MemberExpressionPart(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

///  macro ::= '$$$' identifier ['(' expression_sequence ')']
/// summary values:$$$
/// summary=P&C&[P&C&P]
Method Macro(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&[P&C&P]
	if '..isPunctuation("$$$",3) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"$$$")  {
		if ..Identifier(.subElement,.addedElement)  {
			if ..Macro1OptGrp(.subElement,.addedElement)  {
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
Method Macro1OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&P
	if '..isPunctuation("(",1) { quit 1 /* not found is OK */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if ..ExpressionSequence(.subElement,.addedElement)  {
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

///  Member_Expression_Part ::= ( "[" single_Expression "]" ) | ( ['?'] "." Identifier [( "(" [ expression_Sequence ] ")" )] )
/// summary=(P&C&P)|([P]&P&C&[(P&[C]&P)])
Method MemberExpressionPart(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (P&C&P)|([P]&P&C&[(P&[C]&P)])
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..MemberExpressionPart1Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..MemberExpressionPart2Sub(.subElement,.addedElement)  {
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

///  "[" single_Expression "]"
/// summary=P&C&P
Method MemberExpressionPart1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"[")  {
		if ..SingleExpression(.subElement,.addedElement)  {
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

///  ['?'] "." Identifier [( "(" [ expression_Sequence ] ")" )]
/// summary=[P]&P&C&[(P&[C]&P)]
Method MemberExpressionPart2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary [P]&P&C&[(P&[C]&P)]
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..addPunctuation(.subElement,"?") :1,1:1) {
		if ..addPunctuation(.subElement,".")  {
			if ..Identifier(.subElement,.addedElement)  {
				if $S(..MemberExpressionPart3Sub(.subElement,.addedElement) :1,1:1) {
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

///  "(" [ expression_Sequence ] ")"
/// summary values:(
/// summary=P&[C]&P
Method MemberExpressionPart3Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&[C]&P
	if '..isPunctuation("(",1) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if $S(..ExpressionSequence(.subElement,.addedElement) :1,1:1) {
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

///  method_Definition ::= (["Async"] ['*'] class_Element_Name '(' [formal_Parameter_List ] ')' function_Body) | (['*'] getter '(' ')' function_Body) | (['*'] setter '(' formal_Parameter_List? ')' function_Body)
/// summary=([K]&[P]&C&P&[C]&P&C)|([P]&C&P&P&C)|([P]&C&P&?4OptionalSingle4?&P&C)
Method MethodDefinition(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ([K]&[P]&C&P&[C]&P&C)|([P]&C&P&P&C)|([P]&C&P&?4OptionalSingle4?&P&C)
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..MethodDefinition1Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..MethodDefinition2Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..MethodDefinition3Sub(.subElement,.addedElement)  {
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

/// ["Async"] ['*'] class_Element_Name '(' [formal_Parameter_List ] ')' function_Body
/// summary=[K]&[P]&C&P&[C]&P&C
Method MethodDefinition1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..addKeyword(.subElement,"ASYNC") :1,1:1) {
		if $S(..addPunctuation(.subElement,"*") :1,1:1) {
			if ..ClassElementName(.subElement,.addedElement)  {
				if ..addPunctuation(.subElement,"(")  {
					if $S(..FormalParameterList(.subElement,.addedElement) :1,1:1) {
						if ..addPunctuation(.subElement,")")  {
							if ..FunctionBody(.subElement,.addedElement)  {
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

/// ['*'] getter '(' ')' function_Body
/// summary=[P]&C&P&P&C
Method MethodDefinition2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary [P]&C&P&P&C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..addPunctuation(.subElement,"*") :1,1:1) {
		if ..Getter(.subElement,.addedElement)  {
			if ..addPunctuation(.subElement,"(")  {
				if ..addPunctuation(.subElement,")")  {
					if ..FunctionBody(.subElement,.addedElement)  {
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

/// ['*'] setter '(' formal_Parameter_List? ')' function_Body
/// summary=[P]&C&P&?4OptionalSingle4?&P&C
Method MethodDefinition3Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary [P]&C&P&?4OptionalSingle4?&P&C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..addPunctuation(.subElement,"*") :1,1:1) {
		if ..Setter(.subElement,.addedElement)  {
			if ..addPunctuation(.subElement,"(")  {
				if $s(..FormalParameterList(.subElement,.addedElement) :1,1:1)  {
					if ..addPunctuation(.subElement,")")  {
						if ..FunctionBody(.subElement,.addedElement)  {
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

///  Minus ::= '-'
/// summary values:-
/// summary=P
Method Minus(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("-",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"-")  {
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

///  MinusAssign ::= '-='
/// summary values:-=
/// summary=P
Method Minusassign(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("-=",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"-=")  {
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

///  MinusMinus ::= '--'
/// summary values:--
/// summary=P
Method Minusminus(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("--",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"--")  {
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

///  module_Export_Name ::= identifier_Name | String_Literal
/// summary=C|C
Method ModuleExportName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..IdentifierName(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StringLiteral(.subElement,.addedElement)  {
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

///  Modulus ::= '%'
/// summary values:%
/// summary=P
Method Modulus(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("%",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"%")  {
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

///  ModulusAssign ::= '%='
/// summary values:%=
/// summary=P
Method Modulusassign(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("%=",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"%=")  {
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

///  monadicop ::= "++" | "--" | "+" | "-" | "~" | "!"
/// summary values:++,--,+,-,~,!
/// summary=P|P|P|P|P|P
Method Monadicop(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P|P|P|P|P|P
	if '..isPunctuationInList($lb("++","--"),2),'..isPunctuationInList($lb("+","-","~","!"),1) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"++")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"--")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"+")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"-")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"~")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"!")  {
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

///  MoreThan ::= '>'
/// summary values:>
/// summary=P
Method Morethan(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle(">",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,">")  {
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

///  Multiply ::= '*'
/// summary values:*
/// summary=P
Method Multiply(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("*",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"*")  {
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

///  MultiplyAssign ::= '*='
/// summary values:*=
/// summary=P
Method Multiplyassign(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("*=",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"*=")  {
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

///  Not ::= '!'
/// summary values:!
/// summary=P
Method Not(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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

///  NotEquals ::= '!='
/// summary values:!=
/// summary=P
Method Notequals(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("!=",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"!=")  {
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

///  null_literal ::= 'null'
/// summary values:NULL
/// summary=K
Method NullLiteral(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K
	if '(..isKeyword("NULL")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"NULL")  {
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

///  NullCoalesce ::= '??'
/// summary values:??
/// summary=P
Method Nullcoalesce(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("??",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"??")  {
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

///  NullishCoalescingAssign ::= '??='
/// summary values:??=
/// summary=P
Method Nullishcoalescingassign(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("??=",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"??=")  {
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

///  numeric_Literal ::= Decimal_Literal | Hex_Integer_Literal | Octal_Integer_Literal | Octal_Integer_Literal2 | Binary_Integer_Literal
/// summary=C|C|C|C|C
Method NumericLiteral(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C|C|C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..DecimalLiteral(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..HexIntegerLiteral(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OctalIntegerLiteral(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OctalIntegerLiteral2(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..BinaryIntegerLiteral(.subElement,.addedElement)  {
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

///  object_Literal ::= '{' [property_Assignment (',' [property_Assignment])* ] '}'
/// summary values:{
/// summary=P&[C&(?4punctuation:4?)*]&P
Method ObjectLiteral(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&[C&(?4punctuation:4?)*]&P
	if '..isPunctuation("{",1) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"{")  {
		if ..ObjectLiteral1OptGrp(.subElement,.addedElement)  {
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

/// 
/// summary=C&(?4punctuation:4?)*
Method ObjectLiteral1OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&(?4punctuation:4?)*
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..PropertyAssignment(.subElement,.addedElement)  {
		if ..ObjectLiteral2RepZero(.subElement,.addedElement)  {
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

///  (',' [property_Assignment])*
Method ObjectLiteral2RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ObjectLiteral3Sub(.subElement,.addedElement)  {
		set done=1
	}
	set ok=1
	quit ok
}

/// ',' [property_Assignment]
/// summary values:,
/// summary=P&[C]
Method ObjectLiteral3Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&[C]
	if '..isPunctuation(",",1) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if $S(..PropertyAssignment(.subElement,.addedElement) :1,1:1) {
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

///  ocos_expression_call ::= '#call(' '..' identifier '(' [ expression_sequence ] ')' ')#'
/// summary values:#CALL(
/// summary=P&P&C&P&[C]&P&P
Method OcosExpressionCall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&P&C&P&[C]&P&P
	if '..isPunctuation("#CALL(",6) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"#call(")  {
		if ..addPunctuation(.subElement,"..")  {
			if ..Identifier(.subElement,.addedElement)  {
				if ..addPunctuation(.subElement,"(")  {
					if $S(..ExpressionSequence(.subElement,.addedElement) :1,1:1) {
						if ..addPunctuation(.subElement,")")  {
							if ..addPunctuation(.subElement,")#")  {
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

///  ocos_expression_server ::= '#server(' '..' identifier '(' [ expression_sequence ] ')' ')#'
/// summary values:#SERVER(
/// summary=P&P&C&P&[C]&P&P
Method OcosExpressionServer(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&P&C&P&[C]&P&P
	if '..isPunctuation("#SERVER(",8) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"#server(")  {
		if ..addPunctuation(.subElement,"..")  {
			if ..Identifier(.subElement,.addedElement)  {
				if ..addPunctuation(.subElement,"(")  {
					if $S(..ExpressionSequence(.subElement,.addedElement) :1,1:1) {
						if ..addPunctuation(.subElement,")")  {
							if ..addPunctuation(.subElement,")#")  {
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

///  Octal_Integer_Literal ::= ('0o' | '0O') ('0' | '1' | '2' | '3' | '4' | '5' | '6' | '7' )*
/// summary values:0O,0O
/// summary=(P|P)&(?4punctuation:4?)*
Method OctalIntegerLiteral(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (P|P)&(?4punctuation:4?)*
	if '..isPunctuationInList($lb("0O","0O"),2) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OctalIntegerLiteral1Sub(.subElement,.addedElement)  {
		if ..OctalIntegerLiteral2RepZero(.subElement,.addedElement)  {
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

/// '0o' | '0O'
/// summary=P|P
Method OctalIntegerLiteral1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	set subElement=ParentElement
	set done=0 ; method start
	if ..addPunctuation(.subElement,"0o")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"0O")  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

///  Octal_Integer_Literal2 ::= Octal_Integer_Literal
/// summary=C
Method OctalIntegerLiteral2(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OctalIntegerLiteral(.subElement,.addedElement)  {
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

///  ('0' | '1' | '2' | '3' | '4' | '5' | '6' | '7' )*
Method OctalIntegerLiteral2RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..OctalIntegerLiteral3Sub(.subElement,.addedElement)  {
		set done=1
	}
	set ok=1
	quit ok
}

/// '0' | '1' | '2' | '3' | '4' | '5' | '6' | '7'
/// summary values:0,1,2,3,4,5,6,7
/// summary=P|P|P|P|P|P|P|P
Method OctalIntegerLiteral3Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P|P|P|P|P|P|P|P
	if '..isPunctuationInList($lb("0","1","2","3","4","5","6","7"),1) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addPunctuation(.subElement,"0")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"1")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"2")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"3")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"4")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"5")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"6")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"7")  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

///  oldsingle_Expression ::= anonymous_Function | ( 'Class' identifier? class_Tail ) | ( single_Expression '?.' single_Expression ) | ( single_Expression ['?.'] '[' expression_Sequence ']') | ( single_Expression ['?'] '.' ['#'] identifier_Name ) | ( "New" identifier arguments) | ( "New" single_Expression arguments) | ( "New" single_Expression) | ( single_Expression arguments) | ( "New" '.' identifier ) | ( single_Expression '++' ) | ( single_Expression '--' ) | ( "Delete" single_Expression ) | ( "Void" single_Expression ) | ( "Typeof" single_Expression ) | ('++' single_Expression ) | ('--' single_Expression ) | ('+' single_Expression ) | ('-' single_Expression ) | ('~' single_Expression ) | ('!' single_Expression ) | ("Await" single_Expression ) | ( single_Expression '**' single_Expression ) | ( single_Expression ('*' | '/' | '%') single_Expression ) | ( single_Expression ('+' | '-') single_Expression ) | ( single_Expression '??' single_Expression ) | ( single_Expression ('<<' | '>>' | '>>>') single_Expression ) | ( single_Expression ('<' | '>' | '<=' | '>=') single_Expression ) | ( single_Expression "Instanceof" single_Expression ) | ( single_Expression "In" single_Expression ) | ( single_Expression ('==' | '!=' | '===' | '!==') single_Expression ) | ( single_Expression '&' single_Expression ) | ( single_Expression '^' single_Expression ) | ( single_Expression '|' single_Expression ) | ( single_Expression '&&' single_Expression ) | ( single_Expression '||' single_Expression ) | ( single_Expression '?' single_Expression ':' single_Expression ) | ( single_Expression '=' single_Expression ) | ( single_Expression assignment_Operator single_Expression ) | ( "Import" '(' single_Expression ')' ) | ( yield_Statement ) | "This" | identifier | "Super" | literal | array_Literal | object_Literal | ('(' expression_Sequence ')')
/// summary=C|(K&?4OptionalSingle4?&C)|(C&P&C)|(C&[P]&P&C&P)|(C&[P]&P&[P]&C)|(K&C&C)|(K&C&C)|(K&C)|(C&C)|(K&P&C)|(C&P)|(C&P)|(K&C)|(K&C)|(K&C)|(P&C)|(P&C)|(P&C)|(P&C)|(P&C)|(P&C)|(K&C)|(C&P&C)|(C&(P|P|P)&C)|(C&(P|P)&C)|(C&P&C)|(C&(P|P|P)&C)|(C&(P|P|P|P)&C)|(C&K&C)|(C&K&C)|(C&(P|P|P|P)&C)|(C&P&C)|(C&P&C)|(C&P&C)|(C&P&C)|(C&P&C)|(C&P&C&P&C)|(C&P&C)|(C&C&C)|(K&P&C&P)|(C)|K|C|K|C|C|C|(P&C&P)
Method OldsingleExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|(K&?4OptionalSingle4?&C)|(C&P&C)|(C&[P]&P&C&P)|(C&[P]&P&[P]&C)|(K&C&C)|(K&C&C)|(K&C)|(C&C)|(K&P&C)|(C&P)|(C&P)|(K&C)|(K&C)|(K&C)|(P&C)|(P&C)|(P&C)|(P&C)|(P&C)|(P&C)|(K&C)|(C&P&C)|(C&(P|P|P)&C)|(C&(P|P)&C)|(C&P&C)|(C&(P|P|P)&C)|(C&(P|P|P|P)&C)|(C&K&C)|(C&K&C)|(C&(P|P|P|P)&C)|(C&P&C)|(C&P&C)|(C&P&C)|(C&P&C)|(C&P&C)|(C&P&C&P&C)|(C&P&C)|(C&C&C)|(K&P&C&P)|(C)|K|C|K|C|C|C|(P&C&P)
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..AnonymousFunction(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression1Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression2Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression3Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression4Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression5Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression6Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression7Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression8Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression9Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression10Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression11Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression12Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression13Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression14Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression15Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression16Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression17Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression18Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression19Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression20Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression21Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression22Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression23Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression25Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression27Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression28Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression30Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression32Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression33Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression34Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression36Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression37Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression38Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression39Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression40Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression41Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression42Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression43Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression44Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression45Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"THIS")  {
		set done=1 ; or
	} elseif ..Identifier(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"SUPER")  {
		set done=1 ; or
	} elseif ..Literal(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ArrayLiteral(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ObjectLiteral(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression46Sub(.subElement,.addedElement)  {
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

///  single_Expression '++'
/// summary=C&P
Method OldsingleExpression10Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&P
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SingleExpression(.subElement,.addedElement)  {
		if ..addPunctuation(.subElement,"++")  {
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

///  single_Expression '--'
/// summary=C&P
Method OldsingleExpression11Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&P
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SingleExpression(.subElement,.addedElement)  {
		if ..addPunctuation(.subElement,"--")  {
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

///  "Delete" single_Expression
/// summary values:DELETE
/// summary=K&C
Method OldsingleExpression12Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&C
	if '(..isKeyword("DELETE")) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"DELETE")  {
		if ..SingleExpression(.subElement,.addedElement)  {
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

///  "Void" single_Expression
/// summary values:VOID
/// summary=K&C
Method OldsingleExpression13Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&C
	if '(..isKeyword("VOID")) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"VOID")  {
		if ..SingleExpression(.subElement,.addedElement)  {
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

///  "Typeof" single_Expression
/// summary values:TYPEOF
/// summary=K&C
Method OldsingleExpression14Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&C
	if '(..isKeyword("TYPEOF")) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"TYPEOF")  {
		if ..SingleExpression(.subElement,.addedElement)  {
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

/// '++' single_Expression
/// summary values:++
/// summary=P&C
Method OldsingleExpression15Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation("++",2) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"++")  {
		if ..SingleExpression(.subElement,.addedElement)  {
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

/// '--' single_Expression
/// summary values:--
/// summary=P&C
Method OldsingleExpression16Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation("--",2) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"--")  {
		if ..SingleExpression(.subElement,.addedElement)  {
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

/// '+' single_Expression
/// summary values:+
/// summary=P&C
Method OldsingleExpression17Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation("+",1) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"+")  {
		if ..SingleExpression(.subElement,.addedElement)  {
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

/// '-' single_Expression
/// summary values:-
/// summary=P&C
Method OldsingleExpression18Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation("-",1) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"-")  {
		if ..SingleExpression(.subElement,.addedElement)  {
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

/// '~' single_Expression
/// summary values:~
/// summary=P&C
Method OldsingleExpression19Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation("~",1) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"~")  {
		if ..SingleExpression(.subElement,.addedElement)  {
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

///  'Class' identifier? class_Tail
/// summary values:CLASS
/// summary=K&?4OptionalSingle4?&C
Method OldsingleExpression1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&?4OptionalSingle4?&C
	if '(..isKeyword("CLASS")) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"CLASS")  {
		if $s(..Identifier(.subElement,.addedElement) :1,1:1)  {
			if ..ClassTail(.subElement,.addedElement)  {
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

/// '!' single_Expression
/// summary values:!
/// summary=P&C
Method OldsingleExpression20Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation("!",1) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"!")  {
		if ..SingleExpression(.subElement,.addedElement)  {
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

/// "Await" single_Expression
/// summary values:AWAIT
/// summary=K&C
Method OldsingleExpression21Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&C
	if '(..isKeyword("AWAIT")) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"AWAIT")  {
		if ..SingleExpression(.subElement,.addedElement)  {
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

///  single_Expression '**' single_Expression
/// summary=C&P&C
Method OldsingleExpression22Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&P&C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SingleExpression(.subElement,.addedElement)  {
		if ..addPunctuation(.subElement,"**")  {
			if ..SingleExpression(.subElement,.addedElement)  {
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

///  single_Expression ('*' | '/' | '%') single_Expression
/// summary=C&(P|P|P)&C
Method OldsingleExpression23Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&(P|P|P)&C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SingleExpression(.subElement,.addedElement)  {
		if ..OldsingleExpression24Sub(.subElement,.addedElement)  {
			if ..SingleExpression(.subElement,.addedElement)  {
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

/// '*' | '/' | '%'
/// summary values:*,/,%
/// summary=P|P|P
Method OldsingleExpression24Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P|P|P
	if '..isPunctuationInList($lb("*","/","%"),1) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addPunctuation(.subElement,"*")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"/")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"%")  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

///  single_Expression ('+' | '-') single_Expression
/// summary=C&(P|P)&C
Method OldsingleExpression25Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&(P|P)&C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SingleExpression(.subElement,.addedElement)  {
		if ..OldsingleExpression26Sub(.subElement,.addedElement)  {
			if ..SingleExpression(.subElement,.addedElement)  {
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

/// '+' | '-'
/// summary values:+,-
/// summary=P|P
Method OldsingleExpression26Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P|P
	if '..isPunctuationInList($lb("+","-"),1) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addPunctuation(.subElement,"+")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"-")  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

///  single_Expression '??' single_Expression
/// summary=C&P&C
Method OldsingleExpression27Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&P&C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SingleExpression(.subElement,.addedElement)  {
		if ..addPunctuation(.subElement,"??")  {
			if ..SingleExpression(.subElement,.addedElement)  {
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

///  single_Expression ('<<' | '>>' | '>>>') single_Expression
/// summary=C&(P|P|P)&C
Method OldsingleExpression28Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&(P|P|P)&C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SingleExpression(.subElement,.addedElement)  {
		if ..OldsingleExpression29Sub(.subElement,.addedElement)  {
			if ..SingleExpression(.subElement,.addedElement)  {
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

/// '<<' | '>>' | '>>>'
/// summary values:<<,>>,>>>
/// summary=P|P|P
Method OldsingleExpression29Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P|P|P
	if '..isPunctuation(">>>",3),'..isPunctuationInList($lb("<<",">>"),2) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addPunctuation(.subElement,"<<")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,">>")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,">>>")  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

///  single_Expression '?.' single_Expression
/// summary=C&P&C
Method OldsingleExpression2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&P&C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SingleExpression(.subElement,.addedElement)  {
		if ..addPunctuation(.subElement,"?.")  {
			if ..SingleExpression(.subElement,.addedElement)  {
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

///  single_Expression ('<' | '>' | '<=' | '>=') single_Expression
/// summary=C&(P|P|P|P)&C
Method OldsingleExpression30Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&(P|P|P|P)&C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SingleExpression(.subElement,.addedElement)  {
		if ..OldsingleExpression31Sub(.subElement,.addedElement)  {
			if ..SingleExpression(.subElement,.addedElement)  {
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

/// '<' | '>' | '<=' | '>='
/// summary values:<,>,<=,>=
/// summary=P|P|P|P
Method OldsingleExpression31Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P|P|P|P
	if '..isPunctuationInList($lb("<=",">="),2),'..isPunctuationInList($lb("<",">"),1) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addPunctuation(.subElement,"<")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,">")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"<=")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,">=")  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

///  single_Expression "Instanceof" single_Expression
/// summary=C&K&C
Method OldsingleExpression32Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&K&C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SingleExpression(.subElement,.addedElement)  {
		if ..addKeyword(.subElement,"INSTANCEOF")  {
			if ..SingleExpression(.subElement,.addedElement)  {
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

///  single_Expression "In" single_Expression
/// summary=C&K&C
Method OldsingleExpression33Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&K&C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SingleExpression(.subElement,.addedElement)  {
		if ..addKeyword(.subElement,"IN")  {
			if ..SingleExpression(.subElement,.addedElement)  {
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

///  single_Expression ('==' | '!=' | '===' | '!==') single_Expression
/// summary=C&(P|P|P|P)&C
Method OldsingleExpression34Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&(P|P|P|P)&C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SingleExpression(.subElement,.addedElement)  {
		if ..OldsingleExpression35Sub(.subElement,.addedElement)  {
			if ..SingleExpression(.subElement,.addedElement)  {
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

/// '==' | '!=' | '===' | '!=='
/// summary values:==,!=,===,!==
/// summary=P|P|P|P
Method OldsingleExpression35Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P|P|P|P
	if '..isPunctuationInList($lb("===","!=="),3),'..isPunctuationInList($lb("==","!="),2) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addPunctuation(.subElement,"==")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"!=")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"===")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"!==")  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

///  single_Expression '&' single_Expression
/// summary=C&P&C
Method OldsingleExpression36Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&P&C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SingleExpression(.subElement,.addedElement)  {
		if ..addPunctuation(.subElement,"&")  {
			if ..SingleExpression(.subElement,.addedElement)  {
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

///  single_Expression '^' single_Expression
/// summary=C&P&C
Method OldsingleExpression37Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&P&C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SingleExpression(.subElement,.addedElement)  {
		if ..addPunctuation(.subElement,"^")  {
			if ..SingleExpression(.subElement,.addedElement)  {
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

///  single_Expression '|' single_Expression
/// summary=C&P&C
Method OldsingleExpression38Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&P&C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SingleExpression(.subElement,.addedElement)  {
		if ..addPunctuation(.subElement,"|")  {
			if ..SingleExpression(.subElement,.addedElement)  {
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

///  single_Expression '&&' single_Expression
/// summary=C&P&C
Method OldsingleExpression39Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&P&C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SingleExpression(.subElement,.addedElement)  {
		if ..addPunctuation(.subElement,"&&")  {
			if ..SingleExpression(.subElement,.addedElement)  {
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

///  single_Expression ['?.'] '[' expression_Sequence ']'
/// summary=C&[P]&P&C&P
Method OldsingleExpression3Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&[P]&P&C&P
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SingleExpression(.subElement,.addedElement)  {
		if $S(..addPunctuation(.subElement,"?.") :1,1:1) {
			if ..addPunctuation(.subElement,"[")  {
				if ..ExpressionSequence(.subElement,.addedElement)  {
					if ..addPunctuation(.subElement,"]")  {
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

///  single_Expression '||' single_Expression
/// summary=C&P&C
Method OldsingleExpression40Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&P&C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SingleExpression(.subElement,.addedElement)  {
		if ..addPunctuation(.subElement,"||")  {
			if ..SingleExpression(.subElement,.addedElement)  {
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

///  single_Expression '?' single_Expression ':' single_Expression
/// summary=C&P&C&P&C
Method OldsingleExpression41Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&P&C&P&C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SingleExpression(.subElement,.addedElement)  {
		if ..addPunctuation(.subElement,"?")  {
			if ..SingleExpression(.subElement,.addedElement)  {
				if ..addPunctuation(.subElement,":")  {
					if ..SingleExpression(.subElement,.addedElement)  {
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

///  single_Expression '=' single_Expression
/// summary=C&P&C
Method OldsingleExpression42Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&P&C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SingleExpression(.subElement,.addedElement)  {
		if ..addPunctuation(.subElement,"=")  {
			if ..SingleExpression(.subElement,.addedElement)  {
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

///  single_Expression assignment_Operator single_Expression
/// summary=C&C&C
Method OldsingleExpression43Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&C&C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SingleExpression(.subElement,.addedElement)  {
		if ..AssignmentOperator(.subElement,.addedElement)  {
			if ..SingleExpression(.subElement,.addedElement)  {
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

///  "Import" '(' single_Expression ')'
/// summary values:IMPORT
/// summary=K&P&C&P
Method OldsingleExpression44Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&P&C&P
	if '(..isKeyword("IMPORT")) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"IMPORT")  {
		if ..addPunctuation(.subElement,"(")  {
			if ..SingleExpression(.subElement,.addedElement)  {
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

///  yield_Statement
/// summary=C
Method OldsingleExpression45Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C
	set subElement=ParentElement
	set done=0 ; method start
	if ..YieldStatement(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

/// '(' expression_Sequence ')'
/// summary values:(
/// summary=P&C&P
Method OldsingleExpression46Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&P
	if '..isPunctuation("(",1) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if ..ExpressionSequence(.subElement,.addedElement)  {
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

///  single_Expression ['?'] '.' ['#'] identifier_Name
/// summary=C&[P]&P&[P]&C
Method OldsingleExpression4Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&[P]&P&[P]&C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SingleExpression(.subElement,.addedElement)  {
		if $S(..addPunctuation(.subElement,"?") :1,1:1) {
			if ..addPunctuation(.subElement,".")  {
				if $S(..addPunctuation(.subElement,"#") :1,1:1) {
					if ..IdentifierName(.subElement,.addedElement)  {
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

///  "New" identifier arguments
/// summary values:NEW
/// summary=K&C&C
Method OldsingleExpression5Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&C&C
	if '(..isKeyword("NEW")) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"NEW")  {
		if ..Identifier(.subElement,.addedElement)  {
			if ..Arguments(.subElement,.addedElement)  {
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

///  "New" single_Expression arguments
/// summary values:NEW
/// summary=K&C&C
Method OldsingleExpression6Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&C&C
	if '(..isKeyword("NEW")) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"NEW")  {
		if ..SingleExpression(.subElement,.addedElement)  {
			if ..Arguments(.subElement,.addedElement)  {
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

///  "New" single_Expression
/// summary values:NEW
/// summary=K&C
Method OldsingleExpression7Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&C
	if '(..isKeyword("NEW")) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"NEW")  {
		if ..SingleExpression(.subElement,.addedElement)  {
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

///  single_Expression arguments
/// summary=C&C
Method OldsingleExpression8Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SingleExpression(.subElement,.addedElement)  {
		if ..Arguments(.subElement,.addedElement)  {
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

///  "New" '.' identifier
/// summary values:NEW
/// summary=K&P&C
Method OldsingleExpression9Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&P&C
	if '(..isKeyword("NEW")) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"NEW")  {
		if ..addPunctuation(.subElement,".")  {
			if ..Identifier(.subElement,.addedElement)  {
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

///  OpenBrace ::= '{'
/// summary values:{
/// summary=P
Method Openbrace(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("{",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"{")  {
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

///  OpenBracket ::='['
/// summary values:[
/// summary=P
Method Openbracket(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("[",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"[")  {
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

///  OpenParen ::= '('
/// summary values:(
/// summary=P
Method Openparen(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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

///  Or ::= '||'
/// summary values:||
/// summary=P
Method Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("||",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"||")  {
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

///  Plus ::= '+'
/// summary values:+
/// summary=P
Method Plus(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("+",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"+")  {
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

///  PlusAssign ::= '+='
/// summary values:+=
/// summary=P
Method Plusassign(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("+=",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"+=")  {
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

///  PlusPlus ::= '++'
/// summary values:++
/// summary=P
Method Plusplus(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("++",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"++")  {
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

///  Power ::= '**'
/// summary values:**
/// summary=P
Method Power(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("**",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"**")  {
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

///  PowerAssign ::= '**='
/// summary values:**=
/// summary=P
Method Powerassign(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("**=",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"**=")  {
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

///  primary ::= anonymous_Function | cos_expression | ('[' expression_sequence ']' (member_expression_part)*) | ( 'Class' identifier? class_Tail ) | ( "New" identifier arguments (member_expression_part)* ) | ( "New" single_Expression arguments) | ( "New" single_Expression) | ( "New" '.' identifier ) | ( "Delete" single_Expression ) | ( "Void" single_Expression ) | ( "Typeof" single_Expression ) | ("Await" single_Expression ) | ( "Import" '(' single_Expression ')' ) | ( yield_Statement ) | ("This" (member_expression_part)* ) | macro | (function (member_expression_part)* ) | (identifier (member_expression_part)* ) | "Super" | literal | (array_Literal (member_expression_part)*) | object_Literal | ('(' expression_Sequence ')' (member_expression_part)*)
/// summary=C|C|(P&C&P&(?4punctuation:4?)*)|(K&?4OptionalSingle4?&C)|(K&C&C&(?4punctuation:4?)*)|(K&C&C)|(K&C)|(K&P&C)|(K&C)|(K&C)|(K&C)|(K&C)|(K&P&C&P)|(C)|(K&(?4punctuation:4?)*)|C|(C&(?4punctuation:4?)*)|(C&(?4punctuation:4?)*)|K|C|(C&(?4punctuation:4?)*)|C|(P&C&P&(?4punctuation:4?)*)
Method Primary(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C|(P&C&P&(?4punctuation:4?)*)|(K&?4OptionalSingle4?&C)|(K&C&C&(?4punctuation:4?)*)|(K&C&C)|(K&C)|(K&P&C)|(K&C)|(K&C)|(K&C)|(K&C)|(K&P&C&P)|(C)|(K&(?4punctuation:4?)*)|C|(C&(?4punctuation:4?)*)|(C&(?4punctuation:4?)*)|K|C|(C&(?4punctuation:4?)*)|C|(P&C&P&(?4punctuation:4?)*)
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..AnonymousFunction(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CosExpression(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Primary1Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Primary4Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Primary5Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Primary8Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Primary9Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Primary10Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Primary11Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Primary12Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Primary13Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Primary14Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Primary15Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Primary16Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Primary17Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Macro(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Primary20Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Primary23Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"SUPER")  {
		set done=1 ; or
	} elseif ..Literal(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Primary26Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ObjectLiteral(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Primary29Sub(.subElement,.addedElement)  {
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

///  "New" '.' identifier
/// summary values:NEW
/// summary=K&P&C
Method Primary10Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&P&C
	if '(..isKeyword("NEW")) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"NEW")  {
		if ..addPunctuation(.subElement,".")  {
			if ..Identifier(.subElement,.addedElement)  {
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

///  "Delete" single_Expression
/// summary values:DELETE
/// summary=K&C
Method Primary11Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&C
	if '(..isKeyword("DELETE")) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"DELETE")  {
		if ..SingleExpression(.subElement,.addedElement)  {
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

///  "Void" single_Expression
/// summary values:VOID
/// summary=K&C
Method Primary12Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&C
	if '(..isKeyword("VOID")) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"VOID")  {
		if ..SingleExpression(.subElement,.addedElement)  {
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

///  "Typeof" single_Expression
/// summary values:TYPEOF
/// summary=K&C
Method Primary13Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&C
	if '(..isKeyword("TYPEOF")) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"TYPEOF")  {
		if ..SingleExpression(.subElement,.addedElement)  {
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

/// "Await" single_Expression
/// summary values:AWAIT
/// summary=K&C
Method Primary14Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&C
	if '(..isKeyword("AWAIT")) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"AWAIT")  {
		if ..SingleExpression(.subElement,.addedElement)  {
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

///  "Import" '(' single_Expression ')'
/// summary values:IMPORT
/// summary=K&P&C&P
Method Primary15Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&P&C&P
	if '(..isKeyword("IMPORT")) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"IMPORT")  {
		if ..addPunctuation(.subElement,"(")  {
			if ..SingleExpression(.subElement,.addedElement)  {
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

///  yield_Statement
/// summary=C
Method Primary16Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C
	set subElement=ParentElement
	set done=0 ; method start
	if ..YieldStatement(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

/// "This" (member_expression_part)*
/// summary values:THIS
/// summary=K&(?4punctuation:4?)*
Method Primary17Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&(?4punctuation:4?)*
	if '(..isKeyword("THIS")) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"THIS")  {
		if ..Primary18RepZero(.subElement,.addedElement)  {
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

///  (member_expression_part)*
Method Primary18RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..Primary19Sub(.subElement,.addedElement)  {
		set done=1
	}
	set ok=1
	quit ok
}

/// member_expression_part
/// summary=C
Method Primary19Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C
	set subElement=ParentElement
	set done=0 ; method start
	if ..MemberExpressionPart(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

/// '[' expression_sequence ']' (member_expression_part)*
/// summary values:[
/// summary=P&C&P&(?4punctuation:4?)*
Method Primary1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&P&(?4punctuation:4?)*
	if '..isPunctuation("[",1) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"[")  {
		if ..ExpressionSequence(.subElement,.addedElement)  {
			if ..addPunctuation(.subElement,"]")  {
				if ..Primary2RepZero(.subElement,.addedElement)  {
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

/// function (member_expression_part)*
/// summary=C&(?4punctuation:4?)*
Method Primary20Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&(?4punctuation:4?)*
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Function(.subElement,.addedElement)  {
		if ..Primary21RepZero(.subElement,.addedElement)  {
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

///  (member_expression_part)*
Method Primary21RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..Primary22Sub(.subElement,.addedElement)  {
		set done=1
	}
	set ok=1
	quit ok
}

/// member_expression_part
/// summary=C
Method Primary22Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C
	set subElement=ParentElement
	set done=0 ; method start
	if ..MemberExpressionPart(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

/// identifier (member_expression_part)*
/// summary=C&(?4punctuation:4?)*
Method Primary23Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&(?4punctuation:4?)*
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Identifier(.subElement,.addedElement)  {
		if ..Primary24RepZero(.subElement,.addedElement)  {
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

///  (member_expression_part)*
Method Primary24RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..Primary25Sub(.subElement,.addedElement)  {
		set done=1
	}
	set ok=1
	quit ok
}

/// member_expression_part
/// summary=C
Method Primary25Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C
	set subElement=ParentElement
	set done=0 ; method start
	if ..MemberExpressionPart(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

/// array_Literal (member_expression_part)*
/// summary=C&(?4punctuation:4?)*
Method Primary26Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&(?4punctuation:4?)*
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ArrayLiteral(.subElement,.addedElement)  {
		if ..Primary27RepZero(.subElement,.addedElement)  {
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

///  (member_expression_part)*
Method Primary27RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..Primary28Sub(.subElement,.addedElement)  {
		set done=1
	}
	set ok=1
	quit ok
}

/// member_expression_part
/// summary=C
Method Primary28Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C
	set subElement=ParentElement
	set done=0 ; method start
	if ..MemberExpressionPart(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

/// '(' expression_Sequence ')' (member_expression_part)*
/// summary values:(
/// summary=P&C&P&(?4punctuation:4?)*
Method Primary29Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&P&(?4punctuation:4?)*
	if '..isPunctuation("(",1) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if ..ExpressionSequence(.subElement,.addedElement)  {
			if ..addPunctuation(.subElement,")")  {
				if ..Primary30RepZero(.subElement,.addedElement)  {
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

///  (member_expression_part)*
Method Primary2RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..Primary3Sub(.subElement,.addedElement)  {
		set done=1
	}
	set ok=1
	quit ok
}

///  (member_expression_part)*
Method Primary30RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..Primary31Sub(.subElement,.addedElement)  {
		set done=1
	}
	set ok=1
	quit ok
}

/// member_expression_part
/// summary=C
Method Primary31Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C
	set subElement=ParentElement
	set done=0 ; method start
	if ..MemberExpressionPart(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

/// member_expression_part
/// summary=C
Method Primary3Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C
	set subElement=ParentElement
	set done=0 ; method start
	if ..MemberExpressionPart(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

///  'Class' identifier? class_Tail
/// summary values:CLASS
/// summary=K&?4OptionalSingle4?&C
Method Primary4Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&?4OptionalSingle4?&C
	if '(..isKeyword("CLASS")) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"CLASS")  {
		if $s(..Identifier(.subElement,.addedElement) :1,1:1)  {
			if ..ClassTail(.subElement,.addedElement)  {
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

///  "New" identifier arguments (member_expression_part)*
/// summary values:NEW
/// summary=K&C&C&(?4punctuation:4?)*
Method Primary5Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&C&C&(?4punctuation:4?)*
	if '(..isKeyword("NEW")) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"NEW")  {
		if ..Identifier(.subElement,.addedElement)  {
			if ..Arguments(.subElement,.addedElement)  {
				if ..Primary6RepZero(.subElement,.addedElement)  {
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

///  (member_expression_part)*
Method Primary6RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..Primary7Sub(.subElement,.addedElement)  {
		set done=1
	}
	set ok=1
	quit ok
}

/// member_expression_part
/// summary=C
Method Primary7Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C
	set subElement=ParentElement
	set done=0 ; method start
	if ..MemberExpressionPart(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	set ok=$s(done:1,1:0)
	quit ok
}

///  "New" single_Expression arguments
/// summary values:NEW
/// summary=K&C&C
Method Primary8Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&C&C
	if '(..isKeyword("NEW")) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"NEW")  {
		if ..SingleExpression(.subElement,.addedElement)  {
			if ..Arguments(.subElement,.addedElement)  {
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

///  "New" single_Expression
/// summary values:NEW
/// summary=K&C
Method Primary9Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&C
	if '(..isKeyword("NEW")) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"NEW")  {
		if ..SingleExpression(.subElement,.addedElement)  {
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

///  private_Identifier ::= '#' identifier_Name
/// summary values:#
/// summary=P&C
Method PrivateIdentifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C
	if '..isPunctuation("#",1) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"#")  {
		if ..IdentifierName(.subElement,.addedElement)  {
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

///  property_Assignment ::= (property_Name ':' single_Expression ) | ('[' single_Expression ']' ':' single_Expression) | ([ "Async" ] ['*'] property_Name '(' [formal_Parameter_List] ')' function_Body ) | (getter '(' ')' function_Body ) | (setter '(' formal_Parameter_Arg ')' function_Body ) | ([Ellipsis] single_Expression )
/// summary=(C&P&C)|(P&C&P&P&C)|([K]&[P]&C&P&[C]&P&C)|(C&P&P&C)|(C&P&C&P&C)|([C]&C)
Method PropertyAssignment(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (C&P&C)|(P&C&P&P&C)|([K]&[P]&C&P&[C]&P&C)|(C&P&P&C)|(C&P&C&P&C)|([C]&C)
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..PropertyAssignment1Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..PropertyAssignment2Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..PropertyAssignment3Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..PropertyAssignment4Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..PropertyAssignment5Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..PropertyAssignment6Sub(.subElement,.addedElement)  {
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

/// property_Name ':' single_Expression
/// summary=C&P&C
Method PropertyAssignment1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..PropertyName(.subElement,.addedElement)  {
		if ..addPunctuation(.subElement,":")  {
			if ..SingleExpression(.subElement,.addedElement)  {
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

/// '[' single_Expression ']' ':' single_Expression
/// summary values:[
/// summary=P&C&P&P&C
Method PropertyAssignment2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&P&P&C
	if '..isPunctuation("[",1) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"[")  {
		if ..SingleExpression(.subElement,.addedElement)  {
			if ..addPunctuation(.subElement,"]")  {
				if ..addPunctuation(.subElement,":")  {
					if ..SingleExpression(.subElement,.addedElement)  {
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

/// [ "Async" ] ['*'] property_Name '(' [formal_Parameter_List] ')' function_Body
/// summary=[K]&[P]&C&P&[C]&P&C
Method PropertyAssignment3Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary [K]&[P]&C&P&[C]&P&C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..addKeyword(.subElement,"ASYNC") :1,1:1) {
		if $S(..addPunctuation(.subElement,"*") :1,1:1) {
			if ..PropertyName(.subElement,.addedElement)  {
				if ..addPunctuation(.subElement,"(")  {
					if $S(..FormalParameterList(.subElement,.addedElement) :1,1:1) {
						if ..addPunctuation(.subElement,")")  {
							if ..FunctionBody(.subElement,.addedElement)  {
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

/// getter '(' ')' function_Body
/// summary=C&P&P&C
Method PropertyAssignment4Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&P&P&C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Getter(.subElement,.addedElement)  {
		if ..addPunctuation(.subElement,"(")  {
			if ..addPunctuation(.subElement,")")  {
				if ..FunctionBody(.subElement,.addedElement)  {
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

/// setter '(' formal_Parameter_Arg ')' function_Body
/// summary=C&P&C&P&C
Method PropertyAssignment5Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&P&C&P&C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Setter(.subElement,.addedElement)  {
		if ..addPunctuation(.subElement,"(")  {
			if ..FormalParameterArg(.subElement,.addedElement)  {
				if ..addPunctuation(.subElement,")")  {
					if ..FunctionBody(.subElement,.addedElement)  {
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

/// [Ellipsis] single_Expression
/// summary=[C]&C
Method PropertyAssignment6Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary [C]&C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..Ellipsis(.subElement,.addedElement) :1,1:1) {
		if ..SingleExpression(.subElement,.addedElement)  {
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

///  property_Name ::= identifier_Name | String_Literal | numeric_Literal | ('[' single_Expression ']')
/// summary=C|C|C|(P&C&P)
Method PropertyName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C|C|(P&C&P)
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..IdentifierName(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..StringLiteral(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..NumericLiteral(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..PropertyName1Sub(.subElement,.addedElement)  {
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

/// '[' single_Expression ']'
/// summary values:[
/// summary=P&C&P
Method PropertyName1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&P
	if '..isPunctuation("[",1) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"[")  {
		if ..SingleExpression(.subElement,.addedElement)  {
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

///  QuestionMark ::= '?'
/// summary values:?
/// summary=P
Method Questionmark(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("?",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"?")  {
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

///  QuestionMarkDot ::= '?.'
/// summary values:?.
/// summary=P
Method Questionmarkdot(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("?.",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"?.")  {
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

///  regular_expression_literal ::= 'NEED regex literal'
/// summary values:NEED REGEX LITERAL
/// summary=P
Method RegularExpressionLiteral(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("NEED REGEX LITERAL",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"NEED regex literal")  {
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

///  reserved_Word ::= keyword | Null_Literal | Boolean_Literal
/// summary=C|C|C
Method ReservedWord(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Keyword(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..NullLiteral(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..BooleanLiteral(.subElement,.addedElement)  {
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

///  return_Statement ::= "Return" [ expression_Sequence] eos
/// summary values:RETURN
/// summary=K&[C]&C
Method ReturnStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&[C]&C
	if '(..isKeyword("RETURN")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"RETURN")  {
		if $S(..ExpressionSequence(.subElement,.addedElement) :1,1:1) {
			if ..Eos(.subElement,.addedElement)  {
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

///  RightShiftArithmetic ::= '>>'
/// summary values:>>
/// summary=P
Method Rightshiftarithmetic(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle(">>",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,">>")  {
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

///  RightShiftArithmeticAssign ::= '>>='
/// summary values:>>=
/// summary=P
Method Rightshiftarithmeticassign(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle(">>=",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,">>=")  {
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

///  RightShiftLogical ::= '>>>'
/// summary values:>>>
/// summary=P
Method Rightshiftlogical(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle(">>>",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,">>>")  {
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

///  RightShiftLogicalAssign ::= '>>>='
/// summary values:>>>=
/// summary=P
Method Rightshiftlogicalassign(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle(">>>=",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,">>>=")  {
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

///  SemiColon ::= ';'
/// summary values:;
/// summary=P
Method Semicolon(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle(";",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,";")  {
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

///  setter ::= "set" identifier class_Element_Name
/// summary values:SET
/// summary=K&C&C
Method Setter(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C&C
	if '(..isKeyword("SET")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"SET")  {
		if ..Identifier(.subElement,.addedElement)  {
			if ..ClassElementName(.subElement,.addedElement)  {
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

///  single_expression ::= (factor ( dyadicop factor )* ) [ '--' | '++']
/// summary=(C&(?4punctuation:4?)*)&[P|P]
Method SingleExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (C&(?4punctuation:4?)*)&[P|P]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SingleExpression1Sub(.subElement,.addedElement)  {
		if ..SingleExpression4OptGrp(.subElement,.addedElement)  {
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

/// factor ( dyadicop factor )*
/// summary=C&(?4punctuation:4?)*
Method SingleExpression1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Factor(.subElement,.addedElement)  {
		if ..SingleExpression2RepZero(.subElement,.addedElement)  {
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

///  ( dyadicop factor )*
Method SingleExpression2RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..SingleExpression3Sub(.subElement,.addedElement)  {
		set done=1
	}
	set ok=1
	quit ok
}

///  dyadicop factor
/// summary=C&C
Method SingleExpression3Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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

/// 
/// summary values:--,++
/// summary=P|P
Method SingleExpression4OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P|P
	if '..isPunctuationInList($lb("--","++"),2) { quit 1 /* not found is OK */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addPunctuation(.subElement,"--")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"++")  {
		set done=1 ; end compileRules
	}

	set ok=1
	quit ok
}

///  source_Element ::= statement
/// summary=C
Method SourceElement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Statement(.subElement,.addedElement)  {
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

///  source_Elements ::= source_Element*
/// summary=(?4Call:4?)*
Method SourceElements(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (?4Call:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SourceElements1RepZero(.subElement,.addedElement)  {
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

///  source_Element*
Method SourceElements1RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4Call:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..SourceElement(.subElement,.addedElement)  {
		set done=1
	}
	set ok=1
	quit ok
}

///  statement ::= block | variable_Statement | import_Statement | export_Statement | empty_Statement | class_Declaration | function_Declaration | if_Statement | iteration_Statement | continue_Statement | break_Statement | return_Statement | yield_Statement | with_Statement | labelled_Statement | switch_Statement | throw_Statement | try_Statement | debugger_Statement | expression_Statement
/// summary=C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C
Method Statement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Block(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..VariableStatement(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ImportStatement(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ExportStatement(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..EmptyStatement(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ClassDeclaration(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..FunctionDeclaration(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..IfStatement(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..IterationStatement(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ContinueStatement(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..BreakStatement(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ReturnStatement(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..YieldStatement(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..WithStatement(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..LabelledStatement(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SwitchStatement(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ThrowStatement(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..TryStatement(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..DebuggerStatement(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ExpressionStatement(.subElement,.addedElement)  {
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

///  statement_List ::= statement*
/// summary=(?4Call:4?)*
Method StatementList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (?4Call:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..StatementList1RepZero(.subElement,.addedElement)  {
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

///  statement*
Method StatementList1RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4Call:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..Statement(.subElement,.addedElement)  {
		set done=1
	}
	set ok=1
	quit ok
}

///  statement_List_mandatory ::= statement+
/// summary=(?4Call:4?)+
Method StatementListMandatory(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (?4Call:4?)+
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..StatementListMandatory1RepOne(.subElement,.addedElement)  {
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

///  statement+
Method StatementListMandatory1RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4Call:4?
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..Statement(.subElement,.addedElement)  {
		set done=1
	}
	set ok=$s(done:1,1:0)
	quit ok
}

///  string_literal ::= 'NEED string literal'
/// summary values:NEED STRING LITERAL
/// summary=P
Method StringLiteral(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("NEED STRING LITERAL",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"NEED string literal")  {
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

///  switch_Statement ::= "Switch" '(' expression_Sequence ')' case_Block
/// summary values:SWITCH
/// summary=K&P&C&P&C
Method SwitchStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&C&P&C
	if '(..isKeyword("SWITCH")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"SWITCH")  {
		if ..addPunctuation(.subElement,"(")  {
			if ..ExpressionSequence(.subElement,.addedElement)  {
				if ..addPunctuation(.subElement,")")  {
					if ..CaseBlock(.subElement,.addedElement)  {
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

///  throw_Statement ::= "Throw" expression_Sequence eos
/// summary values:THROW
/// summary=K&C&C
Method ThrowStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C&C
	if '(..isKeyword("THROW")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"THROW")  {
		if ..ExpressionSequence(.subElement,.addedElement)  {
			if ..Eos(.subElement,.addedElement)  {
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

///  try_Statement ::= "Try" block ((catch_Production [finally_Production]) | finally_Production)
/// summary values:TRY
/// summary=K&C&((C&[C])|C)
Method TryStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C&((C&[C])|C)
	if '(..isKeyword("TRY")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"TRY")  {
		if ..Block(.subElement,.addedElement)  {
			if ..TryStatement1Sub(.subElement,.addedElement)  {
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

/// (catch_Production [finally_Production]) | finally_Production
/// summary=(C&[C])|C
Method TryStatement1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary (C&[C])|C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..TryStatement2Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..FinallyProduction(.subElement,.addedElement)  {
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

/// catch_Production [finally_Production]
/// summary=C&[C]
Method TryStatement2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&[C]
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CatchProduction(.subElement,.addedElement)  {
		if $S(..FinallyProduction(.subElement,.addedElement) :1,1:1) {
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

///  var_Modifier ::= "Var" | "let" | "Const"
/// summary values:VAR,LET,CONST
/// summary=K|K|K
Method VarModifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K|K
	if '(..isKeywordInList($lb("VAR","LET","CONST"))) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"VAR")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"LET")  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"CONST")  {
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

///  variable_Declaration ::= assignable [('=' single_Expression)]
/// summary=C&[(P&C)]
Method VariableDeclaration(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&[(P&C)]
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Assignable(.subElement,.addedElement)  {
		if $S(..VariableDeclaration1Sub(.subElement,.addedElement) :1,1:1) {
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

/// '=' single_Expression
/// summary values:=
/// summary=P&C
Method VariableDeclaration1Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation("=",1) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"=")  {
		if ..SingleExpression(.subElement,.addedElement)  {
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

///  variable_Declaration_List ::= var_Modifier variable_Declaration (',' variable_Declaration)*
/// summary=C&C&(?4punctuation:4?)*
Method VariableDeclarationList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&C&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..VarModifier(.subElement,.addedElement)  {
		if ..VariableDeclaration(.subElement,.addedElement)  {
			if ..VariableDeclarationList1RepZero(.subElement,.addedElement)  {
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

///  (',' variable_Declaration)*
Method VariableDeclarationList1RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..VariableDeclarationList2Sub(.subElement,.addedElement)  {
		set done=1
	}
	set ok=1
	quit ok
}

/// ',' variable_Declaration
/// summary values:,
/// summary=P&C
Method VariableDeclarationList2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	if '..isPunctuation(",",1) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if ..VariableDeclaration(.subElement,.addedElement)  {
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

///  variable_Statement ::= variable_Declaration_List eos
/// summary=C&C
Method VariableStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..VariableDeclarationList(.subElement,.addedElement)  {
		if ..Eos(.subElement,.addedElement)  {
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

///  with_Statement ::= "With" '(' expression_Sequence ')' statement
/// summary values:WITH
/// summary=K&P&C&P&C
Method WithStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&P&C&P&C
	if '(..isKeyword("WITH")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"WITH")  {
		if ..addPunctuation(.subElement,"(")  {
			if ..ExpressionSequence(.subElement,.addedElement)  {
				if ..addPunctuation(.subElement,")")  {
					if ..Statement(.subElement,.addedElement)  {
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

///  yield_Statement ::= "Yield" [ expression_Sequence] eos
/// summary values:YIELD
/// summary=K&[C]&C
Method YieldStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&[C]&C
	if '(..isKeyword("YIELD")) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"YIELD")  {
		if $S(..ExpressionSequence(.subElement,.addedElement) :1,1:1) {
			if ..Eos(.subElement,.addedElement)  {
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

Method newElement(Type As %String) As PXW.DEV.BNF.Elements.JS
{
	quit ##class(PXW.DEV.BNF.Elements.JS).%New(Type)
}

}
