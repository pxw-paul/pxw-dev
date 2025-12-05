Class PXW.Tools.DEV.Analyse Extends PXW.Tools.Page
{

Parameter ToolType = "Code";

ClassMethod WriteMainBody()
{
	Do ..HREFFrom(.itemtype,.itemk1,.itemk2,.flags)
	If itemk1="",itemk2="" {
		Write "Nothing to search for"
	} Else {
		Do ..WriteAnalysis(itemtype,itemk1,itemk2,flags)
	}
}

ClassMethod WriteAnalysis(itemtype As %String, itemk1 As %String, itemk2 As %String, flags As %String)
{

	Set rs=##class(PXW.Xref.AnalysisQueries).GetFunc(%NS,itemtype,itemk1,itemk2,flags)
	;s newflags=flags
	Write "<table filename='Analysis_"_itemk1_"'>"
	Write "		<thead>",!
	Write "			<tr>",!
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
		; WHAT ABOUT XREF ON ROUTINES????
		If rs.ItemType="CLS" {
			Write "<td><a class='"_$$$classProgramName_"' href='"_##class(PXW.Tools.DEV.Class).HREFTo(rs.ItemKey1)_"'>"_..EscapeHTML(rs.ItemKey1)_"</a></td>"
			Write "<td><a class="_$$$classProgramLabel_" href='"_##class(PXW.Tools.DEV.Class).HREFTo(rs.ItemKey1,rs.ItemKey2)_"'>"_..EscapeHTML(rs.ItemKey2)_"</a></td>"
			Write "<td><a class="_$$$classProgramLabel_" href='"_##class(PXW.Tools.DEV.Class).HREFTo(rs.ItemKey1,rs.ItemKey2,rs.LineNumber)_"'>"_..EscapeHTML(rs.LineNumber)_"</a></td>"
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
	Write "<a href='"_##class(PXW.Tools.DEV.XrefBuild).HREFTo()_"'>Build Xref/Analysis</a>"
}

/// This shoud output some variables, getting the data from %request
ClassMethod HREFFrom(Output ItemType As %String, Output ItemKey1 As %String, Output ItemKey2 As %String, Flags As %String)
{
	Set ItemType=%request.Get("IT")
	Set ItemKey1=%request.Get("IK1")
	Set ItemKey2=%request.Get("IK2")
	Set Flags=%request.Get("F")
}

/// This should return a string of the href to this page based on the input parameters
ClassMethod HREFTo(ItemType As %String = "", ItemKey1 As %String = "", ItemKey2 As %String = "", Flags As %String = "") As %String
{
	Set href=##super()
	Set sep="&"
	If ItemType'="" Set href=href_sep_"IT="_..EscapeURL(ItemType),sep="&"
	If ItemKey1'="" Set href=href_sep_"IK1="_..EscapeURL(ItemKey1),sep="&"
	If ItemKey2'="" Set href=href_sep_"IK2="_..EscapeURL(ItemKey2),sep="&"
	If Flags'="" Set href=href_sep_"F="_..EscapeURL(Flags),sep="&"
	Quit href
}

ClassMethod GetTitle() As %String
{
	Do ..HREFFrom(.itemtype,.itemk1,.itemk2)
	Quit "Analysis of "_itemtype_" "_itemk1_":"_itemk2
}

}
