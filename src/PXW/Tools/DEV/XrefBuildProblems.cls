Class PXW.Tools.DEV.XrefBuildProblems Extends PXW.Tools.Page
{

Parameter ToolName = "Xref Build Problems";

/// ID, BuildStatus, ItemKey1, ItemType, LastUpdate, NameSpace
ClassMethod WriteMainBody()
{
	;d ..HREFFrom()

	Set rs=##class(PXW.Xref.Queries).BuildProblemsFunc(%NS)
	;w "<pre>" zw rs w "</pre>"
	Write "<table filename='XREF_probems'>"
		&html<
		<thead>
			<tr>
                <th>Item Type</th>
				<th>Item Key1</th>
				<th>Last Update</th>
				<th>Build Status</th>
			</tr>
		</thead>
		<tbody>
		>
	While rs.%Next() {
		Write "<tr>"
		Write "<td class=''>"_..EscapeHTML(rs.ItemType)_"</td>"
		Write "<td>"
			set page=##class(PXW.Tools.DEV.CodeDisplayPage).GetPageClass(rs.ItemType)
			If page'="" {
				Write "<a class="_$$$classProgramLabel_" href="""_$CLASSMETHOD(page,"HREFToK123",rs.ItemKey1)_""">"
				Write ..EscapeHTML(rs.ItemKey1)
				Write "</a>"
			}  Else {
				Write ..EscapeHTML(rs.ItemKey1)
			} 
		Write "</td>"
		Write "<td>"_..EscapeHTML(rs.LastUpdate)_"</td>"
		Set txt=$SYSTEM.Status.GetErrorText(rs.BuildStatus)
        Write "<td>"_..EscapeHTML(txt)_"</td>"
		Write "</tr>",!
	}
	Write "</tbody></table>"
}

/// Output 1 Anchor tag for each option in the navigation. Use the scratch variable for anything you want to get from BODY
ClassMethod WriteNav(ByRef scratch)
{
	Write "<a href="""_##class(PXW.Tools.DEV.XrefBuild).HREFTo()_""">Build Xref</a>"
}

/// This should return a string of the href to this page based on the input parameters
ClassMethod HREFTo(NameSpace As %String) As %String
{
    ; note that NameSpace is always %NS
	Quit ##super()
}

}
