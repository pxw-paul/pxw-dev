Class PXW.DEV.UnitTests.BNF.TestPython Extends %UnitTest.TestCase
{

Method TestFString()
{
    Do $$$AssertEquals(..parseAndFlat("str=f""{var1}"""),"Assignment:{Identifier:str,=,Fstring:{FstringStart:f"",FstringReplacementField:{{,Identifier:var1,}},FstringEnd:""}}")

    Do $$$AssertEquals(..parseAndFlat("str=f"" before \""{var1}\"" after"""),"Assignment:{Identifier:str,=,Fstring:{FstringStart:f"",String:before \"",FstringReplacementField:{{,Identifier:var1,}},String:\"" after,FstringEnd:""}}")

    Do $$$AssertEquals(..parseAndFlat("str=f' before \'{var1}\' after'"),"Assignment:{Identifier:str,=,Fstring:{FstringStart:f',String:before \',FstringReplacementField:{{,Identifier:var1,}},String:\' after,FstringEnd:'}}")
}

ClassMethod parseAndFlat(text As %String, method As %String = "Statements", class As %String = "PXW.DEV.BNF.Run.Python") As %String
{
    Set a=..parse(text,method,class)
    Set str=..flatten(a)
    Quit str
}

/// s a=##class(PXW.DEV.UnitTests.BNF.TestPython).parse("var=1*2+3","Statements")
ClassMethod parse(text As %String, method As %String = "Statements", class As %String = "PXW.DEV.BNF.Run.Python") As PXW.DEV.Element
{
    #dim x as PXW.DEV.BNF.super
    Set element=##class(PXW.DEV.Element).%New()
    Set %section=element
    Set x=$SYSTEM.OBJ.New(class)
    Set x.stream=##class(PXW.DEV.InputStream).NewString(text)
    Set ok=$METHOD(x,method,element)
    if 'ok $$$ThrowStatus($$$ERROR(5001,"Method "_method_" returned "_ok))
    Quit element
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
