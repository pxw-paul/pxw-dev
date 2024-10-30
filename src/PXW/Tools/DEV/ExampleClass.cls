/// Example class used by the ChangeStyle function to show what code looks like in the given style.
Class PXW.Tools.DEV.ExampleClass Extends %Library.Persistent
{

Property ThingType As %String(MAXLEN = 100);

/// This is the description of the method.
Method WriteStuff(a1 As %String) As %Status
{
    ; Show various types of code
    Write "This is a bit of "_a1_" code."
    Write "ThingType="_..ThingType
    
    Set sqla1=$$$UPPER(a1)
    Set count=0
     &SQL(SELECT 
            -- sql comment
            exalias.ThingType,
            COUNT(*) as CountOfReferences
            INTO :type,:count
        FROM PXW_Tools_DEV.ExampleClass as exalias
        WHERE ThingType=:sqla1)
    
    Set ^PXW("ExampleClass",..%ClassName(1))=$LISTBUILD($$$OK,99,type,count)

    &html<This is the result of the query <br>
            for #(a1)#: #(count)#>

    quit $$$OK
}

XData xmlstuff
{
<data>
        <!-- xml comment -->
        <row type='str'><cell>d1</cell></row>
    </data>
}

Storage Default
{
<Data name="ExampleClassDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>ThingType</Value>
</Value>
</Data>
<DataLocation>^PXW.Tools.DEV.ExampleClassD</DataLocation>
<DefaultData>ExampleClassDefaultData</DefaultData>
<IdLocation>^PXW.Tools.DEV.ExampleClassD</IdLocation>
<IndexLocation>^PXW.Tools.DEV.ExampleClassI</IndexLocation>
<StreamLocation>^PXW.Tools.DEV.ExampleClassS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
