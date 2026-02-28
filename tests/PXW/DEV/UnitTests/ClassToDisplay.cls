Class PXW.DEV.UnitTests.ClassToDisplay Extends (%Library.Persistent, %Populate)
{

Property String1 As %String;

Property Int1 As %Integer;

Property Date1 As %Date;

Property Int2 As %Integer;

Property widgets As list Of %DeepSee.Dashboard.Widget(XMLNAME = "widget", XMLPROJECTION = "element");

Index i1 On (String1, Int1, Date1);

Index i2 On (Int2, String1);

ClassMethod WalkActivityList(pActivities As Ens.BPL.ActivityList)
{
	// walk over the given Activities
	Set tActivities = pActivities
	For a = 1:1:tActivities.Count() {
		Set tActivity = tActivities.GetAt(a)
		w tActivity.Name
	}
}

/*
ClassMethod formatstring(s As %String) As %String [ SqlProc ]
{
	s x=..%New()
	s x.String1="aa"
	s z=x.%ConstructClone(0)
	s z.String1="bb"
    q "formatted "_s
}

Query q1() As %Library.SQLQuery [ SqlProc ]
{
    select id,
        string1,
        classtodisplay_formatstring(string1) as formatted,
        coalesce(date1,cast('2025-01-01' as date)) as deriveddate
    from pxw_dev_unittests.classtodisplay
}

Method %Dump() As %Status
{
	;Set tSC = ##super()
	If $$$ISOK(tSC) {
		Write "Widgets:",?25,..widgets.Count(),!
		For n=1:1:..widgets.Count() {
			Set tSC = ..widgets.GetAt(n).%Dump()
			If $$$ISERR(tSC) Quit

            set o=..widgets.GetAt(n)
            d o.%DumpyDump()
		}
	}
	Quit tSC
}
*/
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
