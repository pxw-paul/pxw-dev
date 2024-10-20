/// General details about the config of the namespaces
Class PXW.DEV.Dictionary.Namespace Extends %Library.Persistent
{

Property Name As %String;

Property Description As %String;

Index iName On Name [ IdKey, PrimaryKey, Unique ];

Storage Default
{
<Data name="NamespaceDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Description</Value>
</Value>
</Data>
<DataLocation>^PXW.DEV.Dictionary.NamespaceD</DataLocation>
<DefaultData>NamespaceDefaultData</DefaultData>
<IdLocation>^PXW.DEV.Dictionary.NamespaceD</IdLocation>
<IndexLocation>^PXW.DEV.Dictionary.NamespaceI</IndexLocation>
<StreamLocation>^PXW.DEV.Dictionary.NamespaceS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
