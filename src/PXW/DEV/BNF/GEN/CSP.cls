/// Created: 2025-11-06 09:14:32 PXW.DEV.BNF.Compilers.Compiler1
Class PXW.DEV.BNF.GEN.CSP Extends PXW.DEV.BNF.super [ ProcedureBlock ]
{

Parameter KeywordPattern = "1.A";

Parameter Keywords = "JAVASCRIPT,LANGUAGE,PUBLIC,SCRIPT,STYLESHEET,TYPE";

///  cos_expression ::= cos_expression_compiletime | cos_expression_runtime | cos_expression_other
/// summary=C|C|C
Method CosExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CosExpressionCompiletime(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CosExpressionRuntime(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CosExpressionOther(.subElement,.addedElement)  {
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

///  csp_attribute ::= ( [ csp_schema ':' ] csp_identifier ['=' ( string | ( number ['%'] ) | ( js_expression ';') | cos_expression | ('#' [text_no_space] ) | csp_identifier | text_no_space) ] ) | cos_expression
/// summary=([C&P]&C&[P&(C|(C&[P])|(C&P)|C|(P&[C])|C|C)])|C
Method CspAttribute(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ([C&P]&C&[P&(C|(C&[P])|(C&P)|C|(P&[C])|C|C)])|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CspAttribute13Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CosExpression(.subElement,.addedElement)  {
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

///  [ csp_schema ':' ] csp_identifier ['=' ( string | ( number ['%'] ) | ( js_expression ';') | cos_expression | ('#' [text_no_space] ) | csp_identifier | text_no_space) ]
/// summary=[C&P]&C&[P&(C|(C&[P])|(C&P)|C|(P&[C])|C|C)]
Method CspAttribute13Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary [C&P]&C&[P&(C|(C&[P])|(C&P)|C|(P&[C])|C|C)]
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CspAttribute14OptGrp(.subElement,.addedElement)  {
		if ..CspIdentifier(.subElement,.addedElement)  {
			if ..CspAttribute15OptGrp(.subElement,.addedElement)  {
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

/// 
/// summary=C&P
Method CspAttribute14OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&P
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CspSchema(.subElement,.addedElement)  {
		if ..addPunctuation(.subElement,":")  {
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
/// summary values:=
/// summary=P&(C|(C&[P])|(C&P)|C|(P&[C])|C|C)
Method CspAttribute15OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&(C|(C&[P])|(C&P)|C|(P&[C])|C|C)
	; first rule summary P
	if '(..isStringSingle("=",.value)) { quit 1 /* not found is OK */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"=")  {
		if ..CspAttribute16Sub(.subElement,.addedElement)  {
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

///  string | ( number ['%'] ) | ( js_expression ';') | cos_expression | ('#' [text_no_space] ) | csp_identifier | text_no_space
/// summary=C|(C&[P])|(C&P)|C|(P&[C])|C|C
Method CspAttribute16Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|(C&[P])|(C&P)|C|(P&[C])|C|C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..String(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CspAttribute17Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CspAttribute18Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CosExpression(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CspAttribute19Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CspIdentifier(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..TextNoSpace(.subElement,.addedElement)  {
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

///  number ['%']
/// summary=C&[P]
Method CspAttribute17Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&[P]
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Number(.subElement,.addedElement)  {
		if $S(..addPunctuation(.subElement,"%") :1,1:1) {
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

///  js_expression ';'
/// summary=C&P
Method CspAttribute18Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&P
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..JsExpression(.subElement,.addedElement)  {
		if ..addPunctuation(.subElement,";")  {
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

/// '#' [text_no_space]
/// summary values:#
/// summary=P&[C]
Method CspAttribute19Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&[C]
	; first rule summary P
	if '(..isStringSingle("#",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"#")  {
		if $S(..TextNoSpace(.subElement,.addedElement) :1,1:1) {
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

///  csp_content ::= text
/// summary=C
Method CspContent(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  csp_doctype ::= '<!DOCTYPE' csp_attribute ['PUBLIC' string string]'>'
/// summary values:<!DOCTYPE
/// summary=P&C&[K&C&C]&P
Method CspDoctype(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&[K&C&C]&P
	; first rule summary P
	if '(..isStringSingle("<!DOCTYPE",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"<!DOCTYPE")  {
		if ..CspAttribute(.subElement,.addedElement)  {
			if ..CspDoctype26OptGrp(.subElement,.addedElement)  {
				if ..addPunctuation(.subElement,">")  {
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
/// summary values:PUBLIC
/// summary=K&C&C
Method CspDoctype26OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&C&C
	if '(..isKeyword("PUBLIC",.value)) { quit 1 /* not found is OK */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"PUBLIC")  {
		if ..String(.subElement,.addedElement)  {
			if ..String(.subElement,.addedElement)  {
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

///  csp_element ::= csp_special_tag | (csp_start_tag ( csp_element | csp_content)* [csp_end_tag]) | csp_empty_tag
/// summary=C|(C&(?4punctuation:4?)*&[C])|C
Method CspElement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|(C&(?4punctuation:4?)*&[C])|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CspSpecialTag(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CspElement5Sub(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CspEmptyTag(.subElement,.addedElement)  {
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

/// csp_start_tag ( csp_element | csp_content)* [csp_end_tag]
/// summary=C&(?4punctuation:4?)*&[C]
Method CspElement5Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&(?4punctuation:4?)*&[C]
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CspStartTag(.subElement,.addedElement)  {
		if ..CspElement6RepZero(.subElement,.addedElement)  {
			if $S(..CspEndTag(.subElement,.addedElement) :1,1:1) {
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

///  ( csp_element | csp_content)*
Method CspElement6RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..CspElement7Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  csp_element | csp_content
/// summary=C|C
Method CspElement7Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..CspElement(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CspContent(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  csp_empty_tag ::= csp_tag_s_a csp_tag_ns_name (csp_attribute )* csp_tag_s_c
/// summary=C&C&(?4punctuation:4?)*&C
Method CspEmptyTag(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&C&(?4punctuation:4?)*&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CspTagSA(.subElement,.addedElement)  {
		if ..CspTagNsName(.subElement,.addedElement)  {
			if ..CspEmptyTag10RepZero(.subElement,.addedElement)  {
				if ..CspTagSC(.subElement,.addedElement)  {
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

///  (csp_attribute )*
Method CspEmptyTag10RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..CspEmptyTag11Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// csp_attribute
/// summary=C
Method CspEmptyTag11Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C
	set subElement=ParentElement
	set done=0 ; method start
	if ..CspAttribute(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  csp_end_tag ::= csp_tag_e_a csp_tag_ns_name csp_tag_e_b
/// summary=C&C&C
Method CspEndTag(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&C&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CspTagEA(.subElement,.addedElement)  {
		if ..CspTagNsName(.subElement,.addedElement)  {
			if ..CspTagEB(.subElement,.addedElement)  {
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

///  csp_identifier ::= identifier
/// summary=C
Method CspIdentifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  csp_javascript ::= csp_tag_s_a 'script' 'language' '=' ('javascript' | '"javascript"' | "'javascript'" ) csp_tag_s_b javascript_body csp_tag_e_a 'script' csp_tag_e_b
/// summary=C&K&K&P&(K|P|P)&C&C&C&K&C
Method CspJavascript(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&K&K&P&(K|P|P)&C&C&C&K&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CspTagSA(.subElement,.addedElement)  {
		if ..addKeyword(.subElement,"SCRIPT")  {
			if ..addKeyword(.subElement,"LANGUAGE")  {
				if ..addPunctuation(.subElement,"=")  {
					if ..CspJavascript27Sub(.subElement,.addedElement)  {
						if ..CspTagSB(.subElement,.addedElement)  {
							if ..JavascriptBody(.subElement,.addedElement)  {
								if ..CspTagEA(.subElement,.addedElement)  {
									if ..addKeyword(.subElement,"SCRIPT")  {
										if ..CspTagEB(.subElement,.addedElement)  {
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
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 'javascript' | '"javascript"' | "'javascript'"
/// summary=K|P|P
Method CspJavascript27Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K|P|P
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"JAVASCRIPT")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"""javascript""")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"'javascript'")  {
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

///  csp_javascript_both ::= csp_tag_s_a 'script' 'language' '=' ('javascript' | '"javascript"' | "'javascript'") 'type' '=' ('"text/javascript"') csp_tag_s_b javascript_body csp_tag_e_a 'script' csp_tag_e_b
/// summary=C&K&K&P&(K|P|P)&K&P&(P)&C&C&C&K&C
Method CspJavascriptBoth(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&K&K&P&(K|P|P)&K&P&(P)&C&C&C&K&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CspTagSA(.subElement,.addedElement)  {
		if ..addKeyword(.subElement,"SCRIPT")  {
			if ..addKeyword(.subElement,"LANGUAGE")  {
				if ..addPunctuation(.subElement,"=")  {
					if ..CspJavascriptBoth29Sub(.subElement,.addedElement)  {
						if ..addKeyword(.subElement,"TYPE")  {
							if ..addPunctuation(.subElement,"=")  {
								if ..CspJavascriptBoth30Sub(.subElement,.addedElement)  {
									if ..CspTagSB(.subElement,.addedElement)  {
										if ..JavascriptBody(.subElement,.addedElement)  {
											if ..CspTagEA(.subElement,.addedElement)  {
												if ..addKeyword(.subElement,"SCRIPT")  {
													if ..CspTagEB(.subElement,.addedElement)  {
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

/// 'javascript' | '"javascript"' | "'javascript'"
/// summary=K|P|P
Method CspJavascriptBoth29Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K|P|P
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"JAVASCRIPT")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"""javascript""")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"'javascript'")  {
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

/// '"text/javascript"'
/// summary values:""TEXT/JAVASCRIPT""
/// summary=P
Method CspJavascriptBoth30Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P
	if '(..isStringSingle("""TEXT/JAVASCRIPT""",.value)) { quit 0 /* normal */ /*3 */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addPunctuation(.subElement,"""text/javascript""")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  csp_javascript_bothopp ::= csp_tag_s_a 'script' 'type' '=' ('"text/javascript"') 'language' '=' ('javascript' | '"javascript"' | "'javascript'" ) csp_tag_s_b javascript_body csp_tag_e_a 'script' csp_tag_e_b
/// summary=C&K&K&P&(P)&K&P&(K|P|P)&C&C&C&K&C
Method CspJavascriptBothopp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&K&K&P&(P)&K&P&(K|P|P)&C&C&C&K&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CspTagSA(.subElement,.addedElement)  {
		if ..addKeyword(.subElement,"SCRIPT")  {
			if ..addKeyword(.subElement,"TYPE")  {
				if ..addPunctuation(.subElement,"=")  {
					if ..CspJavascriptBothopp31Sub(.subElement,.addedElement)  {
						if ..addKeyword(.subElement,"LANGUAGE")  {
							if ..addPunctuation(.subElement,"=")  {
								if ..CspJavascriptBothopp32Sub(.subElement,.addedElement)  {
									if ..CspTagSB(.subElement,.addedElement)  {
										if ..JavascriptBody(.subElement,.addedElement)  {
											if ..CspTagEA(.subElement,.addedElement)  {
												if ..addKeyword(.subElement,"SCRIPT")  {
													if ..CspTagEB(.subElement,.addedElement)  {
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

/// '"text/javascript"'
/// summary values:""TEXT/JAVASCRIPT""
/// summary=P
Method CspJavascriptBothopp31Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P
	if '(..isStringSingle("""TEXT/JAVASCRIPT""",.value)) { quit 0 /* normal */ /*3 */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addPunctuation(.subElement,"""text/javascript""")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

/// 'javascript' | '"javascript"' | "'javascript'"
/// summary=K|P|P
Method CspJavascriptBothopp32Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K|P|P
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"JAVASCRIPT")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"""javascript""")  {
		set done=1 ; or
	} elseif ..addPunctuation(.subElement,"'javascript'")  {
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

///  csp_javascript_by_default ::= csp_tag_s_a 'script' csp_tag_s_b javascript_body csp_tag_e_a 'script' csp_tag_e_b
/// summary=C&K&C&C&C&K&C
Method CspJavascriptByDefault(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&K&C&C&C&K&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CspTagSA(.subElement,.addedElement)  {
		if ..addKeyword(.subElement,"SCRIPT")  {
			if ..CspTagSB(.subElement,.addedElement)  {
				if ..JavascriptBody(.subElement,.addedElement)  {
					if ..CspTagEA(.subElement,.addedElement)  {
						if ..addKeyword(.subElement,"SCRIPT")  {
							if ..CspTagEB(.subElement,.addedElement)  {
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

///  csp_javascript_text ::= csp_tag_s_a 'script' 'type' '=' ('"text/javascript"') csp_tag_s_b javascript_body csp_tag_e_a 'script' csp_tag_e_b
/// summary=C&K&K&P&(P)&C&C&C&K&C
Method CspJavascriptText(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&K&K&P&(P)&C&C&C&K&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CspTagSA(.subElement,.addedElement)  {
		if ..addKeyword(.subElement,"SCRIPT")  {
			if ..addKeyword(.subElement,"TYPE")  {
				if ..addPunctuation(.subElement,"=")  {
					if ..CspJavascriptText28Sub(.subElement,.addedElement)  {
						if ..CspTagSB(.subElement,.addedElement)  {
							if ..JavascriptBody(.subElement,.addedElement)  {
								if ..CspTagEA(.subElement,.addedElement)  {
									if ..addKeyword(.subElement,"SCRIPT")  {
										if ..CspTagEB(.subElement,.addedElement)  {
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
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// '"text/javascript"'
/// summary values:""TEXT/JAVASCRIPT""
/// summary=P
Method CspJavascriptText28Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P
	if '(..isStringSingle("""TEXT/JAVASCRIPT""",.value)) { quit 0 /* normal */ /*3 */ }
	set subElement=ParentElement
	set done=0 ; method start
	if ..addPunctuation(.subElement,"""text/javascript""")  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  csp_page ::= (csp_xml | csp_xml_question | csp_element | csp_end_tag | csp_content )*
/// summary=(?4punctuation:4?)*
Method CspPage(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CspPage1RepZero(.subElement,.addedElement)  {
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

///  (csp_xml | csp_xml_question | csp_element | csp_end_tag | csp_content )*
Method CspPage1RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..CspPage2Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// csp_xml | csp_xml_question | csp_element | csp_end_tag | csp_content
/// summary=C|C|C|C|C
Method CspPage2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C|C|C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..CspXml(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CspXmlQuestion(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CspElement(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CspEndTag(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CspContent(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  csp_page_mandatory ::= (csp_xml | csp_xml_question | csp_element | csp_end_tag | csp_content )+
/// summary=(?4punctuation:4?)+
Method CspPageMandatory(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (?4punctuation:4?)+
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CspPageMandatory3RepOne(.subElement,.addedElement)  {
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

///  (csp_xml | csp_xml_question | csp_element | csp_end_tag | csp_content )+
Method CspPageMandatory3RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..CspPageMandatory4Sub(.subElement,.addedElement)  {
		set done=1
		$$$DEBUG("CSPMAND 3rep "_done)
	}
	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

/// csp_xml | csp_xml_question | csp_element | csp_end_tag | csp_content
/// summary=C|C|C|C|C
Method CspPageMandatory4Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	$$$DEBUG("CspPageMandatory4Sub called;"_..peek(20))
	; rules summary C|C|C|C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..CspXml(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CspXmlQuestion(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CspElement(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CspEndTag(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CspContent(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}
	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  csp_schema ::= csp_identifier | cos_expression
/// summary=C|C
Method CspSchema(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CspIdentifier(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CosExpression(.subElement,.addedElement)  {
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

///  csp_special_tag ::= csp_doctype | csp_javascript | csp_javascript_text | csp_javascript_both | csp_javascript_bothopp | csp_javascript_by_default | cos_expression
/// summary=C|C|C|C|C|C|C
Method CspSpecialTag(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C|C|C|C|C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CspDoctype(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CspJavascript(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CspJavascriptText(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CspJavascriptBoth(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CspJavascriptBothopp(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CspJavascriptByDefault(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CosExpression(.subElement,.addedElement)  {
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

///  csp_start_tag ::= csp_tag_s_a csp_tag_ns_name (csp_attribute )* csp_tag_s_b
/// summary=C&C&(?4punctuation:4?)*&C
Method CspStartTag(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&C&(?4punctuation:4?)*&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CspTagSA(.subElement,.addedElement)  {
		if ..CspTagNsName(.subElement,.addedElement)  {
			if ..CspStartTag8RepZero(.subElement,.addedElement)  {
				if ..CspTagSB(.subElement,.addedElement)  {
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

///  (csp_attribute )*
Method CspStartTag8RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..CspStartTag9Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// csp_attribute
/// summary=C
Method CspStartTag9Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C
	set subElement=ParentElement
	set done=0 ; method start
	if ..CspAttribute(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  csp_tag_e_a ::= '</'
/// summary values:</
/// summary=P
Method CspTagEA(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("</",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"</")  {
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

///  csp_tag_e_b ::= '>'
/// summary values:>
/// summary=P
Method CspTagEB(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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

///  csp_tag_name ::= csp_identifier | cos_expression
/// summary=C|C
Method CspTagName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CspIdentifier(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CosExpression(.subElement,.addedElement)  {
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

///  csp_tag_ns_name ::= [ csp_schema ':'] csp_tag_name
/// summary=[C&P]&C
Method CspTagNsName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary [C&P]&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CspTagNsName12OptGrp(.subElement,.addedElement)  {
		if ..CspTagName(.subElement,.addedElement)  {
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
Method CspTagNsName12OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&P
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CspSchema(.subElement,.addedElement)  {
		if ..addPunctuation(.subElement,":")  {
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

///  csp_tag_s_a ::= '<'
/// summary values:<
/// summary=P
Method CspTagSA(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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

///  csp_tag_s_b ::= '>'
/// summary values:>
/// summary=P
Method CspTagSB(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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

///  csp_tag_s_c ::= '/>'
/// summary values:/>
/// summary=P
Method CspTagSC(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("/>",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"/>")  {
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

///  csp_xml ::= csp_tag_s_a '?xml' ['-' 'stylesheet'] (csp_attribute)* '?' csp_tag_s_b
/// summary=C&P&[P&K]&(?4punctuation:4?)*&P&C
Method CspXml(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&P&[P&K]&(?4punctuation:4?)*&P&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CspTagSA(.subElement,.addedElement)  {
		if ..addPunctuation(.subElement,"?xml")  {
			if ..CspXml20OptGrp(.subElement,.addedElement)  {
				if ..CspXml21RepZero(.subElement,.addedElement)  {
					if ..addPunctuation(.subElement,"?")  {
						if ..CspTagSB(.subElement,.addedElement)  {
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
/// summary values:-
/// summary=P&K
Method CspXml20OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&K
	; first rule summary P
	if '(..isStringSingle("-",.value)) { quit 1 /* not found is OK */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"-")  {
		if ..addKeyword(.subElement,"STYLESHEET")  {
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

///  (csp_attribute)*
Method CspXml21RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..CspXml22Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// csp_attribute
/// summary=C
Method CspXml22Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C
	set subElement=ParentElement
	set done=0 ; method start
	if ..CspAttribute(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  csp_xml_question ::= csp_tag_s_a '?' identifier ['-' 'stylesheet'] (csp_attribute)* '?' csp_tag_s_b
/// summary=C&P&C&[P&K]&(?4punctuation:4?)*&P&C
Method CspXmlQuestion(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&P&C&[P&K]&(?4punctuation:4?)*&P&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CspTagSA(.subElement,.addedElement)  {
		if ..addPunctuation(.subElement,"?")  {
			if ..Identifier(.subElement,.addedElement)  {
				if ..CspXmlQuestion23OptGrp(.subElement,.addedElement)  {
					if ..CspXmlQuestion24RepZero(.subElement,.addedElement)  {
						if ..addPunctuation(.subElement,"?")  {
							if ..CspTagSB(.subElement,.addedElement)  {
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
/// summary values:-
/// summary=P&K
Method CspXmlQuestion23OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&K
	; first rule summary P
	if '(..isStringSingle("-",.value)) { quit 1 /* not found is OK */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"-")  {
		if ..addKeyword(.subElement,"STYLESHEET")  {
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

///  (csp_attribute)*
Method CspXmlQuestion24RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..CspXmlQuestion25Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// csp_attribute
/// summary=C
Method CspXmlQuestion25Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C
	set subElement=ParentElement
	set done=0 ; method start
	if ..CspAttribute(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  identifier ::= 'NEEDS IDENTIFIER'
/// summary values:NEEDS IDENTIFIER
/// summary=P
Method Identifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("NEEDS IDENTIFIER",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"NEEDS IDENTIFIER")  {
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

///  javascript_body ::= 'NEEDS JS BODY'
/// summary values:NEEDS JS BODY
/// summary=P
Method JavascriptBody(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("NEEDS JS BODY",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"NEEDS JS BODY")  {
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

///  js_expression ::= 'NEEDS JS EXPRESSION'
/// summary values:NEEDS JS EXPRESSION
/// summary=P
Method JsExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("NEEDS JS EXPRESSION",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"NEEDS JS EXPRESSION")  {
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

///  number ::= 'NEEDS NUMBER'
/// summary values:NEEDS NUMBER
/// summary=P
Method Number(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("NEEDS NUMBER",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"NEEDS NUMBER")  {
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

///  string ::= 'NEEDS STRING'
/// summary values:NEEDS STRING
/// summary=P
Method String(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("NEEDS STRING",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"NEEDS STRING")  {
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

///  text ::= 'NEEDS TEXT'
/// summary values:NEEDS TEXT
/// summary=P
Method Text(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("NEEDS TEXT",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"NEEDS TEXT")  {
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

///  text_no_space ::= 'NEEDS TEXT'
/// summary values:NEEDS TEXT
/// summary=P
Method TextNoSpace(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("NEEDS TEXT",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"NEEDS TEXT")  {
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

Method newElement(Type As %String) As PXW.DEV.BNF.Element
{
	quit ##class(PXW.DEV.BNF.Element).%New(Type)
}

}
