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
    Write "<thead><tr><th>Name</th><th>Address</th><th>NameSpace</th></thead>"
    Write "<tbody>"
	While rs.Next() {
		Set name=rs.Data("ServerName")
        Set address=rs.Data("ServerAddress")
        Set ns=rs.Data("Namespace")
        Write "<tr>"
        Write "<td><a href='"_..HREFTo(name)_"'>"_..EscapeHTML(name)_$SELECT(name=%NS:"*",1:"")_"</a></td>"
        Write "<td>"_..EscapeHTML(address)_"</td>"
        Write "<td>"_..EscapeHTML(ns)_"</td>"
        Write "</tr>"
	}
    Write "</tbody></table>"
}

/// This should return a string of the href to this page based on the input parameters
ClassMethod HREFTo(NewServer As %String) As %String
{
	Quit ..%ClassName(1)_".cls?%NS="_..EscapeURL(NewServer)
}

Query SelectNS() As %SQLQuery
{
    SELECT ServerName,ServerAddress,NameSpace FROM PXW_DEV_Dictionary.AtelierSettings
}

}
