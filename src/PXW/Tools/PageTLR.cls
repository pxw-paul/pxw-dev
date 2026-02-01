/// Base class for pages that have a Top, Left, and Right content:
///  +------------+
///  |top         |
///  +-----+------+
///  |left |right |
///  |     |      |
///  +-----+------+
/// 
Class PXW.Tools.PageTLR Extends PXW.Tools.Page
{

ClassMethod WriteMainBody(ByRef scratch)
{
    Write "<div id='toolsMainTLRContainer'>"
        ; page
        Write "<div id='toolsMainTLR'>"
            ; top
            Write "<div id='toolsMainTop'>"
                Write "<div>"
                Do ..WriteMainTop(.scratch)
                Write "</div>"
            ; /top
            Write "</div>"
            ; main
            ; left
            Write "<div id='toolsMainLeft'>"
                Write "<h2>"_..GetMainLeftTitle()_"</h2>"
                Write "<div>"
                    Do ..WriteMainLeft(.scratch)
                Write "</div>"
            Write "</div>"
            ; /left
            ; right
            Write "<div id='toolsMainRight'>"
                Write "<h2>"_..GetMainRightTitle()_"</h2>"
                Write "<div>"
                    Do ..WriteMainRight(.scratch)
                Write "</div>"
            ; /right
            Write "</div>"

            ;foot
            Write "<div id='toolsMainFoot'>"
                ;w "<div>"
                Do ..WriteMainFoot(.scratch)
                ;w "</div>"
            ;/foot
            Write "</div>" 
        ;/page
        Write "</div>"
    Write "</div>"
}

ClassMethod WriteMainTop(ByRef scratch)
{
}

ClassMethod WriteMainLeft(ByRef scratch)
{
}

ClassMethod GetMainLeftTitle() As %String
{
    Quit ""
}

ClassMethod WriteMainRight(ByRef scratch)
{
}

ClassMethod GetMainRightTitle() As %String
{
    Quit ""
}

ClassMethod WriteMainFoot(ByRef scratch)
{
}

}
