Class PXW.Xref.Builder Extends %RegisteredObject
{

Parameter CodeType;

Method Build(Namespace As %String, ItemKey1 As %String, PreLoadedText As %String = "") As %Status
{
}

ClassMethod RegisterType() As %Status
{
    set sc=$$$OK 
    set codetype=..#CodeType
    if codetype'="" {
        s sc=##class(PXW.DEV.Dictionary.CodeTypeIndex).RegisterType("XrefBuilder",codetype,..%ClassName(1))
    }
    quit sc
}

}
