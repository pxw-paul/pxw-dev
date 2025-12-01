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
    ; page
    Write "<div id='toolsMainTLR'>"
        ; top
        Write "<div id='toolsMainTop'>"
            do ..WriteMainTop(.scratch)
        ; /top
        Write "</div>"
        ; main
        ; left
        Write "<div id='toolsMainLeft'>"
            Do ..WriteMainLeft(.scratch)
        Write "</div>"
        ; /left
        ; right
        Write "<div id='toolsMainRight'>"
            Do ..WriteMainRight(.scratch)
        ; /right
        Write "</div>"
        ;foot
        write "<div id='toolsMainFoot'>"
            do ..WriteMainFoot(.scratch)
        ;/foot
        write "</div>" 
    ;/page
    Write "</div>"
}

ClassMethod WriteStyles()
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
 }

#toolsMainTop {
  grid-area: toolsMainTop;
}

#toolsMainLeft {
  grid-area: toolsMainLeft;
  background: var(--bgAlternate1);
  overflow:scroll;
  /*resize:horizontal;*/
}


#toolsMainRight {
  grid-area: toolsMainRight;
  overflow:scroll;
}

#toosMainFoot {
  grid-area: toolsMainFoot;
}

    >
}

ClassMethod oldWriteMainBody(ByRef scratch)
{
    ; page
    Write "<div style=' height:100%; display:flex; flex-direction: column;'>"
        ; top
        Write "<div>"
            do ..WriteMainTop(.scratch)
        ; /top
        Write "</div>"
        ; main
        Write "<div style='flex-grow:1; overflow:auto; '>" 
            ; container
            Write "<div style=' width:100%; display:flex; height:100%; '>"
                ; left
                Write "<div class='section2' style='order:1;  display:block; vertical-align: top; height: 100%; width: 50%;  overflow: auto; background-color: var(--bgAlternate1);'>"
                    Do ..WriteMainLeft(.scratch)
                Write "</div>"
                ; /left
                ; right
                Write "<div class='section2' style='order:2; display:block; vertical-align: top; height: 100%; width: 50%; overflow: auto;'>"
                    Do ..WriteMainRight(.scratch)
                ; /right
                Write "</div>"
            ; /container
            Write "</div>"
            ; /main
        Write "</div>"
    ;/page
    Write "</div>"
}

ClassMethod WriteMainTop(ByRef scratch)
{
}

ClassMethod WriteMainLeft(ByRef scratch)
{
}

ClassMethod WriteMainRight(ByRef scratch)
{
}

ClassMethod WriteMainFoot(ByRef scratch)
{
}

}
