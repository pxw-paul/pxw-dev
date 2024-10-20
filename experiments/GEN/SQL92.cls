/// Created: 2024-10-06 15:12:17 PXW.DEV.BNF.Compilers.Compiler3
Class PXW.DEV.BNF.GEN.SQL92 Extends PXW.DEV.BNF.super [ ProcedureBlock ]
{

Parameter KeywordPattern = "1.A";

Parameter Keywords;

///  action ::= SELECT | DELETE | INSERT [ left paren privilege column list right paren ] | UPDATE [ left paren privilege column list right paren ] | REFERENCES [ left paren privilege column list right paren ] | USAGE
Method Action(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"SELECT")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"DELETE")  {
			s done=1 ; or
		} elseif ..Action240Or(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..Action242Or(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..Action244Or(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"USAGE")  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method Action240Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"INSERT")  && ..Action241OptGrp(subElement,.addedElement)  {
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

Method Action241OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LeftParen(subElement,.addedElement)  && ..PrivilegeColumnList(subElement,.addedElement)  && ..RightParen(subElement,.addedElement)  {
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

Method Action242Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"UPDATE")  && ..Action243OptGrp(subElement,.addedElement)  {
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

Method Action243OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LeftParen(subElement,.addedElement)  && ..PrivilegeColumnList(subElement,.addedElement)  && ..RightParen(subElement,.addedElement)  {
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

Method Action244Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"REFERENCES")  && ..Action245OptGrp(subElement,.addedElement)  {
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

Method Action245OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LeftParen(subElement,.addedElement)  && ..PrivilegeColumnList(subElement,.addedElement)  && ..RightParen(subElement,.addedElement)  {
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

///  action list ::= action [ { comma action }... ]
Method ActionList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..Action(subElement,.addedElement)  && $S(..ActionList238RepOne(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  { comma action }...
Method ActionList238RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..ActionList239Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  comma action
Method ActionList239Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Comma(subElement,.addedElement)  && ..Action(subElement,.addedElement)  {
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

///  actual identifier ::= regular identifier | delimited identifier
Method ActualIdentifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..RegularIdentifier(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..DelimitedIdentifier(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  Ada assignment operator ::= colonequals operator
Method AdaAssignmentOperator(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..Colon(subElement,.addedElement)  && ..EqualsOperator(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  Ada host identifier ::= !! See syntax rules
Method AdaHostIdentifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addPunctuation(subElement,"!!")  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  Ada initial value ::= Ada assignment operator character representation
Method AdaInitialValue(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..AdaAssignmentOperator(subElement,.addedElement)  && ..CharacterRepresentation(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  Ada qualified type specification ::= SQL_STANDARD.CHAR [ CHARACTER SET [ IS ] character set specification ] left paren 1 double period length right paren | SQL_STANDARD.BIT left paren 1 double period length right paren | SQL_STANDARD.SMALLINT | SQL_STANDARD.INT | SQL_STANDARD.REAL | SQL_STANDARD.DOUBLE_PRECISION | SQL_STANDARD.SQLCODE_TYPE | SQL_STANDARD.SQLSTATE_TYPE | SQL_STANDARD.INDICATOR_TYPE
Method AdaQualifiedTypeSpecification(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addPunctuation(subElement,"SQL_STANDARD.CHAR")  && ..AdaQualifiedTypeSpecification313OptGrp(subElement,.addedElement)  && ..LeftParen(subElement,.addedElement)  && ..addPunctuation(subElement,"1")  && ..DoublePeriod(subElement,.addedElement)  && ..Length(subElement,.addedElement)  && ..RightParen(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..AdaQualifiedTypeSpecification314Or(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"SQL_STANDARD.SMALLINT")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"SQL_STANDARD.INT")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"SQL_STANDARD.REAL")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"SQL_STANDARD.DOUBLE_PRECISION")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"SQL_STANDARD.SQLCODE_TYPE")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"SQL_STANDARD.SQLSTATE_TYPE")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"SQL_STANDARD.INDICATOR_TYPE")  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method AdaQualifiedTypeSpecification313OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"CHARACTER")  && ..addKeyword(subElement,"SET")  && $S(..addKeyword(subElement,"IS") :1,1:1) && ..CharacterSetSpecification(subElement,.addedElement)  {
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

Method AdaQualifiedTypeSpecification314Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"SQL_STANDARD.BIT")  && ..LeftParen(subElement,.addedElement)  && ..addPunctuation(subElement,"1")  && ..DoublePeriod(subElement,.addedElement)  && ..Length(subElement,.addedElement)  && ..RightParen(subElement,.addedElement)  {
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

///  Ada type specification ::= Ada qualified type specification | Ada unqualified type specification
Method AdaTypeSpecification(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..AdaQualifiedTypeSpecification(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..AdaUnqualifiedTypeSpecification(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  Ada unqualified type specification ::= CHAR left paren 1 double period length right paren | BIT left paren 1 double period length right paren | SMALLINT | INT | REAL | DOUBLE_PRECISION | SQLCODE_TYPE | SQLSTATE_TYPE | INDICATOR_TYPE
Method AdaUnqualifiedTypeSpecification(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"CHAR")  && ..LeftParen(subElement,.addedElement)  && ..addPunctuation(subElement,"1")  && ..DoublePeriod(subElement,.addedElement)  && ..Length(subElement,.addedElement)  && ..RightParen(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..AdaUnqualifiedTypeSpecification315Or(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"SMALLINT")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"INT")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"REAL")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"DOUBLE_PRECISION")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"SQLCODE_TYPE")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"SQLSTATE_TYPE")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"INDICATOR_TYPE")  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method AdaUnqualifiedTypeSpecification315Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"BIT")  && ..LeftParen(subElement,.addedElement)  && ..addPunctuation(subElement,"1")  && ..DoublePeriod(subElement,.addedElement)  && ..Length(subElement,.addedElement)  && ..RightParen(subElement,.addedElement)  {
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

///  Ada variable definition ::= Ada host identifier [ { comma Ada host identifier }... ] colon Ada type specification [ Ada initial value ]
Method AdaVariableDefinition(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..AdaHostIdentifier(subElement,.addedElement)  && $S(..AdaVariableDefinition311RepOne(subElement,.addedElement) :1,1:1) && ..Colon(subElement,.addedElement)  && ..AdaTypeSpecification(subElement,.addedElement)  && $S(..AdaInitialValue(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  { comma Ada host identifier }...
Method AdaVariableDefinition311RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..AdaVariableDefinition312Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  comma Ada host identifier
Method AdaVariableDefinition312Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Comma(subElement,.addedElement)  && ..AdaHostIdentifier(subElement,.addedElement)  {
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

///  add column definition ::= ADD [ COLUMN ] column definition
Method AddColumnDefinition(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"ADD")  && $S(..addKeyword(subElement,"COLUMN") :1,1:1) && ..ColumnDefinition(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  add domain constraint definition ::= ADD domain constraint
Method AddDomainConstraintDefinition(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"ADD")  && ..DomainConstraint(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  add table constraint definition ::= ADD table constraint definition
Method AddTableConstraintDefinition(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	s done=0,ok=1,pos=..stream.pos,lastpos=pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s ret=($isobject(subElement))
		i ret $$$BNFCOMMITCOPY(subElement,ParentElement)
		q ret
	}
	$$$BNFMEMOSET(pos,"")
	d ..getBookmark(.bm)
	while ok {
	$$$BNFSTART(subElement)
		d ..gotoBookmark(.bm)
		s rec=..AddTableConstraintDefinition256Recurse(subElement,.addedElement)
		i rec,..stream.pos>lastpos {
			$$$BNFMEMOSET(pos,addedElement)
			s done=1,lastpos=..stream.pos
		} else {
			s ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best 
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		i $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	q ret
}

Method AddTableConstraintDefinition256Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(subElement,"ADD")  && ..TableConstraintDefinition(subElement,.addedElement)  {
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

///  all ::= ALL
Method All(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	s done=0,ok=1,pos=..stream.pos,lastpos=pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s ret=($isobject(subElement))
		i ret $$$BNFCOMMITCOPY(subElement,ParentElement)
		q ret
	}
	$$$BNFMEMOSET(pos,"")
	d ..getBookmark(.bm)
	while ok {
	$$$BNFSTART(subElement)
		d ..gotoBookmark(.bm)
		s rec=..All210Recurse(subElement,.addedElement)
		i rec,..stream.pos>lastpos {
			$$$BNFMEMOSET(pos,addedElement)
			s done=1,lastpos=..stream.pos
		} else {
			s ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best 
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		i $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	q ret
}

Method All210Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(subElement,"ALL")  {
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

///  allocate cursor statement ::= ALLOCATE extended cursor name [ INSENSITIVE ] [ SCROLL ] CURSOR FOR extended statement name
Method AllocateCursorStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"ALLOCATE")  && ..ExtendedCursorName(subElement,.addedElement)  && $S(..addKeyword(subElement,"INSENSITIVE") :1,1:1) && $S(..addKeyword(subElement,"SCROLL") :1,1:1) && ..addKeyword(subElement,"CURSOR")  && ..addKeyword(subElement,"FOR")  && ..ExtendedStatementName(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  allocate descriptor statement ::= ALLOCATE DESCRIPTOR descriptor name [ WITH MAX occurrences ]
Method AllocateDescriptorStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"ALLOCATE")  && ..addKeyword(subElement,"DESCRIPTOR")  && ..DescriptorName(subElement,.addedElement)  && ..AllocateDescriptorStatement287OptGrp(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method AllocateDescriptorStatement287OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"WITH")  && ..addKeyword(subElement,"MAX")  && ..Occurrences(subElement,.addedElement)  {
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

///  alter column action ::= set column default clause | drop column default clause
Method AlterColumnAction(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..SetColumnDefaultClause(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..DropColumnDefaultClause(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  alter column definition ::= ALTER [ COLUMN ] column name alter column action
Method AlterColumnDefinition(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"ALTER")  && $S(..addKeyword(subElement,"COLUMN") :1,1:1) && ..ColumnName(subElement,.addedElement)  && ..AlterColumnAction(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  alter domain action ::= set domain default clause | drop domain default clause | add domain constraint definition | drop domain constraint definition
Method AlterDomainAction(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..SetDomainDefaultClause(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..DropDomainDefaultClause(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..AddDomainConstraintDefinition(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..DropDomainConstraintDefinition(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  alter domain statement ::= ALTER DOMAIN domain name alter domain action
Method AlterDomainStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"ALTER")  && ..addKeyword(subElement,"DOMAIN")  && ..DomainName(subElement,.addedElement)  && ..AlterDomainAction(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  alter table action ::= add column definition | alter column definition | drop column definition | add table constraint definition | drop table constraint definition
Method AlterTableAction(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..AddColumnDefinition(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..AlterColumnDefinition(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..DropColumnDefinition(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..AddTableConstraintDefinition(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..DropTableConstraintDefinition(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  alter table statement ::= ALTER TABLE table name alter table action
Method AlterTableStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"ALTER")  && ..addKeyword(subElement,"TABLE")  && ..TableName(subElement,.addedElement)  && ..AlterTableAction(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  ampersand ::= &
Method Ampersand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"&") {
		s done=1
	}
	if done {
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  approximate numeric literal ::= mantissa E exponent
Method ApproximateNumericLiteral(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..Mantissa(subElement,.addedElement)  && ..addKeyword(subElement,"E")  && ..Exponent(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  approximate numeric type ::= FLOAT [ left paren precision right paren ] | REAL | DOUBLE PRECISION
Method ApproximateNumericType(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"FLOAT")  && ..ApproximateNumericType100OptGrp(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"REAL")  {
			s done=1 ; or
		} elseif ..ApproximateNumericType101Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method ApproximateNumericType100OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LeftParen(subElement,.addedElement)  && ..Precision(subElement,.addedElement)  && ..RightParen(subElement,.addedElement)  {
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

Method ApproximateNumericType101Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"DOUBLE")  && ..addKeyword(subElement,"PRECISION")  {
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

///  arc1 ::= iso | 1 | iso left paren 1 right paren
Method Arc1(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"ISO")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"1")  {
			s done=1 ; or
		} elseif ..Arc1333Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method Arc1333Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"ISO")  && ..LeftParen(subElement,.addedElement)  && ..addPunctuation(subElement,"1")  && ..RightParen(subElement,.addedElement)  {
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

///  arc2 ::= standard | 0 | standard left paren 0 right paren
Method Arc2(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"STANDARD")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"0")  {
			s done=1 ; or
		} elseif ..Arc2334Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method Arc2334Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"STANDARD")  && ..LeftParen(subElement,.addedElement)  && ..addPunctuation(subElement,"0")  && ..RightParen(subElement,.addedElement)  {
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

///  arc3 ::= 9075
Method Arc3(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addPunctuation(subElement,"9075")  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  argument ::= target specification
Method Argument(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..TargetSpecification(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  as clause ::= [ AS ] column name
Method AsClause(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if $S(..addKeyword(subElement,"AS") :1,1:1) && ..ColumnName(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  assertion check ::= CHECK left paren search condition right paren
Method AssertionCheck(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"CHECK")  && ..LeftParen(subElement,.addedElement)  && ..SearchCondition(subElement,.addedElement)  && ..RightParen(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  assertion definition ::= CREATE ASSERTION constraint name assertion check [ constraint attributes ]
Method AssertionDefinition(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"CREATE")  && ..addKeyword(subElement,"ASSERTION")  && ..ConstraintName(subElement,.addedElement)  && ..AssertionCheck(subElement,.addedElement)  && $S(..ConstraintAttributes(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  asterisk ::= *
Method Asterisk(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"*") {
		s done=1
	}
	if done {
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  authorization identifier ::= identifier
Method AuthorizationIdentifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..Identifier(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  between predicate ::= row value constructor [ NOT ] BETWEEN row value constructor AND row value constructor
Method BetweenPredicate(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..RowValueConstructor(subElement,.addedElement)  && $S(..addKeyword(subElement,"NOT") :1,1:1) && ..addKeyword(subElement,"BETWEEN")  && ..RowValueConstructor(subElement,.addedElement)  && ..addKeyword(subElement,"AND")  && ..RowValueConstructor(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  bit ::= 0 | 1
Method Bit(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addPunctuation(subElement,"0")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"1")  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  bit concatenation ::= bit value expression concatenation operator bit factor
Method BitConcatenation(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..BitValueExpression(subElement,.addedElement)  && ..ConcatenationOperator(subElement,.addedElement)  && ..BitFactor(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  bit factor ::= bit primary
Method BitFactor(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..BitPrimary(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  bit length expression ::= BIT_LENGTH left paren string value expression right paren
Method BitLengthExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addPunctuation(subElement,"BIT_LENGTH")  && ..LeftParen(subElement,.addedElement)  && ..StringValueExpression(subElement,.addedElement)  && ..RightParen(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  bit primary ::= value expression primary | string value function
Method BitPrimary(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..ValueExpressionPrimary(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..StringValueFunction(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  bit string literal ::= B quote [ bit ... ] quote [ { separator... quote [ bit... ] quote }... ]
Method BitStringLiteral(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"B")  && ..Quote(subElement,.addedElement)  && $S(..BitStringLiteral19RepOne(subElement,.addedElement) :1,1:1) && ..Quote(subElement,.addedElement)  && $S(..BitStringLiteral20RepOne(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  bit ...
Method BitStringLiteral19RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..Bit(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  { separator... quote [ bit... ] quote }...
Method BitStringLiteral20RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..BitStringLiteral21Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  separator... quote [ bit... ] quote
Method BitStringLiteral21Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..BitStringLiteral22RepOne(subElement,.addedElement)  && ..Quote(subElement,.addedElement)  && $S(..BitStringLiteral23RepOne(subElement,.addedElement) :1,1:1) && ..Quote(subElement,.addedElement)  {
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

///  separator...
Method BitStringLiteral22RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..Separator(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  bit...
Method BitStringLiteral23RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..Bit(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  bit string type ::= BIT [ left paren length right paren ] | BIT VARYING [ left paren length right paren ]
Method BitStringType(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"BIT")  && ..BitStringType88OptGrp(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..BitStringType89Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method BitStringType88OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LeftParen(subElement,.addedElement)  && ..Length(subElement,.addedElement)  && ..RightParen(subElement,.addedElement)  {
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

Method BitStringType89Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"BIT")  && ..addKeyword(subElement,"VARYING")  && ..BitStringType90OptGrp(subElement,.addedElement)  {
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

Method BitStringType90OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LeftParen(subElement,.addedElement)  && ..Length(subElement,.addedElement)  && ..RightParen(subElement,.addedElement)  {
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

///  bit substring function ::= SUBSTRING left paren bit value expression FROM start position [ FOR string length ] right paren
Method BitSubstringFunction(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"SUBSTRING")  && ..LeftParen(subElement,.addedElement)  && ..BitValueExpression(subElement,.addedElement)  && ..addKeyword(subElement,"FROM")  && ..StartPosition(subElement,.addedElement)  && ..BitSubstringFunction185OptGrp(subElement,.addedElement)  && ..RightParen(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method BitSubstringFunction185OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"FOR")  && ..StringLength(subElement,.addedElement)  {
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

///  bit value expression ::= bit concatenation | bit factor
Method BitValueExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..BitConcatenation(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..BitFactor(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  bit value function ::= bit substring function
Method BitValueFunction(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..BitSubstringFunction(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  boolean factor ::= [ NOT ] boolean test
Method BooleanFactor(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if $S(..addKeyword(subElement,"NOT") :1,1:1) && ..BooleanTest(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  boolean primary ::= predicate | left paren search condition right paren
Method BooleanPrimary(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..Predicate(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..BooleanPrimary134Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method BooleanPrimary134Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..LeftParen(subElement,.addedElement)  && ..SearchCondition(subElement,.addedElement)  && ..RightParen(subElement,.addedElement)  {
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

///  boolean term ::= boolean factor | boolean term AND boolean factor
Method BooleanTerm(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	s done=0,ok=1,pos=..stream.pos,lastpos=pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s ret=($isobject(subElement))
		i ret $$$BNFCOMMITCOPY(subElement,ParentElement)
		q ret
	}
	$$$BNFMEMOSET(pos,"")
	d ..getBookmark(.bm)
	while ok {
	$$$BNFSTART(subElement)
		d ..gotoBookmark(.bm)
		s rec=..BooleanTerm131Recurse(subElement,.addedElement)
		i rec,..stream.pos>lastpos {
			$$$BNFMEMOSET(pos,addedElement)
			s done=1,lastpos=..stream.pos
		} else {
			s ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best 
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		i $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	q ret
}

Method BooleanTerm131Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..BooleanFactor(subElement,.addedElement)  {
		s done=1 ; or
	} elseif ..BooleanTerm132Or(subElement,.addedElement)  {
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

Method BooleanTerm132Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..BooleanTerm(subElement,.addedElement)  && ..addKeyword(subElement,"AND")  && ..BooleanFactor(subElement,.addedElement)  {
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

///  boolean test ::= boolean primary [ IS [ NOT ] truth value ]
Method BooleanTest(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..BooleanPrimary(subElement,.addedElement)  && ..BooleanTest133OptGrp(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method BooleanTest133OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"IS")  && $S(..addKeyword(subElement,"NOT") :1,1:1) && ..TruthValue(subElement,.addedElement)  {
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

///  C array specification ::= left bracket length right bracket
Method CArraySpecification(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..LeftBracket(subElement,.addedElement)  && ..Length(subElement,.addedElement)  && ..RightBracket(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  C bit variable ::= BIT C host identifier C array specification [ C initial value ] [ { comma C host identifier C array specification [ C initial value ] }... ]
Method CBitVariable(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"BIT")  && ..CHostIdentifier(subElement,.addedElement)  && ..CArraySpecification(subElement,.addedElement)  && $S(..CInitialValue(subElement,.addedElement) :1,1:1) && $S(..CBitVariable325RepOne(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  { comma C host identifier C array specification [ C initial value ] }...
Method CBitVariable325RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..CBitVariable326Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  comma C host identifier C array specification [ C initial value ]
Method CBitVariable326Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Comma(subElement,.addedElement)  && ..CHostIdentifier(subElement,.addedElement)  && ..CArraySpecification(subElement,.addedElement)  && $S(..CInitialValue(subElement,.addedElement) :1,1:1) {
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

///  C character variable ::= char [ CHARACTER SET [ IS ] character set specification ] C host identifier C array specification [ C initial value ] [ { comma C host identifier C array specification [ C initial value ] }... ]
Method CCharacterVariable(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"CHAR")  && ..CCharacterVariable319OptGrp(subElement,.addedElement)  && ..CHostIdentifier(subElement,.addedElement)  && ..CArraySpecification(subElement,.addedElement)  && $S(..CInitialValue(subElement,.addedElement) :1,1:1) && $S(..CCharacterVariable320RepOne(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method CCharacterVariable319OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"CHARACTER")  && ..addKeyword(subElement,"SET")  && $S(..addKeyword(subElement,"IS") :1,1:1) && ..CharacterSetSpecification(subElement,.addedElement)  {
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

///  { comma C host identifier C array specification [ C initial value ] }...
Method CCharacterVariable320RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..CCharacterVariable321Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  comma C host identifier C array specification [ C initial value ]
Method CCharacterVariable321Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Comma(subElement,.addedElement)  && ..CHostIdentifier(subElement,.addedElement)  && ..CArraySpecification(subElement,.addedElement)  && $S(..CInitialValue(subElement,.addedElement) :1,1:1) {
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

///  C class modifier ::= const | volatile
Method CClassModifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"CONST")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"VOLATILE")  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  C derived variable ::= C VARCHAR variable | C bit variable
Method CDerivedVariable(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..CVarcharVariable(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..CBitVariable(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  C host identifier ::= !! See syntax rules
Method CHostIdentifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addPunctuation(subElement,"!!")  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  C initial value ::= equals operator character representation
Method CInitialValue(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..EqualsOperator(subElement,.addedElement)  && ..CharacterRepresentation(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  C numeric variable ::= { long | short | float | double } C host identifier [ C initial value ] [ { comma C host identifier [ C initial value ] }... ]
Method CNumericVariable(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..CNumericVariable316Sub(subElement,.addedElement)  && ..CHostIdentifier(subElement,.addedElement)  && $S(..CInitialValue(subElement,.addedElement) :1,1:1) && $S(..CNumericVariable317RepOne(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  long | short | float | double
Method CNumericVariable316Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"LONG")  {
		s done=1 ; or
	} elseif ..addKeyword(subElement,"SHORT")  {
		s done=1 ; or
	} elseif ..addKeyword(subElement,"FLOAT")  {
		s done=1 ; or
	} elseif ..addKeyword(subElement,"DOUBLE")  {
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

///  { comma C host identifier [ C initial value ] }...
Method CNumericVariable317RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..CNumericVariable318Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  comma C host identifier [ C initial value ]
Method CNumericVariable318Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Comma(subElement,.addedElement)  && ..CHostIdentifier(subElement,.addedElement)  && $S(..CInitialValue(subElement,.addedElement) :1,1:1) {
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

///  C storage class ::= auto | extern | static
Method CStorageClass(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"AUTO")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"EXTERN")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"STATIC")  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  C VARCHAR variable ::= VARCHAR [ CHARACTER SET [ IS ] character set specification ] C host identifier C array specification [ C initial value ] [ { comma C host identifier C array specification [ C initial value ] }... ]
Method CVarcharVariable(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"VARCHAR")  && ..CVarcharVariable322OptGrp(subElement,.addedElement)  && ..CHostIdentifier(subElement,.addedElement)  && ..CArraySpecification(subElement,.addedElement)  && $S(..CInitialValue(subElement,.addedElement) :1,1:1) && $S(..CVarcharVariable323RepOne(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method CVarcharVariable322OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"CHARACTER")  && ..addKeyword(subElement,"SET")  && $S(..addKeyword(subElement,"IS") :1,1:1) && ..CharacterSetSpecification(subElement,.addedElement)  {
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

///  { comma C host identifier C array specification [ C initial value ] }...
Method CVarcharVariable323RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..CVarcharVariable324Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  comma C host identifier C array specification [ C initial value ]
Method CVarcharVariable324Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Comma(subElement,.addedElement)  && ..CHostIdentifier(subElement,.addedElement)  && ..CArraySpecification(subElement,.addedElement)  && $S(..CInitialValue(subElement,.addedElement) :1,1:1) {
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

///  C variable definition ::= [ C storage class ] [ C class modifier ] C variable specification semicolon
Method CVariableDefinition(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if $S(..CStorageClass(subElement,.addedElement) :1,1:1) && $S(..CClassModifier(subElement,.addedElement) :1,1:1) && ..CVariableSpecification(subElement,.addedElement)  && ..Semicolon(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  C variable specification ::= C numeric variable | C character variable | C derived variable
Method CVariableSpecification(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..CNumericVariable(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..CCharacterVariable(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..CDerivedVariable(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  case abbreviation ::= NULLIF left paren value expression comma value expression right paren | COALESCE left paren value expression { comma value expression }... right paren
Method CaseAbbreviation(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"NULLIF")  && ..LeftParen(subElement,.addedElement)  && ..ValueExpression(subElement,.addedElement)  && ..Comma(subElement,.addedElement)  && ..ValueExpression(subElement,.addedElement)  && ..RightParen(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..CaseAbbreviation174Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method CaseAbbreviation174Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"COALESCE")  && ..LeftParen(subElement,.addedElement)  && ..ValueExpression(subElement,.addedElement)  && ..CaseAbbreviation175RepOne(subElement,.addedElement)  && ..RightParen(subElement,.addedElement)  {
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

///  { comma value expression }...
Method CaseAbbreviation175RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..CaseAbbreviation176Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  comma value expression
Method CaseAbbreviation176Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Comma(subElement,.addedElement)  && ..ValueExpression(subElement,.addedElement)  {
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

///  case expression ::= case abbreviation | case specification
Method CaseExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..CaseAbbreviation(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..CaseSpecification(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  case operand ::= value expression
Method CaseOperand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..ValueExpression(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  case specification ::= simple case | searched case
Method CaseSpecification(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..SimpleCase(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..SearchedCase(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  cast operand ::= value expression | NULL
Method CastOperand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..ValueExpression(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"NULL")  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  cast specification ::= CAST left paren cast operand AS cast target right paren
Method CastSpecification(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"CAST")  && ..LeftParen(subElement,.addedElement)  && ..CastOperand(subElement,.addedElement)  && ..addKeyword(subElement,"AS")  && ..CastTarget(subElement,.addedElement)  && ..RightParen(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  cast target ::= domain name | data type
Method CastTarget(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..DomainName(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..DataType(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  catalog name ::= identifier
Method CatalogName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..Identifier(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  char length expression ::= { CHAR_LENGTH | CHARACTER_LENGTH } left paren string value expression right paren
Method CharLengthExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..CharLengthExpression202Sub(subElement,.addedElement)  && ..LeftParen(subElement,.addedElement)  && ..StringValueExpression(subElement,.addedElement)  && ..RightParen(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  CHAR_LENGTH | CHARACTER_LENGTH
Method CharLengthExpression202Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"CHAR_LENGTH")  {
		s done=1 ; or
	} elseif ..addPunctuation(subElement,"CHARACTER_LENGTH")  {
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

///  character factor ::= character primary [ collate clause ]
Method CharacterFactor(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..CharacterPrimary(subElement,.addedElement)  && $S(..CollateClause(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  character primary ::= value expression primary | string value function
Method CharacterPrimary(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..ValueExpressionPrimary(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..StringValueFunction(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  character representation ::= nonquote character | quote symbol
Method CharacterRepresentation(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..NonquoteCharacter(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..QuoteSymbol(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  character set definition ::= CREATE CHARACTER SET character set name [ AS ] character set source [ collate clause | limited collation definition ]
Method CharacterSetDefinition(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"CREATE")  && ..addKeyword(subElement,"CHARACTER")  && ..addKeyword(subElement,"SET")  && ..CharacterSetName(subElement,.addedElement)  && $S(..addKeyword(subElement,"AS") :1,1:1) && ..CharacterSetSource(subElement,.addedElement)  && ..CharacterSetDefinition250OptGrp(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method CharacterSetDefinition250OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CollateClause(subElement,.addedElement)  {
		s done=1 ; or
	} elseif ..LimitedCollationDefinition(subElement,.addedElement)  {
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

///  character set name ::= [ schema name period ] SQL language identifier
Method CharacterSetName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..CharacterSetName35OptGrp(subElement,.addedElement)  && ..SqlLanguageIdentifier(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method CharacterSetName35OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SchemaName(subElement,.addedElement)  && ..Period(subElement,.addedElement)  {
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

///  character set source ::= GET existing character set name
Method CharacterSetSource(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"GET")  && ..ExistingCharacterSetName(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  character set specification ::= standard character repertoire name | implementation-defined character repertoire name | user-defined character repertoire name | standard universal character form-of-use name | implementation-defined universal character form-of-use name
Method CharacterSetSpecification(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..StandardCharacterRepertoireName(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..ImplementationDefinedCharacterRepertoireName(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..UserDefinedCharacterRepertoireName(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..StandardUniversalCharacterFormOfUseName(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..ImplementationDefinedUniversalCharacterFormOfUseName(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  character string literal ::= [ introducercharacter set specification ] quote [ character representation... ] quote [ { separator... quote [ character representation... ] quote }... ]
Method CharacterStringLiteral(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..CharacterStringLiteral29OptGrp(subElement,.addedElement)  && ..Quote(subElement,.addedElement)  && $S(..CharacterStringLiteral30RepOne(subElement,.addedElement) :1,1:1) && ..Quote(subElement,.addedElement)  && $S(..CharacterStringLiteral31RepOne(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method CharacterStringLiteral29OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Introducer(subElement,.addedElement)  && ..CharacterSetSpecification(subElement,.addedElement)  {
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

///  character representation...
Method CharacterStringLiteral30RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..CharacterRepresentation(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  { separator... quote [ character representation... ] quote }...
Method CharacterStringLiteral31RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..CharacterStringLiteral32Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  separator... quote [ character representation... ] quote
Method CharacterStringLiteral32Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CharacterStringLiteral33RepOne(subElement,.addedElement)  && ..Quote(subElement,.addedElement)  && $S(..CharacterStringLiteral34RepOne(subElement,.addedElement) :1,1:1) && ..Quote(subElement,.addedElement)  {
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

///  separator...
Method CharacterStringLiteral33RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..Separator(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  character representation...
Method CharacterStringLiteral34RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..CharacterRepresentation(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  character string type ::= CHARACTER [ left paren length right paren ] | CHAR [ left paren length right paren ] | CHARACTER VARYING [ left paren length right paren ] | CHAR VARYING [ left paren length right paren ] | VARCHAR [ left paren length right paren ]
Method CharacterStringType(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"CHARACTER")  && ..CharacterStringType68OptGrp(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..CharacterStringType69Or(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..CharacterStringType71Or(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..CharacterStringType73Or(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..CharacterStringType75Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method CharacterStringType68OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LeftParen(subElement,.addedElement)  && ..Length(subElement,.addedElement)  && ..RightParen(subElement,.addedElement)  {
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

Method CharacterStringType69Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"CHAR")  && ..CharacterStringType70OptGrp(subElement,.addedElement)  {
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

Method CharacterStringType70OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LeftParen(subElement,.addedElement)  && ..Length(subElement,.addedElement)  && ..RightParen(subElement,.addedElement)  {
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

Method CharacterStringType71Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"CHARACTER")  && ..addKeyword(subElement,"VARYING")  && ..CharacterStringType72OptGrp(subElement,.addedElement)  {
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

Method CharacterStringType72OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LeftParen(subElement,.addedElement)  && ..Length(subElement,.addedElement)  && ..RightParen(subElement,.addedElement)  {
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

Method CharacterStringType73Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"CHAR")  && ..addKeyword(subElement,"VARYING")  && ..CharacterStringType74OptGrp(subElement,.addedElement)  {
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

Method CharacterStringType74OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LeftParen(subElement,.addedElement)  && ..Length(subElement,.addedElement)  && ..RightParen(subElement,.addedElement)  {
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

Method CharacterStringType75Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"VARCHAR")  && ..CharacterStringType76OptGrp(subElement,.addedElement)  {
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

Method CharacterStringType76OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LeftParen(subElement,.addedElement)  && ..Length(subElement,.addedElement)  && ..RightParen(subElement,.addedElement)  {
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

///  character substring function ::= SUBSTRING left paren character value expression FROM start position [ FOR string length ] right paren
Method CharacterSubstringFunction(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"SUBSTRING")  && ..LeftParen(subElement,.addedElement)  && ..CharacterValueExpression(subElement,.addedElement)  && ..addKeyword(subElement,"FROM")  && ..StartPosition(subElement,.addedElement)  && ..CharacterSubstringFunction181OptGrp(subElement,.addedElement)  && ..RightParen(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method CharacterSubstringFunction181OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"FOR")  && ..StringLength(subElement,.addedElement)  {
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

///  character translation ::= TRANSLATE left paren character value expression USING translation name right paren
Method CharacterTranslation(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"TRANSLATE")  && ..LeftParen(subElement,.addedElement)  && ..CharacterValueExpression(subElement,.addedElement)  && ..addKeyword(subElement,"USING")  && ..TranslationName(subElement,.addedElement)  && ..RightParen(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  character value expression ::= concatenation | character factor
Method CharacterValueExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..Concatenation(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..CharacterFactor(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  character value function ::= character substring function | fold | form-of-use conversion | character translation | trim function
Method CharacterValueFunction(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..CharacterSubstringFunction(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..Fold(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..FormOfUseConversion(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..CharacterTranslation(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..TrimFunction(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  check constraint definition ::= CHECK left paren search condition right paren
Method CheckConstraintDefinition(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"CHECK")  && ..LeftParen(subElement,.addedElement)  && ..SearchCondition(subElement,.addedElement)  && ..RightParen(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  close statement ::= CLOSE cursor name
Method CloseStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"CLOSE")  && ..CursorName(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  Cobol host identifier ::= !! See syntax rules
Method CobolHostIdentifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addPunctuation(subElement,"!!")  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  Cobol variable definition ::= ...omitted...
Method CobolVariableDefinition(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	quit 0 ; omitted rule never true
}

///  collate clause ::= COLLATE collation name
Method CollateClause(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"COLLATE")  && ..CollationName(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  collating sequence definition ::= external collation | schema collation name | DESC left paren collation name right paren | DEFAULT
Method CollatingSequenceDefinition(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..ExternalCollation(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..SchemaCollationName(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..CollatingSequenceDefinition251Or(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"DEFAULT")  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method CollatingSequenceDefinition251Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"DESC")  && ..LeftParen(subElement,.addedElement)  && ..CollationName(subElement,.addedElement)  && ..RightParen(subElement,.addedElement)  {
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

///  collation definition ::= CREATE COLLATION collation name FOR character set specification FROM collation source [ pad attribute ]
Method CollationDefinition(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"CREATE")  && ..addKeyword(subElement,"COLLATION")  && ..CollationName(subElement,.addedElement)  && ..addKeyword(subElement,"FOR")  && ..CharacterSetSpecification(subElement,.addedElement)  && ..addKeyword(subElement,"FROM")  && ..CollationSource(subElement,.addedElement)  && $S(..PadAttribute(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  collation name ::= qualified name
Method CollationName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..QualifiedName(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  collation source ::= collating sequence definition | translation collation
Method CollationSource(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..CollatingSequenceDefinition(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..TranslationCollation(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  colon ::= :
Method Colon(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,":") {
		s done=1
	}
	if done {
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  column constraint ::= NOT NULL | unique specification | references specification | check constraint definition
Method ColumnConstraint(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"NOT")  && ..addKeyword(subElement,"NULL")  {
			s done=1 ; or
		} elseif ..UniqueSpecification(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..ReferencesSpecification(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..CheckConstraintDefinition(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  column constraint definition ::= [ constraint name definition ] column constraint [ constraint attributes ]
Method ColumnConstraintDefinition(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if $S(..ConstraintNameDefinition(subElement,.addedElement) :1,1:1) && ..ColumnConstraint(subElement,.addedElement)  && $S(..ConstraintAttributes(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  column definition ::= column name { data type | domain name } [ default clause ] [ column constraint definition... ] [ collate clause ]
Method ColumnDefinition(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..ColumnName(subElement,.addedElement)  && ..ColumnDefinition65Sub(subElement,.addedElement)  && $S(..DefaultClause(subElement,.addedElement) :1,1:1) && $S(..ColumnDefinition66RepOne(subElement,.addedElement) :1,1:1) && $S(..CollateClause(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  data type | domain name
Method ColumnDefinition65Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..DataType(subElement,.addedElement)  {
		s done=1 ; or
	} elseif ..DomainName(subElement,.addedElement)  {
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

///  column constraint definition...
Method ColumnDefinition66RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..ColumnConstraintDefinition(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  column name ::= identifier
Method ColumnName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..Identifier(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  column name list ::= column name [ { comma column name }... ]
Method ColumnNameList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..ColumnName(subElement,.addedElement)  && $S(..ColumnNameList123RepOne(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  { comma column name }...
Method ColumnNameList123RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..ColumnNameList124Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  comma column name
Method ColumnNameList124Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Comma(subElement,.addedElement)  && ..ColumnName(subElement,.addedElement)  {
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

///  column reference ::= [ qualifier period ] column name
Method ColumnReference(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..ColumnReference147OptGrp(subElement,.addedElement)  && ..ColumnName(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method ColumnReference147OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Qualifier(subElement,.addedElement)  && ..Period(subElement,.addedElement)  {
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

///  comma ::= ,
Method Comma(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,",") {
		s done=1
	}
	if done {
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  comment ::= comment introducer [ comment character... ] newline
Method Comment(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	s done=0,ok=1,pos=..stream.pos,lastpos=pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s ret=($isobject(subElement))
		i ret $$$BNFCOMMITCOPY(subElement,ParentElement)
		q ret
	}
	$$$BNFMEMOSET(pos,"")
	d ..getBookmark(.bm)
	while ok {
	$$$BNFSTART(subElement)
		d ..gotoBookmark(.bm)
		s rec=..Comment16Recurse(subElement,.addedElement)
		i rec,..stream.pos>lastpos {
			$$$BNFMEMOSET(pos,addedElement)
			s done=1,lastpos=..stream.pos
		} else {
			s ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best 
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		i $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	q ret
}

Method Comment16Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..CommentIntroducer(subElement,.addedElement)  && $S(..Comment17RepOne(subElement,.addedElement) :1,1:1) && ..Newline(subElement,.addedElement)  {
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

///  comment character...
Method Comment17RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..CommentCharacter(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  comment character ::= nonquote character | quote
Method CommentCharacter(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..NonquoteCharacter(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..Quote(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  comment introducer ::= minus signminus sign [minus sign...]
Method CommentIntroducer(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..MinusSign(subElement,.addedElement)  && ..MinusSign(subElement,.addedElement)  && $S(..CommentIntroducer18RepOne(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}

	}
	i done {
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

/// minus sign...
Method CommentIntroducer18RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..MinusSign(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  commit statement ::= COMMIT [ WORK ]
Method CommitStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"COMMIT")  && $S(..addKeyword(subElement,"WORK") :1,1:1) {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  comp op ::= equals operator | not equals operator | less than operator | greater than operator | less than or equals operator | greater than or equals operator
Method CompOp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..EqualsOperator(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..NotEqualsOperator(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..LessThanOperator(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..GreaterThanOperator(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..LessThanOrEqualsOperator(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..GreaterThanOrEqualsOperator(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  comparison predicate ::= row value constructor comp op row value constructor
Method ComparisonPredicate(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..RowValueConstructor(subElement,.addedElement)  && ..CompOp(subElement,.addedElement)  && ..RowValueConstructor(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  concatenation ::= character value expression concatenation operator character factor
Method Concatenation(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	s done=0,ok=1,pos=..stream.pos,lastpos=pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s ret=($isobject(subElement))
		i ret $$$BNFCOMMITCOPY(subElement,ParentElement)
		q ret
	}
	$$$BNFMEMOSET(pos,"")
	d ..getBookmark(.bm)
	while ok {
	$$$BNFSTART(subElement)
		d ..gotoBookmark(.bm)
		s rec=..Concatenation180Recurse(subElement,.addedElement)
		i rec,..stream.pos>lastpos {
			$$$BNFMEMOSET(pos,addedElement)
			s done=1,lastpos=..stream.pos
		} else {
			s ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best 
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		i $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	q ret
}

Method Concatenation180Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..CharacterValueExpression(subElement,.addedElement)  && ..ConcatenationOperator(subElement,.addedElement)  && ..CharacterFactor(subElement,.addedElement)  {
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

///  concatenation operator ::= ||
Method ConcatenationOperator(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"||") {
		s done=1
	}
	if done {
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  condition ::= SQLERROR | NOT FOUND
Method Condition(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"SQLERROR")  {
			s done=1 ; or
		} elseif ..Condition328Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method Condition328Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"NOT")  && ..addKeyword(subElement,"FOUND")  {
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

///  condition action ::= CONTINUE | go to
Method ConditionAction(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"CONTINUE")  {
			s done=1 ; or
		} elseif ..GoTo(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  condition information ::= EXCEPTION condition number condition information item [ { comma condition information item }... ]
Method ConditionInformation(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	s done=0,ok=1,pos=..stream.pos,lastpos=pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s ret=($isobject(subElement))
		i ret $$$BNFCOMMITCOPY(subElement,ParentElement)
		q ret
	}
	$$$BNFMEMOSET(pos,"")
	d ..getBookmark(.bm)
	while ok {
	$$$BNFSTART(subElement)
		d ..gotoBookmark(.bm)
		s rec=..ConditionInformation305Recurse(subElement,.addedElement)
		i rec,..stream.pos>lastpos {
			$$$BNFMEMOSET(pos,addedElement)
			s done=1,lastpos=..stream.pos
		} else {
			s ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best 
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		i $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	q ret
}

Method ConditionInformation305Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(subElement,"EXCEPTION")  && ..ConditionNumber(subElement,.addedElement)  && ..ConditionInformationItem(subElement,.addedElement)  && $S(..ConditionInformation306RepOne(subElement,.addedElement) :1,1:1) {
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

///  { comma condition information item }...
Method ConditionInformation306RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..ConditionInformation307Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  comma condition information item
Method ConditionInformation307Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Comma(subElement,.addedElement)  && ..ConditionInformationItem(subElement,.addedElement)  {
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

///  condition information item ::= simple target specification equals operator condition information item name
Method ConditionInformationItem(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	s done=0,ok=1,pos=..stream.pos,lastpos=pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s ret=($isobject(subElement))
		i ret $$$BNFCOMMITCOPY(subElement,ParentElement)
		q ret
	}
	$$$BNFMEMOSET(pos,"")
	d ..getBookmark(.bm)
	while ok {
	$$$BNFSTART(subElement)
		d ..gotoBookmark(.bm)
		s rec=..ConditionInformationItem308Recurse(subElement,.addedElement)
		i rec,..stream.pos>lastpos {
			$$$BNFMEMOSET(pos,addedElement)
			s done=1,lastpos=..stream.pos
		} else {
			s ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best 
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		i $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	q ret
}

Method ConditionInformationItem308Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..SimpleTargetSpecification(subElement,.addedElement)  && ..EqualsOperator(subElement,.addedElement)  && ..ConditionInformationItemName(subElement,.addedElement)  {
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

///  condition information item name ::= CONDITION_NUMBER | RETURNED_SQLSTATE | CLASS_ORIGIN | SUBCLASS_ORIGIN | SERVER_NAME | CONNECTION_NAME | CONSTRAINT_CATALOG | CONSTRAINT_SCHEMA | CONSTRAINT_NAME | CATALOG_NAME | SCHEMA_NAME | TABLE_NAME | COLUMN_NAME | CURSOR_NAME | MESSAGE_TEXT | MESSAGE_LENGTH | MESSAGE_OCTET_LENGTH
Method ConditionInformationItemName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addPunctuation(subElement,"CONDITION_NUMBER")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"RETURNED_SQLSTATE")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"CLASS_ORIGIN")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"SUBCLASS_ORIGIN")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"SERVER_NAME")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"CONNECTION_NAME")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"CONSTRAINT_CATALOG")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"CONSTRAINT_SCHEMA")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"CONSTRAINT_NAME")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"CATALOG_NAME")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"SCHEMA_NAME")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"TABLE_NAME")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"COLUMN_NAME")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"CURSOR_NAME")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"MESSAGE_TEXT")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"MESSAGE_LENGTH")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"MESSAGE_OCTET_LENGTH")  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  condition number ::= simple value specification
Method ConditionNumber(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..SimpleValueSpecification(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  connect statement ::= CONNECT TO connection target
Method ConnectStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"CONNECT")  && ..addKeyword(subElement,"TO")  && ..ConnectionTarget(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  connection name ::= simple value specification
Method ConnectionName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..SimpleValueSpecification(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  connection object ::= DEFAULT | connection name
Method ConnectionObject(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"DEFAULT")  {
			s done=1 ; or
		} elseif ..ConnectionName(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  connection target ::= SQL-server name [ AS connection name ] [ USER user name ] | DEFAULT
Method ConnectionTarget(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..SqlServerName(subElement,.addedElement)  && ..ConnectionTarget284OptGrp(subElement,.addedElement)  && ..ConnectionTarget285OptGrp(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"DEFAULT")  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method ConnectionTarget284OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"AS")  && ..ConnectionName(subElement,.addedElement)  {
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

Method ConnectionTarget285OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"USER")  && ..UserName(subElement,.addedElement)  {
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

///  constraint attributes ::= constraint check time [ [ NOT ] DEFERRABLE ] | [ NOT ] DEFERRABLE [ constraint check time ]
Method ConstraintAttributes(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..ConstraintCheckTime(subElement,.addedElement)  && ..ConstraintAttributes213OptGrp(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..ConstraintAttributes214Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method ConstraintAttributes213OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..addKeyword(subElement,"NOT") :1,1:1) && ..addKeyword(subElement,"DEFERRABLE")  {
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

Method ConstraintAttributes214Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if $S(..addKeyword(subElement,"NOT") :1,1:1) && ..addKeyword(subElement,"DEFERRABLE")  && $S(..ConstraintCheckTime(subElement,.addedElement) :1,1:1) {
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

///  constraint check time ::= INITIALLY DEFERRED | INITIALLY IMMEDIATE
Method ConstraintCheckTime(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"INITIALLY")  && ..addKeyword(subElement,"DEFERRED")  {
			s done=1 ; or
		} elseif ..ConstraintCheckTime215Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method ConstraintCheckTime215Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"INITIALLY")  && ..addKeyword(subElement,"IMMEDIATE")  {
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

///  constraint name ::= qualified name
Method ConstraintName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..QualifiedName(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  constraint name definition ::= CONSTRAINT constraint name
Method ConstraintNameDefinition(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"CONSTRAINT")  && ..ConstraintName(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  constraint name list ::= ALL | constraint name [ { comma constraint name }... ]
Method ConstraintNameList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"ALL")  {
			s done=1 ; or
		} elseif ..ConstraintNameList281Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method ConstraintNameList281Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..ConstraintName(subElement,.addedElement)  && $S(..ConstraintNameList282RepOne(subElement,.addedElement) :1,1:1) {
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

///  { comma constraint name }...
Method ConstraintNameList282RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..ConstraintNameList283Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  comma constraint name
Method ConstraintNameList283Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Comma(subElement,.addedElement)  && ..ConstraintName(subElement,.addedElement)  {
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

///  correlation name ::= identifier
Method CorrelationName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..Identifier(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  correlation specification ::= [ AS ] correlation name [ left paren derived column list right paren ]
Method CorrelationSpecification(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if $S(..addKeyword(subElement,"AS") :1,1:1) && ..CorrelationName(subElement,.addedElement)  && ..CorrelationSpecification160OptGrp(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method CorrelationSpecification160OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LeftParen(subElement,.addedElement)  && ..DerivedColumnList(subElement,.addedElement)  && ..RightParen(subElement,.addedElement)  {
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

///  corresponding column list ::= column name list
Method CorrespondingColumnList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..ColumnNameList(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  corresponding spec ::= CORRESPONDING [ BY left paren corresponding column list right paren ]
Method CorrespondingSpec(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"CORRESPONDING")  && ..CorrespondingSpec172OptGrp(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method CorrespondingSpec172OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"BY")  && ..LeftParen(subElement,.addedElement)  && ..CorrespondingColumnList(subElement,.addedElement)  && ..RightParen(subElement,.addedElement)  {
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

///  cross join ::= table reference CROSS JOIN table reference
Method CrossJoin(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	s done=0,ok=1,pos=..stream.pos,lastpos=pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s ret=($isobject(subElement))
		i ret $$$BNFCOMMITCOPY(subElement,ParentElement)
		q ret
	}
	$$$BNFMEMOSET(pos,"")
	d ..getBookmark(.bm)
	while ok {
	$$$BNFSTART(subElement)
		d ..gotoBookmark(.bm)
		s rec=..CrossJoin163Recurse(subElement,.addedElement)
		i rec,..stream.pos>lastpos {
			$$$BNFMEMOSET(pos,addedElement)
			s done=1,lastpos=..stream.pos
		} else {
			s ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best 
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		i $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	q ret
}

Method CrossJoin163Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..TableReference(subElement,.addedElement)  && ..addKeyword(subElement,"CROSS")  && ..addKeyword(subElement,"JOIN")  && ..TableReference(subElement,.addedElement)  {
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

///  current date value function ::= CURRENT_DATE
Method CurrentDateValueFunction(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addPunctuation(subElement,"CURRENT_DATE")  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  current time value function ::= CURRENT_TIME [ left paren time precision right paren ]
Method CurrentTimeValueFunction(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addPunctuation(subElement,"CURRENT_TIME")  && ..CurrentTimeValueFunction117OptGrp(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method CurrentTimeValueFunction117OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LeftParen(subElement,.addedElement)  && ..TimePrecision(subElement,.addedElement)  && ..RightParen(subElement,.addedElement)  {
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

///  current timestamp value function ::= CURRENT_TIMESTAMP [ left paren timestamp precision right paren ]
Method CurrentTimestampValueFunction(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addPunctuation(subElement,"CURRENT_TIMESTAMP")  && ..CurrentTimestampValueFunction118OptGrp(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method CurrentTimestampValueFunction118OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LeftParen(subElement,.addedElement)  && ..TimestampPrecision(subElement,.addedElement)  && ..RightParen(subElement,.addedElement)  {
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

///  cursor name ::= identifier
Method CursorName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..Identifier(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  cursor specification ::= query expression [ order by clause ] [ updatability clause ]
Method CursorSpecification(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..QueryExpression(subElement,.addedElement)  && $S(..OrderByClause(subElement,.addedElement) :1,1:1) && $S(..UpdatabilityClause(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  data type ::= character string type [ CHARACTER SET character set specification ] | national character string type | bit string type | numeric type | datetime type | interval type
Method DataType(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..CharacterStringType(subElement,.addedElement)  && ..DataType67OptGrp(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..NationalCharacterStringType(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..BitStringType(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..NumericType(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..DatetimeType(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..IntervalType(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method DataType67OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"CHARACTER")  && ..addKeyword(subElement,"SET")  && ..CharacterSetSpecification(subElement,.addedElement)  {
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

///  date literal ::= DATE date string
Method DateLiteral(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"DATE")  && ..DateString(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  date string ::= quote date value quote
Method DateString(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..Quote(subElement,.addedElement)  && ..DateValue(subElement,.addedElement)  && ..Quote(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  date value ::= years value minus sign months value minus sign days value
Method DateValue(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..YearsValue(subElement,.addedElement)  && ..MinusSign(subElement,.addedElement)  && ..MonthsValue(subElement,.addedElement)  && ..MinusSign(subElement,.addedElement)  && ..DaysValue(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  datetime factor ::= datetime primary [ time zone ]
Method DatetimeFactor(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..DatetimePrimary(subElement,.addedElement)  && $S(..TimeZone(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  datetime field ::= non-second datetime field | SECOND
Method DatetimeField(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	s done=0,ok=1,pos=..stream.pos,lastpos=pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s ret=($isobject(subElement))
		i ret $$$BNFCOMMITCOPY(subElement,ParentElement)
		q ret
	}
	$$$BNFMEMOSET(pos,"")
	d ..getBookmark(.bm)
	while ok {
	$$$BNFSTART(subElement)
		d ..gotoBookmark(.bm)
		s rec=..DatetimeField186Recurse(subElement,.addedElement)
		i rec,..stream.pos>lastpos {
			$$$BNFMEMOSET(pos,addedElement)
			s done=1,lastpos=..stream.pos
		} else {
			s ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best 
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		i $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	q ret
}

Method DatetimeField186Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..NonSecondDatetimeField(subElement,.addedElement)  {
		s done=1 ; or
	} elseif ..addKeyword(subElement,"SECOND")  {
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

///  datetime literal ::= date literal | time literal | timestamp literal
Method DatetimeLiteral(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..DateLiteral(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..TimeLiteral(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..TimestampLiteral(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  datetime primary ::= value expression primary | datetime value function
Method DatetimePrimary(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..ValueExpressionPrimary(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..DatetimeValueFunction(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  datetime term ::= datetime factor
Method DatetimeTerm(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..DatetimeFactor(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  datetime type ::= DATE | TIME [ left paren time precision right paren ] [ WITH TIME ZONE ] | TIMESTAMP [ left paren timestamp precision right paren ] [ WITH TIME ZONE ]
Method DatetimeType(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"DATE")  {
			s done=1 ; or
		} elseif ..DatetimeType102Or(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..DatetimeType105Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method DatetimeType102Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"TIME")  && ..DatetimeType103OptGrp(subElement,.addedElement)  && ..DatetimeType104OptGrp(subElement,.addedElement)  {
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

Method DatetimeType103OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LeftParen(subElement,.addedElement)  && ..TimePrecision(subElement,.addedElement)  && ..RightParen(subElement,.addedElement)  {
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

Method DatetimeType104OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"WITH")  && ..addKeyword(subElement,"TIME")  && ..addKeyword(subElement,"ZONE")  {
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

Method DatetimeType105Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"TIMESTAMP")  && ..DatetimeType106OptGrp(subElement,.addedElement)  && ..DatetimeType107OptGrp(subElement,.addedElement)  {
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

Method DatetimeType106OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LeftParen(subElement,.addedElement)  && ..TimestampPrecision(subElement,.addedElement)  && ..RightParen(subElement,.addedElement)  {
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

Method DatetimeType107OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"WITH")  && ..addKeyword(subElement,"TIME")  && ..addKeyword(subElement,"ZONE")  {
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

///  datetime value ::= unsigned integer
Method DatetimeValue(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..UnsignedInteger(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  datetime value expression ::= datetime term | interval value expression plus sign datetime term | datetime value expression plus sign interval term | datetime value expression minus sign interval term
Method DatetimeValueExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	s done=0,ok=1,pos=..stream.pos,lastpos=pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s ret=($isobject(subElement))
		i ret $$$BNFCOMMITCOPY(subElement,ParentElement)
		q ret
	}
	$$$BNFMEMOSET(pos,"")
	d ..getBookmark(.bm)
	while ok {
	$$$BNFSTART(subElement)
		d ..gotoBookmark(.bm)
		s rec=..DatetimeValueExpression187Recurse(subElement,.addedElement)
		i rec,..stream.pos>lastpos {
			$$$BNFMEMOSET(pos,addedElement)
			s done=1,lastpos=..stream.pos
		} else {
			s ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best 
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		i $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	q ret
}

Method DatetimeValueExpression187Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..DatetimeTerm(subElement,.addedElement)  {
		s done=1 ; or
	} elseif ..DatetimeValueExpression188Or(subElement,.addedElement)  {
		s done=1 ; or
	} elseif ..DatetimeValueExpression189Or(subElement,.addedElement)  {
		s done=1 ; or
	} elseif ..DatetimeValueExpression190Or(subElement,.addedElement)  {
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

Method DatetimeValueExpression188Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..IntervalValueExpression(subElement,.addedElement)  && ..PlusSign(subElement,.addedElement)  && ..DatetimeTerm(subElement,.addedElement)  {
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

Method DatetimeValueExpression189Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..DatetimeValueExpression(subElement,.addedElement)  && ..PlusSign(subElement,.addedElement)  && ..IntervalTerm(subElement,.addedElement)  {
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

Method DatetimeValueExpression190Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..DatetimeValueExpression(subElement,.addedElement)  && ..MinusSign(subElement,.addedElement)  && ..IntervalTerm(subElement,.addedElement)  {
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

///  datetime value function ::= current date value function | current time value function | current timestamp value function
Method DatetimeValueFunction(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..CurrentDateValueFunction(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..CurrentTimeValueFunction(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..CurrentTimestampValueFunction(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  day-time interval ::= days value [ space hours value [ colon minutes value [ colon seconds value ] ] ]
Method DayTimeInterval(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..DaysValue(subElement,.addedElement)  && ..DayTimeInterval49OptGrp(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method DayTimeInterval49OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Space(subElement,.addedElement)  && ..HoursValue(subElement,.addedElement)  && ..DayTimeInterval50OptGrp(subElement,.addedElement)  {
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

Method DayTimeInterval50OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Colon(subElement,.addedElement)  && ..MinutesValue(subElement,.addedElement)  && ..DayTimeInterval51OptGrp(subElement,.addedElement)  {
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

Method DayTimeInterval51OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Colon(subElement,.addedElement)  && ..SecondsValue(subElement,.addedElement)  {
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

///  day-time literal ::= day-time interval | time interval
Method DayTimeLiteral(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..DayTimeInterval(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..TimeInterval(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  days value ::= datetime value
Method DaysValue(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..DatetimeValue(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  deallocate descriptor statement ::= DEALLOCATE DESCRIPTOR descriptor name
Method DeallocateDescriptorStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"DEALLOCATE")  && ..addKeyword(subElement,"DESCRIPTOR")  && ..DescriptorName(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  deallocate prepared statement ::= DEALLOCATE PREPARE SQL statement name
Method DeallocatePreparedStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"DEALLOCATE")  && ..addKeyword(subElement,"PREPARE")  && ..SqlStatementName(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  declare cursor ::= DECLARE cursor name [ INSENSITIVE ] [ SCROLL ] CURSOR FOR cursor specification
Method DeclareCursor(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	s done=0,ok=1,pos=..stream.pos,lastpos=pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s ret=($isobject(subElement))
		i ret $$$BNFCOMMITCOPY(subElement,ParentElement)
		q ret
	}
	$$$BNFMEMOSET(pos,"")
	d ..getBookmark(.bm)
	while ok {
	$$$BNFSTART(subElement)
		d ..gotoBookmark(.bm)
		s rec=..DeclareCursor216Recurse(subElement,.addedElement)
		i rec,..stream.pos>lastpos {
			$$$BNFMEMOSET(pos,addedElement)
			s done=1,lastpos=..stream.pos
		} else {
			s ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best 
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		i $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	q ret
}

Method DeclareCursor216Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(subElement,"DECLARE")  && ..CursorName(subElement,.addedElement)  && $S(..addKeyword(subElement,"INSENSITIVE") :1,1:1) && $S(..addKeyword(subElement,"SCROLL") :1,1:1) && ..addKeyword(subElement,"CURSOR")  && ..addKeyword(subElement,"FOR")  && ..CursorSpecification(subElement,.addedElement)  {
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

///  default clause ::= DEFAULT default option
Method DefaultClause(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"DEFAULT")  && ..DefaultOption(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  default option ::= literal | datetime value function | USER | CURRENT_USER | SESSION_USER | SYSTEM_USER | NULL
Method DefaultOption(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..Literal(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..DatetimeValueFunction(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"USER")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"CURRENT_USER")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"SESSION_USER")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"SYSTEM_USER")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"NULL")  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  default specification ::= DEFAULT
Method DefaultSpecification(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"DEFAULT")  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  delete rule ::= ON DELETE referential action
Method DeleteRule(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"ON")  && ..addKeyword(subElement,"DELETE")  && ..ReferentialAction(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  delete statement: positioned ::= DELETE FROM table name WHERE CURRENT OF cursor name
Method DeleteStatementPositioned(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"DELETE")  && ..addKeyword(subElement,"FROM")  && ..TableName(subElement,.addedElement)  && ..addKeyword(subElement,"WHERE")  && ..addKeyword(subElement,"CURRENT")  && ..addKeyword(subElement,"OF")  && ..CursorName(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  delete statement: searched ::= DELETE FROM table name [ WHERE search condition ]
Method DeleteStatementSearched(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"DELETE")  && ..addKeyword(subElement,"FROM")  && ..TableName(subElement,.addedElement)  && ..DeleteStatementSearched267OptGrp(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method DeleteStatementSearched267OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"WHERE")  && ..SearchCondition(subElement,.addedElement)  {
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

///  delimited identifier ::= double quote delimited identifier body double quote
Method DelimitedIdentifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	s done=0,ok=1,pos=..stream.pos,lastpos=pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s ret=($isobject(subElement))
		i ret $$$BNFCOMMITCOPY(subElement,ParentElement)
		q ret
	}
	$$$BNFMEMOSET(pos,"")
	d ..getBookmark(.bm)
	while ok {
	$$$BNFSTART(subElement)
		d ..gotoBookmark(.bm)
		s rec=..DelimitedIdentifier40Recurse(subElement,.addedElement)
		i rec,..stream.pos>lastpos {
			$$$BNFMEMOSET(pos,addedElement)
			s done=1,lastpos=..stream.pos
		} else {
			s ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best 
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		i $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	q ret
}

Method DelimitedIdentifier40Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..DoubleQuote(subElement,.addedElement)  && ..DelimitedIdentifierBody(subElement,.addedElement)  && ..DoubleQuote(subElement,.addedElement)  {
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

///  delimited identifier body ::= delimited identifier part...
Method DelimitedIdentifierBody(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..DelimitedIdentifierBody41RepOne(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  delimited identifier part...
Method DelimitedIdentifierBody41RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..DelimitedIdentifierPart(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  delimited identifier part ::= nondoublequote character | doublequote symbol
Method DelimitedIdentifierPart(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..NondoublequoteCharacter(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..DoublequoteSymbol(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  delimiter token ::= character string literal | date string | time string | timestamp string | delimited identifier | SQL special character | not equals operator | greater than or equals operator | less than or equals operator | concatenation operator | double period | left bracket | right bracket
Method DelimiterToken(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..CharacterStringLiteral(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..DateString(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..TimeString(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..TimestampString(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..DelimitedIdentifier(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..SqlSpecialCharacter(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..NotEqualsOperator(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..GreaterThanOrEqualsOperator(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..LessThanOrEqualsOperator(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..ConcatenationOperator(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..DoublePeriod(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..LeftBracket(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..RightBracket(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  derived column ::= value expression [ as clause ]
Method DerivedColumn(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..ValueExpression(subElement,.addedElement)  && $S(..AsClause(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  derived column list ::= column name list
Method DerivedColumnList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..ColumnNameList(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  derived table ::= table subquery
Method DerivedTable(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..TableSubquery(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  describe input statement ::= DESCRIBE INPUT SQL statement name using descriptor
Method DescribeInputStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"DESCRIBE")  && ..addKeyword(subElement,"INPUT")  && ..SqlStatementName(subElement,.addedElement)  && ..UsingDescriptor(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  describe output statement ::= DESCRIBE [ OUTPUT ] SQL statement name using descriptor
Method DescribeOutputStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"DESCRIBE")  && $S(..addKeyword(subElement,"OUTPUT") :1,1:1) && ..SqlStatementName(subElement,.addedElement)  && ..UsingDescriptor(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  describe statement ::= describe input statement | describe output statement
Method DescribeStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..DescribeInputStatement(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..DescribeOutputStatement(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  descriptor item name ::= TYPE | LENGTH | OCTET_LENGTH | RETURNED_LENGTH | RETURNED_OCTET_LENGTH | PRECISION | SCALE | DATETIME_INTERVAL_CODE | DATETIME_INTERVAL_PRECISION | NULLABLE | INDICATOR | DATA | NAME | UNNAMED | COLLATION_CATALOG | COLLATION_SCHEMA | COLLATION_NAME | CHARACTER_SET_CATALOG | CHARACTER_SET_SCHEMA | CHARACTER_SET_NAME
Method DescriptorItemName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"TYPE")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"LENGTH")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"OCTET_LENGTH")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"RETURNED_LENGTH")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"RETURNED_OCTET_LENGTH")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"PRECISION")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"SCALE")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"DATETIME_INTERVAL_CODE")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"DATETIME_INTERVAL_PRECISION")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"NULLABLE")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"INDICATOR")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"DATA")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"NAME")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"UNNAMED")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"COLLATION_CATALOG")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"COLLATION_SCHEMA")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"COLLATION_NAME")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"CHARACTER_SET_CATALOG")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"CHARACTER_SET_SCHEMA")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"CHARACTER_SET_NAME")  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  descriptor name ::= [ scope option ] simple value specification
Method DescriptorName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if $S(..ScopeOption(subElement,.addedElement) :1,1:1) && ..SimpleValueSpecification(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  diagnostics size ::= DIAGNOSTICS SIZE number of conditions
Method DiagnosticsSize(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	s done=0,ok=1,pos=..stream.pos,lastpos=pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s ret=($isobject(subElement))
		i ret $$$BNFCOMMITCOPY(subElement,ParentElement)
		q ret
	}
	$$$BNFMEMOSET(pos,"")
	d ..getBookmark(.bm)
	while ok {
	$$$BNFSTART(subElement)
		d ..gotoBookmark(.bm)
		s rec=..DiagnosticsSize279Recurse(subElement,.addedElement)
		i rec,..stream.pos>lastpos {
			$$$BNFMEMOSET(pos,addedElement)
			s done=1,lastpos=..stream.pos
		} else {
			s ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best 
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		i $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	q ret
}

Method DiagnosticsSize279Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(subElement,"DIAGNOSTICS")  && ..addKeyword(subElement,"SIZE")  && ..NumberOfConditions(subElement,.addedElement)  {
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

///  digit ::= 0 | 1 | 2 | 3 | 4 | 5 | 6 | 7 | 8 | 9
Method Digit(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addPunctuation(subElement,"0")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"1")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"2")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"3")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"4")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"5")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"6")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"7")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"8")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"9")  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  direct implementation-defined statement ::= !! See the syntax rules
Method DirectImplementationDefinedStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addPunctuation(subElement,"!!")  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  direct select statement: multiple rows ::= query expression [ order by clause ]
Method DirectSelectStatementMultipleRows(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..QueryExpression(subElement,.addedElement)  && $S(..OrderByClause(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  direct SQL data statement ::= delete statement: searched | direct select statement: multiple rows | insert statement | update statement: searched | temporary table declaration
Method DirectSqlDataStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..DeleteStatementSearched(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..DirectSelectStatementMultipleRows(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..InsertStatement(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..UpdateStatementSearched(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..TemporaryTableDeclaration(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  direct SQL statement ::= direct SQL data statement | SQL schema statement | SQL transaction statement | SQL connection statement | SQL session statement | direct implementation-defined statement
Method DirectSqlStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..DirectSqlDataStatement(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..SqlSchemaStatement(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..SqlTransactionStatement(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..SqlConnectionStatement(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..SqlSessionStatement(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..DirectImplementationDefinedStatement(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  disconnect object ::= connection object | ALL | CURRENT
Method DisconnectObject(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..ConnectionObject(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"ALL")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"CURRENT")  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  disconnect statement ::= DISCONNECT disconnect object
Method DisconnectStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"DISCONNECT")  && ..DisconnectObject(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  domain constraint ::= [ constraint name definition ] check constraint definition [ constraint attributes ]
Method DomainConstraint(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if $S(..ConstraintNameDefinition(subElement,.addedElement) :1,1:1) && ..CheckConstraintDefinition(subElement,.addedElement)  && $S(..ConstraintAttributes(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  domain definition ::= CREATE DOMAIN domain name [ AS ] data type [ default clause ] [ domain constraint ] [ collate clause ]
Method DomainDefinition(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"CREATE")  && ..addKeyword(subElement,"DOMAIN")  && ..DomainName(subElement,.addedElement)  && $S(..addKeyword(subElement,"AS") :1,1:1) && ..DataType(subElement,.addedElement)  && $S(..DefaultClause(subElement,.addedElement) :1,1:1) && $S(..DomainConstraint(subElement,.addedElement) :1,1:1) && $S(..CollateClause(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  domain name ::= qualified name
Method DomainName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..QualifiedName(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  double period ::= ..
Method DoublePeriod(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"..") {
		s done=1
	}
	if done {
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  double quote ::= "
Method DoubleQuote(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"""") {
		s done=1
	}
	if done {
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  doublequote symbol ::= double quotedouble quote
Method DoublequoteSymbol(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..DoubleQuote(subElement,.addedElement)  && ..DoubleQuote(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  drop assertion statement ::= DROP ASSERTION constraint name
Method DropAssertionStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"DROP")  && ..addKeyword(subElement,"ASSERTION")  && ..ConstraintName(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  drop behaviour ::= CASCADE | RESTRICT
Method DropBehaviour(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"CASCADE")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"RESTRICT")  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  drop character set statement ::= DROP CHARACTER SET character set name
Method DropCharacterSetStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"DROP")  && ..addKeyword(subElement,"CHARACTER")  && ..addKeyword(subElement,"SET")  && ..CharacterSetName(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  drop collation statement ::= DROP COLLATION collation name
Method DropCollationStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"DROP")  && ..addKeyword(subElement,"COLLATION")  && ..CollationName(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  drop column default clause ::= DROP DEFAULT
Method DropColumnDefaultClause(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"DROP")  && ..addKeyword(subElement,"DEFAULT")  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  drop column definition ::= DROP [ COLUMN ] column name drop behaviour
Method DropColumnDefinition(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"DROP")  && $S(..addKeyword(subElement,"COLUMN") :1,1:1) && ..ColumnName(subElement,.addedElement)  && ..DropBehaviour(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  drop domain constraint definition ::= DROP CONSTRAINT constraint name
Method DropDomainConstraintDefinition(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"DROP")  && ..addKeyword(subElement,"CONSTRAINT")  && ..ConstraintName(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  drop domain default clause ::= DROP DEFAULT
Method DropDomainDefaultClause(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"DROP")  && ..addKeyword(subElement,"DEFAULT")  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  drop domain statement ::= DROP DOMAIN domain name drop behaviour
Method DropDomainStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"DROP")  && ..addKeyword(subElement,"DOMAIN")  && ..DomainName(subElement,.addedElement)  && ..DropBehaviour(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  drop schema statement ::= DROP SCHEMA schema name drop behaviour
Method DropSchemaStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"DROP")  && ..addKeyword(subElement,"SCHEMA")  && ..SchemaName(subElement,.addedElement)  && ..DropBehaviour(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  drop table constraint definition ::= DROP CONSTRAINT constraint name drop behaviour
Method DropTableConstraintDefinition(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"DROP")  && ..addKeyword(subElement,"CONSTRAINT")  && ..ConstraintName(subElement,.addedElement)  && ..DropBehaviour(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  drop table statement ::= DROP TABLE table name drop behaviour
Method DropTableStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"DROP")  && ..addKeyword(subElement,"TABLE")  && ..TableName(subElement,.addedElement)  && ..DropBehaviour(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  drop translation statement ::= DROP TRANSLATION translation name
Method DropTranslationStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"DROP")  && ..addKeyword(subElement,"TRANSLATION")  && ..TranslationName(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  drop view statement ::= DROP VIEW table name drop behaviour
Method DropViewStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"DROP")  && ..addKeyword(subElement,"VIEW")  && ..TableName(subElement,.addedElement)  && ..DropBehaviour(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  dynamic close statement ::= CLOSE dynamic cursor name
Method DynamicCloseStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"CLOSE")  && ..DynamicCursorName(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  dynamic cursor name ::= cursor name | extended cursor name
Method DynamicCursorName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..CursorName(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..ExtendedCursorName(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  dynamic declare cursor ::= DECLARE cursor name [ INSENSITIVE ] [ SCROLL ] CURSOR FOR statement name
Method DynamicDeclareCursor(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"DECLARE")  && ..CursorName(subElement,.addedElement)  && $S(..addKeyword(subElement,"INSENSITIVE") :1,1:1) && $S(..addKeyword(subElement,"SCROLL") :1,1:1) && ..addKeyword(subElement,"CURSOR")  && ..addKeyword(subElement,"FOR")  && ..StatementName(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  dynamic delete statement: positioned ::= DELETE FROM table name WHERE CURRENT OF dynamic cursor name
Method DynamicDeleteStatementPositioned(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"DELETE")  && ..addKeyword(subElement,"FROM")  && ..TableName(subElement,.addedElement)  && ..addKeyword(subElement,"WHERE")  && ..addKeyword(subElement,"CURRENT")  && ..addKeyword(subElement,"OF")  && ..DynamicCursorName(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  dynamic fetch statement ::= FETCH [ [ fetch orientation ] FROM ] dynamic cursor name
Method DynamicFetchStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"FETCH")  && ..DynamicFetchStatement298OptGrp(subElement,.addedElement)  && ..DynamicCursorName(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method DynamicFetchStatement298OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..FetchOrientation(subElement,.addedElement) :1,1:1) && ..addKeyword(subElement,"FROM")  {
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

///  dynamic open statement ::= OPEN dynamic cursor name [ using clause ]
Method DynamicOpenStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"OPEN")  && ..DynamicCursorName(subElement,.addedElement)  && $S(..UsingClause(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  dynamic parameter specification ::= question mark
Method DynamicParameterSpecification(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..QuestionMark(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  dynamic select statement ::= cursor specification
Method DynamicSelectStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..CursorSpecification(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  dynamic single row select statement ::= query specification
Method DynamicSingleRowSelectStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..QuerySpecification(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  dynamic update statement: positioned ::= UPDATE table name SET set clause [ { comma set clause }... ] WHERE CURRENT OF dynamic cursor name
Method DynamicUpdateStatementPositioned(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"UPDATE")  && ..TableName(subElement,.addedElement)  && ..addKeyword(subElement,"SET")  && ..SetClause(subElement,.addedElement)  && $S(..DynamicUpdateStatementPositioned299RepOne(subElement,.addedElement) :1,1:1) && ..addKeyword(subElement,"WHERE")  && ..addKeyword(subElement,"CURRENT")  && ..addKeyword(subElement,"OF")  && ..DynamicCursorName(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  { comma set clause }...
Method DynamicUpdateStatementPositioned299RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..DynamicUpdateStatementPositioned300Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  comma set clause
Method DynamicUpdateStatementPositioned300Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Comma(subElement,.addedElement)  && ..SetClause(subElement,.addedElement)  {
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

///  else clause ::= ELSE result
Method ElseClause(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"ELSE")  && ..Result(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  embedded character set declaration ::= SQL NAMES ARE character set specification
Method EmbeddedCharacterSetDeclaration(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"SQL")  && ..addKeyword(subElement,"NAMES")  && ..addKeyword(subElement,"ARE")  && ..CharacterSetSpecification(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  embedded exception declaration ::= WHENEVER condition condition action
Method EmbeddedExceptionDeclaration(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"WHENEVER")  && ..Condition(subElement,.addedElement)  && ..ConditionAction(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  embedded SQL Ada program ::= !! See the syntax rules
Method EmbeddedSqlAdaProgram(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addPunctuation(subElement,"!!")  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  embedded SQL begin declare ::= SQL prefix BEGIN DECLARE SECTION [ SQL terminator ]
Method EmbeddedSqlBeginDeclare(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..SqlPrefix(subElement,.addedElement)  && ..addKeyword(subElement,"BEGIN")  && ..addKeyword(subElement,"DECLARE")  && ..addKeyword(subElement,"SECTION")  && $S(..SqlTerminator(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  embedded SQL C program ::= !! See the syntax rules
Method EmbeddedSqlCProgram(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addPunctuation(subElement,"!!")  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  embedded SQL Cobol program ::= !! See the syntax rules
Method EmbeddedSqlCobolProgram(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addPunctuation(subElement,"!!")  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  embedded SQL declare section ::= embedded SQL begin declare [ embedded character set declaration ] [ host variable definition ... ] embedded SQL end declare | embedded SQL MUMPS declare
Method EmbeddedSqlDeclareSection(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..EmbeddedSqlBeginDeclare(subElement,.addedElement)  && $S(..EmbeddedCharacterSetDeclaration(subElement,.addedElement) :1,1:1) && $S(..EmbeddedSqlDeclareSection309RepOne(subElement,.addedElement) :1,1:1) && ..EmbeddedSqlEndDeclare(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..EmbeddedSqlMumpsDeclare(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  host variable definition ...
Method EmbeddedSqlDeclareSection309RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..HostVariableDefinition(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  embedded SQL end declare ::= SQL prefix END DECLARE SECTION [ SQL terminator ]
Method EmbeddedSqlEndDeclare(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..SqlPrefix(subElement,.addedElement)  && ..addKeyword(subElement,"END")  && ..addKeyword(subElement,"DECLARE")  && ..addKeyword(subElement,"SECTION")  && $S(..SqlTerminator(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  embedded SQL Fortran program ::= !! See the syntax rules
Method EmbeddedSqlFortranProgram(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addPunctuation(subElement,"!!")  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  embedded SQL host program ::= embedded SQL Ada program | embedded SQL C program | embedded SQL Cobol program | embedded SQL Fortran program | embedded SQL MUMPS program | embedded SQL Pascal program | embedded SQL PL/I program
Method EmbeddedSqlHostProgram(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..EmbeddedSqlAdaProgram(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..EmbeddedSqlCProgram(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..EmbeddedSqlCobolProgram(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..EmbeddedSqlFortranProgram(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..EmbeddedSqlMumpsProgram(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..EmbeddedSqlPascalProgram(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..EmbeddedSqlPlIProgram(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  embedded SQL MUMPS declare ::= SQL prefix BEGIN DECLARE SECTION [ embedded character set declaration ] [ host variable definition... ] END DECLARE SECTION SQL terminator
Method EmbeddedSqlMumpsDeclare(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..SqlPrefix(subElement,.addedElement)  && ..addKeyword(subElement,"BEGIN")  && ..addKeyword(subElement,"DECLARE")  && ..addKeyword(subElement,"SECTION")  && $S(..EmbeddedCharacterSetDeclaration(subElement,.addedElement) :1,1:1) && $S(..EmbeddedSqlMumpsDeclare327RepOne(subElement,.addedElement) :1,1:1) && ..addKeyword(subElement,"END")  && ..addKeyword(subElement,"DECLARE")  && ..addKeyword(subElement,"SECTION")  && ..SqlTerminator(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  host variable definition...
Method EmbeddedSqlMumpsDeclare327RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..HostVariableDefinition(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  embedded SQL MUMPS program ::= !! See the syntax rules
Method EmbeddedSqlMumpsProgram(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addPunctuation(subElement,"!!")  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  embedded SQL Pascal program ::= !! See the syntax rules
Method EmbeddedSqlPascalProgram(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addPunctuation(subElement,"!!")  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  embedded SQL PL/I program ::= !! See the syntax rules
Method EmbeddedSqlPlIProgram(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addPunctuation(subElement,"!!")  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  embedded SQL statement ::= SQL prefix statement or declaration [ SQL terminator ]
Method EmbeddedSqlStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..SqlPrefix(subElement,.addedElement)  && ..StatementOrDeclaration(subElement,.addedElement)  && $S(..SqlTerminator(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  embedded variable name ::= colonhost identifier
Method EmbeddedVariableName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..Colon(subElement,.addedElement)  && ..HostIdentifier(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  end field ::= non-second datetime field | SECOND [ left paren interval fractional seconds precision right paren ]
Method EndField(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..NonSecondDatetimeField(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..EndField109Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method EndField109Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"SECOND")  && ..EndField110OptGrp(subElement,.addedElement)  {
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

Method EndField110OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LeftParen(subElement,.addedElement)  && ..IntervalFractionalSecondsPrecision(subElement,.addedElement)  && ..RightParen(subElement,.addedElement)  {
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

///  equals operator ::= =
Method EqualsOperator(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"=") {
		s done=1
	}
	if done {
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  escape character ::= character value expression
Method EscapeCharacter(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..CharacterValueExpression(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  exact numeric literal ::= unsigned integer [ period [ unsigned integer ] ] | period unsigned integer
Method ExactNumericLiteral(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..UnsignedInteger(subElement,.addedElement)  && ..ExactNumericLiteral5OptGrp(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..ExactNumericLiteral6Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method ExactNumericLiteral5OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Period(subElement,.addedElement)  && $S(..UnsignedInteger(subElement,.addedElement) :1,1:1) {
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

Method ExactNumericLiteral6Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Period(subElement,.addedElement)  && ..UnsignedInteger(subElement,.addedElement)  {
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

///  exact numeric type ::= NUMERIC [ left paren precision [ comma scale ] right paren ] | DECIMAL [ left paren precision [ comma scale ] right paren ] | DEC [ left paren precision [ comma scale ] right paren ] | INTEGER | INT | SMALLINT
Method ExactNumericType(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"NUMERIC")  && ..ExactNumericType92OptGrp(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..ExactNumericType94Or(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..ExactNumericType97Or(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"INTEGER")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"INT")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"SMALLINT")  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method ExactNumericType92OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LeftParen(subElement,.addedElement)  && ..Precision(subElement,.addedElement)  && ..ExactNumericType93OptGrp(subElement,.addedElement)  && ..RightParen(subElement,.addedElement)  {
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

Method ExactNumericType93OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Comma(subElement,.addedElement)  && ..Scale(subElement,.addedElement)  {
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

Method ExactNumericType94Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"DECIMAL")  && ..ExactNumericType95OptGrp(subElement,.addedElement)  {
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

Method ExactNumericType95OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LeftParen(subElement,.addedElement)  && ..Precision(subElement,.addedElement)  && ..ExactNumericType96OptGrp(subElement,.addedElement)  && ..RightParen(subElement,.addedElement)  {
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

Method ExactNumericType96OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Comma(subElement,.addedElement)  && ..Scale(subElement,.addedElement)  {
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

Method ExactNumericType97Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"DEC")  && ..ExactNumericType98OptGrp(subElement,.addedElement)  {
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

Method ExactNumericType98OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LeftParen(subElement,.addedElement)  && ..Precision(subElement,.addedElement)  && ..ExactNumericType99OptGrp(subElement,.addedElement)  && ..RightParen(subElement,.addedElement)  {
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

Method ExactNumericType99OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Comma(subElement,.addedElement)  && ..Scale(subElement,.addedElement)  {
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

///  execute immediate statement ::= EXECUTE IMMEDIATE SQL statement variable
Method ExecuteImmediateStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"EXECUTE")  && ..addKeyword(subElement,"IMMEDIATE")  && ..SqlStatementVariable(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  execute statement ::= EXECUTE SQL statement name [ result using clause ] [ parameter using clause ]
Method ExecuteStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"EXECUTE")  && ..SqlStatementName(subElement,.addedElement)  && $S(..ResultUsingClause(subElement,.addedElement) :1,1:1) && $S(..ParameterUsingClause(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  existing character set name ::= standard character repertoire name | implementation-defined character repertoire name | schema character set name
Method ExistingCharacterSetName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..StandardCharacterRepertoireName(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..ImplementationDefinedCharacterRepertoireName(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..SchemaCharacterSetName(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  exists predicate ::= EXISTS table subquery
Method ExistsPredicate(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"EXISTS")  && ..TableSubquery(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  explicit table ::= TABLE table name
Method ExplicitTable(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"TABLE")  && ..TableName(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  exponent ::= signed integer
Method Exponent(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..SignedInteger(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  extended cursor name ::= [ scope option ] simple value specification
Method ExtendedCursorName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if $S(..ScopeOption(subElement,.addedElement) :1,1:1) && ..SimpleValueSpecification(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  extended statement name ::= [ scope option ] simple value specification
Method ExtendedStatementName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if $S(..ScopeOption(subElement,.addedElement) :1,1:1) && ..SimpleValueSpecification(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  external collation ::= EXTERNAL left paren quote external collation name quote right paren
Method ExternalCollation(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	s done=0,ok=1,pos=..stream.pos,lastpos=pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s ret=($isobject(subElement))
		i ret $$$BNFCOMMITCOPY(subElement,ParentElement)
		q ret
	}
	$$$BNFMEMOSET(pos,"")
	d ..getBookmark(.bm)
	while ok {
	$$$BNFSTART(subElement)
		d ..gotoBookmark(.bm)
		s rec=..ExternalCollation252Recurse(subElement,.addedElement)
		i rec,..stream.pos>lastpos {
			$$$BNFMEMOSET(pos,addedElement)
			s done=1,lastpos=..stream.pos
		} else {
			s ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best 
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		i $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	q ret
}

Method ExternalCollation252Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(subElement,"EXTERNAL")  && ..LeftParen(subElement,.addedElement)  && ..Quote(subElement,.addedElement)  && ..ExternalCollationName(subElement,.addedElement)  && ..Quote(subElement,.addedElement)  && ..RightParen(subElement,.addedElement)  {
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

///  external collation name ::= standard collation name | implementation-defined collation name
Method ExternalCollationName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..StandardCollationName(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..ImplementationDefinedCollationName(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  external translation ::= EXTERNAL left paren quote external translation name quote right paren
Method ExternalTranslation(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	s done=0,ok=1,pos=..stream.pos,lastpos=pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s ret=($isobject(subElement))
		i ret $$$BNFCOMMITCOPY(subElement,ParentElement)
		q ret
	}
	$$$BNFMEMOSET(pos,"")
	d ..getBookmark(.bm)
	while ok {
	$$$BNFSTART(subElement)
		d ..gotoBookmark(.bm)
		s rec=..ExternalTranslation255Recurse(subElement,.addedElement)
		i rec,..stream.pos>lastpos {
			$$$BNFMEMOSET(pos,addedElement)
			s done=1,lastpos=..stream.pos
		} else {
			s ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best 
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		i $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	q ret
}

Method ExternalTranslation255Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(subElement,"EXTERNAL")  && ..LeftParen(subElement,.addedElement)  && ..Quote(subElement,.addedElement)  && ..ExternalTranslationName(subElement,.addedElement)  && ..Quote(subElement,.addedElement)  && ..RightParen(subElement,.addedElement)  {
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

///  external translation name ::= standard translation name | implementation-defined translation name
Method ExternalTranslationName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..StandardTranslationName(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..ImplementationDefinedTranslationName(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  extract expression ::= EXTRACT left paren extract field FROM extract source right paren
Method ExtractExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"EXTRACT")  && ..LeftParen(subElement,.addedElement)  && ..ExtractField(subElement,.addedElement)  && ..addKeyword(subElement,"FROM")  && ..ExtractSource(subElement,.addedElement)  && ..RightParen(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  extract field ::= datetime field | time zone field
Method ExtractField(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..DatetimeField(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..TimeZoneField(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  extract source ::= datetime value expression | interval value expression
Method ExtractSource(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..DatetimeValueExpression(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..IntervalValueExpression(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  factor ::= [ sign ] numeric primary
Method Factor(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if $S(..Sign(subElement,.addedElement) :1,1:1) && ..NumericPrimary(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  fetch orientation ::= NEXT | PRIOR | FIRST | LAST | { ABSOLUTE | RELATIVE } simple value specification
Method FetchOrientation(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"NEXT")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"PRIOR")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"FIRST")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"LAST")  {
			s done=1 ; or
		} elseif ..FetchOrientation261Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method FetchOrientation261Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..FetchOrientation262Sub(subElement,.addedElement)  && ..SimpleValueSpecification(subElement,.addedElement)  {
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

///  ABSOLUTE | RELATIVE
Method FetchOrientation262Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"ABSOLUTE")  {
		s done=1 ; or
	} elseif ..addKeyword(subElement,"RELATIVE")  {
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

///  fetch statement ::= FETCH [ [ fetch orientation ] FROM ] cursor name INTO fetch target list
Method FetchStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"FETCH")  && ..FetchStatement260OptGrp(subElement,.addedElement)  && ..CursorName(subElement,.addedElement)  && ..addKeyword(subElement,"INTO")  && ..FetchTargetList(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method FetchStatement260OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..FetchOrientation(subElement,.addedElement) :1,1:1) && ..addKeyword(subElement,"FROM")  {
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

///  fetch target list ::= target specification [ { comma target specification }... ]
Method FetchTargetList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..TargetSpecification(subElement,.addedElement)  && $S(..FetchTargetList263RepOne(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  { comma target specification }...
Method FetchTargetList263RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..FetchTargetList264Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  comma target specification
Method FetchTargetList264Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Comma(subElement,.addedElement)  && ..TargetSpecification(subElement,.addedElement)  {
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

///  fold ::= { UPPER | LOWER } left paren character value expression right paren
Method Fold(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..Fold182Sub(subElement,.addedElement)  && ..LeftParen(subElement,.addedElement)  && ..CharacterValueExpression(subElement,.addedElement)  && ..RightParen(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  UPPER | LOWER
Method Fold182Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"UPPER")  {
		s done=1 ; or
	} elseif ..addKeyword(subElement,"LOWER")  {
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

///  form-of-use conversion ::= CONVERT left paren character value expression USING form-of-use conversion name right paren
Method FormOfUseConversion(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	s done=0,ok=1,pos=..stream.pos,lastpos=pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s ret=($isobject(subElement))
		i ret $$$BNFCOMMITCOPY(subElement,ParentElement)
		q ret
	}
	$$$BNFMEMOSET(pos,"")
	d ..getBookmark(.bm)
	while ok {
	$$$BNFSTART(subElement)
		d ..gotoBookmark(.bm)
		s rec=..FormOfUseConversion183Recurse(subElement,.addedElement)
		i rec,..stream.pos>lastpos {
			$$$BNFMEMOSET(pos,addedElement)
			s done=1,lastpos=..stream.pos
		} else {
			s ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best 
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		i $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	q ret
}

Method FormOfUseConversion183Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(subElement,"CONVERT")  && ..LeftParen(subElement,.addedElement)  && ..CharacterValueExpression(subElement,.addedElement)  && ..addKeyword(subElement,"USING")  && ..FormOfUseConversionName(subElement,.addedElement)  && ..RightParen(subElement,.addedElement)  {
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

///  form-of-use conversion name ::= qualified name
Method FormOfUseConversionName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..QualifiedName(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  Fortran host identifier ::= !! See syntax rules
Method FortranHostIdentifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addPunctuation(subElement,"!!")  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  Fortran variable definition ::= ...omitted...
Method FortranVariableDefinition(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	quit 0 ; omitted rule never true
}

///  from clause ::= FROM table reference [ { comma table reference }... ]
Method FromClause(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"FROM")  && ..TableReference(subElement,.addedElement)  && $S(..FromClause157RepOne(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  { comma table reference }...
Method FromClause157RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..FromClause158Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  comma table reference
Method FromClause158Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Comma(subElement,.addedElement)  && ..TableReference(subElement,.addedElement)  {
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

///  general literal ::= character string literal | national character string literal | bit string literal | hex string literal | datetime literal | interval literal
Method GeneralLiteral(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..CharacterStringLiteral(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..NationalCharacterStringLiteral(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..BitStringLiteral(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..HexStringLiteral(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..DatetimeLiteral(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..IntervalLiteral(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  general set function ::= set function type left paren [ set quantifier ] value expression right paren
Method GeneralSetFunction(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..SetFunctionType(subElement,.addedElement)  && ..LeftParen(subElement,.addedElement)  && $S(..SetQuantifier(subElement,.addedElement) :1,1:1) && ..ValueExpression(subElement,.addedElement)  && ..RightParen(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  general value specification ::= parameter specification | dynamic parameter specification | variable specification | USER | CURRENT_USER | SESSION_USER | SYSTEM_USER | VALUE
Method GeneralValueSpecification(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..ParameterSpecification(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..DynamicParameterSpecification(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..VariableSpecification(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"USER")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"CURRENT_USER")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"SESSION_USER")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"SYSTEM_USER")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"VALUE")  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  get count ::= simple target specification 1 equals operator COUNT
Method GetCount(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..SimpleTargetSpecification1(subElement,.addedElement)  && ..EqualsOperator(subElement,.addedElement)  && ..addKeyword(subElement,"COUNT")  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  get descriptor information ::= get count | VALUE item number get item information [ { comma get item information }... ]
Method GetDescriptorInformation(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..GetCount(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..GetDescriptorInformation291Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method GetDescriptorInformation291Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"VALUE")  && ..ItemNumber(subElement,.addedElement)  && ..GetItemInformation(subElement,.addedElement)  && $S(..GetDescriptorInformation292RepOne(subElement,.addedElement) :1,1:1) {
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

///  { comma get item information }...
Method GetDescriptorInformation292RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..GetDescriptorInformation293Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  comma get item information
Method GetDescriptorInformation293Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Comma(subElement,.addedElement)  && ..GetItemInformation(subElement,.addedElement)  {
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

///  get descriptor statement ::= GET DESCRIPTOR descriptor name get descriptor information
Method GetDescriptorStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"GET")  && ..addKeyword(subElement,"DESCRIPTOR")  && ..DescriptorName(subElement,.addedElement)  && ..GetDescriptorInformation(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  get diagnostics statement ::= GET DIAGNOSTICS sql diagnostics information
Method GetDiagnosticsStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"GET")  && ..addKeyword(subElement,"DIAGNOSTICS")  && ..SqlDiagnosticsInformation(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  get item information ::= simple target specification 2 equals operator descriptor item name
Method GetItemInformation(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..SimpleTargetSpecification2(subElement,.addedElement)  && ..EqualsOperator(subElement,.addedElement)  && ..DescriptorItemName(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  go to ::= { GOTO | GO TO } goto target
Method GoTo(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	s done=0,ok=1,pos=..stream.pos,lastpos=pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s ret=($isobject(subElement))
		i ret $$$BNFCOMMITCOPY(subElement,ParentElement)
		q ret
	}
	$$$BNFMEMOSET(pos,"")
	d ..getBookmark(.bm)
	while ok {
	$$$BNFSTART(subElement)
		d ..gotoBookmark(.bm)
		s rec=..GoTo329Recurse(subElement,.addedElement)
		i rec,..stream.pos>lastpos {
			$$$BNFMEMOSET(pos,addedElement)
			s done=1,lastpos=..stream.pos
		} else {
			s ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best 
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		i $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	q ret
}

Method GoTo329Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..GoTo330Sub(subElement,.addedElement)  && ..GotoTarget(subElement,.addedElement)  {
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

///  GOTO | GO TO
Method GoTo330Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"GOTO")  {
		s done=1 ; or
	} elseif ..GoTo331Or(subElement,.addedElement)  {
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

Method GoTo331Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"GO")  && ..addKeyword(subElement,"TO")  {
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

///  goto target ::= host label identifier | unsigned integer | host PL/I label variable
Method GotoTarget(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..HostLabelIdentifier(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..UnsignedInteger(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..HostPlILabelVariable(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  grant statement ::= GRANT privileges ON object name TO grantee [ { comma grantee }... ] [ WITH GRANT OPTION ]
Method GrantStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"GRANT")  && ..Privileges(subElement,.addedElement)  && ..addKeyword(subElement,"ON")  && ..ObjectName(subElement,.addedElement)  && ..addKeyword(subElement,"TO")  && ..Grantee(subElement,.addedElement)  && $S(..GrantStatement234RepOne(subElement,.addedElement) :1,1:1) && ..GrantStatement236OptGrp(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  { comma grantee }...
Method GrantStatement234RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..GrantStatement235Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  comma grantee
Method GrantStatement235Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Comma(subElement,.addedElement)  && ..Grantee(subElement,.addedElement)  {
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

Method GrantStatement236OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"WITH")  && ..addKeyword(subElement,"GRANT")  && ..addKeyword(subElement,"OPTION")  {
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

///  grantee ::= PUBLIC | authorization identifier
Method Grantee(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"PUBLIC")  {
			s done=1 ; or
		} elseif ..AuthorizationIdentifier(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  greater than operator ::= >
Method GreaterThanOperator(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,">") {
		s done=1
	}
	if done {
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  greater than or equals operator ::= >=
Method GreaterThanOrEqualsOperator(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,">=") {
		s done=1
	}
	if done {
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  group by clause ::= GROUP BY grouping column reference list
Method GroupByClause(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"GROUP")  && ..addKeyword(subElement,"BY")  && ..GroupingColumnReferenceList(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  grouping column reference ::= column reference [ collate clause ]
Method GroupingColumnReference(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..ColumnReference(subElement,.addedElement)  && $S(..CollateClause(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  grouping column reference list ::= grouping column reference [ { comma grouping column reference }... ]
Method GroupingColumnReferenceList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..GroupingColumnReference(subElement,.addedElement)  && $S(..GroupingColumnReferenceList166RepOne(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  { comma grouping column reference }...
Method GroupingColumnReferenceList166RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..GroupingColumnReferenceList167Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  comma grouping column reference
Method GroupingColumnReferenceList167Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Comma(subElement,.addedElement)  && ..GroupingColumnReference(subElement,.addedElement)  {
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

///  having clause ::= HAVING search condition
Method HavingClause(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"HAVING")  && ..SearchCondition(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  hex string literal ::= X quote [ hexit ... ] quote [ { separator... quote [ hexit... ] quote }... ]
Method HexStringLiteral(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"X")  && ..Quote(subElement,.addedElement)  && $S(..HexStringLiteral24RepOne(subElement,.addedElement) :1,1:1) && ..Quote(subElement,.addedElement)  && $S(..HexStringLiteral25RepOne(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  hexit ...
Method HexStringLiteral24RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..Hexit(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  { separator... quote [ hexit... ] quote }...
Method HexStringLiteral25RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..HexStringLiteral26Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  separator... quote [ hexit... ] quote
Method HexStringLiteral26Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..HexStringLiteral27RepOne(subElement,.addedElement)  && ..Quote(subElement,.addedElement)  && $S(..HexStringLiteral28RepOne(subElement,.addedElement) :1,1:1) && ..Quote(subElement,.addedElement)  {
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

///  separator...
Method HexStringLiteral27RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..Separator(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  hexit...
Method HexStringLiteral28RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..Hexit(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  hexit ::= digit | A | B | C | D | E | F | a | b | c | d | e | f
Method Hexit(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..Digit(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"A")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"B")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"C")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"D")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"E")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"F")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"A")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"B")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"C")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"D")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"E")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"F")  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  high ::= 2 | High left paren 2 right paren
Method High(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	s done=0,ok=1,pos=..stream.pos,lastpos=pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s ret=($isobject(subElement))
		i ret $$$BNFCOMMITCOPY(subElement,ParentElement)
		q ret
	}
	$$$BNFMEMOSET(pos,"")
	d ..getBookmark(.bm)
	while ok {
	$$$BNFSTART(subElement)
		d ..gotoBookmark(.bm)
		s rec=..High345Recurse(subElement,.addedElement)
		i rec,..stream.pos>lastpos {
			$$$BNFMEMOSET(pos,addedElement)
			s done=1,lastpos=..stream.pos
		} else {
			s ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best 
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		i $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	q ret
}

Method High345Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..addPunctuation(subElement,"2")  {
		s done=1 ; or
	} elseif ..High346Or(subElement,.addedElement)  {
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

Method High346Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"HIGH")  && ..LeftParen(subElement,.addedElement)  && ..addPunctuation(subElement,"2")  && ..RightParen(subElement,.addedElement)  {
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

///  host identifier ::= Ada host identifier | C host identifier | Cobol host identifier | Fortran host identifier | MUMPS host identifier | Pascal host identifier | PL/I host identifier
Method HostIdentifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	s done=0,ok=1,pos=..stream.pos,lastpos=pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s ret=($isobject(subElement))
		i ret $$$BNFCOMMITCOPY(subElement,ParentElement)
		q ret
	}
	$$$BNFMEMOSET(pos,"")
	d ..getBookmark(.bm)
	while ok {
	$$$BNFSTART(subElement)
		d ..gotoBookmark(.bm)
		s rec=..HostIdentifier146Recurse(subElement,.addedElement)
		i rec,..stream.pos>lastpos {
			$$$BNFMEMOSET(pos,addedElement)
			s done=1,lastpos=..stream.pos
		} else {
			s ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best 
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		i $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	q ret
}

Method HostIdentifier146Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..AdaHostIdentifier(subElement,.addedElement)  {
		s done=1 ; or
	} elseif ..CHostIdentifier(subElement,.addedElement)  {
		s done=1 ; or
	} elseif ..CobolHostIdentifier(subElement,.addedElement)  {
		s done=1 ; or
	} elseif ..FortranHostIdentifier(subElement,.addedElement)  {
		s done=1 ; or
	} elseif ..MumpsHostIdentifier(subElement,.addedElement)  {
		s done=1 ; or
	} elseif ..PascalHostIdentifier(subElement,.addedElement)  {
		s done=1 ; or
	} elseif ..PlIHostIdentifier(subElement,.addedElement)  {
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

///  host label identifier ::= !! See the syntax rules
Method HostLabelIdentifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addPunctuation(subElement,"!!")  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  host PL/I label variable ::= !! See the syntax rules
Method HostPlILabelVariable(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addPunctuation(subElement,"!!")  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  host variable definition ::= Ada variable definition | C variable definition | Cobol variable definition | Fortran variable definition | MUMPS variable definition | Pascal variable definition | PL/I variable definition
Method HostVariableDefinition(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..AdaVariableDefinition(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..CVariableDefinition(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..CobolVariableDefinition(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..FortranVariableDefinition(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..MumpsVariableDefinition(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..PascalVariableDefinition(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..PlIVariableDefinition(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  hours value ::= datetime value
Method HoursValue(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..DatetimeValue(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  identifier ::= [ introducercharacter set specification ] actual identifier
Method Identifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	s done=0,ok=1,pos=..stream.pos,lastpos=pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s ret=($isobject(subElement))
		i ret $$$BNFCOMMITCOPY(subElement,ParentElement)
		q ret
	}
	$$$BNFMEMOSET(pos,"")
	d ..getBookmark(.bm)
	while ok {
	$$$BNFSTART(subElement)
		d ..gotoBookmark(.bm)
		s rec=..Identifier38Recurse(subElement,.addedElement)
		i rec,..stream.pos>lastpos {
			$$$BNFMEMOSET(pos,addedElement)
			s done=1,lastpos=..stream.pos
		} else {
			s ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best 
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		i $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	q ret
}

Method Identifier38Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..Identifier39OptGrp(subElement,.addedElement)  && ..ActualIdentifier(subElement,.addedElement)  {
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

Method Identifier39OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Introducer(subElement,.addedElement)  && ..CharacterSetSpecification(subElement,.addedElement)  {
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

///  identifier body ::= identifier start [ { underscore | identifier part } ... ]
Method IdentifierBody(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..IdentifierStart(subElement,.addedElement)  && $S(..IdentifierBody3RepOne(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  { underscore | identifier part } ...
Method IdentifierBody3RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..IdentifierBody4Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  underscore | identifier part
Method IdentifierBody4Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Underscore(subElement,.addedElement)  {
		s done=1 ; or
	} elseif ..IdentifierPart(subElement,.addedElement)  {
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

///  identifier part ::= identifier start | digit
Method IdentifierPart(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..IdentifierStart(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..Digit(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  identifier start ::= !! See the Syntax rules
Method IdentifierStart(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addPunctuation(subElement,"!!")  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  implementation-defined character repertoire name ::= character set name
Method ImplementationDefinedCharacterRepertoireName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..CharacterSetName(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  implementation-defined collation name ::= collation name
Method ImplementationDefinedCollationName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..CollationName(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  implementation-defined translation name ::= translation name
Method ImplementationDefinedTranslationName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..TranslationName(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  implementation-defined universal character form-of-use name ::= character set name
Method ImplementationDefinedUniversalCharacterFormOfUseName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..CharacterSetName(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  in predicate ::= row value constructor [ NOT ] IN in predicate value
Method InPredicate(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	s done=0,ok=1,pos=..stream.pos,lastpos=pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s ret=($isobject(subElement))
		i ret $$$BNFCOMMITCOPY(subElement,ParentElement)
		q ret
	}
	$$$BNFMEMOSET(pos,"")
	d ..getBookmark(.bm)
	while ok {
	$$$BNFSTART(subElement)
		d ..gotoBookmark(.bm)
		s rec=..InPredicate205Recurse(subElement,.addedElement)
		i rec,..stream.pos>lastpos {
			$$$BNFMEMOSET(pos,addedElement)
			s done=1,lastpos=..stream.pos
		} else {
			s ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best 
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		i $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	q ret
}

Method InPredicate205Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..RowValueConstructor(subElement,.addedElement)  && $S(..addKeyword(subElement,"NOT") :1,1:1) && ..addKeyword(subElement,"IN")  && ..InPredicateValue(subElement,.addedElement)  {
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

///  in predicate value ::= table subquery | left paren in value list right paren
Method InPredicateValue(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..TableSubquery(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..InPredicateValue206Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method InPredicateValue206Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..LeftParen(subElement,.addedElement)  && ..InValueList(subElement,.addedElement)  && ..RightParen(subElement,.addedElement)  {
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

///  in value list ::= value expression { comma value expression } ...
Method InValueList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..ValueExpression(subElement,.addedElement)  && ..InValueList207RepOne(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  { comma value expression } ...
Method InValueList207RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..InValueList208Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  comma value expression
Method InValueList208Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Comma(subElement,.addedElement)  && ..ValueExpression(subElement,.addedElement)  {
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

///  indicator parameter ::= [ INDICATOR ] parameter name
Method IndicatorParameter(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if $S(..addKeyword(subElement,"INDICATOR") :1,1:1) && ..ParameterName(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  indicator variable ::= [ INDICATOR ] embedded variable name
Method IndicatorVariable(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if $S(..addKeyword(subElement,"INDICATOR") :1,1:1) && ..EmbeddedVariableName(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  insert column list ::= column name list
Method InsertColumnList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..ColumnNameList(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  insert columns and source ::= [ left paren insert column list right paren ] query expression | DEFAULT VALUES
Method InsertColumnsAndSource(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..InsertColumnsAndSource268OptGrp(subElement,.addedElement)  && ..QueryExpression(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..InsertColumnsAndSource269Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method InsertColumnsAndSource268OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LeftParen(subElement,.addedElement)  && ..InsertColumnList(subElement,.addedElement)  && ..RightParen(subElement,.addedElement)  {
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

Method InsertColumnsAndSource269Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"DEFAULT")  && ..addKeyword(subElement,"VALUES")  {
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

///  insert statement ::= INSERT INTO table name insert columns and source
Method InsertStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"INSERT")  && ..addKeyword(subElement,"INTO")  && ..TableName(subElement,.addedElement)  && ..InsertColumnsAndSource(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  integrity no ::= 0 | IntegrityNo left paren 0 right paren
Method IntegrityNo(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addPunctuation(subElement,"0")  {
			s done=1 ; or
		} elseif ..IntegrityNo338Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method IntegrityNo338Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"INTEGRITYNO")  && ..LeftParen(subElement,.addedElement)  && ..addPunctuation(subElement,"0")  && ..RightParen(subElement,.addedElement)  {
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

///  integrity yes ::= 1 | IntegrityYes left paren 1 right paren
Method IntegrityYes(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addPunctuation(subElement,"1")  {
			s done=1 ; or
		} elseif ..IntegrityYes339Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method IntegrityYes339Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"INTEGRITYYES")  && ..LeftParen(subElement,.addedElement)  && ..addPunctuation(subElement,"1")  && ..RightParen(subElement,.addedElement)  {
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

///  intermediate ::= 1 | Intermediate left paren 1 right paren
Method Intermediate(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	s done=0,ok=1,pos=..stream.pos,lastpos=pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s ret=($isobject(subElement))
		i ret $$$BNFCOMMITCOPY(subElement,ParentElement)
		q ret
	}
	$$$BNFMEMOSET(pos,"")
	d ..getBookmark(.bm)
	while ok {
	$$$BNFSTART(subElement)
		d ..gotoBookmark(.bm)
		s rec=..Intermediate343Recurse(subElement,.addedElement)
		i rec,..stream.pos>lastpos {
			$$$BNFMEMOSET(pos,addedElement)
			s done=1,lastpos=..stream.pos
		} else {
			s ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best 
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		i $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	q ret
}

Method Intermediate343Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..addPunctuation(subElement,"1")  {
		s done=1 ; or
	} elseif ..Intermediate344Or(subElement,.addedElement)  {
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

Method Intermediate344Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"INTERMEDIATE")  && ..LeftParen(subElement,.addedElement)  && ..addPunctuation(subElement,"1")  && ..RightParen(subElement,.addedElement)  {
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

///  interval factor ::= [ sign ] interval primary
Method IntervalFactor(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if $S(..Sign(subElement,.addedElement) :1,1:1) && ..IntervalPrimary(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  interval fractional seconds precision ::= unsigned integer
Method IntervalFractionalSecondsPrecision(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..UnsignedInteger(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  interval leading field precision ::= unsigned integer
Method IntervalLeadingFieldPrecision(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..UnsignedInteger(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  interval literal ::= INTERVAL [ sign ] interval string interval qualifier
Method IntervalLiteral(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"INTERVAL")  && $S(..Sign(subElement,.addedElement) :1,1:1) && ..IntervalString(subElement,.addedElement)  && ..IntervalQualifier(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  interval primary ::= value expression primary [ interval qualifier ]
Method IntervalPrimary(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..ValueExpressionPrimary(subElement,.addedElement)  && $S(..IntervalQualifier(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  interval qualifier ::= start field TO end field | single datetime field
Method IntervalQualifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..StartField(subElement,.addedElement)  && ..addKeyword(subElement,"TO")  && ..EndField(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..SingleDatetimeField(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  interval string ::= quote { year-month literal | day-time literal } quote
Method IntervalString(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..Quote(subElement,.addedElement)  && ..IntervalString46Sub(subElement,.addedElement)  && ..Quote(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  year-month literal | day-time literal
Method IntervalString46Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..YearMonthLiteral(subElement,.addedElement)  {
		s done=1 ; or
	} elseif ..DayTimeLiteral(subElement,.addedElement)  {
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

///  interval term ::= interval factor | interval term 2 asterisk factor | interval term 2 solidus factor | term asterisk interval factor
Method IntervalTerm(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	s done=0,ok=1,pos=..stream.pos,lastpos=pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s ret=($isobject(subElement))
		i ret $$$BNFCOMMITCOPY(subElement,ParentElement)
		q ret
	}
	$$$BNFMEMOSET(pos,"")
	d ..getBookmark(.bm)
	while ok {
	$$$BNFSTART(subElement)
		d ..gotoBookmark(.bm)
		s rec=..IntervalTerm191Recurse(subElement,.addedElement)
		i rec,..stream.pos>lastpos {
			$$$BNFMEMOSET(pos,addedElement)
			s done=1,lastpos=..stream.pos
		} else {
			s ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best 
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		i $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	q ret
}

///  interval term 1 ::= interval term
Method IntervalTerm1(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..IntervalTerm(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method IntervalTerm191Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..IntervalFactor(subElement,.addedElement)  {
		s done=1 ; or
	} elseif ..IntervalTerm192Or(subElement,.addedElement)  {
		s done=1 ; or
	} elseif ..IntervalTerm193Or(subElement,.addedElement)  {
		s done=1 ; or
	} elseif ..IntervalTerm194Or(subElement,.addedElement)  {
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

Method IntervalTerm192Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..IntervalTerm2(subElement,.addedElement)  && ..Asterisk(subElement,.addedElement)  && ..Factor(subElement,.addedElement)  {
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

Method IntervalTerm193Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..IntervalTerm2(subElement,.addedElement)  && ..Solidus(subElement,.addedElement)  && ..Factor(subElement,.addedElement)  {
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

Method IntervalTerm194Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Term(subElement,.addedElement)  && ..Asterisk(subElement,.addedElement)  && ..IntervalFactor(subElement,.addedElement)  {
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

///  interval term 2 ::= interval term
Method IntervalTerm2(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..IntervalTerm(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  interval type ::= INTERVAL interval qualifier
Method IntervalType(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"INTERVAL")  && ..IntervalQualifier(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  interval value expression ::= interval term | interval value expression 1 plus sign interval term 1 | interval value expression 1 minus sign interval term 1 | left paren datetime value expression minus sign datetime term right paren interval qualifier
Method IntervalValueExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	s done=0,ok=1,pos=..stream.pos,lastpos=pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s ret=($isobject(subElement))
		i ret $$$BNFCOMMITCOPY(subElement,ParentElement)
		q ret
	}
	$$$BNFMEMOSET(pos,"")
	d ..getBookmark(.bm)
	while ok {
	$$$BNFSTART(subElement)
		d ..gotoBookmark(.bm)
		s rec=..IntervalValueExpression195Recurse(subElement,.addedElement)
		i rec,..stream.pos>lastpos {
			$$$BNFMEMOSET(pos,addedElement)
			s done=1,lastpos=..stream.pos
		} else {
			s ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best 
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		i $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	q ret
}

///  interval value expression 1 ::= interval value expression
Method IntervalValueExpression1(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..IntervalValueExpression(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method IntervalValueExpression195Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..IntervalTerm(subElement,.addedElement)  {
		s done=1 ; or
	} elseif ..IntervalValueExpression196Or(subElement,.addedElement)  {
		s done=1 ; or
	} elseif ..IntervalValueExpression197Or(subElement,.addedElement)  {
		s done=1 ; or
	} elseif ..IntervalValueExpression198Or(subElement,.addedElement)  {
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

Method IntervalValueExpression196Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..IntervalValueExpression1(subElement,.addedElement)  && ..PlusSign(subElement,.addedElement)  && ..IntervalTerm1(subElement,.addedElement)  {
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

Method IntervalValueExpression197Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..IntervalValueExpression1(subElement,.addedElement)  && ..MinusSign(subElement,.addedElement)  && ..IntervalTerm1(subElement,.addedElement)  {
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

Method IntervalValueExpression198Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LeftParen(subElement,.addedElement)  && ..DatetimeValueExpression(subElement,.addedElement)  && ..MinusSign(subElement,.addedElement)  && ..DatetimeTerm(subElement,.addedElement)  && ..RightParen(subElement,.addedElement)  && ..IntervalQualifier(subElement,.addedElement)  {
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

///  introducer ::= underscore
Method Introducer(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..Underscore(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  isolation level ::= ISOLATION LEVEL level of isolation
Method IsolationLevel(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	s done=0,ok=1,pos=..stream.pos,lastpos=pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s ret=($isobject(subElement))
		i ret $$$BNFCOMMITCOPY(subElement,ParentElement)
		q ret
	}
	$$$BNFMEMOSET(pos,"")
	d ..getBookmark(.bm)
	while ok {
	$$$BNFSTART(subElement)
		d ..gotoBookmark(.bm)
		s rec=..IsolationLevel275Recurse(subElement,.addedElement)
		i rec,..stream.pos>lastpos {
			$$$BNFMEMOSET(pos,addedElement)
			s done=1,lastpos=..stream.pos
		} else {
			s ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best 
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		i $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	q ret
}

Method IsolationLevel275Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(subElement,"ISOLATION")  && ..addKeyword(subElement,"LEVEL")  && ..LevelOfIsolation(subElement,.addedElement)  {
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

///  item number ::= simple value specification
Method ItemNumber(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..SimpleValueSpecification(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  join column list ::= column name list
Method JoinColumnList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..ColumnNameList(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  join condition ::= ON search condition
Method JoinCondition(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"ON")  && ..SearchCondition(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  join specification ::= join condition | named columns join
Method JoinSpecification(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..JoinCondition(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..NamedColumnsJoin(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  join type ::= INNER | outer join type [ OUTER ] | UNION
Method JoinType(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	s done=0,ok=1,pos=..stream.pos,lastpos=pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s ret=($isobject(subElement))
		i ret $$$BNFCOMMITCOPY(subElement,ParentElement)
		q ret
	}
	$$$BNFMEMOSET(pos,"")
	d ..getBookmark(.bm)
	while ok {
	$$$BNFSTART(subElement)
		d ..gotoBookmark(.bm)
		s rec=..JoinType164Recurse(subElement,.addedElement)
		i rec,..stream.pos>lastpos {
			$$$BNFMEMOSET(pos,addedElement)
			s done=1,lastpos=..stream.pos
		} else {
			s ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best 
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		i $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	q ret
}

Method JoinType164Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(subElement,"INNER")  {
		s done=1 ; or
	} elseif ..JoinType165Or(subElement,.addedElement)  {
		s done=1 ; or
	} elseif ..addKeyword(subElement,"UNION")  {
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

Method JoinType165Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..OuterJoinType(subElement,.addedElement)  && $S(..addKeyword(subElement,"OUTER") :1,1:1) {
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

///  joined table ::= cross join | qualified join | left paren joined table right paren
Method JoinedTable(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	s done=0,ok=1,pos=..stream.pos,lastpos=pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s ret=($isobject(subElement))
		i ret $$$BNFCOMMITCOPY(subElement,ParentElement)
		q ret
	}
	$$$BNFMEMOSET(pos,"")
	d ..getBookmark(.bm)
	while ok {
	$$$BNFSTART(subElement)
		d ..gotoBookmark(.bm)
		s rec=..JoinedTable161Recurse(subElement,.addedElement)
		i rec,..stream.pos>lastpos {
			$$$BNFMEMOSET(pos,addedElement)
			s done=1,lastpos=..stream.pos
		} else {
			s ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best 
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		i $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	q ret
}

Method JoinedTable161Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..CrossJoin(subElement,.addedElement)  {
		s done=1 ; or
	} elseif ..QualifiedJoin(subElement,.addedElement)  {
		s done=1 ; or
	} elseif ..JoinedTable162Or(subElement,.addedElement)  {
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

Method JoinedTable162Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LeftParen(subElement,.addedElement)  && ..JoinedTable(subElement,.addedElement)  && ..RightParen(subElement,.addedElement)  {
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

///  key word ::= reserved word | non-reserved word
Method KeyWord(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..ReservedWord(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..NonReservedWord(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  language clause ::= LANGUAGE language name
Method LanguageClause(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"LANGUAGE")  && ..LanguageName(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  language name ::= ADA | C | COBOL | FORTRAN | MUMPS | PASCAL | PLI
Method LanguageName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"ADA")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"C")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"COBOL")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"FORTRAN")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"MUMPS")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"PASCAL")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"PLI")  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  left bracket ::= [
Method LeftBracket(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"[") {
		s done=1
	}
	if done {
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  left paren ::= (
Method LeftParen(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"(") {
		s done=1
	}
	if done {
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  length ::= unsigned integer
Method Length(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..UnsignedInteger(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  length expression ::= char length expression | octet length expression | bit length expression
Method LengthExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	s done=0,ok=1,pos=..stream.pos,lastpos=pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s ret=($isobject(subElement))
		i ret $$$BNFCOMMITCOPY(subElement,ParentElement)
		q ret
	}
	$$$BNFMEMOSET(pos,"")
	d ..getBookmark(.bm)
	while ok {
	$$$BNFSTART(subElement)
		d ..gotoBookmark(.bm)
		s rec=..LengthExpression201Recurse(subElement,.addedElement)
		i rec,..stream.pos>lastpos {
			$$$BNFMEMOSET(pos,addedElement)
			s done=1,lastpos=..stream.pos
		} else {
			s ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best 
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		i $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	q ret
}

Method LengthExpression201Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..CharLengthExpression(subElement,.addedElement)  {
		s done=1 ; or
	} elseif ..OctetLengthExpression(subElement,.addedElement)  {
		s done=1 ; or
	} elseif ..BitLengthExpression(subElement,.addedElement)  {
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

///  less than operator ::= <
Method LessThanOperator(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"<") {
		s done=1
	}
	if done {
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  less than or equals operator ::= <=
Method LessThanOrEqualsOperator(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"<=") {
		s done=1
	}
	if done {
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  level of isolation ::= READ UNCOMMITTED | READ COMMITTED | REPEATABLE READ | SERIALIZABLE
Method LevelOfIsolation(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"READ")  && ..addKeyword(subElement,"UNCOMMITTED")  {
			s done=1 ; or
		} elseif ..LevelOfIsolation276Or(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..LevelOfIsolation277Or(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"SERIALIZABLE")  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method LevelOfIsolation276Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"READ")  && ..addKeyword(subElement,"COMMITTED")  {
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

Method LevelOfIsolation277Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"REPEATABLE")  && ..addKeyword(subElement,"READ")  {
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

///  levels clause ::= CASCADED | LOCAL
Method LevelsClause(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"CASCADED")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"LOCAL")  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  like predicate ::= match value [ NOT ] LIKE pattern [ ESCAPE escape character ]
Method LikePredicate(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..MatchValue(subElement,.addedElement)  && $S(..addKeyword(subElement,"NOT") :1,1:1) && ..addKeyword(subElement,"LIKE")  && ..Pattern(subElement,.addedElement)  && ..LikePredicate209OptGrp(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method LikePredicate209OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"ESCAPE")  && ..EscapeCharacter(subElement,.addedElement)  {
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

///  limited collation definition ::= COLLATION FROM collation source
Method LimitedCollationDefinition(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"COLLATION")  && ..addKeyword(subElement,"FROM")  && ..CollationSource(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  literal ::= signed numeric literal | general literal
Method Literal(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	s done=0,ok=1,pos=..stream.pos,lastpos=pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s ret=($isobject(subElement))
		i ret $$$BNFCOMMITCOPY(subElement,ParentElement)
		q ret
	}
	$$$BNFMEMOSET(pos,"")
	d ..getBookmark(.bm)
	while ok {
	$$$BNFSTART(subElement)
		d ..gotoBookmark(.bm)
		s rec=..Literal116Recurse(subElement,.addedElement)
		i rec,..stream.pos>lastpos {
			$$$BNFMEMOSET(pos,addedElement)
			s done=1,lastpos=..stream.pos
		} else {
			s ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best 
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		i $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	q ret
}

Method Literal116Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..SignedNumericLiteral(subElement,.addedElement)  {
		s done=1 ; or
	} elseif ..GeneralLiteral(subElement,.addedElement)  {
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

///  local table name ::= qualified identifier
Method LocalTableName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..QualifiedIdentifier(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  low ::= 0 | Low left paren 0 right paren
Method Low(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	s done=0,ok=1,pos=..stream.pos,lastpos=pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s ret=($isobject(subElement))
		i ret $$$BNFCOMMITCOPY(subElement,ParentElement)
		q ret
	}
	$$$BNFMEMOSET(pos,"")
	d ..getBookmark(.bm)
	while ok {
	$$$BNFSTART(subElement)
		d ..gotoBookmark(.bm)
		s rec=..Low341Recurse(subElement,.addedElement)
		i rec,..stream.pos>lastpos {
			$$$BNFMEMOSET(pos,addedElement)
			s done=1,lastpos=..stream.pos
		} else {
			s ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best 
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		i $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	q ret
}

Method Low341Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..addPunctuation(subElement,"0")  {
		s done=1 ; or
	} elseif ..Low342Or(subElement,.addedElement)  {
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

Method Low342Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"LOW")  && ..LeftParen(subElement,.addedElement)  && ..addPunctuation(subElement,"0")  && ..RightParen(subElement,.addedElement)  {
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

///  mantissa ::= exact numeric literal
Method Mantissa(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..ExactNumericLiteral(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  match predicate ::= row value constructor MATCH [ UNIQUE ] [ PARTIAL | FULL ] table subquery
Method MatchPredicate(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..RowValueConstructor(subElement,.addedElement)  && ..addKeyword(subElement,"MATCH")  && $S(..addKeyword(subElement,"UNIQUE") :1,1:1) && ..MatchPredicate212OptGrp(subElement,.addedElement)  && ..TableSubquery(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method MatchPredicate212OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"PARTIAL")  {
		s done=1 ; or
	} elseif ..addKeyword(subElement,"FULL")  {
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

///  match type ::= FULL | PARTIAL
Method MatchType(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"FULL")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"PARTIAL")  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  match value ::= character value expression
Method MatchValue(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..CharacterValueExpression(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  minus sign ::= -
Method MinusSign(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"-") {
		s done=1
	}
	if done {
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  minutes value ::= datetime value
Method MinutesValue(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..DatetimeValue(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  module ::= module name clause language clause module authorization clause [ temporary table declaration... ] module contents...
Method Module(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	s done=0,ok=1,pos=..stream.pos,lastpos=pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s ret=($isobject(subElement))
		i ret $$$BNFCOMMITCOPY(subElement,ParentElement)
		q ret
	}
	$$$BNFMEMOSET(pos,"")
	d ..getBookmark(.bm)
	while ok {
	$$$BNFSTART(subElement)
		d ..gotoBookmark(.bm)
		s rec=..Module56Recurse(subElement,.addedElement)
		i rec,..stream.pos>lastpos {
			$$$BNFMEMOSET(pos,addedElement)
			s done=1,lastpos=..stream.pos
		} else {
			s ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best 
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		i $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	q ret
}

Method Module56Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..ModuleNameClause(subElement,.addedElement)  && ..LanguageClause(subElement,.addedElement)  && ..ModuleAuthorizationClause(subElement,.addedElement)  && $S(..Module57RepOne(subElement,.addedElement) :1,1:1) && ..Module58RepOne(subElement,.addedElement)  {
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

///  temporary table declaration...
Method Module57RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..TemporaryTableDeclaration(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  module contents...
Method Module58RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..ModuleContents(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  module authorization clause ::= SCHEMA schema name | AUTHORIZATION module authorization identifier | SCHEMA schema name AUTHORIZATION module authorization identifier
Method ModuleAuthorizationClause(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"SCHEMA")  && ..SchemaName(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..ModuleAuthorizationClause59Or(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..ModuleAuthorizationClause60Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method ModuleAuthorizationClause59Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"AUTHORIZATION")  && ..ModuleAuthorizationIdentifier(subElement,.addedElement)  {
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

Method ModuleAuthorizationClause60Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"SCHEMA")  && ..SchemaName(subElement,.addedElement)  && ..addKeyword(subElement,"AUTHORIZATION")  && ..ModuleAuthorizationIdentifier(subElement,.addedElement)  {
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

///  module authorization identifier ::= authorization identifier
Method ModuleAuthorizationIdentifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..AuthorizationIdentifier(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  module character set specification ::= NAMES ARE character set specification
Method ModuleCharacterSetSpecification(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"NAMES")  && ..addKeyword(subElement,"ARE")  && ..CharacterSetSpecification(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  module contents ::= declare cursor | dynamic declare cursor | procedure
Method ModuleContents(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..DeclareCursor(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..DynamicDeclareCursor(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..Procedure(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  module name ::= identifier
Method ModuleName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..Identifier(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  module name clause ::= MODULE [ module name ] [ module character set specification ]
Method ModuleNameClause(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"MODULE")  && $S(..ModuleName(subElement,.addedElement) :1,1:1) && $S(..ModuleCharacterSetSpecification(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  months value ::= datetime value
Method MonthsValue(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..DatetimeValue(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  MUMPS host identifier ::= !! See syntax rules
Method MumpsHostIdentifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addPunctuation(subElement,"!!")  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  MUMPS variable definition ::= ...omitted...
Method MumpsVariableDefinition(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	quit 0 ; omitted rule never true
}

///  named columns join ::= USING left paren join column list right paren
Method NamedColumnsJoin(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"USING")  && ..LeftParen(subElement,.addedElement)  && ..JoinColumnList(subElement,.addedElement)  && ..RightParen(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  national character string literal ::= N quote [ character representation ... ] quote [ { separator... quote [ character representation... ] quote }... ]
Method NationalCharacterStringLiteral(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"N")  && ..Quote(subElement,.addedElement)  && $S(..NationalCharacterStringLiteral9RepOne(subElement,.addedElement) :1,1:1) && ..Quote(subElement,.addedElement)  && $S(..NationalCharacterStringLiteral10RepOne(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  { separator... quote [ character representation... ] quote }...
Method NationalCharacterStringLiteral10RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..NationalCharacterStringLiteral11Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  separator... quote [ character representation... ] quote
Method NationalCharacterStringLiteral11Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..NationalCharacterStringLiteral12RepOne(subElement,.addedElement)  && ..Quote(subElement,.addedElement)  && $S(..NationalCharacterStringLiteral13RepOne(subElement,.addedElement) :1,1:1) && ..Quote(subElement,.addedElement)  {
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

///  separator...
Method NationalCharacterStringLiteral12RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..Separator(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  character representation...
Method NationalCharacterStringLiteral13RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..CharacterRepresentation(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  character representation ...
Method NationalCharacterStringLiteral9RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..CharacterRepresentation(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  national character string type ::= NATIONAL CHARACTER [ left paren length right paren ] | NATIONAL CHAR [ left paren length right paren ] | NCHAR [ left paren length right paren ] | NATIONAL CHARACTER VARYING [ left paren length right paren ] | NATIONAL CHAR VARYING [ left paren length right paren ] | NCHAR VARYING [ left paren length right paren ]
Method NationalCharacterStringType(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"NATIONAL")  && ..addKeyword(subElement,"CHARACTER")  && ..NationalCharacterStringType77OptGrp(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..NationalCharacterStringType78Or(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..NationalCharacterStringType80Or(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..NationalCharacterStringType82Or(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..NationalCharacterStringType84Or(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..NationalCharacterStringType86Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method NationalCharacterStringType77OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LeftParen(subElement,.addedElement)  && ..Length(subElement,.addedElement)  && ..RightParen(subElement,.addedElement)  {
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

Method NationalCharacterStringType78Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"NATIONAL")  && ..addKeyword(subElement,"CHAR")  && ..NationalCharacterStringType79OptGrp(subElement,.addedElement)  {
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

Method NationalCharacterStringType79OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LeftParen(subElement,.addedElement)  && ..Length(subElement,.addedElement)  && ..RightParen(subElement,.addedElement)  {
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

Method NationalCharacterStringType80Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"NCHAR")  && ..NationalCharacterStringType81OptGrp(subElement,.addedElement)  {
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

Method NationalCharacterStringType81OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LeftParen(subElement,.addedElement)  && ..Length(subElement,.addedElement)  && ..RightParen(subElement,.addedElement)  {
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

Method NationalCharacterStringType82Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"NATIONAL")  && ..addKeyword(subElement,"CHARACTER")  && ..addKeyword(subElement,"VARYING")  && ..NationalCharacterStringType83OptGrp(subElement,.addedElement)  {
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

Method NationalCharacterStringType83OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LeftParen(subElement,.addedElement)  && ..Length(subElement,.addedElement)  && ..RightParen(subElement,.addedElement)  {
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

Method NationalCharacterStringType84Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"NATIONAL")  && ..addKeyword(subElement,"CHAR")  && ..addKeyword(subElement,"VARYING")  && ..NationalCharacterStringType85OptGrp(subElement,.addedElement)  {
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

Method NationalCharacterStringType85OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LeftParen(subElement,.addedElement)  && ..Length(subElement,.addedElement)  && ..RightParen(subElement,.addedElement)  {
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

Method NationalCharacterStringType86Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"NCHAR")  && ..addKeyword(subElement,"VARYING")  && ..NationalCharacterStringType87OptGrp(subElement,.addedElement)  {
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

Method NationalCharacterStringType87OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LeftParen(subElement,.addedElement)  && ..Length(subElement,.addedElement)  && ..RightParen(subElement,.addedElement)  {
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

///  newline ::= !! implementation defined end of line indicator
Method Newline(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addPunctuation(subElement,"!!")  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  non-join query expression ::= non-join query term | query expression UNION [ ALL ] [ corresponding spec ] query term | query expression EXCEPT [ ALL ] [ corresponding spec ] query term
Method NonJoinQueryExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..NonJoinQueryTerm(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..NonJoinQueryExpression149Or(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..NonJoinQueryExpression150Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method NonJoinQueryExpression149Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..QueryExpression(subElement,.addedElement)  && ..addKeyword(subElement,"UNION")  && $S(..addKeyword(subElement,"ALL") :1,1:1) && $S(..CorrespondingSpec(subElement,.addedElement) :1,1:1) && ..QueryTerm(subElement,.addedElement)  {
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

Method NonJoinQueryExpression150Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..QueryExpression(subElement,.addedElement)  && ..addKeyword(subElement,"EXCEPT")  && $S(..addKeyword(subElement,"ALL") :1,1:1) && $S(..CorrespondingSpec(subElement,.addedElement) :1,1:1) && ..QueryTerm(subElement,.addedElement)  {
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

///  non-join query primary ::= simple table | left paren non-join query expression right paren
Method NonJoinQueryPrimary(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..SimpleTable(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..NonJoinQueryPrimary152Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method NonJoinQueryPrimary152Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..LeftParen(subElement,.addedElement)  && ..NonJoinQueryExpression(subElement,.addedElement)  && ..RightParen(subElement,.addedElement)  {
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

///  non-join query term ::= non-join query primary | query term INTERSECT [ ALL ] [ corresponding spec ] query primary
Method NonJoinQueryTerm(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..NonJoinQueryPrimary(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..NonJoinQueryTerm151Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method NonJoinQueryTerm151Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..QueryTerm(subElement,.addedElement)  && ..addKeyword(subElement,"INTERSECT")  && $S(..addKeyword(subElement,"ALL") :1,1:1) && $S(..CorrespondingSpec(subElement,.addedElement) :1,1:1) && ..QueryPrimary(subElement,.addedElement)  {
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

///  non-reserved word ::= ADA | C | CATALOG_NAME | CHARACTER_SET_CATALOG | CHARACTER_SET_NAME | CHARACTER_SET_SCHEMA | CLASS_ORIGIN | COBOL | COLLATION_CATALOG | COLLATION_NAME | COLLATION_SCHEMA | COLUMN_NAME | COMMAND_FUNCTION | COMMITTED | CONDITION_NUMBER | CONNECTION_NAME | CONSTRAINT_CATALOG | CONSTRAINT_NAME | CONSTRAINT_SCHEMA | CURSOR_NAME | DATA | DATETIME_INTERVAL_CODE | DATETIME_INTERVAL_PRECISION | DYNAMIC_FUNCTION | FORTRAN | LENGTH | MESSAGE_LENGTH | MESSAGE_OCTET_LENGTH | MESSAGE_TEXT | MORE | MUMPS | NAME | NULLABLE | NUMBER | PASCAL | PLI | REPEATABLE | RETURNED_LENGTH | RETURNED_OCTET_LENGTH | RETURNED_SQLSTATE | ROW_COUNT | SCALE | SCHEMA_NAME | SERIALIZABLE | SERVER_NAME | SUBCLASS_ORIGIN | TABLE_NAME | TYPE | UNCOMMITTED | UNNAMED
Method NonReservedWord(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"ADA")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"C")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"CATALOG_NAME")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"CHARACTER_SET_CATALOG")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"CHARACTER_SET_NAME")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"CHARACTER_SET_SCHEMA")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"CLASS_ORIGIN")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"COBOL")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"COLLATION_CATALOG")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"COLLATION_NAME")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"COLLATION_SCHEMA")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"COLUMN_NAME")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"COMMAND_FUNCTION")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"COMMITTED")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"CONDITION_NUMBER")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"CONNECTION_NAME")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"CONSTRAINT_CATALOG")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"CONSTRAINT_NAME")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"CONSTRAINT_SCHEMA")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"CURSOR_NAME")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"DATA")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"DATETIME_INTERVAL_CODE")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"DATETIME_INTERVAL_PRECISION")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"DYNAMIC_FUNCTION")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"FORTRAN")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"LENGTH")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"MESSAGE_LENGTH")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"MESSAGE_OCTET_LENGTH")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"MESSAGE_TEXT")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"MORE")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"MUMPS")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"NAME")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"NULLABLE")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"NUMBER")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"PASCAL")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"PLI")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"REPEATABLE")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"RETURNED_LENGTH")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"RETURNED_OCTET_LENGTH")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"RETURNED_SQLSTATE")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"ROW_COUNT")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"SCALE")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"SCHEMA_NAME")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"SERIALIZABLE")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"SERVER_NAME")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"SUBCLASS_ORIGIN")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"TABLE_NAME")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"TYPE")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"UNCOMMITTED")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"UNNAMED")  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  non-second datetime field ::= YEAR | MONTH | DAY | HOUR | MINUTE
Method NonSecondDatetimeField(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"YEAR")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"MONTH")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"DAY")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"HOUR")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"MINUTE")  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  nondelimiter token ::= regular identifier | key word | unsigned numeric literal | national character string literal | bit string literal | hex string literal
Method NondelimiterToken(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..RegularIdentifier(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..KeyWord(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..UnsignedNumericLiteral(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..NationalCharacterStringLiteral(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..BitStringLiteral(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..HexStringLiteral(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  nondoublequote character ::= !! See the syntax rules
Method NondoublequoteCharacter(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addPunctuation(subElement,"!!")  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  nonquote character ::= !! See the Syntax rules
Method NonquoteCharacter(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addPunctuation(subElement,"!!")  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  not equals operator ::= <>
Method NotEqualsOperator(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"<>") {
		s done=1
	}
	if done {
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  null predicate ::= row value constructor IS [ NOT ] NULL
Method NullPredicate(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..RowValueConstructor(subElement,.addedElement)  && ..addKeyword(subElement,"IS")  && $S(..addKeyword(subElement,"NOT") :1,1:1) && ..addKeyword(subElement,"NULL")  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  null specification ::= NULL
Method NullSpecification(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"NULL")  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  number of conditions ::= simple value specification
Method NumberOfConditions(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..SimpleValueSpecification(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  numeric primary ::= value expression primary | numeric value function
Method NumericPrimary(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..ValueExpressionPrimary(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..NumericValueFunction(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  numeric type ::= exact numeric type | approximate numeric type
Method NumericType(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	s done=0,ok=1,pos=..stream.pos,lastpos=pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s ret=($isobject(subElement))
		i ret $$$BNFCOMMITCOPY(subElement,ParentElement)
		q ret
	}
	$$$BNFMEMOSET(pos,"")
	d ..getBookmark(.bm)
	while ok {
	$$$BNFSTART(subElement)
		d ..gotoBookmark(.bm)
		s rec=..NumericType91Recurse(subElement,.addedElement)
		i rec,..stream.pos>lastpos {
			$$$BNFMEMOSET(pos,addedElement)
			s done=1,lastpos=..stream.pos
		} else {
			s ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best 
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		i $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	q ret
}

Method NumericType91Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..ExactNumericType(subElement,.addedElement)  {
		s done=1 ; or
	} elseif ..ApproximateNumericType(subElement,.addedElement)  {
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

///  numeric value expression ::= term | numeric value expression plus sign term | numeric value expression minus sign term
Method NumericValueExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	s done=0,ok=1,pos=..stream.pos,lastpos=pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s ret=($isobject(subElement))
		i ret $$$BNFCOMMITCOPY(subElement,ParentElement)
		q ret
	}
	$$$BNFMEMOSET(pos,"")
	d ..getBookmark(.bm)
	while ok {
	$$$BNFSTART(subElement)
		d ..gotoBookmark(.bm)
		s rec=..NumericValueExpression139Recurse(subElement,.addedElement)
		i rec,..stream.pos>lastpos {
			$$$BNFMEMOSET(pos,addedElement)
			s done=1,lastpos=..stream.pos
		} else {
			s ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best 
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		i $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	q ret
}

Method NumericValueExpression139Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..Term(subElement,.addedElement)  {
		s done=1 ; or
	} elseif ..NumericValueExpression140Or(subElement,.addedElement)  {
		s done=1 ; or
	} elseif ..NumericValueExpression141Or(subElement,.addedElement)  {
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

Method NumericValueExpression140Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..NumericValueExpression(subElement,.addedElement)  && ..PlusSign(subElement,.addedElement)  && ..Term(subElement,.addedElement)  {
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

Method NumericValueExpression141Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..NumericValueExpression(subElement,.addedElement)  && ..MinusSign(subElement,.addedElement)  && ..Term(subElement,.addedElement)  {
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

///  numeric value function ::= position expression | extract expression | length expression
Method NumericValueFunction(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..PositionExpression(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..ExtractExpression(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..LengthExpression(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  object column ::= column name
Method ObjectColumn(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..ColumnName(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  object name ::= [ TABLE ] table name | DOMAIN domain name | COLLATION collation name | CHARACTER SET character set name | TRANSLATION translation name
Method ObjectName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if $S(..addKeyword(subElement,"TABLE") :1,1:1) && ..TableName(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..ObjectName246Or(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..ObjectName247Or(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..ObjectName248Or(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..ObjectName249Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method ObjectName246Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"DOMAIN")  && ..DomainName(subElement,.addedElement)  {
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

Method ObjectName247Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"COLLATION")  && ..CollationName(subElement,.addedElement)  {
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

Method ObjectName248Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"CHARACTER")  && ..addKeyword(subElement,"SET")  && ..CharacterSetName(subElement,.addedElement)  {
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

Method ObjectName249Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"TRANSLATION")  && ..TranslationName(subElement,.addedElement)  {
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

///  occurrences ::= simple value specification
Method Occurrences(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..SimpleValueSpecification(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  octet length expression ::= OCTET_LENGTH left paren string value expression right paren
Method OctetLengthExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addPunctuation(subElement,"OCTET_LENGTH")  && ..LeftParen(subElement,.addedElement)  && ..StringValueExpression(subElement,.addedElement)  && ..RightParen(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  open statement ::= OPEN cursor name
Method OpenStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"OPEN")  && ..CursorName(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  order by clause ::= ORDER BY sort specification list
Method OrderByClause(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"ORDER")  && ..addKeyword(subElement,"BY")  && ..SortSpecificationList(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  ordering specification ::= ASC | DESC
Method OrderingSpecification(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"ASC")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"DESC")  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  outer join type ::= LEFT | RIGHT | FULL
Method OuterJoinType(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"LEFT")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"RIGHT")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"FULL")  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  overlaps predicate ::= row value constructor 1 OVERLAPS row value constructor 2
Method OverlapsPredicate(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..RowValueConstructor1(subElement,.addedElement)  && ..addKeyword(subElement,"OVERLAPS")  && ..RowValueConstructor2(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  pad attribute ::= NO PAD | PAD SPACE
Method PadAttribute(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"NO")  && ..addKeyword(subElement,"PAD")  {
			s done=1 ; or
		} elseif ..PadAttribute254Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method PadAttribute254Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"PAD")  && ..addKeyword(subElement,"SPACE")  {
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

///  parameter declaration ::= parameter name data type | status parameter
Method ParameterDeclaration(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..ParameterName(subElement,.addedElement)  && ..DataType(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..StatusParameter(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  parameter declaration list ::= left paren parameter declaration [ { comma parameter declaration }... ] right paren
Method ParameterDeclarationList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..LeftParen(subElement,.addedElement)  && ..ParameterDeclaration(subElement,.addedElement)  && $S(..ParameterDeclarationList223RepOne(subElement,.addedElement) :1,1:1) && ..RightParen(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  { comma parameter declaration }...
Method ParameterDeclarationList223RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..ParameterDeclarationList224Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  comma parameter declaration
Method ParameterDeclarationList224Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Comma(subElement,.addedElement)  && ..ParameterDeclaration(subElement,.addedElement)  {
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

///  parameter name ::= colon identifier
Method ParameterName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..Colon(subElement,.addedElement)  && ..Identifier(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  parameter specification ::= parameter name [ indicator parameter ]
Method ParameterSpecification(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..ParameterName(subElement,.addedElement)  && $S(..IndicatorParameter(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  parameter using clause ::= using clause
Method ParameterUsingClause(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..UsingClause(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  Pascal host identifier ::= !! See syntax rules
Method PascalHostIdentifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addPunctuation(subElement,"!!")  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  Pascal variable definition ::= ...omitted...
Method PascalVariableDefinition(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	quit 0 ; omitted rule never true
}

///  pattern ::= character value expression
Method Pattern(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..CharacterValueExpression(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  percent ::= %
Method Percent(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"%") {
		s done=1
	}
	if done {
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  period ::= .
Method Period(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,".") {
		s done=1
	}
	if done {
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  PL/I host identifier ::= !! See syntax rules
Method PlIHostIdentifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addPunctuation(subElement,"!!")  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  PL/I variable definition ::= ...omitted...
Method PlIVariableDefinition(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	quit 0 ; omitted rule never true
}

///  plus sign ::= +
Method PlusSign(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"+") {
		s done=1
	}
	if done {
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  position expression ::= POSITION left paren character value expression IN character value expression right paren
Method PositionExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"POSITION")  && ..LeftParen(subElement,.addedElement)  && ..CharacterValueExpression(subElement,.addedElement)  && ..addKeyword(subElement,"IN")  && ..CharacterValueExpression(subElement,.addedElement)  && ..RightParen(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  precision ::= unsigned integer
Method Precision(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..UnsignedInteger(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  predicate ::= comparison predicate | between predicate | in predicate | like predicate | null predicate | quantified comparison predicate | exists predicate | match predicate | overlaps predicate
Method Predicate(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	s done=0,ok=1,pos=..stream.pos,lastpos=pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s ret=($isobject(subElement))
		i ret $$$BNFCOMMITCOPY(subElement,ParentElement)
		q ret
	}
	$$$BNFMEMOSET(pos,"")
	d ..getBookmark(.bm)
	while ok {
	$$$BNFSTART(subElement)
		d ..gotoBookmark(.bm)
		s rec=..Predicate135Recurse(subElement,.addedElement)
		i rec,..stream.pos>lastpos {
			$$$BNFMEMOSET(pos,addedElement)
			s done=1,lastpos=..stream.pos
		} else {
			s ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best 
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		i $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	q ret
}

Method Predicate135Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..ComparisonPredicate(subElement,.addedElement)  {
		s done=1 ; or
	} elseif ..BetweenPredicate(subElement,.addedElement)  {
		s done=1 ; or
	} elseif ..InPredicate(subElement,.addedElement)  {
		s done=1 ; or
	} elseif ..LikePredicate(subElement,.addedElement)  {
		s done=1 ; or
	} elseif ..NullPredicate(subElement,.addedElement)  {
		s done=1 ; or
	} elseif ..QuantifiedComparisonPredicate(subElement,.addedElement)  {
		s done=1 ; or
	} elseif ..ExistsPredicate(subElement,.addedElement)  {
		s done=1 ; or
	} elseif ..MatchPredicate(subElement,.addedElement)  {
		s done=1 ; or
	} elseif ..OverlapsPredicate(subElement,.addedElement)  {
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

///  preparable dynamic delete statement: positioned ::= DELETE [ FROM table name ] WHERE CURRENT OF cursor name
Method PreparableDynamicDeleteStatementPositioned(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"DELETE")  && ..PreparableDynamicDeleteStatementPositioned332OptGrp(subElement,.addedElement)  && ..addKeyword(subElement,"WHERE")  && ..addKeyword(subElement,"CURRENT")  && ..addKeyword(subElement,"OF")  && ..CursorName(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method PreparableDynamicDeleteStatementPositioned332OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"FROM")  && ..TableName(subElement,.addedElement)  {
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

///  preparable dynamic update statement: positioned ::= UPDATE [ table name ] SET set clause WHERE CURRENT OF cursor name
Method PreparableDynamicUpdateStatementPositioned(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"UPDATE")  && $S(..TableName(subElement,.addedElement) :1,1:1) && ..addKeyword(subElement,"SET")  && ..SetClause(subElement,.addedElement)  && ..addKeyword(subElement,"WHERE")  && ..addKeyword(subElement,"CURRENT")  && ..addKeyword(subElement,"OF")  && ..CursorName(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  preparable SQL data statement ::= delete statement: searched | dynamic single row select statement | insert statement | dynamic select statement | update statement: searched | preparable dynamic delete statement: positioned | preparable dynamic update statement: positioned
Method PreparableSqlDataStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..DeleteStatementSearched(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..DynamicSingleRowSelectStatement(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..InsertStatement(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..DynamicSelectStatement(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..UpdateStatementSearched(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..PreparableDynamicDeleteStatementPositioned(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..PreparableDynamicUpdateStatementPositioned(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  preparable SQL implementation-defined statement ::= !! See the syntax rules
Method PreparableSqlImplementationDefinedStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addPunctuation(subElement,"!!")  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  preparable SQL schema statement ::= SQL schema statement
Method PreparableSqlSchemaStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..SqlSchemaStatement(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  preparable SQL session statement ::= SQL session statement
Method PreparableSqlSessionStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..SqlSessionStatement(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  preparable SQL transaction statement ::= SQL transaction statement
Method PreparableSqlTransactionStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..SqlTransactionStatement(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  preparable statement ::= preparable SQL data statement | preparable SQL schema statement | preparable SQL transaction statement | preparable SQL session statement | preparable SQL implementation-defined statement
Method PreparableStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..PreparableSqlDataStatement(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..PreparableSqlSchemaStatement(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..PreparableSqlTransactionStatement(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..PreparableSqlSessionStatement(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..PreparableSqlImplementationDefinedStatement(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  prepare statement ::= PREPARE SQL statement name FROM SQL statement variable
Method PrepareStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"PREPARE")  && ..SqlStatementName(subElement,.addedElement)  && ..addKeyword(subElement,"FROM")  && ..SqlStatementVariable(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  privilege column list ::= column name list
Method PrivilegeColumnList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..ColumnNameList(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  privileges ::= ALL PRIVILEGES | action list
Method Privileges(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	s done=0,ok=1,pos=..stream.pos,lastpos=pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s ret=($isobject(subElement))
		i ret $$$BNFCOMMITCOPY(subElement,ParentElement)
		q ret
	}
	$$$BNFMEMOSET(pos,"")
	d ..getBookmark(.bm)
	while ok {
	$$$BNFSTART(subElement)
		d ..gotoBookmark(.bm)
		s rec=..Privileges237Recurse(subElement,.addedElement)
		i rec,..stream.pos>lastpos {
			$$$BNFMEMOSET(pos,addedElement)
			s done=1,lastpos=..stream.pos
		} else {
			s ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best 
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		i $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	q ret
}

Method Privileges237Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(subElement,"ALL")  && ..addKeyword(subElement,"PRIVILEGES")  {
		s done=1 ; or
	} elseif ..ActionList(subElement,.addedElement)  {
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

///  procedure ::= PROCEDURE procedure name parameter declaration list semicolon SQL procedure statement semicolon
Method Procedure(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	s done=0,ok=1,pos=..stream.pos,lastpos=pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s ret=($isobject(subElement))
		i ret $$$BNFCOMMITCOPY(subElement,ParentElement)
		q ret
	}
	$$$BNFMEMOSET(pos,"")
	d ..getBookmark(.bm)
	while ok {
	$$$BNFSTART(subElement)
		d ..gotoBookmark(.bm)
		s rec=..Procedure222Recurse(subElement,.addedElement)
		i rec,..stream.pos>lastpos {
			$$$BNFMEMOSET(pos,addedElement)
			s done=1,lastpos=..stream.pos
		} else {
			s ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best 
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		i $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	q ret
}

Method Procedure222Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(subElement,"PROCEDURE")  && ..ProcedureName(subElement,.addedElement)  && ..ParameterDeclarationList(subElement,.addedElement)  && ..Semicolon(subElement,.addedElement)  && ..SqlProcedureStatement(subElement,.addedElement)  && ..Semicolon(subElement,.addedElement)  {
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

///  procedure name ::= identifier
Method ProcedureName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..Identifier(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  qualified identifier ::= identifier
Method QualifiedIdentifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..Identifier(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  qualified join ::= table reference [ NATURAL ] [ join type ] JOIN table reference [ join specification ]
Method QualifiedJoin(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..TableReference(subElement,.addedElement)  && $S(..addKeyword(subElement,"NATURAL") :1,1:1) && $S(..JoinType(subElement,.addedElement) :1,1:1) && ..addKeyword(subElement,"JOIN")  && ..TableReference(subElement,.addedElement)  && $S(..JoinSpecification(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  qualified local table name ::= MODULE period local table name
Method QualifiedLocalTableName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"MODULE")  && ..Period(subElement,.addedElement)  && ..LocalTableName(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  qualified name ::= [ schema name period ] qualified identifier
Method QualifiedName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..QualifiedName115OptGrp(subElement,.addedElement)  && ..QualifiedIdentifier(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method QualifiedName115OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SchemaName(subElement,.addedElement)  && ..Period(subElement,.addedElement)  {
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

///  qualifier ::= table name | correlation name
Method Qualifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..TableName(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..CorrelationName(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  quantified comparison predicate ::= row value constructor comp op quantifier table subquery
Method QuantifiedComparisonPredicate(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..RowValueConstructor(subElement,.addedElement)  && ..CompOp(subElement,.addedElement)  && ..Quantifier(subElement,.addedElement)  && ..TableSubquery(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  quantifier ::= all | some
Method Quantifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..All(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..Some(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  query expression ::= non-join query expression | joined table
Method QueryExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	s done=0,ok=1,pos=..stream.pos,lastpos=pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s ret=($isobject(subElement))
		i ret $$$BNFCOMMITCOPY(subElement,ParentElement)
		q ret
	}
	$$$BNFMEMOSET(pos,"")
	d ..getBookmark(.bm)
	while ok {
	$$$BNFSTART(subElement)
		d ..gotoBookmark(.bm)
		s rec=..QueryExpression148Recurse(subElement,.addedElement)
		i rec,..stream.pos>lastpos {
			$$$BNFMEMOSET(pos,addedElement)
			s done=1,lastpos=..stream.pos
		} else {
			s ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best 
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		i $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	q ret
}

Method QueryExpression148Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..NonJoinQueryExpression(subElement,.addedElement)  {
		s done=1 ; or
	} elseif ..JoinedTable(subElement,.addedElement)  {
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

///  query primary ::= non-join query primary | joined table
Method QueryPrimary(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	s done=0,ok=1,pos=..stream.pos,lastpos=pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s ret=($isobject(subElement))
		i ret $$$BNFCOMMITCOPY(subElement,ParentElement)
		q ret
	}
	$$$BNFMEMOSET(pos,"")
	d ..getBookmark(.bm)
	while ok {
	$$$BNFSTART(subElement)
		d ..gotoBookmark(.bm)
		s rec=..QueryPrimary173Recurse(subElement,.addedElement)
		i rec,..stream.pos>lastpos {
			$$$BNFMEMOSET(pos,addedElement)
			s done=1,lastpos=..stream.pos
		} else {
			s ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best 
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		i $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	q ret
}

Method QueryPrimary173Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..NonJoinQueryPrimary(subElement,.addedElement)  {
		s done=1 ; or
	} elseif ..JoinedTable(subElement,.addedElement)  {
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

///  query specification ::= SELECT [ set quantifier ] select list table expression
Method QuerySpecification(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"SELECT")  && $S(..SetQuantifier(subElement,.addedElement) :1,1:1) && ..SelectList(subElement,.addedElement)  && ..TableExpression(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  query term ::= non-join query term | joined table
Method QueryTerm(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	s done=0,ok=1,pos=..stream.pos,lastpos=pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s ret=($isobject(subElement))
		i ret $$$BNFCOMMITCOPY(subElement,ParentElement)
		q ret
	}
	$$$BNFMEMOSET(pos,"")
	d ..getBookmark(.bm)
	while ok {
	$$$BNFSTART(subElement)
		d ..gotoBookmark(.bm)
		s rec=..QueryTerm171Recurse(subElement,.addedElement)
		i rec,..stream.pos>lastpos {
			$$$BNFMEMOSET(pos,addedElement)
			s done=1,lastpos=..stream.pos
		} else {
			s ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best 
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		i $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	q ret
}

Method QueryTerm171Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..NonJoinQueryTerm(subElement,.addedElement)  {
		s done=1 ; or
	} elseif ..JoinedTable(subElement,.addedElement)  {
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

///  question mark ::= ?
Method QuestionMark(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"?") {
		s done=1
	}
	if done {
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  quote ::= '
Method Quote(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"'") {
		s done=1
	}
	if done {
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  quote symbol ::= quote quote
Method QuoteSymbol(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..Quote(subElement,.addedElement)  && ..Quote(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  reference column list ::= column name list
Method ReferenceColumnList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..ColumnNameList(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  referenced table and columns ::= table name [ left paren reference column list right paren ]
Method ReferencedTableAndColumns(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..TableName(subElement,.addedElement)  && ..ReferencedTableAndColumns121OptGrp(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method ReferencedTableAndColumns121OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LeftParen(subElement,.addedElement)  && ..ReferenceColumnList(subElement,.addedElement)  && ..RightParen(subElement,.addedElement)  {
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

///  references specification ::= REFERENCES referenced table and columns [ MATCH match type ] [ referential triggered action ]
Method ReferencesSpecification(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"REFERENCES")  && ..ReferencedTableAndColumns(subElement,.addedElement)  && ..ReferencesSpecification120OptGrp(subElement,.addedElement)  && $S(..ReferentialTriggeredAction(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method ReferencesSpecification120OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"MATCH")  && ..MatchType(subElement,.addedElement)  {
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

///  referencing columns ::= reference column list
Method ReferencingColumns(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..ReferenceColumnList(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  referential action ::= CASCADE | SET NULL | SET DEFAULT | NO ACTION
Method ReferentialAction(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"CASCADE")  {
			s done=1 ; or
		} elseif ..ReferentialAction126Or(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..ReferentialAction127Or(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..ReferentialAction128Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method ReferentialAction126Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"SET")  && ..addKeyword(subElement,"NULL")  {
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

Method ReferentialAction127Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"SET")  && ..addKeyword(subElement,"DEFAULT")  {
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

Method ReferentialAction128Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"NO")  && ..addKeyword(subElement,"ACTION")  {
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

///  referential constraint definition ::= FOREIGN KEY left paren referencing columns right paren references specification
Method ReferentialConstraintDefinition(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"FOREIGN")  && ..addKeyword(subElement,"KEY")  && ..LeftParen(subElement,.addedElement)  && ..ReferencingColumns(subElement,.addedElement)  && ..RightParen(subElement,.addedElement)  && ..ReferencesSpecification(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  referential triggered action ::= update rule [ delete rule ] | delete rule [ update rule ]
Method ReferentialTriggeredAction(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..UpdateRule(subElement,.addedElement)  && $S(..DeleteRule(subElement,.addedElement) :1,1:1) {
			s done=1 ; or
		} elseif ..ReferentialTriggeredAction125Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method ReferentialTriggeredAction125Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..DeleteRule(subElement,.addedElement)  && $S(..UpdateRule(subElement,.addedElement) :1,1:1) {
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

///  regular identifier ::= identifier body
Method RegularIdentifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..IdentifierBody(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  reserved word ::= ABSOLUTE | ACTION | ADD | ALL | ALLOCATE | ALTER | AND | ANY | ARE | AS | ASC | ASSERTION | AT | AUTHORIZATION | AVG | BEGIN | BETWEEN | BIT | BIT_LENGTH | BOTH | BY | CASCADE | CASCADED | CASE | CAST | CATALOG | CHAR | CHARACTER | CHARACTER_LENGTH | CHAR_LENGTH | CHECK | CLOSE | COALESCE | COLLATE | COLLATION | COLUMN | COMMIT | CONNECT | CONNECTION | CONSTRAINT | CONSTRAINTS | CONTINUE | CONVERT | CORRESPONDING | CREATE | CROSS | CURRENT | CURRENT_DATE | CURRENT_TIME | CURRENT_TIMESTAMP | CURRENT_USER | CURSOR | DATE | DAY | DEALLOCATE | DEC | DECIMAL | DECLARE | DEFAULT | DEFERRABLE | DEFERRED | DELETE | DESC | DESCRIBE | DESCRIPTOR | DIAGNOSTICS | DISCONNECT | DISTINCT | DOMAIN | DOUBLE | DROP | ELSE | END | END-EXEC | ESCAPE | EXCEPT | EXCEPTION | EXEC | EXECUTE | EXISTS | EXTERNAL | EXTRACT | FALSE | FETCH | FIRST | FLOAT | FOR | FOREIGN | FOUND | FROM | FULL | GET | GLOBAL | GO | GOTO | GRANT | GROUP | HAVING | HOUR | IDENTITY | IMMEDIATE | IN | INDICATOR | INITIALLY | INNER | INPUT | INSENSITIVE | INSERT | INT | INTEGER | INTERSECT | INTERVAL | INTO | IS | ISOLATION | JOIN | KEY | LANGUAGE | LAST | LEADING | LEFT | LEVEL | LIKE | LOCAL | LOWER | MATCH | MAX | MIN | MINUTE | MODULE | MONTH | NAMES | NATIONAL | NATURAL | NCHAR | NEXT | NO | NOT | NULL | NULLIF | NUMERIC | OCTET_LENGTH | OF | ON | ONLY | OPEN | OPTION | OR | ORDER | OUTER | OUTPUT | OVERLAPS | PAD | PARTIAL | POSITION | PRECISION | PREPARE | PRESERVE | PRIMARY | PRIOR | PRIVILEGES | PROCEDURE | PUBLIC | READ | REAL | REFERENCES | RELATIVE | RESTRICT | REVOKE | RIGHT | ROLLBACK | ROWS | SCHEMA | SCROLL | SECOND | SECTION | SELECT | SESSION | SESSION_USER | SET | SIZE | SMALLINT | SOME | SPACE | SQL | SQLCODE | SQLERROR | SQLSTATE | SUBSTRING | SUM | SYSTEM_USER | TABLE | TEMPORARY | THEN | TIME | TIMESTAMP | TIMEZONE_HOUR | TIMEZONE_MINUTE | TO | TRAILING | TRANSACTION | TRANSLATE | TRANSLATION | TRIM | TRUE | UNION | UNIQUE | UNKNOWN | UPDATE | UPPER | USAGE | USER | USING | VALUE | VALUES | VARCHAR | VARYING | VIEW | WHEN | WHENEVER | WHERE | WITH | WORK | WRITE | YEAR | ZONE
Method ReservedWord(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"ABSOLUTE")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"ACTION")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"ADD")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"ALL")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"ALLOCATE")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"ALTER")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"AND")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"ANY")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"ARE")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"AS")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"ASC")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"ASSERTION")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"AT")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"AUTHORIZATION")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"AVG")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"BEGIN")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"BETWEEN")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"BIT")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"BIT_LENGTH")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"BOTH")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"BY")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"CASCADE")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"CASCADED")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"CASE")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"CAST")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"CATALOG")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"CHAR")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"CHARACTER")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"CHARACTER_LENGTH")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"CHAR_LENGTH")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"CHECK")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"CLOSE")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"COALESCE")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"COLLATE")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"COLLATION")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"COLUMN")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"COMMIT")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"CONNECT")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"CONNECTION")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"CONSTRAINT")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"CONSTRAINTS")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"CONTINUE")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"CONVERT")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"CORRESPONDING")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"CREATE")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"CROSS")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"CURRENT")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"CURRENT_DATE")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"CURRENT_TIME")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"CURRENT_TIMESTAMP")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"CURRENT_USER")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"CURSOR")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"DATE")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"DAY")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"DEALLOCATE")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"DEC")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"DECIMAL")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"DECLARE")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"DEFAULT")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"DEFERRABLE")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"DEFERRED")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"DELETE")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"DESC")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"DESCRIBE")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"DESCRIPTOR")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"DIAGNOSTICS")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"DISCONNECT")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"DISTINCT")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"DOMAIN")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"DOUBLE")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"DROP")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"ELSE")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"END")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"END-EXEC")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"ESCAPE")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"EXCEPT")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"EXCEPTION")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"EXEC")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"EXECUTE")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"EXISTS")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"EXTERNAL")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"EXTRACT")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"FALSE")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"FETCH")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"FIRST")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"FLOAT")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"FOR")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"FOREIGN")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"FOUND")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"FROM")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"FULL")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"GET")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"GLOBAL")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"GO")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"GOTO")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"GRANT")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"GROUP")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"HAVING")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"HOUR")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"IDENTITY")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"IMMEDIATE")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"IN")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"INDICATOR")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"INITIALLY")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"INNER")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"INPUT")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"INSENSITIVE")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"INSERT")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"INT")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"INTEGER")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"INTERSECT")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"INTERVAL")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"INTO")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"IS")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"ISOLATION")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"JOIN")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"KEY")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"LANGUAGE")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"LAST")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"LEADING")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"LEFT")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"LEVEL")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"LIKE")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"LOCAL")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"LOWER")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"MATCH")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"MAX")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"MIN")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"MINUTE")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"MODULE")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"MONTH")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"NAMES")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"NATIONAL")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"NATURAL")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"NCHAR")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"NEXT")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"NO")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"NOT")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"NULL")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"NULLIF")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"NUMERIC")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"OCTET_LENGTH")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"OF")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"ON")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"ONLY")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"OPEN")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"OPTION")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"OR")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"ORDER")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"OUTER")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"OUTPUT")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"OVERLAPS")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"PAD")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"PARTIAL")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"POSITION")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"PRECISION")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"PREPARE")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"PRESERVE")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"PRIMARY")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"PRIOR")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"PRIVILEGES")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"PROCEDURE")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"PUBLIC")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"READ")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"REAL")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"REFERENCES")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"RELATIVE")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"RESTRICT")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"REVOKE")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"RIGHT")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"ROLLBACK")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"ROWS")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"SCHEMA")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"SCROLL")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"SECOND")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"SECTION")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"SELECT")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"SESSION")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"SESSION_USER")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"SET")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"SIZE")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"SMALLINT")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"SOME")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"SPACE")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"SQL")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"SQLCODE")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"SQLERROR")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"SQLSTATE")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"SUBSTRING")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"SUM")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"SYSTEM_USER")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"TABLE")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"TEMPORARY")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"THEN")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"TIME")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"TIMESTAMP")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"TIMEZONE_HOUR")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"TIMEZONE_MINUTE")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"TO")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"TRAILING")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"TRANSACTION")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"TRANSLATE")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"TRANSLATION")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"TRIM")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"TRUE")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"UNION")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"UNIQUE")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"UNKNOWN")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"UPDATE")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"UPPER")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"USAGE")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"USER")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"USING")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"VALUE")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"VALUES")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"VARCHAR")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"VARYING")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"VIEW")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"WHEN")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"WHENEVER")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"WHERE")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"WITH")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"WORK")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"WRITE")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"YEAR")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"ZONE")  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  result ::= result expression | NULL
Method Result(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	s done=0,ok=1,pos=..stream.pos,lastpos=pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s ret=($isobject(subElement))
		i ret $$$BNFCOMMITCOPY(subElement,ParentElement)
		q ret
	}
	$$$BNFMEMOSET(pos,"")
	d ..getBookmark(.bm)
	while ok {
	$$$BNFSTART(subElement)
		d ..gotoBookmark(.bm)
		s rec=..Result178Recurse(subElement,.addedElement)
		i rec,..stream.pos>lastpos {
			$$$BNFMEMOSET(pos,addedElement)
			s done=1,lastpos=..stream.pos
		} else {
			s ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best 
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		i $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	q ret
}

Method Result178Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..ResultExpression(subElement,.addedElement)  {
		s done=1 ; or
	} elseif ..addKeyword(subElement,"NULL")  {
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

///  result expression ::= value expression
Method ResultExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..ValueExpression(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  result using clause ::= using clause
Method ResultUsingClause(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..UsingClause(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  revoke statement ::= REVOKE [ GRANT OPTION FOR ] privileges ON object name FROM grantee [ { comma grantee }... ] drop behaviour
Method RevokeStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"REVOKE")  && ..RevokeStatement257OptGrp(subElement,.addedElement)  && ..Privileges(subElement,.addedElement)  && ..addKeyword(subElement,"ON")  && ..ObjectName(subElement,.addedElement)  && ..addKeyword(subElement,"FROM")  && ..Grantee(subElement,.addedElement)  && $S(..RevokeStatement258RepOne(subElement,.addedElement) :1,1:1) && ..DropBehaviour(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method RevokeStatement257OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"GRANT")  && ..addKeyword(subElement,"OPTION")  && ..addKeyword(subElement,"FOR")  {
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

///  { comma grantee }...
Method RevokeStatement258RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..RevokeStatement259Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  comma grantee
Method RevokeStatement259Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Comma(subElement,.addedElement)  && ..Grantee(subElement,.addedElement)  {
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

///  right bracket ::= ]
Method RightBracket(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"]") {
		s done=1
	}
	if done {
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  right paren ::= )
Method RightParen(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,")") {
		s done=1
	}
	if done {
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  rollback statement ::= ROLLBACK [ WORK ]
Method RollbackStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"ROLLBACK")  && $S(..addKeyword(subElement,"WORK") :1,1:1) {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  row subquery ::= subquery
Method RowSubquery(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..Subquery(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  row value constructor ::= row value constructor element | left paren row value constructor list right paren | row subquery
Method RowValueConstructor(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	s done=0,ok=1,pos=..stream.pos,lastpos=pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s ret=($isobject(subElement))
		i ret $$$BNFCOMMITCOPY(subElement,ParentElement)
		q ret
	}
	$$$BNFMEMOSET(pos,"")
	d ..getBookmark(.bm)
	while ok {
	$$$BNFSTART(subElement)
		d ..gotoBookmark(.bm)
		s rec=..RowValueConstructor136Recurse(subElement,.addedElement)
		i rec,..stream.pos>lastpos {
			$$$BNFMEMOSET(pos,addedElement)
			s done=1,lastpos=..stream.pos
		} else {
			s ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best 
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		i $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	q ret
}

///  row value constructor 1 ::= row value constructor
Method RowValueConstructor1(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..RowValueConstructor(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method RowValueConstructor136Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..RowValueConstructorElement(subElement,.addedElement)  {
		s done=1 ; or
	} elseif ..RowValueConstructor137Or(subElement,.addedElement)  {
		s done=1 ; or
	} elseif ..RowSubquery(subElement,.addedElement)  {
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

Method RowValueConstructor137Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LeftParen(subElement,.addedElement)  && ..RowValueConstructorList(subElement,.addedElement)  && ..RightParen(subElement,.addedElement)  {
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

///  row value constructor 2 ::= row value constructor
Method RowValueConstructor2(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..RowValueConstructor(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  row value constructor element ::= value expression | null specification | default specification
Method RowValueConstructorElement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..ValueExpression(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..NullSpecification(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..DefaultSpecification(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  row value constructor list ::= row value constructor element [ { comma row value constructor element } ... ]
Method RowValueConstructorList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..RowValueConstructorElement(subElement,.addedElement)  && $S(..RowValueConstructorList203RepOne(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  { comma row value constructor element } ...
Method RowValueConstructorList203RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..RowValueConstructorList204Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  comma row value constructor element
Method RowValueConstructorList204Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Comma(subElement,.addedElement)  && ..RowValueConstructorElement(subElement,.addedElement)  {
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

///  scalar subquery ::= subquery
Method ScalarSubquery(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..Subquery(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  scale ::= unsigned integer
Method Scale(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..UnsignedInteger(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  schema authorization identifier ::= authorization identifier
Method SchemaAuthorizationIdentifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..AuthorizationIdentifier(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  schema character set name ::= character set name
Method SchemaCharacterSetName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..CharacterSetName(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  schema character set specification ::= DEFAULT CHARACTER SET character set specification
Method SchemaCharacterSetSpecification(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"DEFAULT")  && ..addKeyword(subElement,"CHARACTER")  && ..addKeyword(subElement,"SET")  && ..CharacterSetSpecification(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  schema collation name ::= collation name
Method SchemaCollationName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..CollationName(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  schema definition ::= CREATE SCHEMA schema name clause [ schema character set specification ] [ schema element... ]
Method SchemaDefinition(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"CREATE")  && ..addKeyword(subElement,"SCHEMA")  && ..SchemaNameClause(subElement,.addedElement)  && $S(..SchemaCharacterSetSpecification(subElement,.addedElement) :1,1:1) && $S(..SchemaDefinition225RepOne(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  schema element...
Method SchemaDefinition225RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..SchemaElement(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  schema element ::= domain definition | table definition | view definition | grant statement | assertion definition | character set definition | collation definition | translation definition
Method SchemaElement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..DomainDefinition(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..TableDefinition(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..ViewDefinition(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..GrantStatement(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..AssertionDefinition(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..CharacterSetDefinition(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..CollationDefinition(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..TranslationDefinition(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  schema name ::= [ catalog name period ] unqualified schema name
Method SchemaName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	s done=0,ok=1,pos=..stream.pos,lastpos=pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s ret=($isobject(subElement))
		i ret $$$BNFCOMMITCOPY(subElement,ParentElement)
		q ret
	}
	$$$BNFMEMOSET(pos,"")
	d ..getBookmark(.bm)
	while ok {
	$$$BNFSTART(subElement)
		d ..gotoBookmark(.bm)
		s rec=..SchemaName36Recurse(subElement,.addedElement)
		i rec,..stream.pos>lastpos {
			$$$BNFMEMOSET(pos,addedElement)
			s done=1,lastpos=..stream.pos
		} else {
			s ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best 
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		i $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	q ret
}

Method SchemaName36Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..SchemaName37OptGrp(subElement,.addedElement)  && ..UnqualifiedSchemaName(subElement,.addedElement)  {
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

Method SchemaName37OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..CatalogName(subElement,.addedElement)  && ..Period(subElement,.addedElement)  {
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

///  schema name clause ::= schema name | AUTHORIZATION schema authorization identifier | schema name AUTHORIZATION schema authorization identifier
Method SchemaNameClause(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..SchemaName(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..SchemaNameClause226Or(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..SchemaNameClause227Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method SchemaNameClause226Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"AUTHORIZATION")  && ..SchemaAuthorizationIdentifier(subElement,.addedElement)  {
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

Method SchemaNameClause227Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..SchemaName(subElement,.addedElement)  && ..addKeyword(subElement,"AUTHORIZATION")  && ..SchemaAuthorizationIdentifier(subElement,.addedElement)  {
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

///  schema translation name ::= translation name
Method SchemaTranslationName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..TranslationName(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  scope option ::= GLOBAL | LOCAL
Method ScopeOption(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"GLOBAL")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"LOCAL")  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  search condition ::= boolean term | search condition OR boolean term
Method SearchCondition(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	s done=0,ok=1,pos=..stream.pos,lastpos=pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s ret=($isobject(subElement))
		i ret $$$BNFCOMMITCOPY(subElement,ParentElement)
		q ret
	}
	$$$BNFMEMOSET(pos,"")
	d ..getBookmark(.bm)
	while ok {
	$$$BNFSTART(subElement)
		d ..gotoBookmark(.bm)
		s rec=..SearchCondition129Recurse(subElement,.addedElement)
		i rec,..stream.pos>lastpos {
			$$$BNFMEMOSET(pos,addedElement)
			s done=1,lastpos=..stream.pos
		} else {
			s ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best 
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		i $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	q ret
}

Method SearchCondition129Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..BooleanTerm(subElement,.addedElement)  {
		s done=1 ; or
	} elseif ..SearchCondition130Or(subElement,.addedElement)  {
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

Method SearchCondition130Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SearchCondition(subElement,.addedElement)  && ..addKeyword(subElement,"OR")  && ..BooleanTerm(subElement,.addedElement)  {
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

///  searched case ::= CASE searched when clause... [ else clause ] END
Method SearchedCase(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"CASE")  && ..SearchedCase179RepOne(subElement,.addedElement)  && $S(..ElseClause(subElement,.addedElement) :1,1:1) && ..addKeyword(subElement,"END")  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  searched when clause...
Method SearchedCase179RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..SearchedWhenClause(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  searched when clause ::= WHEN search condition THEN result
Method SearchedWhenClause(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"WHEN")  && ..SearchCondition(subElement,.addedElement)  && ..addKeyword(subElement,"THEN")  && ..Result(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  seconds fraction ::= unsigned integer
Method SecondsFraction(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..UnsignedInteger(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  seconds integer value ::= unsigned integer
Method SecondsIntegerValue(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..UnsignedInteger(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  seconds value ::= seconds integer value [ period [ seconds fraction ] ]
Method SecondsValue(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..SecondsIntegerValue(subElement,.addedElement)  && ..SecondsValue45OptGrp(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method SecondsValue45OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Period(subElement,.addedElement)  && $S(..SecondsFraction(subElement,.addedElement) :1,1:1) {
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

///  select list ::= asterisk | select sublist [ { comma select sublist }... ]
Method SelectList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..Asterisk(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..SelectList153Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method SelectList153Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..SelectSublist(subElement,.addedElement)  && $S(..SelectList154RepOne(subElement,.addedElement) :1,1:1) {
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

///  { comma select sublist }...
Method SelectList154RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..SelectList155Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  comma select sublist
Method SelectList155Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Comma(subElement,.addedElement)  && ..SelectSublist(subElement,.addedElement)  {
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

///  select statement: single row ::= SELECT [ set quantifier ] select list INTO select target list table expression
Method SelectStatementSingleRow(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"SELECT")  && $S(..SetQuantifier(subElement,.addedElement) :1,1:1) && ..SelectList(subElement,.addedElement)  && ..addKeyword(subElement,"INTO")  && ..SelectTargetList(subElement,.addedElement)  && ..TableExpression(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  select sublist ::= derived column | qualifier period asterisk
Method SelectSublist(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..DerivedColumn(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..SelectSublist156Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method SelectSublist156Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Qualifier(subElement,.addedElement)  && ..Period(subElement,.addedElement)  && ..Asterisk(subElement,.addedElement)  {
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

///  select target list ::= target specification [ { comma target specification }... ]
Method SelectTargetList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..TargetSpecification(subElement,.addedElement)  && $S(..SelectTargetList265RepOne(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  { comma target specification }...
Method SelectTargetList265RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..SelectTargetList266Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  comma target specification
Method SelectTargetList266Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Comma(subElement,.addedElement)  && ..TargetSpecification(subElement,.addedElement)  {
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

///  semicolon ::= ;
Method Semicolon(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,";") {
		s done=1
	}
	if done {
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  separator ::= { comment | space | newline }...
Method Separator(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..Separator14RepOne(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  { comment | space | newline }...
Method Separator14RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..Separator15Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  comment | space | newline
Method Separator15Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Comment(subElement,.addedElement)  {
		s done=1 ; or
	} elseif ..Space(subElement,.addedElement)  {
		s done=1 ; or
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

///  set catalog statement ::= SET CATALOG value specification
Method SetCatalogStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"SET")  && ..addKeyword(subElement,"CATALOG")  && ..ValueSpecification(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  set clause ::= object column equals operator update source
Method SetClause(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..ObjectColumn(subElement,.addedElement)  && ..EqualsOperator(subElement,.addedElement)  && ..UpdateSource(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  set clause list ::= set clause [ { comma set clause } ... ]
Method SetClauseList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..SetClause(subElement,.addedElement)  && $S(..SetClauseList270RepOne(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  { comma set clause } ...
Method SetClauseList270RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..SetClauseList271Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  comma set clause
Method SetClauseList271Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Comma(subElement,.addedElement)  && ..SetClause(subElement,.addedElement)  {
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

///  set column default clause ::= SET default clause
Method SetColumnDefaultClause(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"SET")  && ..DefaultClause(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  set connection statement ::= SET CONNECTION connection object
Method SetConnectionStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"SET")  && ..addKeyword(subElement,"CONNECTION")  && ..ConnectionObject(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  set constraints mode statement ::= SET CONSTRAINTS constraint name list { DEFERRED | IMMEDIATE }
Method SetConstraintsModeStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"SET")  && ..addKeyword(subElement,"CONSTRAINTS")  && ..ConstraintNameList(subElement,.addedElement)  && ..SetConstraintsModeStatement280Sub(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  DEFERRED | IMMEDIATE
Method SetConstraintsModeStatement280Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"DEFERRED")  {
		s done=1 ; or
	} elseif ..addKeyword(subElement,"IMMEDIATE")  {
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

///  set count ::= COUNT equals operator simple value specification 1
Method SetCount(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"COUNT")  && ..EqualsOperator(subElement,.addedElement)  && ..SimpleValueSpecification1(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  set descriptor information ::= set count | VALUE item number set item information [ { comma set item information }... ]
Method SetDescriptorInformation(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..SetCount(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..SetDescriptorInformation288Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method SetDescriptorInformation288Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"VALUE")  && ..ItemNumber(subElement,.addedElement)  && ..SetItemInformation(subElement,.addedElement)  && $S(..SetDescriptorInformation289RepOne(subElement,.addedElement) :1,1:1) {
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

///  { comma set item information }...
Method SetDescriptorInformation289RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..SetDescriptorInformation290Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  comma set item information
Method SetDescriptorInformation290Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Comma(subElement,.addedElement)  && ..SetItemInformation(subElement,.addedElement)  {
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

///  set descriptor statement ::= SET DESCRIPTOR descriptor name set descriptor information
Method SetDescriptorStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"SET")  && ..addKeyword(subElement,"DESCRIPTOR")  && ..DescriptorName(subElement,.addedElement)  && ..SetDescriptorInformation(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  set domain default clause ::= SET default clause
Method SetDomainDefaultClause(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"SET")  && ..DefaultClause(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  set function specification ::= COUNT left paren asterisk right paren | general set function
Method SetFunctionSpecification(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"COUNT")  && ..LeftParen(subElement,.addedElement)  && ..Asterisk(subElement,.addedElement)  && ..RightParen(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..GeneralSetFunction(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  set function type ::= AVG | MAX | MIN | SUM | COUNT
Method SetFunctionType(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"AVG")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"MAX")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"MIN")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"SUM")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"COUNT")  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  set item information ::= descriptor item name equals operator simple value specification 2
Method SetItemInformation(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..DescriptorItemName(subElement,.addedElement)  && ..EqualsOperator(subElement,.addedElement)  && ..SimpleValueSpecification2(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  set local time zone statement ::= SET TIME ZONE set time zone value
Method SetLocalTimeZoneStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"SET")  && ..addKeyword(subElement,"TIME")  && ..addKeyword(subElement,"ZONE")  && ..SetTimeZoneValue(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  set names statement ::= SET NAMES value specification
Method SetNamesStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"SET")  && ..addKeyword(subElement,"NAMES")  && ..ValueSpecification(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  set quantifier ::= DISTINCT | ALL
Method SetQuantifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"DISTINCT")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"ALL")  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  set schema statement ::= SET SCHEMA value specification
Method SetSchemaStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"SET")  && ..addKeyword(subElement,"SCHEMA")  && ..ValueSpecification(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  set session authorization identifier statement ::= SET SESSION AUTHORIZATION value specification
Method SetSessionAuthorizationIdentifierStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"SET")  && ..addKeyword(subElement,"SESSION")  && ..addKeyword(subElement,"AUTHORIZATION")  && ..ValueSpecification(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  set time zone value ::= interval value expression | LOCAL
Method SetTimeZoneValue(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..IntervalValueExpression(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"LOCAL")  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  set transaction statement ::= SET TRANSACTION transaction mode [ { comma transaction mode }... ]
Method SetTransactionStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"SET")  && ..addKeyword(subElement,"TRANSACTION")  && ..TransactionMode(subElement,.addedElement)  && $S(..SetTransactionStatement273RepOne(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  { comma transaction mode }...
Method SetTransactionStatement273RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..SetTransactionStatement274Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  comma transaction mode
Method SetTransactionStatement274Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Comma(subElement,.addedElement)  && ..TransactionMode(subElement,.addedElement)  {
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

///  sign ::= plus sign | minus sign
Method Sign(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	s done=0,ok=1,pos=..stream.pos,lastpos=pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s ret=($isobject(subElement))
		i ret $$$BNFCOMMITCOPY(subElement,ParentElement)
		q ret
	}
	$$$BNFMEMOSET(pos,"")
	d ..getBookmark(.bm)
	while ok {
	$$$BNFSTART(subElement)
		d ..gotoBookmark(.bm)
		s rec=..Sign8Recurse(subElement,.addedElement)
		i rec,..stream.pos>lastpos {
			$$$BNFMEMOSET(pos,addedElement)
			s done=1,lastpos=..stream.pos
		} else {
			s ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best 
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		i $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	q ret
}

Method Sign8Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..PlusSign(subElement,.addedElement)  {
		s done=1 ; or
	} elseif ..MinusSign(subElement,.addedElement)  {
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

///  signed integer ::= [ sign ] unsigned integer
Method SignedInteger(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if $S(..Sign(subElement,.addedElement) :1,1:1) && ..UnsignedInteger(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  signed numeric literal ::= [ sign ] unsigned numeric literal
Method SignedNumericLiteral(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if $S(..Sign(subElement,.addedElement) :1,1:1) && ..UnsignedNumericLiteral(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  simple case ::= CASE case operand simple when clause... [ else clause ] END
Method SimpleCase(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"CASE")  && ..CaseOperand(subElement,.addedElement)  && ..SimpleCase177RepOne(subElement,.addedElement)  && $S(..ElseClause(subElement,.addedElement) :1,1:1) && ..addKeyword(subElement,"END")  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  simple when clause...
Method SimpleCase177RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..SimpleWhenClause(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  simple Latin letter ::= simple Latin upper case letter | simple Latin lower case letter
Method SimpleLatinLetter(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..SimpleLatinUpperCaseLetter(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..SimpleLatinLowerCaseLetter(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  simple Latin lower case letter ::= a | b | c | d | e | f | g | h | i | j | k | l | m | n | o | p | q | r | s | t | u | v | w | x | y | z
Method SimpleLatinLowerCaseLetter(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"A")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"B")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"C")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"D")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"E")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"F")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"G")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"H")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"I")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"J")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"K")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"L")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"M")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"N")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"O")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"P")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"Q")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"R")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"S")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"T")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"U")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"V")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"W")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"X")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"Y")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"Z")  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  simple Latin upper case letter ::= A | B | C | D | E | F | G | H | I | J | K | L | M | N | O | P | Q | R | S | T | U | V | W | X | Y | Z
Method SimpleLatinUpperCaseLetter(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"A")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"B")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"C")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"D")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"E")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"F")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"G")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"H")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"I")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"J")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"K")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"L")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"M")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"N")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"O")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"P")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"Q")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"R")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"S")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"T")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"U")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"V")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"W")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"X")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"Y")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"Z")  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  simple table ::= query specification | table value constructor | explicit table
Method SimpleTable(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..QuerySpecification(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..TableValueConstructor(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..ExplicitTable(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  simple target specification ::= parameter name | embedded variable name
Method SimpleTargetSpecification(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..ParameterName(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..EmbeddedVariableName(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  simple target specification 1 ::= simple target specification
Method SimpleTargetSpecification1(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..SimpleTargetSpecification(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  simple target specification 2 ::= simple target specification
Method SimpleTargetSpecification2(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..SimpleTargetSpecification(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  simple value specification ::= parameter name | embedded variable name | literal
Method SimpleValueSpecification(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..ParameterName(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..EmbeddedVariableName(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..Literal(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  simple value specification 1 ::= simple value specification
Method SimpleValueSpecification1(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..SimpleValueSpecification(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  simple value specification 2 ::= simple value specification
Method SimpleValueSpecification2(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..SimpleValueSpecification(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  simple when clause ::= WHEN when operand THEN result
Method SimpleWhenClause(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"WHEN")  && ..WhenOperand(subElement,.addedElement)  && ..addKeyword(subElement,"THEN")  && ..Result(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  single datetime field ::= non-second datetime field [ left paren interval leading field precision right paren ] | SECOND [ left paren interval leading field precision [ comma interval fractional seconds precision ] right paren ]
Method SingleDatetimeField(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..NonSecondDatetimeField(subElement,.addedElement)  && ..SingleDatetimeField111OptGrp(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..SingleDatetimeField112Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method SingleDatetimeField111OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LeftParen(subElement,.addedElement)  && ..IntervalLeadingFieldPrecision(subElement,.addedElement)  && ..RightParen(subElement,.addedElement)  {
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

Method SingleDatetimeField112Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"SECOND")  && ..SingleDatetimeField113OptGrp(subElement,.addedElement)  {
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

Method SingleDatetimeField113OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LeftParen(subElement,.addedElement)  && ..IntervalLeadingFieldPrecision(subElement,.addedElement)  && ..SingleDatetimeField114OptGrp(subElement,.addedElement)  && ..RightParen(subElement,.addedElement)  {
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

Method SingleDatetimeField114OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Comma(subElement,.addedElement)  && ..IntervalFractionalSecondsPrecision(subElement,.addedElement)  {
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

///  solidus ::= /
Method Solidus(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"/") {
		s done=1
	}
	if done {
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  some ::= SOME | ANY
Method Some(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	s done=0,ok=1,pos=..stream.pos,lastpos=pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s ret=($isobject(subElement))
		i ret $$$BNFCOMMITCOPY(subElement,ParentElement)
		q ret
	}
	$$$BNFMEMOSET(pos,"")
	d ..getBookmark(.bm)
	while ok {
	$$$BNFSTART(subElement)
		d ..gotoBookmark(.bm)
		s rec=..Some211Recurse(subElement,.addedElement)
		i rec,..stream.pos>lastpos {
			$$$BNFMEMOSET(pos,addedElement)
			s done=1,lastpos=..stream.pos
		} else {
			s ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best 
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		i $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	q ret
}

Method Some211Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(subElement,"SOME")  {
		s done=1 ; or
	} elseif ..addKeyword(subElement,"ANY")  {
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

///  sort key ::= column name | unsigned integer
Method SortKey(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..ColumnName(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..UnsignedInteger(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  sort specification ::= sort key [ collate clause ] [ ordering specification ]
Method SortSpecification(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..SortKey(subElement,.addedElement)  && $S(..CollateClause(subElement,.addedElement) :1,1:1) && $S(..OrderingSpecification(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  sort specification list ::= sort specification [ { comma sort specification }... ]
Method SortSpecificationList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..SortSpecification(subElement,.addedElement)  && $S(..SortSpecificationList217RepOne(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  { comma sort specification }...
Method SortSpecificationList217RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..SortSpecificationList218Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  comma sort specification
Method SortSpecificationList218Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Comma(subElement,.addedElement)  && ..SortSpecification(subElement,.addedElement)  {
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

///  source character set specification ::= character set specification
Method SourceCharacterSetSpecification(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..CharacterSetSpecification(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  space ::= !! space character in character set in use
Method Space(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	s done=0,ok=1,pos=..stream.pos,lastpos=pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s ret=($isobject(subElement))
		i ret $$$BNFCOMMITCOPY(subElement,ParentElement)
		q ret
	}
	$$$BNFMEMOSET(pos,"")
	d ..getBookmark(.bm)
	while ok {
	$$$BNFSTART(subElement)
		d ..gotoBookmark(.bm)
		s rec=..Space1Recurse(subElement,.addedElement)
		i rec,..stream.pos>lastpos {
			$$$BNFMEMOSET(pos,addedElement)
			s done=1,lastpos=..stream.pos
		} else {
			s ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best 
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		i $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	q ret
}

Method Space1Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..addPunctuation(subElement,"!!")  {
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

///  SQL conformance ::= low | intermediate | high
Method SqlConformance(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..Low(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..Intermediate(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..High(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  SQL connection statement ::= connect statement | set connection statement | disconnect statement
Method SqlConnectionStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..ConnectStatement(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..SetConnectionStatement(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..DisconnectStatement(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  SQL data change statement ::= delete statement: positioned | delete statement: searched | insert statement | update statement: positioned | update statement: searched
Method SqlDataChangeStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..DeleteStatementPositioned(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..DeleteStatementSearched(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..InsertStatement(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..UpdateStatementPositioned(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..UpdateStatementSearched(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  SQL data statement ::= open statement | fetch statement | close statement | select statement: single row | SQL data change statement
Method SqlDataStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..OpenStatement(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..FetchStatement(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..CloseStatement(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..SelectStatementSingleRow(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..SqlDataChangeStatement(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  sql diagnostics information ::= statement information | condition information
Method SqlDiagnosticsInformation(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..StatementInformation(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..ConditionInformation(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  SQL diagnostics statement ::= get diagnostics statement
Method SqlDiagnosticsStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..GetDiagnosticsStatement(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  SQL dynamic data statement ::= allocate cursor statement | dynamic open statement | dynamic close statement | dynamic fetch statement | dynamic delete statement: positioned | dynamic update statement: positioned
Method SqlDynamicDataStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..AllocateCursorStatement(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..DynamicOpenStatement(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..DynamicCloseStatement(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..DynamicFetchStatement(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..DynamicDeleteStatementPositioned(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..DynamicUpdateStatementPositioned(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  SQL dynamic statement ::= system descriptor statement | prepare statement | deallocate prepared statement | describe statement | execute statement | execute immediate statement | SQL dynamic data statement
Method SqlDynamicStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..SystemDescriptorStatement(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..PrepareStatement(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..DeallocatePreparedStatement(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..DescribeStatement(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..ExecuteStatement(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..ExecuteImmediateStatement(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..SqlDynamicDataStatement(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  SQL edition ::= 1987 | 1989 | 1992
Method SqlEdition(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..mn1987(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..mn1989(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..mn1992(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  SQL embedded language character ::= left bracket | right bracket
Method SqlEmbeddedLanguageCharacter(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..LeftBracket(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..RightBracket(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  SQL language character ::= simple Latin letter | digit | SQL special character
Method SqlLanguageCharacter(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..SimpleLatinLetter(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..Digit(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..SqlSpecialCharacter(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  SQL language identifier ::= SQL language identifier start [ { underscore | SQL language identifier part }... ]
Method SqlLanguageIdentifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	s done=0,ok=1,pos=..stream.pos,lastpos=pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s ret=($isobject(subElement))
		i ret $$$BNFCOMMITCOPY(subElement,ParentElement)
		q ret
	}
	$$$BNFMEMOSET(pos,"")
	d ..getBookmark(.bm)
	while ok {
	$$$BNFSTART(subElement)
		d ..gotoBookmark(.bm)
		s rec=..SqlLanguageIdentifier42Recurse(subElement,.addedElement)
		i rec,..stream.pos>lastpos {
			$$$BNFMEMOSET(pos,addedElement)
			s done=1,lastpos=..stream.pos
		} else {
			s ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best 
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		i $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	q ret
}

Method SqlLanguageIdentifier42Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..SqlLanguageIdentifierStart(subElement,.addedElement)  && $S(..SqlLanguageIdentifier43RepOne(subElement,.addedElement) :1,1:1) {
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

///  { underscore | SQL language identifier part }...
Method SqlLanguageIdentifier43RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..SqlLanguageIdentifier44Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  underscore | SQL language identifier part
Method SqlLanguageIdentifier44Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Underscore(subElement,.addedElement)  {
		s done=1 ; or
	} elseif ..SqlLanguageIdentifierPart(subElement,.addedElement)  {
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

///  SQL language identifier part ::= simple Latin letter | digit
Method SqlLanguageIdentifierPart(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..SimpleLatinLetter(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..Digit(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  SQL language identifier start ::= simple Latin letter
Method SqlLanguageIdentifierStart(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..SimpleLatinLetter(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  SQL object identifier ::= SQL provenance SQL variant
Method SqlObjectIdentifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..SqlProvenance(subElement,.addedElement)  && ..SqlVariant(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  SQL prefix ::= EXEC SQL | ampersandSQL<left paren>
Method SqlPrefix(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"EXEC")  && ..addKeyword(subElement,"SQL")  {
			s done=1 ; or
		} elseif ..SqlPrefix310Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method SqlPrefix310Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..Ampersand(subElement,.addedElement)  && ..addPunctuation(subElement,"SQL<left")  && ..addPunctuation(subElement,"paren>")  {
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

///  SQL procedure statement ::= SQL schema statement | SQL data statement | SQL transaction statement | SQL connection statement | SQL session statement | SQL dynamic statement | SQL diagnostics statement
Method SqlProcedureStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..SqlSchemaStatement(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..SqlDataStatement(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..SqlTransactionStatement(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..SqlConnectionStatement(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..SqlSessionStatement(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..SqlDynamicStatement(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..SqlDiagnosticsStatement(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  SQL provenance ::= arc1 arc2 arc3
Method SqlProvenance(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..Arc1(subElement,.addedElement)  && ..Arc2(subElement,.addedElement)  && ..Arc3(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  SQL schema definition statement ::= schema definition | table definition | view definition | grant statement | domain definition | character set definition | collation definition | translation definition | assertion definition
Method SqlSchemaDefinitionStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..SchemaDefinition(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..TableDefinition(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..ViewDefinition(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..GrantStatement(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..DomainDefinition(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..CharacterSetDefinition(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..CollationDefinition(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..TranslationDefinition(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..AssertionDefinition(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  SQL schema manipulation statement ::= drop schema statement | alter table statement | drop table statement | drop view statement | revoke statement | alter domain statement | drop domain statement | drop character set statement | drop collation statement | drop translation statement | drop assertion statement
Method SqlSchemaManipulationStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..DropSchemaStatement(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..AlterTableStatement(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..DropTableStatement(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..DropViewStatement(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..RevokeStatement(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..AlterDomainStatement(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..DropDomainStatement(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..DropCharacterSetStatement(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..DropCollationStatement(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..DropTranslationStatement(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..DropAssertionStatement(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  SQL schema statement ::= SQL schema definition statement | SQL schema manipulation statement
Method SqlSchemaStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..SqlSchemaDefinitionStatement(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..SqlSchemaManipulationStatement(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  SQL-server name ::= simple value specification
Method SqlServerName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..SimpleValueSpecification(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  SQL session statement ::= set catalog statement | set schema statement | set names statement | set session authorization identifier statement | set local time zone statement
Method SqlSessionStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..SetCatalogStatement(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..SetSchemaStatement(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..SetNamesStatement(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..SetSessionAuthorizationIdentifierStatement(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..SetLocalTimeZoneStatement(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  SQL special character ::= space | double quote | percent | ampersand | quote | left paren | right paren | asterisk | plus sign | comma | minus sign | period | solidus | colon | semicolon | less than operator | greater than operator | equals operator | question mark | underscore | vertical bar
Method SqlSpecialCharacter(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..Space(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..DoubleQuote(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..Percent(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..Ampersand(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..Quote(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..LeftParen(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..RightParen(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..Asterisk(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..PlusSign(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..Comma(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..MinusSign(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..Period(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..Solidus(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..Colon(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..Semicolon(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..LessThanOperator(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..GreaterThanOperator(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..EqualsOperator(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..QuestionMark(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..Underscore(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..VerticalBar(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  SQL statement name ::= statement name | extended statement name
Method SqlStatementName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..StatementName(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..ExtendedStatementName(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  SQL statement variable ::= simple value specification
Method SqlStatementVariable(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..SimpleValueSpecification(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  SQL terminal character ::= SQL language character | SQL embedded language character
Method SqlTerminalCharacter(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..SqlLanguageCharacter(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..SqlEmbeddedLanguageCharacter(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  SQL terminator ::= END-EXEC | semicolon | right paren
Method SqlTerminator(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addPunctuation(subElement,"END-EXEC")  {
			s done=1 ; or
		} elseif ..Semicolon(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..RightParen(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  SQL transaction statement ::= set transaction statement | set constraints mode statement | commit statement | rollback statement
Method SqlTransactionStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..SetTransactionStatement(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..SetConstraintsModeStatement(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..CommitStatement(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..RollbackStatement(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  SQL variant ::= SQL edition SQL conformance
Method SqlVariant(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..SqlEdition(subElement,.addedElement)  && ..SqlConformance(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  standard character repertoire name ::= character set name
Method StandardCharacterRepertoireName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..CharacterSetName(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  standard collation name ::= collation name
Method StandardCollationName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..CollationName(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  standard translation name ::= translation name
Method StandardTranslationName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..TranslationName(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  standard universal character form-of-use name ::= character set name
Method StandardUniversalCharacterFormOfUseName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..CharacterSetName(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  start field ::= non-second datetime field [ left paren interval leading field precision right paren ]
Method StartField(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..NonSecondDatetimeField(subElement,.addedElement)  && ..StartField108OptGrp(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method StartField108OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LeftParen(subElement,.addedElement)  && ..IntervalLeadingFieldPrecision(subElement,.addedElement)  && ..RightParen(subElement,.addedElement)  {
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

///  start position ::= numeric value expression
Method StartPosition(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..NumericValueExpression(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  statement information ::= statement information item [ { comma statement information item }... ]
Method StatementInformation(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	s done=0,ok=1,pos=..stream.pos,lastpos=pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s ret=($isobject(subElement))
		i ret $$$BNFCOMMITCOPY(subElement,ParentElement)
		q ret
	}
	$$$BNFMEMOSET(pos,"")
	d ..getBookmark(.bm)
	while ok {
	$$$BNFSTART(subElement)
		d ..gotoBookmark(.bm)
		s rec=..StatementInformation301Recurse(subElement,.addedElement)
		i rec,..stream.pos>lastpos {
			$$$BNFMEMOSET(pos,addedElement)
			s done=1,lastpos=..stream.pos
		} else {
			s ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best 
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		i $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	q ret
}

Method StatementInformation301Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..StatementInformationItem(subElement,.addedElement)  && $S(..StatementInformation302RepOne(subElement,.addedElement) :1,1:1) {
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

///  { comma statement information item }...
Method StatementInformation302RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..StatementInformation303Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  comma statement information item
Method StatementInformation303Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Comma(subElement,.addedElement)  && ..StatementInformationItem(subElement,.addedElement)  {
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

///  statement information item ::= simple target specification equals operator statement information item name
Method StatementInformationItem(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	s done=0,ok=1,pos=..stream.pos,lastpos=pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s ret=($isobject(subElement))
		i ret $$$BNFCOMMITCOPY(subElement,ParentElement)
		q ret
	}
	$$$BNFMEMOSET(pos,"")
	d ..getBookmark(.bm)
	while ok {
	$$$BNFSTART(subElement)
		d ..gotoBookmark(.bm)
		s rec=..StatementInformationItem304Recurse(subElement,.addedElement)
		i rec,..stream.pos>lastpos {
			$$$BNFMEMOSET(pos,addedElement)
			s done=1,lastpos=..stream.pos
		} else {
			s ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best 
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		i $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	q ret
}

Method StatementInformationItem304Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..SimpleTargetSpecification(subElement,.addedElement)  && ..EqualsOperator(subElement,.addedElement)  && ..StatementInformationItemName(subElement,.addedElement)  {
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

///  statement information item name ::= NUMBER | MORE | COMMAND_FUNCTION | DYNAMIC_FUNCTION | ROW_COUNT
Method StatementInformationItemName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"NUMBER")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"MORE")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"COMMAND_FUNCTION")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"DYNAMIC_FUNCTION")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"ROW_COUNT")  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  statement name ::= identifier
Method StatementName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..Identifier(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  statement or declaration ::= declare cursor | dynamic declare cursor | temporary table declaration | embedded exception declaration | SQL procedure statement
Method StatementOrDeclaration(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..DeclareCursor(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..DynamicDeclareCursor(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..TemporaryTableDeclaration(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..EmbeddedExceptionDeclaration(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..SqlProcedureStatement(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  status parameter ::= SQLCODE | SQLSTATE
Method StatusParameter(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"SQLCODE")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"SQLSTATE")  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  string length ::= numeric value expression
Method StringLength(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..NumericValueExpression(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  string value expression ::= character value expression | bit value expression
Method StringValueExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..CharacterValueExpression(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..BitValueExpression(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  string value function ::= character value function | bit value function
Method StringValueFunction(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..CharacterValueFunction(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..BitValueFunction(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  subquery ::= left paren query expression right paren
Method Subquery(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..LeftParen(subElement,.addedElement)  && ..QueryExpression(subElement,.addedElement)  && ..RightParen(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  system descriptor statement ::= allocate descriptor statement | deallocate descriptor statement | get descriptor statement | set descriptor statement
Method SystemDescriptorStatement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..AllocateDescriptorStatement(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..DeallocateDescriptorStatement(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..GetDescriptorStatement(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..SetDescriptorStatement(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  table constraint ::= unique constraint definition | referential constraint definition | check constraint definition
Method TableConstraint(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..UniqueConstraintDefinition(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..ReferentialConstraintDefinition(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..CheckConstraintDefinition(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  table constraint definition ::= [ constraint name definition ] table constraint [ constraint check time ]
Method TableConstraintDefinition(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if $S(..ConstraintNameDefinition(subElement,.addedElement) :1,1:1) && ..TableConstraint(subElement,.addedElement)  && $S(..ConstraintCheckTime(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  table definition ::= CREATE [ { GLOBAL | LOCAL } TEMPORARY ] TABLE table name table element list [ ON COMMIT { DELETE | PRESERVE } ROWS ]
Method TableDefinition(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"CREATE")  && ..TableDefinition228OptGrp(subElement,.addedElement)  && ..addKeyword(subElement,"TABLE")  && ..TableName(subElement,.addedElement)  && ..TableElementList(subElement,.addedElement)  && ..TableDefinition230OptGrp(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method TableDefinition228OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..TableDefinition229Sub(subElement,.addedElement)  && ..addKeyword(subElement,"TEMPORARY")  {
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

///  GLOBAL | LOCAL
Method TableDefinition229Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"GLOBAL")  {
		s done=1 ; or
	} elseif ..addKeyword(subElement,"LOCAL")  {
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

Method TableDefinition230OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"ON")  && ..addKeyword(subElement,"COMMIT")  && ..TableDefinition231Sub(subElement,.addedElement)  && ..addKeyword(subElement,"ROWS")  {
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

///  DELETE | PRESERVE
Method TableDefinition231Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"DELETE")  {
		s done=1 ; or
	} elseif ..addKeyword(subElement,"PRESERVE")  {
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

///  table element ::= column definition | table constraint definition
Method TableElement(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..ColumnDefinition(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..TableConstraintDefinition(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  table element list ::= left paren table element [ { comma table element }... ] right paren
Method TableElementList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..LeftParen(subElement,.addedElement)  && ..TableElement(subElement,.addedElement)  && $S(..TableElementList63RepOne(subElement,.addedElement) :1,1:1) && ..RightParen(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  { comma table element }...
Method TableElementList63RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..TableElementList64Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  comma table element
Method TableElementList64Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Comma(subElement,.addedElement)  && ..TableElement(subElement,.addedElement)  {
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

///  table expression ::= from clause [ where clause ] [ group by clause ] [ having clause ]
Method TableExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..FromClause(subElement,.addedElement)  && $S(..WhereClause(subElement,.addedElement) :1,1:1) && $S(..GroupByClause(subElement,.addedElement) :1,1:1) && $S(..HavingClause(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  table name ::= qualified name | qualified local table name
Method TableName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	s done=0,ok=1,pos=..stream.pos,lastpos=pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s ret=($isobject(subElement))
		i ret $$$BNFCOMMITCOPY(subElement,ParentElement)
		q ret
	}
	$$$BNFMEMOSET(pos,"")
	d ..getBookmark(.bm)
	while ok {
	$$$BNFSTART(subElement)
		d ..gotoBookmark(.bm)
		s rec=..TableName122Recurse(subElement,.addedElement)
		i rec,..stream.pos>lastpos {
			$$$BNFMEMOSET(pos,addedElement)
			s done=1,lastpos=..stream.pos
		} else {
			s ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best 
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		i $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	q ret
}

Method TableName122Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..QualifiedName(subElement,.addedElement)  {
		s done=1 ; or
	} elseif ..QualifiedLocalTableName(subElement,.addedElement)  {
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

///  table reference ::= table name [ correlation specification ] | derived table correlation specification | joined table
Method TableReference(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..TableName(subElement,.addedElement)  && $S(..CorrelationSpecification(subElement,.addedElement) :1,1:1) {
			s done=1 ; or
		} elseif ..TableReference159Or(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..JoinedTable(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method TableReference159Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..DerivedTable(subElement,.addedElement)  && ..CorrelationSpecification(subElement,.addedElement)  {
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

///  table subquery ::= subquery
Method TableSubquery(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..Subquery(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  table value constructor ::= VALUES table value constructor list
Method TableValueConstructor(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	s done=0,ok=1,pos=..stream.pos,lastpos=pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s ret=($isobject(subElement))
		i ret $$$BNFCOMMITCOPY(subElement,ParentElement)
		q ret
	}
	$$$BNFMEMOSET(pos,"")
	d ..getBookmark(.bm)
	while ok {
	$$$BNFSTART(subElement)
		d ..gotoBookmark(.bm)
		s rec=..TableValueConstructor168Recurse(subElement,.addedElement)
		i rec,..stream.pos>lastpos {
			$$$BNFMEMOSET(pos,addedElement)
			s done=1,lastpos=..stream.pos
		} else {
			s ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best 
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		i $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	q ret
}

Method TableValueConstructor168Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(subElement,"VALUES")  && ..TableValueConstructorList(subElement,.addedElement)  {
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

///  table value constructor list ::= row value constructor [ { comma row value constructor }... ]
Method TableValueConstructorList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..RowValueConstructor(subElement,.addedElement)  && $S(..TableValueConstructorList169RepOne(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  { comma row value constructor }...
Method TableValueConstructorList169RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..TableValueConstructorList170Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  comma row value constructor
Method TableValueConstructorList170Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Comma(subElement,.addedElement)  && ..RowValueConstructor(subElement,.addedElement)  {
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

///  target character set specification ::= character set specification
Method TargetCharacterSetSpecification(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..CharacterSetSpecification(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  target specification ::= parameter specification | variable specification
Method TargetSpecification(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..ParameterSpecification(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..VariableSpecification(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  temporary table declaration ::= DECLARE LOCAL TEMPORARY TABLE qualified local table name table element list [ ON COMMIT { PRESERVE | DELETE } ROWS ]
Method TemporaryTableDeclaration(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"DECLARE")  && ..addKeyword(subElement,"LOCAL")  && ..addKeyword(subElement,"TEMPORARY")  && ..addKeyword(subElement,"TABLE")  && ..QualifiedLocalTableName(subElement,.addedElement)  && ..TableElementList(subElement,.addedElement)  && ..TemporaryTableDeclaration61OptGrp(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method TemporaryTableDeclaration61OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"ON")  && ..addKeyword(subElement,"COMMIT")  && ..TemporaryTableDeclaration62Sub(subElement,.addedElement)  && ..addKeyword(subElement,"ROWS")  {
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

///  PRESERVE | DELETE
Method TemporaryTableDeclaration62Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"PRESERVE")  {
		s done=1 ; or
	} elseif ..addKeyword(subElement,"DELETE")  {
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

///  term ::= factor | term asterisk factor | term solidus factor
Method Term(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	s done=0,ok=1,pos=..stream.pos,lastpos=pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s ret=($isobject(subElement))
		i ret $$$BNFCOMMITCOPY(subElement,ParentElement)
		q ret
	}
	$$$BNFMEMOSET(pos,"")
	d ..getBookmark(.bm)
	while ok {
	$$$BNFSTART(subElement)
		d ..gotoBookmark(.bm)
		s rec=..Term142Recurse(subElement,.addedElement)
		i rec,..stream.pos>lastpos {
			$$$BNFMEMOSET(pos,addedElement)
			s done=1,lastpos=..stream.pos
		} else {
			s ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best 
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		i $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	q ret
}

Method Term142Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..Factor(subElement,.addedElement)  {
		s done=1 ; or
	} elseif ..Term143Or(subElement,.addedElement)  {
		s done=1 ; or
	} elseif ..Term144Or(subElement,.addedElement)  {
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

Method Term143Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Term(subElement,.addedElement)  && ..Asterisk(subElement,.addedElement)  && ..Factor(subElement,.addedElement)  {
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

Method Term144Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Term(subElement,.addedElement)  && ..Solidus(subElement,.addedElement)  && ..Factor(subElement,.addedElement)  {
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

///  time fractional seconds precision ::= unsigned integer
Method TimeFractionalSecondsPrecision(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..UnsignedInteger(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  time-interval ::= hours value [ colon minutes value [ colon seconds value ] ] | minutes value [ colon seconds value ] | seconds value
Method TimeInterval(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..HoursValue(subElement,.addedElement)  && ..TimeInterval52OptGrp(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..TimeInterval54Or(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..SecondsValue(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method TimeInterval52OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Colon(subElement,.addedElement)  && ..MinutesValue(subElement,.addedElement)  && ..TimeInterval53OptGrp(subElement,.addedElement)  {
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

Method TimeInterval53OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Colon(subElement,.addedElement)  && ..SecondsValue(subElement,.addedElement)  {
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

Method TimeInterval54Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..MinutesValue(subElement,.addedElement)  && ..TimeInterval55OptGrp(subElement,.addedElement)  {
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

Method TimeInterval55OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Colon(subElement,.addedElement)  && ..SecondsValue(subElement,.addedElement)  {
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

///  time literal ::= TIME time string
Method TimeLiteral(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"TIME")  && ..TimeString(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  time precision ::= time fractional seconds precision
Method TimePrecision(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..TimeFractionalSecondsPrecision(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  time string ::= quote time value [ time zone interval ] quote
Method TimeString(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..Quote(subElement,.addedElement)  && ..TimeValue(subElement,.addedElement)  && $S(..TimeZoneInterval(subElement,.addedElement) :1,1:1) && ..Quote(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  time value ::= hours value colon minutes value colon seconds value
Method TimeValue(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..HoursValue(subElement,.addedElement)  && ..Colon(subElement,.addedElement)  && ..MinutesValue(subElement,.addedElement)  && ..Colon(subElement,.addedElement)  && ..SecondsValue(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  time zone ::= AT time zone specifier
Method TimeZone(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	s done=0,ok=1,pos=..stream.pos,lastpos=pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s ret=($isobject(subElement))
		i ret $$$BNFCOMMITCOPY(subElement,ParentElement)
		q ret
	}
	$$$BNFMEMOSET(pos,"")
	d ..getBookmark(.bm)
	while ok {
	$$$BNFSTART(subElement)
		d ..gotoBookmark(.bm)
		s rec=..TimeZone199Recurse(subElement,.addedElement)
		i rec,..stream.pos>lastpos {
			$$$BNFMEMOSET(pos,addedElement)
			s done=1,lastpos=..stream.pos
		} else {
			s ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best 
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		i $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	q ret
}

Method TimeZone199Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..addKeyword(subElement,"AT")  && ..TimeZoneSpecifier(subElement,.addedElement)  {
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

///  time zone field ::= TIMEZONE_HOUR | TIMEZONE_MINUTE
Method TimeZoneField(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addPunctuation(subElement,"TIMEZONE_HOUR")  {
			s done=1 ; or
		} elseif ..addPunctuation(subElement,"TIMEZONE_MINUTE")  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  time zone interval ::= sign hours value colon minutes value
Method TimeZoneInterval(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..Sign(subElement,.addedElement)  && ..HoursValue(subElement,.addedElement)  && ..Colon(subElement,.addedElement)  && ..MinutesValue(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  time zone specifier ::= LOCAL | TIME ZONE interval value expression
Method TimeZoneSpecifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"LOCAL")  {
			s done=1 ; or
		} elseif ..TimeZoneSpecifier200Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method TimeZoneSpecifier200Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"TIME")  && ..addKeyword(subElement,"ZONE")  && ..IntervalValueExpression(subElement,.addedElement)  {
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

///  timestamp literal ::= TIMESTAMP timestamp string
Method TimestampLiteral(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"TIMESTAMP")  && ..TimestampString(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  timestamp precision ::= time fractional seconds precision
Method TimestampPrecision(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..TimeFractionalSecondsPrecision(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  timestamp string ::= quote date value space time value [ time zone interval ] quote
Method TimestampString(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..Quote(subElement,.addedElement)  && ..DateValue(subElement,.addedElement)  && ..Space(subElement,.addedElement)  && ..TimeValue(subElement,.addedElement)  && $S(..TimeZoneInterval(subElement,.addedElement) :1,1:1) && ..Quote(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  token ::= nondelimiter token | delimiter token
Method Token(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	s done=0,ok=1,pos=..stream.pos,lastpos=pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s ret=($isobject(subElement))
		i ret $$$BNFCOMMITCOPY(subElement,ParentElement)
		q ret
	}
	$$$BNFMEMOSET(pos,"")
	d ..getBookmark(.bm)
	while ok {
	$$$BNFSTART(subElement)
		d ..gotoBookmark(.bm)
		s rec=..Token2Recurse(subElement,.addedElement)
		i rec,..stream.pos>lastpos {
			$$$BNFMEMOSET(pos,addedElement)
			s done=1,lastpos=..stream.pos
		} else {
			s ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best 
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		i $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	q ret
}

Method Token2Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..NondelimiterToken(subElement,.addedElement)  {
		s done=1 ; or
	} elseif ..DelimiterToken(subElement,.addedElement)  {
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

///  transaction access mode ::= READ ONLY | READ WRITE
Method TransactionAccessMode(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"READ")  && ..addKeyword(subElement,"ONLY")  {
			s done=1 ; or
		} elseif ..TransactionAccessMode278Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method TransactionAccessMode278Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"READ")  && ..addKeyword(subElement,"WRITE")  {
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

///  transaction mode ::= isolation level | transaction access mode | diagnostics size
Method TransactionMode(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..IsolationLevel(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..TransactionAccessMode(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..DiagnosticsSize(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  translation collation ::= TRANSLATION translation name [ THEN COLLATION collation name ]
Method TranslationCollation(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"TRANSLATION")  && ..TranslationName(subElement,.addedElement)  && ..TranslationCollation253OptGrp(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method TranslationCollation253OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"THEN")  && ..addKeyword(subElement,"COLLATION")  && ..CollationName(subElement,.addedElement)  {
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

///  translation definition ::= CREATE TRANSLATION translation name FOR source character set specification TO target character set specification FROM translation source
Method TranslationDefinition(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"CREATE")  && ..addKeyword(subElement,"TRANSLATION")  && ..TranslationName(subElement,.addedElement)  && ..addKeyword(subElement,"FOR")  && ..SourceCharacterSetSpecification(subElement,.addedElement)  && ..addKeyword(subElement,"TO")  && ..TargetCharacterSetSpecification(subElement,.addedElement)  && ..addKeyword(subElement,"FROM")  && ..TranslationSource(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  translation name ::= qualified name
Method TranslationName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..QualifiedName(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  translation source ::= translation specification
Method TranslationSource(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..TranslationSpecification(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  translation specification ::= external translation | IDENTITY | schema translation name
Method TranslationSpecification(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..ExternalTranslation(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"IDENTITY")  {
			s done=1 ; or
		} elseif ..SchemaTranslationName(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  trim character ::= character value expression
Method TrimCharacter(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..CharacterValueExpression(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  trim function ::= TRIM left paren trim operands right paren
Method TrimFunction(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"TRIM")  && ..LeftParen(subElement,.addedElement)  && ..TrimOperands(subElement,.addedElement)  && ..RightParen(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  trim operands ::= [ [ trim specification ] [ trim character ] FROM ] trim source
Method TrimOperands(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..TrimOperands184OptGrp(subElement,.addedElement)  && ..TrimSource(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method TrimOperands184OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if $S(..TrimSpecification(subElement,.addedElement) :1,1:1) && $S(..TrimCharacter(subElement,.addedElement) :1,1:1) && ..addKeyword(subElement,"FROM")  {
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

///  trim source ::= character value expression
Method TrimSource(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..CharacterValueExpression(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  trim specification ::= LEADING | TRAILING | BOTH
Method TrimSpecification(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"LEADING")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"TRAILING")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"BOTH")  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  truth value ::= TRUE | FALSE | UNKNOWN
Method TruthValue(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"TRUE")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"FALSE")  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"UNKNOWN")  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  underscore ::= _
Method Underscore(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"_") {
		s done=1
	}
	if done {
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  unique column list ::= column name list
Method UniqueColumnList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..ColumnNameList(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  unique constraint definition ::= unique specification left paren unique column list right paren
Method UniqueConstraintDefinition(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..UniqueSpecification(subElement,.addedElement)  && ..LeftParen(subElement,.addedElement)  && ..UniqueColumnList(subElement,.addedElement)  && ..RightParen(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  unique predicate ::= UNIQUE table subquery
Method UniquePredicate(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"UNIQUE")  && ..TableSubquery(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  unique specification ::= UNIQUE | PRIMARY KEY
Method UniqueSpecification(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"UNIQUE")  {
			s done=1 ; or
		} elseif ..UniqueSpecification119Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method UniqueSpecification119Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addKeyword(subElement,"PRIMARY")  && ..addKeyword(subElement,"KEY")  {
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

///  unqualified schema name ::= identifier
Method UnqualifiedSchemaName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..Identifier(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  unsigned integer ::= digit ...
Method UnsignedInteger(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..UnsignedInteger7RepOne(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  digit ...
Method UnsignedInteger7RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..Digit(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  unsigned literal ::= unsigned numeric literal | general literal
Method UnsignedLiteral(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..UnsignedNumericLiteral(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..GeneralLiteral(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  unsigned numeric literal ::= exact numeric literal | approximate numeric literal
Method UnsignedNumericLiteral(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..ExactNumericLiteral(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..ApproximateNumericLiteral(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  unsigned value specification ::= unsigned literal | general value specification
Method UnsignedValueSpecification(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..UnsignedLiteral(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..GeneralValueSpecification(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  updatability clause ::= FOR { READ ONLY | UPDATE [ OF column name list ] }
Method UpdatabilityClause(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"FOR")  && ..UpdatabilityClause219Sub(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  READ ONLY | UPDATE [ OF column name list ]
Method UpdatabilityClause219Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"READ")  && ..addKeyword(subElement,"ONLY")  {
		s done=1 ; or
	} elseif ..UpdatabilityClause220Or(subElement,.addedElement)  {
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

Method UpdatabilityClause220Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"UPDATE")  && ..UpdatabilityClause221OptGrp(subElement,.addedElement)  {
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

Method UpdatabilityClause221OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"OF")  && ..ColumnNameList(subElement,.addedElement)  {
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

///  update rule ::= ON UPDATE referential action
Method UpdateRule(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"ON")  && ..addKeyword(subElement,"UPDATE")  && ..ReferentialAction(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  update source ::= value expression | null specification | DEFAULT
Method UpdateSource(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..ValueExpression(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..NullSpecification(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..addKeyword(subElement,"DEFAULT")  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  update statement: positioned ::= UPDATE table name SET set clause list WHERE CURRENT OF cursor name
Method UpdateStatementPositioned(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"UPDATE")  && ..TableName(subElement,.addedElement)  && ..addKeyword(subElement,"SET")  && ..SetClauseList(subElement,.addedElement)  && ..addKeyword(subElement,"WHERE")  && ..addKeyword(subElement,"CURRENT")  && ..addKeyword(subElement,"OF")  && ..CursorName(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  update statement: searched ::= UPDATE table name SET set clause list [ WHERE search condition ]
Method UpdateStatementSearched(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"UPDATE")  && ..TableName(subElement,.addedElement)  && ..addKeyword(subElement,"SET")  && ..SetClauseList(subElement,.addedElement)  && ..UpdateStatementSearched272OptGrp(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method UpdateStatementSearched272OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"WHERE")  && ..SearchCondition(subElement,.addedElement)  {
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

///  user-defined character repertoire name ::= character set name
Method UserDefinedCharacterRepertoireName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..CharacterSetName(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  user name ::= simple value specification
Method UserName(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..SimpleValueSpecification(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  using arguments ::= { USING | INTO } argument [ { comma argument }... ]
Method UsingArguments(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..UsingArguments295Sub(subElement,.addedElement)  && ..Argument(subElement,.addedElement)  && $S(..UsingArguments296RepOne(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  USING | INTO
Method UsingArguments295Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"USING")  {
		s done=1 ; or
	} elseif ..addKeyword(subElement,"INTO")  {
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

///  { comma argument }...
Method UsingArguments296RepOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	set subElement=ParentElement
	set done=0 ; method start
	set done=0 ; must be at least 1
	while ..UsingArguments297Sub(subElement,.addedElement)  {
		set done=1
	}
	if done {
		set ret=1
	} else {
		set ret=0 ; normal rollback
	}
	quit ret
}

///  comma argument
Method UsingArguments297Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Comma(subElement,.addedElement)  && ..Argument(subElement,.addedElement)  {
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

///  using clause ::= using arguments | using descriptor
Method UsingClause(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..UsingArguments(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..UsingDescriptor(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  using descriptor ::= { USING | INTO } SQL DESCRIPTOR descriptor name
Method UsingDescriptor(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..UsingDescriptor294Sub(subElement,.addedElement)  && ..addKeyword(subElement,"SQL")  && ..addKeyword(subElement,"DESCRIPTOR")  && ..DescriptorName(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  USING | INTO
Method UsingDescriptor294Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"USING")  {
		s done=1 ; or
	} elseif ..addKeyword(subElement,"INTO")  {
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

///  value expression ::= numeric value expression | string value expression | datetime value expression | interval value expression
Method ValueExpression(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	s done=0,ok=1,pos=..stream.pos,lastpos=pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s ret=($isobject(subElement))
		i ret $$$BNFCOMMITCOPY(subElement,ParentElement)
		q ret
	}
	$$$BNFMEMOSET(pos,"")
	d ..getBookmark(.bm)
	while ok {
	$$$BNFSTART(subElement)
		d ..gotoBookmark(.bm)
		s rec=..ValueExpression138Recurse(subElement,.addedElement)
		i rec,..stream.pos>lastpos {
			$$$BNFMEMOSET(pos,addedElement)
			s done=1,lastpos=..stream.pos
		} else {
			s ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best 
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		i $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	q ret
}

Method ValueExpression138Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..NumericValueExpression(subElement,.addedElement)  {
		s done=1 ; or
	} elseif ..StringValueExpression(subElement,.addedElement)  {
		s done=1 ; or
	} elseif ..DatetimeValueExpression(subElement,.addedElement)  {
		s done=1 ; or
	} elseif ..IntervalValueExpression(subElement,.addedElement)  {
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

///  value expression primary ::= unsigned value specification | column reference | set function specification | scalar subquery | case expression | left paren value expression right paren | cast specification
Method ValueExpressionPrimary(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..UnsignedValueSpecification(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..ColumnReference(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..SetFunctionSpecification(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..ScalarSubquery(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..CaseExpression(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..ValueExpressionPrimary145Or(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..CastSpecification(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method ValueExpressionPrimary145Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..LeftParen(subElement,.addedElement)  && ..ValueExpression(subElement,.addedElement)  && ..RightParen(subElement,.addedElement)  {
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

///  value specification ::= literal | general value specification
Method ValueSpecification(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	s done=0,ok=1,pos=..stream.pos,lastpos=pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s ret=($isobject(subElement))
		i ret $$$BNFCOMMITCOPY(subElement,ParentElement)
		q ret
	}
	$$$BNFMEMOSET(pos,"")
	d ..getBookmark(.bm)
	while ok {
	$$$BNFSTART(subElement)
		d ..gotoBookmark(.bm)
		s rec=..ValueSpecification286Recurse(subElement,.addedElement)
		i rec,..stream.pos>lastpos {
			$$$BNFMEMOSET(pos,addedElement)
			s done=1,lastpos=..stream.pos
		} else {
			s ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best 
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		i $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	q ret
}

Method ValueSpecification286Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..Literal(subElement,.addedElement)  {
		s done=1 ; or
	} elseif ..GeneralValueSpecification(subElement,.addedElement)  {
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

///  variable specification ::= embedded variable name [ indicator variable ]
Method VariableSpecification(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..EmbeddedVariableName(subElement,.addedElement)  && $S(..IndicatorVariable(subElement,.addedElement) :1,1:1) {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  vertical bar ::= |
Method VerticalBar(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addPunctuation(subElement,"|") {
		s done=1
	}
	if done {
			$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		$$$BNFROLLBACK(subElement)
		set ret=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	quit ret
}

///  view column list ::= column name list
Method ViewColumnList(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..ColumnNameList(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  view definition ::= CREATE VIEW table name [ left paren view column list right paren ] AS query expression [ WITH [ levels clause ] CHECK OPTION ]
Method ViewDefinition(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"CREATE")  && ..addKeyword(subElement,"VIEW")  && ..TableName(subElement,.addedElement)  && ..ViewDefinition232OptGrp(subElement,.addedElement)  && ..addKeyword(subElement,"AS")  && ..QueryExpression(subElement,.addedElement)  && ..ViewDefinition233OptGrp(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method ViewDefinition232OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..LeftParen(subElement,.addedElement)  && ..ViewColumnList(subElement,.addedElement)  && ..RightParen(subElement,.addedElement)  {
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

Method ViewDefinition233OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..addKeyword(subElement,"WITH")  && $S(..LevelsClause(subElement,.addedElement) :1,1:1) && ..addKeyword(subElement,"CHECK")  && ..addKeyword(subElement,"OPTION")  {
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

///  when operand ::= value expression
Method WhenOperand(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..ValueExpression(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  where clause ::= WHERE search condition
Method WhereClause(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addKeyword(subElement,"WHERE")  && ..SearchCondition(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  year-month literal ::= years value | [ years value minus sign ] months value
Method YearMonthLiteral(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..YearsValue(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..YearMonthLiteral47Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method YearMonthLiteral47Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..YearMonthLiteral48OptGrp(subElement,.addedElement)  && ..MonthsValue(subElement,.addedElement)  {
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

Method YearMonthLiteral48OptGrp(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..YearsValue(subElement,.addedElement)  && ..MinusSign(subElement,.addedElement)  {
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

///  years value ::= datetime value
Method YearsValue(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..DatetimeValue(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  1987 ::= 0 | edition1987 left paren 0 right paren
Method mn1987(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addPunctuation(subElement,"0")  {
			s done=1 ; or
		} elseif ..mn1987335Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method mn1987335Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"edition1987")  && ..LeftParen(subElement,.addedElement)  && ..addPunctuation(subElement,"0")  && ..RightParen(subElement,.addedElement)  {
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

///  1989 ::= 1989 base 1989 package
Method mn1989(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	s done=0,ok=1,pos=..stream.pos,lastpos=pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s ret=($isobject(subElement))
		i ret $$$BNFCOMMITCOPY(subElement,ParentElement)
		q ret
	}
	$$$BNFMEMOSET(pos,"")
	d ..getBookmark(.bm)
	while ok {
	$$$BNFSTART(subElement)
		d ..gotoBookmark(.bm)
		s rec=..mn1989336Recurse(subElement,.addedElement)
		i rec,..stream.pos>lastpos {
			$$$BNFMEMOSET(pos,addedElement)
			s done=1,lastpos=..stream.pos
		} else {
			s ok=0 $$$BNFMEMOGET(pos,subElement) ; restore to best 
		}
	}
	if done {
		$$$BNFCOMMIT(subElement,ParentElement)
		set ret=1
	} else {
		i $isobject(subElement) $$$BNFROLLBACK(subElement)
		set ret=0
	}
	$$$DEBUGMethodEnd
	q ret
}

Method mn1989336Recurse(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	set subElement=ParentElement
	set done=0 ; method start
	if ..mn1989Base(subElement,.addedElement)  && ..mn1989Package(subElement,.addedElement)  {
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

///  1989 base ::= 1 | edition1989 left paren 1 right paren
Method mn1989Base(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addPunctuation(subElement,"1")  {
			s done=1 ; or
		} elseif ..mn1989Base337Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method mn1989Base337Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"edition1989")  && ..LeftParen(subElement,.addedElement)  && ..addPunctuation(subElement,"1")  && ..RightParen(subElement,.addedElement)  {
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

///  1989 package ::= integrity no | integrity yes
Method mn1989Package(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..IntegrityNo(subElement,.addedElement)  {
			s done=1 ; or
		} elseif ..IntegrityYes(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

///  1992 ::= 2 | edition1992 left paren 2 right paren
Method mn1992(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	s pos=..stream.pos
	i $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		s done=$isobject(subElement)
	} else {
		if ..addPunctuation(subElement,"2")  {
			s done=1 ; or
		} elseif ..mn1992340Or(subElement,.addedElement)  {
			set done=1 ; end compileRules
		}

	}
	i done {
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

Method mn1992340Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
		$$$DEBUGMethodBegin
		$$$BNFSTART(subElement)
		set done=0 ; method start
		if ..addPunctuation(subElement,"edition1992")  && ..LeftParen(subElement,.addedElement)  && ..addPunctuation(subElement,"2")  && ..RightParen(subElement,.addedElement)  {
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

Method newElement(Type As %String) As PXW.DEV.BNF.Elements.SQL
{
	quit ##class(PXW.DEV.BNF.Elements.SQL).%New(Type)
}

}
