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
			Set page=##class(PXW.Tools.DEV.CodeDisplayPage).GetPageClass(rs.ItemType)
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
		write "<td><details>"
        Write "<summary>"_..EscapeHTML(txt)_"</summary>"
		do ..WriteStatus(rs.BuildStatus)
		write "</details></td>"
		Write "</tr>",!
	}
	Write "</tbody></table>"
}

/// Output 1 Anchor tag for each option in the navigation. Use the scratch variable for anything you want to get from BODY
ClassMethod WriteNav(ByRef scratch)
{
	Write "<a href="""_##class(PXW.Tools.DEV.XrefBuild).HREFTo()_""">Build Xref</a>"
}

/// <p>
/// Show all the problems found during Xref build.
/// </p>
/// <p>
/// The problems could be either: 
/// <ul><li>Errors in the build process i.e. a bug.</a>
/// 	<li>Problems found during the parsing. This could be a bug in the parser
/// 		or an actual problem in the code being parsed.
/// 	</li>
///	</ul>
/// </p>
/// <dl>
///     <dt>NameSpace</dt>
///     <dd>Namespace to display the for.</dd>
/// </dl>
ClassMethod HREFTo(NameSpace As %String) As %String
{
	; this bit of code is all over the place, big mistake; using floater variable for namespace
	Set ons=%NS
	New %NS
	Set %NS=$SELECT($g(NameSpace)'="":NameSpace,1:ons)
    ; note that NameSpace is always %NS
	Quit ##super()
}

}
