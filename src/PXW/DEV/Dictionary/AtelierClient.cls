Include PXW.Debuggers.Macros

Class PXW.DEV.Dictionary.AtelierClient Extends PXW.DEV.LIB.REST.Client
{

Property Settings As PXW.DEV.Dictionary.AtelierSettings;

/// server=server:port:namespace
/// s sc=##class(PXW.DEV.Dictionary.AtelierClient).doc("LOCAL_USER","PXW.DEV.Dictionary.AtelierClient",.obj)
ClassMethod doc(ServerName As %String, ClassName As %String, Output object As %DynamicObject) As %Status
{
    #dim request as %Net.HttpRequest

    $$$DEBUGMethodBegin
    $$$DEBUG(ClassName)

    Set handler=..%New(ServerName) ;  ..%New(ServerName)
 
    Set ns=handler.Settings.Namespace
    Set url="/api/atelier/v2/"_ns_"/doc/"_handler.EncodeURL(ClassName)_".cls"
    ; s sep="?"
    ;s url=url_sep_xxx,sep="&"
    Set sc=handler.getAsObject(url,.object)

    $$$DEBUGMethodEnd

    Quit sc
}

/// 
/// s sc=##class(PXW.DEV.Dictionary.AtelierClient).rtn("LOCAL_USER","PXW.DEV.Dictionary.AtelierClient.1",.obj)
ClassMethod rtn(ServerName As %String, RoutineName As %String, Output object As %DynamicObject) As %Status
{
    #dim request as %Net.HttpRequest
    
    $$$DEBUGMethodBegin
    set rname=RoutineName
    if $$$UPPER($p(rname,".",*))="INT" s rname=$p(rname,".",1,*-1)

    Set handler=..%New(ServerName) ;  ..%New(ServerName) 
    Set ns=handler.Settings.Namespace
    Set url="/api/atelier/v2/"_ns_"/doc/"_handler.EncodeURL(rname)_".INT"
    ;s sep="?"
    ;s url=url_sep_xxx,sep="&"
    Set sc=handler.getAsObject(url,.object)

    $$$DEBUGMethodEnd

    Quit sc
}

/// s sc=##class(PXW.DEV.Dictionary.AtelierClient).mac("LOCAL_USER","PXW.DEV.Dictionary.AtelierClient.1",.obj)
ClassMethod mac(ServerName As %String, RoutineName As %String, Output object As %DynamicObject) As %Status
{
    #dim request as %Net.HttpRequest
    
    $$$DEBUGMethodBegin
    set rname=RoutineName
    if $$$UPPER($p(rname,".",*))="MAC" s rname=$p(rname,".",1,*-1)
    Set handler=..%New(ServerName) ;  ..%New(ServerName)
 
    Set ns=handler.Settings.Namespace
    Set url="/api/atelier/v2/"_ns_"/doc/"_handler.EncodeURL(rname)_".MAC"
    ;s sep="?"
    ;s url=url_sep_xxx,sep="&"
    Set sc=handler.getAsObject(url,.object)

    $$$DEBUGMethodEnd

    Quit sc
}

/// 
/// s sc=##class(PXW.DEV.Dictionary.AtelierClient).inc("LOCAL_USER","PXW",.obj)
ClassMethod inc(ServerName As %String, RoutineName As %String, Output object As %DynamicObject) As %Status
{
    #dim request as %Net.HttpRequest
    
    $$$DEBUGMethodBegin
    
    Set handler=..%New(ServerName) ;  ..%New(ServerName)
 
    Set ns=handler.Settings.Namespace
    Set url="/api/atelier/v2/"_ns_"/doc/"_handler.EncodeURL(RoutineName)_".INC"
    ;s sep="?"
    ;s url=url_sep_xxx,sep="&"
    Set sc=handler.getAsObject(url,.object)

    $$$DEBUGMethodEnd

    Quit sc
}

/// k obj s sc=##class(PXW.DEV.Data.AtelierClient).query("localhost:52773:USER","SELECT * FROM %Dictionary.CompiledMethod WHERE Parent=?",.obj,"PXW.DEV.Data.AtelierClient")
ClassMethod query(ServerName As %String, SQL As %String, Output object As %DynamicObject, parameters... As %String) As %Status
{
    #dim request as %Net.HttpRequest
    ;zw SQL,parameters
    $$$DEBUGMethodBegin
    $$$DEBUG(SQL)
    
    Set handler=..%New(ServerName) ;  ..%New(ServerName)
    Set request=handler.NetRequest

    Set ns=handler.Settings.Namespace
    Set q={}
    Set q.query=SQL
    Set q.parameters=[]
    For i=1:1:$GET(parameters) Do q.parameters.%Push(parameters(i)) $$$DEBUG("parameter"_i_"="_parameters(i))

    Do q.%ToJSON(request.EntityBody)
    Set request.ContentType="application/json"
    ;s sc=request.Post("/api/atelier/v2/USER/action/query")
    Set url="/api/atelier/v2/"_ns_"/action/query"
    ; s sep="?"
    Set sc=handler.postAsObject(url,.object)

    If $ISOBJECT(object),$ISOBJECT(object.status),object.status.summary'="" {
        Set sc=$$$ERROR(5001,object.status.summary)
    }
    ;d ..display(object)
    
    $$$DEBUGMethodEnd
    
    Quit sc
}

