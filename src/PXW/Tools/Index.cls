Class PXW.Tools.Index Extends PXW.Tools.Page
{

ClassMethod WriteMainBody()
{
	Do ##class(PXW.Xref.Build).DailyBuild(%NS)
	
	Set rs=##class(%ResultSet).%New("%Library.ClassDefinition:SubclassOf")
	$$$THROWONERROR(sc,rs.Execute(##class(PXW.Tools.Page).%ClassName(1)))
	
	While rs.Next() {
		Set name=rs.Data("Name")
		Do ..WriteForm(name)
	}
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
			Set aname=$TRANSLATE(name,".","")_"anchor"
			Set legname=$TRANSLATE(name,".","")_"legend"
			Write "<a onclick='HiliteElement("""_legname_""");' class='"_css_"' href=#"_$TRANSLATE(aname,".","")_">"_name_"</a>"
		}
	}
}

/// This is a quick way of dumping out a form from the spec of the method HREFto
/// What really needs to happen is each tool has a proper definition of the fields it requires.
/// Possibly even just a method called WriteForm that dumps the form. Note that DEV.PXW.Tools kind of has this
/// capability already, its just unused!
/// Doing it this way for speed of development.
ClassMethod WriteForm(ClassName As %String) As %Status
{

	; if there is no HREFto method then we cannot link to this.
	Set HREFto=##class(%Dictionary.MethodDefinition).%OpenId(ClassName_"||HREFTo")
	If HREFto="" Quit 1
	Set type=$PARAMETER(ClassName,"ToolType")
	Set css="toolTypeInternal"
	If $$$UPPER(type)="CODE" Set css="toolTypeCode"	
	Set aname=$TRANSLATE(ClassName,".","")_"anchor"
	Set legname=$TRANSLATE(ClassName,".","")_"legend"
	&html<
	<div id="#(aname)#" class=#(css)#>
		<form action='#(ClassName)#.cls'>
			<fieldset>
				<legend id=#(legname)#>#(ClassName)#</legend>
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
	Quit 1
}

ClassMethod GetTitle() As %String
{
	Quit "All tools"
}

}
