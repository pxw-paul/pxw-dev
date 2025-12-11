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
	If ##class(PXW.Xref.Build).DailyBuild(%NS) {
		Write "Backgroung build of Xref data has started. <a href="""_##class(PXW.Tools.DEV.XrefBuild).HREFTo()_""">Check progress</a>"
	}
	
	Set rs=##class(%ResultSet).%New("%Library.ClassDefinition:SubclassOf")
	$$$THROWONERROR(sc,rs.Execute(##class(PXW.Tools.Page).%ClassName(1)))
	
	Write "<div class='grid-container'>"
	While rs.Next() {
		Set name=rs.Data("Name")
		Do ..WriteForm(name)
	}
	Write "</div>"
}

ClassMethod WriteNav()
{
	Set rs=##class(%ResultSet).%New("%Dictionary.ClassDefinition:SubclassOf")
	$$$THROWONERROR(sc,rs.Execute(##class(PXW.Tools.Page).%ClassName(1)))
	
	While rs.Next() {
		Set name=rs.Data("Name")
		Set HREFto=##class(%Dictionary.MethodDefinition).%OpenId(name_"||HREFTo")
		If HREFto { 
			Set type=$PARAMETER(name,"ToolType")
			Set css="toolTypeInternal"
			If $$$UPPER(type)="CODE" Set css="toolTypeCode"
			Set toolname=$PARAMETER(name,"ToolName")
			if toolname'="" {
				;If toolname="" Set toolname=name
				Set aname=$TRANSLATE(name,".","")_"anchor"
				Set legname=$TRANSLATE(name,".","")_"legend"
				Write "<a onclick='HiliteElement("""_legname_""");' class='"_css_"' href=#"_$TRANSLATE(aname,".","")_">"_..EscapeHTML(toolname)_"</a>"
			}
		}
	}
}

/// This is a quick way of dumping out a form from the spec of the method HREFTo.
/// Its following the convention that Capital letters of the parameter will
/// be used as the name of the parameter in the URL.
/// Doing it this way for speed of development.
ClassMethod WriteForm(ClassName As %String) As %Status
{

	; if there is no HREFto method then we cannot link to this.
	Set HREFto=##class(%Dictionary.MethodDefinition).%OpenId(ClassName_"||HREFTo")
	If HREFto="" Quit 1
	Set type=$PARAMETER(ClassName,"ToolType")
	Set css="toolTypeInternal"
	If $$$UPPER(type)="CODE" Set css="toolTypeCode"	
	Set toolname=$PARAMETER(ClassName,"ToolName")
	If toolname'="" {
		If toolname="" Set toolname=ClassName
		Set aname=$TRANSLATE(ClassName,".","")_"anchor"
		Set legname=$TRANSLATE(ClassName,".","")_"legend"
		&html<
		<div id="#(aname)#" class=#(css)#>
			<form action='#(ClassName)#.cls'>
				<fieldset>
					<legend id=#(legname)#>#(toolname)#</legend>
					<input type=hidden name=IFRAME value='0'>
					<input type=hidden name='%NS' value='#($GET(%NS))#'>
					<table>
					>
					Set FS=HREFto.FormalSpec
					For i=1:1:$LENGTH(FS,",") {
						Set VAR=$PIECE($PIECE(FS,",",i),":",1)
						Set TYP=$PIECE($PIECE(FS,",",i),":",2)
						Set DEF=$PIECE(TYP,"=",2),TYP=$PIECE(TYP,"=",1)
						; if this is not a default parameter name output it
						If VAR'?1"P"1N {
							; the url code is normally the capital letters/numbers of the variable name,
							; if I find one thats not I will deal with this later
							Set VNAME=$TRANSLATE(VAR,"abcdefghijklmnopqrstuvwxyz")
							Set DEF=$TRANSLATE(DEF,"""")
							&html<<tr><td width=25% class=prompt>#(VAR)#</td>>
							If TYP="%Boolean" {
								&html<<td width=25%><input type=checkbox name=#(VNAME)# value=1 #($SELECT(DEF=1:"checked",1:""))#></td>>
							} Else {
								&html<<td width=25%><input type=text name=#(VNAME)# value='#(DEF)#'></td>>
							}
							&html<<td width=25%>#(TYP)#</td>
								</tr>>
						}
					}
					Set DESC=HREFto.Description
					; get the stuff between <dl> and </dl>
					Set DESC=$PIECE($PIECE(DESC,"<dl>",2),"</dl>",1)
					
					&html<<tr><td>&nbsp;</td><td><input type=submit></td><td>&nbsp;</td></tr>
						</table>
				</fieldset>
			</form>
		</div>
		>
	}
	Quit 1
}

ClassMethod GetTitle() As %String
{
	Quit "All tools"
}

}
