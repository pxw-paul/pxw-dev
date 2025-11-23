Class PXW.Tools.DEV.HTML.SQLShowPlan Extends PXW.Tools.DEV.HTML.bnf
{

Property modules As %String [ MultiDimensional ];

Method writeSQLDirectTableExpand(element As PXW.DEV.BNF.Elements.SQL) As PXW.DEV.BNF.Compilers.elementHandler(Type="DirectTable")
{
    Set direct=element
    If $ISOBJECT(direct) {
        Set tablenameE=direct.findFirstElementByType("TableName",0)
        If $ISOBJECT(tablenameE) {
            Set tablename=tablenameE.ToString(0)
            ; is it a reference to a WITH?
            If tablename'="", tablename'[".", $ISOBJECT(..SqlProgramAnalyser), $GET(..SqlProgramAnalyser.withReferences(tablename))'="" {
                ;Set aliasname="alias"_tablename
                ;Do ..wrapElementHTML(tablenameE,"<span class='SQLTableAlias' title='show alias usage' varid='"_$$$UPPER(aliasname)_"' onclick=""HiliteSets('"_$$$UPPER(aliasname)_"');"">","</span>")
            } Else {
                set schemaE=tablenameE.findFirstElementByType("SchemaName",0)
                set tableE=tablenameE.findFirstElementByType("QualifiedIdentifier",0)
                if $isobject(schemaE),$isobject(tableE) {
                    set sql=..GetViewSQL(schemaE.ToString(0),tableE.ToString(0))
                    if sql'="" {
                        s subElement=..SubSQLToEmbeddedViewElement(sql)
                        i $isobject(subElement) {
                            do element.AddPart(subElement)
                        }
                    }
                }
            }
        }
    }    
    Quit ""
}

Method writeSQLEmbeddedView(element As PXW.DEV.BNF.Elements.SQL) As PXW.DEV.BNF.Compilers.elementHandler(Type="EmbeddedView")
{
    do ..wrapElementHTML(element,"<br><pre class='EmbeddedSQLSub'>","</pre>")
    q ""
}

Method SubSQLToEmbeddedViewElement(sql)
{

    ;n %NS s %NS=$znspace
	s parser=##class(PXW.DEV.BNF.Run.SQL).%New()
	s parser.stream=##class(PXW.DEV.InputStream).NewString(sql)
	s Element=##class(PXW.DEV.BNF.Elements.SQL).%New("EmbeddedView")
	s parsed=parser.SqlProgram(Element)
	; if its all on a single line then format it
	i sql'[parser.stream.eolChar {
		s formatter=##class(PXW.DEV.BNF.Format.SQL).%New()
		d formatter.formatElement(Element)
	}
    q Element
    q $$$OK
}

Method GetViewSQL(schema, table) As %String
{
    s sql="SELECT  v.CLASSNAME,cd.viewquery "
    s sql=sql_" FROM INFORMATION_SCHEMA.VIEWS as v"
    s sql=sql_" inner join %Dictionary.ClassDefinition as cd on cd.ID=v.ClassName"
    s sql=sql_" where v.table_schema=?" s params($i(params))=schema
    s sql=sql_" and v.table_name=?" s params($i(params))=table
   	Set qsc=##class(PXW.DEV.Dictionary.AtelierClient).query(..ClassServer.AtelierSettings.ServerName,sql,.obj,params...)
	Set rs=##class(PXW.DEV.Dictionary.AtelierRS).%New(obj)
	s view=""
    while rs.%Next() {
        s view=view_rs.%Get("ViewQuery")
    }
    Q view
}

/********************************
  THE SHOW PLANS SECTION, most of this is just stripping out the XML from the "XML"
********************************/
Method writePlanPlans(element As PXW.DEV.BNF.Element) As PXW.DEV.BNF.Compilers.elementHandler(Type="Plans")
{
    do ..ClearAllButContent(element)
    q ""
}

Method writePlanNewline(element As PXW.DEV.BNF.Element) As PXW.DEV.BNF.Compilers.elementHandler(Type="Newline")
{
    ; NEWLINE is where the $C(13) should be, treat as paragraphs, but they don't wrap anything they are on the same level
    do ..wrapElementHTML(element,"<p class=""newline"">","")
    do ..ClearAllButContent(element)
    q ""
}

