/// Created: 2025-11-23 12:19:19 PXW.DEV.BNF.Compilers.Compiler1
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
		if ..AliasName9OptGrp(.subElement,.addedElement)  {
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
/// summary values:AS
/// summary=K&C
Method AliasName9OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&C
	if '(..isKeyword("AS",.value)) { quit 1 /* not found is OK */ }
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
		set ok=0 ; normal rollback
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
	if ..AnonymousFunction168Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AnonymousFunction169Sub(.subElement,.addedElement)  {
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

/// ["Async"] "Function" ['*'] [ identifier ] '(' [formal_Parameter_List] ')' function_Body
/// summary=[K]&K&[P]&[C]&P&[C]&P&C
Method AnonymousFunction168Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary [K]&K&[P]&[C]&P&[C]&P&C
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
		set ok=0 ; normal rollback
	}
	quit ok
}

/// ["Async"] arrow_Function_Parameters '=>' arrow_Function_Body
/// summary=[K]&C&P&C
Method AnonymousFunction169Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		set ok=0 ; normal rollback
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
		if ..Argument71Sub(.subElement,.addedElement)  {
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

/// single_Expression | identifier
/// summary=C|C
Method Argument71Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..SingleExpression(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Identifier(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  arguments ::= '(' [argument (',' argument)*] ')'
/// summary values:(
/// summary=P&[C&(?4punctuation:4?)*]&P
Method Arguments(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&[C&(?4punctuation:4?)*]&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if ..Arguments68OptGrp(.subElement,.addedElement)  {
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
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=C&(?4punctuation:4?)*
Method Arguments68OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&(?4punctuation:4?)*
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Argument(.subElement,.addedElement)  {
		if ..Arguments69RepZero(.subElement,.addedElement)  {
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
Method Arguments69RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..Arguments70Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// ',' argument
/// summary values:,
/// summary=P&C
Method Arguments70Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
	; first rule summary P
	if '(..isStringSingle("[",.value)) { quit 0 /* normal */ /*4*/ }
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
	} elseif ..ArrowFunctionParameters170Sub(.subElement,.addedElement)  {
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

/// '(' [formal_Parameter_List] ')'
/// summary values:(
/// summary=P&[C]&P
Method ArrowFunctionParameters170Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&[C]&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ /*4*/ }
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
	if '(..isStringInList($lb("*=","/=","%=","+=","-=","<<=",">>=",">>>=","&=","^=","|=","**=","??="),4,.value)) { quit 0 /* normal */ }
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
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  Big_Binary_Integer_Literal::= ('0b' | '0B') ('0' | '1' )* 'n'
/// summary=(P|P)&(?4punctuation:4?)*&K
Method BigBinaryIntegerLiteral(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (P|P)&(?4punctuation:4?)*&K
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..BigBinaryIntegerLiteral192Sub(.subElement,.addedElement)  {
		if ..BigBinaryIntegerLiteral193RepZero(.subElement,.addedElement)  {
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
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// '0b' | '0B'
/// summary values:0B,0B
/// summary=P|P
Method BigBinaryIntegerLiteral192Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P|P
	if '(..isStringInList($lb("0B","0B"),2,.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addPunctuation(.subElement,"0b")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"0B")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  ('0' | '1' )*
Method BigBinaryIntegerLiteral193RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..BigBinaryIntegerLiteral194Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// '0' | '1'
/// summary values:0,1
/// summary=P|P
Method BigBinaryIntegerLiteral194Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P|P
	if '(..isStringInList($lb("0","1"),1,.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addPunctuation(.subElement,"0")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"1")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
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
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  Big_Hex_Integer_Literal ::= ('0x' | '0X') ('0' | '1' | '2' | '3' | '4' | '5' | '6' | '7' | '8' | '9' | 'A' | 'B' | 'C' | 'D' | 'E' | 'F' )* 'n'
/// summary=(P|P)&(?4punctuation:4?)*&K
Method BigHexIntegerLiteral(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (P|P)&(?4punctuation:4?)*&K
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..BigHexIntegerLiteral186Sub(.subElement,.addedElement)  {
		if ..BigHexIntegerLiteral187RepZero(.subElement,.addedElement)  {
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
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// '0x' | '0X'
/// summary values:0X,0X
/// summary=P|P
Method BigHexIntegerLiteral186Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P|P
	if '(..isStringInList($lb("0X","0X"),2,.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addPunctuation(.subElement,"0x")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"0X")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  ('0' | '1' | '2' | '3' | '4' | '5' | '6' | '7' | '8' | '9' | 'A' | 'B' | 'C' | 'D' | 'E' | 'F' )*
Method BigHexIntegerLiteral187RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..BigHexIntegerLiteral188Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// '0' | '1' | '2' | '3' | '4' | '5' | '6' | '7' | '8' | '9' | 'A' | 'B' | 'C' | 'D' | 'E' | 'F'
/// summary=P|P|P|P|P|P|P|P|P|P|K|K|K|K|K|K
Method BigHexIntegerLiteral188Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		set ok=0 ; normal rollback
	}
	quit ok
}

///  Big_Octal_Integer_Literal ::= ('0o' | '0O') ('0' | '1' | '2' | '3' | '4' | '5' | '6' | '7' )* 'n'
/// summary=(P|P)&(?4punctuation:4?)*&K
Method BigOctalIntegerLiteral(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (P|P)&(?4punctuation:4?)*&K
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..BigOctalIntegerLiteral189Sub(.subElement,.addedElement)  {
		if ..BigOctalIntegerLiteral190RepZero(.subElement,.addedElement)  {
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
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// '0o' | '0O'
/// summary values:0O,0O
/// summary=P|P
Method BigOctalIntegerLiteral189Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P|P
	if '(..isStringInList($lb("0O","0O"),2,.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addPunctuation(.subElement,"0o")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"0O")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  ('0' | '1' | '2' | '3' | '4' | '5' | '6' | '7' )*
Method BigOctalIntegerLiteral190RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..BigOctalIntegerLiteral191Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// '0' | '1' | '2' | '3' | '4' | '5' | '6' | '7'
/// summary values:0,1,2,3,4,5,6,7
/// summary=P|P|P|P|P|P|P|P
Method BigOctalIntegerLiteral191Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P|P|P|P|P|P|P|P
	if '(..isStringInList($lb("0","1","2","3","4","5","6","7"),1,.value)) { quit 0 /* normal */ }
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

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
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
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  Binary_Integer_Literal::= ('0b' | '0B') ('0' | '1' )*
/// summary=(P|P)&(?4punctuation:4?)*
Method BinaryIntegerLiteral(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (P|P)&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..BinaryIntegerLiteral183Sub(.subElement,.addedElement)  {
		if ..BinaryIntegerLiteral184RepZero(.subElement,.addedElement)  {
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

/// '0b' | '0B'
/// summary values:0B,0B
/// summary=P|P
Method BinaryIntegerLiteral183Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P|P
	if '(..isStringInList($lb("0B","0B"),2,.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addPunctuation(.subElement,"0b")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"0B")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  ('0' | '1' )*
Method BinaryIntegerLiteral184RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..BinaryIntegerLiteral185Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// '0' | '1'
/// summary values:0,1
/// summary=P|P
Method BinaryIntegerLiteral185Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P|P
	if '(..isStringInList($lb("0","1"),1,.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addPunctuation(.subElement,"0")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"1")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
	; first rule summary P
	if '(..isStringSingle("{",.value)) { quit 0 /* normal */ /*4*/ }
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
		set ok=0 ; normal rollback
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
	if '(..isKeywordInList($lb("TRUE","FALSE"),.value)) { quit 0 /* normal */ }
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
		set ok=0 ; normal rollback
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
	if '(..isKeyword("BREAK",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"BREAK")  {
		if ..BreakStatement32OptGrp(.subElement,.addedElement)  {
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
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=C&C
Method BreakStatement32OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
	; first rule summary P
	if '(..isStringSingle("{",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"{")  {
		if $S(..CaseClauses(.subElement,.addedElement) :1,1:1) {
			if ..CaseBlock33OptGrp(.subElement,.addedElement)  {
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
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=C&[C]
Method CaseBlock33OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
	if '(..isKeyword("CASE",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"CASE")  {
		if ..ExpressionSequence(.subElement,.addedElement)  {
			if ..addPunctuation(.subElement,":")  {
				if ..CaseClause35RepZero(.subElement,.addedElement)  {
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

///  ( !'case' statement )*
Method CaseClause35RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..CaseClause36Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  !'case' statement
/// summary=?4NotRule4?&C
Method CaseClause36Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		set ok=0 ; normal rollback
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
	if ..CaseClauses34RepZero(.subElement,.addedElement)  {
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

///  case_Clause*
Method CaseClauses34RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4Call:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..CaseClause(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  catch_Production ::= "Catch" ['(' assignable? ')'] block
/// summary values:CATCH
/// summary=K&[P&?4OptionalSingle4?&P]&C
Method CatchProduction(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&[P&?4OptionalSingle4?&P]&C
	if '(..isKeyword("CATCH",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"CATCH")  {
		if ..CatchProduction41OptGrp(.subElement,.addedElement)  {
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
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary values:(
/// summary=P&?4OptionalSingle4?&P
Method CatchProduction41OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&?4OptionalSingle4?&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 1 /* not found is OK */ /*4*/ }
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
	if '(..isKeyword("CLASS",.value)) { quit 0 /* normal */ }
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
		set ok=0 ; normal rollback
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
	if ..ClassElement44Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ClassElement46Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ClassElement48Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..EmptyStatement(.subElement,.addedElement)  {
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

/// [["Static"] identifier] method_Definition
/// summary=[[K]&C]&C
Method ClassElement44Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary [[K]&C]&C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ClassElement45OptGrp(.subElement,.addedElement)  {
		if ..MethodDefinition(.subElement,.addedElement)  {
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
	quit ok
}

/// 
/// summary=[K]&C
Method ClassElement45OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method ClassElement46Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary [[K]&C]&C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ClassElement47OptGrp(.subElement,.addedElement)  {
		if ..FieldDefinition(.subElement,.addedElement)  {
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
	quit ok
}

/// 
/// summary=[K]&C
Method ClassElement47OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
Method ClassElement48Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary [[K]&C]&C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ClassElement49OptGrp(.subElement,.addedElement)  {
		if ..Block(.subElement,.addedElement)  {
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
	quit ok
}

/// 
/// summary=[K]&C
Method ClassElement49OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		set ok=0 ; normal rollback
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
	if ..ClassTail42OptGrp(.subElement,.addedElement)  {
		if ..addPunctuation(.subElement,"{")  {
			if ..ClassTail43RepZero(.subElement,.addedElement)  {
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
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary values:EXTENDS
/// summary=K&C
Method ClassTail42OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&C
	if '(..isKeyword("EXTENDS",.value)) { quit 1 /* not found is OK */ }
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
Method ClassTail43RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4Call:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ClassElement(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
	if '(..isKeyword("CONTINUE",.value)) { quit 0 /* normal */ }
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
	; first rule summary P
	if '(..isStringSingle("#CALL(",.value)) { quit 0 /* normal */ /*4*/ }
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
		set ok=0 ; normal rollback
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
	; first rule summary P
	if '(..isStringSingle("##(",.value)) { quit 0 /* normal */ /*4*/ }
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
		set ok=0 ; normal rollback
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
	; first rule summary P
	if '(..isStringSingle("<%=",.value)) { quit 0 /* normal */ /*4*/ }
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
		set ok=0 ; normal rollback
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
	; first rule summary P
	if '(..isStringSingle("#(",.value)) { quit 0 /* normal */ /*4*/ }
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
		set ok=0 ; normal rollback
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
	; first rule summary P
	if '(..isStringSingle("#SERVER(",.value)) { quit 0 /* normal */ /*4*/ }
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
		set ok=0 ; normal rollback
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
	if '(..isStringInList($lb("&GT;","&LT;"),4,.value)) { quit 0 /* normal */ }
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
	if '(..isKeyword("DEBUGGER",.value)) { quit 0 /* normal */ }
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
	if '(..isKeyword("DEFAULT",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"DEFAULT")  {
		if ..addPunctuation(.subElement,":")  {
			if ..DefaultClause37RepZero(.subElement,.addedElement)  {
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

///  ( !'case' statement )*
Method DefaultClause37RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..DefaultClause38Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  !'case' statement
/// summary=?4NotRule4?&C
Method DefaultClause38Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
	if ..Dyadicop127Sub(.subElement,.addedElement)  {
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
	} elseif ..Dyadicop128Sub(.subElement,.addedElement)  {
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
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// '?' single_expression ':'
/// summary values:?
/// summary=P&C&P
Method Dyadicop127Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&P
	; first rule summary P
	if '(..isStringSingle("?",.value)) { quit 0 /* normal */ /*4*/ }
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
		set ok=0 ; normal rollback
	}
	quit ok
}

/// '>' is_not_Line_Terminator
/// summary values:>
/// summary=P&C
Method Dyadicop128Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(">",.value)) { quit 0 /* normal */ /*4*/ }
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
		set ok=0 ; normal rollback
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
		if ..ElementList59RepZero(.subElement,.addedElement)  {
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

///  (',' [array_Element])*
Method ElementList59RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ElementList60Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// ',' [array_Element]
/// summary values:,
/// summary=P&[C]
Method ElementList60Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&[C]
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
		if $S(..ExportAliasName17Sub(.subElement,.addedElement) :1,1:1) {
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

/// "As" module_Export_Name
/// summary values:AS
/// summary=K&C
Method ExportAliasName17Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&C
	if '(..isKeyword("AS",.value)) { quit 0 /* normal */ }
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
		set ok=0 ; normal rollback
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
	if ..ExportFromBlock13Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ExportFromBlock14Sub(.subElement,.addedElement)  {
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

/// import_Namespace import_From eos
/// summary=C&C&C
Method ExportFromBlock13Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&C&C
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
		set ok=0 ; normal rollback
	}
	quit ok
}

/// export_Module_Items [import_From] eos
/// summary=C&[C]&C
Method ExportFromBlock14Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		set ok=0 ; normal rollback
	}
	quit ok
}

///  export_Module_Items ::= '{' export_Alias_Name (',' export_Alias_Name )* '}'
/// summary values:{
/// summary=P&C&(?4punctuation:4?)*&P
Method ExportModuleItems(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&(?4punctuation:4?)*&P
	; first rule summary P
	if '(..isStringSingle("{",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"{")  {
		if ..ExportAliasName(.subElement,.addedElement)  {
			if ..ExportModuleItems15RepZero(.subElement,.addedElement)  {
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
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  (',' export_Alias_Name )*
Method ExportModuleItems15RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ExportModuleItems16Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// ',' export_Alias_Name
/// summary values:,
/// summary=P&C
Method ExportModuleItems16Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
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
		set ok=0 ; normal rollback
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
	if ..ExportStatement10Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ExportStatement12Sub(.subElement,.addedElement)  {
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

/// "Export" ["Default"] (export_From_Block | declaration) eos
/// summary values:EXPORT
/// summary=K&[K]&(C|C)&C
Method ExportStatement10Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&[K]&(C|C)&C
	if '(..isKeyword("EXPORT",.value)) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"EXPORT")  {
		if $S(..addKeyword(.subElement,"DEFAULT") :1,1:1) {
			if ..ExportStatement11Sub(.subElement,.addedElement)  {
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
		set ok=0 ; normal rollback
	}
	quit ok
}

/// export_From_Block | declaration
/// summary=C|C
Method ExportStatement11Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..ExportFromBlock(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Declaration(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

/// "Export" "Default" single_Expression eos
/// summary values:EXPORT
/// summary=K&K&C&C
Method ExportStatement12Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&K&C&C
	if '(..isKeyword("EXPORT",.value)) { quit 0 /* normal */ }
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
		set ok=0 ; normal rollback
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
		if ..ExpressionSequence72RepZero(.subElement,.addedElement)  {
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

///  (',' single_Expression)*
Method ExpressionSequence72RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ExpressionSequence73Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// ',' single_Expression
/// summary values:,
/// summary=P&C
Method ExpressionSequence73Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
	if ..Factor124RepZero(.subElement,.addedElement)  {
		if ..Primary(.subElement,.addedElement)  {
			if ..Factor126OptGrp(.subElement,.addedElement)  {
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

///  ( monadicop )*
Method Factor124RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..Factor125Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  monadicop
/// summary=C
Method Factor125Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C
	set subElement=ParentElement
	set done=0 ; method start
	if ..Monadicop(.subElement,.addedElement)  {
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
/// summary values:++,--
/// summary=P|P
Method Factor126OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P|P
	if '(..isStringInList($lb("++","--"),2,.value)) { quit 1 /* not found is OK */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addPunctuation(.subElement,"++")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"--")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=1 /* failure rollsback but returns OK */
	}
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
		set ok=0 ; normal rollback
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
	if '(..isKeyword("FINALLY",.value)) { quit 0 /* normal */ }
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
		set ok=0 ; normal rollback
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
		if ..FormalParameterArg57OptGrp(.subElement,.addedElement)  {
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
/// summary values:=
/// summary=P&C
Method FormalParameterArg57OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle("=",.value)) { quit 1 /* not found is OK */ /*4*/ }
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
	if ..FormalParameterList53Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..LastFormalParameterArg(.subElement,.addedElement)  {
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

/// formal_Parameter_Arg (',' formal_Parameter_Arg)* [',' last_Formal_Parameter_Arg]
/// summary=C&(?4punctuation:4?)*&[P&C]
Method FormalParameterList53Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&(?4punctuation:4?)*&[P&C]
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..FormalParameterArg(.subElement,.addedElement)  {
		if ..FormalParameterList54RepZero(.subElement,.addedElement)  {
			if ..FormalParameterList56OptGrp(.subElement,.addedElement)  {
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
	quit ok
}

///  (',' formal_Parameter_Arg)*
Method FormalParameterList54RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..FormalParameterList55Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// ',' formal_Parameter_Arg
/// summary values:,
/// summary=P&C
Method FormalParameterList55Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
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
		set ok=0 ; normal rollback
	}
	quit ok
}

/// 
/// summary values:,
/// summary=P&C
Method FormalParameterList56OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 1 /* not found is OK */ /*4*/ }
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
		if ..Function164OptGrp(.subElement,.addedElement)  {
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
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary values:[
/// summary=P&C&P
Method Function164OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&P
	; first rule summary P
	if '(..isStringSingle("[",.value)) { quit 1 /* not found is OK */ /*4*/ }
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
	; first rule summary P
	if '(..isStringSingle("{",.value)) { quit 0 /* normal */ /*4*/ }
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
	if '(..isKeyword("GET",.value)) { quit 0 /* normal */ }
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  Hex_Integer_Literal ::= ('0x' | '0X') ('0' | '1' | '2' | '3' | '4' | '5' | '6' | '7' | '8' | '9' | 'A' | 'B' | 'C' | 'D' | 'E' | 'F' )*
/// summary=(P|P)&(?4punctuation:4?)*
Method HexIntegerLiteral(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (P|P)&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..HexIntegerLiteral177Sub(.subElement,.addedElement)  {
		if ..HexIntegerLiteral178RepZero(.subElement,.addedElement)  {
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

/// '0x' | '0X'
/// summary values:0X,0X
/// summary=P|P
Method HexIntegerLiteral177Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P|P
	if '(..isStringInList($lb("0X","0X"),2,.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addPunctuation(.subElement,"0x")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"0X")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  ('0' | '1' | '2' | '3' | '4' | '5' | '6' | '7' | '8' | '9' | 'A' | 'B' | 'C' | 'D' | 'E' | 'F' )*
Method HexIntegerLiteral178RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..HexIntegerLiteral179Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// '0' | '1' | '2' | '3' | '4' | '5' | '6' | '7' | '8' | '9' | 'A' | 'B' | 'C' | 'D' | 'E' | 'F'
/// summary=P|P|P|P|P|P|P|P|P|P|K|K|K|K|K|K
Method HexIntegerLiteral179Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
	if '(..isKeyword("IF",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"IF")  {
		if ..addPunctuation(.subElement,"(")  {
			if ..ExpressionSequence(.subElement,.addedElement)  {
				if ..IfStatement21OptGrp(.subElement,.addedElement)  {
					if ..addPunctuation(.subElement,")")  {
						if ..Statement(.subElement,.addedElement)  {
							if $S(..IfStatement22Sub(.subElement,.addedElement) :1,1:1) {
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
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary values:IN
/// summary=K&C
Method IfStatement21OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&C
	if '(..isKeyword("IN",.value)) { quit 1 /* not found is OK */ }
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
Method IfStatement22Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&C
	if '(..isKeyword("ELSE",.value)) { quit 0 /* normal */ }
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
		set ok=0 ; normal rollback
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
		if $S(..ImportAliasName6Sub(.subElement,.addedElement) :1,1:1) {
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

/// "As" imported_Binding
/// summary values:AS
/// summary=K&C
Method ImportAliasName6Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&C
	if '(..isKeyword("AS",.value)) { quit 0 /* normal */ }
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
	if '(..isKeyword("FROM",.value)) { quit 0 /* normal */ }
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
		set ok=0 ; normal rollback
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
		if ..ImportFromBlock3Sub(.subElement,.addedElement)  {
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
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// import_Namespace | import_Module_Items
/// summary=C|C
Method ImportFromBlock3Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..ImportNamespace(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ImportModuleItems(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  import_Module_Items ::= '{' import_Alias_Name (',' import_Alias_Name )* '}'
/// summary values:{
/// summary=P&C&(?4punctuation:4?)*&P
Method ImportModuleItems(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&(?4punctuation:4?)*&P
	; first rule summary P
	if '(..isStringSingle("{",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"{")  {
		if ..ImportAliasName(.subElement,.addedElement)  {
			if ..ImportModuleItems4RepZero(.subElement,.addedElement)  {
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
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  (',' import_Alias_Name )*
Method ImportModuleItems4RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ImportModuleItems5Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// ',' import_Alias_Name
/// summary values:,
/// summary=P&C
Method ImportModuleItems5Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
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
		set ok=0 ; normal rollback
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
	if ..ImportNamespace7Sub(.subElement,.addedElement)  {
		if $S(..ImportNamespace8Sub(.subElement,.addedElement) :1,1:1) {
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

/// '*' | identifier_Name
/// summary=P|C
Method ImportNamespace7Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P|C
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
		set ok=0 ; normal rollback
	}
	quit ok
}

/// "As" identifier_Name
/// summary values:AS
/// summary=K&C
Method ImportNamespace8Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&C
	if '(..isKeyword("AS",.value)) { quit 0 /* normal */ }
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
		set ok=0 ; normal rollback
	}
	quit ok
}

///  import_Statement ::= "Import" import_From_Block
/// summary values:IMPORT
/// summary=K&C
Method ImportStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C
	if '(..isKeyword("IMPORT",.value)) { quit 0 /* normal */ }
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
	; first rule summary P
	if '(..isStringSingle("=",.value)) { quit 0 /* normal */ /*4*/ }
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
	if ..IterationStatement23Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..IterationStatement24Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..IterationStatement25Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..IterationStatement26Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..IterationStatement28Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..IterationStatement30Sub(.subElement,.addedElement)  {
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

/// "Do" statement "While" '(' expression_Sequence ')' eos
/// summary values:DO
/// summary=K&C&K&P&C&P&C
Method IterationStatement23Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&C&K&P&C&P&C
	if '(..isKeyword("DO",.value)) { quit 0 /* normal */ }
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
		set ok=0 ; normal rollback
	}
	quit ok
}

/// "While" '(' expression_Sequence ')' statement
/// summary values:WHILE
/// summary=K&P&C&P&C
Method IterationStatement24Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&P&C&P&C
	if '(..isKeyword("WHILE",.value)) { quit 0 /* normal */ }
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
		set ok=0 ; normal rollback
	}
	quit ok
}

///  "for" "(" "var" Variable_Declaration ";" [ single_Expression ] ";" [ single_Expression ] ")" Statement
/// summary values:FOR
/// summary=K&P&K&C&P&[C]&P&[C]&P&C
Method IterationStatement25Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&P&K&C&P&[C]&P&[C]&P&C
	if '(..isKeyword("FOR",.value)) { quit 0 /* normal */ }
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
		set ok=0 ; normal rollback
	}
	quit ok
}

/// "For" '(' [variable_Declaration_List | expression_Sequence ] ';' [expression_Sequence] ';' [expression_Sequence] ')' statement
/// summary values:FOR
/// summary=K&P&[C|C]&P&[C]&P&[C]&P&C
Method IterationStatement26Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&P&[C|C]&P&[C]&P&[C]&P&C
	if '(..isKeyword("FOR",.value)) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"FOR")  {
		if ..addPunctuation(.subElement,"(")  {
			if ..IterationStatement27OptGrp(.subElement,.addedElement)  {
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
		set ok=0 ; normal rollback
	}
	quit ok
}

/// 
/// summary=C|C
Method IterationStatement27OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..VariableDeclarationList(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ExpressionSequence(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=1 /* failure rollsback but returns OK */
	}
	quit ok
}

/// "For" '(' (variable_Declaration_List | single_Expression ) "In" expression_Sequence ')' statement
/// summary values:FOR
/// summary=K&P&(C|C)&K&C&P&C
Method IterationStatement28Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&P&(C|C)&K&C&P&C
	if '(..isKeyword("FOR",.value)) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"FOR")  {
		if ..addPunctuation(.subElement,"(")  {
			if ..IterationStatement29Sub(.subElement,.addedElement)  {
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
		set ok=0 ; normal rollback
	}
	quit ok
}

/// variable_Declaration_List | single_Expression
/// summary=C|C
Method IterationStatement29Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..VariableDeclarationList(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SingleExpression(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

/// "For" ["Await"] '(' (variable_Declaration_List | single_Expression ) "Of" expression_Sequence ')' statement
/// summary values:FOR
/// summary=K&[K]&P&(C|C)&K&C&P&C
Method IterationStatement30Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&[K]&P&(C|C)&K&C&P&C
	if '(..isKeyword("FOR",.value)) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"FOR")  {
		if $S(..addKeyword(.subElement,"AWAIT") :1,1:1) {
			if ..addPunctuation(.subElement,"(")  {
				if ..IterationStatement31Sub(.subElement,.addedElement)  {
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
		set ok=0 ; normal rollback
	}
	quit ok
}

/// variable_Declaration_List | single_Expression
/// summary=C|C
Method IterationStatement31Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..VariableDeclarationList(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SingleExpression(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  keyword ::= "Break" | "Do" | "Instanceof" | "Typeof" | "Case" | "Else" | "New" | "Var" | "Catch" | "Finally" | "Return" | "Void" | "Continue" | "For" | "Switch" | "While" | "Debugger" | "Function" | "This" | "With" | "Default" | "If" | "Throw" | "Delete" | "In" | "Try" | "Class" | "Enum" | "Extends" | "Super" | "Const" | "Export" | "Import" | "Implements" | "let" | "Private" | "Public" | "Interface" | "Package" | "Protected" | "Static" | "Yield" | "Async" | "Await" | "From" | "As" | "Of"
/// summary values:BREAK,DO,INSTANCEOF,TYPEOF,CASE,ELSE,NEW,VAR,CATCH,FINALLY,RETURN,VOID,CONTINUE,FOR,SWITCH,WHILE,DEBUGGER,FUNCTION,THIS,WITH,DEFAULT,IF,THROW,DELETE,IN,TRY,CLASS,ENUM,EXTENDS,SUPER,CONST,EXPORT,IMPORT,IMPLEMENTS,LET,PRIVATE,PUBLIC,INTERFACE,PACKAGE,PROTECTED,STATIC,YIELD,ASYNC,AWAIT,FROM,AS,OF
/// summary=K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K
Method Keyword(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K|K
	if '(..isKeywordInList($lb("BREAK","DO","INSTANCEOF","TYPEOF","CASE","ELSE","NEW","VAR","CATCH","FINALLY","RETURN","VOID","CONTINUE","FOR","SWITCH","WHILE","DEBUGGER","FUNCTION","THIS","WITH","DEFAULT","IF","THROW","DELETE","IN","TRY","CLASS","ENUM","EXTENDS","SUPER","CONST","EXPORT","IMPORT","IMPLEMENTS","LET","PRIVATE","PUBLIC","INTERFACE","PACKAGE","PROTECTED","STATIC","YIELD","ASYNC","AWAIT","FROM","AS","OF"),.value)) { quit 0 /* normal */ }
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
	if '(..isKeyword("LET",.value)) { quit 0 /* normal */ }
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
		set ok=0 ; normal rollback
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
	} elseif ..Literal171Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Literal174Sub(.subElement,.addedElement)  {
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
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// String_Literal (member_expression_part)*
/// summary=C&(?4punctuation:4?)*
Method Literal171Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&(?4punctuation:4?)*
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..StringLiteral(.subElement,.addedElement)  {
		if ..Literal172RepZero(.subElement,.addedElement)  {
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
	quit ok
}

///  (member_expression_part)*
Method Literal172RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..Literal173Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// member_expression_part
/// summary=C
Method Literal173Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C
	set subElement=ParentElement
	set done=0 ; method start
	if ..MemberExpressionPart(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

/// Regular_Expression_Literal (member_expression_part)*
/// summary=C&(?4punctuation:4?)*
Method Literal174Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&(?4punctuation:4?)*
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..RegularExpressionLiteral(.subElement,.addedElement)  {
		if ..Literal175RepZero(.subElement,.addedElement)  {
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
	quit ok
}

///  (member_expression_part)*
Method Literal175RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..Literal176Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// member_expression_part
/// summary=C
Method Literal176Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C
	set subElement=ParentElement
	set done=0 ; method start
	if ..MemberExpressionPart(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  macro ::= '$$$' identifier ['(' expression_sequence ')']
/// summary values:$$$
/// summary=P&C&[P&C&P]
Method Macro(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&[P&C&P]
	; first rule summary P
	if '(..isStringSingle("$$$",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"$$$")  {
		if ..Identifier(.subElement,.addedElement)  {
			if ..Macro163OptGrp(.subElement,.addedElement)  {
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
/// summary values:(
/// summary=P&C&P
Method Macro163OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 1 /* not found is OK */ /*4*/ }
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
	if ..MemberExpressionPart160Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..MemberExpressionPart161Sub(.subElement,.addedElement)  {
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

///  "[" single_Expression "]"
/// summary values:[
/// summary=P&C&P
Method MemberExpressionPart160Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&P
	; first rule summary P
	if '(..isStringSingle("[",.value)) { quit 0 /* normal */ /*4*/ }
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
		set ok=0 ; normal rollback
	}
	quit ok
}

///  ['?'] "." Identifier [( "(" [ expression_Sequence ] ")" )]
/// summary=[P]&P&C&[(P&[C]&P)]
Method MemberExpressionPart161Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary [P]&P&C&[(P&[C]&P)]
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..addPunctuation(.subElement,"?") :1,1:1) {
		if ..addPunctuation(.subElement,".")  {
			if ..Identifier(.subElement,.addedElement)  {
				if $S(..MemberExpressionPart162Sub(.subElement,.addedElement) :1,1:1) {
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
	quit ok
}

///  "(" [ expression_Sequence ] ")"
/// summary values:(
/// summary=P&[C]&P
Method MemberExpressionPart162Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&[C]&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ /*4*/ }
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
		set ok=0 ; normal rollback
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
	if ..MethodDefinition50Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..MethodDefinition51Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..MethodDefinition52Sub(.subElement,.addedElement)  {
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

/// ["Async"] ['*'] class_Element_Name '(' [formal_Parameter_List ] ')' function_Body
/// summary=[K]&[P]&C&P&[C]&P&C
Method MethodDefinition50Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary [K]&[P]&C&P&[C]&P&C
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
		set ok=0 ; normal rollback
	}
	quit ok
}

/// ['*'] getter '(' ')' function_Body
/// summary=[P]&C&P&P&C
Method MethodDefinition51Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		set ok=0 ; normal rollback
	}
	quit ok
}

/// ['*'] setter '(' formal_Parameter_List? ')' function_Body
/// summary=[P]&C&P&?4OptionalSingle4?&P&C
Method MethodDefinition52Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
	if '(..isStringInList($lb("++","--","+","-","~","!"),2,.value)) { quit 0 /* normal */ }
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
	if '(..isKeyword("NULL",.value)) { quit 0 /* normal */ }
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
	; first rule summary P
	if '(..isStringSingle("{",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"{")  {
		if ..ObjectLiteral165OptGrp(.subElement,.addedElement)  {
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
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary=C&(?4punctuation:4?)*
Method ObjectLiteral165OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&(?4punctuation:4?)*
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..PropertyAssignment(.subElement,.addedElement)  {
		if ..ObjectLiteral166RepZero(.subElement,.addedElement)  {
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
Method ObjectLiteral166RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ObjectLiteral167Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// ',' [property_Assignment]
/// summary values:,
/// summary=P&[C]
Method ObjectLiteral167Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&[C]
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
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
		set ok=0 ; normal rollback
	}
	quit ok
}

///  ocos_expression_call ::= '#call(' '..' identifier '(' [ expression_sequence ] ')' ')#'
/// summary values:#CALL(
/// summary=P&P&C&P&[C]&P&P
Method OcosExpressionCall(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&P&C&P&[C]&P&P
	; first rule summary P
	if '(..isStringSingle("#CALL(",.value)) { quit 0 /* normal */ /*4*/ }
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
		set ok=0 ; normal rollback
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
	; first rule summary P
	if '(..isStringSingle("#SERVER(",.value)) { quit 0 /* normal */ /*4*/ }
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
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  Octal_Integer_Literal ::= ('0o' | '0O') ('0' | '1' | '2' | '3' | '4' | '5' | '6' | '7' )*
/// summary=(P|P)&(?4punctuation:4?)*
Method OctalIntegerLiteral(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (P|P)&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OctalIntegerLiteral180Sub(.subElement,.addedElement)  {
		if ..OctalIntegerLiteral181RepZero(.subElement,.addedElement)  {
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

/// '0o' | '0O'
/// summary values:0O,0O
/// summary=P|P
Method OctalIntegerLiteral180Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P|P
	if '(..isStringInList($lb("0O","0O"),2,.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addPunctuation(.subElement,"0o")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"0O")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  ('0' | '1' | '2' | '3' | '4' | '5' | '6' | '7' )*
Method OctalIntegerLiteral181RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..OctalIntegerLiteral182Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// '0' | '1' | '2' | '3' | '4' | '5' | '6' | '7'
/// summary values:0,1,2,3,4,5,6,7
/// summary=P|P|P|P|P|P|P|P
Method OctalIntegerLiteral182Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P|P|P|P|P|P|P|P
	if '(..isStringInList($lb("0","1","2","3","4","5","6","7"),1,.value)) { quit 0 /* normal */ }
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

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
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
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
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
	} elseif ..OldsingleExpression74Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression75Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression76Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression77Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression78Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression79Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression80Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression81Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression82Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression83Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression84Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression85Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression86Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression87Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression88Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression89Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression90Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression91Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression92Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression93Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression94Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression95Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression96Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression98Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression100Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression101Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression103Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression105Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression106Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression107Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression109Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression110Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression111Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression112Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression113Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression114Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression115Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression116Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression117Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..OldsingleExpression118Sub(.subElement,.addedElement)  {
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
	} elseif ..OldsingleExpression119Sub(.subElement,.addedElement)  {
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

///  single_Expression '??' single_Expression
/// summary=C&P&C
Method OldsingleExpression100Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		set ok=0 ; normal rollback
	}
	quit ok
}

///  single_Expression ('<<' | '>>' | '>>>') single_Expression
/// summary=C&(P|P|P)&C
Method OldsingleExpression101Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&(P|P|P)&C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SingleExpression(.subElement,.addedElement)  {
		if ..OldsingleExpression102Sub(.subElement,.addedElement)  {
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
		set ok=0 ; normal rollback
	}
	quit ok
}

/// '<<' | '>>' | '>>>'
/// summary values:<<,>>,>>>
/// summary=P|P|P
Method OldsingleExpression102Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P|P|P
	if '(..isStringInList($lb("<<",">>",">>>"),3,.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addPunctuation(.subElement,"<<")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,">>")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,">>>")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  single_Expression ('<' | '>' | '<=' | '>=') single_Expression
/// summary=C&(P|P|P|P)&C
Method OldsingleExpression103Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&(P|P|P|P)&C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SingleExpression(.subElement,.addedElement)  {
		if ..OldsingleExpression104Sub(.subElement,.addedElement)  {
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
		set ok=0 ; normal rollback
	}
	quit ok
}

/// '<' | '>' | '<=' | '>='
/// summary values:<,>,<=,>=
/// summary=P|P|P|P
Method OldsingleExpression104Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P|P|P|P
	if '(..isStringInList($lb("<",">","<=",">="),2,.value)) { quit 0 /* normal */ }
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

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  single_Expression "Instanceof" single_Expression
/// summary=C&K&C
Method OldsingleExpression105Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		set ok=0 ; normal rollback
	}
	quit ok
}

///  single_Expression "In" single_Expression
/// summary=C&K&C
Method OldsingleExpression106Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		set ok=0 ; normal rollback
	}
	quit ok
}

///  single_Expression ('==' | '!=' | '===' | '!==') single_Expression
/// summary=C&(P|P|P|P)&C
Method OldsingleExpression107Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&(P|P|P|P)&C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SingleExpression(.subElement,.addedElement)  {
		if ..OldsingleExpression108Sub(.subElement,.addedElement)  {
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
		set ok=0 ; normal rollback
	}
	quit ok
}

/// '==' | '!=' | '===' | '!=='
/// summary values:==,!=,===,!==
/// summary=P|P|P|P
Method OldsingleExpression108Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P|P|P|P
	if '(..isStringInList($lb("==","!=","===","!=="),3,.value)) { quit 0 /* normal */ }
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

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  single_Expression '&' single_Expression
/// summary=C&P&C
Method OldsingleExpression109Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		set ok=0 ; normal rollback
	}
	quit ok
}

///  single_Expression '^' single_Expression
/// summary=C&P&C
Method OldsingleExpression110Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		set ok=0 ; normal rollback
	}
	quit ok
}

///  single_Expression '|' single_Expression
/// summary=C&P&C
Method OldsingleExpression111Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		set ok=0 ; normal rollback
	}
	quit ok
}

///  single_Expression '&&' single_Expression
/// summary=C&P&C
Method OldsingleExpression112Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		set ok=0 ; normal rollback
	}
	quit ok
}

///  single_Expression '||' single_Expression
/// summary=C&P&C
Method OldsingleExpression113Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		set ok=0 ; normal rollback
	}
	quit ok
}

///  single_Expression '?' single_Expression ':' single_Expression
/// summary=C&P&C&P&C
Method OldsingleExpression114Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		set ok=0 ; normal rollback
	}
	quit ok
}

///  single_Expression '=' single_Expression
/// summary=C&P&C
Method OldsingleExpression115Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		set ok=0 ; normal rollback
	}
	quit ok
}

///  single_Expression assignment_Operator single_Expression
/// summary=C&C&C
Method OldsingleExpression116Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		set ok=0 ; normal rollback
	}
	quit ok
}

///  "Import" '(' single_Expression ')'
/// summary values:IMPORT
/// summary=K&P&C&P
Method OldsingleExpression117Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&P&C&P
	if '(..isKeyword("IMPORT",.value)) { quit 0 /* normal */ }
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
		set ok=0 ; normal rollback
	}
	quit ok
}

///  yield_Statement
/// summary=C
Method OldsingleExpression118Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C
	set subElement=ParentElement
	set done=0 ; method start
	if ..YieldStatement(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

/// '(' expression_Sequence ')'
/// summary values:(
/// summary=P&C&P
Method OldsingleExpression119Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ /*4*/ }
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
		set ok=0 ; normal rollback
	}
	quit ok
}

///  'Class' identifier? class_Tail
/// summary values:CLASS
/// summary=K&?4OptionalSingle4?&C
Method OldsingleExpression74Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&?4OptionalSingle4?&C
	if '(..isKeyword("CLASS",.value)) { quit 0 /* normal */ }
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
		set ok=0 ; normal rollback
	}
	quit ok
}

///  single_Expression '?.' single_Expression
/// summary=C&P&C
Method OldsingleExpression75Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		set ok=0 ; normal rollback
	}
	quit ok
}

///  single_Expression ['?.'] '[' expression_Sequence ']'
/// summary=C&[P]&P&C&P
Method OldsingleExpression76Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		set ok=0 ; normal rollback
	}
	quit ok
}

///  single_Expression ['?'] '.' ['#'] identifier_Name
/// summary=C&[P]&P&[P]&C
Method OldsingleExpression77Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		set ok=0 ; normal rollback
	}
	quit ok
}

///  "New" identifier arguments
/// summary values:NEW
/// summary=K&C&C
Method OldsingleExpression78Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&C&C
	if '(..isKeyword("NEW",.value)) { quit 0 /* normal */ }
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
		set ok=0 ; normal rollback
	}
	quit ok
}

///  "New" single_Expression arguments
/// summary values:NEW
/// summary=K&C&C
Method OldsingleExpression79Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&C&C
	if '(..isKeyword("NEW",.value)) { quit 0 /* normal */ }
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
		set ok=0 ; normal rollback
	}
	quit ok
}

///  "New" single_Expression
/// summary values:NEW
/// summary=K&C
Method OldsingleExpression80Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&C
	if '(..isKeyword("NEW",.value)) { quit 0 /* normal */ }
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
		set ok=0 ; normal rollback
	}
	quit ok
}

///  single_Expression arguments
/// summary=C&C
Method OldsingleExpression81Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		set ok=0 ; normal rollback
	}
	quit ok
}

///  "New" '.' identifier
/// summary values:NEW
/// summary=K&P&C
Method OldsingleExpression82Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&P&C
	if '(..isKeyword("NEW",.value)) { quit 0 /* normal */ }
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
		set ok=0 ; normal rollback
	}
	quit ok
}

///  single_Expression '++'
/// summary=C&P
Method OldsingleExpression83Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		set ok=0 ; normal rollback
	}
	quit ok
}

///  single_Expression '--'
/// summary=C&P
Method OldsingleExpression84Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		set ok=0 ; normal rollback
	}
	quit ok
}

///  "Delete" single_Expression
/// summary values:DELETE
/// summary=K&C
Method OldsingleExpression85Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&C
	if '(..isKeyword("DELETE",.value)) { quit 0 /* normal */ }
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
		set ok=0 ; normal rollback
	}
	quit ok
}

///  "Void" single_Expression
/// summary values:VOID
/// summary=K&C
Method OldsingleExpression86Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&C
	if '(..isKeyword("VOID",.value)) { quit 0 /* normal */ }
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
		set ok=0 ; normal rollback
	}
	quit ok
}

///  "Typeof" single_Expression
/// summary values:TYPEOF
/// summary=K&C
Method OldsingleExpression87Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&C
	if '(..isKeyword("TYPEOF",.value)) { quit 0 /* normal */ }
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
		set ok=0 ; normal rollback
	}
	quit ok
}

/// '++' single_Expression
/// summary values:++
/// summary=P&C
Method OldsingleExpression88Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle("++",.value)) { quit 0 /* normal */ /*4*/ }
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
		set ok=0 ; normal rollback
	}
	quit ok
}

/// '--' single_Expression
/// summary values:--
/// summary=P&C
Method OldsingleExpression89Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle("--",.value)) { quit 0 /* normal */ /*4*/ }
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
		set ok=0 ; normal rollback
	}
	quit ok
}

/// '+' single_Expression
/// summary values:+
/// summary=P&C
Method OldsingleExpression90Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle("+",.value)) { quit 0 /* normal */ /*4*/ }
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
		set ok=0 ; normal rollback
	}
	quit ok
}

/// '-' single_Expression
/// summary values:-
/// summary=P&C
Method OldsingleExpression91Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle("-",.value)) { quit 0 /* normal */ /*4*/ }
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
		set ok=0 ; normal rollback
	}
	quit ok
}

/// '~' single_Expression
/// summary values:~
/// summary=P&C
Method OldsingleExpression92Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle("~",.value)) { quit 0 /* normal */ /*4*/ }
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
		set ok=0 ; normal rollback
	}
	quit ok
}

