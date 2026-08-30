Class PXW.Tools.DEV.XrefBuild Extends PXW.Tools.Page
{

Parameter ToolName = "Xref Build";

/// d ##class(PXW.Tools.DEV.XrefBuild).xrefPackage("LOCAL_USER","PXW")
ClassMethod xrefPackage(Namespace As %String, Package As %String, Force As %Boolean = 0) As %Status
{
	if Package["." {
		; package.type
		; package*.type
		; package.*.type
		Set pack=$PIECE(Package,".",1,*-1)
		set type=$p(Package,".",*)
		; package.*
		if type["*" {
			set pack=Package
			set type=""
		}
	} else {
		set pack=Package_"*"
		set type=""
	}
	if type="*" set type=""
	Job ##class(PXW.Xref.Build).Build(Namespace,type,pack,Force)
	Hang 1
	Set sc=$$$OK
	Quit sc
}

ClassMethod WriteMainBody()
{
	Do ..HREFFrom(.package,.force,.deleteold)
	If +deleteold=1 {
		Do ##class(PXW.Xref.BuildStatus).Purge()
	}

	If package'="" {
        If package="*" Set package=""
		Write "<pre>"
		Write !,"Clearing Cache." Do ##class(PXW.DEV.Dictionary.ClassDefinitionObject).ClearCache()
		Write !,"Submitting to background."	Set sc=..xrefPackage(%NS,package,force) Do ..WriteStatus(sc)
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
	Write "<th>ToDo</th>"
	Write "<th>Status</th>"
	Write "</tr>"
	Write "</thead>"
	Write "<tbody>" 

	Set today=$ZDATE(+$HOROLOG,3)
	Set rs=##class(%Library.ResultSet).%New(..%ClassName(1)_":"_"SelectStatus")
	$$$ThrowOnError(rs.Execute())
	While rs.%Next() { 
		Set rowclass=""
		Set enddatetime=rs.%Get("EndDateTime")
		Set running=rs.%Get("Running")
		If running Set rowclass=" class='"_$$$classHiliteRowWarning_"'"
		If 'running,enddatetime="" Set rowclass="class='"_$$$classHiliteRowError_"'"
		If 'running,$PIECE(enddatetime," ",1)=today Set rowclass=" class='"_$$$classHiliteRowGood_"'"
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
		Write "<td><a href="""_##class(PXW.Tools.DEV.XrefBuildProblems).HREFTo(rs.%Get("RequestNamespace"))_""">"_..EscapeHTML(rs.%Get("TotalErrors"))_"</a></td>"
		Write "<td>"_..EscapeHTML(rs.%Get("TotalSkipped"))_"</td>"
		Write "<td>"_..EscapeHTML(rs.%Get("Total")-rs.%Get("TotalBuilt")-rs.%Get("TotalErrors")-rs.%Get("TotalSkipped"))_"</td>"
		Write "<td>"_..EscapeHTML(rs.%Get("Status"))_"</td>"
		Write "</tr>"		
	}

	Write "</tbody>"
	Write "</table>"
}

Query SelectStatus() As %Library.SQLQuery
{
	SELECT * FROM ( 
		SELECT 'a' as sortkey,* FROM PXW_Xref.BuildStatus WHERE EndDateTime is null 
		union 
		SELECT 'b' as sortkey,* FROM PXW_Xref.BuildStatus where EndDateTime is not null
	) order by sortkey, EndDateTime desc
}

/// This shoud output some variables, getting the data from %request
ClassMethod HREFFrom(Output Package As %String, Output force As %Boolean, Output DeleteOld As %Boolean)
{
	Set Package=%request.Get("P")
	Set force=+%request.Get("F")
  	Set DeleteOld=+%request.Get("DO")
}

/// This should return a string of the href to this page based on the input parameters
ClassMethod HREFTo(Package As %String = "", Force As %Boolean = 0, DeleteOld As %Boolean = 0) As %String
{
	Set href=##super()
	Set sep="&"
	If Package'="" Set href=href_sep_"P="_..EscapeURL(Package),sep="&"
	If Force'="" Set href=href_sep_"F="_..EscapeURL(Force),sep="&"
	If DeleteOld'=0 Set href=href_sep_"DO="_..EscapeURL(DeleteOld),sep="&"
	Quit href
}

/// Output 1 Anchor tag for each option in the navigation. Use the scratch variable for anything you want to get from BODY
ClassMethod WriteNav(ByRef scratch)
{
	Write "<a href="""_##class(PXW.Tools.DEV.XrefBuildProblems).HREFTo("")_""">Problems</a>"
	Write "<a href="""_..HREFTo("","",1)_""">Delete status history</a>"
	
	Write "<a href="""_##class(PXW.Tools.DEV.Analyse).HREFTo("")_""">Analysis results</a>"
	
	&HTML<
	<form action="PXW.Tools.DEV.XrefBuild.cls">
		<fieldset>
			<legend id="PXWToolsDEVXrefBuildlegend">Xref Build</legend>
			<input type="hidden" name="IFRAME" value="0">
			<input type="hidden" name="%NS" value="#($G(%NS))#">
			<table>			
				<tbody>
				<tr><td width="25%" class="prompt">Package</td>
				<td width="50%"><input type="text" accesskey="A" name="P" value=""></td>
				</tr>
				<tr><td width="25%" class="prompt">Force</td>
				<td width="50%"><input type="checkbox" name="F" value="1"></td>
				</tr>
				<tr><td> </td><td><input type="submit"></td></tr>
			</tbody></table>
		</fieldset>
	</form>
	<!-- Enter the name of the package to build or * for all. 
		Leave the package empty to display the current status of any builds in progress.
	-->
	>
}

/// Override this method to insert a form onto the header of the page.
/// Calling page is passed in so you can decide what to display on the form/if anything.
ClassMethod WriteHeadForm(Page As %String)
{
	Do ##class(PXW.Xref.Build).DailyBuild() 

	&SQL(SELECT %DLIST(DISTINCT RequestNamespace) INTO :runningNS FROM PXW_Xref.BuildStatus WHERE EndDateTime is null and Running=1)
	If (SQLCODE=0) && (runningNS'="") {
		&html<
			<form id=toolsXrefBuild action='PXW.Tools.DEV.XrefBuild.cls'>
				<fieldset id=toolsXrefBuild>
					<legend>Xref Build in progress</legend>
					<input type=hidden name=IFRAME value='0'>
					<input type=hidden name=%NS value='#(%NS)#'>
					<input readonly size=20	type=text id=toolXrefReference name=XRNS value='#($LISTTOSTRING(runningNS))#'>
					<input type=submit value='Go'>
				</fieldset>
			</form>
		>		
	}
}

}
