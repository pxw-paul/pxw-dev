Class PXW.Tools.Queries [ Owner = {_PUBLIC} ]
{

Query SelectNsTypes(Namespace As %String = "") As PXW.LIB.SQL.Query [ SqlProc ]
{
    SELECT ns.Name
           ,ns.Description
           ,(select LIST(ci.Type) FROM PXW_DEV_Dictionary.CodeInterface as ci WHERE ci.Namespace=ns.Name) as Types
    FROM PXW_DEV_Dictionary.Namespace as ns
    WHERE 1=1 
    --IF Namespace'=""
        AND ns.Name=:Namespace    
    --ENDIF
}

Query SelectToolsForNamespace(NamespaceName As %String = "") As %SQLQuery [ SqlProc ]
{
   SELECT cls.Name  AS ClassName
         ,pdtn._Default AS ToolName
         ,pdtt._Default AS ToolType
         ,pdrt._Default AS ToolRelatesToCodeType
    FROM %Dictionary.ClassDefinition_SubclassOf('PXW.Tools.Page') AS cls
    INNER JOIN %Dictionary.MethodDefinition AS md ON md.parent=cls.name AND md.name='HREFTo'
    LEFT OUTER JOIN %Dictionary.ParameterDefinition AS pdtn ON pdtn.parent=cls.name AND pdtn.name='ToolName'
    LEFT OUTER JOIN %Dictionary.ParameterDefinition AS pdtt ON pdtt.parent=cls.name AND pdtt.name='ToolType'
    LEFT OUTER JOIN %Dictionary.ParameterDefinition AS pdrt ON pdrt.parent=cls.name AND pdrt.name='ToolRelatesToCodeType'
    WHERE ((pdrt._Default IS NULL)
            OR (pdrt._Default IN (SELECT ci.Type FROM PXW_DEV_Dictionary.CodeInterface AS ci WHERE ci.Namespace=:NamespaceName)))
}

}
