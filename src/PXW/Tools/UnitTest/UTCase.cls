Class PXW.Tools.UnitTest.UTCase Extends PXW.Tools.DEV.CodeDisplayPage
{

Parameter CodeType = "UT";

Parameter ToolType = "Code";

Parameter CodeUsage = "CodeDisplay";

/// use scratch to get anything you want to pass to the nav
ClassMethod WriteMainBody(ByRef scratch)
{
    #dim interface as PXW.Tools.UnitTest.UTInterface
    d ..HREFFrom(.testcaseId)

    s interface=##class(PXW.Tools.UnitTest.UTInterface).OpenNamespace(%NS)
    s rs=interface.ListResults(testcaseId)

    &html<
        <table>
            <thead><tr>
                <th>method</th>
                <th>counter</th>
                <th>action</th>
                <th>status</th>
                <th>description</th>
            </tr></thead>
            <tbody>
    >
    while interface.ListResultsNext(rs,.rid,.tcid,.tcname,.method,.counter,.action,.status,.description,.location) {
        i action="AssertEquals",status=0 {
            s com=$p(description,"==",1),res=$p(description,"==",2,*)
            s description=com_"==<br>"_..EscapeHTML($p(res," was ",1))_"<br>was<br>"_..EscapeHTML($p(res," was ",2))
        } else {
            s description=..EscapeHTML(description)
        }
        &html<
            <tr><td>#(..EscapeHTML(method))#</td>
                <td>#(..EscapeHTML(counter))#</td>
                <td>#(..EscapeHTML(action))#</td>
                <td #($s(status=1:"class='gooddata'",1:"class='errordata'"))# >#(..EscapeHTML($s(status:"Pass",1:"Fail")))#</td>
                <td><pre>#(description)#</pre></td>
            </tr>
        >
    }
    &html<</tbody></table>>
}

/// ID,Name,Subtype opens from something like CODE list page, where id is probably the same as Name but might not be.
ClassMethod HREFToID(ID As %String, Name As %String = "", SubType As %Integer = "") As %String
{
    q ..HREFTo(ID)
}

/// This shoud output some variables, getting the data from %request
ClassMethod HREFFrom(Output TestCaseId As %String)
{
    s TestCaseId=%request.Get("TCI")
}

/// This should return a string of the href to this page based on the input parameters
ClassMethod HREFTo(TestCaseId As %String) As %String
{
	s href=##super()
    s sep="&"
    s href=href_sep_"TCI="_TestCaseId
    q href
}

}
