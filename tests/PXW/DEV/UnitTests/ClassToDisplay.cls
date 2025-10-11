Class PXW.DEV.UnitTests.ClassToDisplay Extends %RegisteredObject
{

Property Prop1 As %String;

Property Prop2 As %Integer [ SqlComputeCode = { s {*}={Prop_1} } ];

ClassMethod WorkOnAList(ObjList As %ListOfObjects(ELEMENTTYPE="PXW.DEV.UnitTests.ClassToDisplay",CLASSNAMEINOID=1))
{
    set obj=ObjList.GetAt(1)
    set count=ObjList.Count()
    &SQL(SELECT * FROM PXW_Xref.data)
    write obj.Prop1

    s json={"p1":1, "p2":"string", "p3":true, "p4":{ "p4a":"thing \"quoted\" thing"}}
    s string="a string"
}

ClassMethod go()
{
 
    s x="A2"
    i x?1A {}
    i x?    1A1N
    {
        w 1
    }
}

}
