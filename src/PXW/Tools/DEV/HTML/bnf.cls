Class PXW.Tools.DEV.HTML.bnf Extends PXW.Tools.DEV.HTML.output
{

/// Set this to a style class name
Parameter CommentClass = "CDEFComment";

Parameter WarningClass = "Warning";

Parameter ErrorClass = "Error";

/// Set this to 0 if the descriptions are to be displayed as HTML
Property Style As PXW.Tools.Styles.super [ InitialExpression = 1 ];

/// Internal array
Property atomTypeToCSS As %String [ MultiDimensional ];

Property Analyser As PXW.DEV.BNF.Analyse.COS;

/// Array of the items to add to an index, use the AddToIndex and NextIndexItems to access
/// 
Property Index As %String [ MultiDimensional, Private ];

Property IndexError As %String [ MultiDimensional, Private ];

/// keep track of indent when displaying XML
Property xmlIndent As %Integer [ InitialExpression = 0 ];

/// Set this to put the paths in the tooltip (useful for debugging)
Property showPaths As %Boolean [ InitialExpression = 0 ];

/// Used when looking at routines
Property ThisLabel As %String;

/// CLS,INT,INC
Property ThisType As %String;

/// Property/method etc
Property ThisItemType As %String;

/// Set HiliteLabel to the name of the label you are trying to look at
Property HiliteLabel As %String;

/// If HiliteLabel is set then set this to the relative line numer you want to highlight
Property HilitePlus As %Integer;

Property ClassServer As PXW.DEV.Dictionary.ClassDefinitionObject;

/// maintained by xml elements
Property XMLPath As %String;

/// Reset this when starting a completely new SQL 
/// It will end up containing all the analysis of the sql, including sub-queries and "WITH"s
Property SqlProgramAnalyser As PXW.DEV.BNF.Analyse.SQL;

Property PythonAnalyser As PXW.DEV.BNF.Analyse.Python;

Property commentid As %Integer;

Method OutputKeywordCommentAsDocumentation(Element As PXW.DEV.Element, Output commentid As %String)
{
    Set commentid=""
    /* This does not work how I want yet, it needs to do all the stuff that documatic does, can I just call that or do I need to write my own? */
    Set keywordatom=Element.FirstAtom()
    Set textA=keywordatom.getComment()
    If textA'="" {
        Set text=textA.ToString()
        Set text=$REPLACE(text,"///","")
        Set ..commentid=..commentid+1
        Set commentid="comment"_..commentid
        ;do ..output("<div style='position:relative;' class='CDEFdocHTML nocopy' id='"_commentid_"HTML'>")
        ;do ..output("<span style='position:absolute;  top:0px; left:0px;' onmouseover='flipComments("""_commentid_""");'>X</span>")
        Do ..output("<div style='position:relative; display:none;' class='CDEFdocHTML nocopy' id='"_commentid_"HTML'>")
        Do ..output(text)
        ;do ##class(%CSP.Documatic).RenderDescription(..This,text,"","")
        Do ..output("</div>")

        ;do ..output("<div style='position:relative; display:none;' class='CDEFdocText' id='"_commentid_"Text'>")
        ;do ..output("<span style='position:absolute; top:0px; left:0px;' onmouseout='flipComments("""_commentid_""");'>X</span>")
        Do ..output("<div style='position:relative;' class='CDEFdocText'  id='"_commentid_"Text'>")
        If $ISOBJECT(keywordatom.whitespace) {
            Do ..writeAtom(keywordatom.whitespace,"<span class=whitespace>","</span>",1)
        }
        If $ISOBJECT(keywordatom.comment) {
            Do ..writeAtom(keywordatom.comment,"<span class='"_..#CommentClass_"'>","</span>")
        }
        Do ..output("</div>")
        Do keywordatom.clearComment()
        Set keywordatom.whitespace=""
    } Else {
        Set commentid=""
    }
    ;*/
}

Method AddToIndex(Name As %String, Type As %String, Anchor As %String) As %Status
{
    Set data=$LISTBUILD(Name,Type,Anchor)
    Set ..Index("Name",$$$UPPER(Name)_"||"_Type)=data
    Set ..Index("Type",Type_"||"_$$$UPPER(Name))=data
    Set ..Index("Seq",$INCREMENT(..Index("Seq")))=data
    Quit $$$OK
}

Method AddToIndexError(Name As %String, Error As %String) As %Status
{
    If Name'="" {
        Set data=$LISTBUILD(Error)
        Set ..IndexError("Name",Name)=data
    }
    Quit $$$OK
}

/// Call in a loop using byref parameters to get the index out
/// while x.NextIndexItem(.name,.type) {
/// 
/// }
Method NextIndexItemByName(ByRef Name As %String = "", ByRef Type As %String = "", ByRef Anchor As %String = "", ByRef Error As %String = "") As %Boolean
{
    Set key=$GET(..Index("NameKey"))
    Set key=$ORDER(..Index("Name",key),1,data)
    If key'="" {
        Set Name=$LISTGET(data,1),Type=$LISTGET(data,2),Anchor=$LISTGET(data,3)
        Set Error=$GET(..IndexError("Name",Name))
    }
    Set ..Index("NameKey")=key
    Quit (key'="")
}

Method %OnNew() As %Status
{
    If $ISOBJECT($GET(%STYLE)) {
        Set ..Style=%STYLE 
    } Else {
        Set ..Style=##class(PXW.Tools.Styles.super).%New()
    }
    Quit $$$OK
}

/// Output the html directly to destination. No escaping or other formatting is done.
Method output2(html As %String, newLine As %Boolean = 0)
{
	If ..WriteMode {
		If html'="" Write html If newLine Write !
		;s ^PXW("out",$i(^PXW))=html
	} Else {
		Set ..htmlout=..htmlout_html	
	}
}

Method begin()
{
	Do ..output("<pre>")
}

Method end()
{
	Do ..output("</pre>")
}

Method middle(element As PXW.DEV.Element)
{
    Do ..resetWrappers()
    ; can't do this here as the ENTIRE class will be analysed all at once
    ;i $isobject(..Analyser) d ..Analyser.middle(element)
    Do ..writeElement(element)
}

Method writeElement(element As PXW.DEV.Element)
{
    #dim a as PXW.DEV.Atom
    #dim cref as PXW.DEV.Element
    /* CDEF */
    $$$DEBUG("writeElement:"_element.type)
    Set oldXMLPath=..XMLPath
 
    Do ..GenericRedirect(element)

    For  {
		Set a=element.partsGetNext(.akey)
		Quit:akey=""

		If a.%IsA("PXW.DEV.Atom") {
            Set type=$PIECE(a.type,":",1)
            If type="ClassReference" {
            	Do ..wrapAtomHTML(a,"<a class='CDEFClassName' href='"_..HREFToClass(a.value)_"'>","</a>")
            }
            If type="ClassName" {
            	Do ..wrapAtomHTML(a,"<a class='CDEFClassName' href='"_..HREFToClass(a.value)_"'>","</a>")
            }
            If type="identifier" {
            	;d ..wrapAtomHTML(a,"<span class='keyword'>","</span>")
            }
            If type="Keyword" {
            	Do ..wrapAtomHTML(a,"<span class='keyword'>","</span>")
            }
            If type="CDEFKeyword" {
            	Do ..wrapAtomHTML(a,"<span class='CDEFkeyword'>","</span>")
            }

            /* COS */
            If type="VariableSet" {
                Set varname=a.value
	    		Set cssclass="COSVariableSet"
    			If $ISOBJECT(..Analyser),..Analyser.IsParameterVariable(varname) Set cssclass="COSVariableParameterSet"
                Do ..wrapAtomHTML(a,"<span class='"_cssclass_"' varid='"_varname_"' onclick=""HiliteSets('"_varname_"');"">","</span>")
            } ElseIf type="Variable" {
                Set varname=a.value
                Set cssclass="COSVariable"
                If $ISOBJECT(..Analyser),..Analyser.IsParameterVariable(varname) Set cssclass="COSVariableParameter"
                Do ..wrapAtomHTML(a,"<span class='"_cssclass_"' fetchid='"_varname_"' onclick=""HiliteSets('"_varname_"');"">","</span>")
            } ElseIf type="ObjectVariable" {
                Set varname=a.value
                Set cssclass="COSVariable"
                If $ISOBJECT(..Analyser),..Analyser.IsParameterVariable(varname) Set cssclass="COSVariableParameter"
                Do ..wrapAtomHTML(a,"<span class='"_cssclass_"' fetchid='"_varname_"' onclick=""HiliteSets('"_varname_"');"">","</span>")
            } ElseIf type="String" {
                Do ..wrapInnerAtomHTML(a,"<span class='COSString'>","</span>")
            } ElseIf type="Number" {
                Do ..wrapAtomHTML(a,"<span class='COSNumber'>","</span>")
            }

            /* JS - old style parser */
       		If type="JSCOMMAND" {
                Do ..wrapAtomHTML(a,"<span class='JSCommand'>","</span>")
            } ElseIf type="JSVAR" {
                Set varname=a.ToString(0)
                Set cssclass="JSVariable"
                Do ..wrapAtomHTML(a,"<span class='"_cssclass_"' fetchid='"_varname_"' onclick=""HiliteSets('"_varname_"');"">","</span>")			
            } ElseIf type="JSSTRING" {
                Do ..wrapAtomHTML(a,"<span class='JSString'>","</span>")
            } ElseIf type="JSREGEX" {
                Do ..wrapAtomHTML(a,"<span class='JSRegex'>","</span>")
            }

            If type="ERROR" {
                Do ..wrapAtomHTML(a,"<span class='"_..#ErrorClass_"'>","</span>")
                Do ..AddToIndexError(..ThisMethod,a.value)
            }

            Do:..showPaths ..wrapAtomHTML(a,"<span title='"_+a_":"_a.type_"'>","</span>")
 
		}
	}

    Do ##super(element)
    Set ..XMLPath=oldXMLPath
}

Method writeElementBNF1(element As PXW.DEV.Element)
{
    #dim parser as PXW.DEV.BNF.super
    Set input=element.ToString()
    If input["::=" {
       	Set parser=##class(PXW.DEV.BNF.Compilers.BNF1safe).%New()
    } Else {
        ; try different parser
        Set parser=##class(PXW.DEV.BNF.Compilers.BNF2safe).%New()
    }    
    Set parser.stream=##class(PXW.DEV.InputStream).NewString(element.ToString())
    Set subElement=##class(PXW.DEV.Element).%New()
    If parser.File(subElement) {
    	Do ..wrapElementBNF1Loop(subElement)
        Do element.partsClear()
        Do element.AddPart(subElement)
    } Else {

    }
}

Method wrapElementBNF1Loop(element As PXW.DEV.Element)
{
    If element.type="Definition" {
        Set labatom=element.FirstAtom()
        Set lab=labatom.value
        If lab=..HiliteLabel {
            ;d ..wrapAtomHTML(labatom,"<span class='hilite'>","</span>")
            ;d ..wrapAtomHTML(labatom,"<a name='bookmark'>","</a>")
            Do ..wrapAtomHTML(labatom,"<a name='Bookmark' class='hilite'>","</a>")
            If ..HilitePlus'="" Set ..HiLiteLine=labatom.line+..HilitePlus
        } Else {
            Set labname=$TRANSLATE("LAB"_..ThisMethod_lab,"$^%_","")
            Do ..wrapAtomHTML(labatom,"<a id='"_labname_"' class='COSLabelDef' name='"_labname_"'>","</a>")
            Do ..AddToIndex(..ThisMethod_" : "_lab,"XDataName",labname)
        }
    }

   If element.type="Call" {
        Set atom=element.FirstAtom()
        Set lab=atom.value
        Set labname=$TRANSLATE("LAB"_..ThisMethod_lab,"$^%_","")
        Do ..wrapAtomHTML(atom,"<a onclick='HiliteElement("""_labname_""");'  class='COSLabel' href='#"_labname_"'>","</a>")
    }

    For  {
        Set a=element.partsGetNext(.akey)
        Quit:akey=""

        If a.%IsA("PXW.DEV.Element") {
            Do ..wrapElementBNF1Loop(a)
        }
    }
}

Method writeCDEFIncludeName(element As PXW.DEV.BNF.Elements.ClassDefinition) As PXW.DEV.BNF.Compilers.elementHandler(Type="IncludeName")
{
    Do ..wrapElementHTML(element,"<a href='"_..HREFToInclude(element.ToString(0))_"'>","</a>")
    Quit ""
}

Method writeCDEFOneClassMember(element As PXW.DEV.BNF.Elements.ClassDefinition) As PXW.DEV.BNF.Compilers.elementHandler(Type="OneClassmember")
{
    ; a class memeber element is like this:
    ;         Element=OneClassmember PXW.DEV.BNF.Element @1835 
    ; item(e)=.Element=ClassMethod PXW.DEV.BNF.Element @1893
    ; typeA  =..type=keyword:/UdlStatement/ClassDefinition/ClassMemberSection/ClassMemberList/OneClassmember/ClassMethod
    ;         .. Method
    ; nameE   ..Element=MethodName PXW.DEV.BNF.Element @1910
    ;         ...Element=ClassItemIdentifier PXW.DEV.BNF.Element @1946
    Set item=element.partsGetAt(1)
    Set typeA=item.partsGetAt(1)
    Set ..ThisItemType=typeA.ToString(0)
    Set nameE=item.partsGetAt(2)
    If $LISTFIND($LISTBUILD("PropertyName","MethodName","ClassParameterName","IndexName","TriggerName","ForeignkeyName","StorageName","QueryName","XdataName"),nameE.type) {
        Set name=nameE.ToString(0)
        Set anchor="anchor"_name_nameE.type
        Set ..ThisMethod=name
        If ..BookMark'="",$$$UPPER(name)=$$$UPPER(..BookMark) {
            Do ..wrapElementHTML(nameE,"<span id='"_anchor_"SPAN' class='hilite'>","</span>") 
            Set anchor="bookmark" ;
        } Else {
            Do ..wrapElementHTML(nameE,"<span id='"_anchor_"SPAN'>","</span>")
        }
        
        Do ..AddToIndex(name,nameE.type,anchor)
        
        ; not compatible with OutputKeywordComment, which forces output so the anchor ends up going after the comment
        Do ..wrapElementHTML(element,"<a name='"_anchor_"'></a>","") ; anchor goes before the member (ie before the comment)
        ;do ..OutputKeywordCommentAsDocumentation(element,.commentid)

        Do ..wrapElementHTML(element,"<span class=CDEFOneClassMember>","</span>")
    }
    Quit ""
}

Method writeCDEFClassDefinition(element As PXW.DEV.BNF.Elements.ClassDefinition) As PXW.DEV.BNF.Compilers.elementHandler(Type="ClassDefinition")
{
    Set keywordatom=element.FirstAtom()
    Do ..OutputKeywordCommentAsDocumentation(element,.commentid)
    Set count=##class(PXW.Xref.Queries).GetCount(%NS,"CLS",..This)
    Set menu="<div class='CDEFItemMenu nocopy'>"
    Set menu=menu_"<a class='CDEFOption' href='"_##class(PXW.Tools.DEV.Xref).HREFTo("CLS",..This,)_"'>Xref ("_count_") </a>"
    Set overriddenby=##class(PXW.Xref.Queries).GetCount(%NS,"CLS",..This,"_class","_Extends")
    If overriddenby>0 {
        Set menu=menu_"<a class='CDEFOption' href='"_##class(PXW.Tools.DEV.Xref).HREFTo("CLS",..This,"","_Extends")_"'>Extended "_overriddenby_" </a>"
    }
    Set menu=menu_"</div>"
    Do ..wrapAtomHTML(keywordatom,menu,"")
    Quit ""
}

Method writeCDEFAttributeViewQuery(element As PXW.DEV.BNF.Elements.ClassDefinition) As PXW.DEV.BNF.Compilers.elementHandler(Type="AttributeViewquery")
{
    Set ..SqlProgramAnalyser=""
    Set queryE=element.findFirstElementByType("ClassQueryBody")
    ;s formatter=##class(PXW.DEV.BNF.Format.SQL).%New()
    ;d formatter.formatElement(queryE)
    If $ISOBJECT(queryE) {
        Do ..wrapElementHTML(queryE,"<div>","</div>")
    }
    Quit ""
}

Method writeCDEFClassProperty(element As PXW.DEV.BNF.Elements.ClassDefinition) As PXW.DEV.BNF.Compilers.elementHandler(Type="ClassProperty")
{
    Set keywordatom=element.FirstAtom()
    Set nameelement=element.findFirstElementByType("PropertyName")
    If $ISOBJECT(nameelement) {
        Set name=nameelement.ToString(0)
        Set count=##class(PXW.Xref.Queries).GetCount(%NS,"CLS",..This,name)
        Set menu="<div class='CDEFItemMenu nocopy'>"
        Set menu=menu_"<a class='CDEFOption' href='"_##class(PXW.Tools.DEV.Xref).HREFTo("CLS",..This,name)_"'>Xref ("_count_") </a>"
        Set overrides=..ClassServer.GetPropertyOverrides(..This_"||"_name)
        If overrides'="" {
            Set menu=menu_"<a class='CDEFOption' href='"_..HREFToClass(overrides,name)_"'>Override </a>"
        }
        Set overriddenby=##class(PXW.Xref.Queries).GetCount(%NS,"CLS",..This,name,"_Override")
        If overriddenby>0 {
            Set menu=menu_"<a class='CDEFOption' href='"_##class(PXW.Tools.DEV.Xref).HREFTo("CLS",..This,name,"_Override")_"'>Overridden "_overriddenby_" </a>"
        }
        Set menu=menu_"</div>"
        Do ..wrapAtomHTML(keywordatom,menu,"")
    }
    Quit ""
}

Method writeCDEFClassParameter(element As PXW.DEV.BNF.Elements.ClassDefinition) As PXW.DEV.BNF.Compilers.elementHandler(Type="ClassParameter")
{
    Set keywordatom=element.FirstAtom()
    Set nameelement=element.findFirstElementByType("ClassParameterName")
    If $ISOBJECT(nameelement) {
        Set name=nameelement.ToString(0)
        Set count=##class(PXW.Xref.Queries).GetCount(%NS,"CLS",..This,name)
        Set menu="<div class='CDEFItemMenu  nocopy'>"
        Set menu=menu_"<a class='CDEFOption' href='"_##class(PXW.Tools.DEV.Xref).HREFTo("CLS",..This,name)_"'>Xref ("_count_") </a>"
        Set overrides=..ClassServer.GetParameterOverrides(..This_"||"_name)
        If overrides'="" {
            Set menu=menu_"<a class='CDEFOption' href='"_..HREFToClass(overrides,name)_"'>Override </a>"
        }
        Set overriddenby=##class(PXW.Xref.Queries).GetCount(%NS,"CLS",..This,name,"_Override")
        If overriddenby>0 {
            Set menu=menu_"<a class='CDEFOption' href='"_##class(PXW.Tools.DEV.Xref).HREFTo("CLS",..This,name,"_Override")_"'>Overridden "_overriddenby_" </a>"
        }
        Set menu=menu_"</div>"
        Do ..wrapAtomHTML(keywordatom,menu,"")
    }

    Quit ""
}

Method writeCDEFClassMethod(element As PXW.DEV.BNF.Elements.ClassDefinition) As PXW.DEV.BNF.Compilers.elementHandler(Type="ClassClassMethod")
{
    Set keywordatom=element.FirstAtom()
    Set nameelement=element.findFirstElementByType("MethodName")
    If $ISOBJECT(nameelement) {
        Set name=nameelement.ToString(0)
        Set count=##class(PXW.Xref.Queries).GetCount(%NS,"CLS",..This,name)
        Set menu="<div class='CDEFItemMenu  nocopy'>"
        Set menu=menu_"<a class='CDEFOption' href='"_##class(PXW.Tools.DEV.Xref).HREFTo("CLS",..This,name)_"'>Xref ("_count_") </a>"
        Set overrides=..ClassServer.GetMethodOverrides(..This_"||"_name)
        If overrides'="" {
            Set menu=menu_"<a class='CDEFOption' href='"_..HREFToClass(overrides,name)_"'>Override </a>"
        }
        Set overriddenby=##class(PXW.Xref.Queries).GetCount(%NS,"CLS",..This,name,"_Override")
        If overriddenby>0 {
            ;d ..wrapElementHTML(keywordatom,"<a class='CDEFOption nocopy' href='"_##class(PXW.Tools.DEV.Xref).HREFTo("CLS",..This,name)_"'>Overridden "_overriddenby_" </a>","")
            Set menu=menu_"<a class='CDEFOption' href='"_##class(PXW.Tools.DEV.Xref).HREFTo("CLS",..This,name,"_Override")_"'>Overridden "_overriddenby_" </a>"
        }
        Set menu=menu_"</div>"
        Do ..wrapAtomHTML(keywordatom,menu,"")
    }
    Quit ""
}

Method writeCDEFMethod(element As PXW.DEV.BNF.Elements.ClassDefinition) As PXW.DEV.BNF.Compilers.elementHandler(Type="ClassMethod")
{
    Do ..writeCDEFClassMethod(element)
    Quit ""
}

Method writeCDEFClassQuery(element As PXW.DEV.BNF.Elements.ClassDefinition) As PXW.DEV.BNF.Compilers.elementHandler(Type="ClassQuery")
{
    Set ..SqlProgramAnalyser=""
    Set keywordatom=element.FirstAtom()
    Set nameelement=element.findFirstElementByType("QueryName")
    If $ISOBJECT(nameelement) {
        Set name=nameelement.ToString(0)
        Set count=##class(PXW.Xref.Queries).GetCount(%NS,"CLS",..This,name)
        Set menu="<div class='CDEFItemMenu nocopy'>"
        Set menu=menu_"<a class='CDEFOption' href='"_##class(PXW.Tools.DEV.Xref).HREFTo("CLS",..This,name)_"'>Xref ("_count_") </a>"
        ; not sure if/how I recognise overridden QUERIES
        /*Set overrides=..ClassServer.GetPropertyOverrides(..This_"||"_name)
        If overrides'="" {
            Set menu=menu_"<a class='CDEFOption' href='"_..HREFToClass(overrides,name)_"'>Override </a>"
        }*/
        Set overriddenby=##class(PXW.Xref.Queries).GetCount(%NS,"CLS",..This,name,"_Override")
        If overriddenby>0 {
            Set menu=menu_"<a class='CDEFOption' href='"_##class(PXW.Tools.DEV.Xref).HREFTo("CLS",..This,name,"_Override")_"'>Overridden "_overriddenby_" </a>"
        }
        Set menu=menu_"</div>"
        Do ..wrapAtomHTML(keywordatom,menu,"")
    }

    Quit ""
}

Method writeCDEFClassQueryBody(element As PXW.DEV.BNF.Elements.ClassDefinition) As PXW.DEV.BNF.Compilers.elementHandler(Type="ClassQueryBody")
{
    ; not working
    ;Set formatter=##class(PXW.DEV.BNF.Format.SQL).%New()
    ;Do formatter.formatElement(element)
    Do ..wrapElementHTML(element,"<span class='EmbeddedSQL'>","</span>")
    Quit ""
}

/// NOTE: this is a special hand coded type of Xdata (see Run.ClassDefinition)
Method writeCDEFXdataSql(element As PXW.DEV.BNF.Elements.ClassDefinition) As PXW.DEV.BNF.Compilers.elementHandler(Type="XdataSql")
{
    Set ..SqlProgramAnalyser=""
    Do ..wrapElementHTML(element,"<span class='EmbeddedSQL'>","</span>")
    Quit ""
}

Method writeCDEFIndex(element As PXW.DEV.BNF.Elements.ClassDefinition) As PXW.DEV.BNF.Compilers.elementHandler(Type="ClassIndex")
{
    Set keywordatom=element.FirstAtom()
    Set nameelement=element.findFirstElementByType("IndexName")
    If $ISOBJECT(nameelement) {
        Set name=nameelement.ToString(0)
        Set count=##class(PXW.Xref.Queries).GetCount(%NS,"CLS",..This,name)
        Set menu="<div class='CDEFItemMenu nocopy'>"
        Set menu=menu_"<a title='This does NOT show where its used as a index in SQL, only where its used as Unique Open method' class='CDEFOption' href='"_##class(PXW.Tools.DEV.Xref).HREFTo("CLS",..This,name)_"'>Xref ("_count_") </a>"
        ; not sure if indices even can be overridden
        /*Set overrides=..ClassServer.GetPropertyOverrides(..This_"||"_name)
        If overrides'="" {
            Set menu=menu_"<a class='CDEFOption' href='"_..HREFToClass(overrides,name)_"'>Override </a>"
        }*/
        Set overriddenby=##class(PXW.Xref.Queries).GetCount(%NS,"CLS",..This,name,"_Override")
        If overriddenby>0 {
            Set menu=menu_"<a class='CDEFOption' href='"_##class(PXW.Tools.DEV.Xref).HREFTo("CLS",..This,name,"_Override")_"'>Overridden "_overriddenby_" </a>"
        }
        Set menu=menu_"</div>"
        Do ..wrapAtomHTML(keywordatom,menu,"")
    }
    Quit ""
}

Method writeCDEFTypeClassReference(element As PXW.DEV.BNF.Elements.ClassDefinition) As PXW.DEV.BNF.Compilers.elementHandler(Type="TypeClassReference")
{
    /*
    Element=TypeClassReference PXW.DEV.BNF.Element @134
    .Element=ClassReference PXW.DEV.BNF.Element @310
    ..type=ClassReference:
    .. %String
    .Element=TypeParameters PXW.DEV.BNF.Element @208
    ..type=punctuation:
    .. (
    ..Element=TypeParametersList PXW.DEV.BNF.Element @86
    ...Element=TypeParameterItem PXW.DEV.BNF.Element @385
    ....Element=ClassItemIdentifier PXW.DEV.BNF.Element @347
    .....type=ClassItemIdentifier:
    ..... MAXLEN
    ....type=punctuation:
    .... =
    ....Element=Number PXW.DEV.BNF.Element @309
    .....type=Number:
    ..... 1
    ..type=punctuation:
    .. )
    */

    Set crefE=element.findFirstElementByType("ClassReference",0)
    If $ISOBJECT(crefE) {
        Set class=crefE.ToString(0)
    
        Set paramE=element.findFirstElementByType("TypeParameters",0)
        If $ISOBJECT(paramE) {
            Set list=##class(%ListOfObjects).%New()
            Do paramE.findElementsByType("ClassItemIdentifier",list,2)
            For i=1:1:list.Count() {
                Set itemE=list.GetAt(i)
                If $LISTFIND($LISTFROMSTRING("Property","Relationship"),..ThisItemType) {
                    Do ..wrapElementHTML(itemE,"<a href='"_..HREFToClass(..This,..ThisMethod,itemE.ToString(0))_"'>","</a>")
                } Else {
                    Do ..wrapElementHTML(itemE,"<a href='"_..HREFToClass(class,itemE.ToString(0))_"'>","</a>")
                }
            }
        }
    }

    Quit ""
}

Method writeCDEFOneClassMember2(element As PXW.DEV.BNF.Elements.ClassDefinition) As PXW.DEV.BNF.Compilers.elementHandler(Type="OneClassmember")
{
    Set ..Analyser=##class(PXW.DEV.BNF.Analyse.COS).%New(..ClassServer)
    Set ..Analyser.This=..This
    Do ..Analyser.checkElement(element)
    Quit ""
}

Method writeCDEFClassItemIdentifier(element As PXW.DEV.BNF.Elements.ClassDefinition) As PXW.DEV.BNF.Compilers.elementHandler(Type="ClassItemIdentifier")
{
    Do ..wrapElementHTML(element,"<span class='CDEFMember'>","</span>")
    Quit ""
}

Method writeCDEFFormalSpecList(element As PXW.DEV.BNF.Elements.ClassDefinition) As PXW.DEV.BNF.Compilers.elementHandler(Type="FormalSpecList")
{
    Do ..wrapElementHTML(element,"<span class='CDEFFormalSpecList'>","</span>")
    Quit ""
}

Method writeCDEFFormalSpecItem(element As PXW.DEV.BNF.Elements.ClassDefinition) As PXW.DEV.BNF.Compilers.elementHandler(Type="FormalSpecItem")
{
    Do ..wrapElementHTML(element," <span class='CDEFFormalSpecItem'>","</span>") ; note the space BEFORE the span starts, ensures the new item wraps onto next line if necessary
    Quit ""
}

Method writeCDEFClassXdata(element As PXW.DEV.BNF.Elements.ClassDefinition) As PXW.DEV.BNF.Compilers.elementHandler(Type="ClassXdata")
{
    Set nameE=element.findFirstElementByType("XdataName")
    If $ISOBJECT(nameE) {
        Set name=nameE.ToString(0)
        Set ..XMLPath=..XMLPath_"/"_name
    }
    Quit ""
}

/*
method writeCDEFXdataName(element As PXW.DEV.BNF.Elements.ClassDefinition) AS PXW.DEV.BNF.Compilers.elementHandler(Type="XdataName")
{
    Set ..XMLPath=..XMLPath_"/"_element.ToString(0)
    q ""
}
*/
Method writeCDEFXmlData(element As PXW.DEV.BNF.Elements.ClassDefinition) As PXW.DEV.BNF.Compilers.elementHandler(Type="XmlData")
{
    Set tagnameE=element.findFirstElementByType("XmlTagName",1)
    If $ISOBJECT(tagnameE) {
        Set ..XMLPath=..XMLPath_"/"_tagnameE.ToString(0)
    }
    Quit ""
}

Method writeCDEFXmlTagName(element As PXW.DEV.BNF.Elements.ClassDefinition) As PXW.DEV.BNF.Compilers.elementHandler(Type="XmlTagName")
{
    Do ..wrapElementHTML(element,"<span class='XMLTag' title='"_..XMLPath_"'>","</span>")
    Quit ""
}

Method writeCDEFXmlAttribute(element As PXW.DEV.BNF.Elements.ClassDefinition) As PXW.DEV.BNF.Compilers.elementHandler(Type="XmlAttribute")
{
    Set attnameE=element.findFirstElementByType("XmlAttributeName")
    If $ISOBJECT(attnameE) {
        Set ..XMLPath=..XMLPath_"/"_attnameE.ToString(0)
        Do ..wrapElementHTML(attnameE,"<span class='XMLAttribute'>","</span>")
    }
    Quit ""
}

Method writeCDEFXmlAttributeValue(element As PXW.DEV.BNF.Elements.ClassDefinition) As PXW.DEV.BNF.Compilers.elementHandler(Type="XmlAttributeValue")
{
    If ..XMLPath="/UrlMap/Routes/Route/Call" {
        Set callname=element.ToString(0)
        Set callname=$TRANSLATE(callname,"'""","") ; get rid of quotes
        Do ..wrapElementHTML(element,"<a class='COSObjectMember' href='"_..HREFToClass(..This,callname)_"'>","</a>")
    } Else {
        Do ..wrapElementHTML(element,"<span class='XMLTag' title='"_..XMLPath_"'>","</span>")
    }
    Quit ""
}

