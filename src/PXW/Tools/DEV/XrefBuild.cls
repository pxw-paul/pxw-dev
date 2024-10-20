Class PXW.Tools.DEV.XrefBuild Extends PXW.Tools.Page
{

/// d ##class(PXW.Tools.DEV.BuildAllXref).xrefPackage("eng")
ClassMethod xrefPackage(Package As %String, Force As %Boolean = 0) As %Status
{
	set pack=$p(Package,"*",1)_"*"
	Job ##class(PXW.Xref.Build).Build(%NS,"",pack,Force)
	Hang 1
	Write !,"Submitted to background."
	Set sc=$$$OK
	Quit sc
}

ClassMethod WriteMainBody()
{
	Do ..HREFFrom(.package,.force,.background)
	&html<
	<fieldset>
		<form id=formRoutine action='PXW.Tools.DEV.XrefBuild.cls'>
			<input type=hidden name=IFRAME value='0'>
			<u>P</u>ackage 
			<input accesskey=P 
				title='Enter Package name'
			type=text id=inputPackage name=P ovalue='#(package)#' value='' size=10>
			Force <input type='checkbox' name="F" value=1 #($SELECT(force:"checked",1:""))#>
			<input type=hidden name="%NS" value='#(%NS)#'>
			<input type=submit value='Go'>
		</form>
	</fieldset>
	>

	If package'="" {
        If package="*" Set package=""
		Write "<pre>"
		Write "Clearing Cache" Do ##class(PXW.DEV.Dictionary.ClassDefinitionObject).ClearCache()
		Set sc=..xrefPackage(package,force)
		Do ..WriteStatus(sc)
		Write "</pre>"
	} 

	write "<table>"
	w "<thead>"
	w "<tr>"
	w "<th>ID</th>"
	w "<th>PID</th>"
	w "<th>StartDateTime</th>"
	w "<th>EndDateTime</th>"
	w "<th>SearchName</th>"
	w "<th>CurrentlyBuilding</th>"
	w "<th>Total</th>"
	w "<th>Built</th>"
	w "<th>Errors</th>"
	w "<th>Skipped</th>"
	w "<th>Status</th>"
	w "</tr>"
	w "</thead>"
	w "<tbody>"

	s rs=##class(%Library.ResultSet).%New(..%ClassName(1)_":"_"SelectStatus")
	$$$ThrowOnError(rs.Execute())
	while rs.%Next() {
		s rowclass=""
		s enddatetime=rs.%Get("EndDateTime")
		s running=rs.%Get("Running")
		i running s rowclass=" class=goodrow"
		i 'running,enddatetime="" s rowclass="class=errorrow"
		w "<tr "_rowclass_">"
		w "<td>"_..EscapeHTML(rs.%Get("ID"))_"</td>"
		w "<td>"_..EscapeHTML(rs.%Get("ProcessId"))_"</td>"
		w "<td>"_..EscapeHTML(rs.%Get("StartDateTime"))_"</td>"
		w "<td>"_..EscapeHTML(rs.%Get("EndDateTime"))_"</td>"
		w "<td>"_..EscapeHTML(rs.%Get("RequestSearchName"))_"</td>"
		w "<td>"_..EscapeHTML(rs.%Get("CurrentlyBuilding"))_"</td>"
		w "<td>"_..EscapeHTML(rs.%Get("Total"))_"</td>"
		w "<td>"_..EscapeHTML(rs.%Get("TotalBuilt"))_"</td>"
		w "<td>"_..EscapeHTML(rs.%Get("TotalErrors"))_"</td>"
		w "<td>"_..EscapeHTML(rs.%Get("TotalSkipped"))_"</td>"
		w "<td>"_..EscapeHTML(rs.%Get("Status"))_"</td>"
		w "</tr>"
		
	}

	w "</tbody>"
	w "</table>"
}

Query SelectStatus() As %Library.SQLQuery
{
	SELECT top 25 * FROM PXW_Xref.BuildStatus ORDER BY ID DESC
}

/// This shoud output some variables, getting the data from %request
ClassMethod HREFFrom(Output Package As %String, Output force As %Boolean, Output background As %Boolean)
{
	Set Package=%request.Get("P")
	Set force=+%request.Get("F")
    Set background=+%request.Get("B")
}

/// This should return a string of the href to this page based on the input parameters
/// Package will build the entire package
/// MethodId will build just the method
/// DEBUG - only makes sense when building a single method
ClassMethod HREFTo(Package As %String = "", Force As %Boolean = 0, Background As %Boolean = 1) As %String
{
	Set href=##super()
	Set sep="&"
	If Package'="" Set href=href_sep_"P="_..EscapeURL(Package),sep="&"
	If Force'="" Set href=href_sep_"F="_..EscapeURL(Force),sep="&"
	If Background'="" Set href=href_sep_"B="_..EscapeURL(Background),sep="&"
	Quit href
}

/// Output 1 Anchor tag for each option in the navigation. Use the scratch variable for anything you want to get from BODY
ClassMethod WriteNav(ByRef scratch)
{
	Write "<a href='"_##class(PXW.Tools.DEV.XrefBuildProblems).HREFTo("")_"'>Problems</a>"
}

}
