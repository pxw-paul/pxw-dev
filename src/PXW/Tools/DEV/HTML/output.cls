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

/// eg an atom=2@PXW.DEV.Atom
/// orefNumber is just the 2
Method wrapObjectRefHTML(orefNumber As %Integer, pre As %String, post As %String)
{
    Set n=$GET(..pre(orefNumber)),n=n+1,..pre(orefNumber,n)=pre,..pre(orefNumber)=n
    Set n=$GET(..post(orefNumber)),n=n+1,..post(orefNumber,n)=post,..post(orefNumber)=n
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
	$$$DEBUGMethodBegin
	If ..WriteMode {
		Write html
		;s %outputhtml=$g(%outputhtml)_html
		;i $l(%outputhtml)>100000 w %outputhtml s %outputhtml=""
		;s ^PXW("out",$i(^PXW))=html
	} Else {
		Set ..htmlout=..htmlout_html	
	}
	$$$DEBUGMethodEnd
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
	For i=1:1:+$GET(..pre(+element)) Do ..output($GET(..pre(+element,i)))
	For  {
		Set a=element.partsGetNext(.akey)
		Quit:akey=""
		
		If a.%IsA("PXW.DEV.Element") {
			Do ..writeElement(a)
		} Else {
			Do ..writeAtom(a)
		}
	}
    For i=+$GET(..post(+element)):-1:1 Do ..output($GET(..post(+element,i)))
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
	
	Set out=""
    For i=1:1:+$GET(..pre(+atom)) Set out=out_$GET(..pre(+atom,i))
    Set out=out_preValue_..html(atom.start)
	    For i=1:1:+$GET(..preI(+atom)) Set out=out_$GET(..preI(+atom,i))
	    Set out=out_..html(atom.value)
	    For i=+$GET(..postI(+atom)):-1:1 Set out=out_$GET(..postI(+atom,i))
	Set out=out_..html(atom.end)_postValue
    For i=+$GET(..post(+atom)):-1:1 Set out=out_$GET(..post(+atom,i))
	Do ..output(out)
}

Method GenericRedirect(element As PXW.DEV.Element) [ CodeMode = objectgenerator ]
{
    #dim meth as %Dictionary.MethodDefinition
    Set opencurly="{",closecurly="}"
    Set mkey=""

    
    Do %code.WriteLine($CHAR(9)_"Set class=$$$UPPER(element.%ClassName(1))")
    Do %code.WriteLine($CHAR(9)_"Set etype=$$$UPPER(element.type)")

    For  {
        Set meth=%compiledclass.Methods.GetNext(.mkey)
        Quit:mkey=""

        If meth.ReturnType="PXW.DEV.BNF.Compilers.elementHandler" {
            ; Method writeCOSThing(element As PXW.DEV.BNF.Elements.COS) AS  As PXW.DEV.BNF.Compilers.elementHandler(Type="Thing")
			Set class=$PIECE(meth.FormalSpec,":",2)
			If class'="" {
				Set param=meth.ReturnTypeParams
				If param'="" {
					Set etypes=$TRANSLATE($PIECE(param,"=",2),"""","")
					If etypes'="" {
						For i=1:1:$LENGTH(etypes,",") {
							Set etype=$PIECE(etypes,",",i)
							Set methods(class,etype,meth.Name)=meth
						}
					}
				}
			}
		}
	}
	Set (class,etype,name)="",cif="If"
	For  {
		Set class=$ORDER(methods(class))
		Quit:class=""

		Do %code.WriteLine($CHAR(9)_cif_" class="""_$$$UPPER(class)_""" "_opencurly)
		
		Set ifcommand="If"
		For  {
			Set etype=$ORDER(methods(class,etype))
			Quit:etype=""

			; etype will contain the quotes
			Do %code.WriteLine($CHAR(9,9)_ifcommand_" etype="""_$$$UPPER(etype)_""" "_opencurly)
			
			For  {
				Set name=$ORDER(methods(class,etype,name),1,meth)
				Quit:name=""
				
				Do %code.WriteLine($CHAR(9,9,9)_"do .."_meth.Name_"(element)")
			}
			Do %code.WriteLine($CHAR(9,9)_closecurly)
			Set ifcommand="Elseif"
		}
		Do %code.WriteLine($CHAR(9)_closecurly)
		Set cif="Elseif"
    }
    Quit $$$OK
}

}
