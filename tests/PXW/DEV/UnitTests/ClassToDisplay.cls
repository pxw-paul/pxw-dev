Class PXW.DEV.UnitTests.ClassToDisplay Extends %CSP.Page
{

Property Prop1 As %String;

Property Prop2 As %Integer [ Aliases = {property two ,p2}, SqlComputeCode = { s {*}={Prop_1} } ];

/**/
ClassMethod WorkOnAList(ObjList As %ListOfObjects(ELEMENTTYPE="PXW.DEV.UnitTests.ClassToDisplay",CLASSNAMEINOID=1)) As ClassToDisplay
{
	#dim a,b,c as PXW.DEV.Element = ##class(PXW.DEV.Atom).%New()
	#dim d,e,f = ##class(PXW.DEV.Atom).%New()
	#define mac s x=1 
	w a.type
	w e.type
	s y=2
	$$$mac
	s z=3
	&sql(
		select 1,2,3
		-- dummy select
		)
	&sql(
		select 1,2,3)
	&sql(
		select 1,2,3
		)

	&js< var x=1;>
	&js< var x=1;
	>
	&js< var x=1; /*comment */>
	&js< var x=1; //comment 
	>
}

Method testcq()
{
	&sqlcq(
		select 1 into :i%Prop1/* comment */
		)qc
		s c=1
}

ClientMethod ele() [ Language = javascript ]
{
	var x=1;
	/// comment
}

ClassMethod atom(Output atom As PXW.DEV.Atom)
{
}

Query testq(p1 As %String) As %SQLQuery
{
	select 1,2,3
	-- comment
}

Query testq2(p1 As %String) As %SQLQuery
{
	---comment
	select 1,2,3
}

}
