Class PXW.Tools.DEV.ParserTest Extends PXW.Tools.Page
{

ClassMethod WriteMainBody()
{

    d ..HREFFrom(.text,.class,.method)

    &html<<form >
        <input name='%NS' value='#(%NS)#' type=hidden>
        Text <textarea name='T' cols=80 rows=20>#(text)#</textarea>
        Class <input name='C' value='#(class)#' size=80>
        Method <input name='M' value='#(method)#' sizw=80>
        <input type=submit>
        </form>
    >

    i text'="",class'="",method'="" {
        w "<div style='width:100%; height:100%; border: 1px solid red;'>" 
        w "<div style='width:50%; height:100%; border: 1px solid blue; display:inline-block; overflow:scroll;'>"
        w "<pre>" 
        $$$DEBUGNew(##class(PXW.Tools.Debugger).%ClassName(1))
        d $classmethod(class,"test1",text,method,.a,0,$$$debugObject)
        w "</pre>"
        w "</div>"
        w "<div style='width:50%; height:100%; border: 1px solid green; display:inline-block;  overflow:scroll;'>"
        w "<pre>" 
        d a.writeDebug() 
        w "</pre>"
        w "</pre>"
        w "</div>"
    }
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