Method writeCDEFXmlCdataText(element As PXW.DEV.BNF.Elements.ClassDefinition) As PXW.DEV.BNF.Compilers.elementHandler(Type="XmlCdataText")
{
    If ..XMLPath="/file/bnf/data" {
        Do ..writeElementBNF1(element)
    }
    Quit ""
}

/*
method writeCDEF(element As PXW.DEV.BNF.Elements.ClassDefinition) AS PXW.DEV.BNF.Compilers.elementHandler(Type="")
{

    q ""
}
*/
Method writeCOSCosDirective(element As PXW.DEV.BNF.Elements.COS) As PXW.DEV.BNF.Compilers.elementHandler(Type="CosDirective")
{
    ;#define
    Set keywordatom=element.FirstAtom()
    Set defineE=element.findFirstElementByType("CosDirectiveDefine",0)
    If '$ISOBJECT(defineE) {
        Set defineE=element.findFirstElementByType("CosDirectiveDefonearg",0)
    }
    If $ISOBJECT(defineE) {
        If ..ThisType="INC" {
            Set nameE=defineE.findFirstElementByType("CosDirectiveDefineName",0)
            If $ISOBJECT(nameE) {
                Set name=nameE.ToString(0)
                Set count=##class(PXW.Xref.Queries).GetCount(%NS,"INC",..This,name)
                Set anchor="anchor"_name_nameE.type
                ;Set ..ThisMethod=name
                If ..BookMark'="",$$$UPPER(name)=$$$UPPER(..BookMark) {
                    ;d ..wrapElementHTML(element,"<a name='bookmark'>","</a>")
                    Set anchor="bookmark" ;
                    Do ..wrapElementHTML(nameE,"<span class='hilite'>","</span>")
                }
                Do ..AddToIndex(name,"MAC",anchor)
                Do ..wrapElementHTML(element,"<a name='"_anchor_"'>","</a>") ; anchor goes before the member (ie before the comment)

                Set menu="<div class='CDEFItemMenu  nocopy'>"
                Set menu=menu_"<a class='CDEFOption' href='"_##class(PXW.Tools.DEV.Xref).HREFTo("INC",..This,name)_"'>Xref ("_count_") </a>"
                Set menu=menu_"</div>"
                Do ..wrapAtomHTML(keywordatom,menu,"")
            }
        }
    }
    Quit ""
}

