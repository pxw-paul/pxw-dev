Class PXW.Tools.DEV.ChangeStyle Extends PXW.Tools.Page
{

ClassMethod WriteMainBody()
{
	&html<
		<div class=section1>
			<h1>Section (H1) header</h1>
			This DIV is section1.
			<div class=section2> 
				<h2 id="Selection">Selection</h2>
				#(..WriteStyleChangeSelection())#
			</div>
			<div class=section2> 
				<h2 id="ExampleTable">Example table (h2) header</h2>
				#(..WriteExampleTable())#
			</div>
			<!--<div class=section2> 
				<h2 id="ExampleXref">Example X-Ref</h2>
				#(..WriteExampleXref())#
			</div>-->
				<div class=section2 >
					<h2 id="ExampleCode">Example Code</h2>
					#(..WriteExampleCode())#
				</div>
				<div class=section2 >
					<h2 id="VariableHilite">Variable high light colours</h2>
					#(..WriteHilite())#
				</div>
		<!-- /*</div> -->
		</div>

	>
}

/// Output 1 Anchor tag for each option in the navigation. Use the scratch variable for anything you want to get from BODY
ClassMethod WriteNav(ByRef scratch)
{
	&html<
		<a href="#Selection">Selection</a>
		<a href="#ExampleTable">Example Table</a>
		<a href="#ExampleCode">Example Code</a>
		<!--<a href="#ExampleXref">Example X-Ref</a> -->
		<a href="#VariableHilite">Variable Highlights</a>
		<hr>
		<a href="#">Nav 1 (no style)</a>		
		<a href="#">Nav 2 (no style)</a>
		<a href="#">These are simple links</a>
	>
}

ClassMethod WriteHilite() As %String
{

	Write "<table>"
	For i=1:1:9 {
		Write "<tr>"
		Write "<td><span class=hiliteGET"_i_">variable</span></td>"
		Write "<td><span class=hiliteSET"_i_">variable</span></td>"
		Write "</tr>"
	}
	Write "</table>"
	Quit ""
}

ClassMethod WriteExampleCode() As %String
{
	New %NS
	Set %NS="LOCAL_USER"
	Set debug="",bookmark="",hiliteline=""

	; find something to hilite
	Set itemtype="CLS"
	Set itemk1=##class(PXW.Tools.DEV.ExampleClass).%ClassName(1)
	Set itemk2="ThingType"
	Set calledByCommand="SelectCommand"
	Set (calledByKey1,windowSize,flags)=""
	Set rs=##class(PXW.Xref.Queries).GetFunc(%NS,itemtype,itemk1,itemk2,calledByCommand,calledByKey1,windowSize,flags)
	While rs.%Next() {
		If rs.CalledByKey1=itemk1, rs.CalledByKey2="WriteStuff",hiliteline="" {
			Set hiliteline=rs.LineNumber
			Set bookmark=rs.CalledByKey2
		}
	}
	Do ##class(PXW.Tools.DEV.Class).WriteClass(##class(PXW.Tools.DEV.ExampleClass).%ClassName(1),debug,bookmark,hiliteline,.nav)
	Quit ""
}

ClassMethod WriteExampleXref() As %String
{
	New %NS
	Set %NS="LOCAL_USER"
	Set itemtype="CLS"
	Set itemk1=##class(PXW.Tools.DEV.ExampleClass).%ClassName(1)
	Set itemk2="ThingType"
	Set (calledByCommand,calledByKey1,calledByKey2,windowSize,flags)=""
	Do ##class(PXW.Tools.DEV.Xref).WriteXRef(itemtype,itemk1,itemk2,calledByCommand,calledByKey1,calledByKey2,windowSize,flags)
	Quit ""
}

ClassMethod WriteExampleTable() As %String
{
	&HTML<
		<table>
			<thead>
				<tr>
					<th>Number column</th>
					<th>Text column <a href="#">link</a></th>
					<th><a href="#">Link column</a></th>
					<th>Comment column</th>
					<th>Sub table</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>1</td>
					<td>Text data</td>
					<td><a href="#">Link data</a></td>
					<td><span class=comment>Comment in a span</span></td>
					<td>
						<table>
							<thead>
								<tr>
									<th>Sub head</th>
									<th>Sub column2</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>Sub data</td>
									<td>sub data2</td>
								</tr>
								<tr>
									<td>more data</td>
									<td>more data</td>
								</tr>
								<tr>
									<td>more data</td>
									<td>more data</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
				<tr>
					<td>2</td>
					<td>Longer text data</td>
					<td><a href="#">Link data</a></td>
					<td><div class=comment>Comment in a div</span></td>
					<td>
						<table>
							<thead>
								<tr>
									<th>Sub head</th>
									<th>Sub column2</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>Sub data</td>
									<td>sub data2</td>
								</tr>
								<tr>
									<td>more data</td>
									<td>more data</td>
								</tr>
								<tr>
									<td>more data</td>
									<td>more data</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
				<tr class=hiliterow>
					<td>3</td>
					<td>This row is higlighted by putting tr class=hiliterow</td>
					<td><a href="#">Link data</a></td>
					<td><div class=comment>Comment in a div</span></td>
					<td>
						<table>
							<thead>
								<tr>
									<th>Sub head</th>
									<th>Sub column2</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>xxx xxxxxxxx</td>
									<td>xxxxxx xxx x</td>
								</td>
								<tr>
									<td>yyyy y yyyyy</td>
									<td>yyy yyyyyyy</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
				<tr class=warningrow>
					<td>4</td>
					<td>This row is higlighted by putting tr class=warningrow</td>
					<td><a href="#">Link data</a></td>
					<td><div class=comment>Comment about why the row has a warning</span></td>
					<td>
					<!--	<table>
							<thead>
								<tr>
									<th>Sub head</th>
									<th>Sub column2</th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>Sub data</td>
									<td>sub data2</td>
								</tr>
							</tbody>
						</table>
						-->
					</td>
				<tr class=errorrow>
					<td>5</td>
					<td>This row is higlighted by putting tr class=errorrow</td>
					<td><a href="#">Link data</a></td>
					<td><div class=comment>Comment about why the row is in error</span></td>
					<td>
					</td>
				</tr>
				<tr class=goodrow>
					<td>6</td>
					<td>This row is higlighted by putting tr class=goodrow</td>
					<td><a href="#">Link data</a></td>
					<td><div class=comment>Comment about why the row is good</span></td>
					<td>
					</td>
				</tr>
				<tr >
					<td>7</td>
					<td class=CDEFClassName>ClassName</td>
					<td class=CDEFClassName><a class=CDEFClassName href="#">LinkClassName</a></td>
					<td><div class=comment>These cells have class=CDEFClassName</span></td>
					<td>
					</td>
				</tr>
				<tr >
					<td>8</td>
					<td class=CDEFClassName>ClassName</td>
					<td class=CDEFClassName><a class=CDEFClassName href="#">LinkClassName</a></td>
					<td><div class=comment>These cells have class=CDEFClassName</span></td>
					<td>
					</td>
				</tr>
				<tr>
					<td>9</td>
					<td class=CDEFMember>MethodName</td>
					<td class=CDEFMember><a class=CDEFMember href="#">LinkMethodName</a></td>
					<td><div class=comment>These cells have class=CDEFMember</span></td>
					<td>
					</td>
				</tr>
				<tr>
					<td>10</td>
					<td class=CDEFMember>MethodName</td>
					<td class=CDEFMember><a class=CDEFMember href="#">LinkMethodName</a></td>
					<td><div class=comment>These cells have class=CDEFMember</span></td>
					<td>
					</td>
				</tr>
				<tr>
					<td>11</td>
					<td class=gooddata>good data</td>
					<td class=gooddata><a href="#">LinkMethodName</a></td>
					<td><div class=comment>These cells have class=gooddata</span></td>
					<td>
					</td>
				</tr>
				<tr>
					<td>12</td>
					<td class=warningdata>warning data</td>
					<td class=warningdata><a href="#">LinkMethodName</a></td>
					<td><div class=comment>These cells have class=warningdata</span></td>
					<td>
					</td>
				</tr>
				<tr>
					<td>13</td>
					<td class=errordata>error data</td>
					<td class=errordata><a href="#">LinkMethodName</a></td>
					<td><div class=comment>These cells have class=errordata</span></td>
					<td>
					</td>
				</tr>
				<tr>
					<td>14</td>
					<td class=hilitedata>hilite data</td>
					<td class=hilitedata><a href="#">LinkMethodName</a></td>
					<td><div class=comment>These cells have class=hilitedata</span></td>
					<td>
					</td>
				</tr>
			</tbody>
		</table>
	>
	Quit ""
}

ClassMethod WriteStyleChangeSelection() As %String
{
	Set rs=##class(%ResultSet).%New("%Library.ClassDefinition:SubclassOf")
    $$$THROWONERROR(sc,rs.Execute(##class(PXW.Tools.Styles.super).%ClassName(1)))
	Set current=$SELECT($ISOBJECT($GET(%STYLE)):%STYLE.%ClassName(1),1:"")
	Write "<table>"
	Write "<thead>"
	Write "<tr><th>Name</th></tr>"
	Write "</thead>"
	Write "<tbody>"
	While rs.Next() {
		Set name=rs.Data("Name")
		Set class=""
		If name=current Set class="hiliterow"
		Write "<tr class='"_class_"'>"
		Write "<td><a href='"_..HREFTo(name)_"'>"_name_$SELECT(name=current:"*",1:"")_"</a></td>"
        Write "</tr>"
	}
	Write "</tbody>"
	Write "</table>"
	Quit ""
}

ClassMethod HREFTo(NewStyle As %String) As %String
{
    If NewStyle["PXW.Tools.Styles" Set NewStyle=$PIECE(NewStyle,"PXW.Tools.Styles.",2)
    Quit ##super()_"&%STYLE="_..EscapeURL(NewStyle)
}

/// Write out extra javascript here, the SCRIPT tags are already in place
ClassMethod WriteScripts()
{
	Do ##class(PXW.Tools.DEV.Class).WriteScripts()
}

XData example
{
<data><![CDATA[
/// Example class used by the ChangeStyle function to show what code looks like in the given style.
Class PXW.Tools.DEV.ExampleClass Extends %Library.Persistent
{

Property ThingType As %String(MAXLEN = 100);

/// This is the description of the method.
Method WriteStuff(a1 As %String) As %Boolean
{
    ; Show various types of code
    w "This is a bit of "_a1_" code."
    s x=..ThingType_" "_a1

    s count=0
     &SQL(SELECT 
            -- sql comment
            exalias.ThingType,
            COUNT(*) as CountOfReferences
            INTO :type,:count
        FROM PXW_Tools_DEV.ExampleClass as exalias
        WHERE ThingType=:a1)
    
    s ^PXW("ExampleClass",..%ClassName(1))=$lb($$$OK,99,type,count)

    &html<This is the result of the query <br>
            for #(a1)#: #(count)#>
}

XData xmlstuff
{
<data>
        <!-- xml comment -->
        <row type='str'><cell>d1</cell></row>
    </data>
}

Storage Default
{
<Data name="ExampleClassDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>ThingType</Value>
</Value>
</Data>
<DataLocation>^PXW.Tools.DEV.ExampleClassD</DataLocation>
<DefaultData>ExampleClassDefaultData</DefaultData>
<IdLocation>^PXW.Tools.DEV.ExampleClassD</IdLocation>
<IndexLocation>^PXW.Tools.DEV.ExampleClassI</IndexLocation>
<StreamLocation>^PXW.Tools.DEV.ExampleClassS</StreamLocation>
<Type>%Storage.Persistent</Type>
}
	]]></data>
}

}
