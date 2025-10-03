Class PXW.Xref.Queries [ Owner = {_PUBLIC} ]
{

/// <dl>
/// 		<dt>ItemType</dt><dd>Class, Global, Rtn etc</dd>
/// 		<dt>ItemKey1</dt><dd>Class name ,may be a single string, a comma separated list OR contain wildcard (*), you cannot mix , and *</dd>
/// 		<dt>ItemKey2</dt><dd>Method name, may be a comma separated list</dd>
/// 		<dt>CalledByKey2</dt><dd>Class name, may be a comma separated list</dd>
/// </dl>
/// Flags: string containing the following flags: 
///        EXTERNAL : only list rows where the call is External
Query Get(NameSpace As %String, ItemType As %String = "", ItemKey1 As %String = "", ItemKey2 As %String = "", CalledByCommand As %String = "", CalledByKey1 As %String = "", CalledByKey2 As %String = "", WindowSize As %Integer = 0, Flags As %String = "") As PXW.LIB.SQL.Query [ SqlProc ]
{
	SELECT NameSpace,ItemType,ItemKey1,ItemKey2,
	       CalledByType,CalledByCommand,CalledByKey1,CalledByKey2,CalledByKey3,LineNumber,Parameters,
	       PXW_Xref.Queries_GetCode(NameSpace,CalledByType,CalledByKey1,CalledByKey2,CalledByKey3,ItemKey1,ItemKey2,LineNumber,:WindowSize) AS CallingCode 
	FROM PXW_Xref.Data
	WHERE NameSpace=:NameSpace
	--IF ItemType'=""
		AND ItemType=:ItemType
	--ENDIF 
	--IF ItemKey1'="" 
		--IF ItemKey1["*" 
			AND ItemKey1 LIKE replace(replace(:ItemKey1,'%','\%'),'*','%') ESCAPE '\'
		--ELSEIF ItemKey1[","
			AND ItemKey1 %INLIST $LISTFROMSTRING(:ItemKey1)
		--ELSE
			AND ItemKey1=:ItemKey1
		--ENDIF
	--ENDIF 
	--IF ItemKey2'=""
		--IF ItemKey2["*"
			AND ItemKey2 LIKE replace(replace(:ItemKey2,'%','\%'),'*','%') ESCAPE '\'
		--ELSEIF ItemKey2["," 
			AND ItemKey2 %INLIST $LISTFROMSTRING(:ItemKey2)
		--ELSE 
			AND ItemKey2=:ItemKey2
		--ENDIF
	--ENDIF
	--IF CalledByKey1'=""
		--IF CalledByKey1["*" 
			AND CalledByKey1 LIKE replace(replace(:CalledByKey1,'%','\%'),'*','%') ESCAPE '\'
		--ELSEIF CalledByKey1[","
			AND CalledByKey1 %INLIST $LISTFROMSTRING(:CalledByKey1)
		--ELSE
			AND CalledByKey1=:CalledByKey1
		--ENDIF	
	--ENDIF
	--IF CalledByKey2'=""
		--IF CalledByKey2["*" 
			AND CalledByKey2 LIKE replace(replace(:CalledByKey2,'%','\%'),'*','%') ESCAPE '\'
		--ELSEIF CalledByKey1[","
			AND CalledByKey2 %INLIST $LISTFROMSTRING(:CalledByKey2)
		--ELSE
			AND CalledByKey2=:CalledByKey2
		--ENDIF
	--ENDIF
	--IF CalledByCommand'=""
		AND CalledByCommand=:CalledByCommand
	--ENDIF
	--IF Flags["EXTERNAL" 
		AND CalledByKey1!=ItemKey1
	--ENDIF
		ORDER BY 
		--IF Flags["BY CALLED"
			 CalledByKey1,CalledByKey2,CalledByKey3,
		--ENDIF
		ItemKey1,ItemKey2
}

/// Include all the calls to the same method in the superclasses.
/// EG there may be no direct call to the method you are looking at, but it is called because its an override of a superclass and the superclass method gets called.
/// Could this replace Get query entirely? IE in Get mode GetOverrideTree returns only 1 row... Needs testing.
Query GetSuper(NameSpace As %String, ItemType As %String = "", ItemKey1 As %String = "", ItemKey2 As %String = "", CalledByCommand As %String = "", CalledByKey1 As %String = "", WindowSize As %Integer = 0, Flags As %String = "") As PXW.LIB.SQL.Query [ SqlProc ]
{
	SELECT dat.NameSpace,dat.ItemType,dat.ItemKey1,dat.ItemKey2,
	       dat.CalledByType,dat.CalledByCommand,dat.CalledByKey1,dat.CalledByKey2,dat.CalledByKey3,dat.LineNumber,dat.Parameters,
	       PXW_Xref.Queries_GetCode(dat.NameSpace,dat.CalledByType,dat.CalledByKey1,dat.CalledByKey2,dat.CalledByKey3,dat.ItemKey1,dat.ItemKey2,dat.LineNumber,:WindowSize) AS CallingCode 
	FROM PXW_Xref.Queries_GetOverrideTree(:NameSpace,:ItemKey1,:ItemKey2) as overs
	INNER JOIN PXW_Xref.Data as dat ON dat.NameSpace=%SQLUPPER(overs.NameSpace)
	      AND ((overs.itemkey1 IS NULL) OR (dat.itemkey1=%SQLUPPER(overs.itemkey1)))
		  AND ((overs.itemkey2 IS NULL) OR (dat.itemkey2=%SQLUPPER(overs.itemkey2)))
	WHERE 1=1
	--IF ItemType'=""
		AND dat.ItemType=:ItemType
	--ENDIF 
	--IF CalledByKey1'=""
		--IF $E(CalledByKey1,*)="*" 
			AND dat.CalledByKey1 %STARTSWITH $PIECE(:CalledByKey1,'*',1)
		--ELSE
			AND dat.CalledByKey1 %INLIST $LISTFROMSTRING(:CalledByKey1)
		--ENDIF
	--ENDIF
	--IF CalledByCommand'=""
		AND dat.CalledByCommand=:CalledByCommand
	--ENDIF
	--IF Flags["EXTERNAL" 
		AND dat.CalledByKey1!=dat.ItemKey1
	--ENDIF
		ORDER BY 
		--IF Flags["BY CALLED"
			 dat.CalledByKey1,dat.CalledByKey2,dat.CalledByKey3,
		--ENDIF
		dat.ItemKey1,dat.ItemKey2
}

Query GetCount(NameSpace As %String, ItemType As %String = "", ItemKey1 As %String = "", ItemKey2 As %String = "", CalledByCommand As %String = "") As PXW.LIB.SQL.Query [ SqlProc ]
{
	SELECT COUNT(*) AS Number
	FROM PXW_Xref.Data
	WHERE NameSpace=:NameSpace
	--IF ItemType'=""
		AND ItemType=:ItemType
	--ENDIF
	--IF ItemKey1'=""
		AND ItemKey1=:ItemKey1
	--ENDIF
	--IF ItemKey2'=""
		AND ItemKey2=:ItemKey2
	--ENDIF
	--IF CalledByCommand'=""
		AND CalledByCommand=:CalledByCommand
	--ENDIF
}

ClassMethod GetCount(NameSpace As %String, ItemType As %String = "", ItemKey1 As %String = "", ItemKey2 As %String = "", CalledByCommand As %String = "") As %Integer
{
	/*#dim rs as %SQL.StatementResult*/
		Set count=""
		Set rs=..GetCountFunc(NameSpace,ItemType,ItemKey1,ItemKey2,CalledByCommand)
		If rs.%Next() {
			Set count=+rs.%Get("Number")
		}
		Quit count
}

ClassMethod GetCode(%NS As %String, CodeType As %String, CodeKey1 As %String, CodeKey2 As %String, CodeKey3 As %String, ItemKey1 As %String, ItemKey2 As %String, LineNumber As %Integer, WindowSize As %Integer = 0) As %String [ SqlProc ]
{
	#dim e as %Exception.SystemException

	Set ClassServer=$GET(%PXWClassServer(%NS,CodeType))

	If WindowSize=0 Quit ""
	Set ws=WindowSize-1
	Try {
		If CodeType'="" {
			If '$ISOBJECT(ClassServer) {
				Set ClassServer=##class(PXW.DEV.Dictionary.CodeInterface).OpenForType(%NS,CodeType)
				Set %PXWClassServer(%NS,CodeType)=ClassServer
			}
			If '$DATA(%PXWCacheCode(%NS,CodeType,CodeKey1)) {
				Set sc=ClassServer.LoadAsArray(CodeKey1,.lines)
				If $$$ISOK(sc) {
					Merge %PXWCacheCode(%NS,CodeType,CodeKey1)=lines
				} Else {
					Set %PXWCacheCode(%NS,CodeType,CodeKey1,"ERROR")=$SYSTEM.Status.GetErrorText(sc)
				}
			}
			If '$DATA(%PXWCacheCode(%NS,CodeType,CodeKey1,"ERROR")) {
				Set code="",sep=""
				Set from=LineNumber-ws
				If from<1 Set from=1
				Set to=LineNumber+ws
				If to>%PXWCacheCode(%NS,CodeType,CodeKey1) Set to=%PXWCacheCode(%NS,CodeType,CodeKey1)
				For i=from:1:to Set code=code_sep_%PXWCacheCode(%NS,CodeType,CodeKey1,i),sep=$CHAR(13,10)
			} Else {
				Set code=%PXWCacheCode(%NS,CodeType,CodeKey1,"ERROR")
			}
		}
	} Catch e {
		Set code=e.DisplayString()
	}
	Quit code
}

Query BuildProblems(NameSpace As %String) As PXW.LIB.SQL.Query [ SqlProc ]
{
	SELECT ID, BuildStatus, ItemKey1, ItemType, LastUpdate, NameSpace
	  FROM LastUpdated
	 WHERE NameSpace=:NameSpace
	   AND BuildStatus!=1
}

Query GetOverrideTree(NameSpace As %String, ItemKey1 As %String, ITemKey2 As %String) As %Query(ROWSPEC = "NameSpace:%String,ItemKey1:%String,ItemKey2:%String") [ SqlProc ]
{
}

ClassMethod GetOverrideTreeExecute(ByRef qHandle As %Binary, NameSpace As %String, ItemKey1 As %String, ItemKey2 As %String) As %Status
{
	Kill %PXWTree,%PXWTreeDone
	Set %PXWTree($INCREMENT(%PXWTree))=$LISTBUILD(NameSpace,ItemKey1,ItemKey2) ; include self
	Do gettreerecurse(NameSpace,ItemKey1,ItemKey2)
	Set qHandle=""
	Quit $$$OK
gettreerecurse(NameSpace,ItemKey1,ItemKey2)
	If $DATA(%PXWTreeDone(ItemKey1)) Quit
	
	Set %PXWTreeDone(ItemKey1)=1
	Set rs=..GetOverridesFunc(NameSpace,ItemKey1,ItemKey2)
	While rs.%Next() {
		Set %PXWTree($INCREMENT(%PXWTree))=$LISTBUILD(rs.NameSpace,rs.ItemKey1,rs.ItemKey2)
		Do gettreerecurse(NameSpace,rs.ItemKey1,ItemKey2)	
	}
	Quit
}

ClassMethod GetOverrideTreeClose(ByRef qHandle As %Binary) As %Status [ PlaceAfter = GetOverrideTreeExecute ]
{
	Kill %PXWTree,%PXWTreeDone
	Quit $$$OK
}

ClassMethod GetOverrideTreeFetch(ByRef qHandle As %Binary, ByRef Row As %List, ByRef AtEnd As %Integer = 0) As %Status [ PlaceAfter = GetOverrideTreeExecute ]
{
	Set qHandle=$ORDER(%PXWTree(qHandle),1,Row)
	If qHandle="" {
		Set AtEnd=1
		Set Row=""
	} 
	Quit $$$OK
}

Query GetOverrides(NameSpace As %String, ItemKey1 As %String, ItemKey2 As %String) As PXW.LIB.SQL.Query
{
	SELECT * from PXW_Xref.Data
	WHERE Namespace=:NameSpace
	--IF ItemKey1'=""
		--IF $E(ItemKey1,*)="*" 
			AND CalledByKey1 %STARTSWITH $PIECE(:ItemKey1,'*',1)
		--ELSE
			AND CalledByKey1 %INLIST $LISTFROMSTRING(:ItemKey1)
		--ENDIF
	--ENDIF
	
	--IF ItemKey2'=""
		AND UPPER(CalledByKey2) %INLIST $LISTFROMSTRING(UPPER(:ItemKey2))
	--ENDIF
	
	AND CalledByCommand='_Override'
}

}
