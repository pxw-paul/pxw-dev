Class tests.PXW.DEV.UnitTests.BNF.TestElement Extends %UnitTest.TestCase
{

ClassMethod XPath()
{
    #dim element,itemE as PXW.DEV.Element
    
    s element=..parse("ObjList As %ListOfObjects(ELEMENTTYPE=""PXW.DEV.ClassToDisplay"",CLASSNAMEINOID=1)","FormalSpecItem","PXW.DEV.BNF.Run.ClassDefinition")
    s fsE=element.partsGetAt(1)

    d fsE.findElementsXPath("AsTypeClassReference/TypeClassReference/TypeParameters/TypeParametersList/TypeParameterItem",.list)
    f i=1:1:list.Count() { 
		s itemE=list.GetAt(i)
        w !,itemE.type_":"_itemE.ToString()
    }

    d fsE.findElementsXPath("AsTypeClassReference/TypeClassReference/TypeParameters/TypeParametersList/TypeParameterItem[ClassItemIdentifier=ELEMENTTYPE]",.list)
    f i=1:1:list.Count() { 
		s itemE=list.GetAt(i)
        w !,itemE.type_":"_itemE.ToString()
    }

    d fsE.findElementsXPath("AsTypeClassReference/TypeClassReference/TypeParameters/TypeParametersList/TypeParameterItem[ClassItemIdentifier=ELEMENTTYPE]/String",.list)
    f i=1:1:list.Count() { 
		s itemE=list.GetAt(i)
        w !,itemE.type_":"_itemE.ToString()
    }
}

Method TestXPath()
{
    #dim element,itemE as PXW.DEV.Element
    
    s element=..parse("ObjList As %ListOfObjects(ELEMENTTYPE=""PXW.DEV.ClassToDisplay"",CLASSNAMEINOID=1)","FormalSpecItem","PXW.DEV.BNF.Run.ClassDefinition")
    s fsE=element.partsGetAt(1)

    d fsE.findElementsXPath("AsTypeClassReference/TypeClassReference/TypeParameters/TypeParametersList/TypeParameterItem",.list1)
    do $$$AssertEquals(list1.Count(),2)
    do $$$AssertEquals(list1.GetAt(1).type,"TypeParameterItem")
    do $$$AssertEquals(list1.GetAt(1).ToString(),"ELEMENTTYPE=""PXW.DEV.ClassToDisplay""")
    
    do $$$AssertEquals(list1.GetAt(2).type,"TypeParameterItem")
    do $$$AssertEquals(list1.GetAt(2).ToString(),"CLASSNAMEINOID=1")

    d fsE.findElementsXPath("AsTypeClassReference/TypeClassReference/TypeParameters/TypeParametersList/TypeParameterItem[ClassItemIdentifier=ELEMENTTYPE]",.list2)
    do $$$AssertEquals(list2.Count(),1)
    do $$$AssertEquals(list2.GetAt(1).type,"TypeParameterItem")
    do $$$AssertEquals(list2.GetAt(1).ToString(),"ELEMENTTYPE=""PXW.DEV.ClassToDisplay""")

    d fsE.findElementsXPath("AsTypeClassReference/TypeClassReference/TypeParameters/TypeParametersList/TypeParameterItem[ClassItemIdentifier=ELEMENTTYPE]/String",.list3)
    do $$$AssertEquals(list3.Count(),1)
    do $$$AssertEquals(list3.GetAt(1).type,"String")
    do $$$AssertEquals(list3.GetAt(1).ToString(),"""PXW.DEV.ClassToDisplay""")
}

/// s a=##class(PXW.DEV.UnitTests.BNF.TestCOS).parse("lab s x=1","CodCodeBlock")
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
