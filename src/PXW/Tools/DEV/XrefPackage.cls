Class PXW.Tools.DEV.XrefPackage Extends PXW.Tools.Page
{

ClassMethod WriteMainBody()
{
	Do ..HREFFrom(.itemPackage,.calledByPackage,.windowSize)
	
	Write "<ul>"
	Write "<li><a href='"_..HREFTo(itemPackage,calledByPackage,windowSize+1)_"'>Window +</li>"
	If windowSize>0 Write "<li><a href='"_..HREFTo(itemPackage,calledByPackage,windowSize-1)_"'>Window -</li>"
	Write "</ul>"

    If itemPackage="" {
        If calledByPackage'="" {
            Do ..WriteSummary(calledByPackage)
        } Else {
            Write "Called By Package is required"
        }
    } Else {
        If calledByPackage'="" {
            Do ..WriteDetail(itemPackage,calledByPackage,windowSize)
        } Else {
            Write "Did you mean get a summary of what "_itemPackage_" calls? "
            Set calledByPackage=itemPackage
            Write "<a href='"_..HREFTo("",calledByPackage)_"'>Click here to see summary</a>"
        }
    }
}

ClassMethod WriteSummary(CalledByPackage As %String)
{
    Set rs=##class(PXW.Xref.Queries).PackageSummaryFunc(%NS,CalledByPackage)
	;w "<pre>" zw rs w "</pre>"
	Write "<table border=1>"
		&html<
			<tr>
				<th>Item Package</th>
				<th>Called By Package</th>
			</tr>
		>
	While rs.%Next() {
		Write "<tr>"
		Write "<td>"_..EscapeHTML(rs.ItemPackage)_"</td>"
		Write "<td>"
        
            Write "<a href='"_..HREFTo(rs.ItemPackage,rs.CalledByPackage)_"'>"
			Write ..EscapeHTML(rs.CalledByPackage)
			Write "</a>"        Write "</td>"		
		Write "</tr>",!
	}
	Write "</table>"
}

ClassMethod WriteDetail(ItemPackage As %String, CalledByPackage As %String, WindowSize As %Integer)
{
    Set rs=##class(PXW.Xref.Queries).PackageDetailFunc(%NS,ItemPackage,CalledByPackage,WindowSize)
	;w "<pre>" zw rs w "</pre>"
	Write "<table border=1>"
		&html<
			<tr>
				<th>Item Key1</th>
				<th>Item Key2</th>
				<th>Mode</th>
				<th>Called By Key1</th>
				<th>Called By Key2</th>
				<th>Code</th>
			</tr>
		>
	While rs.%Next() {
		Write "<tr>"
		; WHAT ABOUT XREF ON ROUTINES????
		Write "<td class='COSObjectsClass'>"_..EscapeHTML(rs.ItemKey1)_"</td>"
		Write "<td class='COSObjectsMethod'>"_..EscapeHTML(rs.ItemKey2)_"</td>"
		Write "<td>"_..EscapeHTML(rs.CalledByCommand)_"</td>"
		Write "<td class='COSObjectsClass'>"_..EscapeHTML(rs.CalledByKey1)_"</td>"
		Write "<td>"
			If rs.CalledByType="CLS" {
				;w "<a class='COSObjectsMethod' href='"_##class(PXW.Tools.DEV.Class).HREFTo(rs.CalledByKey1,"METHOD",rs.CalledByKey2,rs.CalledByKey3)_"'>"
				Write "<a class='COSObjectsMethod' href='"_##class(PXW.Tools.DEV.Class).HREFTo(rs.CalledByKey1,rs.CalledByKey2,rs.LineNumber)_"'>"
				Write ..EscapeHTML(rs.CalledByKey2)
				Write "</a>"
			} /*elseif rs.CalledByType="QRY" {
				w "<a class='COSObjectsQuery' href='"_##class(PXW.Tools.DEV.Class).HREFTo(rs.CalledByKey1,"QUERY",rs.CalledByKey2,rs.CalledByKey3)_"'>"
				w ..EscapeHTML(rs.CalledByKey2)
				w "</a>"
			} elseif rs.CalledByType="VEW" {
				w "<a class='COSObjectsMethod' href='"_##class(PXW.Tools.DEV.Class).HREFTo(rs.CalledByKey1,"METHOD",rs.CalledByKey2,rs.CalledByKey3)_"'>"
				w ..EscapeHTML(rs.CalledByKey2)
				w "</a>"
			} elseif rs.CalledByType="PRP" {
				w "<a class='COSObjectsProperty' href='"_##class(PXW.Tools.DEV.Class).HREFTo(rs.CalledByKey1,"PROPERTY",rs.CalledByKey2,rs.CalledByKey3)_"'>"
				w ..EscapeHTML(rs.CalledByKey2)
				w "</a>"
			}*/ Else {
				Write ..EscapeHTML(rs.CalledByKey2)
			}
		Write "</td>"
		
		Write "<td><pre>"
			Set ws=WindowSize-1
			Set mid=rs.LineNumber
			If mid=0 Set mid=1
			Set from=mid-ws
			Set to=mid+ws
			Set pieces=$LENGTH(rs.CallingCode,$CHAR(13,10))
			If from<1 Set from=1
			Set piece=0
			For i=from:1:to {
				Set piece=piece+1
				If piece<=pieces {
					If ws>0,i=mid Write "<span class='hilite'>"
					Write ..EscapeHTML(i_" "_$PIECE(rs.CallingCode,$CHAR(13,10),piece))_"<br>"
					If ws>0,i=mid Write "</span>"
				}
			}
		Write "</pre></td>"
		
		
		Write "</tr>",!
	}
	Write "</table>"
}

/// This shoud output some variables, getting the data from %request
ClassMethod HREFFrom(Output ItemPackage As %String, Output CalledByPackage As %String, WindowSize As %Integer = 0)
{
	Set ItemPackage=%request.Get("IP")
	Set CalledByPackage=%request.Get("CBP")
	Set WindowSize=+%request.Get("WS")
}

/// This should return a string of the href to this page based on the input parameters
ClassMethod HREFTo(ItemPackage As %String, CalledByPackage As %String, WindowSize As %Integer = 1) As %String
{
	Set href=..%ClassName(1)_".cls"
	Set sep="?"
	If ItemPackage'="" Set href=href_sep_"IP="_..EscapeURL(ItemPackage),sep="&"
	If CalledByPackage'="" Set href=href_sep_"CBP="_..EscapeURL(CalledByPackage),sep="&"
	If WindowSize'="" Set href=href_sep_"WS="_..EscapeURL(WindowSize),sep="&"
	Quit href
}

ClassMethod GetTitle() As %String
{
	Do ..HREFFrom(.itemPackage,.calledByPackage,.windowSize)
	Quit "Xref of "_itemPackage_" called by "_calledByPackage
}

}
