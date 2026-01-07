Class PXW.Tools.DEV.ChangeNS Extends PXW.Tools.Page
{

Parameter ToolName = "Change Namespace";

/// Calling page is passed in so you can decide what to display on the form/if anything.
ClassMethod WriteHeadForm(Page As %String)
{
    &html<
        <form id=toolsFormHome action='PXW.Tools.DEV.ChangeNS.cls'>
            <fieldset id=toolsChangeNS>
                <legend>Namespace</legend>
                <input type=hidden name=%NS value='#(%NS)#'>
                <input type=submit value='#(%NS)#'>
            </fieldset>
        </form>
    >
}

ClassMethod WriteMainBody()
{

	Set rs=##class(PXW.Tools.Queries).SelectNsTypesFunc()

    Write "<table>"
    Write "<thead><tr><th>Name</th><th>Description</th><th>Types</th></thead>"
    Write "<tbody>"
	While rs.%Next() {
		Set name=rs.%Get("Name")
        Set desc=rs.%Get("Description")
        set types=rs.%Get("Types")
        set selected=$SELECT(name=%NS:1,1:0)
        Write "<tr"_$s(selected:" class='"_$$$classHiliteRow_"'",1:"")_">"
        Write "<td><a href="""_..HREFTo(name)_""">"_..EscapeHTML(name)_$s(selected:"*",1:"")_"</a></td>"
        Write "<td>"_..EscapeHTML(desc)_"</td>"
        Write "<td>"_..EscapeHTML(types)_"</td>"
        Write "</tr>"
	}
    Write "</tbody></table>"
}

ClassMethod HREFTo(NewServer As %String) As %String
{
    set NewServer=$G(NewServer,$G(%NS))
	Quit ..%ClassName(1)_".cls?%NS="_..EscapeURL(NewServer)
}

}
