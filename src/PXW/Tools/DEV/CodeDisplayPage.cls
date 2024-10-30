Class PXW.Tools.DEV.CodeDisplayPage Extends PXW.Tools.Page
{

Parameter CodeType;

Parameter ToolType = "Code";

Parameter CodeUsage = "CodeDisplay";

ClassMethod RegisterType() As %Status
{
    Set sc=$$$OK 
    Set codetype=..#CodeType
    If codetype'="" {
        Set sc=##class(PXW.DEV.Dictionary.CodeTypeIndex).RegisterType(..#CodeUsage,codetype,..%ClassName(1))
    }
    Quit sc
}

ClassMethod GetPageClass(CodeType As %String) As %String
{
    Quit ##class(PXW.DEV.Dictionary.CodeTypeIndex).GetClassForUsage(..#CodeUsage,CodeType)
}

ClassMethod HREFToK123(ItemKey1 As %String, ItemKey2 As %String = "", LineNumber As %Integer = "") As %String
{
    Quit ..HREFTo(ItemKey1,ItemKey2,LineNumber)
}

}
