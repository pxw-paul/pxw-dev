Include (PXW.Debuggers.Macros, PXW.Tools.Styles.macros)

Class PXW.Tools.DEV.HTML.output Extends PXW.DEV.BNF.processor
{

/// Name of the main thing being written
Property This As %String;

/// Name of the sub thing being written
Property ThisMethod As %String;

Property WriteMode As %Boolean [ InitialExpression = 1 ];

/*/// Does this need things like the PRE tags?
Property Embedded As %Boolean [ InitialExpression = 0 ];
*/
Property htmlout As %String;

/// If the atom is on this line (number) then we should highlight it
Property HiLiteLine As %Integer;

/// Set this to the name of something to bookmark (highlight and anchor)
/// If the bookmark is +nnn then the bookmark is put on that line number.
Property BookMark As %String;

/// complicated structure, best to use wrapAtomHTML method to update
Property pre As %String [ MultiDimensional ];

/// complicated structure, best to use wrapAtomHTML method to update
Property post As %String [ MultiDimensional ];

/// complicated structure, best to use wrapInnerAtomHTML method to update
Property preI As %String [ MultiDimensional ];

/// complicated structure, best to use wrapInnerAtomHTML method to update
Property postI As %String [ MultiDimensional ];

/// Array of the items to add to an index, use the AddToIndex and NextIndexItems to access
/// 
Property Index As %String [ MultiDimensional, Private ];

Property IndexError As %String [ MultiDimensional, Private ];

/// Set this to put the paths in the tooltip (useful for debugging)
Property showPaths As %Boolean [ InitialExpression = 0 ];

Method AddToIndex(Name As %String, Type As %String, Anchor As %String) As %Status
{
    Set data=$LISTBUILD(Name,Type,Anchor)
    Set ..Index("Name",$$$UPPER(Name)_"||"_Type)=data
    Set ..Index("Type",Type_"||"_$$$UPPER(Name))=data
    Set ..Index("Seq",$INCREMENT(..Index("Seq")))=data
    Quit $$$OK
}

Method AddToIndexError(Name As %String, Error As %String) As %Status
{
    If Name'="" {
        Set data=$LISTBUILD(Error)
        Set ..IndexError("Name",Name)=data
    }
    Quit $$$OK
}

/// Call in a loop using byref parameters to get the index out
/// while x.NextIndexItem(.name,.type) {
/// 
/// }
Method NextIndexItemByName(ByRef Name As %String = "", ByRef Type As %String = "", ByRef Anchor As %String = "", ByRef Error As %String = "") As %Boolean
{
    Set key=$GET(..Index("NameKey"))
    Set key=$ORDER(..Index("Name",key),1,data)
    If key'="" {
        Set Name=$LISTGET(data,1),Type=$LISTGET(data,2),Anchor=$LISTGET(data,3)
        Set Error=$GET(..IndexError("Name",Name))
    }
    Set ..Index("NameKey")=key
    Quit (key'="")
}

Method wrapInnerAtomHTML(atom As PXW.DEV.Atom, pre As %String, post As %String)
{
	Set a=+atom
	Set ..pre(a)=$GET(..pre(a))_pre
	Set ..post(a)=post_$GET(..post(a))
}

Method wrapAtomHTML(atom As PXW.DEV.Atom, pre As %String, post As %String)
{
	Set a=+atom
	Set ..pre(a)=$GET(..pre(a))_pre
	Set ..post(a)=post_$GET(..post(a))

}

/// eg an atom=2@PXW.DEV.Atom
/// orefNumber is just the 2
Method wrapObjectRefHTML(orefNumber As %Integer, pre As %String, post As %String)
{
	Set a=orefNumber
	Set ..pre(a)=$GET(..pre(a))_pre
	Set ..post(a)=post_$GET(..post(a))

}

Method wrapElementHTML(element As PXW.DEV.Element, pre As %String, post As %String)
{
	Set a=+element
	Set ..pre(a)=$GET(..pre(a))_pre
	Set ..post(a)=post_$GET(..post(a))

}