/// '!' single_Expression
/// summary values:!
/// summary=P&C
Method OldsingleExpression93Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle("!",.value)) { quit 0 /* normal */ /*4*/ }
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
		set ok=0 ; normal rollback
	}
	quit ok
}

/// "Await" single_Expression
/// summary values:AWAIT
/// summary=K&C
Method OldsingleExpression94Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&C
	if '(..isKeyword("AWAIT",.value)) { quit 0 /* normal */ }
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
		set ok=0 ; normal rollback
	}
	quit ok
}

///  single_Expression '**' single_Expression
/// summary=C&P&C
Method OldsingleExpression95Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		set ok=0 ; normal rollback
	}
	quit ok
}

///  single_Expression ('*' | '/' | '%') single_Expression
/// summary=C&(P|P|P)&C
Method OldsingleExpression96Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&(P|P|P)&C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SingleExpression(.subElement,.addedElement)  {
		if ..OldsingleExpression97Sub(.subElement,.addedElement)  {
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
		set ok=0 ; normal rollback
	}
	quit ok
}

/// '*' | '/' | '%'
/// summary values:*,/,%
/// summary=P|P|P
Method OldsingleExpression97Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P|P|P
	if '(..isStringInList($lb("*","/","%"),1,.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addPunctuation(.subElement,"*")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"/")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"%")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  single_Expression ('+' | '-') single_Expression
