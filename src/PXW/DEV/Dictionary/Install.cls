Class PXW.DEV.Dictionary.Install Extends %RegisteredObject
{

ClassMethod Setup() As %Status
{
    ; Common settings
    Set sc=$$$OK
    ; code interfaces
    Set:$$$ISOK(sc) sc=##class(PXW.DEV.Dictionary.ClassDefinitionObject).RegisterType()
    Set:$$$ISOK(sc) sc=##class(PXW.DEV.Dictionary.Include).RegisterType()
    Set:$$$ISOK(sc) sc=##class(PXW.DEV.Dictionary.Routine).RegisterType()
    Set:$$$ISOK(sc) sc=##class(PXW.DEV.Dictionary.MAC).RegisterType()
    ; html display pages
    Set:$$$ISOK(sc) sc=##class(PXW.Tools.DEV.Class).RegisterType()
    Set:$$$ISOK(sc) sc=##class(PXW.Tools.DEV.Include).RegisterType()
    Set:$$$ISOK(sc) sc=##class(PXW.Tools.DEV.Routine).RegisterType()
    Set:$$$ISOK(sc) sc=##class(PXW.Tools.DEV.MAC).RegisterType()
    ; cross reference builders
    Set:$$$ISOK(sc) sc=##class(PXW.Xref.Builders.Class).RegisterType()
    Set:$$$ISOK(sc) sc=##class(PXW.Xref.Builders.MAC).RegisterType()
    ; it would be really nice to do this (XREF compiled code) but there is just too much
    ; maybe this could be a way of selectively doing this on certain generated methods or certain macros
    ;Set:$$$ISOK(sc) sc=##class(PXW.Xref.Builders.Routine).RegisterType()
    
    ; code analysers
    Set:$$$ISOK(sc) sc=##class(PXW.DEV.BNF.Analyse.COS).RegisterType()
    Set:$$$ISOK(sc) sc=##class(PXW.DEV.BNF.Analyse.SQL).RegisterType()
    Set:$$$ISOK(sc) sc=##class(PXW.DEV.BNF.Analyse.Python).RegisterType()
    
    ; This is the default namespace, if anything goes wrong this is where we count as safe
    Set sc=..SetupCLS("LOCAL_USER","LOCAL_USER","localhost",52773,"IRISAPP","_SYSTEM","SYS")
    If $$$ISERR(sc) Do $SYSTEM.Status.DisplayError(sc)
    Quit sc
}

ClassMethod SetupCLS(NamespaceName As %String, AtelierServerName As %String, AtelierServer As %String, AtelierPort As %String, AtelierNamespace As %String, Ausername As %String, Apassword As %String) As %Status
{
    Set sc=$$$OK
    If $$$ISOK(sc) {
        Set namespace=##class(PXW.DEV.Dictionary.Namespace).%OpenId(NamespaceName)
        If '$ISOBJECT(namespace) {
            Set namespace=##class(PXW.DEV.Dictionary.Namespace).%New()
            Set namespace.Name=NamespaceName
            Set sc=namespace.%Save()
        }
    }

    If $$$ISOK(sc) {    
        Set atelier=##class(PXW.DEV.Dictionary.AtelierSettings).%OpenId(AtelierServerName)
        If '$ISOBJECT(atelier) {
            Set atelier=##class(PXW.DEV.Dictionary.AtelierSettings).%New()
            Set atelier.ServerName=AtelierServerName
            Set atelier.ServerAddress=AtelierServer
            Set atelier.Port=AtelierPort
            Set atelier.Namespace=AtelierNamespace
            Set atelier.InitiateAuthentication="Basic"
            Set atelier.Username=Ausername
            Set atelier.Password=Apassword
            Set atelier.ContentType="application/json"
            Set sc=atelier.%Save()
        }
    }

    If $$$ISOK(sc) {
        ; set up interface to classes
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

    If $$$ISOK(sc) {
        ; set up interface to includes
        Set INC=##class(PXW.DEV.Dictionary.Include).OpenNamespace(NamespaceName)
        If '$ISOBJECT(INC) {
            Set INC=##class(PXW.DEV.Dictionary.Include).%New()
            Set INC.Namespace=namespace
            Set INC.AtelierSettings=atelier
        }
        Set sc=INC.%Save()
    }

    If $$$ISOK(sc) {
        ; set up interface to routines
        Set INT=##class(PXW.DEV.Dictionary.Routine).OpenNamespace(NamespaceName)
        If '$ISOBJECT(INT) {
            Set INT=##class(PXW.DEV.Dictionary.Routine).%New()
            Set INT.Namespace=namespace
            Set INT.AtelierSettings=atelier
        }
        Set sc=INT.%Save()
    }

    If $$$ISOK(sc) {
        ; set up interface to MAC
        Set MAC=##class(PXW.DEV.Dictionary.MAC).OpenNamespace(NamespaceName)
        If '$ISOBJECT(MAC) {
            Set MAC=##class(PXW.DEV.Dictionary.MAC).%New()
            Set MAC.Namespace=namespace
            Set MAC.AtelierSettings=atelier
        }
        Set sc=MAC.%Save()
    }

    Quit sc
}

