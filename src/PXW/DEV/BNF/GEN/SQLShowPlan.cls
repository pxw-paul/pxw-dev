/// Created: 2025-12-24 17:24:46 PXW.DEV.BNF.Compilers.Compiler1
Class PXW.DEV.BNF.GEN.SQLShowPlan Extends PXW.DEV.BNF.super [ ProcedureBlock ]
{

Parameter KeywordPattern = "1.A";

Parameter Keywords = "AND,BITMAP,EACH,EXTENT,FOR,ID,INDEX,LOOPING,MAP,MASTER,MODULE,MODULES,ON,READ,SUBQUERIES,SUBQUERY,TABLE";

///  alias_name ::= IDENTIFIER
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
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  alias_property ::= alias_name NOSPACE '.' NOSPACE property_name
/// summary=C&C&P&C&C
Method AliasProperty(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&C&P&C&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..AliasName(.subElement,.addedElement)  {
		if ..Nospace(.subElement,.addedElement)  {
			if ..addPunctuation(.subElement,".")  {
				if ..Nospace(.subElement,.addedElement)  {
					if ..PropertyName(.subElement,.addedElement)  {
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

///  attribute ::= identifier '=' STRING
/// summary=C&P&C
Method Attribute(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&P&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Identifier(.subElement,.addedElement)  {
		if ..addPunctuation(.subElement,"=")  {
			if ..String(.subElement,.addedElement)  {
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

///  call_module ::= 'module' module_name
/// summary values:MODULE
/// summary=K&C
Method CallModule(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C
	if '(..isKeyword("MODULE",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"MODULE")  {
		if ..ModuleName(.subElement,.addedElement)  {
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

///  call_modules ::= 'modules' module_name ( ',' ['and'] module_name )* ['and' module_name]
/// summary values:MODULES
/// summary=K&C&(?4punctuation:4?)*&[K&C]
Method CallModules(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C&(?4punctuation:4?)*&[K&C]
	if '(..isKeyword("MODULES",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"MODULES")  {
		if ..ModuleName(.subElement,.addedElement)  {
			if ..CallModules24RepZero(.subElement,.addedElement)  {
				if ..CallModules26OptGrp(.subElement,.addedElement)  {
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

///  ( ',' ['and'] module_name )*
Method CallModules24RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..CallModules25Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' ['and'] module_name
/// summary values:,
/// summary=P&[K]&C
Method CallModules25Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&[K]&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if $S(..addKeyword(.subElement,"AND") :1,1:1) {
			if ..ModuleName(.subElement,.addedElement)  {
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
/// summary values:AND
/// summary=K&C
Method CallModules26OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&C
	if '(..isKeyword("AND",.value)) { quit 1 /* not found is OK */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"AND")  {
		if ..ModuleName(.subElement,.addedElement)  {
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

///  call_subqueries ::= 'subqueries' subquery_name ( ',' ['and'] subquery_name )* ['and' subquery_name]
/// summary values:SUBQUERIES
/// summary=K&C&(?4punctuation:4?)*&[K&C]
Method CallSubqueries(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C&(?4punctuation:4?)*&[K&C]
	if '(..isKeyword("SUBQUERIES",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"SUBQUERIES")  {
		if ..SubqueryName(.subElement,.addedElement)  {
			if ..CallSubqueries27RepZero(.subElement,.addedElement)  {
				if ..CallSubqueries29OptGrp(.subElement,.addedElement)  {
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

///  ( ',' ['and'] subquery_name )*
Method CallSubqueries27RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..CallSubqueries28Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  ',' ['and'] subquery_name
/// summary values:,
/// summary=P&[K]&C
Method CallSubqueries28Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&[K]&C
	; first rule summary P
	if '(..isStringSingle(",",.value)) { quit 0 /* normal */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,",")  {
		if $S(..addKeyword(.subElement,"AND") :1,1:1) {
			if ..SubqueryName(.subElement,.addedElement)  {
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
/// summary values:AND
/// summary=K&C
Method CallSubqueries29OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary K&C
	if '(..isKeyword("AND",.value)) { quit 1 /* not found is OK */ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"AND")  {
		if ..SubqueryName(.subElement,.addedElement)  {
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

///  call_subquery ::= 'subquery' subquery_name
/// summary values:SUBQUERY
/// summary=K&C
Method CallSubquery(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C
	if '(..isKeyword("SUBQUERY",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"SUBQUERY")  {
		if ..SubqueryName(.subElement,.addedElement)  {
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

///  content ::= newline | plan | sql_section | warning_section | cost_section | frozen_section | info_section | for_each | table | subquery_section | module_section | read_index | read_bitmap_index | read_extent_bitmap | read_master_scan | read_master | call_modules | call_module | call_subqueries | call_subquery | alias_property | word | punctuation
/// summary=C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C
Method Content(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Newline(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Plan(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SqlSection(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..WarningSection(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CostSection(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..FrozenSection(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..InfoSection(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ForEach(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Table(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..SubquerySection(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ModuleSection(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ReadIndex(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ReadBitmapIndex(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ReadExtentBitmap(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ReadMasterScan(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..ReadMaster(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CallModules(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CallModule(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CallSubqueries(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..CallSubquery(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..AliasProperty(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Word(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Punctuation(.subElement,.addedElement)  {
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

///  cost_section ::= '<cost' attribute* '/>'
/// summary values:<COST
/// summary=P&(?4Call:4?)*&P
Method CostSection(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&(?4Call:4?)*&P
	; first rule summary P
	if '(..isStringSingle("<COST",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"<cost")  {
		if ..CostSection15RepZero(.subElement,.addedElement)  {
			if ..addPunctuation(.subElement,"/>")  {
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

///  attribute*
Method CostSection15RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4Call:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..Attribute(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  for_each ::= 'for' 'each' (word)* ':' for_each_content
/// summary values:FOR
/// summary=K&K&(?4punctuation:4?)*&P&C
Method ForEach(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&K&(?4punctuation:4?)*&P&C
	if '(..isKeyword("FOR",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"FOR")  {
		if ..addKeyword(.subElement,"EACH")  {
			if ..ForEach20RepZero(.subElement,.addedElement)  {
				if ..addPunctuation(.subElement,":")  {
					if ..ForEachContent(.subElement,.addedElement)  {
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

///  (word)*
Method ForEach20RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ForEach21Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// word
/// summary=C
Method ForEach21Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C
	set subElement=ParentElement
	set done=0 ; method start
	if ..Word(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=0 ; normal rollback
	}
	quit ok
}

///  for_each_content ::= newline INDENT (!OUTDENT [ content ] )*
/// summary=C&C&(?4punctuation:4?)*
Method ForEachContent(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&C&(?4punctuation:4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Newline(.subElement,.addedElement)  {
		if ..Indent(.subElement,.addedElement)  {
			if ..ForEachContent22RepZero(.subElement,.addedElement)  {
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

///  (!OUTDENT [ content ] )*
Method ForEachContent22RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ForEachContent23Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// !OUTDENT [ content ]
/// summary=?4NotRule4?&[C]
Method ForEachContent23Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4NotRule4?&[C]
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if '..Outdent(.subElement,.addedElement)  {
		if $S(..Content(.subElement,.addedElement) :1,1:1) {
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

///  frozen_section ::= '<frozenPlan' attribute* '/>'
/// summary values:<FROZENPLAN
/// summary=P&(?4Call:4?)*&P
Method FrozenSection(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&(?4Call:4?)*&P
	; first rule summary P
	if '(..isStringSingle("<FROZENPLAN",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"<frozenPlan")  {
		if ..FrozenSection16RepZero(.subElement,.addedElement)  {
			if ..addPunctuation(.subElement,"/>")  {
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

///  attribute*
Method FrozenSection16RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4Call:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..Attribute(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  IDENTIFIER ::= 'regexp:(\$|\%|[a-zA-Z])[a-zA-Z0-9\_]*'
/// summary=R
Method Identifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary R
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..addRegex(.subElement,"(\$|\%|[a-zA-Z])[a-zA-Z0-9\_]*")  {
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

///  INDENT ::= 'CODE THIS TAKE NOTE OF CURRENT INDENT'
/// summary values:CODE THIS TAKE NOTE OF CURRENT INDENT
/// summary=P
Method Indent(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("CODE THIS TAKE NOTE OF CURRENT INDENT",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"CODE THIS TAKE NOTE OF CURRENT INDENT")  {
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

///  index_name ::= IDENTIFIER
/// summary=C
Method IndexName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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

///  info_section ::= '<info' attribute* '>' (!'</info>' content)* '</info>'
/// summary values:<INFO
/// summary=P&(?4Call:4?)*&P&(?4punctuation:4?)*&P
Method InfoSection(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&(?4Call:4?)*&P&(?4punctuation:4?)*&P
	; first rule summary P
	if '(..isStringSingle("<INFO",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"<info")  {
		if ..InfoSection17RepZero(.subElement,.addedElement)  {
			if ..addPunctuation(.subElement,">")  {
				if ..InfoSection18RepZero(.subElement,.addedElement)  {
					if ..addPunctuation(.subElement,"</info>")  {
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

///  attribute*
Method InfoSection17RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4Call:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..Attribute(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  (!'</info>' content)*
Method InfoSection18RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..InfoSection19Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// !'</info>' content
/// summary=?4NotRule4?&C
Method InfoSection19Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4NotRule4?&C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if '..addPunctuation(.subElement,"</info>")  {
		if ..Content(.subElement,.addedElement)  {
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

///  MODULE_IDENTIFIER ::= 'regexp:(\%|[a-zA-Z0-9])[a-zA-Z0-9\_]*'
/// summary=R
Method ModuleIdentifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary R
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..addRegex(.subElement,"(\%|[a-zA-Z0-9])[a-zA-Z0-9\_]*")  {
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

///  module_name ::= MODULE_IDENTIFIER
/// summary=C
Method ModuleName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ModuleIdentifier(.subElement,.addedElement)  {
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

///  module_section ::= '<module' attribute* '>' (!'</module>' content)* '</module>'
/// summary values:<MODULE
/// summary=P&(?4Call:4?)*&P&(?4punctuation:4?)*&P
Method ModuleSection(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&(?4Call:4?)*&P&(?4punctuation:4?)*&P
	; first rule summary P
	if '(..isStringSingle("<MODULE",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"<module")  {
		if ..ModuleSection12RepZero(.subElement,.addedElement)  {
			if ..addPunctuation(.subElement,">")  {
				if ..ModuleSection13RepZero(.subElement,.addedElement)  {
					if ..addPunctuation(.subElement,"</module>")  {
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

///  attribute*
Method ModuleSection12RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4Call:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..Attribute(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  (!'</module>' content)*
Method ModuleSection13RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..ModuleSection14Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// !'</module>' content
/// summary=?4NotRule4?&C
Method ModuleSection14Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4NotRule4?&C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if '..addPunctuation(.subElement,"</module>")  {
		if ..Content(.subElement,.addedElement)  {
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

///  newline ::= "<NEWLINE>"
/// summary values:<NEWLINE>
/// summary=P
Method Newline(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("<NEWLINE>",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"<NEWLINE>")  {
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

///  NOSPACE ::= 'CODE THIS TO ENSURE NO SPACE'
/// summary values:CODE THIS TO ENSURE NO SPACE
/// summary=P
Method Nospace(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("CODE THIS TO ENSURE NO SPACE",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"CODE THIS TO ENSURE NO SPACE")  {
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

///  OUTDENT ::= 'CODE THIS TAKE NOTE OF CURRENT INDENT'
/// summary values:CODE THIS TAKE NOTE OF CURRENT INDENT
/// summary=P
Method Outdent(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("CODE THIS TAKE NOTE OF CURRENT INDENT",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"CODE THIS TAKE NOTE OF CURRENT INDENT")  {
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

///  plan ::= '<plan>' (!'</plan>' content)* '</plan>'
/// summary values:<PLAN>
/// summary=P&(?4punctuation:4?)*&P
Method Plan(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&(?4punctuation:4?)*&P
	; first rule summary P
	if '(..isStringSingle("<PLAN>",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"<plan>")  {
		if ..Plan3RepZero(.subElement,.addedElement)  {
			if ..addPunctuation(.subElement,"</plan>")  {
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

///  (!'</plan>' content)*
Method Plan3RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..Plan4Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// !'</plan>' content
/// summary=?4NotRule4?&C
Method Plan4Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4NotRule4?&C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if '..addPunctuation(.subElement,"</plan>")  {
		if ..Content(.subElement,.addedElement)  {
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

///  plans ::= '<plans>' (!'</plans>' content)* '</plans>'
/// summary values:<PLANS>
/// summary=P&(?4punctuation:4?)*&P
Method Plans(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&(?4punctuation:4?)*&P
	; first rule summary P
	if '(..isStringSingle("<PLANS>",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"<plans>")  {
		if ..Plans1RepZero(.subElement,.addedElement)  {
			if ..addPunctuation(.subElement,"</plans>")  {
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

///  (!'</plans>' content)*
Method Plans1RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..Plans2Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// !'</plans>' content
/// summary=?4NotRule4?&C
Method Plans2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4NotRule4?&C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if '..addPunctuation(.subElement,"</plans>")  {
		if ..Content(.subElement,.addedElement)  {
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

///  property_name ::= IDENTIFIER
/// summary=C
Method PropertyName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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

///  punctuation ::= PUNCTUATION_REGEX
/// summary=C
Method Punctuation(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..PunctuationRegex(.subElement,.addedElement)  {
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

///  PUNCTUATION_REGEX ::= 'regexp:[^\w\s]'
/// summary=R
Method PunctuationRegex(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary R
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..addRegex(.subElement,"[^\w\s]")  {
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

///  read_bitmap_index ::= 'bitmap' 'index' table_index
/// summary values:BITMAP
/// summary=K&K&C
Method ReadBitmapIndex(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&K&C
	if '(..isKeyword("BITMAP",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"BITMAP")  {
		if ..addKeyword(.subElement,"INDEX")  {
			if ..TableIndex(.subElement,.addedElement)  {
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

///  read_extent_bitmap ::= 'extent' 'bitmap' table_index
/// summary values:EXTENT
/// summary=K&K&C
Method ReadExtentBitmap(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&K&C
	if '(..isKeyword("EXTENT",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"EXTENT")  {
		if ..addKeyword(.subElement,"BITMAP")  {
			if ..TableIndex(.subElement,.addedElement)  {
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

///  read_index ::= 'index' 'map' table_index
/// summary values:INDEX
/// summary=K&K&C
Method ReadIndex(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&K&C
	if '(..isKeyword("INDEX",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"INDEX")  {
		if ..addKeyword(.subElement,"MAP")  {
			if ..TableIndex(.subElement,.addedElement)  {
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

///  read_master ::= 'read' 'master' 'map' table_index
/// summary values:READ
/// summary=K&K&K&C
Method ReadMaster(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&K&K&C
	if '(..isKeyword("READ",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"READ")  {
		if ..addKeyword(.subElement,"MASTER")  {
			if ..addKeyword(.subElement,"MAP")  {
				if ..TableIndex(.subElement,.addedElement)  {
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

///  read_master_scan ::= 'read' 'master' 'map' table_index ',' 'looping' 'on' 'ID'
/// summary values:READ
/// summary=K&K&K&C&P&K&K&K
Method ReadMasterScan(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&K&K&C&P&K&K&K
	if '(..isKeyword("READ",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"READ")  {
		if ..addKeyword(.subElement,"MASTER")  {
			if ..addKeyword(.subElement,"MAP")  {
				if ..TableIndex(.subElement,.addedElement)  {
					if ..addPunctuation(.subElement,",")  {
						if ..addKeyword(.subElement,"LOOPING")  {
							if ..addKeyword(.subElement,"ON")  {
								if ..addKeyword(.subElement,"ID")  {
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

///  schema_name ::= IDENTIFIER
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
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  sql_section ::= '<sql>' (!'</sql>' content)* '</sql>'
/// summary values:<SQL>
/// summary=P&(?4punctuation:4?)*&P
Method SqlSection(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&(?4punctuation:4?)*&P
	; first rule summary P
	if '(..isStringSingle("<SQL>",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"<sql>")  {
		if ..SqlSection5RepZero(.subElement,.addedElement)  {
			if ..addPunctuation(.subElement,"</sql>")  {
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

///  (!'</sql>' content)*
Method SqlSection5RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..SqlSection6Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// !'</sql>' content
/// summary=?4NotRule4?&C
Method SqlSection6Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4NotRule4?&C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if '..addPunctuation(.subElement,"</sql>")  {
		if ..Content(.subElement,.addedElement)  {
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

///  STRING ::= 'CODE THIS'
/// summary values:CODE THIS
/// summary=P
Method String(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("CODE THIS",.value)) { quit 0 /* normal */ /*3 */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"CODE THIS")  {
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

///  subquery_name ::= MODULE_IDENTIFIER
/// summary=C
Method SubqueryName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..ModuleIdentifier(.subElement,.addedElement)  {
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

///  subquery_section ::= '<subquery' attribute* '>' (!'</subquery>' content)* '</subquery>'
/// summary values:<SUBQUERY
/// summary=P&(?4Call:4?)*&P&(?4punctuation:4?)*&P
Method SubquerySection(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&(?4Call:4?)*&P&(?4punctuation:4?)*&P
	; first rule summary P
	if '(..isStringSingle("<SUBQUERY",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"<subquery")  {
		if ..SubquerySection9RepZero(.subElement,.addedElement)  {
			if ..addPunctuation(.subElement,">")  {
				if ..SubquerySection10RepZero(.subElement,.addedElement)  {
					if ..addPunctuation(.subElement,"</subquery>")  {
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

///  (!'</subquery>' content)*
Method SubquerySection10RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..SubquerySection11Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// !'</subquery>' content
/// summary=?4NotRule4?&C
Method SubquerySection11Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4NotRule4?&C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if '..addPunctuation(.subElement,"</subquery>")  {
		if ..Content(.subElement,.addedElement)  {
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

///  attribute*
Method SubquerySection9RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4Call:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..Attribute(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  table ::= 'table' schema_name '.' table_name
/// summary values:TABLE
/// summary=K&C&P&C
Method Table(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary K&C&P&C
	if '(..isKeyword("TABLE",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(.subElement,"TABLE")  {
		if ..SchemaName(.subElement,.addedElement)  {
			if ..addPunctuation(.subElement,".")  {
				if ..TableName(.subElement,.addedElement)  {
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

///  table_index ::= schema_name '.' table_name [ table_subscript_imply | table_subscript_alias ] '.' index_name
/// summary=C&P&C&[C|C]&P&C
Method TableIndex(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&P&C&[C|C]&P&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SchemaName(.subElement,.addedElement)  {
		if ..addPunctuation(.subElement,".")  {
			if ..TableName(.subElement,.addedElement)  {
				if ..TableIndex30OptGrp(.subElement,.addedElement)  {
					if ..addPunctuation(.subElement,".")  {
						if ..IndexName(.subElement,.addedElement)  {
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
/// summary=C|C
Method TableIndex30OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C|C
	set subElement=ParentElement
	set done=0 ; method start
	if ..TableSubscriptImply(.subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..TableSubscriptAlias(.subElement,.addedElement)  {
		set done=1 ; end compileRules
	}

	if done {
		set ok=1
	} else {
		set ok=1 /* failure rollsback but returns OK */
	}
	quit ok
}

///  table_name ::= IDENTIFIER
/// summary=C
Method TableName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
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

///  table_subscript_alias ::= '(' alias_name ['.' ( property_name '->')* ] ')'
/// summary values:(
/// summary=P&C&[P&(?4punctuation:4?)*]&P
Method TableSubscriptAlias(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&[P&(?4punctuation:4?)*]&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if ..AliasName(.subElement,.addedElement)  {
			if ..TableSubscriptAlias33OptGrp(.subElement,.addedElement)  {
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
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

/// 
/// summary values:.
/// summary=P&(?4punctuation:4?)*
Method TableSubscriptAlias33OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary P&(?4punctuation:4?)*
	; first rule summary P
	if '(..isStringSingle(".",.value)) { quit 1 /* not found is OK */ /*4*/ }
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,".")  {
		if ..TableSubscriptAlias34RepZero(.subElement,.addedElement)  {
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

///  ( property_name '->')*
Method TableSubscriptAlias34RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..TableSubscriptAlias35Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

///  property_name '->'
/// summary=C&P
Method TableSubscriptAlias35Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&P
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..PropertyName(.subElement,.addedElement)  {
		if ..addPunctuation(.subElement,"->")  {
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

///  table_subscript_imply ::= '(' schema_name '.' table_name '.' (property_name '->')* ')'
/// summary values:(
/// summary=P&C&P&C&P&(?4punctuation:4?)*&P
Method TableSubscriptImply(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&P&C&P&(?4punctuation:4?)*&P
	; first rule summary P
	if '(..isStringSingle("(",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"(")  {
		if ..SchemaName(.subElement,.addedElement)  {
			if ..addPunctuation(.subElement,".")  {
				if ..TableName(.subElement,.addedElement)  {
					if ..addPunctuation(.subElement,".")  {
						if ..TableSubscriptImply31RepZero(.subElement,.addedElement)  {
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
		$$$BNFCOMMIT(subElement,ParentElement)
		set ok=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ok
}

///  (property_name '->')*
Method TableSubscriptImply31RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..TableSubscriptImply32Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// property_name '->'
/// summary=C&P
Method TableSubscriptImply32Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary C&P
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..PropertyName(.subElement,.addedElement)  {
		if ..addPunctuation(.subElement,"->")  {
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

///  warning_section ::= '<warning>' (!'</warning>' content)* '</warning>'
/// summary values:<WARNING>
/// summary=P&(?4punctuation:4?)*&P
Method WarningSection(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&(?4punctuation:4?)*&P
	; first rule summary P
	if '(..isStringSingle("<WARNING>",.value)) { quit 0 /* normal */ /*4*/ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(.subElement,"<warning>")  {
		if ..WarningSection7RepZero(.subElement,.addedElement)  {
			if ..addPunctuation(.subElement,"</warning>")  {
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

///  (!'</warning>' content)*
Method WarningSection7RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4punctuation:4?
	set subElement=ParentElement
	set done=0 ; method start
	while ..WarningSection8Sub(.subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ok=1
	} else {
		set ok=1 /* nothing found is ok in RZ */
	}
	quit ok
}

/// !'</warning>' content
/// summary=?4NotRule4?&C
Method WarningSection8Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	; rules summary ?4NotRule4?&C
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if '..addPunctuation(.subElement,"</warning>")  {
		if ..Content(.subElement,.addedElement)  {
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

///  word ::= WORD_REGEX
/// summary=C
Method Word(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..WordRegex(.subElement,.addedElement)  {
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

///  WORD_REGEX ::= 'regexp:[\w]+'
/// summary=R
Method WordRegex(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary R
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..addRegex(.subElement,"[\w]+")  {
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

///  WORD_REGEX_old ::= 'regexp:(\%|[a-zA-Z])[a-zA-Z0-9]*'
/// summary=R
Method WordRegexOld(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary R
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..addRegex(.subElement,"(\%|[a-zA-Z])[a-zA-Z0-9]*")  {
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

Method newElement(Type As %String) As PXW.DEV.BNF.Element
{
	quit ##class(PXW.DEV.BNF.Element).%New(Type)
}

}
