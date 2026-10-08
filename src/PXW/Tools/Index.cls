Class PXW.Tools.Index Extends PXW.Tools.Page
{

/// Write out extra styles here, the STYLE tags are already in place.
/// <p>
/// Be careful with putting colours in here. You do not know how the colours will 
/// work with the current %STYLE selected by the user.
/// </p><p> 
/// You can put layout changing things here, EG if a page needs extra DIVs
/// the layout information can go here. 
/// </p>
ClassMethod WriteStyles()
{
	Write ".grid-container {",!
	Write "  display:grid;   grid-template-columns: repeat(auto-fill, minmax(500px, 1fr));;  grid-gap: 10px;  padding: 10px; ",!	
	Write "}",!
	Write ".grid-container fieldset { height:100%; }"
	Write ""
}

ClassMethod WriteMainBody()
{
	Set rs=##class(PXW.Tools.Queries).SelectToolsForNamespaceFunc(%NS)
	
	;Write "<div class='grid-container'>"
	Write "<div>"
	While rs.%Next() {
		Set name=rs.%Get("ClassName")
		Set type=rs.%Get("ToolType")
		Set toolname=rs.%Get("ToolName")
		Do ..WriteFormInSection(name,type,toolname)
	}
	Write "</div>"
}

/// This will write out the form based on the ClassName HREFTo method.
/// It pulls the defaults directly from the %request data.
ClassMethod WriteForm(ClassName As %String, Type As %String, ToolName As %String) as %Status
{
	Set HREFto=##class(%Dictionary.MethodDefinition).%OpenId(ClassName_"||HREFTo")
	Set legname=$TRANSLATE(ClassName,".","")_"legend"
	Set aname=$TRANSLATE(ClassName,".","")_"anchor"
	If HREFto="" Quit 1
	&html<
		<form action='#(ClassName)#.cls'>
			<fieldset>
				<legend id=#(legname)#>#(ToolName)#</legend>
				<input type=hidden name=IFRAME value='0'>
				<input type=hidden name='%NS' value='#($GET(%NS))#'>
				>
				Set FS=HREFto.FormalSpec
				Set accesskey="accesskey=A "
				For i=1:1:$LENGTH(FS,",") {
					Set VAR=$PIECE($PIECE(FS,",",i),":",1)
					Set TYP=$PIECE($PIECE(FS,",",i),":",2)
					Set DEF=$PIECE(TYP,"=",2),TYP=$PIECE(TYP,"=",1)
					; if this is not a default parameter name output it (this might be left over from a previous thing)
					If VAR'="",VAR'?1"P"1N {
						; the url code is normally the capital letters/numbers of the variable name,
						; if I find one thats not I will deal with this later
						Set VNAME=$TRANSLATE(VAR,"abcdefghijklmnopqrstuvwxyz")
						Set DEF=$TRANSLATE(DEF,"""")
						Set DEF=%request.Get(VNAME,DEF)
						Set iid=aname_VNAME
						&html<<p><label for=#(iid)#>#(VAR)#</label>>
						If TYP="%Boolean" {
							&html<<input id=#(iid)# type=checkbox name=#(VNAME)# value=1 #($SELECT(DEF=1:"checked",1:""))#>>
						} Else {
							&html<<input id=#(iid)# type=text #(accesskey)# name=#(VNAME)# value='#(DEF)#'>>
						}
						&html<</p>>
						Set accesskey=""
					} Else {
						;WRITE "else VAR="_VAR
					}
				}
				&html<<input type=submit>
			</fieldset>
		</form>
	>
	Quit $$$OK
}
/// This is a quick way of dumping out a form from the spec of the method HREFTo.
/// Its following the convention that Capital letters of the parameter will
/// be used as the name of the parameter in the URL.
/// Doing it this way for speed of development.
ClassMethod WriteFormInSection(ClassName As %String, Type As %String, ToolName As %String) As %Status
{

	; if there is no HREFto method then we cannot link to this.
	Set HREFto=##class(%Dictionary.MethodDefinition).%OpenId(ClassName_"||HREFTo")
	If HREFto="" Quit 1
	Set css="toolTypeInternal"
	If $$$UPPER(Type)="CODE" Set css="toolTypeCode"	
	If ToolName'="" {
		Set aname=$TRANSLATE(ClassName,".","")_"anchor"
		Set legname=$TRANSLATE(ClassName,".","")_"legend"
		&html<
		<details id="#(aname)#" class=#(css)#>
			<summary>#(ToolName)#</summary>
		>
		Write "<span style=""display:inline-block"">" 
			Do ..WriteForm(ClassName,Type,ToolName) 
		Write "</span>"
		Write "<span style=""valign:top; display:inline-block"">" 
			If HREFto.Description'="" Write HREFto.Description
		Write "</span>"
		
		&html<</details>>
	}
	Quit 1
}

ClassMethod WriteNav()
{
	#dim rs as %SQL.StatementResult

	Set rs=##class(PXW.Tools.Queries).SelectToolsForNamespaceFunc(%NS)
	
	While rs.%Next() {
		Set name=rs.%Get("ClassName")
		;Set type=rs.%Get("ToolType")
		Set toolname=rs.%Get("ToolName")
		
		If toolname'="" {
			Write "<a href="""_$CLASSMETHOD(name,"HREFTo")_""">"_..EscapeHTML(toolname)_"</a>"
		}
	}
}

ClassMethod GetTitle() As %String
{
	Quit "All tools"
}

}
