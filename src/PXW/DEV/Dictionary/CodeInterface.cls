Class PXW.DEV.Dictionary.CodeInterface Extends %Library.Persistent
{

Parameter CodeType;

Parameter CodeTypeDescription;

Property Namespace As PXW.DEV.Dictionary.Namespace;

Property Type As PXW.DEV.Dictionary.CodeType [ InitialExpression = {..#CodeType} ];

Index PK On (Namespace, Type) [ Unique ];

ClassMethod RegisterType() As %Status
{
    Set sc=$$$OK
    Set codetype=..#CodeType
    If codetype'="" {
        Set obj=##class(PXW.DEV.Dictionary.CodeType).PKOpen(codetype)
        If '$ISOBJECT(obj) {
            Set obj=##class(PXW.DEV.Dictionary.CodeType).%New()
            Set obj.Name=codetype
        }
        If (obj.InterfaceClass="") {
            Set obj.InterfaceClass=..%ClassName(1)
        }
        If (obj.InterfaceClass=..%ClassName(1)) {
            Set obj.Description=..#CodeTypeDescription
            Set sc=obj.%Save()
        } Else {
            Set sc=$$$ERROR(5001,"CodeType ("_codetype_") already registered to "_obj.InterfaceClass)
        }
    }
    Quit sc
}

ClassMethod OpenForType(Namespace As %String, CodeType As %String) As PXW.DEV.Dictionary.CodeInterface
{
    Quit ..PKOpen(Namespace,CodeType)
}

ClassMethod OpenNamespace(Namespace As %String) As PXW.DEV.Dictionary.CodeInterface
{
    Set object=..PKOpen(Namespace,..#CodeType)
    Quit object
}

/// Needs to return at least SubType,Name,TimeChanged
/// The return must be similar to %ResultSet
Method List(SearchName As %String) As %RegisteredObject [ Abstract ]
{
}

Method Load(Name As %String, Output Text As %String, Output LastUpdateTime As %TimeStamp) As %Status [ Abstract ]
{
}

Method LoadAsArray(Name As %String, Output Lines As %String) As %Status
{
    Kill Lines
    Set sc=..Load(Name,.text)
    If $$$ISOK(sc) {
        Set textnorm=..NormalizeText(text)
        For i=1:1:$LENGTH(textnorm,$CHAR(13)) {
            Set Lines($INCREMENT(Lines))=$PIECE(textnorm,$CHAR(13),i)
        }
    }
    Quit sc
}

Method NormalizeText(Text As %String) As %String
{
    Set normal=$REPLACE(Text,$CHAR(13,10),$CHAR(13))
    Set normal=$REPLACE(normal,$CHAR(10),$CHAR(13))
    Quit normal
}

Storage Default
{
<Data name="CodeInterfaceDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Namespace</Value>
</Value>
<Value name="3">
<Value>Type</Value>
</Value>
</Data>
<DataLocation>^PXW.DEV.Dict9C1D.CodeInterfaceD</DataLocation>
<DefaultData>CodeInterfaceDefaultData</DefaultData>
<ExtentSize>3</ExtentSize>
<IdLocation>^PXW.DEV.Dict9C1D.CodeInterfaceD</IdLocation>
<IndexLocation>^PXW.DEV.Dict9C1D.CodeInterfaceI</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>34.67</AverageFieldSize>
<Selectivity>33.3333%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>3</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="Namespace">
<AverageFieldSize>12</AverageFieldSize>
<OutlierSelectivity>.999999:"LOCAL_USER"</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="Type">
<AverageFieldSize>5</AverageFieldSize>
<Selectivity>33.3333%</Selectivity>
</Property>
<SQLMap name="IDKEY">
<BlockCount>-4</BlockCount>
</SQLMap>
<SQLMap name="PK">
<BlockCount>-4</BlockCount>
</SQLMap>
<StreamLocation>^PXW.DEV.Dict9C1D.CodeInterfaceS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
