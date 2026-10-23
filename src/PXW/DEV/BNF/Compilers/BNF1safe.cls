/// This class was created by Generating PXW.DEV.BNF.GEN.BNF1 and then copying the code into here.
/// The idea is that this code is never generated directly by compiling something and therefore
/// potentially breaking the bnf compiler beyond repair.
/// 
/// There ARE some tweaks in here so do NOT replace methods from newly generated versions without 
/// thinking carefully.
/// 
/// Using this method of working the compiler should remain safe - hence the name.
/// 
/// Maybe we can go further and remove references to macros.
Class PXW.DEV.BNF.Compilers.BNF1safe Extends PXW.DEV.BNF.super
{

Parameter KeywordPattern = "1.A";

Parameter Keywords;


/* TWEAKED METHODS */
///  call ::= IDENTIFIER
/// summary=C
Method Call(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
    Do:..needsWScheck ..skipWhiteSpaceAndComments()
    ; at the start so NOT a call to something else, this is probably a definition
	If ..stream.col=0 Quit 0

	$$$BNFPATH
	$$$BNFSTART(subElement)
	Set done=0 ; method start
	Set pos=..stream.pos
	If $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		Set done=$ISOBJECT(subElement)
	} Else {
		If ..Identifier(subElement,.addedElement)  {
			Set done=1 ; end compileRules
		}

	}
	If done {
		$$$BNFMEMOSET(pos,subElement)
	} Else {
	}
	If done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		Set ok=1
	} Else {
		$$$BNFROLLBACK(subElement)
		Set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	Quit ok
}

///  KEYWORD ::= 'NEEDS STRING'
/// summary=P
Method Keyword(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	Do:..needsWScheck ..skipWhiteSpaceAndComments()
    Set quote=..peek(1)
    If quote'="""",quote'="'" Quit 0
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	Set done=0 ; method start
	Set pos=..stream.pos
	If $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		Set done=$ISOBJECT(subElement)
	} Else {
        Set start=..next(1)
        Set next50=..stream.PeekToEol()
        Set pos=1
        While $EXTRACT(next50,pos,pos)'=start { Set pos=pos+1 }
        Set n=..next(pos-1)
        Set end=..next(1)
        Set atom=..newAtom("String",n)
        Set atom.start=start,atom.end=end
        Do subElement.AddPart(atom)
        Set done=1
	}
	If done {
		$$$BNFMEMOSET(pos,subElement)
	} Else {
	}
	If done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		Set ok=1
	} Else {
		$$$BNFROLLBACK(subElement)
		Set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	Quit ok
}

///  IDENTIFIER ::= 'NEEDS IDENTIFIER'
/// summary=P
Method Identifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	Set done=0 ; method start
	Set pos=..stream.pos
	If $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		Set done=$ISOBJECT(subElement)
	} Else {
		Do:..needsWScheck ..skipWhiteSpaceAndComments()
        Set next50=..stream.PeekToEol()
        Set pos=1
        ; must start with a letter
        If $EXTRACT(next50,pos,pos)?1A Set pos=pos+1
        If pos>1 {
            While ($EXTRACT(next50,pos,pos)?1AN) || ($EXTRACT(next50,pos,pos)="_") || ($EXTRACT(next50,pos,pos)="-") {
                Set pos=pos+1
            }
            Set atom=..newAtom(ParentElement.type,..nextNotEOL(pos-1))
			Do subElement.AddPart(atom)
			Set done=1
        }
	}
	If done {
		$$$BNFMEMOSET(pos,subElement)
	} Else {
	}
	If done {
		$$$BNFCOMMITCOPY(subElement,ParentElement) ; 6
		Set ok=1
	} Else {
		$$$BNFROLLBACK(subElement)
		Set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	Quit ok
}



///  EQUALS ::= 'NEEDS EQUALS'
/// summary=P
Method Equals(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	Set equals="::="
	If ..isStringSingle(equals,.value)=0 Quit 0 ;

	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	Set done=0 ; method start
	Set pos=..stream.pos
	If $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		Set done=$ISOBJECT(subElement)
	} Else {
		If ..addPunctuation(subElement,equals)  {
			Set done=1 ; end compileRules
		}

	}
	If done {
		$$$BNFMEMOSET(pos,subElement)
	} Else {
	}
	If done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		Set ok=1
	} Else {
		$$$BNFROLLBACK(subElement)
		Set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	Quit ok
}

