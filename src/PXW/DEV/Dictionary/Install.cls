Class PXW.DEV.Dictionary.Install Extends %RegisteredObject
{

ClassMethod Setup() As %Status
{
    ; This is the default namespace, if anything goes wrong this is where we count as safe
    set sc=..SetupCLS("LOCAL_USER","LOCAL_USER","localhost",52773,"IRISAPP","_SYSTEM","SYS")
    if $$$ISERR(sc) do $SYSTEM.Status.DisplayError(sc)
    quit sc
}

ClassMethod SetupCLS(NamespaceName As %String, AtelierServerName As %String, AtelierServer As %String, AtelierPort As %String, AtelierNamespace As %String, Ausername As %String, Apassword As %String) As %Status
{
 
    set sc=$$$OK
    ; code interfaces
    set:$$$ISOK(sc) sc=##class(PXW.DEV.Dictionary.ClassDefinitionObject).RegisterType()
    set:$$$ISOK(sc) sc=##class(PXW.DEV.Dictionary.Include).RegisterType()
    set:$$$ISOK(sc) sc=##class(PXW.DEV.Dictionary.Routine).RegisterType()
    ; html display pages
    set:$$$ISOK(sc) sc=##class(PXW.Tools.DEV.Class).RegisterType()
    set:$$$ISOK(sc) sc=##class(PXW.Tools.DEV.Include).RegisterType()
    set:$$$ISOK(sc) sc=##class(PXW.Tools.DEV.Routine).RegisterType()
    ; cross reference builders
    set:$$$ISOK(sc) sc=##class(PXW.Xref.Builders.Class).RegisterType()

    
    if $$$ISOK(sc) {
        set namespace=##class(PXW.DEV.Dictionary.Namespace).%OpenId(NamespaceName)
        if '$isobject(namespace) {
            s namespace=##class(PXW.DEV.Dictionary.Namespace).%New()
            s namespace.Name=NamespaceName
            set sc=namespace.%Save()
        }
    }

    if $$$ISOK(sc) {    
        set atelier=##class(PXW.DEV.Dictionary.AtelierSettings).%OpenId(AtelierServerName)
        if '$ISOBJECT(atelier) {
            Set atelier=##class(PXW.DEV.Dictionary.AtelierSettings).%New()
            Set atelier.ServerName=AtelierServerName
        }
        Set atelier.ServerAddress=AtelierServer
        Set atelier.Port=AtelierPort
        Set atelier.Namespace="IRISAPP"
        Set atelier.InitiateAuthentication="Basic"
        Set atelier.Username=Ausername
        Set atelier.Password=Apassword
        Set atelier.ContentType="application/json"
        set sc=atelier.%Save()
    }

    if $$$ISOK(sc) {
        Set cls=##class(PXW.DEV.Dictionary.ClassDefinitionObject).OpenNamespace(NamespaceName)
        If '$ISOBJECT(cls) {
            Set cls=##class(PXW.DEV.Dictionary.ClassDefinitionObject).%New()
            Set cls.Namespace=namespace
            Set cls.AtelierSettings=atelier
            Do cls.KnownVariables.SetAt("%CSP.Request","%request")
            Do cls.KnownVariables.SetAt("%CSP.Session","%session")
        }
        Set sc=cls.%Save()
    }

    if $$$ISOK(sc) {
        Set INC=##class(PXW.DEV.Dictionary.Include).OpenNamespace(NamespaceName)
        If '$ISOBJECT(INC) {
            Set INC=##class(PXW.DEV.Dictionary.Include).%New()
            Set INC.Namespace=namespace
            Set INC.AtelierSettings=atelier
        }
        Set sc=INC.%Save()
    }

    if $$$ISOK(sc) {
        Set INT=##class(PXW.DEV.Dictionary.Routine).OpenNamespace(NamespaceName)
        If '$ISOBJECT(INT) {
            Set INT=##class(PXW.DEV.Dictionary.Routine).%New()
            Set INT.Namespace=namespace
            Set INT.AtelierSettings=atelier
        }
        Set sc=INT.%Save()
    }

    Quit sc
}

}
