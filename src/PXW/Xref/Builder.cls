Class PXW.Xref.Builder Extends %RegisteredObject
{

Parameter CodeType;

Method Build(Namespace As %String, ItemKey1 As %String, PreLoadedText As %String = "") As %Status [ Abstract ]
{
}

ClassMethod RegisterType() As %Status
{
    Set sc=$$$OK 
    Set codetype=..#CodeType
    If codetype'="" {
        Set sc=##class(PXW.DEV.Dictionary.CodeTypeIndex).RegisterType("XrefBuilder",codetype,..%ClassName(1))
    }
    Quit sc
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
