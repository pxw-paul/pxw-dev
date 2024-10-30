/// This class was created by Generating PXW.DEV.BNF.GEN.BNF1 and then copying the code into here.
/// The idea is that this code is never generated directly by compiling something and therefore
/// potentially breaking the bnf compiler beyond compare.
/// 
/// There ARE some tweaks in here so do NOT replace methods from newly generated versions without 
/// thinking carefully.
/// 
/// Using this method of working the compiler should remain safe - hence the name.
/// 
/// Maybe we can go further and remove references to macros.
Class PXW.DEV.BNF.Compilers.BNF1safe Extends PXW.DEV.BNF.super
{

/* TWEAKED METHODS */
/// Set to CDEF, COS
Property commentMode As %String [ InitialExpression = "BNF" ];

/// Its a call to something else if we are at the START of the line
Method Call(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
    $$$DEBUGMethodBegin
    Do:..needsWScheck ..skipWhiteSpaceAndComments()
    
    ; labels only defined in first column (0)
    $$$DEBUG("Call col="_..stream.col)

    ; at the start so NOT a call to something else, this is probably a definition
	If ..stream.col=0 Quit 0

	$$$BNFPATH
	$$$BNFSTART(subElement)
	Set done=0 ; method start
	If ..Identifier(subElement,.addedElement)  {
		Set done=1 ; end compileRules
	}
	If done {
		$$$BNFCOMMIT(subElement,ParentElement)
		Set ok=1
	} Else {
		$$$BNFROLLBACK(subElement)
		Set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	Quit ok
}

Method Keyword(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
    #dim o as PXW.DEV.Atom

    $$$DEBUGMethodBegin
    Do:..needsWScheck ..skipWhiteSpaceAndComments()
   
	;$$$BNFPATH
	;;$$$DEBUG("%path="_%path)
    Set ok=1
    Set openquote=..peek(1)
    If openquote'="""",openquote'="'" {
        Set ok=0
    }

    If ok {
        $$$BNFSTART(subElement)

        Set start=..next()
        Set n=""
        Set instring=1
        While '..eof() && instring {
            Set chs=..peek(2)
            Set ch=$EXTRACT(chs,1),ch2=$EXTRACT(chs,2)
            ; embedded quotes or end of string?
            ; I am not sure how these get encoded so sticking with COS "" for quotes in quotes
            If ch=openquote {
                If ch2=openquote {
                    Set n=n_..next()_..next()
                } Else {
                    Set instring=0
                    Set end=..next()
                }
            } Else {
                Set n=n_..next()
            }
        }
        Set o=..newAtom("String",n)
        Set o.start=start,o.end=end
        Do subElement.AddPart(o)
        $$$BNFCOMMIT(subElement,ParentElement)
    }
    $$$DEBUGMethodEnd
    Quit ok
}

Method Identifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
    Do:..needsWScheck ..skipWhiteSpaceAndComments()

    Set value=""
    Set ch=..peek(1)
    ; must start with a letter
    If value="",ch?1A Set value=..next()
    
    If value="" {
        $$$DEBUG("checking identifier, ok=0")
        Quit 0
    }
    Set ch=..peek(1)
    While (ch?1A) || (ch?1N) || (ch="_") || (ch="-")  {
        Set value=value_..next()
		;zw value,..stream.pos
        Set ch=..peek(1)
    }
    
    Set atom=..newAtom(ParentElement.type,value)
    Do ParentElement.AddPart(atom)

    Quit 1
}

