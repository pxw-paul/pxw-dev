Class PXW.DEV.UnitTests.BNF.TestSQL Extends %UnitTest.TestCase
{

Method TestSelect()
{
    do $$$AssertEquals(..parseAndFlat("SELECT cola,colb"),"SelectCommand:{Keyword:SELECT,SelectList:{ColumnName:cola,,,ColumnName:colb}}")

    do $$$AssertEquals(..parseAndFlat("SELECT cola,colb FROM schema.table"),"SelectCommand:{Keyword:SELECT,SelectList:{ColumnName:cola,,,ColumnName:colb},FromClause:{Keyword:FROM,TableName:{SchemaName:schema,.,QualifiedIdentifier:table}}}")

    do $$$AssertEquals(..parseAndFlat("SELECT t1.cola,t1.colb FROM schema.table AS t1"),"SelectCommand:{Keyword:SELECT,SelectList:{ColumnReference:{AliasName:t1,.,ColumnName:cola},,,ColumnReference:{AliasName:t1,.,ColumnName:colb}},FromClause:{Keyword:FROM,DirectTable:{TableName:{SchemaName:schema,.,QualifiedIdentifier:table},TableAsClause:{Keyword:AS,AliasName:t1}}}}")
}

ClassMethod parseAndFlat(text As %String, method As %String = "SqlProgram", class As %String = "PXW.DEV.BNF.Run.SQL") As %String
{
    s a=..parse(text,method,class)
    s str=..flatten(a)
    q str
}

/// s a=##class(PXW.DEV.UnitTests.BNF.TestSQL).parse("select cola,colb from table","SqlProgram")
ClassMethod parse(text As %String, method As %String = "SqlProgram", class As %String = "PXW.DEV.BNF.Run.SQL") As PXW.DEV.Element
{
    #dim x as PXW.DEV.BNF.super
    Set element=##class(PXW.DEV.Element).%New()
    Set %section=element
    Set x=$system.OBJ.New(class)
    Set x.stream=##class(PXW.DEV.InputStream).NewString(text)
    Set ok=$METHOD(x,method,element)
    quit element
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
    if Element.partsCount()=1 {
        set single=1
    } else {
        set single=0
    }
	i 'single {
        Set str=str_Element.type_":{"
    }
	For  {
		Set a=Element.partsGetNext(.akey)
		Quit:akey=""

        if a.%IsA("PXW.DEV.Element") {
            set str=str_sep_..flatten(a)
        } elseif $p(a.type,":",1)="punctuation" {
            set str=str_sep_a.value
        } else {
            set str=str_sep_$p(a.type,":",1)_":"_a.value
        }
		
		set sep=","
	}
	i 'single {
        set str=str_"}"
    }
	Quit str
}

}
