Class PXW.DEV.UnitTests.ClassToDisplay Extends %Library.Persistent
{

Property String1 As %String;

Property Int1 As %Integer;

Property Date1 As %Date;

Property Int2 As %Integer;

Index i1 On (String1, Int1, Date1);

Index i2 On (Int2, String1);

Storage Default
{
<Data name="ClassToDisplayDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>String1</Value>
</Value>
<Value name="3">
<Value>Int1</Value>
</Value>
<Value name="4">
<Value>Date1</Value>
</Value>
<Value name="5">
<Value>Int2</Value>
</Value>
</Data>
<DataLocation>^PXW.DEV.UniE1B3.ClassToDisplayD</DataLocation>
<DefaultData>ClassToDisplayDefaultData</DefaultData>
<IdLocation>^PXW.DEV.UniE1B3.ClassToDisplayD</IdLocation>
<IndexLocation>^PXW.DEV.UniE1B3.ClassToDisplayI</IndexLocation>
<StreamLocation>^PXW.DEV.UniE1B3.ClassToDisplayS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
