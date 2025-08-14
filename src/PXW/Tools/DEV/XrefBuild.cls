Class PXW.Tools.DEV.XrefBuild Extends PXW.Tools.Page
{

/// d ##class(PXW.Tools.DEV.BuildAllXref).xrefPackage("eng")
ClassMethod xrefPackage(Package As %String, Force As %Boolean = 0) As %Status
{
	Set pack=$PIECE(Package,"*",1)_"*"
	Job ##class(PXW.Xref.Build).Build(%NS,"",pack,Force)
	Hang 1
	Write !,"Submitted to background."
	Set sc=$$$OK
	Quit sc
}

ClassMethod WriteMainBody()
{
	Do ..HREFFrom(.package,.force,.background,.deleteold)
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

	If +deleteold=1 {
		do ##class(PXW.Xref.BuildStatus).Purge()
	}

	If package'="" {
        If package="*" Set package=""
		Write "<pre>"
		Write "Clearing Cache" Do ##class(PXW.DEV.Dictionary.ClassDefinitionObject).ClearCache()
		Set sc=..xrefPackage(package,force)
		Do ..WriteStatus(sc)
		Write "</pre>"
	} 

	Write "<table>"
	Write "<thead>"
	Write "<tr>"
	Write "<th>ID</th>"
	Write "<th>PID</th>"
	Write "<th>StartDateTime</th>"
	Write "<th>EndDateTime</th>"
	Write "<th>Namespace</th>"
	Write "<th>SearchName</th>"
	Write "<th>CurrentlyBuilding</th>"
	Write "<th>Total</th>"
	Write "<th>Built</th>"
	Write "<th>Errors</th>"
	Write "<th>Skipped</th>"
	Write "<th>Status</th>"
	Write "</tr>"
	Write "</thead>"
	Write "<tbody>" 

	set today=$zd(+$h,3)
	Set rs=##class(%Library.ResultSet).%New(..%ClassName(1)_":"_"SelectStatus")
	$$$ThrowOnError(rs.Execute())
	While rs.%Next() { 
		Set rowclass=""
		Set enddatetime=rs.%Get("EndDateTime")
		Set running=rs.%Get("Running")
		If running Set rowclass=" class=warningrow"
		If 'running,enddatetime="" Set rowclass="class=errorrow"
		If 'running,$p(enddatetime," ",1)=today Set rowclass=" class=goodrow"
		Write "<tr "_rowclass_">"
		Write "<td>"_..EscapeHTML(rs.%Get("ID"))_"</td>"
		Write "<td>"_..EscapeHTML(rs.%Get("ProcessId"))_"</td>"
		Write "<td>"_..EscapeHTML(rs.%Get("StartDateTime"))_"</td>"
		Write "<td>"_..EscapeHTML(rs.%Get("EndDateTime"))_"</td>"
		Write "<td>"_..EscapeHTML(rs.%Get("RequestNamespace"))_"</td>"
		Write "<td>"_..EscapeHTML(rs.%Get("RequestSearchName"))_"</td>"
		Write "<td>"_..EscapeHTML(rs.%Get("CurrentlyBuilding"))_"</td>"
		Write "<td>"_..EscapeHTML(rs.%Get("Total"))_"</td>"
		Write "<td>"_..EscapeHTML(rs.%Get("TotalBuilt"))_"</td>"
		Write "<td>"_..EscapeHTML(rs.%Get("TotalErrors"))_"</td>"
		Write "<td>"_..EscapeHTML(rs.%Get("TotalSkipped"))_"</td>"
		Write "<td>"_..EscapeHTML(rs.%Get("Status"))_"</td>"
		Write "</tr>"		
	}

	Write "</tbody>"
	Write "</table>"

	Write "<a href='"_..HREFTo("","","",1)_"'>Delete status history</a>"
}

Query SelectStatus() As %Library.SQLQuery
{
	SELECT * FROM ( 
		SELECT 'a' || (10000000000-ID)  as sortkey,* FROM PXW_Xref.BuildStatus WHERE EndDateTime is null 
		union 
		SELECT top 50 'b' || (10000000000-ID) as sortkey,* FROM PXW_Xref.BuildStatus where EndDateTime is not null
	) order by sortkey
}

/// This shoud output some variables, getting the data from %request
ClassMethod HREFFrom(Output Package As %String, Output force As %Boolean, Output background As %Boolean, Output DeleteOld As %Boolean)
{
	Set Package=%request.Get("P")
	Set force=+%request.Get("F")
    Set background=+%request.Get("B")
	set DeleteOld=+%request.Get("DO")
}

/// This should return a string of the href to this page based on the input parameters
/// Package will build the entire package
/// MethodId will build just the method
/// DEBUG - only makes sense when building a single method
ClassMethod HREFTo(Package As %String = "", Force As %Boolean = 0, Background As %Boolean = 1, DeleteOld As %Boolean = 0) As %String
{
	Set href=##super()
	Set sep="&"
	If Package'="" Set href=href_sep_"P="_..EscapeURL(Package),sep="&"
	If Force'="" Set href=href_sep_"F="_..EscapeURL(Force),sep="&"
	If Background'="" Set href=href_sep_"B="_..EscapeURL(Background),sep="&"
	If DeleteOld'=0 Set href=href_sep_"DO="_..EscapeURL(DeleteOld),sep="&"
	Quit href
}

/// Output 1 Anchor tag for each option in the navigation. Use the scratch variable for anything you want to get from BODY
ClassMethod WriteNav(ByRef scratch)
{
	Write "<a href='"_##class(PXW.Tools.DEV.XrefBuildProblems).HREFTo("")_"'>Problems</a>"
}

}
