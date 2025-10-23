/// Use this class for linking code types to various classes for doing specific things
Class PXW.DEV.Dictionary.CodeTypeIndex Extends %Library.Persistent
{

Property Usage As %String;

Property CodeType As PXW.DEV.Dictionary.CodeType [ Required ];

Property Class As %String(MAXLEN = 500) [ Required ];

Index PK On (Usage, CodeType) [ IdKey ];

ClassMethod RegisterType(Usage As %String, CodeType As %String, Class As %String) As %Status
{
    Set ct=##class(PXW.DEV.Dictionary.CodeType).%OpenId(CodeType,,.sc)
    Quit:'$ISOBJECT(ct) sc

    Set cti=..PKOpen(Usage,CodeType) 
    If '$ISOBJECT(cti) {
        Set cti=..%New()
        Set cti.Usage=Usage
        Set cti.CodeType=ct
    }
    If cti.Class="" Set cti.Class=Class
    If cti.Class=Class {
        Set sc=cti.%Save()
    } Else {
        Set sc=$$$ERROR(5001,"CodeType ("_Usage_","_CodeType_") is already linked to "_cti.DisplayPageClass)
    }
    Quit sc
}

ClassMethod GetClassForUsage(Usage As %String, CodeTypeName As %String) As %String
{
    &SQL(
        SELECT Class INTO :class
          FROM PXW_DEV_Dictionary.CodeTypeIndex
         WHERE Usage=:Usage
           AND CodeType->Name=:CodeTypeName
    )
    If SQLCODE>-1 Quit class
    Quit ""
}

ClassMethod NewClassForUsage(Usage As %String, CodeTypeName As %String)
{
	#dim obj as PXW.DEV.BNF.Compilers.analyser
	s class=..GetClassForUsage(Usage,CodeTypeName)
	if class'="" {
        s obj=$classmethod(class,"%New")
    } else {
        s obj=""
    }
	q obj
}

Storage Default
{
<Data name="CodeTypeIndexDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>Class</Value>
</Value>
</Data>
<DataLocation>^PXW.DEV.Dict9C1D.CodeTypeIndexD</DataLocation>
<DefaultData>CodeTypeIndexDefaultData</DefaultData>
<ExtentSize>4</ExtentSize>
<IdLocation>^PXW.DEV.Dict9C1D.CodeTypeIndexD</IdLocation>
<IndexLocation>^PXW.DEV.Dict9C1D.CodeTypeIndexI</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>2</AverageFieldSize>
<OutlierSelectivity>.999999:</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>18</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="Class">
<AverageFieldSize>23</AverageFieldSize>
<Selectivity>25.0000%</Selectivity>
</Property>
<Property name="CodeType">
<AverageFieldSize>5</AverageFieldSize>
<Selectivity>33.3333%</Selectivity>
</Property>
<Property name="Usage">
<AverageFieldSize>13</AverageFieldSize>
<Selectivity>50.0000%</Selectivity>
</Property>
<SQLMap name="PK">
<BlockCount>-4</BlockCount>
</SQLMap>
<StreamLocation>^PXW.DEV.Dict9C1D.CodeTypeIndexS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
