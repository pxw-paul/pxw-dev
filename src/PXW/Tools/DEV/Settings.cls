Class PXW.Tools.DEV.Settings Extends PXW.Tools.Page
{

/// use scratch to get anything you want to pass to the nav
ClassMethod WriteMainBody(ByRef scratch)
{
    &html<
        <p>This is a display only page. The settings cannot be modified here. Update the tables using an install program.
        <table>
            <thead>
                <tr><th>Type</th>
                    <th>Usage</th>
                    <th>Class</th>
                    <th>Namespace</th>
            </thead>
            <tbody>
        >
	    Set rs=..SelectFromIndexFunc()
        While rs.%Next() {
            Write "<tr>"
            Write "<td>"_rs.%Get("CodeType")_"</td>",!
            Write "<td>"_rs.%Get("Usage")_"</td>",!
            Write "<td><a class='CDEFClassName' href='"_##class(PXW.Tools.DEV.Class).HREFTo(rs.%Get("Class"))_"'>"_..EscapeHTML(rs.%Get("Class"))_"</a></td>",!
            Write "<td><a class='CDEFClassName' href='"_##class(PXW.Tools.DEV.ChangeNS).HREFTo(rs.%Get("Namespace"))_"'>"_..EscapeHTML(rs.%Get("Namespace"))_"</a></td>",!
            Write "</tr>"
        }
        &html<
            </tbody>
        </table>
    >
}

/// This should return a string of the href to this page based on the input parameters
ClassMethod HREFTo() As %String
{
    Quit ##super()
}

Query SelectFromIndex() As PXW.LIB.SQL.Query [ SqlProc ]
{
    SELECT ci.ID, ci.Class, ci.CodeType, ci.Usage ,interface.Namespace
    FROM PXW_DEV_Dictionary.CodeTypeIndex AS ci 
    LEFT OUTER JOIN PXW_DEV_Dictionary.CodeInterface AS interface ON interface.type=ci.CodeType AND ci.usage='CodeInterface'
    ORDER BY ci.CodeType
}

}
