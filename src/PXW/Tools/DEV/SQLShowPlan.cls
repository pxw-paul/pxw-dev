Class PXW.Tools.DEV.SQLShowPlan Extends PXW.Tools.PageTLR
{

ClassMethod WriteMainTop(ByRef scratch)
{
    do ..HREFFrom(.SQL)
    &html<<form > 
        <fieldset>
        <input name='%NS' value='#(%NS)#' type=hidden>
        <table style='width:100%'>
            <tr><td>SQL</td><td><textarea spellcheck="false" style='width:100%' name='SQL' rows=20>#(SQL)#</textarea></td></tr>
            <tr><td>&nbsp;</td><td><input type=submit value='Show Plan'></td></tr>
        </table>
        </fieldset>
        </form>
    >
}

ClassMethod WriteMainLeft(ByRef scratch)
{
    do ..HREFFrom(.SQL)
    Write "<pre>" 
    Try {
        Do:SQL'="" ..WriteSQL(SQL,0)
    } Catch e {
        Do ..WriteStatus(e.AsStatus())
    }
    Write "</pre>"
}

ClassMethod GetMainLeftTitle() As %String
{
    quit "SQL"
}

ClassMethod WriteMainRight(ByRef scratch)
{
    do ..HREFFrom(.SQL)
    Try {
        Do:SQL'="" ..WriteSQLPlan(SQL,.scratch)
    } Catch e {
        Do ..WriteStatus(e.AsStatus())
    }
}

ClassMethod GetMainRightTitle() As %String
{
    quit "Plan"
}

ClassMethod WriteSQLPlan(sql As %String, Output modules)
{
	#dim interface as PXW.DEV.Dictionary.ClassDefinitionObject
	; enquote quotes
	Set sqlencode=sql
	Set plansql="SELECT %SYSTEM.QUERY_PLAN(?) as XML "
    ;s plansql="EXPLAIN "_sql
	Set params($INCREMENT(params))=sqlencode
    Set interface=##class(PXW.DEV.Dictionary.ClassDefinitionObject).OpenNamespace(%NS)
	Set qsc=##class(PXW.DEV.Dictionary.AtelierClient).query(interface.AtelierSettings.ServerName,plansql,.obj,params...)
    If $$$ISERR(qsc) {
        Do ..WriteStatus(qsc)
        Quit
    }
	;w "<pre>"
	;zw obj
	Set rs=##class(PXW.DEV.Dictionary.AtelierRS).%New(obj)
	;zw rs
	While rs.%Next() {
		Set xml=rs.%Get("XML")
        ;s xml=rs.%Get("Plan")
        Set xml=$REPLACE(xml,$CHAR(13,10),$CHAR(13))
		;w "<pre>"_$ZCONVERT(xml,"O","HTML")_"</pre>"
		Set parser=##class(PXW.DEV.BNF.Run.SQLShowPlan).%New()
		Set parser.stream=##class(PXW.DEV.InputStream).NewString(xml)
		Set element=##class(PXW.DEV.Element).%New()
		New %path Set %path=""
		If parser.Plans(element) {
			;d element.write()
			Set output=##class(PXW.Tools.DEV.HTML.SQLShowPlan).%New()
			Set output.ClassServer=##class(PXW.DEV.Dictionary.ClassDefinitionObject).OpenNamespace(%NS)	
			If $DATA(%path) Set output.showPaths=1
			Set output.ThisType="CLS" ; behave like a class until we want to analyse in a different way
			Do output.writeElement(element)
            Merge modules=output.modules
		} Else {
            Write !,"NOT PARSED"
        }
	}
	;w "</pre>"
}

ClassMethod WriteSQL(sql As %String, hiliteLine As %Integer)
{
	Set parser=##class(PXW.DEV.BNF.Run.SQL).%New()
	Set parser.stream=##class(PXW.DEV.InputStream).NewString(sql)
	Set Element=##class(PXW.DEV.Element).%New()
	Set parsed=parser.SqlProgram(Element)
	; if its all on a single line then format it
	;i sql'[parser.stream.eolChar {
    If parsed {
		Set formatter=##class(PXW.DEV.BNF.Format.SQL).%New()
		Do formatter.formatElement(Element)
	}
	Write "<pre class='EmbeddedSQL'>"
	Set output=##class(PXW.Tools.DEV.HTML.SQLShowPlan).%New()
	Set output.ClassServer=##class(PXW.DEV.Dictionary.ClassDefinitionObject).OpenNamespace(%NS)	
	Set output.HiLiteLine=hiliteLine
	Set output.ThisType="CLS" ; behave like a class until we want to analyse in a different way
	Do output.begin()
    Do output.writeElement(Element)
    Do output.end()
    Write "</pre>"
}

/// Output 1 Anchor tag for each option in the navigation. Use the scratch variable for anything you want to get from BODY
ClassMethod WriteNav(ByRef scratch)
{
    Set aname=""
    For {
	    Set aname=$ORDER(scratch(aname))
        Quit:aname=""

        Write "<a href='#"_aname_"'>"_aname_"</a>"
    }
}

/// Write out extra styles here, the STYLE tags are already in place
ClassMethod WriteStyles()
{
    do ##super()
	Do ##class(PXW.Tools.DEV.Class).WriteStyles()
    Write "div.EmbeddedSQLcontainer { display:inline-block; vertical-align:top;}",!
    Write "pre.EmbeddedSQLSub { border:1px solid var(--borderNormal); margin-left:40px; }",!
    Write "p.newline { padding-left:20px; text-indent: -20px; }",!
    
    ; not working
    ;w "p.newline:nth-child(odd) { background-color: var(--bgAlternate1); color: var(--fgNormal); }",!
}

ClassMethod WriteScripts()
{
	Do ##class(PXW.Tools.DEV.Class).WriteScripts()
}

ClassMethod HREFTo(SQL As %String) As %String
{
    Set href=##super()
    Set:$GET(SQL)'="" href=href_"&SQL="_..EscapeURL(SQL)
    Quit href
}

/// This shoud output some variables, getting the data from %request
ClassMethod HREFFrom(Output SQL As %String)
{
	Set SQL=%request.Get("SQL")
}

}
