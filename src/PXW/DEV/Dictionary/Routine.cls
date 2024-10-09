Include PXW.Debuggers.Macros

Class PXW.DEV.Dictionary.Routine
{

/// s %NS="LOCAL_USER" s sc=##class(PXW.DEV.Dictionary.Routine).GetRoutineStudioText("PXW.DEV.Dictionary.Routine.1",.text,.lines,.lastupdate,.summary)
ClassMethod GetRoutineStudioText(RoutineName As %String, Output Text As %String, Output linesOfCode As %String, Output LastUpdateTime As %TimeStamp, Output Summary As %String, Output IsGenerated As %Boolean) As %Status
{
    #dim iter as %Iterator.Object
 
    If RoutineName="" Quit $$$ERROR(5001,"RoutineName is mandatory")

    Set ^PXW("log",$INCREMENT(^PXW))=RoutineName_" "_$GET(%NS)
	Set server=%NS ; $g(%Atelier,"localhost:52773:USER")
	Set sc=##class(PXW.DEV.Dictionary.AtelierClient).rtn(server,RoutineName,.object)
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
ClassMethod ListRoutines(Routines As %String, escape As %String = "", listHidden As %Boolean = 0, listGenerated As %Boolean = 0) As PXW.DEV.Dictionary.AtelierRS
{
    $$$DEBUGMethodBegin

	Set server=%NS 
	Set sql=""
	Set sql=sql_"select * from  %Library.Routine_RoutineList('"_Routines_".INT"_"')"

   Set qsc=##class(PXW.DEV.Dictionary.AtelierClient).query(server,sql,.obj)
  	If $$$ISERR(qsc) $$$ThrowStatus(qsc)
	Set rs=##class(PXW.DEV.Dictionary.AtelierRS).%New(obj)
    $$$DEBUGMethodEnd
	Quit rs
}

}
