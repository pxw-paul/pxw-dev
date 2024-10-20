Include PXW.Debuggers.Macros

Class PXW.Xref.Build Extends %Library.RegisteredObject
{

/// do ##class(PXW.Xref.Build).Build("LOCAL_USER","","PXW*")
ClassMethod Build(Namespace As %String, Type As %String, SearchName As %String, Force As %Boolean = 0) As %Status
{
	Kill ^||PXWXrefBuild
	Set sc=$$$OK
	Try {
		; if the name has a * that means do everything starting with that string, not true wildcard, just counts as a package
		; * is valid on its own (it means build all)
		Set buildmany=(SearchName["*")
		Set package=$SELECT(buildmany:$PIECE(SearchName,"*",1),1:"")
		If buildmany=1 {
			Set status=##class(PXW.Xref.BuildStatus).%New()
			Set status.RequestNamespace=Namespace
			Set status.RequestType=Type
			Set status.RequestSearchName=SearchName
			Set status.RequestForce=Force
			Do status.Start()
			$$$ThrowOnError(status.%Save())
		}
		Set rs=##class(%Library.ResultSet).%New(..%ClassName(1)_":"_"SelectTypes")
		Set sc=rs.Execute(Namespace,Type)
		Set useTheForce=Force
		While rs.%Next() {
			Set typ=rs.%Get("Type")
			If Force,buildmany {
				If $DATA(status) {
					Set status.CurrentlyBuilding="Purging old data: "_typ_","_package
					$$$ThrowOnError(status.%Save())
				}
				set:$$$ISOK(sc) sc=..DeleteAnalysisCalledByTypeKey1Package(Namespace,typ,package)
				set:$$$ISOK(sc) sc=..DeleteCalledByTypeKey1Package(Namespace,typ,package)
				set:$$$ISOK(sc) sc=..DeleteLastUpdateCalledByTypeKey1Package(Namespace,typ,package)
				; We have purged the lastupdate table so no need to force now.
				; Which means we could kick off a Force on *, THEN build PXW package on a second process (because we are impatient)
				; Then when the * build gets to PXW it will see that its already been done!
				Set useTheForce=0
				hang 1
			}
			Set builderClass=rs.%Get("Builder")
			If builderClass'="" {
				Set interface=##class(PXW.DEV.Dictionary.CodeInterface).%OpenId(rs.%Get("ID"))
				If $DATA(status) {
					Set status.CurrentlyBuilding="Searching "_Namespace_" : "_typ_" : "_SearchName
					$$$ThrowOnError(status.%Save())
				}
				Set rs2=interface.List(SearchName)
				While rs2.%Next() {
					Set timechanged=rs2.%Get("TimeChanged")
					Set name=rs2.%Get("Name")
					Set ^||PXWXrefBuild(interface.%Id(),$INCREMENT(count))=$LISTBUILD(typ,name,timechanged,builderClass)
				}
			}
		}

		if $$$ISOK(sc) {
			Set:$DATA(status) status.Total=$GET(count)
			Set iid=""
			For  {
				Set iid=$ORDER(^||PXWXrefBuild(iid))
				Quit:iid=""
				Set interface=##class(PXW.DEV.Dictionary.CodeInterface).%OpenId(iid)
				Set key=""
				For  {
					Set key=$ORDER(^||PXWXrefBuild(iid,key),1,data)
					Quit:key=""
					Set $LISTBUILD(typ,name,timechanged,builderClass)=data
					If builderClass'="" {
						If $DATA(status) {
							Set status.CurrentlyBuilding=Namespace_" : "_typ_" : "_name
							$$$ThrowOnError(status.%Save())
						}
						Set bs=..BuildIfNecessary(interface,Namespace,typ,name,timechanged,builderClass,useTheForce)
						If bs=1 {
							Set:$DATA(status) status.TotalBuilt=status.TotalBuilt+1
						} ElseIf bs="" {
							Set:$DATA(status) status.TotalSkipped=status.TotalSkipped+1
						} Else {
							Set:$DATA(status) status.TotalErrors=status.TotalErrors+1
						}
					}
				}
			}
		}
	} Catch except {
		Set sc=except.AsStatus()
	}
	
	If $DATA(status) {
		Set status.CurrentlyBuilding=""
		Set status.Status=sc
		Do status.End()
		$$$ThrowOnError(status.%Save())
	}
	Quit sc
}

