Class PXW.DEV.LIB.REST.Settings Extends %Library.Persistent
{

Property ServerName As %String;

/// localhost
Property ServerAddress As %String;

/// 52773
Property Port As %String;

/// Basic
Property InitiateAuthentication As %String;

/// _SYSTEM
Property Username As %String;

/// pw1971
Property Password As %String;

Property ContentType As %String [ InitialExpression = "application/json" ];

Property SSLConfiguration As %String;

Index idkey On ServerName [ IdKey, PrimaryKey ];

Storage Default
{
<Data name="SettingsDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>ServerAddress</Value>
</Value>
<Value name="3">
<Value>Port</Value>
</Value>
<Value name="4">
<Value>InitiateAuthentication</Value>
</Value>
<Value name="5">
<Value>Username</Value>
</Value>
<Value name="6">
<Value>Password</Value>
</Value>
<Value name="7">
<Value>ContentType</Value>
</Value>
<Value name="8">
<Value>SSLConfiguration</Value>
</Value>
</Data>
<DataLocation>^PXW.DEV.LIB.REST.SettingsD</DataLocation>
<DefaultData>SettingsDefaultData</DefaultData>
<IdLocation>^PXW.DEV.LIB.REST.SettingsD</IdLocation>
<IndexLocation>^PXW.DEV.LIB.REST.SettingsI</IndexLocation>
<StreamLocation>^PXW.DEV.LIB.REST.SettingsS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
