Class PXW.Xref.LastUpdatedDetails [ ClassType = view, Owner = {_PUBLIC}, ViewQuery = { 
	--- This might not be the most efficient query for this job, but good for testing parsing of sql
	WITH xcount AS (
		select "Namespace",CalledByType,CalledByKey1
			,count(*) as XrefCount
		from pxw_xref.data 
		group by CalledByType,CalledByKey1
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
		xd.XrefCount
		FROM pxw_xref.lastupdated as lu
		LEFT OUTER JOIN pxw_dev_dictionary.classdefinitionobject as cdo
			on cdo."namespace"=lu."namespace"
		LEFT OUTER JOIN pxw_dev_dictionary.ateliersettings as atel
			on atel.id=cdo.ateliersettings
		LEFT OUTER JOIN xcount as xd 
			ON xd."namespace"=lu."namespace" and xd.CalledByType=lu.itemtype and xd.CalledByKey1=lu.itemkey1
		
} ]
{

ClassMethod MyFormat(NamespaceName As %String) As %String [ SqlProc ]
{
	q "formatted "_NamespaceName
}

}