/// s sc=##class(PXW.DEV.Dictionary.AtelierClient).index("LOCAL_USER","PXW.DEV.Dictionary.AtelierClient",.obj)
ClassMethod index(ServerName As %String, ClassName As %String, Output object As %DynamicObject) As %Status
{
    #dim request as %Net.HttpRequest

    $$$DEBUGMethodBegin
    $$$DEBUG(ClassName)

    Set handler=..%New(ServerName) ;  ..%New(ServerName)
    Set request=handler.NetRequest

    Set ns=handler.Settings.Namespace
    Set array=[]
    Do array.%Push(ClassName_".cls")

    Do array.%ToJSON(request.EntityBody)
    Set request.ContentType="application/json"
    Set url="/api/atelier/v2/"_ns_"/action/index"
    ;s sep="?"
    ;s url=url_sep_xxx,sep="&"
    Set sc=handler.postAsObject(url,.object)

    $$$DEBUGMethodEnd

    Quit sc
}

/// /:namespace/action/getmacrolocation"
/// 
/// s sc=##class(PXW.DEV.Dictionary.AtelierClient).inc("LOCAL_USER","PXW.DEV.Element.CLS","PXW.DEV.Particle","OK",.obj)
ClassMethod macroLocation(ServerName As %String, RoutineName As %String, MacroName As %String, Includes As %String = "", IncludeGens As %String = "", Output object As %DynamicObject) As %Status
{
    #dim request as %Net.HttpRequest
    
    $$$DEBUGMethodBegin
    
    Set handler=..%New(ServerName) ;  ..%New(ServerName)
    Set request=handler.NetRequest
 
    Set ns=handler.Settings.Namespace
    Set ops={}
    Set ops.docname=RoutineName
    Set ops.macroname=MacroName
    If Includes'="" {
        Set ops.includes=[]
        For i=1:1:$LENGTH(Includes,",") Do ops.includes.%Push($PIECE(Includes,",",i))
    }
    If IncludeGens'="" {
        Set ops.includegenerators=[]
        For i=1:1:$LENGTH(IncludeGens,",") Do ops.includegenerators.%Push($PIECE(IncludeGens,",",i))
    }
    Do ops.%ToJSON(request.EntityBody)
    Set request.ContentType="application/json"
    Set url="/api/atelier/v2/"_ns_"/action/getmacrolocation"
    Set sc=handler.postAsObject(url,.object)

    $$$DEBUGMethodEnd

    Quit sc
}

}
