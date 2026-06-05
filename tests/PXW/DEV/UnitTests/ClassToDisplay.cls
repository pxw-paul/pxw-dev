Class PXW.DEV.UnitTests.ClassToDisplay Extends (%Library.Persistent)
{

Property String1 As %String;

Property Int1 As %Integer;

Property Date1 As %Date;

Property Int2 As %Integer;

Property widgets As list Of %DeepSee.Dashboard.Widget(XMLNAME = "widget", XMLPROJECTION = "element");

Index i1 On (String1, Int1, Date1);

Index i2 On (Int2, String1);


Method %OnNew() As %Status [ ServerOnly = 1 ]
{
	s sc=##super()
	q sc
}


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
<Value name="6">
<Value>widgets</Value>
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