Method writeCOSClassExpression(element As PXW.DEV.BNF.Elements.COS) As PXW.DEV.BNF.Compilers.elementHandler(Type="ClassExpression")
{
    ; ##class()
    Set classnameele=element.findFirstElementByType("ClassReference",0)
    Set classname=classnameele.ToString(0)
    Do ..FollowObjectChainForType(element,classname)
    Quit ""
}

Method writeCOSThisThing(element As PXW.DEV.BNF.Elements.COS) As PXW.DEV.BNF.Compilers.elementHandler(Type="ThisObject,ThisObjectDirectProperty,ThisObjectSet,ThisObjectDirectPropertySet")
{
    If ..This'="" {
        Set classname=..This
        If classname'="" Do ..FollowObjectChainForType(element,classname)
    }
    Quit ""
}

Method writeCOSVariable(element As PXW.DEV.BNF.Elements.COS) As PXW.DEV.BNF.Compilers.elementHandler(Type="Variable,VariableSet,ObjectVariable")
{
    ; known variable
   
    Set variablename=element.ToStringAtomsOnly(0)
    ; variable could be something like {*} or {field}  so the name above (using atoms only) will not find anything
    ; don't worry about that at the moment!
    If variablename'="",$ISOBJECT(..Analyser) {
        ; when working out a type use the #DIM type if there is one
        Set classname=$GET(..Analyser.DimmedTypes(variablename))
        If classname="" Set classname=$GET(..Analyser.VariablesTypes(variablename))
        If classname'="" Do ..FollowObjectChainForType(element,classname)

        ; treat %parameter("xxx") as a parameter
        if ..Analyser.CodeMode="OBJECTGENERATOR",variablename="%parameter" {
            s arrayE=element.findFirstElementByType(("ArrayParameterList"),0)
            if $isobject(arrayE) {
                s parameter=..Analyser.SimplifySubscripts(arrayE)
                ; is the paremeter a string
                i parameter?1"""".AN1"""" {
                    d ..wrapElementHTML(arrayE,"<a href='"_..HREFToClass(..This,$tr(parameter,"""",""))_"'>","</a>")
                }
            }
        }
    }
    Quit ""
}

Method writeCOSLabelDefinition(element As PXW.DEV.BNF.Elements.COS) As PXW.DEV.BNF.Compilers.elementHandler(Type="LabelDefinition")
{
    #dim labatom,anchorAtom as PXW.DEV.Atom

    Set labatom=element.FirstAtom()
    Set lab=labatom.value
    Set ..ThisLabel=lab
    Set anchorAtom=labatom.getComment()
    If anchorAtom="" Set anchorAtom=labatom
    If lab=..HiliteLabel {
        If anchorAtom=labatom {
               Do ..wrapAtomHTML(anchorAtom,"<a name='Bookmark' class='hilite'>","</a>")
        } Else {
                       Do ..wrapAtomHTML(anchorAtom,"<a name='Bookmark'>","</a>")
                       Do ..wrapAtomHTML(labatom,"<a class='hilite'>","</a>")
        }
        If ..HilitePlus'="" Set ..HiLiteLine=labatom.line+..HilitePlus
    } Else {
        Set labname=$TRANSLATE("LAB"_..ThisMethod_lab,"$^%_","")
        Do ..wrapAtomHTML(anchorAtom,"<a class='COSLabelDef' name='"_labname_"'>","</a>")
    }
    Quit ""
}

Method writeCOSLabelReference(element As PXW.DEV.BNF.Elements.COS) As PXW.DEV.BNF.Compilers.elementHandler(Type="LabelReference")
{
    Set lab=element.ToString(0)
    If lab["^" {
        Do ..wrapElementHTML(element,"<a class='COSLabel' href='"_..HREFToRoutine(lab)_"'>","</a>")
    } Else {
        Set labname=$TRANSLATE("LAB"_..ThisMethod_lab,"$^%_","")
        Do ..wrapElementHTML(element,"<a class='COSLabel' href='#"_labname_"'>","</a>")
    }
    Quit ""
}

Method writeCOSCosCodeBlock(element As PXW.DEV.BNF.Elements.COS) As PXW.DEV.BNF.Compilers.elementHandler(Type="CosCodeBlock")
{
    Do ..wrapElementHTML(element,"<span class='EmbeddedCOS'>","</span>")
    Quit ""
}

Method writeCOSPythonImport(element As PXW.DEV.BNF.Elements.COS) As PXW.DEV.BNF.Compilers.elementHandler(Type="PythonImport")
{
    Set stringE=element.findFirstElementByType("String")
    If $ISOBJECT(stringE) {
        Set atom=stringE.FirstAtom()
        If $ISOBJECT(atom) {
            Do ..wrapAtomHTML(atom,"<a class='CDEFClassName' href='"_..HREFToPython(atom.value)_"'>","</a>")
            Set atom.type="pythonimport"
        }
    }       
    Quit ""
}

Method writeCOSMacrocall(element As PXW.DEV.BNF.Elements.COS) As PXW.DEV.BNF.Compilers.elementHandler(Type="Macrocall")
{
    #dim a as %Dictionary.ClassDefinition
    Set macroatom=element.partsGetAt(2)
    If $ISOBJECT(macroatom) {
        Set name=macroatom.ToString(0)
        If name'="" {
            If $ISOBJECT(..Analyser) {
                ;zw ..Analyser,name
                If '$DATA(..Analyser.DefinedMacros(name)) {
                    Do ..wrapAtomHTML(macroatom,"<a href='"_..HREFToInclude(,element.ToString(0))_"'>","</a>")
                } Else {
                    Do ..wrapAtomHTML(macroatom,"<span title'Local macro'>","</span>")
                }
            } Else {
                Do ..wrapAtomHTML(macroatom,"<a href='"_..HREFToInclude(,element.ToString(0))_"'>","</a>")
            }
        }
    }
    Quit ""
}

Method writeCOSCosDirectiveIncludeName(element As PXW.DEV.BNF.Elements.COS) As PXW.DEV.BNF.Compilers.elementHandler(Type="CosDirectiveIncludeName")
{
    Do ..wrapElementHTML(element,"<a href='"_..HREFToInclude(element.ToString(0))_"'>","</a>")
    Quit ""
}

Method writeCOSClassmethodMethod(element As PXW.DEV.BNF.Elements.COS) As PXW.DEV.BNF.Compilers.elementHandler(Type="ClassmethodMethod")
{

    if $ISOBJECT(..Analyser) {
        set expressionE=element.findFirstElementByType("Expression")
        if $isobject(expressionE) {
            set simple=..Analyser.SimplifyExpression(expressionE) 
            ; its a string, so its a hard coded method name
            if $e(simple,1)="""",$e(simple,*)="""" {
                s mname=$tr(simple,"""","")
                d ..wrapElementHTML(expressionE,"<a href='"_##class(PXW.Tools.DEV.Xref).HREFTo("CLS","*",mname)_"'>","</a>")
            }
        }
    }
    Quit ""
}

Method writeCOSGlobals(element As PXW.DEV.BNF.Elements.COS) As PXW.DEV.BNF.Compilers.elementHandler(Type="GlobalRef,GlobalRefSet")
{
    Set setting=0
    If element.type="GlobalRefSet" Set setting=1
    Set fullrefE=element.findFirstElementByType("GlobalRefFull",0)
    If $ISOBJECT(fullrefE) {
        ; On a global clicking on the ^ will take directly to the XREF since we don't
        ; have any other details about the global at the moment.
        ; Clicking on the name of the global highlights it like a regular variable
        Set globalElement=fullrefE.findFirstElementByType("GlobalName",0)
        Set upa=fullrefE.FirstAtom() ; ^ is always at the start
        Set namea=globalElement ;.ToStringAtomsOnly()
        ;d ..wrapAtomHTML(upa,"<a class='COSGlobalSet' href='"_##class(PXW.Tools.DEV.Xref).HREFTo("GBL",globalElement.Name.ToString(0),globalElement.KeysForXref())_"'>","</a>")
        Set subsE=fullrefE.findFirstElementByType("SubscriptParameterList",0),subs=""
        If $ISOBJECT(subsE),$ISOBJECT(..Analyser) Set subs=..Analyser.SimplifySubscripts(subsE)
        If $ISOBJECT(namea) {
            Do ..wrapAtomHTML(upa,"<a class='COSGlobalSet' href='"_##class(PXW.Tools.DEV.Xref).HREFTo("GBL",namea.ToStringAtomsOnly(0),subs)_"'>","</a>")
            Set varname="GLOBAL"_namea.ToStringAtomsOnly(0)
            If setting {
                Do ..wrapAtomHTML(namea,"<span class='COSGlobalSet' varid='"_varname_"' onclick=""HiliteSets('"_varname_"');"">","</span>")
                    } Else {
                Do ..wrapAtomHTML(namea,"<span class='COSGlobal' fetchid='"_varname_"' onclick=""HiliteSets('"_varname_"');"">","</span>")
            }
        }
    } Else {
        ; not sure what we can do with naked refs here (other than make them stand out as a bad thing)
    }
    Quit ""
}

Method writeCOSHtmlBody(element As PXW.DEV.BNF.Elements.COS) As PXW.DEV.BNF.Compilers.elementHandler(Type="HtmlBody")
{
    Do ..wrapElementHTML(element,"<span class='EmbeddedXML'>","</span>")
    Quit ""
}

Method writeCOSJsBody(element As PXW.DEV.BNF.Elements.COS) As PXW.DEV.BNF.Compilers.elementHandler(Type="JsBody")
{
    Do ..wrapElementHTML(element,"<span class='EmbeddedJS'>","</span>")
    Quit ""
}

Method writeCOSSqlBody(element As PXW.DEV.BNF.Elements.COS) As PXW.DEV.BNF.Compilers.elementHandler(Type="SqlBody")
{
    Set ..SqlProgramAnalyser=""
    Do ..wrapElementHTML(element,"<span class='EmbeddedSQL'>","</span>")
    Quit ""
}

/*method writeCOS(element As PXW.DEV.BNF.Elements.COS) AS PXW.DEV.BNF.Compilers.elementHandler(Type="")
{
    q ""
}
*/
Method writeSQLStoredProcName(element As PXW.DEV.BNF.Elements.SQL) As PXW.DEV.BNF.Compilers.elementHandler(Type="StoredProcName")
{
    Set spname=element.ToString(0)
    Do ..wrapElementHTML(element,"<a class='COSObjectMember' href='"_..HREFToClass(spname)_"'>","</a>") 
    Quit ""
}

/// WHY IS THIS HERE and not just in a WithClause section?
Method writeSQLWithCommand(element As PXW.DEV.BNF.Elements.SQL) As PXW.DEV.BNF.Compilers.elementHandler(Type="WithCommand")
{
    Do element.findElementsByType("WithClause",.withlist)
    For i=1:1:withlist.Count() {
        Set withE=withlist.GetAt(i)
        Set aliasE=withE.findFirstElementByType("AliasName")	    
        If $ISOBJECT(aliasE) {
            Set aliasname="alias"_aliasE.ToString(0)
            Do ..wrapElementHTML(aliasE,"<span class='SQLTableAliasSet' title='show alias usage' varid='"_$$$UPPER(aliasname)_"' onclick=""HiliteSets('"_$$$UPPER(aliasname)_"');"">","</span>")
        }	    
    }    
    Quit ""
}

Method writeSQLWithClause(element As PXW.DEV.BNF.Elements.SQL) As PXW.DEV.BNF.Compilers.elementHandler(Type="WithClause")
{
    Do ..wrapElementHTML(element,"<span class='SQLSection'>","</span>")
    Quit ""
}

Method writeSQLWhereClause(element As PXW.DEV.BNF.Elements.SQL) As PXW.DEV.BNF.Compilers.elementHandler(Type="WhereClause")
{
    Do ..wrapElementHTML(element,"<span class='SQLSection'>","</span>")
    Quit ""
}

Method writeSQLDerivedColumn(element As PXW.DEV.BNF.Elements.SQL) As PXW.DEV.BNF.Compilers.elementHandler(Type="DerivedColumn")
{
    ; work out what this column is called
    ; either from the AS clause or if its just referencing 
    ; a single column, that column is the name
    ; then create an ID for it so it can be highlighted
    #dim col as PXW.DEV.Element
    Set col=element
    Set classtxt="class='SQLSection'"
    Set colname="colxxxx"

    Set asclause=col.findFirstElementByType("AsClause",0)
    If $ISOBJECT(asclause) {
        Set colnameE=asclause.findFirstElementByType("ColumnName",0)
        If $ISOBJECT(colnameE) {
            Set colname="col"_$$$UPPER(colnameE.ToString(0))
        }
    } Else {
        Kill colrefs
        ; if the column is just a reference to another column
        Do col.findElementsByType("ColumnReference",.colrefs,2)
        If $ISOBJECT($GET(colrefs)),colrefs.Count()=1 {
            Set colnameE=colrefs.GetAt(1).findFirstElementByType("ColumnName",0)
            If $ISOBJECT(colnameE) {
                Set colname="col"_$$$UPPER(colnameE.ToString(0))
            }
        }
    }
    If ..BookMark'="",$$$UPPER(colname)=$$$UPPER("col"_..BookMark) {
        Set classtxt="class='hilite'"
    }
    Do ..wrapElementHTML(col,"<span "_classtxt_" fetchid='"_$$$UPPER(colname)_"'>","</span>")        
    
    Quit ""
}

Method writeSQLJoin(element As PXW.DEV.BNF.Elements.SQL) As PXW.DEV.BNF.Compilers.elementHandler(Type="Join")
{
    Do ..wrapElementHTML(element,"<span class='SQLSection'>","</span>")
    Quit ""
}

Method writeSQLProgram(element As PXW.DEV.BNF.Elements.SQL) As PXW.DEV.BNF.Compilers.elementHandler(Type="QuerySpecification")
{
    If ..SqlProgramAnalyser="" {
        Set sqlanalyse=##class(PXW.DEV.BNF.Analyse.SQL).%New(..ClassServer)
        Set sqlanalyse.This=..This
        Set sqlanalyse.SqlProgram=1
        Do sqlanalyse.checkElement(element)
        Set ..SqlProgramAnalyser=sqlanalyse
    }
    Quit ""
}

Method writeSQLSelectCommand(element As PXW.DEV.BNF.Elements.SQL) As PXW.DEV.BNF.Compilers.elementHandler(Type="SelectCommand")
{
    #dim subAnalyser as PXW.DEV.BNF.Analyse.SQL
    If $ISOBJECT(..SqlProgramAnalyser) {
        Set sqlanalyse=$GET(..SqlProgramAnalyser.SelectCommandAnalysis(+element))
    } Else {
        ; certain types of subquery are not being coverded by the program analyse yet, so treat separately for now
        Set sqlanalyse=##class(PXW.DEV.BNF.Analyse.SQL).%New(..ClassServer)
        Set sqlanalyse.This=..This
        Do sqlanalyse.checkElement(element)
    }
    Set cref=""
    While sqlanalyse.NextColumnReference(.cref,.fulltable,.fieldname) {
        Set aliasNameE=cref.findFirstElementByType("AliasName",1) ; hmm, in a group, can we promote in bnf?
        Set columnNameE=cref.findFirstElementByType("ColumnName",0)
        ;zw cref,fulltable,fieldname
        If $ISOBJECT(..SqlProgramAnalyser) {
            If fulltable'="",$DATA(..SqlProgramAnalyser.withReferences(fulltable)) {
                Set fulltable=""
            }
        }
        If fulltable'="" {
            Do ..FollowImplicitJoins(cref,fulltable)
        } Else {
            Set colname="col"_$$$UPPER(fieldname)
            If fulltable'="" {
                Do ..FollowImplicitJoins(cref,fulltable)
            } Else {
                Do ..wrapElementHTML(columnNameE,"<span class='COSObjectMember' title='still unable to determine class, possibly because of subquery' fetchid='"_$$$UPPER(colname)_"' onclick=""HiliteSets('"_$$$UPPER(colname)_"');"">","</span>")
            }
        }
        If $ISOBJECT(aliasNameE) {
            Set aliasname="alias"_aliasNameE.ToString(0)
            Do ..wrapElementHTML(aliasNameE,"<span class='SQLTableAlias' title='show alias usage' fetchid='"_$$$UPPER(aliasname)_"' onclick=""HiliteSets('"_$$$UPPER(aliasname)_"');"">","</span>")
        }
    }    
    Quit ""
}

Method writeSQLInsertCommand(element As PXW.DEV.BNF.Elements.SQL) As PXW.DEV.BNF.Compilers.elementHandler(Type="InsertCommand")
{
    Set sqlanalyse=##class(PXW.DEV.BNF.Analyse.SQL).%New(..ClassServer)
    Set sqlanalyse.This=..This
    Do sqlanalyse.checkElement(element)
    Set columnNameE=""
    While sqlanalyse.NextColumnReference(.columnNameE,.fulltable,.fieldname) {
        ;s aliasNameE=cref.findFirstElementByType("AliasName",1) ; hmm, in a group, can we promote in bnf?
        ;s columnNameE=cref.findFirstElementByType("ColumnName",0)
        If fulltable'="" {
            Do ..wrapElementHTML(columnNameE,"<a class='COSObjectMember' href='"_..HREFToSQLTable(fulltable,columnNameE.ToString(0))_"'>","</a>")            
        } Else {
            ; should always be a name
            ;  s colname="col"_$$$UPPER(fieldname),aname=""
            ; d ..wrapElementHTML(columnNameE,"<span class='COSObjectMember' title='unable to determine class, possibly because of subquery' fetchid='"_$$$UPPER(colname)_"' onclick=""HiliteSets('"_$$$UPPER(colname)_"');"">","</span>")
        }
        ;i $ISOBJECT(aliasNameE) {
        ;    s aliasname="alias"_aliasNameE.ToString(0)
        ;    d ..wrapElementHTML(aliasNameE,"<span class='COSObjectMember' title='show alias usage' fetchid='"_$$$UPPER(aliasname)_"' onclick=""HiliteSets('"_$$$UPPER(aliasname)_"');"">","</span>")
        ;}
    }    
    Quit ""
}

