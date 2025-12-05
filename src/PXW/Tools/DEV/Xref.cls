Class PXW.Tools.DEV.Xref Extends PXW.Tools.Page
{

Parameter ToolType = "Code";

ClassMethod WriteMainBody()
{
	Do ..HREFFrom(.itemtype,.itemk1,.itemk2,.calledByCommand,.calledByKey1,.calledByKey2,.windowSize,.flags,.codeSearch)
	If itemk1="",itemk2="",calledByKey1="",calledByKey2="" {
		Write "Nothing to search for"
	} Else {
		Do ..WriteXRef(itemtype,itemk1,itemk2,calledByCommand,calledByKey1,calledByKey2,windowSize,flags,codeSearch)
	}
}

ClassMethod WriteXRef(itemtype As %String, itemk1 As %String, itemk2 As %String, calledByCommand As %String, calledByKey1 As %String, calledByKey2 As %String, windowSize As %String, flags As %String, codeSearch As %String = "")
{
	If flags["SUPER" {
		Set rs=##class(PXW.Xref.Queries).GetSuperFunc(%NS,itemtype,itemk1,itemk2,calledByCommand,calledByKey1,windowSize,flags)
	} Else {
		Set rs=##class(PXW.Xref.Queries).GetFunc(%NS,itemtype,itemk1,itemk2,calledByCommand,calledByKey1,calledByKey2,windowSize,flags,codeSearch)
	}
	;w "<pre>" zw rs w "</pre>"
	Set showk3=$SELECT(flags[",SHOWK3":1,1:"")
	Set newflags=flags
	Set newflags=$REPLACE(newflags,",BY ITEM","")
	Set newflags=$REPLACE(newflags,",BY CALLED","")
	Write "<table filename='XREF_"_itemk1_"'>"
	Write "		<thead>",!
	Write "			<tr>",!
	Write "				<th><a href='"_(..HREFTo(itemtype,itemk1,itemk2,calledByCommand,calledByKey1,calledByKey2,windowSize,newflags_",BY ITEM"))_"'>Item Key1</a></th>",!
	Write "				<th><a href='"_(..HREFTo(itemtype,itemk1,itemk2,calledByCommand,calledByKey1,calledByKey2,windowSize,newflags_",BY ITEM"))_"'>Item Key2</a></th>",!
	Write "				<th>Mode</th>",!
	Write "				<th>Called By Type</th>",!
	Write "				<th><a href='"_(..HREFTo(itemtype,itemk1,itemk2,calledByCommand,calledByKey1,calledByKey2,windowSize,newflags_",BY CALLED"))_"'>Called By Key1</a></th>",!
	Write "				<th><a href='"_(..HREFTo(itemtype,itemk1,itemk2,calledByCommand,calledByKey1,calledByKey2,windowSize,newflags_",BY CALLED"))_"'>Called By Key2</a></th>",!
	Write:showk3 "				<th><a href='"_(..HREFTo(itemtype,itemk1,itemk2,calledByCommand,calledByKey1,calledByKey2,windowSize,newflags_",BY CALLED"))_"'>Called By Key3</a></th>",!
	Write "				<th>Code</th>",!
	Write "			</tr>",!
	Write "		</thead>",!
	Write "		<tbody>",!
	Write "		",! 
	While rs.%Next() {
		Write "<tr>"
		Write "<td class='"_$$$classProgramName_"'>"_..EscapeHTML(rs.ItemKey1)_"</td>"
		Write "<td><a class="_$$$classProgramLabel_" href='"_..HREFTo(rs.ItemType,rs.ItemKey1,rs.ItemKey2)_"'>"_..EscapeHTML(rs.ItemKey2)_"</a></td>"
		Write "<td>"_..EscapeHTML(rs.CalledByCommand)_"</td>"
		Write "<td>"_..EscapeHTML(rs.CalledByType)_"</td>"
		Write "<td class='"_$$$classProgramName_"'>"_..EscapeHTML(rs.CalledByKey1)_"</td>"
		Write "<td>"
			Set page=##class(PXW.Tools.DEV.CodeDisplayPage).GetPageClass(rs.CalledByType)
			If page'="" {
				Write "<a class="_$$$classProgramLabel_" href='"_$CLASSMETHOD(page,"HREFToK123",rs.CalledByKey1,rs.CalledByKey2,rs.LineNumber)_"'>"
				Write ..EscapeHTML(rs.CalledByKey2)
				Write "</a>"
			}  Else {
				Write ..EscapeHTML(rs.CalledByKey2)
			} 
		Write "</td>"
		Write:showk3 "<td>"_..EscapeHTML(rs.CalledByKey3)_"</td>"
		Write "<td><pre>"
			Set ws=windowSize-1
			Set mid=rs.LineNumber,rel=rs.CalledByKey3
			If mid=0 Set mid=1
			Set from=mid-ws,relfrom=rel-ws
			Set to=mid+ws
			Set pieces=$LENGTH(rs.CallingCode,$CHAR(13,10))
			Set piecenumber=0
			If from<1 Set relfrom=relfrom-from+1,from=1
			If relfrom<0 Set from=from-relfrom,piecenumber=piecenumber-relfrom ; do not display code before the method start
			For i=from:1:to {
				Set piecenumber=piecenumber+1
				If piecenumber<=pieces {
					If ws>0,i=mid Write "<span class='hilite'>"
					Write ..EscapeHTML($PIECE(rs.CallingCode,$CHAR(13,10),piecenumber))_"<br>"
					If ws>0,i=mid Write "</span>"
				}
			}
		Write "</pre></td>"
		Write "</tr>",!
	}
	Write "</tbody></table>"
}

ClassMethod WriteNav()
{
	Do ..HREFFrom(.itemtype,.itemk1,.itemk2,.calledByCommand,.calledByKey1,.calledByKey2,.windowSize,.flags,.codeSearch)
	Write "<a href='"_##class(PXW.Tools.DEV.XrefBuild).HREFTo()_"'>Build Xref</a>"
	Write "<a href='"_..HREFTo(itemtype,itemk1,itemk2,calledByCommand,calledByKey1,calledByKey2,windowSize+1,flags,codeSearch)_"'>Window +</a>"
	If windowSize>0 Write "<a href='"_..HREFTo(itemtype,itemk1,itemk2,calledByCommand,calledByKey1,calledByKey2,windowSize-1,flags,codeSearch)_"'>Window -</a>"
	If itemk2'="" Write "<a href='"_..HREFTo(itemtype,itemk1,"","","","",windowSize,flags,codeSearch)_"'>All "_itemk1_"</a>"
	If flags'["EXTERNAL" Write "<a href='"_..HREFTo(itemtype,itemk1,itemk2,calledByCommand,calledByKey1,calledByKey2,windowSize,flags_",EXTERNAL",codeSearch)_"'>External Only</a>"
	If flags["EXTERNAL" Write "<a href='"_..HREFTo(itemtype,itemk1,itemk2,calledByCommand,calledByKey1,calledByKey2,windowSize,$REPLACE(flags,",EXTERNAL",""),codeSearch)_"'>Include Internal</a>"
	If flags'["SUPER" Write "<a href='"_..HREFTo(itemtype,itemk1,itemk2,calledByCommand,calledByKey1,calledByKey2,windowSize,flags_",SUPER",codeSearch)_"'>Include Super</a>"
	If flags["SUPER" Write "<a href='"_..HREFTo(itemtype,itemk1,itemk2,calledByCommand,calledByKey1,calledByKey2,windowSize,$REPLACE(flags,",SUPER",""),codeSearch)_"'>Exclude Super</a>"

	&html<
		<form action='PXW.Tools.DEV.Xref.cls'>
			<fieldset>
				<legend id=PXWToolsDEVXreflegend>PXW.Tools.DEV.Xref</legend>
				<input type=hidden name=IFRAME value='0'>
				<input type=hidden name='%NS' value='#($GET(%NS))#'>
				<table>
				
				<tr><td class=prompt>ItemType</td>
				<td><input type=text name=IT value='#(itemtype)#'></td>
				</tr>
				<tr><td class=prompt>ItemKey1</td>
				<td><input type=text name=IK1 value='#(itemk1)#'></td>
				</tr>
				<tr><td class=prompt>ItemKey2</td>
				<td><input type=text name=IK2 value='#(itemk2)#'></td>
				</tr>
				<tr><td class=prompt>Mode</td>
				<td><input type=text name=CBC value='#(calledByCommand)#'></td>
				</tr>
				<tr><td class=prompt>CalledByKey1</td>
				<td><input type=text name=CBK1 value='#(calledByKey1)#'></td>
				</tr>
				<tr><td class=prompt>CalledByKey2</td>
				<td><input type=text name=CBK2 value='#(calledByKey2)#'></td>
				</tr>
				<tr><td class=prompt>CodeSearch</td>
				<td><input type=text name=CS value='#(codeSearch)#'></td>
				</tr>
				<tr><td class=prompt>WindowSize</td>
				<td><input type=text name=WS value='#(windowSize)#'></td>
				</tr>
				<tr><td class=prompt>Flags</td>
				<td><input type=text name=F value='#(flags)#'></td>
				</tr>
				<tr><td>&nbsp;</td><td><input type=submit></td>
				</tr>
				</table>
			</fieldset>
		</form>
	>
	Set ons=%NS,%NS="LOCAL_USER"
	Write "<a target=_blank title='To get an idea of what the parameters can do' href='"_##class(PXW.Tools.DEV.Class).HREFTo("PXW.Xref.Queries","Get")_"'>Show query</a>",!
	Set %NS=ons
}

/// This shoud output some variables, getting the data from %request
ClassMethod HREFFrom(Output ItemType As %String, Output ItemKey1 As %String, Output ItemKey2 As %String, Output CalledByCommand As %String, CalledByKey1 As %String, CalledByKey2 As %String, WindowSize As %Integer = 0, Output Flags As %String, Output CodeSearch As %String)
{
	Set ItemType=%request.Get("IT")
	Set ItemKey1=%request.Get("IK1")
	Set ItemKey2=%request.Get("IK2")
	Set CalledByCommand=%request.Get("CBC")
	Set CalledByKey1=%request.Get("CBK1")
	Set CalledByKey2=%request.Get("CBK2")
	Set WindowSize=+%request.Get("WS")
	Set Flags=%request.Get("F")
	Set CodeSearch=%request.Get("CS")
}

/// This should return a string of the href to this page based on the input parameters
ClassMethod HREFTo(ItemType As %String = "", ItemKey1 As %String = "", ItemKey2 As %String = "", CalledByCommand As %String = "", CalledByKey1 As %String = "", CalledByKey2 As %String = "", WindowSize As %Integer = "", Flags As %String = "", CodeSearch As %String = "") As %String
{
	Set href=##super()
	Set sep="&"
	If ItemType'="" Set href=href_sep_"IT="_..EscapeURL(ItemType),sep="&"
	If ItemKey1'="" Set href=href_sep_"IK1="_..EscapeURL(ItemKey1),sep="&"
	If ItemKey2'="" Set href=href_sep_"IK2="_..EscapeURL(ItemKey2),sep="&"
	If CalledByCommand'="" Set href=href_sep_"CBC="_..EscapeURL(CalledByCommand),sep="&"
	If CalledByKey1'="" Set href=href_sep_"CBK1="_..EscapeURL(CalledByKey1),sep="&"
	If CalledByKey2'="" Set href=href_sep_"CBK2="_..EscapeURL(CalledByKey2),sep="&"
	If WindowSize'="" Set href=href_sep_"WS="_..EscapeURL(WindowSize),sep="&"
	If Flags'="" Set href=href_sep_"F="_..EscapeURL(Flags),sep="&"
	If CodeSearch'="" Set href=href_sep_"CS="_..EscapeURL(CodeSearch),sep="&"
	Quit href
}

ClassMethod GetTitle() As %String
{
	Do ..HREFFrom(.itemtype,.itemk1,.itemk2)
	Quit "Xref of "_itemtype_" "_itemk1_":"_itemk2
}

}
