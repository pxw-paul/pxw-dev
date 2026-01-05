Class PXW.Tools.Queries [ Owner = {_PUBLIC} ]
{

Query SelectTools() As %SQLQuery [ SqlProc ]
{
   SELECT cls.Name  as ClassName
         ,pdtn._Default as ToolName
         ,pdrt._Default as ToolRelatesToCodeType
    FROM %Dictionary.ClassDefinition_SubclassOf('PXW.Tools.Page') as cls
inner join %Dictionary.MethodDefinition as md on md.parent=cls.name and md.name='HREFTo'
left outer join %Dictionary.ParameterDefinition as pdtn on pdtn.parent=cls.name and pdtn.name='ToolName'
left outer join %Dictionary.ParameterDefinition as pdrt on pdrt.parent=cls.name and pdrt.name='ToolRelatesToCodeType'
}

}
