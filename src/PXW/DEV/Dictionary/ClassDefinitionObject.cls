Include PXW.Debuggers.Macros

/// Crazy caching in here, it all started so simple and then got a bit out of
/// control!
Class PXW.DEV.Dictionary.ClassDefinitionObject Extends PXW.DEV.Dictionary.CodeInterface
{

Parameter CodeType = "CLS";

Parameter CodeTypeDescription = "Iris Class Definition";

Property AtelierSettings As PXW.DEV.Dictionary.AtelierSettings;

/// Set this to a list of strings of classes that should be excluded when listing classes, eg "ui%"
/// each item in the list will be added to the SQL in the form: AND name NOT LIKE '...'
/// If % is part of the name then you must escape it like this:
/// "\%Library%" means "%Library*" 
/// vs 
/// "%Library%" means "*Library*"
Property ExcludeClassesLike As %List;

/// Set this to a list of strings of classes that should be excluded when listing classes, eg "ui%"
/// each item in the list will be added to the SQL in the form: AND (NOT (SUPER [ '...'))
Property ExcludeClassesExtends As %List;

/// Set this up with variables "known" to the system that are probably not going to be dimmed or 
/// declared anywhere.
/// EG. %request=%CSP.Request
Property KnownVariables As array Of %String;

/// Name of a JDBC connection defined in the system management portal.
/// Its not used yet by I can see a case for a tool being able to just prepare sql rather than running it.
Property JDBCName As %String;

Index iAtelierSettings On AtelierSettings;

ClassMethod ClearCache() [ CodeMode = objectgenerator ]
{
    ;
    ; create the code that clears the cache that can be called from elsewhere
    Do %code.WriteLine($CHAR(9)_"k ^PXW.Cache(""CDEF""),^PXW.Cache(""CDEFSQL"")")
    ; actually clear the cache now (on compile)
    Kill ^PXW.Cache("CDEF"),^PXW.Cache("CDEFSQL")
    Quit $$$OK
}

ClassMethod Now() As %TimeStamp
{
    Quit $ZDATETIME($HOROLOG,3)
}

Method Load(Name As %String, Output Text As %String, Output LastUpdateTime As %TimeStamp) As %Status
{
	Quit ..GetClassStudioText(Name,.Text,,.LastUpdateTime)
}

Method GetClassStudioText(ClassName As %String, Output Text As %String, Output linesOfCode As %String, Output LastUpdateTime As %TimeStamp) As %Status
{
    #dim iter as %Iterator.Object
    $$$DEBUGMethodBegin

   If ClassName="" Quit $$$ERROR(5001,"ClassName is mandatory")

	Set server=..AtelierSettings.ServerName
	Set sc=##class(PXW.DEV.Dictionary.AtelierClient).doc(server,ClassName,.object)
    If $$$ISOK(sc) {
        Set LastUpdateTime=object.result.ts
        Set content=object.result.content
        Set Text="",sep=""
        Set iter=content.%GetIterator()
        While iter.%GetNext(.key,.value) {
            Set Text=Text_sep_value
            Set sep=$CHAR(13,10)
            Set linesOfCode($INCREMENT(linesOfCode))=value
        }
    }
    $$$DEBUGMethodEnd
	Quit sc
}

/// Use this if you prefer to deal with * rather than %
Method ListClassDetailsWild(ClassWild As %String, listHidden As %Boolean = 1, listGenerated As %Boolean = 0) As PXW.DEV.Dictionary.AtelierRS
{
    Set cls=ClassWild,escape=""
	If cls["%" {
		Set escape="\"
		Set cls=$REPLACE(cls,"%",escape_"%")
	}
	If cls["_" {
		Set escape=$GET(escape,"\")
		Set cls=$REPLACE(cls,"_",escape_"_")
	}
	Set cls=$REPLACE(cls,"*","%") ; make the selection a LIKE compatible thing

    Quit ..ListClassDetailsLike(cls,escape,listHidden,listGenerated)
}

Method ListClassDetailsLike(ClassLike As %String, escape As %String = "", listHidden As %Boolean = 1, listGenerated As %Boolean = 0) As PXW.DEV.Dictionary.AtelierRS
{
    $$$DEBUGMethodBegin
    Kill parameters
	Set server=..AtelierSettings.ServerName 
	Set sql=""
	Set sql=sql_"SELECT cc.ClassType,cc.Name,to_char($piece(cd.TimeChanged,'.',1),'YYYY-MM-DD HH24:MI:SS') as TimeChanged"
    Set sql=sql_",cc.Super,cc.PrimarySuper,cc.ClassType as SubType "
	Set sql=sql_"	FROM %Dictionary.CompiledClass AS cc"
    Set sql=sql_" INNER JOIN %Dictionary.ClassDefinition AS cd ON cd.ID=cc.ID"
	Set sql=sql_"	WHERE 1=1"
	If $DATA(ClassLike) {
        Set sql=sql_"	  AND cc.name LIKE ?"
        Set parameters($INCREMENT(parameters))=ClassLike
	    If escape'="" {
            Set sql=sql_" ESCAPE ?"
            Set parameters($INCREMENT(parameters))=escape
	    }
    }
    If listHidden {
        ; 
    } Else {
        Set sql=sql_" AND cc.Hidden!=1"
    }

    If listGenerated {
        ; 
    } Else {
        Set sql=sql_" AND cc.GeneratedBy IS NULL"
    }

    For i=1:1:$LISTLENGTH(..ExcludeClassesLike) {
        Set exlike=$LISTGET(..ExcludeClassesLike,i)
        If exlike'="" {
            Set sql=sql_" AND (cc.name NOT LIKE ?"
            Set parameters($INCREMENT(parameters))=exlike
       	    If exlike["\" {
    		    Set sql=sql_" ESCAPE '\'"
            }
            Set sql=sql_")"
        }
    }
   
    Set qsc=##class(PXW.DEV.Dictionary.AtelierClient).query(server,sql,.obj,parameters...)
	If $$$ISERR(qsc) $$$ThrowStatus(qsc)
	Set rs=##class(PXW.DEV.Dictionary.AtelierRS).%New(obj)
    $$$DEBUGMethodEnd
	Quit rs
}

Method CacheAll(ClassNameLike As %String, LoggerClass As %String = "")
{
    ;If LoggerClass'="" $$$LOGNew(LoggerClass)
    ;$$$DEBUGtoLOG
    Set rs=..ListClassDetailsLike(.ClassNameLike)
    While rs.%Next() {
        Set cname=rs.%Get("Name") 
        Set ts=rs.%Get("TimeChanged") 
        ;$$$LOG("Checking "_cname_", "_ts)
        ; only GCD so that will force a kill of the others making sure that they will reload if necessary later
        Do ..CacheIfNecessary(cname,"GCD",ts) 
    }
}

/// ClassName must be in the same case as is it stored on oddDEF (eg PXW.DEV.Data.Xref not PXW.DEV.DATA.XREF)
Method CacheIfNecessary(ClassName As %String, Parts As %String = "", TimeStamp As %TimeStamp = "")
{
    $$$DEBUGMethodBegin
    New %NS Set %NS=..Namespace.Name
    Set fcn=..FullClassName(ClassName)
    Set TimeStamp=$PIECE(TimeStamp,".",1) ; no dp
    If (Parts="") || (Parts["GCD") {
        Set docache=0
        Set timechanged=$GET(^PXW.Cache("CDEF",%NS,$$$UPPER(fcn),"GCD"))
        If timechanged="" Set docache=1
        If TimeStamp'="",TimeStamp]timechanged Set docache=1
        If docache {
            ;$$$LOG("Building "_ClassName_", "_TimeStamp_", "_timechanged)
            $$$DEBUG("Fetching from GCD DB_"_ClassName_" timechanged="_timechanged_" TimeStamp="_TimeStamp)
            Do ..CacheListClassDetails(fcn)
            Set ^PXW.Cache("CDEF",%NS,$$$UPPER(fcn),"GCD")=$SELECT(TimeStamp'="":TimeStamp,1:1)
        }
    }
    If (Parts="") || (Parts["GMD") {
        Set docache=0
        Set timechanged=$GET(^PXW.Cache("CDEF",%NS,$$$UPPER(fcn),"GMD"))
        If timechanged="" Set docache=1
        If TimeStamp'="",TimeStamp]timechanged Set docache=1
        If docache {
            $$$DEBUG("Fetching from GMD DB_"_ClassName_" timechanged="_timechanged_" TimeStamp="_TimeStamp)
            Kill ^PXW.Cache("CDEF",%NS,fcn,"GMD")
            Do ..CacheListMethodDetails(fcn)
            Set ^PXW.Cache("CDEF",%NS,$$$UPPER(fcn),"GMD")=$SELECT(TimeStamp'="":TimeStamp,1:1)
        }
    }
    If (Parts="") || (Parts["GPD") {
        Set docache=0
        Set timechanged=$GET(^PXW.Cache("CDEF",%NS,$$$UPPER(fcn),"GPD"))
        If timechanged="" Set docache=1
        If TimeStamp'="",TimeStamp]timechanged Set docache=1
        If docache {
            Kill ^PXW.Cache("CDEF",%NS,fcn,"GPD")
            $$$DEBUG("Fetching from GPD DB_"_ClassName_" timechanged="_timechanged_" TimeStamp="_TimeStamp)
            Do ..CacheListProperyDetails(fcn)
            Set ^PXW.Cache("CDEF",%NS,$$$UPPER(fcn),"GPD")=$SELECT(TimeStamp'="":TimeStamp,1:1)
        }
    }
    If (Parts="") || (Parts["GAD") {
        Set docache=0
        Set timechanged=$GET(^PXW.Cache("CDEF",%NS,$$$UPPER(fcn),"GAD"))
        If timechanged="" Set docache=1
        If TimeStamp'="",TimeStamp]timechanged Set docache=1
        If docache {
            Kill ^PXW.Cache("CDEF",%NS,fcn,"GAD")
            $$$DEBUG("Fetching from GAD DB_"_ClassName_" timechanged="_timechanged_" TimeStamp="_TimeStamp)
            Do ..CacheListParameterDetails(fcn)
            Set ^PXW.Cache("CDEF",%NS,$$$UPPER(fcn),"GAD")=$SELECT(TimeStamp'="":TimeStamp,1:1)
        }
    }
    If (Parts="") || (Parts["GID") {
        Set docache=0
        Set timechanged=$GET(^PXW.Cache("CDEF",%NS,$$$UPPER(fcn),"GID"))
        If timechanged="" Set docache=1
        If TimeStamp'="",TimeStamp]timechanged Set docache=1
        If docache {
            $$$DEBUG("Fetching from GID DB_"_ClassName_" timechanged="_timechanged_" TimeStamp="_TimeStamp)
            Kill ^PXW.Cache("CDEF",%NS,fcn,"GID")
            Do ..CacheListIndexDetails(fcn)
            Set ^PXW.Cache("CDEF",%NS,$$$UPPER(fcn),"GID")=$SELECT(TimeStamp'="":TimeStamp,1:1)
        }
    }
    If (Parts="") || (Parts["GQD") {
        Set docache=0
        Set timechanged=$GET(^PXW.Cache("CDEF",%NS,$$$UPPER(fcn),"GQD"))
        If timechanged="" Set docache=1
        If TimeStamp'="",TimeStamp]timechanged Set docache=1
        If docache {
            $$$DEBUG("Fetching from GQD DB_"_ClassName_" timechanged="_timechanged_" TimeStamp="_TimeStamp)
            Kill ^PXW.Cache("CDEF",%NS,fcn,"GQD")
            Do ..CacheListQueryDetails(fcn)
            Set ^PXW.Cache("CDEF",%NS,$$$UPPER(fcn),"GQD")=$SELECT(TimeStamp'="":TimeStamp,1:1)
        }
    }
    $$$DEBUGMethodEnd
}

/// Pass in a method Id (classname||methodname) and get back the name of the class
/// that its overriding
/// s %NS="LOCAL_USER" w ##class(PXW.DEV.Dictionary.ClassDefinition).GetMethodOverrides("PXW.DEV.COS.Parser||Parse")
Method GetMethodOverrides(MethodId As %String) As %String
{
    ; builds an array ^PXW.Cache("CDEF",%NS,classname,methodname,parentclassname)
    Set classname=$PIECE(MethodId,"||",1)
    Set methodname=$PIECE(MethodId,"||",2)
 
    Set overrides=""
    If ..GetClassDetails(classname,,.supers) {
        ; supers=,"~PXW.DEV.COS.Parser~PXW.DEV.Parser~%Library.RegisteredObject~%Library.Base~%Library.SystemBase~"
        For i=1:1:$LENGTH(supers,",") {
            Set scn=$PIECE(supers,",",i)
            If ..GetMethodDetails(scn,methodname,,.origin),origin'="" {
                Set overrides=origin
                Quit
            }
        }
    }
    Quit overrides
}

/// Pass in a property Id (classname||propertyname) and get back the name of the class
/// that its overriding
Method GetPropertyOverrides(PropertyId As %String) As %String
{
    ; builds an array ^PXW.Cache("CDEF",%NS,classname,methodname,parentclassname)
    Set classname=$PIECE(PropertyId,"||",1)
    Set propertyname=$PIECE(PropertyId,"||",2)
    
    Set overrides=""
    If ..GetClassDetails(classname,,.supers) {
        ; supers=,"~PXW.DEV.COS.Parser~PXW.DEV.Parser~%Library.RegisteredObject~%Library.Base~%Library.SystemBase~"
        For i=1:1:$LENGTH(supers,",") {
            Set scn=$PIECE(supers,",",i)
            If ..GetPropertyDetails(scn,propertyname,,,,.origin),origin'="" {
                Set overrides=origin
                Quit
            }
        }
    }
    Quit overrides
}

Method ListProperyDetails(ClassName As %String) As PXW.DEV.Dictionary.AtelierRS
{
    $$$DEBUGMethodBegin
	Set server=..AtelierSettings.ServerName
	Set sql=""
    Set sql=sql_"SELECT parent,Name,RuntimeType,SQLFieldName,Collection,Type,Origin "
    Set sql=sql_"FROM %Dictionary.CompiledProperty "
    Set sql=sql_"WHERE parent=?"
    Set parameters($INCREMENT(parameters))=ClassName
	Set qsc=##class(PXW.DEV.Dictionary.AtelierClient).query(server,sql,.obj,parameters...)
	If $$$ISERR(qsc) $$$ThrowStatus(qsc)
 	Set rs=##class(PXW.DEV.Dictionary.AtelierRS).%New(obj)
    $$$DEBUGMethodEnd
	Quit rs
}

Method CacheListProperyDetails(ClassName As %String, TimeStamp As %TimeStamp = "")
{
    New %NS Set %NS=..Namespace.Name
    Set rs=..ListProperyDetails(ClassName)
    While rs.%Next() {
        Set cn=rs.%Get("parent")
        Set psqlname=rs.%Get("SqlFieldName")
        Set pname=rs.%Get("Name")
        Set data=$LISTBUILD(pname,rs.%Get("RuntimeType"),psqlname,
                    rs.%Get("Collection"),rs.%Get("Type"),rs.%Get("Origin"))            
        If psqlname'="" Set ^PXW.Cache("CDEF",%NS,$$$UPPER(cn),"GPD","sqlname",$$$UPPER(psqlname))=data
        Set ^PXW.Cache("CDEF",%NS,$$$UPPER(cn),"GPD","propertyname",$$$UPPER(pname))=data
    }
}

Method ListParameterDetails(ClassName As %String) As PXW.DEV.Dictionary.AtelierRS
{
    $$$DEBUGMethodBegin
	Set server=..AtelierSettings.ServerName
	Set sql=""
    Set sql=sql_"SELECT parent,Name,Type,Origin "
    Set sql=sql_"FROM %Dictionary.CompiledParameter "
    Set sql=sql_"WHERE parent= ? "
    Set parameters($INCREMENT(parameters))=ClassName
	Set qsc=##class(PXW.DEV.Dictionary.AtelierClient).query(server,sql,.obj,parameters...)
	If $$$ISERR(qsc) $$$ThrowStatus(qsc)
 	Set rs=##class(PXW.DEV.Dictionary.AtelierRS).%New(obj)
    $$$DEBUGMethodEnd
	Quit rs
}

Method CacheListParameterDetails(ClassName As %String, TimeStamp As %TimeStamp = "")
{
    New %NS Set %NS=..Namespace.Name
    Set rs=..ListParameterDetails(ClassName)
    While rs.%Next() {
        Set cn=rs.%Get("parent")
        Set pname=rs.%Get("Name")
        Set data=$LISTBUILD(pname,rs.%Get("Type"),rs.%Get("Origin"))            
        Set ^PXW.Cache("CDEF",%NS,$$$UPPER(cn),"GAD",$$$UPPER(pname))=data
    }
}

Method ListMethodDetails(ClassName As %String) As PXW.DEV.Dictionary.AtelierRS
{
    $$$DEBUGMethodBegin
 	Set server=..AtelierSettings.ServerName
	Set sql=""
    Set sql=sql_"SELECT parent,Name,ReturnType,Origin,Stub,' ' || FormalSpecParsed as fsp, CodeMode" ; stub is undocumented but it seems to be "source name.method name.source type (i=index,a=property)
    Set sql=sql_" FROM %Dictionary.CompiledMethod "
    Set sql=sql_" WHERE parent=?"
    Set parameters($INCREMENT(parameters))=ClassName
    Set qsc=##class(PXW.DEV.Dictionary.AtelierClient).query(server,sql,.obj,parameters...)
	If $$$ISERR(qsc) $$$ThrowStatus(qsc)
 	Set rs=##class(PXW.DEV.Dictionary.AtelierRS).%New(obj)
    $$$DEBUGMethodEnd
	Quit rs
}

Method CacheListMethodDetails(ClassName As %String)
{
    New %NS Set %NS=..Namespace.Name
    Set rs=..ListMethodDetails(ClassName)
    While rs.%Next() {
        Set cn=rs.%Get("parent")
        Set mname=rs.%Get("Name")
        Set stub=rs.%Get("Stub")
        Set rt=rs.%Get("ReturnType")
        Set fs=$e(rs.%Get("fsp"),2,*) ; remove leading " " because atelier does not like the encoded list (in v2)
        Set codemode=rs.%Get("CodeMode")
        Set data=$LISTBUILD(mname,rt,rs.%Get("Origin"),stub,fs,codemode)
        Set ^PXW.Cache("CDEF",%NS,$$$UPPER(cn),"GMD",$$$UPPER(mname))=data
    }
}

Method ListIndexDetails(ClassName As %String) As PXW.DEV.Dictionary.AtelierRS
{
    $$$DEBUGMethodBegin
 	Set server=..AtelierSettings.ServerName
	Set sql=""
    Set sql=sql_"SELECT parent,Name,TypeClass,Origin " ; stub is undocumented but it seems to be "source name.method name.source type (i=index,a=property)
    Set sql=sql_"FROM %Dictionary.CompiledIndex "
    Set sql=sql_"WHERE parent=?"
    Set parameters($INCREMENT(parameters))=ClassName
    Set qsc=##class(PXW.DEV.Dictionary.AtelierClient).query(server,sql,.obj,parameters...)
	If $$$ISERR(qsc) $$$ThrowStatus(qsc)
 	Set rs=##class(PXW.DEV.Dictionary.AtelierRS).%New(obj)
    $$$DEBUGMethodEnd
	Quit rs
}

Method CacheListIndexDetails(ClassName As %String)
{
    New %NS Set %NS=..Namespace.Name
    Set rs=..ListIndexDetails(ClassName)
    While rs.%Next() {
        Set cn=rs.%Get("parent")
        Set mname=rs.%Get("Name")
        Set tc=rs.%Get("TypeClass")
        Set data=$LISTBUILD(mname,tc,rs.%Get("Origin"))
        Set ^PXW.Cache("CDEF",%NS,$$$UPPER(cn),"GID",$$$UPPER(mname))=data
    }
}

Method ListQueryDetails(ClassName As %String) As PXW.DEV.Dictionary.AtelierRS
{
    $$$DEBUGMethodBegin
 	Set server=..AtelierSettings.ServerName
	Set sql=""
    Set sql=sql_"SELECT parent,Name,Type,Origin " ; stub is undocumented but it seems to be "source name.method name.source type (i=index,a=property)
    Set sql=sql_"FROM %Dictionary.CompiledQuery "
    Set sql=sql_"WHERE parent=?"
    Set parameters($INCREMENT(parameters))=ClassName
    Set qsc=##class(PXW.DEV.Dictionary.AtelierClient).query(server,sql,.obj,parameters...)
	If $$$ISERR(qsc) $$$ThrowStatus(qsc)
 	Set rs=##class(PXW.DEV.Dictionary.AtelierRS).%New(obj)
    $$$DEBUGMethodEnd
	Quit rs
}

Method CacheListQueryDetails(ClassName As %String)
{
    New %NS Set %NS=..Namespace.Name
    Set rs=..ListQueryDetails(ClassName)
    While rs.%Next() {
        Set cn=rs.%Get("parent")
        Set mname=rs.%Get("Name")
        Set type=rs.%Get("Type")
        Set data=$LISTBUILD(mname,type,rs.%Get("Origin"))
        Set ^PXW.Cache("CDEF",%NS,$$$UPPER(cn),"GQD",$$$UPPER(mname))=data
    }
}

Method GetPropertyNameSQL(ClassName As %String, SQLName As %String) As %String
{
    New %NS Set %NS=..Namespace.Name
    If ClassName="" Quit ""

    Set fcn=..FullClassName(ClassName)
    
 	Set ufield=$$$UPPER(SQLName)
	; sometimes fields have quotes around
	If $EXTRACT(ufield,1)="""",$EXTRACT(ufield,*)="""" Set ufield=$EXTRACT(ufield,2,*-1)

    Do ..CacheIfNecessary(fcn,"GPD")
    ;m data=^PXW.Cache("CDEF",%NS,$$$UPPER(fcn)) $$$DEBUGArray(data)
    Set data=$GET(^PXW.Cache("CDEF",%NS,$$$UPPER(fcn),"GPD","sqlname",ufield))
	Set pname=$LISTGET(data,1)

    ; ID or ID1
    If SQLName?1"ID"0.N {
        Set pname="%ID"
    }
 	Quit pname
}

Method GetPropertyTypeSQL(ClassName As %String, SQLName As %String) As %String
{
    New %NS Set %NS=..Namespace.Name
    If ClassName="" Quit ""

    Set fcn=..FullClassName(ClassName)

 	Set ufield=$$$UPPER(SQLName)
	; sometimes fields have quotes around
	If $EXTRACT(ufield,1)="""",$EXTRACT(ufield,*)="""" Set ufield=$EXTRACT(ufield,2,*-1)

    Do ..CacheIfNecessary(fcn,"GPD")
   
    Set data=$GET(^PXW.Cache("CDEF",%NS,$$$UPPER(fcn),"GPD","sqlname",ufield))
	Set type=$LISTGET(data,2)
	Quit type
}

/// Returns 1 if details were found
Method GetPropertyDetails(ClassName As %String, Name As %String, Output RuntimeType As %String, Output Collection As %String, Output Type As %String, Output Origin As %String) As %Boolean
{
    New %NS Set %NS=..Namespace.Name
    If ClassName="" Quit 0
    Set fcn=..FullClassName(ClassName)

 	Set ufield=$$$UPPER(Name)
	; sometimes fields have quotes around
	If $EXTRACT(ufield,1)="""",$EXTRACT(ufield,*)="""" Set ufield=$EXTRACT(ufield,2,*-1)

    Do ..CacheIfNecessary(fcn,"GPD")

    ;s data=$lb(pname,rs.%Get("RuntimeType"),psqlname,
    ;                    rs.%Get("Collection"),rs.%Get("Type"))            
   
    Set data=$SELECT(ufield'="":$GET(^PXW.Cache("CDEF",%NS,$$$UPPER(fcn),"GPD","propertyname",ufield)),1:"")
    If data="" Quit 0

	Set RuntimeType=$LISTGET(data,2)
    Set Collection=$LISTGET(data,4)
    Set Type=$LISTGET(data,5)
    Set Origin=$LISTGET(data,6)
 	Quit 1
}

/// Returns 1 if the details were found()
Method GetPropertyParameterDetails(ClassName As %String, PropertyName As %String, ParameterName As %String, Output SourceClass As %String) As %Boolean
{
    If ClassName="" Quit 0
    
    Set found=0
    ; find the type of the property
    If ..GetPropertyDetails(ClassName,PropertyName,,,.propertytype) {
        ; find if that class has a parameter that matches
        If ..GetParameterDetails(propertytype,ParameterName,,.parameterorigin) {
            Set found=1
            Set SourceClass=parameterorigin
        } Else {
            ; look to the propertyclass of the main class
            If ..GetClassDetails(ClassName,,,,,,,.propertyclass) {
                If ..GetParameterDetails(propertyclass,ParameterName,,.parameterorigin) {
                    Set found=1
                    Set SourceClass=parameterorigin                           
                }
            }
        }
    } 

    Quit found
}

/// Returns 1 if details were found
/// Sets ReturnType to the defined return type, to work out more information about the return type use GetMethodReturnType 
Method GetMethodDetails(ClassName As %String, Name As %String, Output ReturnType As %String, Output Origin As %String, Output Stub As %String, Output FormalSpecParsed As %List, Output CodeMode As %String) As %Boolean
{
    New %NS Set %NS=..Namespace.Name
    If ClassName="" Quit 0

    Set fcn=..FullClassName(ClassName)

 	Set ufield=$$$UPPER(Name)
	; sometimes fields have quotes around
	If $EXTRACT(ufield,1)="""",$EXTRACT(ufield,*)="""" Set ufield=$EXTRACT(ufield,2,*-1)

    Do ..CacheIfNecessary(fcn,"GMD")
	  
    Set data=$SELECT(ufield'="":$GET(^PXW.Cache("CDEF",%NS,$$$UPPER(fcn),"GMD",ufield)),1:"")
    Set ReturnType=$LISTGET(data,2)
    Set Origin=$LISTGET(data,3)
    Set Stub=$LISTGET(data,4)
    Set FormalSpecParsed=$LISTGET(data,5)
    Set CodeMode=$LISTGET(data,6)

    If data="" Quit 0
	Quit 1
}

Method GetMethodReturnType(ClassName As %String, Name As %String, Output FormalSpecParsed) As %String
{
    If ClassName="" Quit ""

    ;s fcn=..FullClassName(ClassName)

	Set ufield=$$$UPPER(Name)
	; sometimes fields have quotes around
	If $EXTRACT(ufield,1)="""",$EXTRACT(ufield,*)="""" Set ufield=$EXTRACT(ufield,2,*-1)

	Set found=..GetMethodDetails(ClassName,Name,.returntype,.origin,.stub,.FormalSpecParsed)

    ; if the return type is not set see if this was derived from some other thing
    If found,returntype="" {
        ; stub is undocumented but it seems to be "SourceName.MethodName.SourceType (i=index,a=property)"
        Set stype=$PIECE(stub,".",3)
        Set smethod=$PIECE(stub,".",2)
        Set sname=$PIECE(stub,".",1)
        If stype="i" {
            Do ..GetIndexDetails(ClassName,sname,.typeclass)
            If typeclass="" Set typeclass="%Compiler.Type.Index"
            Do ..GetMethodDetails(typeclass,smethod,.returntype)
        } If stype="q" {
            Do ..GetQueryDetails(ClassName,sname,.typeclass)
            Do ..GetMethodDetails(typeclass,smethod,.returntype)
        }
    } 
    ; if the method returns an object handle its probably %Open or %New or an IndexOpen or something that returns itself
    If returntype="%Library.ObjectHandle" Set returntype=ClassName
    Quit returntype
}

/// Returns 1 if details were found
Method GetIndexDetails(ClassName As %String, Name As %String, Output TypeClass As %String, Output Origin As %String) As %Boolean
{
    New %NS Set %NS=..Namespace.Name
    If ClassName="" Quit 0

    Set fcn=..FullClassName(ClassName)

    Set ufield=$$$UPPER(Name)
	; sometimes fields have quotes around
	If $EXTRACT(ufield,1)="""",$EXTRACT(ufield,*)="""" Set ufield=$EXTRACT(ufield,2,*-1)

    Do ..CacheIfNecessary(fcn,"GID")
	  
    Set data=$GET(^PXW.Cache("CDEF",%NS,$$$UPPER(fcn),"GID",ufield))
    If data="" Quit 0
    Set TypeClass=$LISTGET(data,2)
    Set Origin=$LISTGET(data,3)
	Quit 1
}

/// Returns 1 if details were found
Method GetQueryDetails(ClassName As %String, Name As %String, Output Type As %String, Output Origin As %String) As %Boolean
{
    New %NS Set %NS=..Namespace.Name
    If ClassName="" Quit 0

    Set fcn=..FullClassName(ClassName)

 	Set ufield=$$$UPPER(Name)
	; sometimes fields have quotes around
	If $EXTRACT(ufield,1)="""",$EXTRACT(ufield,*)="""" Set ufield=$EXTRACT(ufield,2,*-1)

    Do ..CacheIfNecessary(fcn,"GQD")
	  
    Set data=$GET(^PXW.Cache("CDEF",%NS,$$$UPPER(fcn),"GQD",ufield))
    If data="" Quit 0
    Set Type=$LISTGET(data,2)
    Set Origin=$LISTGET(data,3)
	Quit 1
}

ClassMethod FullClassName(Class As %String, CurrentPackage As %String = "") As %String
{
	If Class="" Quit ""
	If $EXTRACT(Class,1)="%",$LENGTH(Class,".")=1 Set Class="%Library."_$EXTRACT(Class,2,*)
	If Class'[".",CurrentPackage'="" Set Class=CurrentPackage_"."_Class
	Quit Class
}

Method List(Name As %String) As PXW.DEV.Dictionary.AtelierRS
{
    Quit ..ListClassDetailsWild(Name)
}

Method ListClassDetails(ClassName As %String = "", SQLTableName As %String = "") As PXW.DEV.Dictionary.AtelierRS
{
    $$$DEBUGMethodBegin
    Kill parameters
	Set server=..AtelierSettings.ServerName
	Set sql=""
    Set sql=sql_"SELECT Name,ClassType,Super,PrimarySuper,to_char($piece(TimeChanged,'.',1),'YYYY-MM-DD HH24:MI:SS') as TimeChanged"
    Set sql=sql_",SqlQualifiedNameQ,IncludeCodeAll,IncludeMGenAll,PropertyClass,ClassType as SubType"
    Set sql=sql_" FROM %Dictionary.CompiledClass "
    Set sql=sql_" WHERE 1=1 "
    If ClassName'="" {
        Set sql=sql_" AND Name = ?"
        Set parameters($INCREMENT(parameters))=ClassName
    }
    If SQLTableName'="" {
        Set sql=sql_" AND UPPER(SqlQualifiedNameQ) =UPPER(?)"
        Set parameters($INCREMENT(parameters))=SQLTableName
    }
	Set qsc=##class(PXW.DEV.Dictionary.AtelierClient).query(server,sql,.obj,parameters...)
	If $$$ISERR(qsc) $$$ThrowStatus(qsc)
 	Set rs=##class(PXW.DEV.Dictionary.AtelierRS).%New(obj)
    Set rs.SQL=sql
    $$$DEBUGMethodEnd
	Quit rs
}

Method CacheListClassDetails(ClassName As %String = "", SQLTableName As %String = "")
{
    New %NS Set %NS=..Namespace.Name
    Set rs=..ListClassDetails(ClassName,SQLTableName)
    Set count=0
    While rs.%Next() {
        Set cname=rs.%Get("Name")
        Do ..CacheClearClassDetails(cname,0) ; class is updating so tidy up index
        Set sqlname=rs.%Get("SqlQualifiedNameQ")
        Set inc1=rs.%Get("IncludeCodeAll"),inc2=rs.%Get("IncludeMGenAll")
        Set includes="",includegens=""
        If inc1'="" Set sep="" For i=1:1:$LISTLENGTH(inc1) Set includes=includes_sep_$LISTGET($LISTGET(inc1,i),1),sep=","
        If inc2'="" Set sep="" For i=1:1:$LISTLENGTH(inc2) Set includegens=includegens_sep_$LISTGET($LISTGET(inc2,i),1),sep=","
        Set data=$LISTBUILD(cname,rs.%Get("ClassType"),rs.%Get("Super"),rs.%Get("PrimarySuper"),sqlname,includes,includegens,rs.%Get("PropertyClass"))            
        Set ^PXW.Cache("CDEF",%NS,$$$UPPER(cname),"GCD","data")=data
        If sqlname'="" Set ^PXW.Cache("CDEFSQL",%NS,$$$UPPER(sqlname))=cname
        Set count=count+1
    }
    If count=0,ClassName'="" Do ..CacheClearClassDetails(ClassName,1) ; delete as class has gone
}

Method CacheClearClassDetails(ClassName As %String, ClassGone As %Boolean = 0)
{
    New %NS Set %NS=..Namespace.Name
    Set olddata=$GET(^PXW.Cache("CDEF",%NS,$$$UPPER(ClassName),"GCD","data"))
    Set oldsqlname=$LISTGET(olddata,5)
    If oldsqlname'="" Kill ^PXW.Cache("CDEFSQL",%NS,$$$UPPER(oldsqlname))
    If ClassGone Kill ^PXW.Cache("CDEF",%NS,$$$UPPER(ClassName))
    Quit
}

/// Pass in a ClassName in any case (eg PXW.dev.dictionary.classdefinition) and Name is returned in the correct case
Method GetClassDetails(ClassName As %String, Output classtype As %String, Output Super As %String, Output PrimarySuper As %String, Output Name As %String, Output IncludeAll As %String, Output IncludeGenAll As %String, Output PropertyClass As %String) As %Boolean
{
    New %NS Set %NS=..Namespace.Name
    ; this should not need to be here but I have not sorted out subqueries properly
    If ClassName="" Quit 0
  
    Set fcn=..FullClassName(ClassName)
	; converts a classname to the right case by selecting it in a query
   
    Do ..CacheIfNecessary(fcn,"GCD")
 
    Set data=$GET(^PXW.Cache("CDEF",%NS,$$$UPPER(fcn),"GCD","data"))
    If data="" Quit 0
	Set Name=$LISTGET(data,1)
	Set classtype=$LISTGET(data,2)
    Set Super=$LISTGET(data,3)
    Set PrimarySuper=$LISTGET(data,4)
    Set IncludeAll=$LISTGET(data,6)
    Set IncludeGenAll=$LISTGET(data,7)
    Set PropertyClass=$LISTGET(data,8)
	Quit 1
}

Method GetClassName(ClassName As %String, Output classtype As %String) As %String
{
  	Set name="",classtype=""
    Do ..GetClassDetails(ClassName,.classtype,,,.name)
	Quit name
}

/// OwningClassName is the name of the class that the query belongs to. Used when no schema is provided.
Method GetClassNameFromTableName(SQLTableName As %String, OwningClassName As %String) As %String
{
    New %NS Set %NS=..Namespace.Name
    Set table=SQLTableName
    ;i table'[".",'$d(OwningClassName) break
    If table'[".",OwningClassName'="" {
        Set schema=$PIECE(OwningClassName,".",1,*-1)
        Set schema=$TRANSLATE(schema,".","_")
        Set table=schema_"."_table
    }

    ; use a local var as a cache, so that the next time a different process looks at
    ; for the table name it might have been set up
    If '$DATA(%PXWSQLName($$$UPPER(table))) {
        Set classname=$GET(^PXW.Cache("CDEFSQL",%NS,$$$UPPER(table)))
        If classname="" {
            Do ..CacheListClassDetails(,table)
          	Set classname=$GET(^PXW.Cache("CDEFSQL",%NS,$$$UPPER(table)))
        }
        Set %PXWSQLName($$$UPPER(table))=classname
    } Else {
        Set classname=%PXWSQLName($$$UPPER(table))
    }
	Quit classname
}

/// Pass in "f1_data.race" to get the same result back
/// pass in "race", "f1.data.queryclass" to get back "f1_data.race", its taking the schema from the querying class
ClassMethod GetFullTableName(SQLTableName As %String, OwningClassName As %String = "") As %String
{
    Set table=SQLTableName
    If table'[".",OwningClassName'="" {
        Set schema=$PIECE(OwningClassName,".",1,*-1)
        Set schema=$TRANSLATE(schema,".","_")
        Set table=schema_"."_table
    }
    Quit table ; I am not sure if the default schema can be changed on the calling class, if it CAN then this is not dealing with it...
}

Method GetClassNameFromStoredProc(SQLProcName As %String, Output method As %String, This As %String) As %String
{
    
    ; simple formula to start with
    Set cn=$PIECE(SQLProcName,"_",1,*-1)
    Set cn=$TRANSLATE(cn,"_",".")
    Set classname=..GetClassName(cn)
    Set mn=$PIECE(SQLProcName,"_",*)
    Set method=mn
	Quit classname
}

Method GetParameterDetails(ClassName As %String, Name As %String, Output Type As %String, Output Origin As %String) As %Boolean
{
   
    New %NS Set %NS=..Namespace.Name
    If ClassName="" Quit 0
    Set fcn=..FullClassName(ClassName) 

 	Set ufield=$$$UPPER(Name)
	; sometimes fields have quotes around
	If $EXTRACT(ufield,1)="""",$EXTRACT(ufield,*)="""" Set ufield=$EXTRACT(ufield,2,*-1)

    Do ..CacheIfNecessary(fcn,"GAD")

    ;  s data=$lb(pname,rs.%Get("Type"),rs.%Get("Origin"))            
    ;  s ^PXW.Cache("CDEF",%NS,$$$UPPER(cn),"GAD",$$$UPPER(pname))=data
 
    Set data=$GET(^PXW.Cache("CDEF",%NS,$$$UPPER(fcn),"GAD",ufield))
    If data="" Quit 0

    Set Type=$LISTGET(data,2)
    Set Origin=$LISTGET(data,3)
 	Quit 1
}

/// Pass in a parameter Id (classname||parameter) and get back the name of the class
/// that its overriding
Method GetParameterOverrides(ParameterId As %String) As %String
{
    Set classname=$PIECE(ParameterId,"||",1)
    Set propertyname=$PIECE(ParameterId,"||",2)
    
    Set overrides=""
    If ..GetClassDetails(classname,,.supers) {
        ; supers=,"~PXW.DEV.COS.Parser~PXW.DEV.Parser~%Library.RegisteredObject~%Library.Base~%Library.SystemBase~"
        For i=1:1:$LENGTH(supers,",") {
            Set scn=$PIECE(supers,",",i)
            If ..GetParameterDetails(scn,propertyname,,.origin),origin'="" {
                Set overrides=origin
                Quit
            }
        }
    }
    Quit overrides
}

/// Get the path of the classes when following a property/method path
/// Pass in:
///     ClassName: name of the start class
///     PropertyPath: path of each property to follow.
/// Sets up array:
///     Path(n)=$lb(classname,propertyname,type)
///     classname=sourceclass
///     propertyname=propertyname on the path
///     type=type of property (classname on the next step on the path)
/// 
/// USER>k  s %NS="LOCAL_USER" d ##class(PXW.DEV.Dictionary.ClassDefinition).GetClassPath("PXW.DEV.COS.Object","ChainedMethod.ChainedProperty.Name",.a) zw a
/// a=3
/// a(1)=$lb("PXW.DEV.COS.Object","ChainedMethod","PXW.DEV.COS.Objects.Method")
/// a(2)=$lb("PXW.DEV.COS.Objects.Method","ChainedProperty","PXW.DEV.COS.Objects.Property")
/// a(3)=$lb("PXW.DEV.COS.Objects.Property","Name","PXW.DEV.Atom")
/// if some step on the path cannot be found then the array will have blanks
Method GetClassPath(ClassName As %String, PropertyPath As %String, Output PathArray As %List)
{
	
    Set classname=ClassName
    For i=1:1:$LENGTH(PropertyPath,".") {
        ; the objectchain has the "." and the name
        Set propertyname=$PIECE(PropertyPath,".",i)
        Set found=..GetPropertyDetails(classname,propertyname,.type)
        Set:'found type=..GetMethodReturnType(classname,propertyname)
        Set PathArray($INCREMENT(PathArray))=$LISTBUILD(classname,propertyname,type)
        Set classname=type
    }
}

/// Get the path of the classes when following a field path
/// Pass in:
///     TableName: name of the start table
///     FieldPath: path of each field to follow (separated by ->)
/// Sets up array:
///     Path(n)=$lb(classname,propertyname,type)
///     classname=sourceclass
///     propertyname=propertyname on the path
///     type=type of property (classname on the next step on the path)
/// 
/// k  s %NS="LOCAL_USER" d ##class(PXW.DEV.Dictionary.ClassDefinition).GetClassPathFromTable("f1_data.result","Race->Circuit->Name",.a)
/// returns
/// a=3
/// a(1)=$lb("f1.data.result","Race","f1.data.race")
/// a(2)=$lb("f1.data.race","Circuit","f1.data.circuit")
/// a(3)=$lb("f1.data.circuit","Name","data.model.string")
/// if some step on the path cannot be found then the array will have blanks
Method GetClassPathFromTable(TableName As %String, FieldPath As %String, Output PathArray As %List)
{
	
    Set classname=..GetClassNameFromTableName(TableName)
    For i=1:1:$LENGTH(FieldPath,"->") {
        ; the objectchain has the "." and the name
        Set fieldname=$PIECE(FieldPath,"->",i)
        Set type=..GetPropertyTypeSQL(classname,fieldname)
        Set PathArray($INCREMENT(PathArray))=$LISTBUILD(classname,fieldname,type)
        Set classname=type
    }
}

/// s cs=##class(PXW.DEV.Dictionary.ClassDefinitionObject).%OpenId("LOCAL_USER")
/// w cs.GetMacroLocation("PXW.DEV.Element","DEBUGMethodBegin",.doc,.line)
/// This is only cached in a %VAR because the INC could change and the cache is based
/// on the CLASS.
Method GetMacroLocation(ClassUsingMacro As %String, MacroName As %String, Output sourceDocument As %String, Output lineNumber As %Integer) As %Boolean
{
    $$$DEBUGMethodBegin
    Set server=..AtelierSettings.ServerName
    Set macro=$PIECE(MacroName,"(",1) ; in case full macro gets passed in
    If macro?1"$$$".E {
        Set macro=$PIECE(macro,"$$$",2)
    }
    If '$DATA(^||PXWMACLOC(ClassUsingMacro,macro)) {
        If ..GetClassDetails(ClassUsingMacro,,,,,.include,.includegen) {
            Set sourceDocument="",lineNumber=""
            Set sc=##class(PXW.DEV.Dictionary.AtelierClient).macroLocation(server,ClassUsingMacro_".CLS",macro,include,includegen,.obj)
            If $$$ISOK(sc) {
                ; remove the .inc from the document name
                Set ^||PXWMACLOC(ClassUsingMacro,macro)=$LISTBUILD(obj.result.content.document,obj.result.content.line)
            }
        }
    }
    Set data=$GET(^||PXWMACLOC(ClassUsingMacro,macro))
    Set sourceDocument=$LISTGET(data,1),lineNumber=$LISTGET(data,2),found=(sourceDocument'="")
    $$$DEBUGMethodEnd
	Quit found
}

ClassMethod FindNamespaceFromIRISNameSpace(IRISNameSpace As %String) As %String [ SqlProc ]
{
    &SQL(SELECT cdef.Namespace INTO :ns
            FROM pxw_dev_dictionary.ClassDefinitionObject as cdef
            left outer join PXW_DEV_Dictionary.AtelierSettings  as atel on atel.ServerName =cdef.AtelierSettings
            where atel.Namespace=:IRISNameSpace
            )
    If SQLCODE'=0 Set ns=""
    Quit ns
}

Method GetViewSQL(schema As %String, table As %String) As %String
{
    $$$DEBUGMethodBegin

    Set sql="SELECT  v.CLASSNAME,cd.viewquery "
    Set sql=sql_" FROM INFORMATION_SCHEMA.VIEWS as v"
    Set sql=sql_" inner join %Dictionary.ClassDefinition as cd on cd.ID=v.ClassName"
    Set sql=sql_" where v.table_schema=?" Set params($INCREMENT(params))=schema
    Set sql=sql_" and v.table_name=?" Set params($INCREMENT(params))=table
	
    Set qsc=##class(PXW.DEV.Dictionary.AtelierClient).query(..AtelierSettings.ServerName,sql,.obj,params...)
	If $$$ISERR(qsc) $$$ThrowStatus(qsc)
 	Set rs=##class(PXW.DEV.Dictionary.AtelierRS).%New(obj)
    Set rs.SQL=sql

    Set viewQuery=""
    if $$$ISOK(qsc)	{
         While rs.%Next() {
            Set viewQuery=viewQuery_rs.%Get("ViewQuery")
        }
    }
    $$$DEBUGMethodEnd
    Quit viewQuery
}

Storage Default
{
<Data name="ClassDefinitionObjectDefaultData">
<Subscript>"ClassDefinitionObject"</Subscript>
<Value name="1">
<Value>AtelierSettings</Value>
</Value>
<Value name="2">
<Value>ExcludeClassesLike</Value>
</Value>
<Value name="3">
<Value>ExcludeClassesExtends</Value>
</Value>
<Value name="4">
<Value>JDBCName</Value>
</Value>
</Data>
<Data name="KnownVariables">
<Attribute>KnownVariables</Attribute>
<Structure>subnode</Structure>
<Subscript>"PXW.DEV.Dictionary.ClassDefinitionObject.KnownVariables"</Subscript>
</Data>
<DefaultData>ClassDefinitionObjectDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