Method writeSQL(element As PXW.DEV.BNF.Elements.SQL) As PXW.DEV.BNF.Compilers.elementHandler(Type="")
{
    Set sqlanalyse=##class(PXW.DEV.BNF.Analyse.SQL).%New(..ClassServer)
    Set sqlanalyse.This=..This
    Do sqlanalyse.checkElement(element)
    Set columnNameE=""
    While sqlanalyse.NextColumnReference(.columnNameE,.fulltable,.fieldname) {
        ;s aliasNameE=cref.findFirstElementByType("AliasName",1) ; hmm, in a group, can we promote in bnf?
        ;s columnNameE=cref.findFirstElementByType("ColumnName",0)
        If fulltable'="" {
            Do ..wrapElementHTML(columnNameE,"<a class='COSObjectMember' href='"_..HREFToSQLTable(fulltable,columnNameE.ToString(0))_"'>","</a>")            
        } Else {
            ; should always be a name
            ;  s colname="col"_$$$UPPER(fieldname),aname=""
            ; d ..wrapElementHTML(columnNameE,"<span class='COSObjectMember' title='unable to determine class, possibly because of subquery' fetchid='"_$$$UPPER(colname)_"' onclick=""HiliteSets('"_$$$UPPER(colname)_"');"">","</span>")
        }
        ;i $ISOBJECT(aliasNameE) {
        ;    s aliasname="alias"_aliasNameE.ToString(0)
        ;    d ..wrapElementHTML(aliasNameE,"<span class='COSObjectMember' title='show alias usage' fetchid='"_$$$UPPER(aliasname)_"' onclick=""HiliteSets('"_$$$UPPER(aliasname)_"');"">","</span>")
        ;}
    }    
    Quit ""
}

