Class PXW.Tools.DEV.CodeDisplayPage Extends PXW.Tools.Page
{

Parameter CodeType;

Parameter ToolType = "Code";

Parameter CodeUsage = "CodeDisplay";

ClassMethod RegisterType() As %Status
{
    set sc=$$$OK 
    set codetype=..#CodeType
    if codetype'="" {
        s sc=##class(PXW.DEV.Dictionary.CodeTypeIndex).RegisterType(..#CodeUsage,codetype,..%ClassName(1))
    }
    quit sc
}

ClassMethod GetPageClass(CodeType As %String) As %String
{
    q ##class(PXW.DEV.Dictionary.CodeTypeIndex).GetClassForUsage(..#CodeUsage,CodeType)
}

ClassMethod HREFToK123(ItemKey1 As %String, ItemKey2 As %String = "", LineNumber As %Integer = "") As %String
{
    q ..HREFTo(ItemKey1,ItemKey2,LineNumber)
}

}
