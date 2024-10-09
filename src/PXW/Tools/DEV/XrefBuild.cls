Class PXW.Tools.DEV.XrefBuild Extends PXW.Tools.Page
{

/// d ##class(PXW.Tools.DEV.BuildAllXref).xrefPackage("eng")
ClassMethod xrefPackage(Package As %String, Force As %Boolean = 0, Background As %Boolean = 1) As %Status
{
	Set xrefer=##class(PXW.Xref.Build).%New()
	If Background {
        Job ##class(PXW.Xref.Build).XrefPackage(%NS,Package,"",Force,Background)
        Hang 1
        Write !,"Submitted to background."
        Set sc=$$$OK
    } Else {
        Set xrefer.output=##class(PXW.Tools.DEV.Xref.Output).%New()
	    Set sc=xrefer.doPackage(Package,Force)
    }
	Quit sc
}

ClassMethod WriteMainBody()
{
	Do ..HREFFrom(.package,.force,.background)
	&html<
	<fieldset>
		<form id=formRoutine action='PXW.Tools.DEV.XrefBuild.cls'>
			<input type=hidden name=IFRAME value='0'>
			<u>P</u>ackage 
			<input accesskey=P 
				title='Enter Package name'
			type=text id=inputPackage name=P ovalue='#(package)#' value='' size=10>
			Force <input type='checkbox' name="F" value=1 #($SELECT(force:"checked",1:""))#>
            Background <input type='checkbox' name="B" value=1 #($SELECT(background:"checked",1:""))#>
			<input type=hidden name="%NS" value='#(%NS)#'>
			<input type=submit value='Go'>
		</form>
	</fieldset>

	>

	If package'="" {
        If package="*" Set package=""
		Write "<pre>"
		Write "Clearing Cache" Do ##class(PXW.DEV.Dictionary.ClassDefinitionObject).ClearCache()
		Set sc=..xrefPackage(package,force,background)
		Do ..WriteStatus(sc)
		Write "</pre>"
	} 

    If background {
        Write "Showing status"
        Write "<pre>"
        Do ##class(PXW.Xref.BuildOutputJob).DisplayStatus()
        Write "</pre>"
    }
}

/// This shoud output some variables, getting the data from %request
ClassMethod HREFFrom(Output Package As %String, Output force As %Boolean, Output background As %Boolean)
{
	Set Package=%request.Get("P")
	Set force=+%request.Get("F")
    Set background=+%request.Get("B")
}

/// This should return a string of the href to this page based on the input parameters
/// Package will build the entire package
/// MethodId will build just the method
/// DEBUG - only makes sense when building a single method
ClassMethod HREFTo(Package As %String = "", Force As %Boolean = 0, Background As %Boolean = 1) As %String
{
	Set href=##super()
	Set sep="&"
	If Package'="" Set href=href_sep_"P="_..EscapeURL(Package),sep="&"
	If Force'="" Set href=href_sep_"F="_..EscapeURL(Force),sep="&"
	If Background'="" Set href=href_sep_"B="_..EscapeURL(Background),sep="&"
	Quit href
}

/// Output 1 Anchor tag for each option in the navigation. Use the scratch variable for anything you want to get from BODY
ClassMethod WriteNav(ByRef scratch)
{
	Write "<a href='"_##class(PXW.Tools.DEV.XrefBuildProblems).HREFTo("")_"'>Problems</a>"
}

}
