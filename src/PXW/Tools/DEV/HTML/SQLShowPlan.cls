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
                Set schemaE=tablenameE.findFirstElementByType("SchemaName",0)
                Set tableE=tablenameE.findFirstElementByType("QualifiedIdentifier",0)
                If $ISOBJECT(schemaE),$ISOBJECT(tableE) {
                    Set sql=..GetViewSQL(schemaE.ToString(0),tableE.ToString(0))
                    If sql'="" {
                        Set subElement=..SubSQLToEmbeddedViewElement(sql)
                        If $ISOBJECT(subElement) {
                            Do ..wrapElementHTML(element,"<div class='EmbeddedSQLcontainer'>","</div>")
                            Do element.AddPart(subElement)
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
    Do ..wrapElementHTML(element,"<br><pre class='EmbeddedSQLSub'>","</pre>")
    Quit ""
}

Method SubSQLToEmbeddedViewElement(sql As %String) As PXW.DEV.BNF.Elements.SQL
{

    ;n %NS s %NS=$znspace
	Set parser=##class(PXW.DEV.BNF.Run.SQL).%New()
	Set parser.stream=##class(PXW.DEV.InputStream).NewString(sql)
	Set Element=##class(PXW.DEV.BNF.Elements.SQL).%New("EmbeddedView")
	Set parsed=parser.SqlProgram(Element)
    If parsed {
		Set formatter=##class(PXW.DEV.BNF.Format.SQL).%New()
		Do formatter.formatElement(Element)
    }
    Quit Element
}

Method GetViewSQL(schema As %String, table As %String) As %String
{
    Set viewQuery=..ClassServer.GetViewSQL(schema,table)
    Quit viewQuery
}

/********************************
  THE SHOW PLANS SECTION, most of this is just stripping out the XML from the "XML"
********************************/
Method writePlanPlans(element As PXW.DEV.BNF.Element) As PXW.DEV.BNF.Compilers.elementHandler(Type="Plans")
{
    Do ..ClearAllButContent(element)
    Quit ""
}

Method writePlanNewline(element As PXW.DEV.BNF.Element) As PXW.DEV.BNF.Compilers.elementHandler(Type="Newline")
{
    ; NEWLINE is where the $C(13) should be, treat as paragraphs, but they don't wrap anything they are on the same level
    Do ..wrapElementHTML(element,"<p class=""newline"">","")
    Do ..ClearAllButContent(element)
    Quit ""
}

Method writePlanForEach(element As PXW.DEV.BNF.Element) As PXW.DEV.BNF.Compilers.elementHandler(Type="ForEachContent")
{
    Do ..wrapElementHTML(element,"<div style='margin-left:20px; >","</div>")
    ;do ..ClearAllButContent(element)
    Quit ""
}

Method writePlanPlan(element As PXW.DEV.BNF.Element) As PXW.DEV.BNF.Compilers.elementHandler(Type="Plan")
{
    Do ..ClearAllButContent(element)
    Quit ""
}

Method writePlanSql(element As PXW.DEV.BNF.Element) As PXW.DEV.BNF.Compilers.elementHandler(Type="SqlSection")
{
    Do ..wrapElementHTML(element,"<h3>SQL</h3>","")
    Do ..ClearAllButContent(element)
    Quit ""
}

Method writePlanWarning(element As PXW.DEV.BNF.Element) As PXW.DEV.BNF.Compilers.elementHandler(Type="WarningSection")
{
    Do ..wrapElementHTML(element,"<div class=Warning><h3>Warning</h3>","</div>")
    Do ..ClearAllButContent(element)
    Quit ""
}

Method writePlanInfo(element As PXW.DEV.BNF.Element) As PXW.DEV.BNF.Compilers.elementHandler(Type="InfoSection")
{
    Do ..wrapElementHTML(element,"<div class=Warning><h3>Info</h3>","</div>")
    Do ..ClearAllButContent(element)
    Quit ""
}

Method writePlanCost(element As PXW.DEV.BNF.Element) As PXW.DEV.BNF.Compilers.elementHandler(Type="CostSection")
{
    #dim attE,nameE as PXW.DEV.BNF.Element
    Set val=..GetAttributeValue(element,"value")
    Do ..wrapElementHTML(element,"<h2>Cost "_val_"</h2>","")
    Do ..ClearAllButContent(element)
    Quit ""
}

Method writePlanFrozen(element As PXW.DEV.BNF.Element) As PXW.DEV.BNF.Compilers.elementHandler(Type="FrozenSection")
{
    #dim attE,nameE as PXW.DEV.BNF.Element
    Do ..wrapElementHTML(element,"<h2>Frozen plan</h2>","")
    Do ..ClearAllButContent(element)
    Quit ""
}

Method writePlanModule(element As PXW.DEV.BNF.Element) As PXW.DEV.BNF.Compilers.elementHandler(Type="ModuleSection")
{
    #dim attE,nameE as PXW.DEV.BNF.Element
    Set modname=..GetAttributeValue(element,"name")
    If modname'="" {
        Set aname="module_"_modname
        Do ..wrapElementHTML(element,"<hr><h3 id='"_aname_"'>Module "_modname_"</h3>","")
        Set ..modules(aname)=""
        Do ..ClearAllButContent(element)
    } Else {
        Do ..wrapElementHTML(element,"<hr><pre>","</pre>")
    }
    Quit ""
}

