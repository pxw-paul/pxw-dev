Class PXW.Xref.AnalysisQueries Extends %RegisteredObject
{

Query Get(NameSpace As %String, ItemType As %String = "", ItemKey1 As %String = "", ItemKey2 As %String = "", Flags As %String = "") As PXW.LIB.SQLQuery [ SqlProc ]
{
	SELECT NameSpace,ItemType,ItemKey1,ItemKey2,LineNumber,Description
	       --,PXW_Xref.Queries_GetCode(NameSpace,CalledByType,CalledByKey1,CalledByKey2,CalledByKey3,ItemKey1,ItemKey2,LineNumber,:WindowSize) AS CallingCode 
	FROM PXW_Xref.AnalysisData
	WHERE NameSpace=:NameSpace
	--IF ItemType'=""
		AND ItemType=:ItemType
	--ENDIF 
	--IF ItemKey1'="" 
		--IF $E(ItemKey1,*)="*" 
			AND ItemKey1 %STARTSWITH $PIECE(:ItemKey1,'*',1)
		--ELSE
			AND ItemKey1 %INLIST $LISTFROMSTRING(:ItemKey1)
		--ENDIF
	--ENDIF 
	--IF ItemKey2'=""
		--IF ItemKey2["*"
			AND UPPER(ItemKey2) LIKE (UPPER(:ItemKey2))
		--ELSE 
			AND UPPER(ItemKey2) %INLIST $LISTFROMSTRING(UPPER(:ItemKey2))
		--ENDIF
	--ENDIF
		ORDER BY 
    		ItemKey1,ItemKey2
}

}
