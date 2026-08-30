Include PXW.Debuggers.Macros

Class PXW.Xref.Build Extends %Library.RegisteredObject
{

/// do ##class(PXW.Xref.Build).Build("LOCAL_USER","","PXW*")
/// s %pxwdeb=##class(PXW.Debuggers.BasicToFile).%New(),%pxwdeb.AddDateTime=1 d ##class(PXW.Xref.Build).Build("LOCAL_USER","","*",1)
/// 
/// This will build either 1 or many items based of the given:
/// 	Namespace - leave blank for all.
/// 	Type      - leave blank for all or CLS for classes, INT for routines etc.
///     Package   - A wild card search - * for all, PXW* for PXW*. Not a true wildcard, PXW*Build* will build PXW* only.
/// 	Force 	  - Normally only classes that have changed need building, use the force flag to build "stale" data.
/// 	DebugBuild - If there is a debug log happening, the actual build of the data will NOT go into the log unless this flag is set.
///                  The reason is that the debug being turned on BEFORE this method is called implies you are debugging THIS, rather than all the sub classes,
/// 				 Until I get cleverer about how the debugger works we are stuck with a flag in the parameters!
/// 
/// Multiple builds can be run at once if you are sensible.
/// Do not do a something like a force build of everything while smaller build is running. You will end up purging data that has just been built.
/// Instead, do the large force build first to get the old data purged and then do the packages in parallel.
ClassMethod Build(Namespace As %String, Type As %String, SearchName As %String, Force As %Boolean = 0,DebugBuild as %Boolean=0) As %Status
{
	$$$DEBUGMethodBegin
	$$$DEBUG("Build:"_Namespace_":"_Type_":"_SearchName)
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
		Set useTheForce=Force,noDelete=0
		While rs.%Next() {
			Set typ=rs.%Get("Type")

			; do not let anything continue if there is a delete going on
			; This is for when we are being impatient and starting multiple processes off at the same time
			If $DATA(status) {
				Set status.CurrentlyBuilding="Waiting for purge "_Namespace_"||"_typ
				$$$ThrowOnError(status.%Save())
			}

			Lock +^PXWBuild(Namespace_"||"_typ)			
			try {
				If Force,buildmany {
					If $DATA(status) {
						Set status.CurrentlyBuilding="Purging Analysis data: "_Namespace_","_typ_","_package
						$$$ThrowOnError(status.%Save())
					}
					Set:$$$ISOK(sc) sc=..DeleteAnalysisCalledByTypeKey1Package(Namespace,typ,package)

					If $DATA(status) {
						Set status.CurrentlyBuilding="Purging Xref data: "_Namespace_","_typ_","_package
						$$$ThrowOnError(status.%Save())
					}
					Set:$$$ISOK(sc) sc=..DeleteCalledByTypeKey1Package(Namespace,typ,package)

					If $DATA(status) {
						Set status.CurrentlyBuilding="Purging LastUpdate data: "_Namespace_","_typ_","_package
						$$$ThrowOnError(status.%Save())
					}
					Set:$$$ISOK(sc) sc=..DeleteLastUpdateCalledByTypeKey1Package(Namespace,typ,package)
					; We have purged the lastupdate table so no need to force now.
					; Which means we could kick off a Force on *, THEN build PXW package on a second process (because we are impatient)
					; Then when the * build gets to PXW it will see that its already been done!
					Set useTheForce=0,noDelete=1
				}
			} catch e {
				set sc=e.AsStatus()
			}
			Lock -^PXWBuild(Namespace_"||"_typ)

			if $$$ISOK(sc) {
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
		}
		
		If $$$ISOK(sc) {
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
						Set bs=..BuildIfNecessary(interface,Namespace,typ,name,timechanged,builderClass,useTheForce,noDelete,DebugBuild)
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
		If $$$ISOK(sc) {
			Set status.CurrentlyBuilding=""
		}
		Set status.Status=sc
		Do status.End()
		$$$ThrowOnError(status.%Save())
	}
	$$$DEBUG("Build:"_Namespace_":"_Type_":"_SearchName_":COMPLETE")
	$$$DEBUGMethodEnd
	Quit sc
}

/// Return 1 if build ok
///        0 if build error
///     null if nothing done
ClassMethod BuildIfNecessary(CodeInterface As PXW.DEV.Dictionary.CodeInterface, Namespace As %String, Type As %String, Name As %String, TimeChanged As %TimeStamp, BuilderClass As %String, Force As %Boolean, NoDelete As %Boolean = 0,DebugBuild as %Boolean=0) As %Boolean [ Internal ]
{
	#dim builder as PXW.Xref.Builder
	$$$DEBUGMethodBegin
	$$$DEBUG("BuildIfNecessary:"_Namespace_":"_Type_":"_Name_", NoDelete="_NoDelete)
	$$$DEBUG("Storage:"_$STORAGE_",%atoms="_$GET(%atoms)) 
	Set savesc=""
	Set built=""
	Set text=""

	; check this is already building so we can skip
	Set locked=1
	Lock +^PXWBuild(Namespace_"||"_Type_"||"_Name):0 Else  Set locked=0
	If 'locked Quit ""

	Try {
		Set builder=$SYSTEM.OBJ.New(BuilderClass)
		Set LastUpdate=##class(PXW.Xref.LastUpdated).OpenOrNew(Namespace,Type,Name)
		If Force || LastUpdate.NeedsUpdate(TimeChanged) {
			Set zh=$ZHOROLOG
			Try {
				Set sc=CodeInterface.Load(Name,.text)
			} Catch e {
				Set sc=e.AsStatus()
			}
			If $$$ISOK(sc) {
				If 'NoDelete {
					Do ..DeleteAnalysisCalledByTypeKey1(Namespace,Type,Name)
					Do ..DeleteCalledByTypeKey1(Namespace,Type,Name)
				}
				If 'DebugBuild $$$DEBUGPause
				Set sc=builder.Build(Namespace,Name,text)
				If 'DebugBuild $$$DEBUGResume
			}
			If $$$ISOK(sc) {
				Do LastUpdate.%SetModified(1) ; because the lastupdate table is cleared via SQL as part of the build so ensure it saves again
				Set LastUpdate.LastUpdate=TimeChanged
				Set LastUpdate.BuildStatus=sc
				Set LastUpdate.BuiltAt=$ZDATETIME($HOROLOG,3)
				Set LastUpdate.CheckedAt=LastUpdate.BuiltAt
				Set LastUpdate.BuildProcessTime=$ZHOROLOG-zh
				$$$DEBUGSC(savesc,LastUpdate.%Save())
				Set built=1
			} Else {
				Do LastUpdate.%SetModified(1)
				Set LastUpdate.LastUpdate=""
				Set LastUpdate.BuildStatus=sc
				Set LastUpdate.CheckedAt=$ZDATETIME($HOROLOG,3)
				Set LastUpdate.BuildProcessTime=$ZHOROLOG-zh
				$$$DEBUGSC(savesc,LastUpdate.%Save())
				Set built=0
				$$$DEBUG("BuildIfNecessary:"_Namespace_":"_Type_":"_Name_":ERROR")
			}
		} Else {
			If 'Force {
				Set built=""
			}
			Set LastUpdate.CheckedAt=$ZDATETIME($HOROLOG,3)
			$$$DEBUGSC(savesc,LastUpdate.%Save())
			Set:$$$ISERR(savesc) built=0
		}
	} Catch e {
		Lock -^PXWBuild(Namespace_"||"_Type_"||"_Name)
		Throw e
	}
	Lock -^PXWBuild(Namespace_"||"_Type_"||"_Name)

	$$$DEBUGMethodEnd
	Quit built
}

