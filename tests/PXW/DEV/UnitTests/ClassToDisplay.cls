Class PXW.DEV.UnitTests.ClassToDisplay Extends %RegisteredObject
{

Property Prop1 As %String;

Property Prop2 As %Integer;

ClassMethod WorkOnAList(ObjList As %ListOfObjects(ELEMENTTYPE="PXW.DEV.UnitTests.ClassToDisplay",CLASSNAMEINOID=1))
{
    set obj=ObjList.GetAt(1)
    set count=ObjList.Count()
    write obj.Prop1
}

}