/// d ##class(PXW.DEV.Dictionary.Install).GenAll()
ClassMethod GenAll()
{
    
    ;Set sc=##class(PXW.DEV.BNF.Compilers.Compiler).goload("PXW.DEV.BNF.Compilers.BNF1","PXW.DEV.BNF.GEN.BNF1") 
    ;Set sc=##class(PXW.DEV.BNF.Compilers.Compiler).goload("PXW.DEV.BNF.Compilers.BNF2","PXW.DEV.BNF.GEN.BNF2") 
    ;Set sc=##class(PXW.DEV.BNF.Compilers.Compiler).goload("PXW.DEV.BNF.Compilers.BNF3","PXW.DEV.BNF.GEN.BNF3") 
    Set sc=##class(PXW.DEV.BNF.Compilers.Compiler).goload("PXW.DEV.BNF.DEF.COS","PXW.DEV.BNF.GEN.COS") 
    If $$$ISERR(sc) Do $SYSTEM.Status.DisplayError(sc)
    Set sc=##class(PXW.DEV.BNF.Compilers.Compiler).goload("PXW.DEV.BNF.DEF.CSP","PXW.DEV.BNF.GEN.CSP") 
    If $$$ISERR(sc) Do $SYSTEM.Status.DisplayError(sc)
    Set sc=##class(PXW.DEV.BNF.Compilers.Compiler).goload("PXW.DEV.BNF.DEF.ClassDefinition","PXW.DEV.BNF.GEN.ClassDefinition") 
    If $$$ISERR(sc) Do $SYSTEM.Status.DisplayError(sc)
    Set sc=##class(PXW.DEV.BNF.Compilers.Compiler).goload("PXW.DEV.BNF.DEF.JS","PXW.DEV.BNF.GEN.JS") 
    If $$$ISERR(sc) Do $SYSTEM.Status.DisplayError(sc)
    Set sc=##class(PXW.DEV.BNF.Compilers.Compiler).goload("PXW.DEV.BNF.DEF.Python","PXW.DEV.BNF.GEN.Python") 
    If $$$ISERR(sc) Do $SYSTEM.Status.DisplayError(sc)
    Set sc=##class(PXW.DEV.BNF.Compilers.Compiler).goload("PXW.DEV.BNF.DEF.SQL","PXW.DEV.BNF.GEN.SQL")
    If $$$ISERR(sc) Do $SYSTEM.Status.DisplayError(sc)
    Set sc=##class(PXW.DEV.BNF.Compilers.Compiler).goload("PXW.DEV.BNF.DEF.SQLShowPlan","PXW.DEV.BNF.GEN.SQLShowPlan")
    If $$$ISERR(sc) Do $SYSTEM.Status.DisplayError(sc)

    Do ..ExportGEN()
}

/// d ##class(PXW.DEV.Dictionary.Install).ExportAll()
ClassMethod ExportAll()
{
    Set dt=$TRANSLATE($ZDATETIME($HOROLOG,3),":- ","")
    Do $SYSTEM.OBJ.Export("PXW.*.CLS,PXW.*.INC","/home/irisowner/dev/debug/PXWALLINC_"_dt_".xml")
}

ClassMethod ExportGEN()
{
    Set genroot="/home/irisowner/dev/src/PXW/DEV/BNF/GEN/"
    If ##class(%Library.File).DirectoryExists(genroot) {
        Set package="PXW.DEV.BNF.GEN."
        Set classes=$LISTFROMSTRING("COS,CSP,ClassDefinition,JS,Python,SQL,SQLShowPlan")
        For i=1:1:$LISTLENGTH(classes) {
            Set cls=$LISTGET(classes,i)
            Write !,"Exporting "_package_cls_".CLS to "_genroot_cls_".cls"
            Do $SYSTEM.OBJ.ExportUDL(package_cls_".CLS",genroot_cls_".cls")
        }
    }
}

ClassMethod UpdateRegisterIndex()
{
    #dim rs as %SQL.StatementResult
    Set rs=##class(%SQL.Statement).%ExecDirect(,"SELECT ID FROM PXW_DEV_Dictionary.CodeInterface")
    While rs.%Next() {
        Set interface=##class(PXW.DEV.Dictionary.CodeInterface).%OpenId(rs.%Get(("ID")))
        Set sc=interface.RegisterType()
        If $$$ISERR(sc) {
            Write !,"ID=",! Do $SYSTEM.OBJ.DisplayError(sc)
        }
    }
}

}