///  definition ::= IDENTIFIER EQUALS rules
/// summary=C&C&C
Method Definition(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	Set done=0 ; method start
	Set pos=..stream.pos
	If $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		Set done=$ISOBJECT(subElement)
	} Else {
		If ..Identifier(subElement,.addedElement)  && ..Equals(subElement,.addedElement)  && ..Rules(subElement,.addedElement)  {
			Set done=1 ; end compileRules
		}

	}
	If done {
		$$$BNFMEMOSET(pos,subElement)
	} Else {
	}
	If done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		Set ok=1
	} Else {
		$$$BNFROLLBACK(subElement)
		Set ok=0 ; normal rollback
	}
	;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
    If ok=0 {
        Set ok=..recover(ParentElement,.recSub,"",$LISTBUILD($CHAR(13)))
    }

	$$$DEBUGMethodEnd
	Quit ok
}
/// Skip over the next set of comments, return 1 if something was done or 0
Method skipComments(ch10 As %String) As %Boolean
{
    If $EXTRACT(ch10,1,1)="#" Set ..comment=..readLineComment("#") Quit 1
    If $EXTRACT(ch10,1,2)="//" Set ..comment=..readLineComment("//") Quit 1
    If $EXTRACT(ch10,1,2)="--" Set ..comment=..readLineComment("--") Quit 1
    If $EXTRACT(ch10,1,2)="/*" Set ..comment=..readBlockComment() Quit 1
    Quit 0
}


/*----------------------------------------------------------*/
/* 
    
    DIRECTLY COPIED METHODS 

*/


///  file ::= definition*
/// summary=(C)*
Method File(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	Set done=0 ; method start
	Set pos=..stream.pos
	If $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		Set done=$ISOBJECT(subElement)
	} Else {
		If ..File1RepZero(subElement,.addedElement)  {
			Set done=1 ; end compileRules
		}

	}
	If done {
		$$$BNFMEMOSET(pos,subElement)
	} Else {
	}
	If done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		Set ok=1
	} Else {
		$$$BNFROLLBACK(subElement)
		Set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	Quit ok
}


///  definition*
Method File1RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	Set subElement=ParentElement
	; method start
	While ..Definition(subElement,.addedElement)  {
		;
	}
	Set ok=1
	Quit ok
}







///  look_ahead ::= '&' look_ahead_rule
/// summary=P&C
Method LookAhead(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	Set done=0 ; method start
	Set pos=..stream.pos
	If $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		Set done=$ISOBJECT(subElement)
	} Else {
		If ..addPunctuation(subElement,"&")  && ..LookAheadRule(subElement,.addedElement)  {
			Set done=1 ; end compileRules
		}

	}
	If done {
		$$$BNFMEMOSET(pos,subElement)
	} Else {
	}
	If done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		Set ok=1
	} Else {
		$$$BNFROLLBACK(subElement)
		Set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	Quit ok
}


///  look_ahead_rule ::= KEYWORD | subrule | call
/// summary=C&?4punctuation:4?&?4punctuation:4?
Method LookAheadRule(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	Set done=0 ; method start
	Set pos=..stream.pos
	If $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		Set done=$ISOBJECT(subElement)
	} Else {
		If ..Keyword(subElement,.addedElement)  {
			Set done=1 ; or
		} ElseIf ..Subrule(subElement,.addedElement)  {
			Set done=1 ; or
		} ElseIf ..Call(subElement,.addedElement)  {
			Set done=1 ; end compileRules
		}

	}
	If done {
		$$$BNFMEMOSET(pos,subElement)
	} Else {
	}
	If done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		Set ok=1
	} Else {
		$$$BNFROLLBACK(subElement)
		Set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	Quit ok
}