Method writePlanForEach(element As PXW.DEV.BNF.Element) As PXW.DEV.BNF.Compilers.elementHandler(Type="ForEachContent")
{
    do ..wrapElementHTML(element,"<div style='margin-left:20px; >","</div>")
    ;do ..ClearAllButContent(element)
    q ""
}

Method writePlanPlan(element As PXW.DEV.BNF.Element) As PXW.DEV.BNF.Compilers.elementHandler(Type="Plan")
{
    do ..ClearAllButContent(element)
    q ""
}

Method writePlanSql(element As PXW.DEV.BNF.Element) As PXW.DEV.BNF.Compilers.elementHandler(Type="SqlSection")
{
    do element.partsClear() ; DON'T DISPLAY SQL AGAIN ITS ON THE SCREEN TWICE ALREADY
    ;do ..wrapElementHTML(element,"<h3>SQL</h3>","")
    ;do ..ClearAllButContent(element)
    q ""
}

Method writePlanWarning(element As PXW.DEV.BNF.Element) As PXW.DEV.BNF.Compilers.elementHandler(Type="WarningSection")
{
    do ..wrapElementHTML(element,"<div class=Warning><h3>Warning</h3>","</div>")
    do ..ClearAllButContent(element)
    q ""
}

Method writePlanInfo(element As PXW.DEV.BNF.Element) As PXW.DEV.BNF.Compilers.elementHandler(Type="InfoSection")
{
    do ..wrapElementHTML(element,"<div class=Warning><h3>Info</h3>","</div>")
    do ..ClearAllButContent(element)
    q ""
}

Method writePlanCost(element As PXW.DEV.BNF.Element) As PXW.DEV.BNF.Compilers.elementHandler(Type="CostSection")
{
    #dim attE,nameE as PXW.DEV.BNF.Element
    set val=..GetAttributeValue(element,"value")
    do ..wrapElementHTML(element,"<h2>Cost "_val_"</h2>","")
    do ..ClearAllButContent(element)
    q ""
}

Method writePlanFrozen(element As PXW.DEV.BNF.Element) As PXW.DEV.BNF.Compilers.elementHandler(Type="FrozenSection")
{
    #dim attE,nameE as PXW.DEV.BNF.Element
    do ..wrapElementHTML(element,"<h2>Frozen plan</h2>","")
    do ..ClearAllButContent(element)
    q ""
}

Method writePlanModule(element As PXW.DEV.BNF.Element) As PXW.DEV.BNF.Compilers.elementHandler(Type="ModuleSection")
{
    #dim attE,nameE as PXW.DEV.BNF.Element
    set modname=..GetAttributeValue(element,"name")
    if modname'="" {
        set aname="module_"_modname
        do ..wrapElementHTML(element,"<hr><h3 id='"_aname_"'>Module "_modname_"</h3>","")
        s ..modules(aname)=""
        do ..ClearAllButContent(element)
    } else {
        do ..wrapElementHTML(element,"<hr><pre>","</pre>")
    }
    q ""
}

Method writePlanSubquery(element As PXW.DEV.BNF.Element) As PXW.DEV.BNF.Compilers.elementHandler(Type="SubquerySection")
{
    #dim attE,nameE as PXW.DEV.BNF.Element
    set modname=..GetAttributeValue(element,"name")
    if modname'="" {
        ;do element.write()
        set aname="subquery_"_modname
        do ..wrapElementHTML(element,"<hr><h3 id='"_aname_"'>Subquery "_modname_"</h3>","")
        s ..modules(aname)=""
        do ..ClearAllButContent(element)
    } else {
        do ..wrapElementHTML(element,"<hr><pre>","</pre>")
    }
    q ""
}

Method GetAttributeValue(element As PXW.DEV.BNF.Element, name As %String)
{
    s key="",val=""
    f {
        set attE=element.findNextElement(.key)
        quit:key=""

        if attE.%IsA("PXW.DEV.BNF.Element"),$p(attE.type,":",1)="Attribute" {
            set nameE=attE.partsGetAt(1)
            set valueE=attE.partsGetAt(3)
            if nameE.ToString(0)=name {
                set val=valueE.ToString(0)
            }
        }
    }
    set val=$tr(val,"'""","") ; attribute values are wrapped in quotes
    q val
}

