/// Redirects to the correct viewer based on the type of code to be viewed
Class PXW.Tools.DEV.Code Extends PXW.Tools.Page
{

ClassMethod WriteMainBody(ByRef scratch)
{
	Do ..HREFFrom(.CodeReference)

    Set type=$PIECE(CodeReference,".",*)
    ; most likely being used to view m code?
    If type="" Set type="INT",CodeReference=CodeReference_".INT"
    Set utype=$$$UPPER(type)
    If utype="CLS" {
        Set cls=$PIECE(CodeReference,".",1,*-1)
    	If cls["*" Do ##class(PXW.Tools.DEV.Class).WriteClassDir(cls) Quit
        Do ##class(PXW.Tools.DEV.Class).WriteClass(cls,"","","",.scratch)
    } ElseIf utype="INT" {
        Set rtn=$PIECE(CodeReference,".",1,*-1)
        If rtn["*" Do ##class(PXW.Tools.DEV.Routine).WriteRoutineDir(rtn) Quit
        Set rtn=$PIECE(CodeReference,".",1,*-1)
        Do ##class(PXW.Tools.DEV.Routine).WriteRoutine(rtn)
    } ElseIf utype="INC" {
        Set inc=$PIECE(CodeReference,".",1,*-1)
        If inc["*" Do ##class(PXW.Tools.DEV.Include).WriteIncludeDir(inc) Quit
        Set inc=$PIECE(CodeReference,".",1,*-1)
        Do ##class(PXW.Tools.DEV.Include).WriteInclude(rtn)
    } Else {
        Write !,"UNKNOWN TYPE ("_type_") "_CodeReference,!
        Write "try "
        Write "<ul>"
        Write "<li><a href='"_..HREFTo(CodeReference_".CLS")_"'>"_..EscapeHTML(CodeReference_".CLS")_"</a></li>"
        Write "<li><a href='"_..HREFTo(CodeReference_".INT")_"'>"_..EscapeHTML(CodeReference_".INT")_"</a></li>"
        Write "<li><a href='"_..HREFTo(CodeReference_".INC")_"'>"_..EscapeHTML(CodeReference_".INC")_"</a></li>"
        Write "</ul>"
    }
	Quit
}

ClassMethod WriteHeadForm(Page As %String)
{
    Set CR=""
    If Page=..%ClassName(1) {
        Do ..HREFFrom(.CR)
    } ElseIf Page="PXW.Tools.DEV.Class" {
        Do ##class(PXW.Tools.DEV.Class).HREFFrom(.CR)
        Set CR=$PIECE(CR,".",1,*-1)
        If CR'="" Set CR=CR_".*"
    }
   &html<
    <form id=toolsFormCodeReference action='PXW.Tools.DEV.Code.cls'>
					<fieldset id=toolsCodeReference>
						<legend>Code reference</legend>
						<input type=hidden name=IFRAME value='0'>
						<input type=hidden name=%NS value='#(%NS)#'>
						<input accesskey=R placeholder="Class.Name.cls" size=20
							title='Enter Code Reference:#($CHAR(10))#routine.INT, package.name.CLS'
						type=text id=toolInputCodeReference name=CR value='#(CR)#' size=10>
						<input type=submit value='Go'>
					</fieldset>
				</form>
    >
}

ClassMethod HREFFrom(Output CodeReference As %String)
{
	#define ReqGet(%name) %request.Get(%name)
	Set CodeReference=$$$ReqGet("CR")
}

ClassMethod HREFTo(CodeReference As %String) As %String
{
	If $DATA(%NS) Set ons=%NS
	Set href=##super()
	If $DATA(ons) Set %NS=ons
	Set sep="&"
	Set href=href_sep_"CR="_..EscapeURL(CodeReference),sep="&"
	Quit href
}

}
