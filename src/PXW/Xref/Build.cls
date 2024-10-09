Include PXW.Debuggers.Macros

Class PXW.Xref.Build Extends %Library.RegisteredObject
{

/// override this for where you want to log the results
Property output As PXW.Xref.BuildOutput;

/// 
/// 
/// k  d ##class(PXW.Xref.Build).XrefClassId("LOCAL_USER","PXW.Xref.Build","xref")
ClassMethod XrefClassId(Namespace As %String, ClassId As %String, debug As %String = "")
{
	; temp fix
	New %NS Set %NS=Namespace

	If debug=1 Set debug="" $$$DEBUGNew("")
	$$$DEBUG("Starting "_Namespace_" "_ClassId)
	Set xrefer=..%New()
	Set xrefer.output=##class(PXW.Xref.BuildOutput).%New()
	Do xrefer.xrefClass(Namespace,ClassId,debug)
	$$$DEBUGStop
}

/// XrefPackage is a method that can be called from the command line, the output is basic.
/// debug is the name of a method or property 
/// d ##CLASS(PXW.Xref.Build).XrefPackage("LOCAL_USER","PXW.Xref","")
ClassMethod XrefPackage(Namespace As %String, Package As %String, debug As %String = "", force As %Boolean = 0, background As %Boolean = 0)
{
	; temp fix
	New %NS Set %NS=Namespace

	Set xrefer=..%New()
	If background {
		Set xrefer.output=##class(PXW.Xref.BuildOutputJob).%New()
	} Else {
		Set xrefer.output=##class(PXW.Xref.BuildOutput).%New()
	}
	Do xrefer.doPackage(Namespace,Package,force)
}

Method logBatchStart(CountOfThings As %Integer)
{
	If $ISOBJECT(..output) Do ..output.batchStart(CountOfThings)
}

Method logBatchStatus(CountOfThings As %Integer, Status As %Status)
{
	If $ISOBJECT(..output) Do ..output.batchStatus(CountOfThings,Status)
}

Method logProcessStart(ClassName As %String)
{
	If $ISOBJECT(..output) Do ..output.processStart(ClassName)
}

Method logProcessStatus(ClassName As %String, Status As %Status)
{
	If $ISOBJECT(..output) Do ..output.processStatus(ClassName,Status)
}

/// debug is either classname or a method id
Method doPackage(Namespace As %String, Package As %String, force As %Boolean = 0) As %Status
{
	If force {
		Set sc=..DeleteAnalysisCalledByKey1Package(Namespace,Package)
		Set sc=..DeleteCalledByKey1Package(Namespace,Package)
        If 'sc Quit sc
	}

	Kill ^||PXWXrefBuild
	Set cls=Package_"%"
	Set handler=##class(PXW.DEV.Dictionary.ClassDefinitionObject).%OpenId(Namespace)
	Set rs=handler.ListClassDetailsLike(cls)
	Set count=0
	While rs.%Next() {
		Set timechanged=rs.%Get("TimeChanged")
		Set name=rs.%Get("Name")
		Set ^||PXWXrefBuild($INCREMENT(count))=$LISTBUILD(timechanged,name)
	}
	Do ..logBatchStart(count)
	Set completed=0
	For i=1:1:count {
		Set data=^||PXWXrefBuild(i)
		Set $LISTBUILD(timechanged,name)=data
		If ..xrefClassIfNecessary(Namespace,name,timechanged,force) {
			Set completed=completed+1
		}
	}
	Do ..logBatchStatus(completed,$$$OK)
    Quit $$$OK
}

/// Checks our LastUpdate datetime and builds the xref if needed. If there is a need to rebuild it will, returns 1 if it built
Method xrefClassIfNecessary(Namespace As %String, ClassId As %String, TimeChanged As %TimeStamp, Force As %Boolean, PreLoadedText As %String = "", Output savesc As %Status) As %Boolean
{
	Set savesc=""
	Set built=0
	Set LastUpdate=##class(PXW.Xref.LastUpdated).OpenOrNew(%NS,"CLS",ClassId)
	If Force || LastUpdate.NeedsUpdate(TimeChanged) {
		Set sc=..xrefClass(Namespace,ClassId,,.PreLoadedText)
		If $$$ISOK(sc) {
			Do LastUpdate.%SetModified(1) ; because the lastupdate table is cleared via SQL as part of the build so endure it saves again
			Set LastUpdate.LastUpdate=TimeChanged
			Set LastUpdate.BuildStatus=sc
			Set savesc=LastUpdate.%Save()
		} Else {
			Do LastUpdate.%SetModified(1)
			Set LastUpdate.LastUpdate=""
			Set LastUpdate.BuildStatus=sc
			Set savesc=LastUpdate.%Save()
		}
		If $$$ISOK(sc) Set built=1
	} Else {
		If 'Force {
			Set built=1
		}
	}
	Quit built
}

