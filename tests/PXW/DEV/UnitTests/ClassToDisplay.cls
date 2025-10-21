Class PXW.DEV.UnitTests.ClassToDisplay Extends %CSP.Page
{

Property Prop1 As %String;

Property Prop2 As %Integer [ Aliases = {property two ,p2}, SqlComputeCode = { s {*}={Prop_1} } ];

/**/
ClassMethod WorkOnAList(ObjList As %ListOfObjects(ELEMENTTYPE="PXW.DEV.UnitTests.ClassToDisplay",CLASSNAMEINOID=1))
{
	#dim x as PXW.Xref.Data
	;
 	set sql="SELECT * FROM PXW_XREF.Data WHERE ITEMKEY1=?"

	#dim sc as PXW.Xref.Data
	s x=##class(PXW.Xref.Data).%OpenId(1,,.sc)
	w sc
	;
	&js<var x=1; #server(..ele(x))#>
	&js<var y=2; #server(PXW.DEV.UnitTests.ClassToDisplay.atom(x))#>
}

ClassMethod ele(Output ele As PXW.DEV.Element)
{
}

ClassMethod atom(Output atom As PXW.DEV.Atom)
{
}

}