ClassMethod BuildIfNecessary(CodeInterface As PXW.DEV.Dictionary.CodeInterface, Namespace As %String, Type As %String, Name As %String, TimeChanged As %TimeStamp, BuilderClass As %String, Force As %Boolean) As %Boolean [ Internal ]
{
	Set savesc=""
	Set built=""
	Set text=""

	Set builder=$SYSTEM.OBJ.New(BuilderClass)
	Set LastUpdate=##class(PXW.Xref.LastUpdated).OpenOrNew(Namespace,Type,Name)
	If Force || LastUpdate.NeedsUpdate(TimeChanged) {
		Set ^PXW("BIF",$INCREMENT(^PXW))=Name_"*"_LastUpdate.LastUpdate_"*"_TimeChanged
		Set sc=CodeInterface.Load(Name,.text)
		Set zh=$ZHOROLOG
		Do ..DeleteAnalysisCalledByTypeKey1(Namespace,Type,Name)
 		Do ..DeleteCalledByTypeKey1(Namespace,Type,Name)
		Set sc=builder.Build(Namespace,Name,text)
		If $$$ISOK(sc) {
			Do LastUpdate.%SetModified(1) ; because the lastupdate table is cleared via SQL as part of the build so ensure it saves again
			Set LastUpdate.LastUpdate=TimeChanged
			Set LastUpdate.BuildStatus=sc
			Set LastUpdate.BuiltAt=$ZDATETIME($HOROLOG,3)
			Set LastUpdate.CheckedAt=LastUpdate.BuiltAt
			Set LastUpdate.BuildProcessTime=$ZHOROLOG-zh
			Set savesc=LastUpdate.%Save()
			Set built=1
		} Else {
			Do LastUpdate.%SetModified(1)
			Set LastUpdate.LastUpdate=""
			Set LastUpdate.BuildStatus=sc
			Set LastUpdate.CheckedAt=$ZDATETIME($HOROLOG,3)
			Set LastUpdate.BuildProcessTime=$ZHOROLOG-zh
			Set savesc=LastUpdate.%Save()
			Set built=0
		}
	} Else {
		If 'Force {
			Set built=""
		}
		Set LastUpdate.CheckedAt=$ZDATETIME($HOROLOG,3)
		Set savesc=LastUpdate.%Save()
	}
	Quit built
}

/// Stick a call to this somewhere so that it gets called often, it should ensure that a full build is done at least 1 time per day
/// write ##class(PXW.Xref.Build).DailyBuild("LOCAL_USER")
ClassMethod DailyBuild(Namespace) As %Boolean
{
	Set id=""
	set started=0 
	&SQL(SELECT TOP 1 ID INTO :id FROM PXW_Xref.BuildStatus WHERE RequestNamespace=:Namespace AND StartDate=CURRENT_DATE)
	; SQLCODE=100 means ok but no rows
	if SQLCODE=100 {
		j ..Build(Namespace,"","*",0)
		set started=1
	}
	quit started
}

Query SelectTypes(Namespace As %String, Type As %String) As PXW.LIB.SQL.Query [ SqlProc ]
{
    SELECT ci.ID
        , ci.Namespace
        , ci.Type
        , cti.Class as Builder
      FROM PXW_DEV_Dictionary.CodeInterface as ci
      LEFT OUTER JOIN PXW_DEV_Dictionary.CodeTypeIndex as cti
                    ON cti.Usage='XrefBuilder' AND cti.CodeType=ci.Type
      WHERE ci.Namespace=:Namespace
        AND ((:Type IS NULL) OR (ci.Type=:Type))
}

ClassMethod DeleteAnalysisCalledByTypeKey1Package(NameSpace As %String, ItemType As %String, ItemByKey1 As %String) As %Status
{
    $$$DEBUGMethodBegin
	Set jrnsts=$$CURRENT^%NOJRN()
	Do $SYSTEM.SQL.Util.SetOption("AutoCommit",0,.acsts)
	Do DISABLE^%NOJRN
	Set sc=$$$OK
	If $$$ISOK(sc) {
		&SQL(DELETE %NOLOCK FROM PXW_Xref.AnalysisData
			WHERE  NameSpace=:NameSpace AND ItemType=:ItemType AND ItemKey1 %STARTSWITH :ItemKey1)
        $$$DEBUG($GET(%msg))
	    If SQLCODE<0 Set sc=$$$ERROR(5001,%msg)
    }
	Do $SYSTEM.SQL.Util.SetOption("AutoCommit",acsts)
	Do:jrnsts ENABLE^%NOJRN
    $$$DEBUGMethodEnd
	Quit sc
}