Method writeSQLDirectTable(element As PXW.DEV.BNF.Elements.SQL) As PXW.DEV.BNF.Compilers.elementHandler(Type="DirectTable")
{
    Set direct=element
    If $ISOBJECT(direct) {
        Set tablenameE=direct.findFirstElementByType("TableName",0)
        If $ISOBJECT(tablenameE) {
            Set tablename=tablenameE.ToString(0)
            ; is it a reference to a WITH?
            If tablename'="", tablename'[".", $ISOBJECT(..SqlProgramAnalyser), $GET(..SqlProgramAnalyser.withReferences(tablename))'="" {
                Set aliasname="alias"_tablename
                Do ..wrapElementHTML(tablenameE,"<span class='SQLTableAlias' title='show alias usage' varid='"_$$$UPPER(aliasname)_"' onclick=""HiliteSets('"_$$$UPPER(aliasname)_"');"">","</span>")
            } Else {
                Do ..wrapAtomHTML(tablenameE,"<a class='CDEFClassName' href='"_..HREFToSQLTable(tablename)_"'>","</a>")
            }
        }
    }    
    Quit ""
}

Method writeSQLTableAlias(element As PXW.DEV.BNF.Elements.SQL) As PXW.DEV.BNF.Compilers.elementHandler(Type="TableAlias")
{
    ;s aliasname="alias"_element.ToString(0)
    ;d ..wrapElementHTML(element,"<span class='SQLTableAliasSet' title='show alias usage' fetchid='"_$$$UPPER(aliasname)_"' onclick=""HiliteSets('"_$$$UPPER(aliasname)_"');"">","</span>")
    Quit ""
}