Method writePlanSubquery(element As PXW.DEV.BNF.Element) As PXW.DEV.BNF.Compilers.elementHandler(Type="SubquerySection")
{
    #dim attE,nameE as PXW.DEV.BNF.Element
    Set modname=..GetAttributeValue(element,"name")
    If modname'="" {
        ;do element.write()
        Set aname="subquery_"_modname
        Do ..wrapElementHTML(element,"<hr><h3 id='"_aname_"'>Subquery "_modname_"</h3>","")
        Set ..modules(aname)=""
        Do ..ClearAllButContent(element)
    } Else {
        Do ..wrapElementHTML(element,"<hr><pre>","</pre>")
    }
    Quit ""
}

Method GetAttributeValue(element As PXW.DEV.BNF.Element, name As %String) As %String
{
    Set key="",val=""
    For {
        Set attE=element.findNextElement(.key)
        Quit:key=""

        If attE.%IsA("PXW.DEV.BNF.Element"),$PIECE(attE.type,":",1)="Attribute" {
            Set nameE=attE.partsGetAt(1)
            Set valueE=attE.partsGetAt(3)
            If nameE.ToString(0)=name {
                Set val=valueE.ToString(0)
            }
        }
    }
    Set val=$TRANSLATE(val,"'""","") ; attribute values are wrapped in quotes
    Quit val
}

Method ClearAllButContent(element As PXW.DEV.BNF.Element)
{
    #dim part as PXW.DEV.Particle
    #dim atom as PXW.DEV.Atom
    #dim ele as PXW.DEV.Element
    Set akey=""
    For {
        Set part=element.partsGetNext(.akey)
        Quit:akey=""
        
        If part.%IsA("DEV.PXW.Atom") {
            Do element.partsRemove(akey)
        } Else {
            Set ele=part
            If $PIECE(ele.type,":",1)'="Content" {
                Do element.partsRemove(akey)
            }
        }        
    }
}

Method writePlanTableScanWarning(element As PXW.DEV.BNF.Element) As PXW.DEV.BNF.Compilers.elementHandler(Type="ReadMasterScan")
{
    Do ..wrapElementHTML(element,"<span class='"_$$$classWarning_"'>","</span>")
    Quit ""
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
 
    Set schemaE=element.findFirstElementByType("SchemaName",0)
    Set tableE=element.findFirstElementByType("TableName",0)
    Set indexE=element.findFirstElementByType("IndexName",0)
    If $ISOBJECT(schemaE),$ISOBJECT(tableE) {
        Set table=schemaE.ToString(0)_"."_tableE.ToString(0)
        Do ..wrapElementHTML(schemaE,"<a class="_$$$classProgramName_" href='"_..HREFToClass(table)_"'>","</a>")
        Do ..wrapElementHTML(tableE,"<a class="_$$$classProgramName_" href='"_..HREFToClass(table)_"'>","</a>")
    }
    If $ISOBJECT(schemaE),$ISOBJECT(tableE),$ISOBJECT(indexE) {
        Set table=schemaE.ToString(0)_"."_tableE.ToString(0)
        Set index=indexE.ToString(0)
        Do ..wrapElementHTML(indexE,"<a class='"_$$$classObjectMember_"' href='"_..HREFToClass(table,index)_"'>","</a>")
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
    Quit ""
}

Method writeSQLPlanAliasName(element As PXW.DEV.BNF.Element) As PXW.DEV.BNF.Compilers.elementHandler(Type="AliasName")
{
    Set aliasname="alias"_element.ToString(0)
    Do ..wrapElementHTML(element,"<span class='SQLTableAlias' title='show alias usage' fetchid='"_$$$UPPER(aliasname)_"' onclick=""HiliteSets('"_$$$UPPER(aliasname)_"');"">","</span>")
    Quit ""
}

Method writeSQLPlanTable(element As PXW.DEV.BNF.Element) As PXW.DEV.BNF.Compilers.elementHandler(Type="Table")
{
    Set schemaE=element.findFirstElementByType("SchemaName")
    Set tableE=element.findFirstElementByType("TableName")
    If $ISOBJECT(schemaE),$ISOBJECT(tableE) {
                Do ..wrapElementHTML(schemaE,"<a class="_$$$classProgramName_" href='"_..HREFToClass(schemaE.ToString(0)_"."_tableE.ToString(0))_"'>","</a>")
                Do ..wrapElementHTML(tableE,"<a class="_$$$classProgramName_" href='"_..HREFToClass(schemaE.ToString(0)_"."_tableE.ToString(0))_"'>","</a>")
    }
    Quit ""
}

Method writeSQLPlanModuleName(element As PXW.DEV.BNF.Element) As PXW.DEV.BNF.Compilers.elementHandler(Type="ModuleName")
{
    Do ..wrapElementHTML(element,"<a class='"_$$$classLabel_"' href='#module_"_element.ToString(0)_"'>","</a>")
    Quit ""
}

Method writeSQLPlanSubqueryName(element As PXW.DEV.BNF.Element) As PXW.DEV.BNF.Compilers.elementHandler(Type="SubqueryName")
{
    Do ..wrapElementHTML(element,"<a class='"_$$$classLabelDef_"' href='#subquery_"_element.ToString(0)_"'>","</a>")
    Quit ""
}

}