/// Output the html directly to destination. No escaping or other formatting is done.
Method output(html As %String)
{
	;$$$DEBUGMethodBegin
	;If ..WriteMode {
		Write html
		;s %outputhtml=$g(%outputhtml)_html
		;i $l(%outputhtml)>100000 w %outputhtml s %outputhtml=""
		;s ^PXW("out",$i(^PXW))=html
	;} Else {
	;	Set ..htmlout=..htmlout_html	
	;}
	;$$$DEBUGMethodEnd
}

Method resetWrappers()
{
	Kill ..pre,..post,..preI,..postI
}

Method writeElement(element As PXW.DEV.Element)
{
	$$$DEBUGMethodBegin
    Do ..processSpecificElement(.element)
	
	;For i=1:1:+$GET(..pre(+element)) Do ..output($GET(..pre(+element,i)))
	Set e=+element
	;If $DATA(..pre(e),n) {
	;	Set out=""
	;	For i=1:1:n Set out=out_..pre(e,i)
	;	Do ..output(.out)
	;}
	If $DATA(..pre(e),out) {
		Do ..output(out)
	}

	Set akey=""
	For {
		; nexting through because the element count may change if the outputter wants to add/remove elements as we go
		Set a=element.partsGetNext(.akey)
		Quit:akey=""
		
		If a.IsElement {
			Do ..writeElement(.a)
		} Else {
			Do ..writeAtom(.a)
		}
	}
	
	;For i=+$GET(..post(+element)):-1:1 Do ..output($GET(..post(+element,i)))
	;If $DATA(..post(e)) {
	;	Set out=""
	;	For i=n:-1:1 Set out=out_..post(e,i)
	;	Do ..output(.out)
	;}
	If $DATA(..post(e),out) {
		Do ..output(out)
	}
	
	$$$DEBUGMethodEnd
}

/// the only method that should actually do any output during the middle processing
Method writeAtom(atom As PXW.DEV.Atom, preValue As %String = "", postValue As %String = "")
{
	$$$DEBUGMethodBegin
	If $ISOBJECT(atom.whitespace) {
		Do ..writeAtom(atom.whitespace,"<span class=whitespace>","</span>")
	}
	If $ISOBJECT(atom.comment) {
		Do ..writeAtom(atom.comment,"<span class='"_$$$classComment_"'>","</span>")
	}

	; add hilite on whitespace (OR ANYTHING) that is NOT going over more than 1 line
	If ..HiLiteLine'="",atom.line=..HiLiteLine,atom.value'[$CHAR(13) {
		If ..BookMark?1"+"1.N {
			Set ..BookMark=""
			Set preValue="<a id=Bookmark></a><span class='hilite'>"_preValue
			Set postValue=postValue_"</span>"
		} Else {
			Set preValue="<span class='hilite'>"_preValue
			Set postValue=postValue_"</span>"
		}
	}

    ; some very basic atoms we can deal with in a common way across all languages
 	Set type=$PIECE(atom.type,":",1)
	If type="Keyword" {
		Do ..wrapAtomHTML(.atom,"<span class="""_$$$classKeyword_""">","</span>")
	} ElseIf type="CDEFKeyword" {
		Do ..wrapAtomHTML(.atom,"<span class="""_$$$classProgramKeyword_""">","</span>")
	} ElseIf type="String" {
		Do ..wrapInnerAtomHTML(.atom,"<span class="""_$$$classString_""">","</span>")
	} ElseIf type="Number" {
		Do ..wrapAtomHTML(.atom,"<span class="""_$$$classNumber_""">","</span>")
	} ElseIf type="ERROR" {
		Do ..wrapAtomHTML(.atom,"<span class="""_$$$classError_""">","</span>")
		Do ..AddToIndexError(..ThisMethod,atom.value)
	}
	Do:..showPaths ..wrapAtomHTML(atom,"<span title="""_+atom_":"_atom.type_""">","</span>")
	
	Set a=+atom
    Set out=preValue_$ZCONVERT(atom.start,"O","HTML")_$GET(..pre(a))_$ZCONVERT(atom.value,"O","HTML")_$GET(..post(a))_$ZCONVERT(atom.end,"O","HTML")_postValue

	Write out
	$$$DEBUGMethodEnd
}

}
