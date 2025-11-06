Class PXW.DEV.UnitTests.ClassToDisplay Extends %CSP.Page
{

Property Prop1 As %String;

Property Prop2 As %Integer [ Aliases = {property two ,p2}, SqlComputeCode = { s {*}={Prop_1} } ];

/**/
ClassMethod WorkOnAList(ObjList As %ListOfObjects(ELEMENTTYPE="PXW.DEV.UnitTests.ClassToDisplay",CLASSNAMEINOID=1)) As %Status
{
	#dim p as %CSP.Util.HTMLDashboardPane
	#dim x as %XML.ImportHandler
}

ClassMethod ele(Output ele As PXW.DEV.Element)
{
}

ClassMethod atom(Output atom As PXW.DEV.Atom)
{
}

}
