Class PXW.Xref.Data Extends %Library.Persistent [ Owner = {_PUBLIC} ]
{

Property NameSpace As %String [ InitialExpression = {$GET(%NS)}, Required ];

/// Class, Global, Routine
Property ItemType As %String;

/// Name of Class, Global, Routine
Property ItemKey1 As %String(MAXLEN = 1024, TRUNCATE = 1);

/// Method of Class, Subscripts of global or Label of routine
Property ItemKey2 As %String(MAXLEN = 1024, TRUNCATE = 1);

/// What is referencing this thing (class, routine)
Property CalledByType As %String;

/// The command used for the call (set/kill)
Property CalledByCommand As %String(TRUNCATE = 1);

/// The routine, class doing the call
Property CalledByKey1 As %String(MAXLEN = 1024, TRUNCATE = 1);

/// Line label, method
Property CalledByKey2 As %String(MAXLEN = 1024, TRUNCATE = 1);

/// label relative number
Property CalledByKey3 As %String(MAXLEN = 1024, TRUNCATE = 1);

/// absolute line number within the entire class text, or routine text
Property LineNumber As %Integer;

/// data relating to this specific call (label parameters, global subscripts etc)
Property Parameters As %String(MAXLEN = 1024, TRUNCATE = 1);

/// Name of the section of code this is in.  EG the code:
/// <example>
///   Q
/// A S X=1
///   S Y=2
/// 1 S Z=3 ; this is in section A
///   Q
/// </example>
Property CalledBySection As %String;

Index CalledBy On (NameSpace, ItemType, ItemKey1, ItemKey2, CalledByType, CalledByCommand, CalledByKey1, CalledByKey2, CalledByKey3) [ PrimaryKey, Unique ];

Index CalledBy2 On (NameSpace, ItemKey1, ItemKey2, CalledByType, CalledByCommand, CalledByKey1, CalledByKey2, CalledByKey3);

Index CalledBy3 On (NameSpace, ItemKey2, ItemKey1, CalledByType, CalledByCommand, CalledByKey1, CalledByKey2, CalledByKey3);

Index Calls On (NameSpace, CalledByType, CalledByKey1, CalledByKey2, ItemType, ItemKey1, ItemKey2);

Index Calls2 On (NameSpace, CalledByKey1, CalledByKey2, ItemType, ItemKey1, ItemKey2);

Index Calls3 On (NameSpace, CalledByKey2, CalledByKey1, ItemType, ItemKey1, ItemKey2);

Method AlreadyExists() As %Boolean
{
	Quit ..CalledByExists(..NameSpace,..ItemType, ..ItemKey1, ..ItemKey2, ..CalledByType, ..CalledByCommand, ..CalledByKey1, ..CalledByKey2, ..CalledByKey3)
}

Storage Default
{
<Data name="DataDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>LineNumber</Value>
</Value>
<Value name="3">
<Value>Parameters</Value>
</Value>
<Value name="4">
<Value>CalledBySection</Value>
</Value>
<Value name="5">
<Value>NameSpace</Value>
</Value>
<Value name="6">
<Value>ItemType</Value>
</Value>
<Value name="7">
<Value>ItemKey1</Value>
</Value>
<Value name="8">
<Value>ItemKey2</Value>
</Value>
<Value name="9">
<Value>CalledByType</Value>
</Value>
<Value name="10">
<Value>CalledByCommand</Value>
</Value>
<Value name="11">
<Value>CalledByKey1</Value>
</Value>
<Value name="12">
<Value>CalledByKey2</Value>
</Value>
<Value name="13">
<Value>CalledByKey3</Value>
</Value>
</Data>
<DataLocation>^PXW.Xref.DataD</DataLocation>
<DefaultData>DataDefaultData</DefaultData>
<ExtentSize>0</ExtentSize>
<IdLocation>^PXW.Xref.DataD</IdLocation>
<IndexLocation>^PXW.Xref.DataI</IndexLocation>
<StreamLocation>^PXW.Xref.DataS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
