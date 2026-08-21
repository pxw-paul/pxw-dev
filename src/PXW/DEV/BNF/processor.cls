Include (PXW.Debuggers.Macros,PXW.DEV.BNF.macros)

Class PXW.DEV.BNF.processor Extends %RegisteredObject
{

/// This holds a list of all elements that do not have a specific handler set up.
/// It is built up as processing takes place, so no need to work out in advance
/// what is going to be processed.
Property processNotRequired As %String [ MultiDimensional ];

/// This is the main method to call to process a BNF element object.
/// It will call any special processing for the element type
/// and then loop through all the parts of the elements calling processElement again or processAtom.
/// It could be used directly or used as a template for more specific processing.
Method processElement(element As PXW.DEV.Element)
{
	$$$DEBUGMethodBegin
	set partkey=""
	For  {
		Set part=element.partsGetNext(.partkey)
		Quit:partkey=""
		
		If part.IsElement {
			Do ..processElement(part)
		} Else {
			Do ..processAtom(part)
		}
	}
	$$$DEBUGMethodEnd
}

/// the only method that should actually do any output during the middle processing
Method processAtom(atom As PXW.DEV.Atom)
{
}

/// Look for any methods that have a return type of "PXW.DEV.BNF.Compilers.elementHandler".
/// Build a set of ifs to process any based on the type of element currently being processed.
/// The first parameter on the formal spect is the type of element that the method handles.
/// eg. Method writeCOSThing(element As PXW.DEV.BNF.Elements.COS) AS  As PXW.DEV.BNF.Compilers.elementHandler(Type="Thing")
Method processSpecificElement(element As PXW.DEV.Element) [ CodeMode = objectgenerator ]
{
    #dim meth as %Dictionary.CompiledMethod
    Set opencurly="{",closecurly="}"
    Set mkey=""

    For  {
        Set meth=%compiledclass.Methods.GetNext(.mkey)
        Quit:mkey=""

        If meth.ReturnType="PXW.DEV.BNF.Compilers.elementHandler" {
            ; Method writeCOSThing(element As PXW.DEV.BNF.Elements.COS) AS  As PXW.DEV.BNF.Compilers.elementHandler(Type="Thing")
			Set class=$PIECE(meth.FormalSpec,":",2)
			If class'="" {
				Set param=meth.ReturnTypeParams
				;Set seq=meth.SequenceNumber
				If param'="" {
					Set etypes=$TRANSLATE($PIECE(param,"=",2),"""","")
					If etypes'="" {
						For i=1:1:$LENGTH(etypes,",") {
							Set etype=$PIECE(etypes,",",i)
							; key by sequence for potential time saving - not implemented properly
							;Set defseq=##class(%Dictionary.MethodDefinition).%OpenId(meth.Origin_"||"_meth.Name).SequenceNumber
							;Set methodseq(class,(10000+defseq)_(10000+seq),etype,meth.Name)=meth
							Set methods(class,etype,meth.Name)=meth
						}
					}
				}
			}
		}
	}
    Do %code.WriteLine($CHAR(9)_"Set class=$ZCONVERT($classname(element),""U"") q:class=""""")
    Do %code.WriteLine($CHAR(9)_"Set etype=$ZCONVERT(element.type,""U"") q:etype=""""")
    Do %code.WriteLine($CHAR(9)_"$$$DEBUGMethodBegin")
	Do %code.WriteLine($CHAR(9)_"i '$d(..processNotRequired(class,etype)) {")
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
				
				Do %code.WriteLine($CHAR(9,9,9)_"do .."_meth.Name_"(.element)")
			}
			Do %code.WriteLine($CHAR(9,9)_closecurly)
			Set ifcommand="Elseif"
		}
		; set flag to say that this type of thing does NOT have a redirect
		Do %code.WriteLine($CHAR(9,9)_" else { s ..processNotRequired(class,etype)=1 }")
		Do %code.WriteLine($CHAR(9)_closecurly)
		Set cif="Elseif"
    }
	Do %code.WriteLine($CHAR(9)_"}")
    Do %code.WriteLine($CHAR(9)_"$$$DEBUGMethodEnd")
	
    Quit $$$OK
}

}
