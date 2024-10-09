/// Make a dynamic query on Atelier behave like a normal resultset
Class PXW.DEV.Dictionary.AtelierRS Extends %RegisteredObject
{

Property %QueryResultContent As %Library.DynamicObject;

Property %Iterator As %Iterator.Object;

Property %Value As %Library.DynamicObject;

Property SQL As %String(MAXLEN = "");

Method %OnNew(object As %DynamicObject) As %Status
{
    Set ..%QueryResultContent=object.result.content
    Set ..%Iterator=..%QueryResultContent.%GetIterator()
    Quit $$$OK
}

Method %Next() As %Library.Integer
{
	If ..%Iterator.%GetNext(.key,.value) {
        Set ..%Value=value
        Quit 1
    } Else { 
        Set ..%Value=""
        Quit 0
    }
}

Method %Get(ColumnName As %String) As %String
{
    Set val=$PROPERTY(..%Value,ColumnName)
    Quit val
}

}