Method writeSQLTableAsClause(element As PXW.DEV.BNF.Elements.SQL) As PXW.DEV.BNF.Compilers.elementHandler(Type="TableAsClause")
{
    Set aliasE=element.findFirstElementByType("AliasName")
    If $ISOBJECT(aliasE) {
        Set aliasname="alias"_aliasE.ToString(0)
        Do ..wrapElementHTML(aliasE,"<span class='SQLTableAliasSet' title='show alias usage' varid='"_$$$UPPER(aliasname)_"' onclick=""HiliteSets('"_$$$UPPER(aliasname)_"');"">","</span>")
    }    
    Quit ""
}

/*
method writeSQL(element As PXW.DEV.BNF.Elements.SQL) AS PXW.DEV.BNF.Compilers.elementHandler(Type="")
{
    
    q ""
}
*/
Method writePYFile(element As PXW.DEV.BNF.Elements.Python) As PXW.DEV.BNF.Compilers.elementHandler(Type="File")
{
    Do ..wrapElementHTML(element,"<span class='EmbeddedPython'>","</span>") 
    Quit ""
}

Method writePYClassDefRaw(element As PXW.DEV.BNF.Elements.Python) As PXW.DEV.BNF.Compilers.elementHandler(Type="ClassDefRaw")
{
    Set nameatom=element.partsGetAt(2) ; should be 2
    If $ISOBJECT(nameatom) {
        Set aname="pyClassName"_nameatom.value
        Do ..AddToIndex(nameatom.value,"Class",aname)
        Do ..wrapAtomHTML(nameatom,"<span id='"_aname_"' class='CDEFClassName'>","</span>")
    }    
    Quit ""
}

Method writePYFunctionDef(element As PXW.DEV.BNF.Elements.Python) As PXW.DEV.BNF.Compilers.elementHandler(Type="FunctionDef")
{
    Set ..PythonAnalyser=##class(PXW.DEV.BNF.Analyse.Python).%New()
    Set ..PythonAnalyser.This=..This
    Do ..PythonAnalyser.middle(element)

    Set nameatom=element.partsGetAt(2) ; should be 2
    If $ISOBJECT(nameatom) {
        Do ..wrapAtomHTML(nameatom,"<span class='CDEFMember'>","</span>")
    }    
    Quit ""
}

