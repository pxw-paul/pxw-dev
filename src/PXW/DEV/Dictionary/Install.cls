Class PXW.DEV.Dictionary.Install Extends %RegisteredObject
{

ClassMethod Setup() As %Status
{
 
    Set ns="LOCAL_USER"
    Set o=##class(PXW.DEV.Dictionary.ClassDefinitionObject).%OpenId(ns)
    If '$ISOBJECT(o) {
        Set o=##class(PXW.DEV.Dictionary.ClassDefinitionObject).%New()
        Set o.Namespace=ns
        Set o.AtelierSettings=o.AtelierSettingsNewObject()
        Set o.AtelierSettings.ServerName=ns
        Set o.AtelierSettings.ServerAddress="localhost"
        Set o.AtelierSettings.Port=52773
        Set o.AtelierSettings.Namespace="IRISAPP"
        Set o.AtelierSettings.InitiateAuthentication="Basic"
        Set o.AtelierSettings.Username="SuperUser"
        Set o.AtelierSettings.Password="_SYS"
        Set o.AtelierSettings.ContentType="application/json"
    }
    Do o.KnownVariables.SetAt("%CSP.Request","%request")
    Do o.KnownVariables.SetAt("%CSP.Session","%session")
    Set sc=o.%Save()
    Quit sc
}

}
