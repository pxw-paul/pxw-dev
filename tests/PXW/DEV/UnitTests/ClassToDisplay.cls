Class PXW.DEV.UnitTests.ClassToDisplay Extends %RegisteredObject
{

Property Prop1 As %String;

Property Prop2 As %Integer [ SqlComputeCode = { s {*}={Prop_1} } ];

ClassMethod WorkOnAList(ObjList As %ListOfObjects(ELEMENTTYPE="PXW.DEV.UnitTests.ClassToDisplay",CLASSNAMEINOID=1))
{
    
    s string="a string"
    set string=string_" and more"
    set string=string_" and some expression "_(xxx+1)_"."
    set another="prefixed "_string
    set str(a)="string 1"
    set str(b)="string 2"
    set sql="SELECT top 100 * from pxw_xref.data where itemtype='GBL'"
    set qry($i(qry))="select itemkey1"
    set qry($i(qry))="from pxw_xref.data"
    set qry($i(qry))="where itemtype='GBL'"

    d ..ele(.part) w part.type
    d ..atom(.part) w part.type
    d ##class(PXW.DEV.UnitTests.ClassToDisplay).ele(.part) w part.type

    q another_sql
}

ClassMethod ele(Output ele As PXW.DEV.Element)
{
}

ClassMethod atom(Output atom As PXW.DEV.Atom)
{
}

}
