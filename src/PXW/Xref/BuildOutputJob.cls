Class PXW.Xref.BuildOutputJob Extends %RegisteredObject
{

Method batchStart(CountOfThings As %Integer)
{
    Kill ^IRISTEMP.PXWXref($JOB)
    Set ^IRISTEMP.PXWXref($JOB,"1.STARTED")=$ZDATETIME($HOROLOG,3)
    Set ^IRISTEMP.PXWXref($JOB,"1.TOTAL")=CountOfThings
    Set ^IRISTEMP.PXWXref($JOB,"3.ERROR")=0
    Set ^IRISTEMP.PXWXref($JOB,"3.OK")=0

    Set j="" 
    For  {
        Set j=$ORDER(^IRISTEMP.PXWXref(j))
        Quit:j=""

        If $DATA(^IRISTEMP.PXWXref(j,"9.FINISHED")) {
            Kill ^IRISTEMP.PXWXref(j)
        }
    }
}

Method processStart(classname As %Library.String)
{
	
	Set ^IRISTEMP.PXWXref($JOB,"2.PROCESSING")=classname
}

Method processStatus(classname As %Library.Persistent, Status As %Status)
{
	If $$$ISERR(Status) {
        Set ^IRISTEMP.PXWXref($JOB,"3.ERROR")=^IRISTEMP.PXWXref($JOB,"3.ERROR")+1
	} Else {
        Set ^IRISTEMP.PXWXref($JOB,"2.PROCESSING")=""
        Set ^IRISTEMP.PXWXref($JOB,"3.OK")=^IRISTEMP.PXWXref($JOB,"3.OK")+1
    }
}

Method batchStatus(CountOfThings As %Integer, Status As %Status)
{
	Set ^IRISTEMP.PXWXref($JOB,"9.DONE")=CountOfThings
    Set ^IRISTEMP.PXWXref($JOB,"9.FINISHED")=$ZDATETIME($HOROLOG,3)
}

Method %OnClose() As %Library.Status
{
    ; object closed without being finished
    If '$DATA(^IRISTEMP.PXWXref($JOB,"9.FINISHED")) {
        Set ^IRISTEMP.PXWXref($JOB,"9.FINISHED")="UNEXPECTED OBJECT CLOSE"
    }
}

/// d ##class(PXW.Xref.BuildOutputJob).DisplayStatus()
ClassMethod DisplayStatus()
{
    ZWrite ^IRISTEMP.PXWXref
}

}
