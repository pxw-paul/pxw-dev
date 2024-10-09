/// General details about the config of the namespaces
Class PXW.DEV.Dictionary.NameSpaces Extends %RegisteredObject
{

Property Name As %String;

Property AtelierSettings As PXW.DEV.Dictionary.AtelierSettings;

/// Set this to a list of strings of classes that should be excluded when listing classes, eg "ui%"
/// each item in the list will be added to the SQL in the form: AND name NOT LIKE '...'
Property ExcludeClassesLike As %List;

/// Set this to a list of strings of classes that should be excluded when listing classes, eg "ui%"
/// each item in the list will be added to the SQL in the form: AND (NOT (SUPER [ '...'))
Property ExcludeClassesExtends As %List;

/// Set this up with variables "known" to the system that are probably not going to be dimmed or 
/// declared anywhere.
/// EG. %request=%CSP.Request
Property KnownVariables As array Of %String;

Index iName On Name [ IdKey, PrimaryKey, Unique ];

}