///  not_rule ::= '!' notable_rule
/// summary=P&C
Method NotRule(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	Set done=0 ; method start
	Set pos=..stream.pos
	If $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		Set done=$ISOBJECT(subElement)
	} Else {
		If ..addPunctuation(subElement,"!")  && ..NotableRule(subElement,.addedElement)  {
			Set done=1 ; end compileRules
		}

	}
	If done {
		$$$BNFMEMOSET(pos,subElement)
	} Else {
	}
	If done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		Set ok=1
	} Else {
		$$$BNFROLLBACK(subElement)
		Set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	Quit ok
}


///  notable_rule ::= KEYWORD | subrule | call
/// summary=C&?4punctuation:4?&?4punctuation:4?
Method NotableRule(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	Set done=0 ; method start
	Set pos=..stream.pos
	If $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		Set done=$ISOBJECT(subElement)
	} Else {
		If ..Keyword(subElement,.addedElement)  {
			Set done=1 ; or
		} ElseIf ..Subrule(subElement,.addedElement)  {
			Set done=1 ; or
		} ElseIf ..Call(subElement,.addedElement)  {
			Set done=1 ; end compileRules
		}

	}
	If done {
		$$$BNFMEMOSET(pos,subElement)
	} Else {
	}
	If done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		Set ok=1
	} Else {
		$$$BNFROLLBACK(subElement)
		Set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	Quit ok
}


///  optional_group ::= '[' rules ']'
/// summary=P&C&P
Method OptionalGroup(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	Set done=0 ; method start
	Set pos=..stream.pos
	If $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		Set done=$ISOBJECT(subElement)
	} Else {
		If ..addPunctuation(subElement,"[")  && ..Rules(subElement,.addedElement)  && ..addPunctuation(subElement,"]")  {
			Set done=1 ; end compileRules
		}

	}
	If done {
		$$$BNFMEMOSET(pos,subElement)
	} Else {
	}
	If done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		Set ok=1
	} Else {
		$$$BNFROLLBACK(subElement)
		Set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	Quit ok
}


///  optional_single ::= optionalable_rule '?'
/// summary=C&P
Method OptionalSingle(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	Set done=0 ; method start
	Set pos=..stream.pos
	If $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		Set done=$ISOBJECT(subElement)
	} Else {
		If ..OptionalableRule(subElement,.addedElement)  && ..addPunctuation(subElement,"?")  {
			Set done=1 ; end compileRules
		}

	}
	If done {
		$$$BNFMEMOSET(pos,subElement)
	} Else {
	}
	If done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		Set ok=1
	} Else {
		$$$BNFROLLBACK(subElement)
		Set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	Quit ok
}


///  optionalable_rule ::= KEYWORD | subrule | call
/// summary=C&?4punctuation:4?&?4punctuation:4?
Method OptionalableRule(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	Set done=0 ; method start
	Set pos=..stream.pos
	If $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		Set done=$ISOBJECT(subElement)
	} Else {
		If ..Keyword(subElement,.addedElement)  {
			Set done=1 ; or
		} ElseIf ..Subrule(subElement,.addedElement)  {
			Set done=1 ; or
		} ElseIf ..Call(subElement,.addedElement)  {
			Set done=1 ; end compileRules
		}

	}
	If done {
		$$$BNFMEMOSET(pos,subElement)
	} Else {
	}
	If done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		Set ok=1
	} Else {
		$$$BNFROLLBACK(subElement)
		Set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	Quit ok
}


///  or ::= '|'
/// summary=P
Method Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	Set done=0 ; method start
	Set pos=..stream.pos
	If $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		Set done=$ISOBJECT(subElement)
	} Else {
		If ..addPunctuation(subElement,"|")  {
			Set done=1 ; end compileRules
		}

	}
	If done {
		$$$BNFMEMOSET(pos,subElement)
	} Else {
	}
	If done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		Set ok=1
	} Else {
		$$$BNFROLLBACK(subElement)
		Set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	Quit ok
}


