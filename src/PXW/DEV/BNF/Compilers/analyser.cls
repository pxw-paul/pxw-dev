Class PXW.DEV.BNF.Compilers.analyser Extends %RegisteredObject
{

/// Name of the class being analysed
Property This As %String;

/// Name of the method being analysed
Property ThisMethod As %String;

/// Warnings assigned to elements
/// ..ElementWarnings(+elementid)="text of the warning"
Property ElementWarnings As %String [ MultiDimensional ];

}
