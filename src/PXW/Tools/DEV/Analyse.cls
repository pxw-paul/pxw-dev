Class PXW.Tools.DEV.Analyse Extends PXW.Tools.Page
{

Parameter ToolType = "Code";

/// Set this to a CodeType that this tool is "related" to.
/// EG, if this is set to CLS then the tool will only appear 
/// on the home page of Namespaces that have a CLS CodeDisplay Page
Parameter ToolRelatesToCodeType = "CLS";

/// The name of the tool on the main home page (index).
/// If the tool does not have a name then it does not appear on the index page by default.
Parameter ToolName = "Code Analysis Results";

ClassMethod WriteMainBody()
{
	Do ..HREFFrom(.itemtype,.itemk1,.itemk2,.flags,.lastupdate)
	If itemk1="",itemk2="",lastupdate="" {
		Write "Showing what has been updated recently"
		Set lastupdate="T-1"
	} 
	Do ..WriteAnalysis(itemtype,itemk1,itemk2,flags,lastupdate)
	
}

ClassMethod WriteAnalysis(itemtype As %String, itemk1 As %String, itemk2 As %String, flags As %String,LastUpdate as %String)
{
	Set showLU=$SELECT(LastUpdate'="":1,1:0)
	If showLU {
		Set starttime=LastUpdate
		If $$$UPPER($EXTRACT(LastUpdate,1))="T" {
			; it should never be a future T+1 date, but lets do it for completeness
			Set mult=$SELECT($EXTRACT(LastUpdate,2)="-":-1,1:1)
			Set starttime=$HOROLOG+($EXTRACT(LastUpdate,3,*)*mult)
			Set starttime=$ZDATE(starttime,3)
		}
		Set rs=##class(PXW.Xref.AnalysisQueries).GetByDateFunc(%NS,itemtype,itemk1,itemk2,flags,starttime)
	} Else {
		Set rs=##class(PXW.Xref.AnalysisQueries).GetFunc(%NS,itemtype,itemk1,itemk2,flags)
	}
	;s newflags=flags
	Write "<table filename='Analysis_"_itemk1_"'>"
	Write "		<thead>",!
	Write "			<tr>",!
	Write:showLU "				<th>Last Update</th>",!
	Write "				<th>Item Key1</th>",!
	Write "				<th>Item Key2</th>",!
	Write "				<th>Line Number</th>",!
	Write "				<th>Description</th>",!
	Write "			</tr>",!
	Write "		</thead>",!
	Write "		<tbody>",!
	Write "		",!  
	While rs.%Next() { 
		Write "<tr>"
		Write:showLU "<td>"_..EscapeHTML(rs.LastUpdate)_"</td>"
		; WHAT ABOUT XREF ON ROUTINES????
		If rs.ItemType="CLS" {
			Write "<td><a class="""_$$$classProgramName_""" href="""_##class(PXW.Tools.DEV.Class).HREFTo(rs.ItemKey1)_""">"_..EscapeHTML(rs.ItemKey1)_"</a></td>"
			Write "<td><a class="""_$$$classProgramLabel_""" href="""_##class(PXW.Tools.DEV.Class).HREFTo(rs.ItemKey1,rs.ItemKey2)_""">"_..EscapeHTML(rs.ItemKey2)_"</a></td>"
			Write "<td><a class="""_$$$classProgramLabel_""" href="""_##class(PXW.Tools.DEV.Class).HREFTo(rs.ItemKey1,rs.ItemKey2,rs.LineNumber)_""">"_..EscapeHTML(rs.LineNumber)_"</a></td>"
		} Else {
			Write "<td>"_..EscapeHTML(rs.ItemKey1)_"</td>"
			Write "<td>"_..EscapeHTML(rs.ItemKey2)_"</td>"
			Write "<td>"_..EscapeHTML(rs.LineNumber)_"</td>"
		} 
		Write "<td>"_..EscapeHTML(rs.Description)_"</td>"
		Write "</tr>",!
	}
	Write "</tbody></table>"
}

ClassMethod WriteNav()
{
	Write "<a href="""_##class(PXW.Tools.DEV.XrefBuild).HREFTo()_""">Build Xref/Analysis</a>"
	
	Do ..HREFFrom(.itemtype,.itemk1,.itemk2,.flags,.lastupdated)
	&html<
		<form action='PXW.Tools.DEV.Analyse.cls'>
			<fieldset>
				<legend id=PXWToolsDEVAnalyselegend>Code Analysis Results</legend>
				<input type=hidden name=IFRAME value='0'>
				<input type=hidden name='%NS' value='LOCAL_USER'>
				<table>					
					<tr><td width=25% class=prompt>ItemType</td>
					<td width=50%><input accesskey=A type=text name=IT value='#(itemtype)#'></td>
													</tr>
					<tr><td width=25% class=prompt>ItemKey1</td>
					<td width=50%><input type=text name=IK1 value='#(itemk1)#'></td>
													</tr>
					<tr><td width=25% class=prompt>ItemKey2</td>
					<td width=50%><input type=text name=IK2 value='#(itemk2)#'></td>
													</tr>
					<tr><td width=25% class=prompt>Flags</td>
					<td width=50%><input type=text name=F value='#(flags)#'></td>
													</tr>
					<tr><td width=25% class=prompt>Last Updated</td>
					<td width=50%><input type=text name=LU value='#(lastupdated)#'></td>
													</tr>
					<tr><td>&nbsp;</td><td><input type=submit></td>
													</tr>
					</table>
			</fieldset>
		</form>
	>
}

/// This shoud output some variables, getting the data from %request
ClassMethod HREFFrom(Output ItemType As %String, Output ItemKey1 As %String, Output ItemKey2 As %String, output Flags As %String,output LastUpdate as %String)
{
	Set ItemType=%request.Get("IT")
	Set ItemKey1=%request.Get("IK1")
	Set ItemKey2=%request.Get("IK2")
	Set Flags=%request.Get("F")
	Set LastUpdate=%request.Get("LU")
}

/// This should return a string of the href to this page based on the input parameters
ClassMethod HREFTo(ItemType As %String = "", ItemKey1 As %String = "", ItemKey2 As %String = "", Flags As %String = "",LastUpdate as %String="") As %String
{
	Set href=##super()
	Set sep="&"
	If ItemType'="" Set href=href_sep_"IT="_..EscapeURL(ItemType),sep="&"
	If ItemKey1'="" Set href=href_sep_"IK1="_..EscapeURL(ItemKey1),sep="&"
	If ItemKey2'="" Set href=href_sep_"IK2="_..EscapeURL(ItemKey2),sep="&"
	If Flags'="" Set href=href_sep_"F="_..EscapeURL(Flags),sep="&"
	If LastUpdate'="" Set href=href_sep_"LU="_..EscapeURL(LastUpdate),sep="&"
	Quit href
}

ClassMethod GetTitle() As %String
{
	Do ..HREFFrom(.itemtype,.itemk1,.itemk2)
	Quit "Analysis of "_itemtype_" "_itemk1_":"_itemk2
}

}
