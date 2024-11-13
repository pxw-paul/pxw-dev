Class PXW.DEV.UnitTests.BNF.TestPython Extends %UnitTest.TestCase
{

Method TestFString()
{
    do $$$AssertEquals(..parseAndFlat("str=f""{var1}"""),"Assignment:{Identifier:str,=,Fstring:{FstringStart:f"",FstringReplacementField:{{,Identifier:var1,}},FstringEnd:""}}")

    do $$$AssertEquals(..parseAndFlat("str=f"" before \""{var1}\"" after"""),"Assignment:{Identifier:str,=,Fstring:{FstringStart:f"",String:before \"",FstringReplacementField:{{,Identifier:var1,}},String:\"" after,FstringEnd:""}}")

    do $$$AssertEquals(..parseAndFlat("str=f' before \'{var1}\' after'"),"Assignment:{Identifier:str,=,Fstring:{FstringStart:f',String:before \',FstringReplacementField:{{,Identifier:var1,}},String:\' after,FstringEnd:'}}")
}

ClassMethod parseAndFlat(text As %String, method As %String = "Statements", class As %String = "PXW.DEV.BNF.Run.Python") As %String
{
    s a=..parse(text,method,class)
    s str=..flatten(a)
    q str
}

/// s a=##class(PXW.DEV.UnitTests.BNF.TestPython).parse("var=1*2+3","Statements")
ClassMethod parse(text As %String, method As %String = "Statements", class As %String = "PXW.DEV.BNF.Run.Python") As PXW.DEV.Element
{
    #dim x as PXW.DEV.BNF.super
    Set element=##class(PXW.DEV.Element).%New()
    Set %section=element
    Set x=$system.OBJ.New(class)
    Set x.stream=##class(PXW.DEV.InputStream).NewString(text)
    Set ok=$METHOD(x,method,element)
    quit element
}

/// s a=##class(PXW.DEV.UnitTests.BNF.TestPython).parse("var=1*2+3","Statements")
/// w ##class(PXW.DEV.UnitTests.BNF.TestPython).flatten(a)
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
