Class PXW.Xref.BuildStatus Extends %Library.Persistent
{

Property RequestNamespace As %String;

Property RequestType As %String;

Property RequestSearchName As %String;

Property RequestForce As %String;

Property Total As %Integer;

Property TotalBuilt As %Integer;

Property TotalErrors As %Integer;

Property TotalSkipped As %Integer;

Property StartDateTime As %TimeStamp;

Property EndDateTime As %TimeStamp;

Property ProcessId As %String [ InitialExpression = {$JOB} ];

Property CurrentlyBuilding As %String(MAXLEN = 500);

Property Status As %Library.Status;

Property Running As %Boolean [ Calculated, SqlComputeCode = { Set {*}=##class(PXW.Xref.BuildStatus).GetIsRunning({ProcessId}) }, SqlComputed ];

Method Start()
{
    Set ..StartDateTime=$ZDATETIME($HOROLOG,3)
    set ..Status=$$$OK
    Lock +^PXW.Xref.BuildStatus.Proc(..ProcessId)
}

Method End()
{
    Set ..EndDateTime=$ZDATETIME($HOROLOG,3)
    Lock -^PXW.Xref.BuildStatus.Proc(..ProcessId)
}

Method %OnClose() As %Status
{
    Lock -^PXW.Xref.BuildStatus.Proc(..ProcessId)
    Quit $$$OK
}

ClassMethod GetIsRunning(PID As %String) As %Boolean
{
    Set isrunning=0
    Lock +^PXW.Xref.BuildStatus.Proc(PID):0 Else  Set isrunning=1
    Lock -^PXW.Xref.BuildStatus.Proc(PID)
    Quit isrunning
}

Storage Default
{
<Data name="BuildStatusDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>RequestNamespace</Value>
</Value>
<Value name="3">
<Value>RequestType</Value>
</Value>
<Value name="4">
<Value>RequestSearchName</Value>
</Value>
<Value name="5">
<Value>RequestForce</Value>
</Value>
<Value name="6">
<Value>Total</Value>
</Value>
<Value name="7">
<Value>TotalBuilt</Value>
</Value>
<Value name="8">
<Value>TotalErrors</Value>
</Value>
<Value name="9">
<Value>StartDateTime</Value>
</Value>
<Value name="10">
<Value>EndDateTime</Value>
</Value>
<Value name="11">
<Value>ProcessId</Value>
</Value>
<Value name="12">
<Value>CurrentlyBuilding</Value>
</Value>
<Value name="13">
<Value>Status</Value>
</Value>
<Value name="14">
<Value>TotalSkipped</Value>
</Value>
</Data>
<DataLocation>^PXW.Xref.BuildStatusD</DataLocation>
<DefaultData>BuildStatusDefaultData</DefaultData>
<ExtentSize>2</ExtentSize>
<IdLocation>^PXW.Xref.BuildStatusD</IdLocation>
<IndexLocation>^PXW.Xref.BuildStatusI</IndexLocation>
<Property name="%%CLASSNAME">
<AverageFieldSize>2</AverageFieldSize>
<OutlierSelectivity>.999999:</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="%%ID">
<AverageFieldSize>3</AverageFieldSize>
<Selectivity>1</Selectivity>
</Property>
<Property name="CurrentlyBuilding">
<AverageFieldSize>40</AverageFieldSize>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="EndDateTime">
<AverageFieldSize>2</AverageFieldSize>
<OutlierSelectivity>.999999:</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="ProcsessId">
<AverageFieldSize>5</AverageFieldSize>
<OutlierSelectivity>.999999:988</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="RequestForce">
<AverageFieldSize>3</AverageFieldSize>
<OutlierSelectivity>.999999:1</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="RequestNamespace">
<AverageFieldSize>12</AverageFieldSize>
<OutlierSelectivity>.999999:"LOCAL_USER"</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="RequestSearchName">
<AverageFieldSize>7</AverageFieldSize>
<OutlierSelectivity>.999999:"PXW.*"</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="RequestType">
<AverageFieldSize>2</AverageFieldSize>
<OutlierSelectivity>.999999:</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="StartDateTime">
<AverageFieldSize>21</AverageFieldSize>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="Status">
<AverageFieldSize>2</AverageFieldSize>
<OutlierSelectivity>.999999:</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="Total">
<AverageFieldSize>2</AverageFieldSize>
<OutlierSelectivity>.999999:</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<Property name="TotalBuilt">
<AverageFieldSize>2.5</AverageFieldSize>
<Selectivity>50.0000%</Selectivity>
</Property>
<Property name="TotalErrors">
<AverageFieldSize>2</AverageFieldSize>
<OutlierSelectivity>.999999:</OutlierSelectivity>
<Selectivity>0.0001%</Selectivity>
</Property>
<SQLMap name="IDKEY">
<BlockCount>-4</BlockCount>
</SQLMap>
<StreamLocation>^PXW.Xref.BuildStatusS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