/// EQUALS ::= 'NEEDS EQUALS'
///  summary=S
///  type=group
///  not=0
Method Equals(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
	If ..isStringSingle("::=",.value)=0 Quit 0 ; q1 
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	Set done=0 ; t1 
	; type=group, check=if, skip=1, skipall=1
	Set getVal=..nextNotEOL($LENGTH(value)),atom=..newAtom(..#keywordAtomType,getVal) ; k1 
	Do subElement.AddPart(atom) ; t3 
	If 1	 {
		Set done=1 ; u1 

	}
	If done {
		$$$BNFCOMMIT(subElement,ParentElement)
		Set ok=1
	} Else {
		$$$BNFROLLBACK(subElement)
		Set ok=0
	}
	$$$DEBUGMethodEnd
	Quit ok
}

/// definition ::= IDENTIFIER EQUALS rules
///  summary=F&F&F
///  type=group
///  not=0
Method Definition(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
	; rules summary C&C&C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	Set done=0 ; method start
	If ..Identifier(subElement,.addedElement)  {
		If ..Equals(subElement,.addedElement)  {
			If ..Rules(subElement,.addedElement)  {
				Set done=1 ; end compileRules
			}
		}
	}
	If done {
		$$$BNFCOMMIT(subElement,ParentElement)
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

/* 
    
    DIRECTLY COPIED METHODS 

*/
///  file ::= definition*
Method File(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (?4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	Set done=0 ; method start
	If ..File1RepZero(subElement,.addedElement)  {
		Set done=1 ; end compileRules
	}
	If done {
		$$$BNFCOMMIT(subElement,ParentElement)
		Set ok=1
	} Else {
		$$$BNFROLLBACK(subElement)
		Set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	Quit ok
}

///  definition*
Method File1RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	Set subElement=ParentElement
	Set done=0 ; method start
	While ..Definition(subElement,.addedElement)  {
		Set done=1
	}
	If done {
		Set ok=1
	} Else {
		Set ok=1 /* nothing found is ok in RZ */
	}
	Quit ok
}

///  look_ahead ::= '&' look_ahead_rule
/// summary values:&
Method LookAhead(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C
	; first rule summary P
	If '(..isStringSingle("&",.value)) { Quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	Set done=0 ; method start
	If ..addPunctuation(subElement,"&")  {
		If ..LookAheadRule(subElement,.addedElement)  {
			Set done=1 ; end compileRules
		}
	}
	If done {
		$$$BNFCOMMIT(subElement,ParentElement)
		Set ok=1
	} Else {
		$$$BNFROLLBACK(subElement)
		Set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	Quit ok
}

///  look_ahead_rule ::= KEYWORD | subrule | call
Method LookAheadRule(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	Set done=0 ; method start
	If ..Keyword(subElement,.addedElement)  {
		Set done=1 ; or
	} ElseIf ..Subrule(subElement,.addedElement)  {
		Set done=1 ; or
	} ElseIf ..Call(subElement,.addedElement)  {
		Set done=1 ; end compileRules
	}
	If done {
		$$$BNFCOMMIT(subElement,ParentElement)
		Set ok=1
	} Else {
		$$$BNFROLLBACK(subElement)
		Set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	Quit ok
}

///  not_rule ::= '!' notable_rule
/// summary values:!
Method NotRule(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C
	; first rule summary P
	If '(..isStringSingle("!",.value)) { Quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	Set done=0 ; method start
	If ..addPunctuation(subElement,"!")  {
		If ..NotableRule(subElement,.addedElement)  {
			Set done=1 ; end compileRules
		}
	}
	If done {
		$$$BNFCOMMIT(subElement,ParentElement)
		Set ok=1
	} Else {
		$$$BNFROLLBACK(subElement)
		Set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	Quit ok
}

///  notable_rule ::= KEYWORD | subrule | call
Method NotableRule(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	Set done=0 ; method start
	If ..Keyword(subElement,.addedElement)  {
		Set done=1 ; or
	} ElseIf ..Subrule(subElement,.addedElement)  {
		Set done=1 ; or
	} ElseIf ..Call(subElement,.addedElement)  {
		Set done=1 ; end compileRules
	}
	If done {
		$$$BNFCOMMIT(subElement,ParentElement)
		Set ok=1
	} Else {
		$$$BNFROLLBACK(subElement)
		Set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	Quit ok
}

///  optional_group ::= '[' rules ']'
/// summary values:[
Method OptionalGroup(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&P
	; first rule summary P
	If '(..isStringSingle("[",.value)) { Quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	Set done=0 ; method start
	If ..addPunctuation(subElement,"[")  {
		If ..Rules(subElement,.addedElement)  {
			If ..addPunctuation(subElement,"]")  {
				Set done=1 ; end compileRules
			}
		}
	}
	If done {
		$$$BNFCOMMIT(subElement,ParentElement)
		Set ok=1
	} Else {
		$$$BNFROLLBACK(subElement)
		Set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	Quit ok
}

///  optional_single ::= optionalable_rule '?'
Method OptionalSingle(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&P
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	Set done=0 ; method start
	If ..OptionalableRule(subElement,.addedElement)  {
		If ..addPunctuation(subElement,"?")  {
			Set done=1 ; end compileRules
		}
	}
	If done {
		$$$BNFCOMMIT(subElement,ParentElement)
		Set ok=1
	} Else {
		$$$BNFROLLBACK(subElement)
		Set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	Quit ok
}

///  optionalable_rule ::= KEYWORD | subrule | call
Method OptionalableRule(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	Set done=0 ; method start
	If ..Keyword(subElement,.addedElement)  {
		Set done=1 ; or
	} ElseIf ..Subrule(subElement,.addedElement)  {
		Set done=1 ; or
	} ElseIf ..Call(subElement,.addedElement)  {
		Set done=1 ; end compileRules
	}
	If done {
		$$$BNFCOMMIT(subElement,ParentElement)
		Set ok=1
	} Else {
		$$$BNFROLLBACK(subElement)
		Set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	Quit ok
}

///  or ::= '|'
/// summary values:|
Method Or(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	If '(..isStringSingle("|",.value)) { Quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	Set done=0 ; method start
	If ..addPunctuation(subElement,"|")  {
		Set done=1 ; end compileRules
	}
	If done {
		$$$BNFCOMMIT(subElement,ParentElement)
		Set ok=1
	} Else {
		$$$BNFROLLBACK(subElement)
		Set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	Quit ok
}

///  repeat ::= repeat_zero | repeat_one
Method Repeat(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	Set done=0 ; method start
	If ..RepeatZero(subElement,.addedElement)  {
		Set done=1 ; or
	} ElseIf ..RepeatOne(subElement,.addedElement)  {
		Set done=1 ; end compileRules
	}
	If done {
		$$$BNFCOMMIT(subElement,ParentElement)
		Set ok=1
	} Else {
		$$$BNFROLLBACK(subElement)
		Set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	Quit ok
}

///  repeat_one ::= repeatable_rule '+'
Method RepeatOne(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&P
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	Set done=0 ; method start
	If ..RepeatableRule(subElement,.addedElement)  {
		If ..addPunctuation(subElement,"+")  {
			Set done=1 ; end compileRules
		}
	}
	If done {
		$$$BNFCOMMIT(subElement,ParentElement)
		Set ok=1
	} Else {
		$$$BNFROLLBACK(subElement)
		Set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	Quit ok
}

///  repeat_sep ::= repeat_sep_separator '.' repeat_sep_rule '+'
Method RepeatSep(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&P&C&P
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	Set done=0 ; method start
	If ..RepeatSepSeparator(subElement,.addedElement)  {
		If ..addPunctuation(subElement,".")  {
			If ..RepeatSepRule(subElement,.addedElement)  {
				If ..addPunctuation(subElement,"+")  {
					Set done=1 ; end compileRules
				}
			}
		}
	}
	If done {
		$$$BNFCOMMIT(subElement,ParentElement)
		Set ok=1
	} Else {
		$$$BNFROLLBACK(subElement)
		Set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	Quit ok
}

///  repeat_sep_rule ::= KEYWORD | subrule | call
Method RepeatSepRule(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	Set done=0 ; method start
	If ..Keyword(subElement,.addedElement)  {
		Set done=1 ; or
	} ElseIf ..Subrule(subElement,.addedElement)  {
		Set done=1 ; or
	} ElseIf ..Call(subElement,.addedElement)  {
		Set done=1 ; end compileRules
	}
	If done {
		$$$BNFCOMMIT(subElement,ParentElement)
		Set ok=1
	} Else {
		$$$BNFROLLBACK(subElement)
		Set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	Quit ok
}

///  repeat_sep_separator ::= KEYWORD | subrule | call
Method RepeatSepSeparator(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	Set done=0 ; method start
	If ..Keyword(subElement,.addedElement)  {
		Set done=1 ; or
	} ElseIf ..Subrule(subElement,.addedElement)  {
		Set done=1 ; or
	} ElseIf ..Call(subElement,.addedElement)  {
		Set done=1 ; end compileRules
	}
	If done {
		$$$BNFCOMMIT(subElement,ParentElement)
		Set ok=1
	} Else {
		$$$BNFROLLBACK(subElement)
		Set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	Quit ok
}

///  repeat_zero ::= repeatable_rule '*'
Method RepeatZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C&P
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	Set done=0 ; method start
	If ..RepeatableRule(subElement,.addedElement)  {
		If ..addPunctuation(subElement,"*")  {
			Set done=1 ; end compileRules
		}
	}
	If done {
		$$$BNFCOMMIT(subElement,ParentElement)
		Set ok=1
	} Else {
		$$$BNFROLLBACK(subElement)
		Set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	Quit ok
}

///  repeatable_rule ::= KEYWORD | subrule | call
Method RepeatableRule(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	Set done=0 ; method start
	If ..Keyword(subElement,.addedElement)  {
		Set done=1 ; or
	} ElseIf ..Subrule(subElement,.addedElement)  {
		Set done=1 ; or
	} ElseIf ..Call(subElement,.addedElement)  {
		Set done=1 ; end compileRules
	}
	If done {
		$$$BNFCOMMIT(subElement,ParentElement)
		Set ok=1
	} Else {
		$$$BNFROLLBACK(subElement)
		Set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	Quit ok
}

///  rule ::= repeat_sep | repeat_zero | repeat_one | optional_single | KEYWORD | or | subrule | optional_group | call | look_ahead | not_rule
Method Rule(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary C|C|C|C|C|C|C|C|C|C|C
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	Set done=0 ; method start
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
	If done {
		$$$BNFCOMMIT(subElement,ParentElement)
		Set ok=1
	} Else {
		$$$BNFROLLBACK(subElement)
		Set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	Quit ok
}

///  rules ::= rule*
Method Rules(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary (?4?)*
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	Set done=0 ; method start
	If ..Rules2RepZero(subElement,.addedElement)  {
		Set done=1 ; end compileRules
	}
	If done {
		$$$BNFCOMMIT(subElement,ParentElement)
		Set ok=1
	} Else {
		$$$BNFROLLBACK(subElement)
		Set ok=0 ; normal rollback
	}
	$$$DEBUGMethodEnd
	Quit ok
}

///  rule*
Method Rules2RepZero(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?4?
	Set subElement=ParentElement
	Set done=0 ; method start
	While ..Rule(subElement,.addedElement)  {
		Set done=1
	}
	If done {
		Set ok=1
	} Else {
		Set ok=1 /* nothing found is ok in RZ */
	}
	Quit ok
}

///  subrule ::= '(' rules ')'
/// summary values:(
Method Subrule(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P&C&P
	; first rule summary P
	If '(..isStringSingle("(",.value)) { Quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	Set done=0 ; method start
	If ..addPunctuation(subElement,"(")  {
		If ..Rules(subElement,.addedElement)  {
			If ..addPunctuation(subElement,")")  {
				Set done=1 ; end compileRules
			}
		}
	}
	If done {
		$$$BNFCOMMIT(subElement,ParentElement)
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
