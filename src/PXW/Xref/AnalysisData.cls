Class PXW.Xref.AnalysisData Extends %Library.Persistent [ Owner = {_PUBLIC} ]
{

Property NameSpace As %String [ InitialExpression = {$g(%NS)}, Required ];

Property ItemType As %String;

Property ItemKey1 As %String(MAXLEN = 1024);

Property ItemKey2 As %String(MAXLEN = 1024);

Property LineNumber As %Integer;

Property Description As %String(MAXLEN = 1024, TRUNCATE = 1);

Storage Default
{
<Data name="AnalysisDataDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>NameSpace</Value>
</Value>
<Value name="3">
<Value>ItemType</Value>
</Value>
<Value name="4">
<Value>ItemKey1</Value>
</Value>
<Value name="5">
<Value>ItemKey2</Value>
</Value>
<Value name="6">
<Value>LineNumber</Value>
</Value>
<Value name="7">
<Value>Description</Value>
</Value>
</Data>
<DataLocation>^PXW.Xref.AnalysisDataD</DataLocation>
<DefaultData>AnalysisDataDefaultData</DefaultData>
<IdLocation>^PXW.Xref.AnalysisDataD</IdLocation>
<IndexLocation>^PXW.Xref.AnalysisDataI</IndexLocation>
<StreamLocation>^PXW.Xref.AnalysisDataS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
