Class PXW.Tools.DEV.ChangeNS Extends PXW.Tools.Page
{

Parameter ToolName = "Change Namespace";

/// Calling page is passed in so you can decide what to display on the form/if anything.
ClassMethod WriteHeadForm(Page As %String)
{
    Set class=$SELECT($GET(%NS)'=$GET(%NSORIGINAL):" class='hilite'",1:"")
    &html<
        <form id=toolsFormHome action='PXW.Tools.DEV.ChangeNS.cls'>
            <fieldset id=toolsChangeNS>
                <legend>Namespace</legend>
                <input type=hidden name=%NS value='#(%NS)#'>
                <input #(class)# type=submit value='#(%NS)#'>
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
        Set types=rs.%Get("Types")
        Set selected=$SELECT(name=%NS:1,1:0)
        Write "<tr"_$SELECT(selected:" class='"_$$$classHiliteRow_"'",1:"")_">"
        Write "<td><a href="""_..HREFTo(name)_""">"_..EscapeHTML(name)_$SELECT(selected:"*",1:"")_"</a></td>"
        Write "<td>"_..EscapeHTML(desc)_"</td>"
        Write "<td>"_..EscapeHTML(types)_"</td>"
        Write "</tr>"
	}
    Write "</tbody></table>"
}

/// Output 1 Anchor tag for each option in the navigation. 
/// Use the scratch variable for anything you want to get from BODY.
ClassMethod WriteNav(ByRef scratch)
{
	Do ##class(PXW.Tools.Index).WriteNav()
}

ClassMethod HREFTo(NewServer As %String) As %String
{
    Set:$DATA(%NS) ons=%NS
    Set:$DATA(%NSORIGINAL) onso=%NSORIGINAL
    New %NS,%NSORIGINAL
    Set %NS=$SELECT($GET(NewServer)'="":NewServer,$DATA(ons):ons,1:"")
    Set %NSORIGINAL=$SELECT($DATA(ons):ons,1:onso)
    ;set NewServer=$G(NewServer,$G(%NS))
	;Quit ..%ClassName(1)_".cls?%NS="_..EscapeURL(NewServer)
    Quit ##super()
}

}
