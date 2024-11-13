Class PXW.Tools.DEV.ParserTest Extends PXW.Tools.Page
{

ClassMethod WriteMainBody()
{
    #dim a as PXW.DEV.Element
    d ..HREFFrom(.text,.class,.method)

    ; page
    w "<div style=' height:100%; display:flex; flex-direction: column;'>"
    ; head
    w "<div>"
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
    w "</div>"
    i text'="",class'="",method'="" {
        ; main
        w "<div style='flex-grow:1; overflow:auto;  border: 1px solid red;'>" 
        ; container
        w "<div style=' width:100%; display:flex; height:100%; '>"
        ; left
        w "<div style='order:1;  display:block; vertical-align: top; height: 100%; width: 50%; padding:10px; overflow: auto; background-color: var(--bgAlternate1);'>"
        w "<pre>" 
        $$$DEBUGNew(##class(PXW.Tools.Debugger).%ClassName(1))
        d $classmethod(class,"test1",text,method,.a,0,$g($$$debugObject))
        w "</pre>"
        w "</div>"
        ; /left
        ; right
        w "<div style='order:2; display:block; vertical-align: top; height: 100%; width: 50%; overflow: auto;'>"
        w "<pre>" 
        i $isobject($g($$$debugObject)) {
          d a.writeDebug() 
        } else {
            d a.write()
        }
        w "</pre>"
        ; /right
        w "</div>"
        ; /container
        w "</div>"
        ; /main
        w "</div>"
    }
    w "<div>foot</div>"
    ;/page
    w "</div>"
}

ClassMethod HREFTo(Text As %String, Class As %String, Method As %String) As %String
{
    s href=##super()
    s href=href_"&T="_..EscapeURL(Text)
    s href=href_"&C="_..EscapeURL(Class)
    s href=href_"&M="_..EscapeURL(Method)
}

/// This shoud output some variables, getting the data from %request
ClassMethod HREFFrom(Output Text As %String, Class As %String, Method As %String)
{
	s Text=%request.Get("T")
    s Class=%request.Get("C")
    s Method=%request.Get("M")
}

}
