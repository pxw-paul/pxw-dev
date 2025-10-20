Class PXW.DEV.UnitTests.ClassToDisplay Extends %RegisteredObject
{

Property Prop1 As %String;

Property Prop2 As %Integer [ SqlComputeCode = { s {*}={Prop_1} } ];

ClassMethod WorkOnAList(ObjList As %ListOfObjects(ELEMENTTYPE="PXW.DEV.UnitTests.ClassToDisplay",CLASSNAMEINOID=1))
{
 			Set @("%class="_$list(range))
}

ClassMethod ele(Output ele As PXW.DEV.Element)
{
}

ClassMethod atom(Output atom As PXW.DEV.Atom)
{
}

}
