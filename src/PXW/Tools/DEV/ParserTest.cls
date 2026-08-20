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
            <tr><td>WriteFull</td><td><input type=checkbox name='WF' value=1 #($SELECT(writefull:" checked ",1:""))# ></td></tr>
            <tr><td>&nbsp;</td><td><input type=submit></td></tr>
        </table>
        </fieldset>
        </form>
    >
}

ClassMethod WriteMainLeft(ByRef scratch)
{
	Do ..HREFFrom(.text,.class,.method)
    If text'="",class'="",method'="" {
        Write "<pre>" 
        ;$$$DEBUGNew(##class(PXW.Tools.Debugger).%ClassName(1))
        $$$DEBUGSetup(##class(PXW.Tools.Debugger).%ClassName(1))
        $$$DEBUG("Running "_class_":"_method)
        Try {
            Do $CLASSMETHOD(class,"test1",text,method,.scratch,0,$GET($$$debugObject))
        } Catch e {
            Do ..WriteStatus(e.AsStatus())
        }
        Write "</pre>"
    }
}

ClassMethod WriteMainRight(ByRef scratch)
{
    #dim element as PXW.DEV.Element
    Do ..HREFFrom(.text,.class,.method,.writefull)
    If $ISOBJECT($GET(scratch)) {
        Set element=scratch
        Write "<pre>" 
        If $ISOBJECT($GET($$$debugObject)) {
            If writefull {
                Do element.writeDebugFull() 
            } Else {
                Do element.writeDebug() 
            }
        } Else {
            If writefull {
                Do element.writeFull()
            } Else {
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
    If writefull {
        Set element=scratch
        Set flat=..flatten(element)
        Write "<pre>"_$$$HTMLENCODE(flat)_"</pre>"
    }
}

ClassMethod WriteNav()
{
    Do ..getMethods()
}

ClassMethod HREFTo(Text As %String, Class As %String, Method As %String, WriteFull As %String) As %String
{
    Set href=##super()
    Set:$GET(Text)'="" href=href_"&T="_..EscapeURL(Text)
    Set:$GET(Class)'="" href=href_"&C="_..EscapeURL(Class)
    Set:$GET(Method)'="" href=href_"&M="_..EscapeURL(Method)
    Set:$GET(WriteFull)'="" href=href_"&WF="_..EscapeURL(WriteFull)
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

    Set rs=##class(%Dictionary.ClassDefinition).SubclassOfFunc(##class(PXW.DEV.BNF.super).%ClassName(1))
    While rs.%Next() {
        Set classname=rs.Get("Name")
        Set class=##class(%Dictionary.CompiledClass).%OpenId(classname)
        ; if the super class is the base class then we are not interested, we want the runtime version
        If $ISOBJECT(class),class.Super'="PXW.DEV.BNF.super" {
            Write "<details>"
            Write "<summary>"_$$$HTMLENCODE(classname)_"</summary>"
            For i=1:1:class.Methods.Count() {
                Set meth=class.Methods.GetAt(i)
                If meth.FormalSpec["ParentElement" {
                    Set mdef=##class(%Dictionary.MethodDefinition).%OpenId(meth.Origin_"||"_meth.Name)
                    If $ISOBJECT(mdef),'mdef.Private {
                        Write !,"<a href=# onclick='document.getElementById(""formClassName"").value="""_classname_"""; document.getElementById(""formMethodName"").value="""_meth.Name_"""; '>"_meth.Name_"</a>"
                    }
                }
            }
            Write "</details>"
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

        If a.IsElement {
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
