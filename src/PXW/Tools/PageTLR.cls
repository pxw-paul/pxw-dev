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
                w "<div>"
                do ..WriteMainTop(.scratch)
                w "</div>"
            ; /top
            Write "</div>"
            ; main
            ; left
            Write "<div id='toolsMainLeft'>"
                w "<h2>"_..GetMainLeftTitle()_"</h2>"
                w "<div>"
                    Do ..WriteMainLeft(.scratch)
                w "</div>"
            Write "</div>"
            ; /left
            ; right
            Write "<div id='toolsMainRight'>"
                w "<h2>"_..GetMainRightTitle()_"</h2>"
                w "<div>"
                    Do ..WriteMainRight(.scratch)
                w "</div>"
            ; /right
            Write "</div>"

            ;foot
            write "<div id='toolsMainFoot'>"
                ;w "<div>"
                do ..WriteMainFoot(.scratch)
                ;w "</div>"
            ;/foot
            write "</div>" 
        ;/page
        Write "</div>"
    Write "</div>"
}

/*ClassMethod WriteStyles()
{


    &html<
        #toolsMainTLR {
            height:100%;
            display: grid;
            grid-template-areas:
                'toolsMainTop toolsMainTop'
                'toolsMainLeft toolsMainRight'
                'toolsMainFoot toolsMainFoot';
            grid-template-columns: auto auto;
            grid-template-rows: auto 1fr auto;
            grid-column-gap: 1em;
            grid-row-gap: 1em;
        }

        #toolsMainTLR div { width:100%; }

        #toolsMainTop {
            grid-area: toolsMainTop;
        }

        #toolsMainLeft {
            grid-area: toolsMainLeft;
            overflow:scroll;
            resize:horizontal;
        }
        #toolsMainLeft div { width:100%; }

        #toolsMainRight {
            grid-area: toolsMainRight;
            overflow:scroll;
        }
        #toolsMainRight div { width:100%; }

        #toosMainFoot {
            grid-area: toolsMainFoot;
        }
    >
}
*/
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
