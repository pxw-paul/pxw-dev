Include PXW.Debuggers.Macros

Class PXW.Tools.DEV.HTML.output Extends %RegisteredObject
{

/// Set this to a style class name
Parameter CommentClass;

/// Set this to a style class name
Parameter WarningClass;

/// Name of the main thing being written
Property This As %String;

/// Name of the sub thing being written
Property ThisMethod As %String;

Property Analyser As PXW.DEV.BNF.Compilers.analyser;

Property WriteMode As %Boolean [ InitialExpression = 1 ];

/// Does this need things like the PRE tags?
Property Embedded As %Boolean [ InitialExpression = 0 ];

Property htmlout As %String;

/// If the atom is on this line (number) then we should highlight it
Property HiLiteLine As %Integer;

/// Set this to the name of something to bookmark (highlight and anchor)
Property BookMark As %String;

/// complicated structure, best to use wrapAtomHTML method to update
Property pre As %String [ MultiDimensional ];

/// complicated structure, best to use wrapAtomHTML method to update
Property post As %String [ MultiDimensional ];

/// complicated structure, best to use wrapInnerAtomHTML method to update
Property preI As %String [ MultiDimensional ];

/// complicated structure, best to use wrapInnerAtomHTML method to update
Property postI As %String [ MultiDimensional ];

Method wrapInnerAtomHTML(atom As PXW.DEV.Atom, pre As %String, post As %String)
{
    Set n=$GET(..preI(+atom)),n=n+1,..preI(+atom,n)=pre,..preI(+atom)=n
    Set n=$GET(..postI(+atom)),n=n+1,..postI(+atom,n)=post,..postI(+atom)=n
}

Method wrapAtomHTML(atom As PXW.DEV.Atom, pre As %String, post As %String)
{
    Set n=$GET(..pre(+atom)),n=n+1,..pre(+atom,n)=pre,..pre(+atom)=n
    Set n=$GET(..post(+atom)),n=n+1,..post(+atom,n)=post,..post(+atom)=n
}

Method wrapElementHTML(element As PXW.DEV.Element, pre As %String, post As %String)
{
	; on elements don't wrap the whitespace
	Set n=$GET(..pre(+element)),n=n+1,..pre(+element,n)=pre,..pre(+element)=n
    ;set atom=element.FirstAtom()
	Set n=$GET(..post(+element)),n=n+1,..post(+element,n)=post,..post(+element)=n
}

/// Output the html directly to destination. No escaping or other formatting is done.
Method output(html As %String)
{
	If ..WriteMode {
		Write html
		;s ^PXW("out",$i(^PXW))=html
	} Else {
		Set ..htmlout=..htmlout_html	
	}
}

Method resetWrappers()
{
	Kill ..pre,..post,..preI,..postI
}

Method html(string As %String) As %String
{
	Quit $ZCONVERT(string,"O","HTML")
}

Method writeElement(element As PXW.DEV.Element)
{
	Set n=+$GET(..pre(+element))
    For i=1:1:n Do ..output($GET(..pre(+element,i)))
	For  {
		Set a=element.partsGetNext(.akey)
		Quit:akey=""
		
		If a.%IsA("PXW.DEV.Element") {
			Do ..writeElement(a)
		} Else {
			Do ..writeAtom(a)
		}
	}
    Set n=+$GET(..post(+element))
    For i=n:-1:1 Do ..output($GET(..post(+element,i)))
}

/// the only method that should actually do any output during the middle processing
Method writeAtom(atom As PXW.DEV.Atom, preValue As %String = "", postValue As %String = "", isWhitespace As %Boolean = 0)
{
	If $ISOBJECT(atom.whitespace) {
		Do ..writeAtom(atom.whitespace,"<span class=whitespace>","</span>",1)
	}
	If $ISOBJECT(atom.comment) {
		Do ..writeAtom(atom.comment,"<span class='"_..#CommentClass_"'>","</span>")
	}

	; add hilite on whitespace (OR ANYTHING) that is NOT going over more than 1 line
	If ..HiLiteLine'="",atom.line=..HiLiteLine,atom.value'[$CHAR(13) {
		Set preValue="<span class='hilite'>"_preValue
		Set postValue=postValue_"</span>"
	}
	
	If $ISOBJECT(..Analyser),$DATA(..Analyser.ElementWarnings(+atom)) {
		Set line=..Analyser.ElementWarnings(+atom)
		Set preValue="<span class='"_..#WarningClass_"' title='"_$ZCONVERT(line,"O","HTML")_"'>"_preValue
		Set postValue=postValue_"</span>"
	}

    Set n=+$GET(..pre(+atom))
    For i=1:1:n Do ..output($GET(..pre(+atom,i)))
    Do ..output(preValue_..html(atom.start))
	    Set n=+$GET(..preI(+atom))
	    For i=1:1:n Do ..output($GET(..preI(+atom,i)))
	    Do ..output(..html(atom.value))
	    Set n=+$GET(..postI(+atom))
	    For i=n:-1:1 Do ..output($GET(..postI(+atom,i)))
	Do ..output(..html(atom.end)_postValue)
    Set n=+$GET(..post(+atom))
    For i=n:-1:1 Do ..output($GET(..post(+atom,i)))
}

}
