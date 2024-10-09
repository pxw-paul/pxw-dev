Class PXW.Xref.LastUpdated Extends %Library.Persistent [ Owner = {_PUBLIC} ]
{

Property NameSpace As %String;

Property ItemType As %String;

Property ItemKey1 As %String(MAXLEN = 1024);

Property LastUpdate As %TimeStamp;

Property BuildStatus As %Status;

Index PK On (NameSpace, ItemType, ItemKey1) [ IdKey, PrimaryKey, Unique ];

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
</Data>
<DataLocation>^PXW.Xref.LastUpdatedD</DataLocation>
<DefaultData>LastUpdatedDefaultData</DefaultData>
<ExtentSize>5350</ExtentSize>
<IdLocation>^PXW.Xref.LastUpdatedD</IdLocation>
<IndexLocation>^PXW.Xref.LastUpdatedI</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>2</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>46.21</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="BuildStatus">
<AverageFieldSize>5.75</AverageFieldSize>
<OutlierSelectivity>.994953:1</OutlierSelectivity>
<Selectivity>0.0210%</Selectivity>
</Property>
<Property name="ItemKey1">
<AverageFieldSize>29.2</AverageFieldSize>
<Selectivity>0.0187%</Selectivity>
</Property>
<Property name="ItemType">
<AverageFieldSize>5</AverageFieldSize>
<Selectivity>100.0000%</Selectivity>
</Property>
<Property name="LastUpdate">
<AverageFieldSize>20.92</AverageFieldSize>
<OutlierSelectivity>.320561:"2023-07-31 18:13:32"</OutlierSelectivity>
<Selectivity>0.5479%</Selectivity>
</Property>
<Property name="NameSpace">
<AverageFieldSize>12</AverageFieldSize>
<OutlierSelectivity>.998692:"LOCAL_USER"</OutlierSelectivity>
<Selectivity>0.1308%</Selectivity>
</Property>
<SQLMap name="PK">
<BlockCount>-152</BlockCount>
</SQLMap>
<StreamLocation>^PXW.Xref.LastUpdatedS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
