Class PXW.DEV.UnitTests.BNF.TestCOS Extends %UnitTest.TestCase
{

Method t1()
{

    		Set tProjRS = ##class(%Library.ResultSet).%New("%Studio.Project:ProjectList",np2,np3)
    		Set tProjRS = ##class(%Library.ResultSet).%New(..%ClassName(1)_":ProjectList",np2,np3)
    		Set tProjRS = ##class(%Library.ResultSet).%New(..%ClassName(1)_":"_"ProjectList",np2,np3)
            Set tProjRS = ##class(%Library.ResultSet).%New($classname($this)_":ProjectList",np2,np3)
            Set tProjRS = ##class(%Library.ResultSet).%New($classname($this)_":"_"ProjectList",np2,np3) ;hi there
            Set tProjRS = ##class(%Library.ResultSet).%New($classname()_":ProjectList",np2,np3)
            Set tProjRS = ##class(%Library.ResultSet).%New($classname()_":"_"ProjectList",np2,np3) ;hi there
            Set tProjRS = ##class(%Library.ResultSet).%New("%DynamicQuery:SQL") ;hi there
}

Method TestNaked()
{
    ; normal, end of line directly after naked Do
    ; on the next line there would be . structure (yes still)
    Do $$$AssertEquals(..parseAndFlat(" f x=1,2 D"_$CHAR(13)),"ForCommand:{Keyword:f,ForParameter:{VariableSet:x,=,ForLoopSpecifierList:{Number:1,,,Number:2}},Keyword:D}")

    ; normal, end of line not directly after naked Do, there is a bit of extra whitespace
    Do $$$AssertEquals(..parseAndFlat(" f x=1,2 D "_$CHAR(13)),"ForCommand:{Keyword:f,ForParameter:{VariableSet:x,=,ForLoopSpecifierList:{Number:1,,,Number:2}},Keyword:D}")

    ; normal, end of line not directly after naked Do, there is a bit of extra whitespace
    Do $$$AssertEquals(..parseAndFlat(" f x=1,2 D      "_$CHAR(13)),"ForCommand:{Keyword:f,ForParameter:{VariableSet:x,=,ForLoopSpecifierList:{Number:1,,,Number:2}},Keyword:D}")

    ; normal, Do  Quit combo
    Do $$$AssertEquals(..parseAndFlat(" f x=1,2 D  Q"),"ForCommand:{Keyword:f,ForParameter:{VariableSet:x,=,ForLoopSpecifierList:{Number:1,,,Number:2}},CommandListEol:{Keyword:D,Keyword:Q}}")


    ; normal, Do:postconditional  
    Do $$$AssertEquals(..parseAndFlat(" f x=1,2 D:x=1"),"ForCommand:{Keyword:f,ForParameter:{VariableSet:x,=,ForLoopSpecifierList:{Number:1,,,Number:2}},DoCommand:{Keyword:D,PostConditional:{:,Expression:{Variable:x,=,Number:1}}}}")

    ; normal, Do:postconditional  Q:postcond 
    Do $$$AssertEquals(..parseAndFlat(" f x=1,2 D:x=1  Q:x=2"),"ForCommand:{Keyword:f,ForParameter:{VariableSet:x,=,ForLoopSpecifierList:{Number:1,,,Number:2}},CommandListEol:{DoCommand:{Keyword:D,PostConditional:{:,Expression:{Variable:x,=,Number:1}}},QuitCommand:{Keyword:Q,PostConditional:{:,Expression:{Variable:x,=,Number:2}}}}}")
}

/// s str=##class(PXW.DEV.UnitTests.BNF.TestCOS).parseAndFlat(" S x=1","CosCodeBlock") w str
/// r "enter sql",!,sql s str=##class(PXW.DEV.UnitTests.BNF.TestCOS).parseAndFlat(sql,"CosCodeBlock") w !,str
ClassMethod parseAndFlat(text As %String, method As %String = "CosCodeBlock", class As %String = "PXW.DEV.BNF.Run.COS") As %String
{
    Set a=..parse(text,method,class)
    Set str=..flatten(a)
    Quit str
}

/// s a=##class(PXW.DEV.UnitTests.BNF.TestCOS).parse("lab s x=1","CodCodeBlock")
ClassMethod parse(text As %String, method As %String = "CosCodeBlock", class As %String = "PXW.DEV.BNF.Run.COS") As PXW.DEV.Element
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

/// s a=##class(PXW.DEV.UnitTests.BNF.TestCOS).parse("lab set var=2","CosCodeBlock")
/// w ##class(PXW.DEV.UnitTests.BNF.TestCOS).flatten(a)
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
