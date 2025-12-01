Class PXW.Tools.DEV.ParserTest Extends PXW.Tools.PageTLR
{

ClassMethod WriteMainTop(ByRef scratch)
{
	Do ..HREFFrom(.text,.class,.method)
   &html<<form > 
        <fieldset>
        <input name='%NS' value='#(%NS)#' type=hidden>
        <table style='width:100%'>
            <tr><td>Text</td><td><textarea style='width:100%' name='T' rows=20>#(text)#</textarea></td></tr>
            <tr><td>Class</td><td><input name='C' value='#(class)#' size=80></td></tr>
            <tr><td>Method</td><td><input name='M' value='#(method)#' sizw=80></td></tr>
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
    if $isobject($g(scratch)) {
        set element=scratch
        Write "<pre>" 
        If $ISOBJECT($GET($$$debugObject)) {
            Do element.writeDebug() 
        } Else {
            Do element.write()
        }
        Write "</pre>"
    }
}

ClassMethod WriteMaiFoot(ByRef scratch)
{
    $$$DEBUGStop
}

ClassMethod HREFTo(Text As %String, Class As %String, Method As %String) As %String
{
    Set href=##super()
    Set:$G(Text)'="" href=href_"&T="_..EscapeURL(Text)
    Set:$G(Class)'="" href=href_"&C="_..EscapeURL(Class)
    Set:$G(Method)'="" href=href_"&M="_..EscapeURL(Method)
    Quit href
}

/// This shoud output some variables, getting the data from %request
ClassMethod HREFFrom(Output Text As %String, Class As %String, Method As %String)
{
	Set Text=%request.Get("T")
    Set Class=%request.Get("C")
    Set Method=%request.Get("M")
}

}