/// summary=C&(P|P)&C
Method OldsingleExpression98Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&(P|P)&C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SingleExpression(.subElement,.addedElement)  {
		if ..OldsingleExpression99Sub(.subElement,.addedElement)  {
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
		set ok=0 ; normal rollback
	}
	quit ok
}

/// '+' | '-'
/// summary values:+,-
/// summary=P|P
Method OldsingleExpression99Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P|P
	if '(..isStringInList($lb("+","-"),1,.value)) { quit 0 /* normal */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addPunctuation(.subElement,"+")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"-")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
	} elseif ..Primary129Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Primary132Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Primary133Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Primary136Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Primary137Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Primary138Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Primary139Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Primary140Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Primary141Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Primary142Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Primary143Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Primary144Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Primary145Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Macro(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Primary148Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Primary151Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..addKeyword(.subElement,"SUPER")  {
		set done=1 ; or
	} elseif ..Literal(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Primary154Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ObjectLiteral(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Primary157Sub(.subElement,.addedElement)  {
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

/// '[' expression_sequence ']' (member_expression_part)*
/// summary values:[
/// summary=P&C&P&(?4punctuation:4?)*
Method Primary129Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&P&(?4punctuation:4?)*
	; first rule summary P
	if '(..isStringSingle("[",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"[")  {
		if ..ExpressionSequence(.subElement,.addedElement)  {
			if ..addPunctuation(.subElement,"]")  {
				if ..Primary130RepZero(.subElement,.addedElement)  {
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
	quit ok
}

///  (member_expression_part)*
Method Primary130RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..Primary131Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// member_expression_part
/// summary=C
Method Primary131Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C
	set subElement=ParentElement
	set done=0 ; method start
	if ..MemberExpressionPart(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  'Class' identifier? class_Tail
/// summary values:CLASS
/// summary=K&?4OptionalSingle4?&C
Method Primary132Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&?4OptionalSingle4?&C
	if '(..isKeyword("CLASS",.value)) { quit 0 /* normal */ }
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
		set ok=0 ; normal rollback
	}
	quit ok
}

///  "New" identifier arguments (member_expression_part)*
/// summary values:NEW
/// summary=K&C&C&(?4punctuation:4?)*
Method Primary133Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&C&C&(?4punctuation:4?)*
	if '(..isKeyword("NEW",.value)) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"NEW")  {
		if ..Identifier(.subElement,.addedElement)  {
			if ..Arguments(.subElement,.addedElement)  {
				if ..Primary134RepZero(.subElement,.addedElement)  {
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
	quit ok
}

///  (member_expression_part)*
Method Primary134RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..Primary135Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// member_expression_part
/// summary=C
Method Primary135Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C
	set subElement=ParentElement
	set done=0 ; method start
	if ..MemberExpressionPart(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  "New" single_Expression arguments
/// summary values:NEW
/// summary=K&C&C
Method Primary136Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&C&C
	if '(..isKeyword("NEW",.value)) { quit 0 /* normal */ }
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
		set ok=0 ; normal rollback
	}
	quit ok
}

///  "New" single_Expression
/// summary values:NEW
/// summary=K&C
Method Primary137Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&C
	if '(..isKeyword("NEW",.value)) { quit 0 /* normal */ }
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
		set ok=0 ; normal rollback
	}
	quit ok
}

///  "New" '.' identifier
/// summary values:NEW
/// summary=K&P&C
Method Primary138Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&P&C
	if '(..isKeyword("NEW",.value)) { quit 0 /* normal */ }
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
		set ok=0 ; normal rollback
	}
	quit ok
}

///  "Delete" single_Expression
/// summary values:DELETE
/// summary=K&C
Method Primary139Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&C
	if '(..isKeyword("DELETE",.value)) { quit 0 /* normal */ }
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
		set ok=0 ; normal rollback
	}
	quit ok
}