Method ClearAllButContent(element As PXW.DEV.BNF.Element)
{
    #dim atom as PXW.DEV.Atom
    #dim ele as PXW.DEV.Element
    s akey=""
    f {
        s atom=element.partsGetNext(.akey)
        q:akey=""
        
        if atom.%IsA("DEV.PXW.Atom") {
            do element.partsRemove(akey)
        } else {
            set ele=atom
            if $p(ele.type,":",1)'="Content" {
                do element.partsRemove(akey)
            }
        }        
    }
}

Method writePlanTableScanWarning(element As PXW.DEV.BNF.Element) As PXW.DEV.BNF.Compilers.elementHandler(Type="ReadMasterScan")
{
    do ..wrapElementHTML(element,"<span class='Warning'>","</span>")
    quit ""
}

Method writeSQLPlanTableIndex(element As PXW.DEV.BNF.Element) As PXW.DEV.BNF.Compilers.elementHandler(Type="TableIndex")
{
    /*
    Element=TableIndex PXW.DEV.BNF.Element @80
    .Element=SchemaName PXW.DEV.BNF.Element @18
    ..type=SchemaName:/Plan/ReadIndex/TableIndex/SchemaName
    .. Data_Assets
    .type=punctuation:/Plan/ReadIndex/TableIndex
    . .
    .Element=TableName PXW.DEV.BNF.Element @160
    ..type=TableName:/Plan/ReadIndex/TableIndex/TableName
    .. Asset
    .type=punctuation:/Plan/ReadIndex/TableIndex
    . .
    .Element=IndexName PXW.DEV.BNF.Element @205
    ..type=IndexName:/Plan/ReadIndex/TableIndex/IndexName
    .. Code
    */
 
    set schemaE=element.findFirstElementByType("SchemaName",0)
    set tableE=element.findFirstElementByType("TableName",0)
    set indexE=element.findFirstElementByType("IndexName",0)
    if $isobject(schemaE),$isobject(tableE) {
        s table=schemaE.ToString(0)_"."_tableE.ToString(0)
        d ..wrapElementHTML(schemaE,"<a class='CDEFClassName' href='"_..HREFToClass(table)_"'>","</a>")
        d ..wrapElementHTML(tableE,"<a class='CDEFClassName' href='"_..HREFToClass(table)_"'>","</a>")
    }
    if $isobject(schemaE),$isobject(tableE),$isobject(indexE) {
        s table=schemaE.ToString(0)_"."_tableE.ToString(0)
        s index=indexE.ToString(0)
        d ..wrapElementHTML(indexE,"<a class='COSObjectMember' href='"_..HREFToClass(table,index)_"'>","</a>")
    }
    /*
    set subscriptE=element.findFirstElementByType("TableSubscriptAlias",0)
    if $isobject(subscriptE) {
            set aliasNameE=subscriptE.findFirstElementByType("AliasName",0)
            If $ISOBJECT(aliasNameE) {
                Set aliasname="alias"_aliasNameE.ToString(0)
                Do ..wrapElementHTML(aliasNameE,"<span class='SQLTableAlias' title='show alias usage' fetchid='"_$$$UPPER(aliasname)_"' onclick=""HiliteSets('"_$$$UPPER(aliasname)_"');"">","</span>")
        }
    }*/
    quit ""
}

Method writeSQLPlanAliasName(element As PXW.DEV.BNF.Element) As PXW.DEV.BNF.Compilers.elementHandler(Type="AliasName")
{
    Set aliasname="alias"_element.ToString(0)
    Do ..wrapElementHTML(element,"<span class='SQLTableAlias' title='show alias usage' fetchid='"_$$$UPPER(aliasname)_"' onclick=""HiliteSets('"_$$$UPPER(aliasname)_"');"">","</span>")
    quit ""
}

Method writeSQLPlanModuleName(element As PXW.DEV.BNF.Element) As PXW.DEV.BNF.Compilers.elementHandler(Type="ModuleName")
{
    d ..wrapElementHTML(element,"<a class='COSLabel' href='#module_"_element.ToString(0)_"'>","</a>")
    q ""
}

Method writeSQLPlanSubqueryName(element As PXW.DEV.BNF.Element) As PXW.DEV.BNF.Compilers.elementHandler(Type="SubqueryName")
{
    d ..wrapElementHTML(element,"<a class='COSLabel' href='#subquery_"_element.ToString(0)_"'>","</a>")
    q ""
}

}
