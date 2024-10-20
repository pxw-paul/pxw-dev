Class PXW.DEV.Dictionary.CodeType Extends %Library.Persistent
{

Property Name As %String;

Property Description As %String;

Property InterfaceClass As %String(MAXLEN = 500);

Index PK On Name [ IdKey ];

Storage Default
{
<Data name="CodeTypeDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Description</Value>
</Value>
<Value name="3">
<Value>InterfaceClass</Value>
</Value>
</Data>
<DataLocation>^PXW.DEV.Dictionary.CodeTypeD</DataLocation>
<DefaultData>CodeTypeDefaultData</DefaultData>
<IdLocation>^PXW.DEV.Dictionary.CodeTypeD</IdLocation>
<IndexLocation>^PXW.DEV.Dictionary.CodeTypeI</IndexLocation>
<StreamLocation>^PXW.DEV.Dictionary.CodeTypeS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
