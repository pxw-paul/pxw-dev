Class PXW.DEV.BNF.Compilers.analyser Extends %RegisteredObject
{

/// Name of the class being analysed
Property This As %String;

/// Name of the method being analysed
Property ThisMethod As %String;

/// Warnings assigned to elements
/// ..ElementWarnings(+elementid)="text of the warning"
Property ElementWarnings As %String [ MultiDimensional ];

Method GenericRedirect(element As PXW.DEV.Element) [ CodeMode = objectgenerator ]
{
    #dim meth as %Dictionary.MethodDefinition
    Set opencurly="{",closecurly="}"
    Set mkey=""

    Set ifcommand="If"
    Do %code.WriteLine($CHAR(9)_"Set etype=$$$UPPER(element.type)")

    For  {
        Set meth=%compiledclass.Methods.GetNext(.mkey)
        Quit:mkey=""

        If meth.ReturnType="PXW.DEV.BNF.Compilers.elementHandler" {
            ; Type="CosCommand"
            Set param=meth.ReturnTypeParams
            If param'="" {
                Set etype=$PIECE(param,"=",2)
                ; etype will contain the quotes
                Do %code.WriteLine($CHAR(9)_ifcommand_" etype="_$$$UPPER(etype)_" "_opencurly)
                Do %code.WriteLine($CHAR(9,9)_"do .."_meth.Name_"(element)")
                Do %code.WriteLine($CHAR(9)_closecurly)
                Set ifcommand="Elseif"
            }
        }
    }
    Quit $$$OK
}

}
