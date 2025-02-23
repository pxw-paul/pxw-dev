Class PXW.DEV.UnitTests.BNF.TestSQL Extends %UnitTest.TestCase
{

Method TestSelect()
{
    Do $$$AssertEquals(..parseAndFlat("SELECT cola,colb"),"SelectCommand:{Keyword:SELECT,SelectList:{ColumnName:cola,,,ColumnName:colb}}")

    Do $$$AssertEquals(..parseAndFlat("SELECT cola,colb FROM schema.table"),"SelectCommand:{Keyword:SELECT,SelectList:{ColumnName:cola,,,ColumnName:colb},FromClause:{Keyword:FROM,TableName:{SchemaName:schema,.,QualifiedIdentifier:table}}}")

    Do $$$AssertEquals(..parseAndFlat("SELECT t1.cola,t1.colb FROM schema.table AS t1"),"SelectCommand:{Keyword:SELECT,SelectList:{ColumnReference:{AliasName:t1,.,ColumnName:cola},,,ColumnReference:{AliasName:t1,.,ColumnName:colb}},FromClause:{Keyword:FROM,DirectTable:{TableName:{SchemaName:schema,.,QualifiedIdentifier:table},TableAsClause:{Keyword:AS,AliasName:t1}}}}")
}

ClassMethod parseAndFlat(text As %String, method As %String = "SqlProgram", class As %String = "PXW.DEV.BNF.Run.SQL") As %String
{
    Set a=..parse(text,method,class)
    Set str=..flatten(a)
    Quit str
}

/// s a=##class(PXW.DEV.UnitTests.BNF.TestSQL).parse("select cola,colb from table","SqlProgram")
ClassMethod parse(text As %String, method As %String = "SqlProgram", class As %String = "PXW.DEV.BNF.Run.SQL") As PXW.DEV.Element
{
    #dim x as PXW.DEV.BNF.super
    Set element=##class(PXW.DEV.Element).%New()
    Set %section=element
    Set x=$SYSTEM.OBJ.New(class)
    Set x.stream=##class(PXW.DEV.InputStream).NewString(text)
    Set ok=$METHOD(x,method,element)
    If 'ok $$$ThrowStatus($$$ERROR(5001,"Method "_method_" returned "_ok))
    Quit element
}

/// s a=##class(PXW.DEV.UnitTests.BNF.TestSQL).parse("select cola,colb from table","SqlProgram")
/// w ##class(PXW.DEV.UnitTests.BNF.TestSQL).flatten(a)
/// Get skip over all the junk levels and just report on atom content and elements that contain more than 1 part.
ClassMethod flatten(Element As PXW.DEV.Element) As %String
{
	#dim a as PXW.DEV.Atom
	#dim e as PXW.DEV.Element
	
	Set str=""
	Set akey=""
	Set sep=""
    If Element.partsCount()=1 {
        Set single=1
    } Else {
        Set single=0
    }
	If 'single {
        Set str=str_Element.type_":{"
    }
	For  {
		Set a=Element.partsGetNext(.akey)
		Quit:akey=""

        If a.%IsA("PXW.DEV.Element") {
            Set str=str_sep_..flatten(a)
        } ElseIf $PIECE(a.type,":",1)="punctuation" {
            Set str=str_sep_a.value
        } Else {
            Set str=str_sep_$PIECE(a.type,":",1)_":"_a.value
        }
		
		Set sep=","
	}
	If 'single {
        Set str=str_"}"
    }
	Quit str
}

}
