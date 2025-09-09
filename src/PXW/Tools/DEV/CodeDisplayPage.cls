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

/// Key1, 2, 3 opens from something like XREF page, where 1=class, 2=method, 3=linenumber.
ClassMethod HREFToK123(ItemKey1 As %String, ItemKey2 As %String = "", LineNumber As %Integer = "") As %String
{
    Quit ..HREFTo(ItemKey1,ItemKey2,LineNumber)
}

/// ID,Name,Subtype opens from something like CODE list page, where id is probably the same as Name but might not be.
ClassMethod HREFToID(ID As %String, Name As %String = "", SubType As %Integer = "") As %String
{
    Quit ..HREFTo(ID)
}

}
