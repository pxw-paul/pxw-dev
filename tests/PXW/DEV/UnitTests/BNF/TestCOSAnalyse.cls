Class PXW.DEV.UnitTests.BNF.TestCOSAnalyse Extends %UnitTest.TestCase
{

Method TestMethodSetBasic()
{
    s code="method mName() { s p1=1,$p(p2,""."",3)=p1,(p3,p4)=p2 }"
    s element=..parse(code,"ClassMethod","PXW.DEV.BNF.Run.ClassDefinition")
    s analyse=##class(PXW.DEV.BNF.Analyse.COS).%New()
    s analyse.ClassServer=##class(PXW.DEV.Dictionary.ClassDefinitionObject).OpenNamespace("LOCAL_USER")
    d analyse.checkElement(element)

    ; no types can be derived
    d $$$AssertEquals($g(analyse.VariablesTypes("p1")),"")
    d $$$AssertEquals($g(analyse.VariablesTypes("p2")),"")
    d $$$AssertEquals($g(analyse.VariablesTypes("p3")),"")
    d $$$AssertEquals($g(analyse.VariablesTypes("p4")),"")

    ; variables have been set
    d $$$AssertEquals($d(analyse.VariablesSet("p1")),1)
    d $$$AssertEquals($d(analyse.VariablesSet("p2")),0) ; at the moment setting $p(p2,d,n) does NOT count in the variables set list
    d $$$AssertEquals($d(analyse.VariablesSet("p3")),1)
    d $$$AssertEquals($d(analyse.VariablesSet("p4")),1)

    ; variables have been used
    d $$$AssertEquals($d(analyse.VariablesUsed("p1")),10)
    d $$$AssertEquals($d(analyse.VariablesUsed("p2")),10)
    d $$$AssertEquals($d(analyse.VariablesUsed("p3")),0)
    d $$$AssertEquals($d(analyse.VariablesUsed("p4")),0)
}

Method TestMethodSetTypesFormal()
{
    s code="method mName(p1 as PXW.DEV.Element) { w p1.type s p2=p1,(p3,p4)=p2 }"
    s element=..parse(code,"ClassMethod","PXW.DEV.BNF.Run.ClassDefinition")
    s analyse=##class(PXW.DEV.BNF.Analyse.COS).%New()
    s analyse.ClassServer=##class(PXW.DEV.Dictionary.ClassDefinitionObject).OpenNamespace("LOCAL_USER")
    d analyse.checkElement(element)

    ; the variable passed in is Dimmed, the others are not
    d $$$AssertEquals(analyse.DimmedTypes("p1"),"PXW.DEV.Element")
    d $$$AssertEquals($g(analyse.DimmedTypes("p2")),"")
    d $$$AssertEquals($g(analyse.DimmedTypes("p3")),"")
    d $$$AssertEquals($g(analyse.DimmedTypes("p4")),"")

    ; all variables should end up as the same type
    d $$$AssertEquals(analyse.VariablesTypes("p1"),"PXW.DEV.Element")
    d $$$AssertEquals(analyse.VariablesTypes("p2"),"PXW.DEV.Element")
    d $$$AssertEquals(analyse.VariablesTypes("p3"),"PXW.DEV.Element")
    d $$$AssertEquals(analyse.VariablesTypes("p4"),"PXW.DEV.Element")
}

Method TestMethodSetTypesHHclass()
{
    s code="method mName() { s p1=##class(PXW.DEV.Element).%New() w p1.type s p2=p1,(p3,p4)=p2 }"
    s element=..parse(code,"ClassMethod","PXW.DEV.BNF.Run.ClassDefinition")
    s analyse=##class(PXW.DEV.BNF.Analyse.COS).%New()
    s analyse.ClassServer=##class(PXW.DEV.Dictionary.ClassDefinitionObject).OpenNamespace("LOCAL_USER")
    d analyse.checkElement(element)

    ; none dimmed
    d $$$AssertEquals($g(analyse.DimmedTypes("p1")),"")
    d $$$AssertEquals($g(analyse.DimmedTypes("p2")),"")
    d $$$AssertEquals($g(analyse.DimmedTypes("p3")),"")
    d $$$AssertEquals($g(analyse.DimmedTypes("p4")),"")

    ; all variables should end up as the same type
    d $$$AssertEquals(analyse.VariablesTypes("p1"),"PXW.DEV.Element")
    d $$$AssertEquals(analyse.VariablesTypes("p2"),"PXW.DEV.Element")
    d $$$AssertEquals(analyse.VariablesTypes("p3"),"PXW.DEV.Element")
    d $$$AssertEquals(analyse.VariablesTypes("p4"),"PXW.DEV.Element")
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