Method writePYFunctionDefRaw(element As PXW.DEV.BNF.Elements.Python) As PXW.DEV.BNF.Compilers.elementHandler(Type="FunctionDefRaw")
{
    Set nameatom=element.partsGetAt(2) ; should be 2
    If $ISOBJECT(nameatom) {
        Set aname="pyDefName"_nameatom.value
        Do ..AddToIndex(nameatom.value,"MethodName",aname)
        Do ..wrapAtomHTML(nameatom,"<span id='"_aname_"' class='CDEFMember'>","</span>")
    }    
    Quit ""
}

Method writePYImportStmt(element As PXW.DEV.BNF.Elements.Python) As PXW.DEV.BNF.Compilers.elementHandler(Type="ImportStmt")
{
    Set nameE=element.findFirstElementByType("DottedName")
    If $ISOBJECT(nameE) {
        Set name=nameE.ToString(0)
        Do ..wrapElementHTML(nameE,"<a class='CDEFClassName' href='"_..HREFToPython(name)_"'>","</a>")
    }    
    Quit ""
}

Method writePYImportFrom(element As PXW.DEV.BNF.Elements.Python) As PXW.DEV.BNF.Compilers.elementHandler(Type="ImportFrom")
{
    Set nameE=element.findFirstElementByType("DottedAsNames")
    If $ISOBJECT(nameE) {
        Set name=nameE.ToString(0)
        Do ..wrapElementHTML(nameE,"<a class='CDEFClassName' href='"_..HREFToPython(name)_"'>","</a>")
    }   
    Quit ""
}

Method writePYStarTarget(element As PXW.DEV.BNF.Elements.Python) As PXW.DEV.BNF.Compilers.elementHandler(Type="StarTarget")
{
    Set varname=element.ToString(0)
    Set cssclass="COSVariable"
    If $ISOBJECT(..PythonAnalyser),..PythonAnalyser.IsParameterVariable(varname) Set cssclass="COSVariableParameter"
    Do ..wrapElementHTML(element,"<span class='"_cssclass_"' varid='"_varname_"' onclick=""HiliteSets('"_varname_"');"">","</span>")
    Quit ""
}

Method writePYParam(element As PXW.DEV.BNF.Elements.Python) As PXW.DEV.BNF.Compilers.elementHandler(Type="Param")
{
    Set varname=element.ToString(0)
    Set cssclass="COSVariable"
    If $ISOBJECT(..PythonAnalyser),..PythonAnalyser.IsParameterVariable(varname) Set cssclass="COSVariableParameter"
    Do ..wrapElementHTML(element,"<span class='"_cssclass_"' varid='"_varname_"' onclick=""HiliteSets('"_varname_"');"">","</span>")  
    Quit ""
}

Method writePYAtom(element As PXW.DEV.BNF.Elements.Python) As PXW.DEV.BNF.Compilers.elementHandler(Type="Atom")
{
    For  {
        Set a=element.partsGetNext(.akey)
        Quit:akey=""

        If a.%IsA("PXW.DEV.Atom") {
            Set type=$PIECE(a.type,":",1)
            If type="Identifier" {
                Set varname=a.value
                Set cssclass="COSVariable"
                If $ISOBJECT(..Analyser),..Analyser.IsParameterVariable(varname) Set cssclass="COSVariableParameter"
                If $ISOBJECT(..PythonAnalyser),..PythonAnalyser.IsParameterVariable(varname) Set cssclass="COSVariableParameter"
                Do ..wrapAtomHTML(a,"<span class='"_cssclass_"' fetchid='"_varname_"' onclick=""HiliteSets('"_varname_"');"">","</span>")
            } 
        }
    }    
    Quit ""
}

/*
method writePY(element As PXW.DEV.BNF.Elements.Python) AS PXW.DEV.BNF.Compilers.elementHandler(Type="")
{
    
    q ""
}
*/
Method FollowObjectChainForType(ParentElement As PXW.DEV.Element, StartClassName As %String)
{
    $$$DEBUGMethodBegin
    If (ParentElement.type="ThisObject") || (ParentElement.type="ThisObjectSet") {
        Set this=ParentElement.findFirstElementByType("ThisObjectSelf",0) ; ..property
        If $ISOBJECT(this) {
            Set objectchain=this.findFirstElementByType("ObjectChainNoDot",0)
        } Else {
            Set this=ParentElement.findFirstElementByType("ThisObjectThis",0) ; $this.property
            If $ISOBJECT(this) {
                Set objectchain=this.findFirstElementByType("ObjectChain",0)
            }
        }
    } ElseIf (ParentElement.type="ThisObjectDirectProperty") || (ParentElement.type="ThisObjectDirectPropertySet") {
        Set objectchain=ParentElement.findFirstElementByType("ObjectChainItem",0) ; i%property
    } Else {
        Set objectchain=ParentElement.findFirstElementByType("ObjectChain",1) ; var.property
    }
    Set path=""
    While $ISOBJECT(objectchain) {
        
        Set propertyatom=""
        ; the objectchain has the "." and the name
        For  {
            Set a=objectchain.partsGetNext(.akey)
            Quit:akey=""

            If a.%IsA("PXW.DEV.Atom"),a.value'="." {
                Set propertyatom=a
            }
        }

        Set path=path_"."_propertyatom.value
		Do ..wrapAtomHTML(propertyatom,"<a class='COSObjectMember' href='"_..HREFToClass(StartClassName,path)_"'>","</a>")
        Do ..writeCOSParameterChecks(StartClassName,path,objectchain)

        Set objectchain=objectchain.findFirstElementByType("ObjectChain",0) 
    }
    $$$DEBUGMethodEnd
}

Method writeCOSParameterChecks(ClassName As %String, MethodPath As %String, Element As PXW.DEV.Element)
{
    If ClassName="%Library.ResultSet",MethodPath=".%New" {
        Set paramsE=Element.findFirstElementByType("FunctionParameterList")
        Do paramsE.findElementsByType("FunctionParameter",.plist,0)
        If $ISOBJECT($GET(plist)) {
            Kill atoms
            Set p1=plist.GetAt(1)
            Set flat=..flattenlist(p1,.atoms),f2=..flattenold(p1)
            ;d p1.write() zw flat,f2,atoms
            
            ; "%Studio.Project:ProjectList
            ; flat=$lb($lb("String","%Studio.Project:ProjectList"))
            If atoms.Count()=1,$PIECE(atoms.GetAt(1).type,":",1)="String" {
                Set val=atoms.GetAt(1).value
                Set class=$PIECE(val,":",1)
                Set query=$PIECE(val,":",2)
                set a=atoms.GetAt(1)
                Do ..wrapAtomHTML(a,"<a class='CDEFClassName' href='"_..HREFToClass(class,query)_"'>","</a>")
            }

            ; ..%ClassName(1)_":ProjectList"
            ;=flat=$lb($lb("ObjectChainNoDot","%ClassName"),$lb("Number","1"),$lb("String",":ProjectList"))
            If atoms.Count()=3,$$$UPPER(atoms.GetAt(1).value)="%CLASSNAME",$PIECE(atoms.GetAt(3).type,":",1)="String" {
                Set class=..This
                Set query=$PIECE(atoms.GetAt(3).value,":",2)
                Set a=atoms.GetAt(3)
                Do ..wrapAtomHTML(a,"<a class='CDEFClassName' href='"_..HREFToClass(class,query)_"'>","</a>")
            }
            
            ; ..%ClassName(1)_":"_"ProjectList"
            ; flat=$lb($lb("ObjectChainNoDot","%ClassName"),$lb("Number","1"),$lb("String",":"),$lb("String","ProjectList"))
            If atoms.Count()=4,$$$UPPER(atoms.GetAt(1).value)="%CLASSNAME",atoms.GetAt(3).value=":",$PIECE(atoms.GetAt(4).type,":",1)="String" {
                Set class=..This
                Set query=atoms.GetAt(4).value
                Set a=atoms.GetAt(4)
                Do ..wrapAtomHTML(a,"<a class='CDEFClassName' href='"_..HREFToClass(class,query)_"'>","</a>")

            }
            
            ; $classname($this)_":ProjectList"
            ; flat=$lb($lb("keyword","classname"),$lb("keyword","$this"),$lb("String",":ProjectList"))
            If atoms.Count()=3,$$$UPPER(atoms.GetAt(1).value)="CLASSNAME",$PIECE(atoms.GetAt(3).type,":",1)="String" {
                Set class=..This
                Set query=$piece(atoms.GetAt(3).value,":",2)
                Set a=atoms.GetAt(3)
                Do ..wrapAtomHTML(a,"<a class='CDEFClassName' href='"_..HREFToClass(class,query)_"'>","</a>")
            }
            
            ; $classname($this)_":"_"ProjectList"
            ; flat=$lb($lb("keyword","classname"),$lb("keyword","$this"),$lb("String",":"),$lb("String","ProjectList"))
            If atoms.Count()=4,$$$UPPER(atoms.GetAt(1).value)="CLASSNAME",atoms.GetAt(3).value=":",$PIECE(atoms.GetAt(4).type,":",1)="String" {
                Set class=..This
                Set query=atoms.GetAt(4).value
                Set a=atoms.GetAt(4)
                Do ..wrapAtomHTML(a,"<a class='CDEFClassName' href='"_..HREFToClass(class,query)_"'>","</a>")
            }
            
            ; $classname()_":ProjectList"
            ; flat=$lb($lb("keyword","classname"),$lb("String",":ProjectList"))
            If atoms.Count()=2,$$$UPPER(atoms.GetAt(1).value)="CLASSNAME",$PIECE(atoms.GetAt(2).type,":",1)="String" {
                Set class=..This
                Set query=$PIECE(atoms.GetAt(2).value,":",2)
                Set a=atoms.GetAt(2)
                Do ..wrapAtomHTML(a,"<a class='CDEFClassName' href='"_..HREFToClass(class,query)_"'>","</a>")
            }

            ; $classname()_":"_"ProjectList"
            ; flat=$lb($lb("keyword","classname"),$lb("String",":"),$lb("String","ProjectList"))
            If atoms.Count()=3,$$$UPPER(atoms.GetAt(1).value)="CLASSNAME",atoms.GetAt(2).value=":",$PIECE(atoms.GetAt(3).type,":",1)="String" {
                Set class=..This
                Set query=atoms.GetAt(3).value
                Set a=atoms.GetAt(3)
                Do ..wrapAtomHTML(a,"<a class='CDEFClassName' href='"_..HREFToClass(class,query)_"'>","</a>")
            }

        }
    }
}