ClassMethod DeleteAnalysisCalledByTypeKey1(NameSpace As %String, ItemType As %String, ItemKey1 As %String) As %Status
{
    $$$DEBUGMethodBegin
	Set jrnsts=$$CURRENT^%NOJRN()
	Do $SYSTEM.SQL.Util.SetOption("AutoCommit",0,.acsts)
	Do DISABLE^%NOJRN
	Set sc=$$$OK
	If $$$ISOK(sc) {
		&SQL(DELETE %NOLOCK FROM PXW_Xref.AnalysisData
			WHERE NameSpace=:NameSpace AND ItemType=:ItemType AND ItemKey1=:ItemKey1)
        $$$DEBUG($GET(%msg))
        If SQLCODE<0 Set sc=$$$ERROR(5001,%msg)
   	}

	Do $SYSTEM.SQL.Util.SetOption("AutoCommit",acsts)
	Do:jrnsts ENABLE^%NOJRN

    $$$DEBUGMethodEnd
	Quit sc
}

ClassMethod DeleteCalledByTypeKey1Package(NameSpace As %String, CalledByType As %String, CalledByKey1 As %String) As %Status
{
    $$$DEBUGMethodBegin
	Set jrnsts=$$CURRENT^%NOJRN()
	Do $SYSTEM.SQL.Util.SetOption("AutoCommit",0,.acsts)
	Do DISABLE^%NOJRN
	Set sc=$$$OK
	If $$$ISOK(sc) {
		&SQL(DELETE %NOLOCK FROM PXW_Xref.Data
			WHERE  NameSpace=:NameSpace AND CalledByType=:CalledByType AND CalledByKey1 %STARTSWITH :CalledByKey1)
        $$$DEBUG($GET(%msg))
	    If SQLCODE<0 Set sc=$$$ERROR(5001,%msg)
    }
	Do $SYSTEM.SQL.Util.SetOption("AutoCommit",acsts)
	Do:jrnsts ENABLE^%NOJRN
    $$$DEBUGMethodEnd
	Quit sc
}

ClassMethod DeleteLastUpdateCalledByTypeKey1Package(NameSpace As %String, CalledByType As %String, CalledByKey1 As %String) As %Status
{
    $$$DEBUGMethodBegin
	Set jrnsts=$$CURRENT^%NOJRN()
	Do $SYSTEM.SQL.Util.SetOption("AutoCommit",0,.acsts)
	Do DISABLE^%NOJRN
	Set sc=$$$OK
	If $$$ISOK(sc) {
		&SQL(DELETE %NOLOCK FROM PXW_Xref.LastUpdated
				WHERE NameSpace=:NameSpace 
				 AND (ItemType=:CalledByType) 
				 AND (ItemKey1 %STARTSWITH :CalledByKey1))
        $$$DEBUG($GET(%msg))
	    If SQLCODE<0 Set sc=$$$ERROR(5001,%msg)
    }
	Do $SYSTEM.SQL.Util.SetOption("AutoCommit",acsts)
	Do:jrnsts ENABLE^%NOJRN
    $$$DEBUGMethodEnd
	Quit sc
}

ClassMethod DeleteCalledByTypeKey1(NameSpace As %String, CalledByType As %String, CalledByKey1 As %String) As %Status
{
    $$$DEBUGMethodBegin
	Set jrnsts=$$CURRENT^%NOJRN()
	Do $SYSTEM.SQL.Util.SetOption("AutoCommit",0,.acsts)
	Do DISABLE^%NOJRN
	Set sc=$$$OK
	If $$$ISOK(sc) {
		&SQL(DELETE %NOLOCK FROM PXW_Xref.Data
			WHERE NameSpace=:NameSpace AND CalledByType=:CalledByType AND CalledByKey1=:CalledByKey1)
        $$$DEBUG($GET(%msg))
        If SQLCODE<0 Set sc=$$$ERROR(5001,%msg)
   	}


	If $$$ISOK(sc) {
		&SQL(DELETE %NOLOCK FROM PXW_Xref.LastUpdated
			WHERE NameSpace=:NameSpace AND ItemType=:CalledByType AND ItemKey1=:CalledByKey1)
        $$$DEBUG($GET(%msg))
	    If SQLCODE<0 Set sc=$$$ERROR(5001,%msg)
    }
	Do $SYSTEM.SQL.Util.SetOption("AutoCommit",acsts)
	Do:jrnsts ENABLE^%NOJRN

    $$$DEBUGMethodEnd
	Quit sc
}

}
