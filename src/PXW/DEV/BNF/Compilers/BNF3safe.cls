/// This class was created by Generating PXW.DEV.BNF.GEN.BNF2 and then copying the code into here.
/// The idea is that this code is never generated directly by compiling something and therefore
/// potentially breaking the bnf compiler beyond compare.
/// 
/// There ARE some tweaks in here so do NOT replace methods from newly generated versions without 
/// thinking carefully.
/// 
/// Using this method of working the compiler should remain safe - hence the name.
/// 
/// Maybe we can go further and remove references to macros.
Class PXW.DEV.BNF.Compilers.BNF3safe Extends PXW.DEV.BNF.GEN.BNF3
{

// Set to CDEF, COS

Property commentMode As %String [ InitialExpression = "BNF" ];

Property EqualsChars As %String [ InitialExpression = "::=" ];

/* TWEAKED METHODS */
/// Its a call to something else if we are at the START of the line
Method Call(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
   $$$DEBUGMethodBegin
	;set currentpath=$g(%path) new %path set %path=currentpath_$c(47)_"LabelDefinition"
    ;;$$$DEBUG("%path="_%path)
    ;d ..skipWhiteSpaceAndComments()
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
		Set ret=1
	} Else {
		$$$BNFROLLBACK(subElement)
		Set ret=0 ; normal rollback
	}
 
    $$$DEBUGMethodEnd
    Quit ret
}

Method Keyword(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
    #dim o as PXW.DEV.Atom

    $$$DEBUGMethodBegin
    Do:..needsWScheck ..skipWhiteSpaceAndComments()

	; everything is a keyword unless its < { [ ... 
	s p2=..peek(2),ch1=$e(p2,1),ch2=$e(p2,2),cr=..stream.eolChar
	i ..eof() q 0
	i ch1=..stream.eolChar q 0
	i ch1="<" q 0
	i ch1=">" q 0
	i ch1="{" q 0
	i ch1="}" q 0
	i ch1="[" q 0
	i ch1="]" q 0
	i ch1="|" q 0
	i ch1="." q 0

	;$$$BNFPATH
	;;$$$DEBUG("%path="_%path)
    Set ok=1

    If ok {
        $$$BNFSTART(subElement)

        Set n=""
        While ('..eof()) && (..peek(1)'=..stream.eolChar) &&(..peek(1)'=" ") {
            Set n=n_..next()
        }
        Set o=..newAtom("String",n)
        Do subElement.AddPart(o)
        $$$BNFCOMMIT(subElement,ParentElement)
    }
    $$$DEBUGMethodEnd
    Quit ok
}

Method SingleChar(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
    #dim o as PXW.DEV.Atom

    $$$DEBUGMethodBegin
    Do:..needsWScheck ..skipWhiteSpaceAndComments()
	s ok=0
	s peek=..stream.PeekToEol()
	s peek=$ZSTRIP(peek,">W")
	i $l(peek)=1 s ok=1
	i peek?1.P s ok=1

    If ok {
		$$$BNFSTART(subElement)
		;set subElement=..newElement("Keyword") d ..getBookmark(.subElementBM)
		set n=""
        Set n=n_..next($l(peek))
        Set o=..newAtom("String",n)
        Do subElement.AddPart(o)
        $$$BNFCOMMIT(subElement,ParentElement)
    }
    $$$DEBUGMethodEnd
    Quit ok
}

Method Identifier(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Library.Boolean
{
    Do:..needsWScheck ..skipWhiteSpaceAndComments()

    Set value="",v=""
    Set ch=..peek(1)
    ; must start with a <
    If ch="<" Set v=..next() ; skip it
    
    If v="" {
        $$$DEBUG("checking identifier, ok=0")
        Quit 0
    }
    Set ch=..peek(1)
    ;While (ch?1A) || (ch?1N) || (ch="_") || (ch="-")  {
	while ch'=">" {
        Set value=value_..next()
		;zw value,..stream.pos
        Set ch=..peek(1)
    }
	if ch=">" set v=..next()
    
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
	If ..isStringSingle(..EqualsChars,.value)=0 Quit 0 ; q1 
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	Set done=0 ; t1 
	Set ownerElement=subElement
	; type=group, check=if, skip=1, skipall=1
	Set getVal=..nextNotEOL($LENGTH(value)),atom=..newAtom(..#keywordAtomType,getVal) ; k1 
	Do subElement.AddPart(atom) ; t3 
	If 1	 {
		Set done=1 ; u1 

	}
	If done {
		$$$BNFCOMMIT(subElement,ParentElement)
		Set ret=1
	} Else {
		$$$BNFROLLBACK(subElement)
		Set ret=0
	}
	$$$DEBUGMethodEnd
	Quit ret
}

///  definition ::= IDENTIFIER EQUALS (SINGLE_CHAR | rules)
Method Definition(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?&?1Rule?&?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFPATH
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..Identifier(subElement,.addedElement)  {
		if ..Equals(subElement,.addedElement)  {
			if ..Definition2Sub(subElement,.addedElement)  {
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
    ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;   
    If ret=0 {
        Set ret=..recover(ParentElement,.recSub,"",$LISTBUILD($CHAR(13)))
    }
	$$$DEBUGMethodEnd
	quit ret
}

/// SINGLE_CHAR | omitted | rules
Method Definition2Sub(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary ?1Rule?|?1Rule?
	$$$DEBUGMethodBegin
	$$$BNFSTART(subElement)
	set done=0 ; method start
	if ..SingleChar(subElement,.addedElement)  {
		set done=1 ; or
	} elseif ..Omitted(subElement,.addedElement) {
		set done=1
	} elseif ..Rules(subElement,.addedElement)  {
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

///  NEEDS_OVERRIDE ::= '!!'
/// summary values:!!
Method NeedsOverride(ParentElement As PXW.DEV.BNF.Element, ByRef subElement As PXW.DEV.BNF.Element) As %Boolean
{
	; rules summary P
	if '(..isStringSingle("!!",.value)) { quit 0 /* normal */ }
	$$$DEBUGMethodBegin
	$$$BNFPATH
	;$$$BNFSTART(subElement)
	set subElement=..newElement("Keyword") d ..getBookmark(.subElementBM)

	set done=0 ; method start
	if ..addPunctuation(subElement,"!!")  {
		set toEol=..stream.NextToEol()
		set atom=..newAtom("String",toEol)
		do subElement.AddPart(atom)
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
Method newElement(Type As %String) As PXW.DEV.BNF.Element
{
	Quit ##class(PXW.DEV.BNF.Element).%New(Type)
}

}