/// Stick a call to this somewhere so that it gets called often, it should ensure that a full build is done at least 1 time per day
/// write ##class(PXW.Xref.Build).DailyBuild("LOCAL_USER")
ClassMethod DailyBuild() As %Boolean
{
	Set started=0 
	Set rs=..SelectDailyBuildFunc()
	While rs.%Next() {
		Job ..Build(rs.Namespace,"","*",0)
		Hang 1
		Set started=1
	}
	Quit started
}

/// A list of namespaces where there has not been a build today
Query SelectDailyBuild() As %Library.SQLQuery
{
	SELECT * 
	  FROM (
			SELECT nsp."Name" as Namespace
			,(SELECT MAX(StartDate) FROM PXW_Xref.BuildStatus AS bs WHERE bs.RequestNamespace=nsp.Name) AS StartDate 
			FROM PXW_DEV_Dictionary.Namespace as nsp
	  )
	WHERE (StartDate IS NULL) OR (StartDate<CURRENT_DATE)
}

/// A list of namespaces where there has not been a build today

Query SelectHourlyBuild() as %Library.SQLQuery
{
	SELECT * 
	  FROM (
			SELECT nsp."Name" as Namespace
			,(SELECT MAX(StartDateTime) FROM PXW_Xref.BuildStatus AS bs WHERE bs.RequestNamespace=nsp.Name) AS StartDateTime
			FROM PXW_DEV_Dictionary.Namespace as nsp
	  )
	WHERE (StartDateTime IS NULL) OR (StartDateTime<dateadd(minute,-60,current_timestamp))

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

ClassMethod DeleteAnalysisCalledByTypeKey1Package(NameSpace As %String, ItemType As %String, ItemKey1 As %String) As %Status
{
    $$$DEBUGMethodBegin
	$$$DEBUG("Deleting:"_NameSpace_":"_ItemType_":"_ItemKey1_"*")

	Set jrnsts=$$CURRENT^%NOJRN()
	Do $SYSTEM.SQL.Util.SetOption("AutoCommit",0,.acsts)
	Do DISABLE^%NOJRN
	Set sc=$$$OK
	If $$$ISOK(sc) {
		&SQL(DELETE %NOLOCK FROM PXW_Xref.AnalysisData
			WHERE  (NameSpace=:NameSpace) AND (ItemType=:ItemType) AND (ItemKey1 %STARTSWITH :ItemKey1))
	    If SQLCODE<0 $$$DEBUGSC(sc,$$$ERROR(5001,%msg))
    }
	Do $SYSTEM.SQL.Util.SetOption("AutoCommit",acsts)
	Do:jrnsts ENABLE^%NOJRN
    $$$DEBUGMethodEnd
	Quit sc
}

ClassMethod DeleteAnalysisCalledByTypeKey1(NameSpace As %String, ItemType As %String, ItemKey1 As %String) As %Status
{
    $$$DEBUGMethodBegin
	$$$DEBUG("Deleting:"_NameSpace_":"_ItemType_":"_ItemKey1)
	Set jrnsts=$$CURRENT^%NOJRN()
	Do $SYSTEM.SQL.Util.SetOption("AutoCommit",0,.acsts)
	Do DISABLE^%NOJRN
	Set sc=$$$OK
	If $$$ISOK(sc) {
		&SQL(DELETE %NOLOCK FROM PXW_Xref.AnalysisData
			WHERE (NameSpace=:NameSpace) AND (ItemType=:ItemType) AND (ItemKey1=:ItemKey1))
	    If SQLCODE<0 $$$DEBUGSC(sc,$$$ERROR(5001,%msg))
   	}

	Do $SYSTEM.SQL.Util.SetOption("AutoCommit",acsts)
	Do:jrnsts ENABLE^%NOJRN

    $$$DEBUGMethodEnd
	Quit sc
}

ClassMethod DeleteCalledByTypeKey1Package(NameSpace As %String, CalledByType As %String, CalledByKey1 As %String) As %Status
{
    $$$DEBUGMethodBegin
	$$$DEBUG("Deleting:"_NameSpace_":"_CalledByType_":"_CalledByKey1_"*")
	Set jrnsts=$$CURRENT^%NOJRN()
	Do $SYSTEM.SQL.Util.SetOption("AutoCommit",0,.acsts)
	Do DISABLE^%NOJRN
	Set sc=$$$OK
	If $$$ISOK(sc) {
		&SQL(DELETE %NOLOCK FROM PXW_Xref.Data
			WHERE  NameSpace=:NameSpace AND (CalledByType=:CalledByType) AND (CalledByKey1 %STARTSWITH :CalledByKey1)
			)
	    If SQLCODE<0 $$$DEBUGSC(sc,$$$ERROR(5001,%msg))
    }
	Do $SYSTEM.SQL.Util.SetOption("AutoCommit",acsts)
	Do:jrnsts ENABLE^%NOJRN
    $$$DEBUGMethodEnd
	Quit sc
}

ClassMethod DeleteLastUpdateCalledByTypeKey1Package(NameSpace As %String, CalledByType As %String, CalledByKey1 As %String) As %Status
{
    $$$DEBUGMethodBegin
	$$$DEBUG("Deleting:"_NameSpace_":"_CalledByType_":"_CalledByKey1_"*")
	Set jrnsts=$$CURRENT^%NOJRN()
	Do $SYSTEM.SQL.Util.SetOption("AutoCommit",0,.acsts)
	Do DISABLE^%NOJRN
	Set sc=$$$OK
	If $$$ISOK(sc) {
		&SQL(DELETE %NOLOCK FROM PXW_Xref.LastUpdated
				WHERE NameSpace=:NameSpace 
				 AND (ItemType=:CalledByType) 
				 AND (ItemKey1 %STARTSWITH :CalledByKey1))
   	    If SQLCODE<0 $$$DEBUGSC(sc,$$$ERROR(5001,%msg))

    }
	Do $SYSTEM.SQL.Util.SetOption("AutoCommit",acsts)
	Do:jrnsts ENABLE^%NOJRN
    $$$DEBUGMethodEnd
	Quit sc
}

ClassMethod DeleteCalledByTypeKey1(NameSpace As %String, CalledByType As %String, CalledByKey1 As %String) As %Status
{
    $$$DEBUGMethodBegin
	$$$DEBUG("Deleting:"_NameSpace_":"_CalledByType_":"_CalledByKey1)
	Set jrnsts=$$CURRENT^%NOJRN()
	Do $SYSTEM.SQL.Util.SetOption("AutoCommit",0,.acsts)
	Do DISABLE^%NOJRN
	Set sc=$$$OK
	If $$$ISOK(sc) {
		&SQL(DELETE %NOLOCK FROM PXW_Xref.Data
			WHERE NameSpace=:NameSpace AND CalledByType=:CalledByType AND CalledByKey1=:CalledByKey1)
	    If SQLCODE<0 $$$DEBUGSC(sc,$$$ERROR(5001,%msg))
   	}

	If $$$ISOK(sc) {
		&SQL(DELETE %NOLOCK FROM PXW_Xref.LastUpdated
			WHERE NameSpace=:NameSpace AND ItemType=:CalledByType AND ItemKey1=:CalledByKey1)
	    If SQLCODE<0 $$$DEBUGSC(sc,$$$ERROR(5001,%msg))
    }
	Do $SYSTEM.SQL.Util.SetOption("AutoCommit",acsts)
	Do:jrnsts ENABLE^%NOJRN

    $$$DEBUGMethodEnd
	Quit sc
}



}