///  repeat ::= repeat_zero | repeat_one
/// summary=C&?4punctuation:4?
Method Repeat(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	Set done=0 ; method start
	Set pos=..stream.pos
	If $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		Set done=$ISOBJECT(subElement)
	} Else {
		If ..RepeatZero(subElement,.addedElement)  {
			Set done=1 ; or
		} ElseIf ..RepeatOne(subElement,.addedElement)  {
			Set done=1 ; end compileRules
		}

	}
	If done {
		$$$BNFMEMOSET(pos,subElement)
	} Else {
	}
	If done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		Set ok=1
	} Else {
		$$$BNFROLLBACK(subElement)
		Set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	Quit ok
}


///  repeat_one ::= repeatable_rule '+'
/// summary=C&P
Method RepeatOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	Set done=0 ; method start
	Set pos=..stream.pos
	If $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		Set done=$ISOBJECT(subElement)
	} Else {
		If ..RepeatableRule(subElement,.addedElement)  && ..addPunctuation(subElement,"+")  {
			Set done=1 ; end compileRules
		}

	}
	If done {
		$$$BNFMEMOSET(pos,subElement)
	} Else {
	}
	If done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		Set ok=1
	} Else {
		$$$BNFROLLBACK(subElement)
		Set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	Quit ok
}


///  repeat_sep ::= repeat_sep_separator '.' repeat_sep_rule '+'
/// summary=C&P&C&P
Method RepeatSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	Set done=0 ; method start
	Set pos=..stream.pos
	If $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		Set done=$ISOBJECT(subElement)
	} Else {
		If ..RepeatSepSeparator(subElement,.addedElement)  && ..addPunctuation(subElement,".")  && ..RepeatSepRule(subElement,.addedElement)  && ..addPunctuation(subElement,"+")  {
			Set done=1 ; end compileRules
		}

	}
	If done {
		$$$BNFMEMOSET(pos,subElement)
	} Else {
	}
	If done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		Set ok=1
	} Else {
		$$$BNFROLLBACK(subElement)
		Set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	Quit ok
}


///  repeat_sep_rule ::= optional_single | KEYWORD | subrule | call
/// summary=C&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?
Method RepeatSepRule(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	Set done=0 ; method start
	Set pos=..stream.pos
	If $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		Set done=$ISOBJECT(subElement)
	} Else {
		If ..OptionalSingle(subElement,.addedElement)  {
			Set done=1 ; or
		} ElseIf ..Keyword(subElement,.addedElement)  {
			Set done=1 ; or
		} ElseIf ..Subrule(subElement,.addedElement)  {
			Set done=1 ; or
		} ElseIf ..Call(subElement,.addedElement)  {
			Set done=1 ; end compileRules
		}

	}
	If done {
		$$$BNFMEMOSET(pos,subElement)
	} Else {
	}
	If done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		Set ok=1
	} Else {
		$$$BNFROLLBACK(subElement)
		Set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	Quit ok
}


///  repeat_sep_separator ::= KEYWORD | subrule | call
/// summary=C&?4punctuation:4?&?4punctuation:4?
Method RepeatSepSeparator(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	Set done=0 ; method start
	Set pos=..stream.pos
	If $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		Set done=$ISOBJECT(subElement)
	} Else {
		If ..Keyword(subElement,.addedElement)  {
			Set done=1 ; or
		} ElseIf ..Subrule(subElement,.addedElement)  {
			Set done=1 ; or
		} ElseIf ..Call(subElement,.addedElement)  {
			Set done=1 ; end compileRules
		}

	}
	If done {
		$$$BNFMEMOSET(pos,subElement)
	} Else {
	}
	If done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		Set ok=1
	} Else {
		$$$BNFROLLBACK(subElement)
		Set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	Quit ok
}


///  repeat_zero ::= repeatable_rule '*'
/// summary=C&P
Method RepeatZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	Set done=0 ; method start
	Set pos=..stream.pos
	If $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		Set done=$ISOBJECT(subElement)
	} Else {
		If ..RepeatableRule(subElement,.addedElement)  && ..addPunctuation(subElement,"*")  {
			Set done=1 ; end compileRules
		}

	}
	If done {
		$$$BNFMEMOSET(pos,subElement)
	} Else {
	}
	If done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		Set ok=1
	} Else {
		$$$BNFROLLBACK(subElement)
		Set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	Quit ok
}


