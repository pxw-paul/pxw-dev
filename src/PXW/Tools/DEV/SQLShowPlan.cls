Class PXW.Tools.DEV.SQLShowPlan Extends PXW.Tools.Page
{

ClassMethod WriteMainBody(ByRef modules)
{
    #dim a as PXW.DEV.Element
    Do ..HREFFrom(.SQL)

    ; page
    Write "<div style=' height:100%; display:flex; flex-direction: column;'>"
    ; head
    Write "<div>"
    &html<<form > 
        <fieldset>
        <input name='%NS' value='#(%NS)#' type=hidden>
        <table style='width:100%'>
            <tr><td>SQL</td><td><textarea style='width:100%' name='SQL' rows=20>#(SQL)#</textarea></td></tr>
            <tr><td>&nbsp;</td><td><input type=submit value='Show Plan'></td></tr>
        </table>
        </fieldset>
        </form>
    >
    ; /head
    Write "</div>"
    If SQL'="" {
        ; main
        Write "<div style='flex-grow:1; overflow:auto; '>" 
        ; container
        Write "<div style=' width:100%; display:flex; height:100%; '>"
        ; left
        Write "<div class='section2' style='order:1;  display:block; vertical-align: top; height: 100%; width: 50%;  overflow: auto; background-color: var(--bgAlternate1);'>"
        write "<h2>SQL</h2>"
        ;Write "<div style='order:1;  display:block; vertical-align: top; height: 100%;  padding:10px; overflow: auto; background-color: var(--bgAlternate1); resize:horizontal;'>"
        Write "<pre>" 
        try {
            ;Do $CLASSMETHOD(class,"test1",text,method,.a,0,$GET($$$debugObject))
            do ..WriteSQL(SQL,0)
        } catch e {
            Do ..WriteStatus(e.AsStatus())
        }
        Write "</pre>"
        Write "</div>"
        ; /left
        ; right
        Write "<div class='section2' style='order:2; display:block; vertical-align: top; height: 100%; width: 50%; overflow: auto;'>"
        write "<h2>Plan</h2>"
        try {
            do ..WriteSQLPlan(SQL,.modules)
        } catch e {
            Do ..WriteStatus(e.AsStatus())
        }
        ;Write "</pre>"
        ; /right
        Write "</div>"
        ; /container
        Write "</div>"
        ; /main
        Write "</div>"
    }
    Write "<div></div>"
    ;/page
    Write "</div>"
}

ClassMethod WriteSQLPlan(sql, Output modules)
{
	#dim interface as PXW.DEV.Dictionary.ClassDefinitionObject
	; enquote quotes
	s sqlencode=sql
	s plansql="SELECT %SYSTEM.QUERY_PLAN(?) as XML "
    ;s plansql="EXPLAIN "_sql
	s params($i(params))=sqlencode
    s interface=##class(PXW.DEV.Dictionary.ClassDefinitionObject).OpenNamespace(%NS)
	Set qsc=##class(PXW.DEV.Dictionary.AtelierClient).query(interface.AtelierSettings.ServerName,plansql,.obj,params...)
    if $$$ISERR(qsc) {
        do ..WriteStatus(qsc)
        quit
    }
	;w "<pre>"
	;zw obj
	Set rs=##class(PXW.DEV.Dictionary.AtelierRS).%New(obj)
	;zw rs
	while rs.%Next() {
		s xml=rs.%Get("XML")
        ;s xml=rs.%Get("Plan")
        s xml=$replace(xml,$c(13,10),$c(13))
		;w "<pre>"_$ZCONVERT(xml,"O","HTML")_"</pre>"
		s parser=##class(PXW.DEV.BNF.Run.SQLShowPlan).%New()
		s parser.stream=##class(PXW.DEV.InputStream).NewString(xml)
		s element=##class(PXW.DEV.Element).%New()
		n %path s %path=""
		i parser.Plans(element) {
			;d element.write()
			s output=##class(PXW.Tools.DEV.HTML.SQLShowPlan).%New()
			s output.ClassServer=##class(PXW.DEV.Dictionary.ClassDefinitionObject).OpenNamespace(%NS)	
			i $d(%path) s output.showPaths=1
			s output.ThisType="CLS" ; behave like a class until we want to analyse in a different way
			d output.writeElement(element)
            m modules=output.modules
		} else {
            w !,"NOT PARSED"
        }
	}
	;w "</pre>"
}

ClassMethod WriteSQL(sql As %String, hiliteLine As %Integer)
{

    ;n %NS s %NS=$znspace
	s parser=##class(PXW.DEV.BNF.Run.SQL).%New()
	s parser.stream=##class(PXW.DEV.InputStream).NewString(sql)
	s Element=##class(PXW.DEV.Element).%New()
	s parsed=parser.SqlProgram(Element)
	; if its all on a single line then format it
	;i sql'[parser.stream.eolChar {
		s formatter=##class(PXW.DEV.BNF.Format.SQL).%New()
		d formatter.formatElement(Element)
	;}
	w "<pre class='EmbeddedSQL'>"
	s output=##class(PXW.Tools.DEV.HTML.SQLShowPlan).%New()
	s output.ClassServer=##class(PXW.DEV.Dictionary.ClassDefinitionObject).OpenNamespace(%NS)	
	s output.HiLiteLine=hiliteLine
	s output.ThisType="CLS" ; behave like a class until we want to analyse in a different way
	d output.begin()
    d output.writeElement(Element)
    d output.end()
    w "</pre>"
    q $$$OK
}

/// Output 1 Anchor tag for each option in the navigation. Use the scratch variable for anything you want to get from BODY
ClassMethod WriteNav(ByRef scratch)
{
    s aname=""
    f {
	    s aname=$o(scratch(aname))
        q:aname=""

        w "<a href='#"_aname_"'>"_aname_"</a>"
    }
}

/// Write out extra styles here, the STYLE tags are already in place
ClassMethod WriteStyles()
{
	do ##class(PXW.Tools.DEV.Class).WriteStyles()
    w "pre.EmbeddedSQLSub { border:1px solid black; margin-left:40px; }",!
    w "p.newline { padding-left:20px; text-indent: -20px; }",!
    
    ; not working
    ;w "p.newline:nth-child(odd) { background-color: var(--bgAlternate1); color: var(--fgNormal); }",!
}

ClassMethod WriteScripts()
{
	do ##class(PXW.Tools.DEV.Class).WriteScripts()
}

ClassMethod HREFTo(SQL As %String) As %String
{
    Set href=##super()
    Set:$G(SQL)'="" href=href_"&SQL="_..EscapeURL(SQL)
    Quit href
}

/// This shoud output some variables, getting the data from %request
ClassMethod HREFFrom(Output SQL As %String)
{
	Set SQL=%request.Get("SQL")
}

}
