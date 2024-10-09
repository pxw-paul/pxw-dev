Class PXW.Tools.DEV.Xref.Output Extends PXW.Xref.BuildOutput
{

Method batchStart(CountOfThings As %Integer)
{
	Write !,"Started Batch, count="_CountOfThings
}

Method processStart(classname As %Library.String)
{
	
	Write !,"<a class='COSObjectsProperty' href='"_##class(PXW.Tools.DEV.Class).HREFTo(classname)_"'>"_..EscapeHTML(classname)_"</a>"
	Write *-3
	Quit
}

Method processStatus(classname As %Library.Persistent, Status As %Status)
{
	If $$$ISERR(Status) {
		Set txt=$SYSTEM.Status.GetErrorText(Status)
		Write "<span style='color:red;'>" 
		Write ..EscapeHTML(txt)
		Write "</span>"
	}
}

Method batchStatus(CountOfThings As %Integer, Status As %Status)
{
	Write !,"Completed Batch, count="_CountOfThings
}

/// This method converts input HTML text into Escaped HTML text.
ClassMethod EscapeHTML(in As %String) As %String
{
 Quit $ZCONVERT(in,"O","HTML")
}

}