/// ID of method etc to debug
/// debug="parse" or "xref"
Method xrefClass(Namespace As %String, ClassId As %String, debug As %String = "", PreLoadedText As %String = "") As %Status
{
	#dim ele as PXW.DEV.Element

    Set ClassServer=##class(PXW.DEV.Dictionary.ClassDefinitionObject).%OpenId(Namespace)
	If PreLoadedText'="" {
		Set sc=$$$OK
		Set text=PreLoadedText
	} Else { 
        Do ClassServer.CacheClearClassDetails(ClassId,1) ; pretend the class is deleted so that it REALLY clears it
		Set sc=ClassServer.GetClassStudioText(ClassId,.text,.linesOfCode)
	}
	If $$$ISOK(sc) {
		Do ..logProcessStart(ClassId)
		Do ..DeleteAnalysisCalledByKey1(Namespace,ClassId)
 		Do ..DeleteCalledByKey1(Namespace,ClassId)
 		Set output=##class(PXW.Xref.bnf).%New()
		Set output.ClassServer=ClassServer
		;s output.This=ClassId
		Do output.begin()
		Try {
			Set x=##class(PXW.DEV.BNF.Run.ClassDefinition).%New()
  		    Set x.stream=##class(PXW.DEV.InputStream).NewString(text)
  			
			Set element=##class(PXW.DEV.Element).%New()
			While x.cheese(element) {
				Do output.middle(element)
				If output.ERROR'="" $$$ThrowStatus($$$ERROR(5001,output.ERROR))
				Set element=##class(PXW.DEV.Element).%New()
			}
			Do output.end()
		} Catch e {
			Set sc=e.AsStatus()
			;s txt=$system.Status.GetErrorText(sc)
			;$$$DEBUG("xrefClass ERROR "_txt)
			Do ..logProcessStatus(ClassId,sc)
		}
		Do output.end()
		Do ..logProcessStatus(ClassId,sc)
	}
	Quit sc
}

ClassMethod DeleteAnalysisCalledByKey1Package(NameSpace As %String, ItemByKey1 As %String) As %Status
{
    $$$DEBUGMethodBegin
	Set jrnsts=$$CURRENT^%NOJRN()
	Do $SYSTEM.SQL.Util.SetOption("AutoCommit",0,.acsts)
	Do DISABLE^%NOJRN
	Set sc=$$$OK
	If $$$ISOK(sc) {
		&SQL(DELETE %NOLOCK FROM PXW_Xref.AnalysisData
			WHERE  NameSpace=:NameSpace AND ItemKey1 %STARTSWITH :ItemKey1)
        $$$DEBUG($GET(%msg))
	    If SQLCODE<0 Set sc=$$$ERROR(5001,%msg)
    }
	/*
	If $$$ISOK(sc) {
		&SQL(DELETE %NOLOCK FROM PXW_Xref.LastUpdated
				WHERE NameSpace=:NameSpace AND CalledByKey1 %STARTSWITH :CalledByKey1)
        $$$DEBUG($GET(%msg))
	    If SQLCODE<0 Set sc=$$$ERROR(5001,%msg)
    }
	*/
	Do $SYSTEM.SQL.Util.SetOption("AutoCommit",acsts)
	Do:jrnsts ENABLE^%NOJRN
    $$$DEBUGMethodEnd
	Quit sc
}

ClassMethod DeleteAnalysisCalledByKey1(NameSpace As %String, ItemKey1 As %String) As %Status
{
    $$$DEBUGMethodBegin
	Set jrnsts=$$CURRENT^%NOJRN()
	Do $SYSTEM.SQL.Util.SetOption("AutoCommit",0,.acsts)
	Do DISABLE^%NOJRN
	Set sc=$$$OK
	If $$$ISOK(sc) {
		&SQL(DELETE %NOLOCK FROM PXW_Xref.AnalysisData
			WHERE NameSpace=:NameSpace AND ItemKey1=:ItemKey1)
        $$$DEBUG($GET(%msg))
        If SQLCODE<0 Set sc=$$$ERROR(5001,%msg)
   	}

	/*
	If $$$ISOK(sc) {
		&SQL(DELETE %NOLOCK FROM PXW_Xref.LastUpdated
			WHERE NameSpace=:NameSpace AND CalledByKey1=:CalledByKey1)
        $$$DEBUG($GET(%msg))
	    If SQLCODE<0 Set sc=$$$ERROR(5001,%msg)
    }
	*/
	Do $SYSTEM.SQL.Util.SetOption("AutoCommit",acsts)
	Do:jrnsts ENABLE^%NOJRN

    $$$DEBUGMethodEnd
	Quit sc
}

