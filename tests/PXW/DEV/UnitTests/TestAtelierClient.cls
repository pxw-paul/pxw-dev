Class PXW.DEV.UnitTests.TestAtelierClient Extends %UnitTest.TestCase
{

Method Test1()
{
   
    ; load itself!
    s sc=##class(PXW.DEV.Dictionary.AtelierClient).doc("LOCAL_USER","PXW.DEV.Dictionary.AtelierClient",.obj)
    do $$$AssertEquals(sc,1)
    do $$$AssertEquals($ISOBJECT(obj),1)
}

}
