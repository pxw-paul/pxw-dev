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
	Do ..HREFFrom(.itemtype,.itemk1,.itemk2,.type,.lastupdate)
	If itemk1="",itemk2="",type="",lastupdate="" {
		Write "Showing what has been updated recently"
		Set lastupdate="T-1"
	} 
	Do ..WriteAnalysis(itemtype,itemk1,itemk2,type,lastupdate)
	
}

ClassMethod WriteAnalysis(itemtype As %String, itemk1 As %String, itemk2 As %String, type As %String,LastUpdate as %String)
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
		;zw %NS,itemtype,itemk1,itemk2,type,starttime,LastUpdate
		Set rs=##class(PXW.Xref.AnalysisQueries).GetByDateFunc(%NS,itemtype,itemk1,itemk2,type,starttime)
	} Else {
		;s starttime="dddd"
		;zw %NS,itemtype,itemk1,itemk2,type,starttime
		Set rs=##class(PXW.Xref.AnalysisQueries).GetFunc(%NS,itemtype,itemk1,itemk2,type)
	}
	;s newflags=flags
	Write "<table filename='Analysis_"_itemk1_"'>"
	Write "		<thead>",!
	Write "			<tr>",!
	Write:showLU "				<th>Last Update</th>",!
	Write "				<th>Item Key1</th>",!
	Write "				<th>Item Key2</th>",!
	Write "				<th>Line Number</th>",!
	Write "				<th>Type</th>",!
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
		Write "<td>"_..EscapeHTML(rs.Type)_"</td>"
		Write "<td>"_..EscapeHTML(rs.Description)_"</td>"
		Write "</tr>",!
	}
	Write "</tbody></table>"
}

ClassMethod WriteNav()
{
	Write "<a href="""_##class(PXW.Tools.DEV.XrefBuild).HREFTo()_""">Build Xref/Analysis</a>"
	
	d ##class(PXW.Tools.Index).WriteForm(..%ClassName(1),..#ToolType,..#ToolName)
}

/// This shoud output some variables, getting the data from %request
ClassMethod HREFFrom(Output ItemType As %String, Output ItemKey1 As %String, Output ItemKey2 As %String, output Type As %String,output LastUpdate as %String)
{
	Set ItemType=%request.Get("IT")
	Set ItemKey1=%request.Get("IK1")
	Set ItemKey2=%request.Get("IK2")
	Set Type=%request.Get("T")
	Set LastUpdate=%request.Get("LU")
}

/// <p>
/// Show the analysis warnings found during analysis of the code. The analysis happens during the Xref Build.
/// </p>
/// <dl>
/// 	<dt>ItemType</dt>	<dd>What type of items to view (CLS, GBL, INT etc).</dd>
/// 	<dt>ItemKey1</dt>	<dd>Name of items to view, eg classname (wildcard *).</dd>
/// 	<dt>ItemKey2</dt>	<dd>Name of sub item to look for, eg method name (wildcard *).</dd>
/// 	<dt>Type</dt>		<dd>Type of analysis warnings to display (VTYPE etc) (wildcard *).</dd>
/// 	<dt>LastUpdate</dt>	<dd>Show only recent items updated by entering a date. T-n allowed.</dd>
/// </dl>
ClassMethod HREFTo(ItemType As %String = "", ItemKey1 As %String = "", ItemKey2 As %String = "", Type As %String = "",LastUpdate as %String="") As %String
{
	Set href=##super()
	Set sep="&"
	If ItemType'="" Set href=href_sep_"IT="_..EscapeURL(ItemType),sep="&"
	If ItemKey1'="" Set href=href_sep_"IK1="_..EscapeURL(ItemKey1),sep="&"
	If ItemKey2'="" Set href=href_sep_"IK2="_..EscapeURL(ItemKey2),sep="&"
	If Type'="" Set href=href_sep_"T="_..EscapeURL(Type),sep="&"
	If LastUpdate'="" Set href=href_sep_"LU="_..EscapeURL(LastUpdate),sep="&"
	Quit href
}

ClassMethod GetTitle() As %String
{
	Do ..HREFFrom(.itemtype,.itemk1,.itemk2,,.lastupdate)
	set title="Analysis of "_itemtype_" "_itemk1_":"_itemk2
	If itemk1="",itemk2="",lastupdate="" {
		set title="Showing recently updated"
	}
	Quit title
}

}
