Include PXW.Debuggers.Macros

Class PXW.DEV.Dictionary.MAC Extends PXW.DEV.Dictionary.CodeInterface
{

Parameter CodeType = "MAC";

Parameter CodeTypeDescription = "Iris Routine MAC";

Property AtelierSettings As PXW.DEV.Dictionary.AtelierSettings;

/// s %NS="LOCAL_USER" s sc=##class(PXW.DEV.Dictionary.Routine).GetRoutineStudioText("PXW.DEV.Dictionary.Routine.1",.text,.lines,.lastupdate,.summary)
Method GetRoutineStudioText(RoutineName As %String, Output Text As %String, Output linesOfCode As %String, Output LastUpdateTime As %TimeStamp, Output Summary As %String, Output IsGenerated As %Boolean) As %Status
{
    #dim iter as %Iterator.Object
 
    If RoutineName="" Quit $$$ERROR(5001,"RoutineName is mandatory")
    If $$$UPPER($p(RoutineName,".",*))="MAC"
  	Set server=..AtelierSettings.ServerName
	Set sc=##class(PXW.DEV.Dictionary.AtelierClient).mac(server,RoutineName,.object)
    If $$$ISOK(sc) {
        Set content=object.result.content
        Set LastUpdateTime=object.result.ts
        Set Text="",sep=""
        Set iter=content.%GetIterator()
        Set line=0
        While iter.%GetNext(.key,.value) {
            ; the top line is not to be included in the text
            If line=0 {
                Set Summary=value
                If $$$UPPER($PIECE($PIECE($PIECE(Summary,"[",2),"]",1),",",2))="GENERATED" Set IsGenerated=1
            }
            ; ROUTINE PXW.DEV.JS.Parser.1 [Type=INT,Generated]"_$c(13,10)_" ;PXW.DEV.JS.Parser.1"_$c(13,10)_" ;Gen......
            If line>0 {
                Set Text=Text_sep_value Set sep=$CHAR(13,10)
                Set linesOfCode($INCREMENT(linesOfCode))=value
            }
            Set line=line+1 
        }
    }
	Quit sc
}

/// Routines=PXW.*
/// 
Method List(Routines As %String) As PXW.DEV.Dictionary.AtelierRS
{
    $$$DEBUGMethodBegin

    Kill parameters
	Set server=..AtelierSettings.ServerName
	Set sql=""
	Set sql=sql_"select Name,""Date"" as TimeChanged,null as SubType  from  %Library.Routine_RoutineList(?)"
    set parameters($i(parameters))=Routines_".MAC"
 
    Set qsc=##class(PXW.DEV.Dictionary.AtelierClient).query(server,sql,.obj,parameters...)
  	If $$$ISERR(qsc) $$$ThrowStatus(qsc)
	Set rs=##class(PXW.DEV.Dictionary.AtelierRS).%New(obj)
    $$$DEBUGMethodEnd
	Quit rs
}

Method Load(Name As %String, Output Text As %String, Output LastUpdateTime As %TimeStamp) As %Status
{
	quit ..GetRoutineStudioText(Name,.Text,,,.LastUpdateTime)
}

Storage Default
{
<Data name="RoutineDefaultData">
<Subscript>"Routine"</Subscript>
<Value name="1">
<Value>AtelierSettings</Value>
</Value>
</Data>
<DefaultData>RoutineDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
