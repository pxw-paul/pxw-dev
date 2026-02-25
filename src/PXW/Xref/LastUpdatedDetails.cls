Class PXW.Xref.LastUpdatedDetails [ ClassType = view, Owner = {_PUBLIC}, ViewQuery = { 
	SELECT 
		lu.Namespace,
		lu.ItemType,
		lu.ItemKey1,
		lu.BuiltAt,
		lu.LastUpdate as LastUpdateOnServer ,
		atel.ServerAddress,
		atel.Namespace as ServerNamespace,
		lastupdateddetails_myformat(atel.Namespace) as formattedNs
		FROM pxw_xref.lastupdated as lu
		LEFT OUTER JOIN pxw_dev_dictionary.classdefinitionobject as cdo
			on cdo.namespace=lu.namespace
		LEFT OUTER JOIN pxw_dev_dictionary.ateliersettings as atel
			on atel.id=cdo.ateliersettings
		
} ]
{

ClassMethod MyFormat(NamespaceName As %String) As %String [ SqlProc ]
{
	q "formatted "_NamespaceName
}

}
