Class PXW.Xref.LastUpdated Extends %Library.Persistent [ Owner = {_PUBLIC} ]
{

Property NameSpace As %String;

Property ItemType As %String;

Property ItemKey1 As %String(MAXLEN = "");

Property LastUpdate As %TimeStamp;

Property BuildStatus As %Status;

Property BuiltAt As %TimeStamp;

Property CheckedAt As %TimeStamp;

Property BuildProcessTime As %Numeric;

Index PK On (NameSpace, ItemType, ItemKey1) [ Unique ];

Index iCheckedAtNS On (CheckedAt, NameSpace);

ClassMethod OpenOrNew(NameSpace As %String, ItemType As %String, ItemKey1 As %String) As PXW.Xref.LastUpdated
{
    Set obj=..PKOpen(NameSpace,ItemType,ItemKey1)
    If '$ISOBJECT(obj) {
        Set obj=..%New()
        Set obj.NameSpace=NameSpace
        Set obj.ItemType=ItemType
        Set obj.ItemKey1=ItemKey1
    }
    Quit obj
}

Method NeedsUpdate(CheckTime As %TimeStamp) As %Boolean
{
    If ..LastUpdate="" Quit 1
    If CheckTime="" Quit 1
    If ..BuildStatus'="",$$$ISERR(..BuildStatus) Quit 1
    Set ct=..LastUpdateNormalize(CheckTime)
    If ct]..LastUpdate Quit 1
    Quit 0
}

Storage Default
{
<Data name="LastUpdatedDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>LastUpdate</Value>
</Value>
<Value name="3">
<Value>BuildStatus</Value>
</Value>
<Value name="4">
<Value>BuiltAt</Value>
</Value>
<Value name="5">
<Value>CheckedAt</Value>
</Value>
<Value name="6">
<Value>BuildProcessTime</Value>
</Value>
<Value name="7">
<Value>NameSpace</Value>
</Value>
<Value name="8">
<Value>ItemType</Value>
</Value>
<Value name="9">
<Value>ItemKey1</Value>
</Value>
</Data>
<DataLocation>^PXW.Xref.LastUpdatedD</DataLocation>
<DefaultData>LastUpdatedDefaultData</DefaultData>
<IdLocation>^PXW.Xref.LastUpdatedD</IdLocation>
<IndexLocation>^PXW.Xref.LastUpdatedI</IndexLocation>
<StreamLocation>^PXW.Xref.LastUpdatedS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
