Class PXW.Tools.DEV.SQLShowPlan Extends PXW.Tools.PageTLR
{

Parameter ToolName = "SQL Show Plan";

Parameter ToolRelatesToCodeType = "CLS";

ClassMethod WriteMainTop(ByRef scratch)
{
    Do ..HREFFrom(.SQL,.routine)
    &html<<form action='PXW.Tools.DEV.SQLShowPlan.cls' method='POST'> 
        <fieldset>
        <input name='%NS' value='#(%NS)#' type=hidden>
        <table style='width:100%'>
            <tr><td>SQL</td><td><textarea id='SQLTextArea' autofocus spellcheck="false" style='width:100%' name='SQL' rows=20>#(SQL)#</textarea></td></tr>
            <tr><td>&nbsp;</td><td><input type=submit value='Show Plan'></td></tr>
        </table>
        </fieldset>
        </form>
    >
}

ClassMethod WriteMainLeft(ByRef scratch)
{
    Do ..HREFFrom(.SQL,.routine)
    If routine="" {
        Write "<pre id='SQLFormattedText'>"
        Try {
            Do:SQL'="" ..WriteSQL(SQL,0)
        } Catch e {
            Do ..WriteStatus(e.AsStatus())
        }
        Write "</pre>"
    } Else {
        Try {
            Do:SQL'="" ..WriteSQL(routine)
        } Catch e {
            Do ..WriteStatus(e.AsStatus())
        }
    }
}

ClassMethod GetMainLeftTitle() As %String
{
    Do ..HREFFrom(.SQL,.Routine)
    If Routine'="" Quit "Routine"
    Quit "SQL"
}

ClassMethod WriteMainRight(ByRef scratch)
{
    Do ..HREFFrom(.SQL)
    Try {
        Do:SQL'="" ..WriteSQLPlan(SQL,.scratch)
    } Catch e {
        Do ..WriteStatus(e.AsStatus())
    }
}

ClassMethod GetMainRightTitle() As %String
{
    Quit "Plan"
}

ClassMethod WriteSQLPlan(sql As %String, Output modules)
{
	#dim interface as PXW.DEV.Dictionary.ClassDefinitionObject
	; enquote quotes
	Set sqlencode=sql
	; MOVE THIS ALL TO THE INTERFACE
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
    New %path Set %path=""
	Set parser=##class(PXW.DEV.BNF.Run.SQL).%New()
	Set parser.stream=##class(PXW.DEV.InputStream).NewString(sql)
	Set Element=##class(PXW.DEV.Element).%New()
	Set parsed=parser.SqlProgram(Element)
    if parsed {
        set endatom=parser.newAtom("SQL END")
        do Element.AddPart(endatom)
    }
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
    Set:$DATA(%path) output.showPaths=1
	Do output.begin()
    Do output.writeElement(Element)
    Do output.end()
    Write "</pre>"
}

classmethod WriteRoutine(Routine as %String) {
    Do ##class(PXW.Tools.DEV.Routine).WriteRoutine(Routine)
}
/// Output 1 Anchor tag for each option in the navigation. Use the scratch variable for anything you want to get from BODY
ClassMethod WriteNav(ByRef scratch)
{
    Do ..HREFFrom(.SQL,.routine)
    Set aname=""
    For {
	    Set aname=$ORDER(scratch(aname))
        Quit:aname=""

        Write "<a href=""#"_aname_""">"_aname_"</a>"
    }
    If routine="" {
        Write "<hr>"
        Write "<a href=# onclick='document.getElementById(""SQLTextArea"").value=document.getElementById(""SQLFormattedText"").innerText;'>Tinker</a>"
    }
}

/// Write out extra styles here, the STYLE tags are already in place
ClassMethod WriteStyles()
{
    Do ##super()
	Do ##class(PXW.Tools.DEV.Class).WriteStyles()
    Write "div.EmbeddedSQLcontainer { display:inline-block; vertical-align:top; }",!
    Write "pre.EmbeddedSQLSub { border:1px solid var(--borderNormal); }",!
    Write "p.newline { padding-left:20px; text-indent: -20px; }",!
    Write "pre.PlanSQL { background-color:var(--bgAlternate1); overflow-wrap: break-word;  white-space: normal; }",!
    Write "pre.PlanSQL p.newline { margin:0; }",!

    ; not working
    ;w "p.newline:nth-child(odd) { background-color: var(--bgAlternate1); color: var(--fgNormal); }",!
}

ClassMethod WriteScripts()
{
	Do ##class(PXW.Tools.DEV.Class).WriteScripts()
}

ClassMethod HREFTo(SQL As %String,Routine as %String) As %String
{
    Set href=##super()
    If $GET(SQL)'="" {
        Set id=$INCREMENT(^IRIS.Temp.PXWSQLShowPlan)
        Set ^IRIS.Temp.PXWSQLShowPlan(id)=SQL
        Set href=href_"&SQLID="_..EscapeURL(id)
    }
    If $GET(Routine)'="" {
        Set href=href_"&R="_..EscapeURL(Routine)
    }
    Quit href
}

/// This shoud output some variables, getting the data from %request
ClassMethod HREFFrom(Output SQL As %String,output Routine as %String)
{
    ; SQL is in the request from the form
	Set SQL=%request.Get("SQL")
    ; SQLID is set by HREFTo
    Set id=%request.Get("SQLID")
    If id'="" {
        Set SQL=$GET(^IRIS.Temp.PXWSQLShowPlan(id))
    }
    Set Routine=%request.Get("R")
}

}
