Class PXW.Tools.DEV.ChangeNS Extends PXW.Tools.Page
{

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

	Set rs=##class(%ResultSet).%New(..%ClassName(1)_":SelectNS")
	$$$THROWONERROR(sc,rs.Execute())

    Write "<table>"
    Write "<thead><tr><th>Name</th><th>Description</th></thead>"
    Write "<tbody>"
	While rs.Next() {
		Set name=rs.Data("Name")
        Set desc=rs.Data("Description")
        set selected=$SELECT(name=%NS:1,1:0)
        Write "<tr"_$s(selected:" class='"_$$$classHiliteRow_"'",1:"")_">"
        Write "<td><a href='"_..HREFTo(name)_"'>"_..EscapeHTML(name)_$s(selected:"*",1:"")_"</a></td>"
        Write "<td>"_..EscapeHTML(desc)_"</td>"
        Write "</tr>"
	}
    Write "</tbody></table>"
}

ClassMethod HREFTo(NewServer As %String) As %String
{
    set NewServer=$G(NewServer,$G(%NS))
	Quit ..%ClassName(1)_".cls?%NS="_..EscapeURL(NewServer)
}

/// This should return a string of the href to this page based on the input parameters
Query SelectNS() As %SQLQuery
{
    SELECT Name,Description FROM PXW_DEV_Dictionary.Namespace
}

}
