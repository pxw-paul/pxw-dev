Include PXW.Debuggers.Macros

Class PXW.Tools.UnitTest.UTInterface Extends PXW.DEV.Dictionary.CodeInterface
{

Parameter CodeType = "UT";

Parameter CodeTypeDescription = "Iris Unit Test";

Property AtelierSettings As PXW.DEV.Dictionary.AtelierSettings;

/// Needs to return at least SubType,Name,TimeChanged, and optionally ID
/// The return must be similar to %ResultSet
Method List(SearchName As %String) As PXW.DEV.Dictionary.AtelierRS
{
    $$$DEBUGMethodBegin
    set sql="",cr=$c(13,10)
    set sql=sql_cr_"select tc.ID,tc.Name,case when tc.status=1 then 'PASS' else 'FAIL' end as SubType,tc.DateTime as TimeChanged from "
    set sql=sql_cr_" ("
    set sql=sql_cr_"  SELECT tc.Name,max(ti.DateTime) as datetime"
    set sql=sql_cr_"  FROM %UnitTest_Result.TestCase as tc "
    set sql=sql_cr_"  inner join %UnitTest_Result.TestSuite as ts on ts.id=tc.TestSuite"
    set sql=sql_cr_"  inner join %UnitTest_Result.TestInstance as ti on ti.id=ts.TestInstance"
    set sql=sql_cr_"  group by tc.name"
    set sql=sql_cr_" ) as latest"
    set sql=sql_cr_" inner join "
    set sql=sql_cr_" (SELECT tc.ID,tc.Name,tc.status, ti.DateTime"
    set sql=sql_cr_" FROM %UnitTest_Result.TestCase as tc "
    set sql=sql_cr_"  inner join %UnitTest_Result.TestSuite as ts on ts.id=tc.TestSuite"
    set sql=sql_cr_"  inner join %UnitTest_Result.TestInstance as ti on ti.id=ts.TestInstance"
    set sql=sql_cr_" ) as tc on tc.name=latest.name and tc.datetime=latest.datetime"
    set sql=sql_cr_""

    i SearchName'="" {
        Set cls=SearchName,escape=""
	    If cls["%" {
		    Set escape="\"
		    Set cls=$REPLACE(cls,"%",escape_"%")
	    }
    	Set cls=$REPLACE(cls,"*","%") ; make the selection a LIKE compatible thing
        s sql=sql_" WHERE tc.Name LIKE ?"
        s parameters($i(parameters))=cls
	    If escape'="" {
            Set sql=sql_" ESCAPE ?"
            Set parameters($i(parameters))=escape
	    }
    }

    set server=..AtelierSettings.ServerName
    Set qsc=##class(PXW.DEV.Dictionary.AtelierClient).query(server,sql,.obj,parameters...)
	If $$$ISERR(qsc) $$$ThrowStatus(qsc)
 	Set rs=##class(PXW.DEV.Dictionary.AtelierRS).%New(obj)
    Set rs.SQL=sql
    $$$DEBUGMethodEnd
	Quit rs
}

Method ListResults(TestCaseId As %String) As PXW.DEV.Dictionary.AtelierRS
{
    $$$DEBUGMethodBegin
    s sql=""
    s sql=sql_"SELECT ta.id as ID,tc.id as TestCaseId,tc.Name,tm.name as Method,ta.Counter,ta.Action,ta.Status,ta.Description,ta.Location"
    s sql=sql_" FROM %UnitTest_Result.TestAssert as ta"
    s sql=sql_" inner join %UnitTest_Result.TestMethod as tm on tm.id=ta.testmethod"
    s sql=sql_" inner join %UnitTest_Result.TestCase as tc on tc.id=tm.testcase"
    s sql=sql_" inner join %UnitTest_Result.TestSuite as ts on ts.id=tc.TestSuite"
    s sql=sql_" inner join %UnitTest_Result.TestInstance as ti on ti.id=ts.TestInstance"
    s sql=sql_" where tc.id=?" s parameters($i(parameters))=TestCaseId
    s sql=sql_" order by ta.id"
    set server=..AtelierSettings.ServerName
    Set qsc=##class(PXW.DEV.Dictionary.AtelierClient).query(server,sql,.obj,parameters...)
	If $$$ISERR(qsc) $$$ThrowStatus(qsc)
 	Set rs=##class(PXW.DEV.Dictionary.AtelierRS).%New(obj)
    Set rs.SQL=sql
    $$$DEBUGMethodEnd
	Quit rs
}

Method ListResultsNext(ResultSet As PXW.DEV.Dictionary.AtelierRS, Output ResultID As %String, Output TestCaseId As %String, Output TestCaseName As %String, Output Method As %String, Output Counter As %String, Output Action As %String, Output Status As %String, Output Description As %String, Output Location As %String) As %Boolean
{
    s next=ResultSet.%Next()
    $$$DEBUG("next="_next)
    $$$DEBUG("rs="_ResultSet)
    if next {
        s ResultID=ResultSet.%Get("ID")
        s TestCaseId=ResultSet.%Get("TestCaseId")
        s TestCaseName=ResultSet.%Get("Name")
        s Method=ResultSet.%Get("Method")
        s Counter=ResultSet.%Get("Counter")
        s Action=ResultSet.%Get("Action")
        s Status=ResultSet.%Get("Status")
        s Description=ResultSet.%Get("Description")
        s Location=ResultSet.%Get("Location")
    }
    q next
}

Storage Default
{
<Data name="UTInterfaceDefaultData">
<Subscript>"UTInterface"</Subscript>
<Value name="1">
<Value>AtelierSettings</Value>
</Value>
</Data>
<DefaultData>UTInterfaceDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
