Class PXW.Tools.DEV.ParserTest Extends PXW.Tools.Page
{

ClassMethod WriteMainBody()
{
    #dim a as PXW.DEV.Element
    Do ..HREFFrom(.text,.class,.method)

    ; page
    Write "<div style=' height:100%; display:flex; flex-direction: column;'>"
    ; head
    Write "<div>"
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
    ; /head
    Write "</div>"
    If text'="",class'="",method'="" {
        ; main
        Write "<div style='flex-grow:1; overflow:auto;  border: 1px solid red;'>" 
        ; container
        Write "<div style=' width:100%; display:flex; height:100%; '>"
        ; left
        Write "<div style='order:1;  display:block; vertical-align: top; height: 100%; width: 50%; padding:10px; overflow: auto; background-color: var(--bgAlternate1);'>"
        Write "<pre>" 
        $$$DEBUGNew(##class(PXW.Tools.Debugger).%ClassName(1))
        $$$DEBUG("Running "_class_":"_method)
        try {
            Do $CLASSMETHOD(class,"test1",text,method,.a,0,$GET($$$debugObject))
        } catch e {
            Do ..WriteStatus(e.AsStatus())
        }
        Write "</pre>"
        Write "</div>"
        ; /left
        ; right
        Write "<div style='order:2; display:block; vertical-align: top; height: 100%; width: 50%; overflow: auto;'>"
        Write "<pre>" 
        If $ISOBJECT($GET($$$debugObject)) {
          Do a.writeDebug() 
        } Else {
            Do a.write()
        }
        Write "</pre>"
        ; /right
        Write "</div>"
        ; /container
        Write "</div>"
        ; /main
        Write "</div>"
    }
    Write "<div>foot</div>"
    ;/page
    Write "</div>"
}

ClassMethod HREFTo(Text As %String, Class As %String, Method As %String) As %String
{
    Set href=##super()
    Set href=href_"&T="_..EscapeURL(Text)
    Set href=href_"&C="_..EscapeURL(Class)
    Set href=href_"&M="_..EscapeURL(Method)
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