///  "Void" single_Expression
/// summary values:VOID
/// summary=K&C
Method Primary140Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&C
	if '(..isKeyword("VOID",.value)) { quit 0 /* normal */ }
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
		set ok=0 ; normal rollback
	}
	quit ok
}

///  "Typeof" single_Expression
/// summary values:TYPEOF
/// summary=K&C
Method Primary141Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&C
	if '(..isKeyword("TYPEOF",.value)) { quit 0 /* normal */ }
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
		set ok=0 ; normal rollback
	}
	quit ok
}

/// "Await" single_Expression
/// summary values:AWAIT
/// summary=K&C
Method Primary142Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&C
	if '(..isKeyword("AWAIT",.value)) { quit 0 /* normal */ }
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
		set ok=0 ; normal rollback
	}
	quit ok
}

///  "Import" '(' single_Expression ')'
/// summary values:IMPORT
/// summary=K&P&C&P
Method Primary143Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&P&C&P
	if '(..isKeyword("IMPORT",.value)) { quit 0 /* normal */ }
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
		set ok=0 ; normal rollback
	}
	quit ok
}

///  yield_Statement
/// summary=C
Method Primary144Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C
	set subElement=ParentElement
	set done=0 ; method start
	if ..YieldStatement(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

/// "This" (member_expression_part)*
/// summary values:THIS
/// summary=K&(?4punctuation:4?)*
Method Primary145Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&(?4punctuation:4?)*
	if '(..isKeyword("THIS",.value)) { quit 0 /* normal */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"THIS")  {
		if ..Primary146RepZero(.subElement,.addedElement)  {
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
	quit ok
}

///  (member_expression_part)*
Method Primary146RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..Primary147Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// member_expression_part
/// summary=C
Method Primary147Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C
	set subElement=ParentElement
	set done=0 ; method start
	if ..MemberExpressionPart(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

/// function (member_expression_part)*
/// summary=C&(?4punctuation:4?)*
Method Primary148Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&(?4punctuation:4?)*
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Function(.subElement,.addedElement)  {
		if ..Primary149RepZero(.subElement,.addedElement)  {
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
	quit ok
}

///  (member_expression_part)*
Method Primary149RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..Primary150Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// member_expression_part
/// summary=C
Method Primary150Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C
	set subElement=ParentElement
	set done=0 ; method start
	if ..MemberExpressionPart(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

/// identifier (member_expression_part)*
/// summary=C&(?4punctuation:4?)*
Method Primary151Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&(?4punctuation:4?)*
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Identifier(.subElement,.addedElement)  {
		if ..Primary152RepZero(.subElement,.addedElement)  {
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
	quit ok
}

///  (member_expression_part)*
Method Primary152RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..Primary153Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// member_expression_part
/// summary=C
Method Primary153Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C
	set subElement=ParentElement
	set done=0 ; method start
	if ..MemberExpressionPart(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

/// array_Literal (member_expression_part)*
/// summary=C&(?4punctuation:4?)*
Method Primary154Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&(?4punctuation:4?)*
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ArrayLiteral(.subElement,.addedElement)  {
		if ..Primary155RepZero(.subElement,.addedElement)  {
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
	quit ok
}

///  (member_expression_part)*
Method Primary155RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..Primary156Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// member_expression_part
/// summary=C
Method Primary156Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C
	set subElement=ParentElement
	set done=0 ; method start
	if ..MemberExpressionPart(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

/// '(' expression_Sequence ')' (member_expression_part)*
/// summary values:(
/// summary=P&C&P&(?4punctuation:4?)*
Method Primary157Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&P&(?4punctuation:4?)*
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if ..ExpressionSequence(.subElement,.addedElement)  {
			if ..addPunctuation(.subElement,")")  {
				if ..Primary158RepZero(.subElement,.addedElement)  {
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
	quit ok
}

///  (member_expression_part)*
Method Primary158RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..Primary159Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// member_expression_part
/// summary=C
Method Primary159Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C
	set subElement=ParentElement
	set done=0 ; method start
	if ..MemberExpressionPart(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  private_Identifier ::= '#' identifier_Name
/// summary values:#
/// summary=P&C
Method PrivateIdentifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle("#",.value)) { quit 0 /* normal */ /*4*/ }
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
		set ok=0 ; normal rollback
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
	if ..PropertyAssignment61Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..PropertyAssignment62Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..PropertyAssignment63Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..PropertyAssignment64Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..PropertyAssignment65Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..PropertyAssignment66Sub(.subElement,.addedElement)  {
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

/// property_Name ':' single_Expression
/// summary=C&P&C
Method PropertyAssignment61Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&P&C
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
		set ok=0 ; normal rollback
	}
	quit ok
}

/// '[' single_Expression ']' ':' single_Expression
/// summary values:[
/// summary=P&C&P&P&C
Method PropertyAssignment62Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&P&P&C
	; first rule summary P
	if '(..isStringSingle("[",.value)) { quit 0 /* normal */ /*4*/ }
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
		set ok=0 ; normal rollback
	}
	quit ok
}

/// [ "Async" ] ['*'] property_Name '(' [formal_Parameter_List] ')' function_Body
/// summary=[K]&[P]&C&P&[C]&P&C
Method PropertyAssignment63Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		set ok=0 ; normal rollback
	}
	quit ok
}

/// getter '(' ')' function_Body
/// summary=C&P&P&C
Method PropertyAssignment64Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		set ok=0 ; normal rollback
	}
	quit ok
}

/// setter '(' formal_Parameter_Arg ')' function_Body
/// summary=C&P&C&P&C
Method PropertyAssignment65Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		set ok=0 ; normal rollback
	}
	quit ok
}

/// [Ellipsis] single_Expression
/// summary=[C]&C
Method PropertyAssignment66Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		set ok=0 ; normal rollback
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
	} elseif ..PropertyName67Sub(.subElement,.addedElement)  {
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

/// '[' single_Expression ']'
/// summary values:[
/// summary=P&C&P
Method PropertyName67Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C&P
	; first rule summary P
	if '(..isStringSingle("[",.value)) { quit 0 /* normal */ /*4*/ }
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
	if '(..isKeyword("RETURN",.value)) { quit 0 /* normal */ }
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
	if '(..isKeyword("SET",.value)) { quit 0 /* normal */ }
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
		set ok=0 ; normal rollback
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
	if ..SingleExpression120Sub(.subElement,.addedElement)  {
		if ..SingleExpression123OptGrp(.subElement,.addedElement)  {
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

/// factor ( dyadicop factor )*
/// summary=C&(?4punctuation:4?)*
Method SingleExpression120Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&(?4punctuation:4?)*
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Factor(.subElement,.addedElement)  {
		if ..SingleExpression121RepZero(.subElement,.addedElement)  {
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
	quit ok
}

///  ( dyadicop factor )*
Method SingleExpression121RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..SingleExpression122Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  dyadicop factor
/// summary=C&C
Method SingleExpression122Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		set ok=0 ; normal rollback
	}
	quit ok
}

/// 
/// summary values:--,++
/// summary=P|P
Method SingleExpression123OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P|P
	if '(..isStringInList($lb("--","++"),2,.value)) { quit 1 /* not found is OK */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addPunctuation(.subElement,"--")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"++")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=1 /* failure rollsback but returns OK */
	}
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
		set ok=0 ; normal rollback
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
	if ..SourceElements58RepZero(.subElement,.addedElement)  {
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

///  source_Element*
Method SourceElements58RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4Call:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..SourceElement(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
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
	if ..StatementListMandatory2RepOne(.subElement,.addedElement)  {
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

///  statement+
Method StatementListMandatory2RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4Call:4?
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..Statement(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
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
		set ok=0 ; normal rollback
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
	if '(..isKeyword("SWITCH",.value)) { quit 0 /* normal */ }
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
		set ok=0 ; normal rollback
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
	if '(..isKeyword("THROW",.value)) { quit 0 /* normal */ }
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
		set ok=0 ; normal rollback
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
	if '(..isKeyword("TRY",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"TRY")  {
		if ..Block(.subElement,.addedElement)  {
			if ..TryStatement39Sub(.subElement,.addedElement)  {
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

/// (catch_Production [finally_Production]) | finally_Production
/// summary=(C&[C])|C
Method TryStatement39Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary (C&[C])|C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..TryStatement40Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..FinallyProduction(.subElement,.addedElement)  {
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

/// catch_Production [finally_Production]
/// summary=C&[C]
Method TryStatement40Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
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
		set ok=0 ; normal rollback
	}
	quit ok
}

///  var_Modifier ::= "Var" | "let" | "Const"
/// summary values:VAR,LET,CONST
/// summary=K|K|K
Method VarModifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K|K|K
	if '(..isKeywordInList($lb("VAR","LET","CONST"),.value)) { quit 0 /* normal */ }
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
		set ok=0 ; normal rollback
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
		if $S(..VariableDeclaration20Sub(.subElement,.addedElement) :1,1:1) {
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

/// '=' single_Expression
/// summary values:=
/// summary=P&C
Method VariableDeclaration20Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle("=",.value)) { quit 0 /* normal */ /*4*/ }
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
		set ok=0 ; normal rollback
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
			if ..VariableDeclarationList18RepZero(.subElement,.addedElement)  {
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

///  (',' variable_Declaration)*
Method VariableDeclarationList18RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..VariableDeclarationList19Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// ',' variable_Declaration
/// summary values:,
/// summary=P&C
Method VariableDeclarationList19Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
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
		set ok=0 ; normal rollback
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
		set ok=0 ; normal rollback
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
	if '(..isKeyword("WITH",.value)) { quit 0 /* normal */ }
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
		set ok=0 ; normal rollback
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
	if '(..isKeyword("YIELD",.value)) { quit 0 /* normal */ }
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
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

Method newElement(Type As %String) As PXW.DEV.BNF.Elements.JS
{
	quit ##class(PXW.DEV.BNF.Elements.JS).%New(Type)
}

}
