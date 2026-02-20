Class PXW.Tools.DEV.ParserTest Extends PXW.Tools.PageTLR
{

Parameter ToolName = "Parser Test";

ClassMethod WriteMainTop(ByRef scratch)
{
	Do ..HREFFrom(.text,.class,.method,.writefull)
   &html<<form action='PXW.Tools.DEV.ParserTest.cls'> 
        <fieldset>
        <input name='%NS' value='#(%NS)#' type=hidden>
        <table style='width:100%'>
            <tr><td>Text</td><td><textarea spellcheck=false style='width:100%' name='T' rows=20>#(text)#</textarea></td></tr>
            <tr><td>Class</td><td><input id=formClassName name='C' value='#(class)#' size=80></td></tr>
            <tr><td>Method</td><td><input id=formMethodName name='M' value='#(method)#' size=80></td></tr>
            <tr><td>WriteFull</td><td><input type=checkbox name='WF' value=1 #($s(writefull:" checked ",1:""))# ></td></tr>
            <tr><td>&nbsp;</td><td><input type=submit></td></tr>
        </table>
        </fieldset>
        </form>
    >
}

ClassMethod WriteMainLeft(ByRef scratch)
{
	Do ..HREFFrom(.text,.class,.method)
    if text'="",class'="",method'="" {
        Write "<pre>" 
        ;$$$DEBUGNew(##class(PXW.Tools.Debugger).%ClassName(1))
        $$$DEBUGSetup(##class(PXW.Tools.Debugger).%ClassName(1))
        $$$DEBUG("Running "_class_":"_method)
        try {
            Do $CLASSMETHOD(class,"test1",text,method,.scratch,0,$GET($$$debugObject))
        } catch e {
            Do ..WriteStatus(e.AsStatus())
        }
        Write "</pre>"
    }
}

ClassMethod WriteMainRight(ByRef scratch)
{
    #dim element as PXW.DEV.Element
    Do ..HREFFrom(.text,.class,.method,.writefull)
    if $isobject($g(scratch)) {
        set element=scratch
        Write "<pre>" 
        If $ISOBJECT($GET($$$debugObject)) {
            If writefull {
                Do element.writeDebugFull() 
            } else {
                Do element.writeDebug() 
            }
        } Else {
            If writefull {
                Do element.writeFull()
            } else {
                Do element.write()
            }
        }
        Write "</pre>"
    }
}

ClassMethod WriteMainFoot(ByRef scratch)
{
    $$$DEBUGStop
    #dim element as PXW.DEV.Element
    Do ..HREFFrom(.text,.class,.method,.writefull)
    if writefull {
        s element=scratch
        s flat=..flatten(element)
        w "<pre>"_$$$HTMLENCODE(flat)_"</pre>"
    }
}

ClassMethod WriteNav()
{
    d ..getMethods()
}

ClassMethod HREFTo(Text As %String, Class As %String, Method As %String, WriteFull As %String) As %String
{
    Set href=##super()
    Set:$G(Text)'="" href=href_"&T="_..EscapeURL(Text)
    Set:$G(Class)'="" href=href_"&C="_..EscapeURL(Class)
    Set:$G(Method)'="" href=href_"&M="_..EscapeURL(Method)
    Set:$G(WriteFull)'="" href=href_"&WF="_..EscapeURL(WriteFull)
    Quit href
}

/// This shoud output some variables, getting the data from %request
ClassMethod HREFFrom(Output Text As %String, Output Class As %String, Output Method As %String, Output WriteFull As %String)
{
	Set Text=%request.Get("T")
    Set Class=%request.Get("C")
    Set Method=%request.Get("M")
    Set WriteFull=%request.Get("WF")
}

ClassMethod getMethods()
{
    #dim rs as %SQL.StatementResult
    #dim meth as %Dictionary.CompiledMethod

    s rs=##class(%Dictionary.ClassDefinition).SubclassOfFunc(##class(PXW.DEV.BNF.super).%ClassName(1))
    while rs.%Next() {
        s classname=rs.Get("Name")
        s class=##class(%Dictionary.CompiledClass).%OpenId(classname)
        ; if the super class is the base class then we are not interested, we want the runtime version
        i $isobject(class),class.Super'="PXW.DEV.BNF.super" {
            w "<details>"
            w "<summary>"_$$$HTMLENCODE(classname)_"</summary>"
            f i=1:1:class.Methods.Count() {
                set meth=class.Methods.GetAt(i)
                if meth.FormalSpec["ParentElement" {
                    set mdef=##class(%Dictionary.MethodDefinition).%OpenId(meth.Origin_"||"_meth.Name)
                    if $isobject(mdef),'mdef.Private {
                        w !,"<a href=# onclick='document.getElementById(""formClassName"").value="""_classname_"""; document.getElementById(""formMethodName"").value="""_meth.Name_"""; '>"_meth.Name_"</a>"
                    }
                }
            }
            w "</details>"
        }
    }
}

ClassMethod flatten(Element As PXW.DEV.Element) As %String
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
            Set str=str_sep_..flatten(a)
        } ElseIf $PIECE(a.type,":",1)="punctuation" {
            Set str=str_sep_a.value
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

}
