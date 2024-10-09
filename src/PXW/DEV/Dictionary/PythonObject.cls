Class PXW.DEV.Dictionary.PythonObject Extends %Persistent
{

Property Namespace As %String;

/// This needs to have the final / so that it can simply be concatenated to the name to give a full file spec without worrying about needing to add / or \ or whatever.
/// The list is searched in order.
Property LibraryLocation As %List;

Index iPK On Namespace [ IdKey, PrimaryKey, Unique ];

ClassMethod SetUp()
{
    Set x=..%New()
    Set x.Namespace="LOCAL_USER"
    Set x.LibraryLocation=$LISTBUILD("/usr/lib/python3.10/")
    Set sc=x.%Save()
}

/// s py=##class(PXW.DEV.Dictionary.PythonObject).%OpenId("LOCAL_USER")
/// s sc=py.GetModule("abc",.text,.lines,.lut)
Method GetModule(Name As %String, Output Text As %String, Output linesOfCode As %String, Output LastUpdateTime As %TimeStamp) As %Status
{
    #dim file as %Library.File
    Set Text="",LastUpdateTime="",sep=""
    Set filename=..FindFileName(Name)
    If filename'="" {
        Set stream=##class(%FileCharacterStream).%New()
        Set stream.Filename=filename
        While 'stream.AtEnd {
        Set line=stream.ReadLine()
            Set linesOfCode($INCREMENT(linesOfCode))=line
            Set Text=Text_sep_line
            Set sep=$CHAR(13,10)
        }
        Set lutH=##class(%Library.File).GetFileDateModified(filename)
        If lutH["," {
            Set LastUpdateTime=$ZDATETIME(lutH,3)
        }
    }
    Quit $$$OK
}

Method FindFileName(ModuleName As %String) As %String
{
    Set ret=""
    Set dirsep="/" ; ONLY FOR UNIX AT THE MOMENT
    Set nopy=$SELECT($$$LOWER($PIECE(ModuleName,".",*))="py":$PIECE(ModuleName,".",1,*-1),1:ModuleName)
    Set undotted=$TRANSLATE(nopy,".",dirsep)
    For i=1:1:$LISTLENGTH(..LibraryLocation) {
        Set dir=$LISTGET(..LibraryLocation,i)
        ; try file directly
        Set filename=dir_undotted_".py"
        If ##class(%Library.File).Exists(filename) {
            Set ret=filename
            Quit ; loop
        }
        ; maybe there is an init file
        Set filename=dir_undotted_dirsep_"__init__.py"
        If ##class(%Library.File).Exists(filename) {
            Set ret=filename
            Quit ; loop
        }
    }
    Quit ret
}

Storage Default
{
<Data name="PythonObjectDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>LibraryLocation</Value>
</Value>
</Data>
<DataLocation>^PXW.DEV.Dicti9C1D.PythonObjectD</DataLocation>
<DefaultData>PythonObjectDefaultData</DefaultData>
<IdLocation>^PXW.DEV.Dicti9C1D.PythonObjectD</IdLocation>
<IndexLocation>^PXW.DEV.Dicti9C1D.PythonObjectI</IndexLocation>
<StreamLocation>^PXW.DEV.Dicti9C1D.PythonObjectS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