///  repeatable_rule ::= KEYWORD | subrule | call
/// summary=C&?4punctuation:4?&?4punctuation:4?
Method RepeatableRule(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	Set done=0 ; method start
	Set pos=..stream.pos
	If $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		Set done=$ISOBJECT(subElement)
	} Else {
		If ..Keyword(subElement,.addedElement)  {
			Set done=1 ; or
		} ElseIf ..Subrule(subElement,.addedElement)  {
			Set done=1 ; or
		} ElseIf ..Call(subElement,.addedElement)  {
			Set done=1 ; end compileRules
		}

	}
	If done {
		$$$BNFMEMOSET(pos,subElement)
	} Else {
	}
	If done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		Set ok=1
	} Else {
		$$$BNFROLLBACK(subElement)
		Set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	Quit ok
}


///  rule ::= repeat_sep | repeat_zero | repeat_one | optional_single | KEYWORD | or | subrule | optional_group | call | look_ahead | not_rule
/// summary=C&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?&?4punctuation:4?
Method Rule(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	Set done=0 ; method start
	Set pos=..stream.pos
	If $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		Set done=$ISOBJECT(subElement)
	} Else {
		If ..RepeatSep(subElement,.addedElement)  {
			Set done=1 ; or
		} ElseIf ..RepeatZero(subElement,.addedElement)  {
			Set done=1 ; or
		} ElseIf ..RepeatOne(subElement,.addedElement)  {
			Set done=1 ; or
		} ElseIf ..OptionalSingle(subElement,.addedElement)  {
			Set done=1 ; or
		} ElseIf ..Keyword(subElement,.addedElement)  {
			Set done=1 ; or
		} ElseIf ..Or(subElement,.addedElement)  {
			Set done=1 ; or
		} ElseIf ..Subrule(subElement,.addedElement)  {
			Set done=1 ; or
		} ElseIf ..OptionalGroup(subElement,.addedElement)  {
			Set done=1 ; or
		} ElseIf ..Call(subElement,.addedElement)  {
			Set done=1 ; or
		} ElseIf ..LookAhead(subElement,.addedElement)  {
			Set done=1 ; or
		} ElseIf ..NotRule(subElement,.addedElement)  {
			Set done=1 ; end compileRules
		}

	}
	If done {
		$$$BNFMEMOSET(pos,subElement)
	} Else {
	}
	If done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		Set ok=1
	} Else {
		$$$BNFROLLBACK(subElement)
		Set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	Quit ok
}


///  rules ::= rule*
/// summary=(C)*
Method Rules(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	Set done=0 ; method start
	Set pos=..stream.pos
	If $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		Set done=$ISOBJECT(subElement)
	} Else {
		If ..Rules1RepZero(subElement,.addedElement)  {
			Set done=1 ; end compileRules
		}

	}
	If done {
		$$$BNFMEMOSET(pos,subElement)
	} Else {
	}
	If done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		Set ok=1
	} Else {
		$$$BNFROLLBACK(subElement)
		Set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	Quit ok
}


///  rule*
Method Rules1RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean [ Final, Private ]
{
	Set subElement=ParentElement
	; method start
	While ..Rule(subElement,.addedElement)  {
		;
	}
	Set ok=1
	Quit ok
}


///  subrule ::= '(' rules ')'
/// summary=P&C&P
Method Subrule(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	Set done=0 ; method start
	Set pos=..stream.pos
	If $$$BNFMEMOExists(pos) {
		$$$BNFMEMOGET(pos,subElement)
		Set done=$ISOBJECT(subElement)
	} Else {
		If ..addPunctuation(subElement,"(")  && ..Rules(subElement,.addedElement)  && ..addPunctuation(subElement,")")  {
			Set done=1 ; end compileRules
		}

	}
	If done {
		$$$BNFMEMOSET(pos,subElement)
	} Else {
	}
	If done {
		$$$BNFCOMMIT(subElement,ParentElement) ; 6
		Set ok=1
	} Else {
		$$$BNFROLLBACK(subElement)
		Set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	Quit ok
}


Method newElement(Type As %String) As PXW.DEV.BNF.Element
{
	Quit ##class(PXW.DEV.BNF.Element).%New(Type)
}

}
