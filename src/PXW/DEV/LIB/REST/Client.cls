Class PXW.DEV.LIB.REST.Client Extends %Library.RegisteredObject
{

Property NetRequest As %Net.HttpRequest;

Property Settings As PXW.DEV.LIB.REST.Settings;

Method %OnNew(ServerName As %String) As %Status
{
    Set ..Settings=##class(PXW.DEV.LIB.REST.Settings).%OpenId(ServerName,,.opensc)
    $$$ThrowOnError(opensc)

    Do ..SetNetRequest(ServerName)
    Quit $$$OK
}

Method EncodeURL(value As %String) As %String
{
    Quit $ZCONVERT(value,"O","URL")
}

Method getAsObject(location As %String, Output object As %Library.DynamicAbstractObject) As %Status
{
    Set object=""
    Set sc=..NetRequest.Get(location)
    If $$$ISOK(sc) {
        If ..NetRequest.HttpResponse.StatusCode=200 {
            Set data=..NetRequest.HttpResponse.Data
            Set object=##class(%Library.DynamicObject).%FromJSON(data)
            Do ..storecookies()

        } Else {
            Set sc=$$$ERROR(5001,..NetRequest.HttpResponse.StatusLine_" ("_location_")")
        }
    } 
    Quit sc
}

Method postAsObject(location As %String, Output object As %Library.DynamicAbstractObject) As %Status
{
    Set object=""
    Set ..NetRequest.ContentType="application/json"
    Set sc=..NetRequest.Post(location)
    If $$$ISOK(sc) {
        If ..NetRequest.HttpResponse.StatusCode=200 {
            Set data=..NetRequest.HttpResponse.Data
            Set object=##class(%Library.DynamicObject).%FromJSON(data)
            Do ..storecookies()

        } Else {
            Set sc=$$$ERROR(5001,..NetRequest.HttpResponse.StatusLine_" ("_location_")")
        }
    } 
    Quit sc
}

ClassMethod display(object As %Library.DynamicAbstractObject)
{
    Set fmt=##class(%JSON.Formatter).%New()
    Do fmt.FormatToString(object,.out)
    Write out
}

Method storecookies()
{
    #dim %session as %CSP.Session
    ; store cookies for later
    Set key=..%ClassName(1)_":"_..NetRequest.Server_":"_..NetRequest.Port
    If $ISOBJECT($GET(%session)) {
        Set max=..NetRequest.GetFullCookieList(.array)
        For i=1:1:max {
            Set cookie=array(i)
            Do %session.Set(key_i,cookie)
        }
        Do %session.Set(key,max)
    } Else {
        Set max=..NetRequest.GetFullCookieList(.array)
        For i=1:1:max {
            Set cookie=array(i)
            Set ^||session(key_i)=cookie
        }
        Set ^||session(key)=max
    }
    ; must be a good request so don't need password any more
    Set ..NetRequest.Password="something else"
}

Method restorecookies()
{
    Set key=..%ClassName(1)_":"_..NetRequest.Server_":"_..NetRequest.Port
    If $ISOBJECT($GET(%session)) {
        Set max=%session.Get(key)
        For i=1:1:max {
            // array(index)=$LB(name,domain,path,value,expires,secure)
            ;Method InsertCookie(name As %String, value As %String, path As %String, domain As %String, expires As %String, secure As %Boolean = 0) As %Status
            Set cookie=%session.Get(key_i)
            Set $LISTBUILD(name,domain,path,value,expires,secure)=cookie
            Do ..NetRequest.InsertCookie(name,value,path,domain,expires,secure)
        }
     } Else {
        Set max=$GET(^||session(key))
        For i=1:1:max {
            // array(index)=$LB(name,domain,path,value,expires,secure)
            ;Method InsertCookie(name As %String, value As %String, path As %String, domain As %String, expires As %String, secure As %Boolean = 0) As %Status
            Set cookie=$GET(^||session(key_i))
            Set $LISTBUILD(name,domain,path,value,expires,secure)=cookie
            Do ..NetRequest.InsertCookie(name,value,path,domain,expires,secure)
        }
    }
}

/// Server=server:port:namespace
Method SetNetRequest(ServerName As %String)
{
    If $ISOBJECT($GET(%netrequest(ServerName))) {
        Set ..NetRequest=%netrequest(ServerName)
    } Else {
        Set netrequest=##class(%Net.HttpRequest).%New()
        Set netrequest.Server=..Settings.ServerAddress ; localhost
        Set netrequest.Port=..Settings.Port ; 52773 ; 1972
        Set netrequest.InitiateAuthentication=..Settings.InitiateAuthentication ; Basic
        Set netrequest.Username=..Settings.Username ; _SYSTEM
        Set netrequest.Password=..Settings.Password ; "pxw123456"
        Set netrequest.ContentType=..Settings.ContentType ; "application/json"
        Set ..NetRequest=netrequest
        Do ..restorecookies()
        Set %netrequest(ServerName)=netrequest
    }
}

}
