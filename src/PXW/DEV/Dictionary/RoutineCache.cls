Class PXW.DEV.Dictionary.RoutineCache Extends %RegisteredObject
{

Property Namespace As PXW.DEV.Dictionary.Namespace;

Property Name As %String(MAXLEN = "");

Property Summary As %String(MAXLEN = "");

Property IsGenerated As %Boolean;

Index PK On (Namespace, Name) [ IdKey, PrimaryKey, Unique ];

}
