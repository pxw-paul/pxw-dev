Class PXW.Xref.BuildOutput Extends %RegisteredObject
{

Method batchStart(CountOfThings As %Integer)
{
	Write !,"Started Batch, count="_CountOfThings
}

Method processStart(classname As %Library.String)
{
	
	Write !,classname
	Quit
}

Method processStatus(classname As %Library.Persistent, Status As %Status)
{
	If $$$ISERR(Status) {
		Set txt=$SYSTEM.Status.GetErrorText(Status)
		Write !,txt
	}
}

Method batchStatus(CountOfThings As %Integer, Status As %Status)
{
	Write !,"Completed Batch, count="_CountOfThings
}

}
