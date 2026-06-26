Class PXW.Xref.LastUpdatedDetails [ ClassType = view, Owner = {_PUBLIC}, ViewQuery = { 
	--- This might not be the most efficient query for this job, but good for testing parsing of sql
	WITH xcount AS (
		select "Namespace",CalledByType,CalledByKey1
			,count(*) as XrefCount
		from pxw_xref.data 
		group by CalledByType,CalledByKey1
	),ycount as (
		select "Namespace",ItemType,ItemKey1
			,count(*) as XrefCount
		from pxw_xref.data 
		group by ItemType,ItemKey1
	)
	SELECT 
		lu.Namespace,
		lu.ItemType,
		lu.ItemKey1,
		lu.BuiltAt,
		lu.LastUpdate as LastUpdateOnServer ,
		atel.ServerAddress,
		atel."Namespace" as ServerNamespace,
		lastupdateddetails_myformat(atel."Namespace") as formattedNs,
		xd.XrefCount as CallsCount,
		yd.XrefCount as UsedCount,
		(
			select count(*)+xd.XrefCount+yd.XrefCount 
				from  pxw_xref.data as xx 
				where xx."namespace"=lu."namespace" and xx.ItemType=lu.itemtype and xx.ItemKey1=lu.itemkey1 and xx.calledbykey1!=xx.itemKey1
		) as RanddomFormula
		FROM pxw_xref.lastupdated as lu
		LEFT OUTER JOIN pxw_dev_dictionary.classdefinitionobject as cdo
			on cdo."namespace"=lu."namespace"
		LEFT OUTER JOIN pxw_dev_dictionary.ateliersettings as atel
			on atel.id=cdo.ateliersettings
		LEFT OUTER JOIN xcount as xd 
			ON xd."namespace"=lu."namespace" and xd.CalledByType=lu.itemtype and xd.CalledByKey1=lu.itemkey1
		LEFT OUTER JOIN ycount as yd 
			ON yd."namespace"=lu."namespace" and yd.ItemType=lu.itemtype and yd.ItemKey1=lu.itemkey1
		
} ]
{

ClassMethod MyFormat(NamespaceName As %String) As %String [ SqlProc ]
{
	q "formatted "_NamespaceName
}

}