ClassMethod DeleteCalledByKey1Package(NameSpace As %String, CalledByKey1 As %String) As %Status
{
    $$$DEBUGMethodBegin
	Set jrnsts=$$CURRENT^%NOJRN()
	Do $SYSTEM.SQL.Util.SetOption("AutoCommit",0,.acsts)
	Do DISABLE^%NOJRN
	Set sc=$$$OK
	If $$$ISOK(sc) {
		&SQL(DELETE %NOLOCK FROM PXW_Xref.Data
			WHERE  NameSpace=:NameSpace AND CalledByKey1 %STARTSWITH :CalledByKey1)
        $$$DEBUG($GET(%msg))
	    If SQLCODE<0 Set sc=$$$ERROR(5001,%msg)
    }
	If $$$ISOK(sc) {
		&SQL(DELETE %NOLOCK FROM PXW_Xref.LastUpdated
				WHERE NameSpace=:NameSpace AND ItemKey1 %STARTSWITH :CalledByKey1)
        $$$DEBUG($GET(%msg))
	    If SQLCODE<0 Set sc=$$$ERROR(5001,%msg)
    }
	Do $SYSTEM.SQL.Util.SetOption("AutoCommit",acsts)
	Do:jrnsts ENABLE^%NOJRN
    $$$DEBUGMethodEnd
	Quit sc
}

ClassMethod DeleteCalledByKey1(NameSpace As %String, CalledByKey1 As %String) As %Status
{
    $$$DEBUGMethodBegin
	Set jrnsts=$$CURRENT^%NOJRN()
	Do $SYSTEM.SQL.Util.SetOption("AutoCommit",0,.acsts)
	Do DISABLE^%NOJRN
	Set sc=$$$OK
	If $$$ISOK(sc) {
		&SQL(DELETE %NOLOCK FROM PXW_Xref.Data
			WHERE NameSpace=:NameSpace AND CalledByKey1=:CalledByKey1)
        $$$DEBUG($GET(%msg))
        If SQLCODE<0 Set sc=$$$ERROR(5001,%msg)
   	}


	If $$$ISOK(sc) {
		&SQL(DELETE %NOLOCK FROM PXW_Xref.LastUpdated
			WHERE NameSpace=:NameSpace AND ItemKey1=:CalledByKey1)
        $$$DEBUG($GET(%msg))
	    If SQLCODE<0 Set sc=$$$ERROR(5001,%msg)
    }
	Do $SYSTEM.SQL.Util.SetOption("AutoCommit",acsts)
	Do:jrnsts ENABLE^%NOJRN

    $$$DEBUGMethodEnd
	Quit sc
}

ClassMethod DeleteCalledByKey2(NameSpace As %String, CalledByKey1 As %String, CalledByKey2 As %String) As %Status
{
    $$$DEBUGMethodBegin
	Set jrnsts=$$CURRENT^%NOJRN()
	Do $SYSTEM.SQL.Util.SetOption("AutoCommit",0,.acsts)
	Do DISABLE^%NOJRN
	Set sc=$$$OK
    If $$$ISOK(sc) {
    	&SQL(DELETE %NOLOCK FROM PXW_Xref.Data 
			WHERE  NameSpace=:NameSpace AND CalledByKey1=:CalledByKey1 AND CalledByKey2=:CalledByKey2)
	    $$$DEBUG($GET(%msg))
        If SQLCODE<0 Set sc=$$$ERROR(5001,%msg)
    }
	If $$$ISOK(sc) {
		&SQL(DELETE %NOLOCK FROM PXW_Xref.LastUpdated
			WHERE NameSpace=:NameSpace AND CalledByKey1=:CalledByKey1 AND CalledByKey1=:CalledByKey1)
        $$$DEBUG($GET(%msg))
	    If SQLCODE<0 Set sc=$$$ERROR(5001,%msg)
    }
	Do $SYSTEM.SQL.Util.SetOption("AutoCommit",acsts)
	Do:jrnsts ENABLE^%NOJRN

    $$$DEBUGMethodEnd
	Quit sc
}

}