ClassMethod flattenlist(Element As PXW.DEV.Element, AtomList As %Library.ListOfObjects) As %List
{
	#dim a as PXW.DEV.Atom
	#dim e as PXW.DEV.Element
	
    If '$ISOBJECT($GET(AtomList)) Set AtomList=##class(%Library.ListOfObjects).%New()
    
 	Set list=""
    ;if AtomList'="" w "new list" s AtomList=##class(%ListOfObjects).%New()
	Set akey=""
	Set sep=""
    If Element.partsCount()=1 {
        Set single=1
    } Else {
        Set single=0
    }
	If 'single {
        ;Set list=list_$lb(Element.type)
    }
	For  {
		Set a=Element.partsGetNext(.akey)
		Quit:akey=""

        If a.%IsA("PXW.DEV.Element") {
            Set list=list_..flattenlist(a,.AtomList)
        } ElseIf $PIECE(a.type,":",1)="punctuation" {
            ; forget punctuation for the timebeing
            ;Set list=list_$lb($lb("punctuation",a.value))
            ;do AtomList.Insert(a)
            
            ; Unless the thing truely IS punctuation. Due to complexity deep in the parser $this counts as punctuation, which is wrong.
            If a.value'?1.P {
                Set list=list_$LISTBUILD($LISTBUILD("keyword",a.value))
                Do AtomList.Insert(a)
            }

        } Else {
            Set list=list_$LISTBUILD($LISTBUILD($PIECE(a.type,":",1),a.value))
            Do AtomList.Insert(a)
        }		
	}
	If 'single {
        ;Set str=str_"}"
    }
	Quit list
}

ClassMethod flattenold(Element As PXW.DEV.Element) As %String
{
	#dim a as PXW.DEV.Atom
	#dim e as PXW.DEV.Element
	
 	Set str=""
	Set akey=""
	Set sep=""
    If Element.partsCount()=1 {
        Set single=1
    } Else {
        Set single=0
    }
	If 'single {
        Set str=str_Element.type_":{"
    }
	For  {
		Set a=Element.partsGetNext(.akey)
		Quit:akey=""

        If a.%IsA("PXW.DEV.Element") {
            Set str=str_sep_..flattenold(a)
        } ElseIf $PIECE(a.type,":",1)="punctuation" {
            Set str=str_sep_a.type_a.value
        } Else {
            Set str=str_sep_$PIECE(a.type,":",1)_":"_a.value
        }
		
		Set sep=","
	}
	If 'single {
        Set str=str_"}"
    }
	Quit str
}

Method FollowImplicitJoins(ColumnReference As PXW.DEV.Element, fulltable As %String)
{
    #dim crefimpE as PXW.DEV.Element

    ; SELECT Race->Circuit->Location 
    ;Element=ColumnReference PXW.DEV.BNF.Element @121511
    ;.Element=ColumnName PXW.DEV.BNF.Element @121378
    ;..type=ColumnName:
    ;.. Race
    ;.Element=ColumnReferenceImplicit PXW.DEV.BNF.Element @121631
    ;..Element=ColumnReferenceImplicitRep8 PXW.DEV.BNF.Element @121505
    ;...type=punctuation:
    ;... ->
    ;...Element=ColumnName PXW.DEV.BNF.Element @120864
    ;....type=ColumnName:
    ;.... Circuit
    ;...type=punctuation:
    ;... ->
    ;...Element=ColumnName PXW.DEV.BNF.Element @121266
    ;....type=ColumnName:
    ;.... Location
    
    ;Set aliasNameE=ColumnReference.findFirstElementByType("AliasName",1) ; hmm, in a group, can we promote in bnf?
    
    Set columnNameE=ColumnReference.findFirstElementByType("ColumnName",0)
    Set crefimpE=ColumnReference.findFirstElementByType("ColumnReferenceImplicit",0)
    Do ..wrapElementHTML(columnNameE,"<a class='COSObjectMember' href='"_..HREFToSQLTable(fulltable,columnNameE.ToString(0))_"'>","</a>")
    If $ISOBJECT(crefimpE) {
        Set fulref=columnNameE.ToString(0)_"->"
        Set cols=##class(%ListOfObjects).%New()
        Do crefimpE.findElementsByType("ColumnName",.cols,2)
        For i=1:1:cols.Count() {
            Set ij=cols.GetAt(i)
            Set fulref=fulref_ij.ToString(0)
            Do ..wrapElementHTML(ij,"<a class='COSObjectMember' href='"_..HREFToSQLTable(fulltable,fulref)_"'>","</a>")
            Set fulref=fulref_"->"
        }
    }
}

/// Here is line 1 of the description
/// Here is line 2 
/// below is a comment block that is not related 
Method wrapCommentBlock(Element As PXW.DEV.Element, preValue As %String = "", postValue As %String = "", subAtom As PXW.DEV.Atom)
{
    $$$DEBUGMethodBegin
    Set isFirstCall=0
    ; atom is what is being wrapped
    ; subatom is what we are currently processing
    ;i '$d(subAtom) { s subAtom=Element.partsGetAt(1),isFirstCall=1 }
    If '$DATA(subAtom) { Set subAtom=Element.FirstAtom(),isFirstCall=1 }
    If 
    ; this is going it do a load of inserts of the comment block as PRE the first atom
    Do ..wrapElementHTML(Element,preValue,"")
	If $ISOBJECT(subAtom.whitespace) {
		Do ..wrapCommentBlock(Element,,,subAtom.whitespace)
        ; clear the whitespace as we are don't want it out again
        Set subAtom.whitespace=""
	}
	If $ISOBJECT(subAtom.comment) {
		Do ..wrapCommentBlock(Element,,,subAtom.comment)
        ; clear the comment as we are don't want it out again
        Set subAtom.comment=""
	}
	
	If 'isFirstCall {
        If ..Style.CDEFDescriptionsAsText {
            Do ..wrapAtomHTML(Element,..html(subAtom.start_subAtom.value_subAtom.end),"")
        } Else {
            ; output the comment as HTML (ie do not turn it into html)
            ; also remove any /// (which simply means do not output the start and end of the atom)
            If 'isFirstCall Do ..wrapAtomHTML(Element,subAtom.value,"")
        }
    }

    ; don't forget ALL of this is PRE the atom, including the post value!
    Do ..wrapAtomHTML(Element,postValue,"")
    $$$DEBUGMethodEnd
}

/// the only method that should actually do any output during the middle processing
Method writeAtom(atom As PXW.DEV.Atom, preValue As %String = "", postValue As %String = "", isWhitespace As %Boolean = 0)
{
    $$$DEBUGMethodBegin
    /* XML (and storage) */
    Set type=$PIECE(atom.type,":",1)
    If type="XmlTagSA" {   ; <
        Set ..xmlIndent=..xmlIndent+1
    } ElseIf type="XmlTagEB" {  ; >
        Set ..xmlIndent=..xmlIndent-1
    } ElseIf type="XmlTagSC" {  ; />
        Set ..xmlIndent=..xmlIndent-1
    }
	If isWhitespace {
		; make the indent out of tabs
        Set indent=""
		Set $PIECE(indent,$CHAR(9),..xmlIndent+1)=""
		Set atom.value=$REPLACE(atom.value,$CHAR(13),$CHAR(13)_indent)
	}	
    Do ##super(atom,preValue,postValue,isWhitespace)
    $$$DEBUGMethodEnd
}

Method HREFToClass(Class As %String, Method As %String = "", PropertyParameter As %String = "") As %String
{
    Quit ##class(PXW.Tools.DEV.Class).HREFTo(Class,Method,,%NS,..This,PropertyParameter)
}

Method HREFToInclude(Include As %String = "", MacroName As %String = "") As %String
{
    Quit ##class(PXW.Tools.DEV.Include).HREFTo(Include,..This,MacroName) ; ,Method,,%NS,..This)
}

Method HREFToPython(Module As %String) As %String
{
    Quit ##class(PXW.Tools.DEV.PythonModule).HREFTo(Module)
}

Method HREFToRoutine(LabelRef As %String) As %String
{
    Quit ##class(PXW.Tools.DEV.Routine).HREFTo(LabelRef)
}

Method HREFToSQLTable(Name As %String, Field As %String = "") As %String
{
    Quit ##class(PXW.Tools.DEV.Class).HREFTo(Name,Field,,%NS,..This)
}

}
