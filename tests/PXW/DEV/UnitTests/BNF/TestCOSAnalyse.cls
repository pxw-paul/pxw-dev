Class PXW.DEV.UnitTests.BNF.TestCOSAnalyse Extends %UnitTest.TestCase
{

Method TestVariableStrings()
{
    #dim element as PXW.DEV.Element
    Set code=" set str1=""a string"""
    Set element=..parse(code,"CosCodeBlock","PXW.DEV.BNF.Run.COS")
    Set analyse=##class(PXW.DEV.BNF.Analyse.COS).%New()
    Set analyse.ClassServer=##class(PXW.DEV.Dictionary.ClassDefinitionObject).OpenNamespace("LOCAL_USER")
    Do analyse.checkElement(element)
    do $$$AssertEquals($G(analyse.stringVars("str1")),"a string")

    Set code=" set str2=""a string""_undefvar_"" end"""
    Set element=..parse(code,"CosCodeBlock","PXW.DEV.BNF.Run.COS")
    Set analyse=##class(PXW.DEV.BNF.Analyse.COS).%New()
    Set analyse.ClassServer=##class(PXW.DEV.Dictionary.ClassDefinitionObject).OpenNamespace("LOCAL_USER")
    Do analyse.checkElement(element)
    do $$$AssertEquals($G(analyse.stringVars("str2")),"a string end")

    Set code=" set def=""BBB"",str3=""a string""_def_"" end"""
    Set element=..parse(code,"CosCodeBlock","PXW.DEV.BNF.Run.COS")
    Set analyse=##class(PXW.DEV.BNF.Analyse.COS).%New()
    Set analyse.ClassServer=##class(PXW.DEV.Dictionary.ClassDefinitionObject).OpenNamespace("LOCAL_USER")
    Do analyse.checkElement(element)
    do $$$AssertEquals($G(analyse.stringVars("def")),"BBB")
    do $$$AssertEquals($G(analyse.stringVars("str3")),"a stringBBB end")

    Set code=" set str4=""a string"""_$c(13)
    set code=code_" set str4=str4_"" new line"""
    Set element=..parse(code,"CosCodeBlock","PXW.DEV.BNF.Run.COS")
    Set analyse=##class(PXW.DEV.BNF.Analyse.COS).%New()
    Set analyse.ClassServer=##class(PXW.DEV.Dictionary.ClassDefinitionObject).OpenNamespace("LOCAL_USER")
    Do analyse.checkElement(element)
    do $$$AssertEquals($G(analyse.stringVars("str4")),"a string new line")
    set element=analyse.stringVars("str4","element") 
    do $$$AssertEquals(element.partsCount(),2)
    do $$$AssertEquals(element.partsGetAt(1).line,1) ; these lines are the line numbers from the source code
    do $$$AssertEquals(element.partsGetAt(2).line,2)

    ; treat array of strings as a single string
    Set code=" set str5(1)=""a string"""_$c(13)
    set code=code_" set str5(2)="" new line"""
    Set element=..parse(code,"CosCodeBlock","PXW.DEV.BNF.Run.COS")
    Set analyse=##class(PXW.DEV.BNF.Analyse.COS).%New()
    Set analyse.ClassServer=##class(PXW.DEV.Dictionary.ClassDefinitionObject).OpenNamespace("LOCAL_USER")
    Do analyse.checkElement(element)
    do $$$AssertEquals($G(analyse.stringVars("str5")),"a string new line")
    set element=analyse.stringVars("str5","element") 
    do $$$AssertEquals(element.partsCount(),2)
    do $$$AssertEquals(element.partsGetAt(1).line,1) ; these lines are the line numbers from the source code
    do $$$AssertEquals(element.partsGetAt(2).line,2)
}

Method TestVariableDefined()
{
    Set code=" set x1=1"
    Set element=..parse(code,"CosCodeBlock","PXW.DEV.BNF.Run.COS")
    Set analyse=##class(PXW.DEV.BNF.Analyse.COS).%New()
    Set analyse.ClassServer=##class(PXW.DEV.Dictionary.ClassDefinitionObject).OpenNamespace("LOCAL_USER")
    Do analyse.checkElement(element)
    do $$$AssertTrue($D(analyse.VariablesSet("x1")))
    do $$$AssertTrue('$D(analyse.VariablesUsed("x1")))

    ;
    Set code=" set x2=y2"
    Set element=..parse(code,"CosCodeBlock","PXW.DEV.BNF.Run.COS")
    Set analyse=##class(PXW.DEV.BNF.Analyse.COS).%New()
    Set analyse.ClassServer=##class(PXW.DEV.Dictionary.ClassDefinitionObject).OpenNamespace("LOCAL_USER")
    Do analyse.checkElement(element)
    do $$$AssertTrue($D(analyse.VariablesSet("x2")))
    do $$$AssertTrue('$D(analyse.VariablesUsed("x2")))
    do $$$AssertTrue('$D(analyse.VariablesSet("y2")))
    do $$$AssertTrue($D(analyse.VariablesUsed("y2")))
    
    ;
    Set code=" d label(x3)"
    Set element=..parse(code,"CosCodeBlock","PXW.DEV.BNF.Run.COS")
    Set analyse=##class(PXW.DEV.BNF.Analyse.COS).%New()
    Set analyse.ClassServer=##class(PXW.DEV.Dictionary.ClassDefinitionObject).OpenNamespace("LOCAL_USER")
    Do analyse.checkElement(element)
    do $$$AssertTrue('$D(analyse.VariablesSet("x3")))
    do $$$AssertTrue($D(analyse.VariablesUsed("x3")))

    ;
    Set code=" d label(.x4)"
    Set element=..parse(code,"CosCodeBlock","PXW.DEV.BNF.Run.COS")
    Set analyse=##class(PXW.DEV.BNF.Analyse.COS).%New()
    Set analyse.ClassServer=##class(PXW.DEV.Dictionary.ClassDefinitionObject).OpenNamespace("LOCAL_USER")
    Do analyse.checkElement(element)
    ;do $$$AssertTrue($D(analyse.VariablesSet("x4"))) COME BACK TO THIS
    do $$$AssertTrue($D(analyse.VariablesUsed("x4")))
}

Method TestDirectiveDimItem()
{
    Set code="#dim p1 as PXW.DEV.Element"
    Set element=..parse(code,"CosDirective","PXW.DEV.BNF.Run.COS")
    Set analyse=##class(PXW.DEV.BNF.Analyse.COS).%New()
    Set analyse.ClassServer=##class(PXW.DEV.Dictionary.ClassDefinitionObject).OpenNamespace("LOCAL_USER")
    Do analyse.checkElement(element)

    Do $$$AssertEquals(analyse.DimmedTypes("p1"),"PXW.DEV.Element")

    ;---------------------
    Set code="#dim p1,p2 as PXW.DEV.Element"
    Set element=..parse(code,"CosDirective","PXW.DEV.BNF.Run.COS")
    Set analyse=##class(PXW.DEV.BNF.Analyse.COS).%New()
    Set analyse.ClassServer=##class(PXW.DEV.Dictionary.ClassDefinitionObject).OpenNamespace("LOCAL_USER")
    Do analyse.checkElement(element)

    Do $$$AssertEquals(analyse.DimmedTypes("p1"),"PXW.DEV.Element")
    Do $$$AssertEquals(analyse.DimmedTypes("p2"),"PXW.DEV.Element")
}

Method TestMethodSetBasic()
{
    Set code="method mName() { s p1=1,$p(p2,""."",3)=p1,(p3,p4)=p2 }"
    Set element=..parse(code,"ClassMethod","PXW.DEV.BNF.Run.ClassDefinition")
    Set analyse=##class(PXW.DEV.BNF.Analyse.COS).%New()
    Set analyse.ClassServer=##class(PXW.DEV.Dictionary.ClassDefinitionObject).OpenNamespace("LOCAL_USER")
    Do analyse.checkElement(element)

    ; no types can be derived
    Do $$$AssertEquals($GET(analyse.VariablesTypes("p1")),"")
    Do $$$AssertEquals($GET(analyse.VariablesTypes("p2")),"")
    Do $$$AssertEquals($GET(analyse.VariablesTypes("p3")),"")
    Do $$$AssertEquals($GET(analyse.VariablesTypes("p4")),"")

    ; variables have been set
    Do $$$AssertEquals($DATA(analyse.VariablesSet("p1")),1)
    Do $$$AssertEquals($DATA(analyse.VariablesSet("p2")),0) ; at the moment setting $p(p2,d,n) does NOT count in the variables set list
    Do $$$AssertEquals($DATA(analyse.VariablesSet("p3")),1)
    Do $$$AssertEquals($DATA(analyse.VariablesSet("p4")),1)

    ; variables have been used
    Do $$$AssertEquals($DATA(analyse.VariablesUsed("p1")),10)
    Do $$$AssertEquals($DATA(analyse.VariablesUsed("p2")),10)
    Do $$$AssertEquals($DATA(analyse.VariablesUsed("p3")),0)
    Do $$$AssertEquals($DATA(analyse.VariablesUsed("p4")),0)
}

Method TestMethodSetTypesFormal()
{
    Set code="method mName(p1 as PXW.DEV.Element) { w p1.type s p2=p1,(p3,p4)=p2 }"
    Set element=..parse(code,"ClassMethod","PXW.DEV.BNF.Run.ClassDefinition")
    Set analyse=##class(PXW.DEV.BNF.Analyse.COS).%New()
    Set analyse.ClassServer=##class(PXW.DEV.Dictionary.ClassDefinitionObject).OpenNamespace("LOCAL_USER")
    Do analyse.checkElement(element)

    ; the variable passed in is Dimmed, the others are not
    Do $$$AssertEquals(analyse.DimmedTypes("p1"),"PXW.DEV.Element")
    Do $$$AssertEquals($GET(analyse.DimmedTypes("p2")),"")
    Do $$$AssertEquals($GET(analyse.DimmedTypes("p3")),"")
    Do $$$AssertEquals($GET(analyse.DimmedTypes("p4")),"")

    ; all variables should end up as the same type
    Do $$$AssertEquals(analyse.VariablesTypes("p1"),"PXW.DEV.Element")
    Do $$$AssertEquals(analyse.VariablesTypes("p2"),"PXW.DEV.Element")
    Do $$$AssertEquals(analyse.VariablesTypes("p3"),"PXW.DEV.Element")
    Do $$$AssertEquals(analyse.VariablesTypes("p4"),"PXW.DEV.Element")
}

Method TestMethodSetTypesHHclass()
{
    Set code="method mName() { s p1=##class(PXW.DEV.Element).%New() w p1.type s p2=p1,(p3,p4)=p2 }"
    Set element=..parse(code,"ClassMethod","PXW.DEV.BNF.Run.ClassDefinition")
    Set analyse=##class(PXW.DEV.BNF.Analyse.COS).%New()
    Set analyse.ClassServer=##class(PXW.DEV.Dictionary.ClassDefinitionObject).OpenNamespace("LOCAL_USER")
    Do analyse.checkElement(element)

    ; none dimmed
    Do $$$AssertEquals($GET(analyse.DimmedTypes("p1")),"")
    Do $$$AssertEquals($GET(analyse.DimmedTypes("p2")),"")
    Do $$$AssertEquals($GET(analyse.DimmedTypes("p3")),"")
    Do $$$AssertEquals($GET(analyse.DimmedTypes("p4")),"")

    ; all variables should end up as the same type
    Do $$$AssertEquals(analyse.VariablesTypes("p1"),"PXW.DEV.Element")
    Do $$$AssertEquals(analyse.VariablesTypes("p2"),"PXW.DEV.Element")
    Do $$$AssertEquals(analyse.VariablesTypes("p3"),"PXW.DEV.Element")
    Do $$$AssertEquals(analyse.VariablesTypes("p4"),"PXW.DEV.Element")
}

/// s a=##class(PXW.DEV.UnitTests.BNF.TestCOSAnalyse).parse("lab s x=1","CodCodeBlock")
ClassMethod parse(text As %String, method As %String = "CosCodeBlock", class As %String = "PXW.DEV.BNF.Run.COS") As PXW.DEV.Element
{
    #dim x as PXW.DEV.BNF.super
    Set element=##class(PXW.DEV.Element).%New()
    Set %section=element
    ;Set x=$SYSTEM.OBJ.New(class)
    Set x=$CLASSMETHOD(class,"%New")
    Set x.stream=##class(PXW.DEV.InputStream).NewString(text)
    Set ok=$METHOD(x,method,element)
    If 'ok $$$ThrowStatus($$$ERROR(5001,"Method "_method_" returned "_ok))
    Quit element
}

}
