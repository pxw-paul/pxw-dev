Class PXW.DEV.BNF.DEF.ClassDefinition Extends PXW.DEV.BNF.Compilers.loader
{

Projection GEN As PXW.DEV.BNF.Compilers.projection(GenerateTo = "PXW.DEV.BNF.GEN.ClassDefinition", GenerateToNew = "PXW.DEV.BNF.GEN.ClassDefinitionAuto");

Parameter SubElementType = "PXW.DEV.BNF.Elements.ClassDefinition";

/// Used by the code generator and passed onto the generated code
/// 1 alpha, possibly "/" and more alphas
/// Parameter KeywordPattern = "1.A.1""/"".A";
Parameter KeywordPattern = "1.A.(1""/"".A)";

XData file
{
<bnf>
<data><![CDATA[
    // Uses plugin https://plugins.jetbrains.com/plugin/6606-grammar-kit
// Docs: https://github.com/JetBrains/Grammar-Kit
/**
 * UDL grammar
 */

udl_program                         ::= udl_statement

udl_statement                       ::= ( import_definition | include_generator_definition | include_definition  )*
                                        class_definition

import_definition                   ::= 'import'  ( package_name | ( '(' package_list ')' ) )
include_generator_definition        ::= 'includegenerator'  ( include_list | include_name )
include_definition                  ::= 'include'  ( include_list | include_name )
package_list                        ::= package_name ( ',' package_name )*
package_name                        ::= identifier
include_list                        ::= '(' include_name ( ',' include_name )* ')'
include_name                        ::= identifier

class_item_identifier               ::= string | identifier

class_definition                    ::= 'class' class_name [ 'extends' (  class_reference_list | class_reference  ) ] [class_attributes] class_member_section 
class_name                          ::= class_identifier /* used for defining the name of the class */
class_reference                     ::= class_identifier /* used for referring to a class */
class_reference_list                ::= '(' [class_reference] ( ',' class_reference )* ')' /* oddly there can be items missing from the list! see %ListOfPersistentChildObjects*/
class_attributes                    ::= '[' class_attribute_list ']'
class_attribute_list                ::= class_attribute ( ',' class_attribute )*
class_member_section                ::= '{' class_member_list? '}'
class_member_list                   ::= one_classMember ( one_classMember )*
one_classMember                     ::= class_class_method 
                                        | class_ForeignKey
                                        | class_index
                                        | class_method
                                        | class_property  
                                        | class_parameter 
                                        | class_projection
                                        | class_query
                                        | class_relationship
                                        | class_storage
                                        | class_trigger
                                        /*| class_view*/ 
                                        | class_xdata
                                        | class_client_method

class_projection                    ::= 'projection' projection_name [ class_projection_type ] [ class_property_attributes ] ';'
projection_name                     ::= string | identifier
class_projection_type               ::= 'as'  type_class_reference

return_type_class_reference         ::= class_reference  [ type_parameters ]
type_class_reference                ::= class_reference  [ type_parameters ]
type_parameters                     ::= '(' type_parameters_list ')'
type_parameters_list                ::= type_parameter_item (',' type_parameter_item)*
type_parameter_item                 ::= class_item_identifier '=' ( string | number )

class_property                      ::= 'property' property_name [ class_property_type ] [ class_property_attributes ] ';'
property_name                       ::= class_item_identifier /* used for defining the property */
property_reference                    ::= class_item_identifier /* used when referring to a property */
class_property_type                 ::= ('as' [ ( 'array' | 'list' ) 'of' ] type_class_reference ) | type_parameters /* there can be parameters with no class! */
class_property_attributes           ::= '[' class_property_attribute_list ']'
class_property_attribute_list       ::= class_property_attribute ( ',' class_property_attribute )*
class_property_attribute            ::= attribute_Aliases
                                        | attribute_Calculated
                                        | attribute_Cardinality
                                        | attribute_ClientName
                                        | attribute_Deprecated
                                        | attribute_Final
                                        | attribute_Identity
                                        | attribute_InitialExpression
                                        | attribute_Internal
                                        | attribute_Inverse
                                        | attribute_MultiDimensional
                                        | attribute_OnDelete
                                        | attribute_Private
                                        | attribute_ReadOnly
                                        | attribute_Required
                                        | attribute_ServerOnly
                                        | attribute_SQLColumnNumber
                                        | attribute_SQLComputeCode
                                        | attribute_SQLComputed
                                        | attribute_SQLComputeOnChange
                                        | attribute_SQLFieldname
                                        | attribute_SQLListDelimiter
                                        | attribute_SQLListType
                                        | attribute_Transient
                                        | attribute_Not


class_relationship                  ::= 'relationship' property_name  [ class_property_type ]  class_property_attributes ';'
relationship_attributes             ::= '[' relationship_attribute ( ',' relationship_attribute )* ']'
relationship_attribute             ::= attribute_Cardinality
                                        | attribute_Final
                                        | attribute_Internal
                                        | attribute_Inverse
                                        | attribute_Required
                                        | attribute_SQLFieldname
                                        | attribute_Private
                                        | attribute_OnDelete

class_attribute                     ::= attribute_Abstract
                                        | attribute_ClassType
                                        | attribute_ClientDataType
                                        | attribute_ClientName
                                        | attribute_CompileAfter
                                        | attribute_DDLAllowed
                                        | attribute_DependsOn
                                        | attribute_Deprecated
                                        | attribute_Embeddedclass
                                        | attribute_Final
                                        | attribute_GeneratedBy
                                        | attribute_Hidden
                                        | attribute_Inheritance
                                        | attribute_Language
                                        | attribute_LegacyInstanceContext
                                        | attribute_MemberSuper 
                                        | attribute_NoContext
                                        | attribute_NoExtent
                                        | attribute_Not
                                        | attribute_ODBCType
                                        | attribute_Owner
                                        | attribute_ProcedureBlock
                                        | attribute_PropertyClass
                                        | attribute_ServerOnly
                                        | attribute_SOAPBindingStyle
                                        | attribute_SOAPBodyuse
                                        | attribute_SQLCategory
                                        | attribute_SQLRowidName
                                        | attribute_SQLRowidPrivate
                                        | attribute_SQLTableName
                                        | attribute_StorageStrategy
                                        | attribute_System
                                        | attribute_ViewQuery

attribute_Not                       ::= 'not' ( attribute_Abstract
                                        | attribute_DDLAllowed
                                        | attribute_Deprecated
                                        | attribute_Final
                                        | attribute_Hidden
                                        | attribute_Internal
                                        | attribute_LegacyInstanceContext
                                        | attribute_NoExtent
                                        | attribute_Private
                                        | attribute_ProcedureBlock
                                        | attribute_ReadOnly
                                        | attribute_Required
                                        | attribute_ServerOnly
                                        | attribute_SQLComputed
                                        | attribute_Transient
                                        | attribute_Unique
                                        | attribute_SQLRowidPrivate
                                        )

class_class_method                  ::= 'classmethod' method_name '(' [ formal_spec_list ] ')' [ 'as' return_type_class_reference ] [ method_attribute_list ] '{' method_body '}'
class_method                        ::= 'method' method_name '(' [ formal_spec_list ] ')' [ 'as' return_type_class_reference ] [ method_attribute_list ] '{' method_body '}'
method_name                         ::= class_item_identifier
method_reference                    ::= class_item_identifier
formal_spec_list                    ::= formal_spec_item( ',' formal_spec_item )*
variable                            ::= variable_identifier
variable_set                        ::= variable_identifier

formal_spec_item                    ::= [ formal_spec_mode ] variable_set ['...'] [ as_type_class_reference ] [ parameter_default_value ]
formal_spec_mode                    ::= 'byref' | 'output' | 'byval'
as_type_class_reference             ::= 'as' type_class_reference
method_attribute_list               ::= '[' method_attribute ( ',' method_attribute )* ']'
method_attribute                    ::= attribute_Abstract
                                        | attribute_ClientName
                                        | attribute_CodeMode
                                        | attribute_Deprecated
                                        | attribute_ExternalProcName
                                        | attribute_Final
                                        | attribute_ForceGenerate
                                        | attribute_GenerateAfter
                                        | attribute_Internal
                                        | attribute_Language
                                        | attribute_NoContext
                                        | attribute_NotInheritable
                                        | attribute_PlaceAfter
                                        | attribute_Private
                                        | attribute_ProcedureBlock
                                        | attribute_PublicList
                                        | attribute_ReturnResultSets
                                        | attribute_ServerOnly
                                        | attribute_SOAPAction
                                        | attribute_SOAPBindingStyle
                                        | attribute_SOAPBodyuse
                                        | attribute_SOAPMessageName
                                        | attribute_SOAPNameSpace
                                        | attribute_SOAPRequestMessage
                                        | attribute_SOAPTypeNamespace
                                        | attribute_SQLName
                                        | attribute_SQLProc
                                        | attribute_WebMethod
                                        | attribute_ZenMethod

class_client_method                  ::= 'clientmethod' method_name '(' [ formal_spec_list ] ')' [ 'as' type_class_reference ] [ method_attribute_list ] '{' javascript_code_block '}'

parameter_default_value             ::= '=' ( 'NULL' | parameter_default_simple | parameter_default_expression )
parameter_default_simple            ::= [ '+' ] number | string
parameter_default_expression        ::= '{' expression '}'

method_body                         ::= cos_code_block

class_ForeignKey                    ::= 'foreignkey' foreignkey_name [ '(' key_props ')' ] 'references' class_reference [ '(' [ref_props] ')' ] [ foreignKey_attribute_list ] ';' 
foreignkey_name                     ::= class_item_identifier
key_props                           ::= name_value_pair_list
ref_props                           ::= name_value_pair_list
name_value_pair_list                ::= one_name_value_pair ( ',' one_name_value_pair )*
one_name_value_pair                 ::= class_item_identifier [ '=' expression ]
foreignKey_attribute_list           ::= '[' one_foreignkey_atttribute ( ',' one_foreignkey_atttribute )* ']'
one_foreignkey_atttribute           ::= attribute_Internal
                                        | attribute_NoCheck
                                        | attribute_OnDelete
                                        | attribute_OnUpdate
                                        | attribute_SQLName

class_parameter                     ::= 'parameter' class_parameter_name [ 'as' class_parameter_type ] [ class_parameter_attribute_list ] [ '=' class_parameter_value ] ';'
class_parameter_name                ::= class_item_identifier
class_parameter_type                ::= 'COSEXPRESSION' | 'BOOLEAN' | 'STRING' | 'INTEGER' | 'CONFIGVALUE' | class_reference 
class_parameter_value               ::= string | number | ( '{' expression '}' )
class_parameter_attribute_list      ::= '[' class_parameter_attribute ( ',' class_parameter_attribute )* ']'

class_parameter_attribute           ::=  attribute_Abstract
                                        | attribute_Constraint
                                        | attribute_Final
                                        | attribute_Flags
                                        | attribute_Internal
                                        | attribute_Deprecated
                                        | attribute_Encoded

class_storage                       ::= 'storage' storage_name '{' storage_xml '}'
storage_name                        ::= class_item_identifier
storage_xml                         ::= (xml_data)*
 
/* a good idea at the time, but ended up being WAY too complex. It may be better to leave it as xml and deal with it by the caller */
storage_xml_complex                         ::= ( storage_xml_data 
                                            | storage_xml_data_location 
                                            | storage_xml_default_data 
                                            | storage_xml_description
                                            | storage_xml_extent_location
                                            | storage_xml_extent_size 
                                            | storage_xml_id_function 
                                            | storage_xml_id_location 
                                            | storage_xml_index_location 
                                            | storage_xml_index 
                                            | storage_xml_stream_location 
                                            | storage_xml_state 
                                            | storage_xml_type 
                                            | storage_xml_property 
                                            | storage_xml_sqlmap 
                                            | storage_xml_counterlocation
                                        )*

storage_xml_data                    ::= xml_tag_s_a 'Data' 'name' '=' string ( xml_tag_s_c | (xml_tag_s_b (storage_xml_dataelement)* xml_tag_e_a 'Data' xml_tag_e_b) )
storage_xml_dataelement             ::= storage_xml_attribute
                                        | storage_xml_structure
                                        | storage_xml_subscript
                                        | storage_xml_data_position
                                        | storage_xml_data_piece
                                        | storage_xml_data_node
                                        | storage_xml_data_delimiter
                                        | storage_xml_data_retrieval_code  
                                        
storage_xml_description             ::= xml_tag_s_a 'Description' xml_tag_s_b (xml_cdata | xml_content) xml_tag_e_a 'Description' xml_tag_e_b
storage_xml_attribute               ::=	xml_tag_s_a 'Attribute' xml_tag_s_b identifier xml_tag_e_a 'Attribute' xml_tag_e_b
storage_xml_structure               ::=	xml_tag_s_a 'Structure' xml_tag_s_b ( 'subnode' | 'node') xml_tag_e_a 'Structure' xml_tag_e_b
storage_xml_subscript               ::= xml_tag_s_a 'Subscript' xml_tag_s_b (string | number) xml_tag_e_a 'Subscript' xml_tag_e_b
storage_xml_data_position           ::= xml_tag_s_a 'Value' 'name' '=' string xml_tag_s_b (storage_xml_data_position_field)* xml_tag_e_a 'Value' xml_tag_e_b
storage_xml_data_position_field     ::= xml_tag_s_a 'Value' xml_tag_s_b (identifier) xml_tag_e_a 'Value' xml_tag_e_b
storage_xml_data_location           ::= xml_tag_s_a 'DataLocation'xml_tag_s_b (expression | ('{%%PARENT}' ['(' string ')'])) xml_tag_e_a 'DataLocation' xml_tag_e_b
storage_xml_data_piece              ::= xml_tag_s_a 'Piece' xml_tag_s_b number [ ',' number ] xml_tag_e_a 'Piece' xml_tag_e_b
storage_xml_data_delimiter          ::= xml_tag_s_a 'Delimiter' xml_tag_s_b cos_expression_storage xml_tag_e_a 'Delimiter' xml_tag_e_b
storage_xml_data_node               ::= xml_tag_s_a 'Node' xml_tag_s_b (number | string) xml_tag_e_a 'Node' xml_tag_e_b
storage_xml_data_retrieval_code     ::= xml_tag_s_a 'RetrievalCode' xml_tag_s_b cos_code_block_storage xml_tag_e_a 'RetrievalCode' xml_tag_e_b
storage_xml_default_data            ::=	xml_tag_s_a 'DefaultData' xml_tag_s_b cos_expression_storage xml_tag_e_a 'DefaultData' xml_tag_e_b
storage_xml_extent_location         ::= xml_tag_s_a 'ExtentLocation' xml_tag_s_b global xml_tag_e_a 'ExtentLocation' xml_tag_e_b
storage_xml_extent_size	            ::= xml_tag_s_a 'ExtentSize' xml_tag_s_b number xml_tag_e_a 'ExtentSize' xml_tag_e_b
storage_xml_id_function             ::= xml_tag_s_a 'IdFunction' xml_tag_s_b ( 'sequence' )xml_tag_e_a 'IdFunction' xml_tag_e_b
storage_xml_id_location             ::= xml_tag_s_a 'IdLocation' xml_tag_s_b  (   ('{%%PARENT}' ['(' string ')']) |    (expression [ '(' string ')' ]) ) xml_tag_e_a 'IdLocation' xml_tag_e_b
storage_xml_global                  ::= xml_tag_s_a 'Global' xml_tag_s_b global xml_tag_e_a 'Global' xml_tag_e_b
storage_xml_index_location          ::=	xml_tag_s_a 'IndexLocation' xml_tag_s_b expression xml_tag_e_a 'IndexLocation' xml_tag_e_b
storage_xml_stream_location         ::= xml_tag_s_a 'StreamLocation' xml_tag_s_b expression xml_tag_e_a 'StreamLocation' xml_tag_e_b
storage_xml_state                   ::=	xml_tag_s_a 'State' xml_tag_s_b identifier xml_tag_e_a 'State' xml_tag_e_b
storage_xml_type                    ::=	xml_tag_s_a 'Type' xml_tag_s_b class_reference xml_tag_e_a 'Type' xml_tag_e_b
storage_xml_counterlocation         ::= xml_tag_s_a 'CounterLocation' xml_tag_s_b global xml_tag_e_a 'CounterLocation' xml_tag_e_b
storage_xml_index                   ::= xml_tag_s_a 'Index' 'name' '=' string xml_tag_s_b (storage_xml_index_sublocation)* xml_tag_e_a 'Index' xml_tag_e_b
storage_xml_index_sublocation       ::= xml_tag_s_a 'Location' xml_tag_s_b (expression)xml_tag_e_a 'Location' xml_tag_e_b


storage_xml_property                ::= storage_xml_property_empty | storage_xml_property_full
storage_xml_property_empty          ::= xml_tag_s_a 'Property' 'name' '=' string xml_tag_s_b (storage_xml_property_selectivity | storage_xml_property_outlier_selectivity | storage_xml_property_fieldsize | storage_xml_property_histogram)* xml_tag_e_a 'Property' xml_tag_e_b
storage_xml_property_full            ::= xml_tag_s_a 'Property' 'name' '=' string xml_tag_s_c
storage_xml_property_selectivity    ::= xml_tag_s_a 'Selectivity' xml_tag_s_b number ['%'] xml_tag_e_a 'Selectivity' xml_tag_e_b
storage_xml_property_outlier_selectivity    ::= xml_tag_s_a 'OutlierSelectivity' xml_tag_s_b number ':' number xml_tag_e_a 'OutlierSelectivity' xml_tag_e_b
storage_xml_property_fieldsize      ::= xml_tag_s_a 'AverageFieldSize' xml_tag_s_b number xml_tag_e_a 'AverageFieldSize' xml_tag_e_b
storage_xml_property_histogram      ::= xml_tag_s_a 'Histogram' xml_tag_s_b expression xml_tag_e_a 'Histogram' xml_tag_e_b
storage_xml_sqlmap                  ::= xml_tag_s_a 'SQLMap' 'name' '=' string xml_tag_s_b (storage_xml_sqlmap_blockcount 
                                                                                            | storage_xml_data 
                                                                                            | storage_xml_global
                                                                                            | storage_xml_sqlmap_condition
                                                                                            | storage_xml_sqlmap_population
                                                                                            | storage_xml_sqlmap_type
                                                                                            | storage_xml_sqlmap_structure
                                                                                            | storage_xml_sqlmap_subscript
                                                                                            | storage_xml_sqlmap_rowidspec )* xml_tag_e_a 'SQLMap' xml_tag_e_b
storage_xml_sqlmap_blockcount       ::= xml_tag_s_a 'BlockCount' xml_tag_s_b number xml_tag_e_a 'BlockCount' xml_tag_e_b
storage_xml_sqlmap_condition        ::= xml_tag_s_a 'Condition' xml_tag_s_b cos_expression_storage xml_tag_e_a 'Condition' xml_tag_e_b
storage_xml_sqlmap_population       ::= xml_tag_s_a 'PopulationType' xml_tag_s_b identifier xml_tag_e_a 'PopulationType' xml_tag_e_b
storage_xml_sqlmap_type             ::= xml_tag_s_a 'Type' xml_tag_s_b identifier xml_tag_e_a 'Type' xml_tag_e_b
storage_xml_sqlmap_structure        ::= xml_tag_s_a 'Structure' xml_tag_s_b identifier xml_tag_e_a 'Structure' xml_tag_e_b
storage_xml_sqlmap_subscript        ::= xml_tag_s_a 'Subscript' 'name' '=' string xml_tag_s_b (storage_xml_sqlmap_sub_expression 
                                                                                                | storage_xml_sqlmap_sub_accessvar 
                                                                                                | storage_xml_sqlmap_sub_accesstype
                                                                                                | storage_xml_sqlmap_sub_invcond 
                                                                                                | storage_xml_data_delimiter
                                                                                                | storage_xml_sqlmap_sub_loopinitval
                                                                                                | storage_xml_sqlmap_sub_dataaccess
                                                                                                | storage_xml_sqlmap_sub_next_code
                                                                                                )* xml_tag_e_a 'Subscript' xml_tag_e_b
storage_xml_sqlmap_sub_accesstype   ::= xml_tag_s_a 'AccessType' xml_tag_s_b identifier xml_tag_e_a 'AccessType' xml_tag_e_b
storage_xml_sqlmap_sub_dataaccess   ::= xml_tag_s_a 'DataAccess' xml_tag_s_b cos_expression_storage xml_tag_e_a 'DataAccess' xml_tag_e_b
storage_xml_sqlmap_sub_expression   ::= xml_tag_s_a 'Expression' xml_tag_s_b cos_expression_storage xml_tag_e_a 'Expression' xml_tag_e_b
storage_xml_sqlmap_sub_invcond      ::= xml_tag_s_a 'InvalidCondition' 'name' '=' string xml_tag_s_b storage_xml_sqlmap_sub_expression xml_tag_e_a 'Invalidcondition' xml_tag_e_b
storage_xml_sqlmap_sub_accessvar    ::= xml_tag_s_a 'Accessvar' 'name' '=' string xml_tag_s_b (storage_xml_sqlmap_sub_code storage_xml_sqlmap_sub_variable)   xml_tag_e_a 'Accessvar' xml_tag_e_b
storage_xml_sqlmap_sub_loopinitval  ::= xml_tag_s_a 'LoopInitValue' xml_tag_s_b cos_expression_storage xml_tag_e_a 'LoopInitValue' xml_tag_e_b
storage_xml_sqlmap_sub_code         ::= xml_tag_s_a 'Code' xml_tag_s_b cos_code_block_storage xml_tag_e_a 'Code' xml_tag_e_b
storage_xml_sqlmap_sub_variable     ::= xml_tag_s_a 'Variable' xml_tag_s_b cos_expression_storage xml_tag_e_a 'Variable' xml_tag_e_b
storage_xml_sqlmap_sub_next_code    ::= xml_tag_s_a 'NextCode' xml_tag_s_b cos_code_block_storage xml_tag_e_a 'NextCode' xml_tag_e_b

storage_xml_sqlmap_rowidspec        ::= xml_tag_s_a 'RowIdSpec' 'name' '=' string xml_tag_s_b (storage_xml_sqlmap_row_expression | storage_xml_sqlmap_row_field)* xml_tag_e_a 'RowIdSpec' xml_tag_e_b
storage_xml_sqlmap_row_expression   ::= xml_tag_s_a 'Expression' xml_tag_s_b cos_expression_storage xml_tag_e_a 'Expression' xml_tag_e_b
storage_xml_sqlmap_row_field        ::= xml_tag_s_a 'Field' xml_tag_s_b identifier xml_tag_e_a 'Field' xml_tag_e_b

global                              ::= cos_expression_sql /* '^' identifier [ '(' string ')' ] */

xml_tag_s_a                         ::= '<'
xml_tag_s_b                         ::= '>'
xml_tag_s_c                         ::= '/>'
xml_tag_e_a                         ::= '</'
xml_tag_e_b                         ::= '>'


text_brace_block                    ::= '{' text '}'

class_query                         ::= 'query' query_name '(' [ formal_spec_list ] ')' [ 'as' type_class_reference ] [ class_query_attributes ] '{' class_query_body '}'
query_name                          ::= class_item_identifier
class_query_body                    ::= text_brace_block
class_query_attributes              ::= '[' class_query_attribute ( ',' class_query_attribute )* ']'
class_query_attribute               ::= attribute_ClientName
                                        | attribute_Deprecated
                                        | attribute_Final
                                        | attribute_Internal
                                        | attribute_Private
                                        | attribute_SOAPBindingStyle
                                        | attribute_SOAPBodyuse
                                        | attribute_SOAPNameSpace
                                        | attribute_SQLName
                                        | attribute_SQLProc
                                        | attribute_SQLView
                                        | attribute_SQLViewname
                                        | attribute_WebMethod


class_xdata                         ::= 'xdata' xdata_name [xdata_attributes  ] '{' (xdata_text | xdata_xml | xdata_json )   /* ([xml_xml] [xml_data] [xdata_json] */ '}'
xdata_name                          ::= class_item_identifier
xdata_attributes                    ::=  '[' xdata_attribute (',' xdata_attribute)* ']'
xdata_attribute                    ::= attribute_Internal
                                        | attribute_MimeType
                                        | attribute_SchemaSpec
                                        | attribute_XMLNamespace
xdata_xml                      ::= [xml_xml] xml_data
xdata_text                         ::= text 

xml_data                            ::= xml_cdata | ( xml_start_tag ( xml_data | xml_content)* xml_end_tag) | xml_empty_tag
xml_start_tag                       ::= xml_tag_s_a xml_tag_ns_name (xml_attribute)* xml_tag_s_b 
xml_end_tag                         ::= xml_tag_e_a xml_tag_ns_name xml_tag_e_b
xml_empty_tag                       ::= xml_tag_s_a xml_tag_ns_name (xml_attribute)* xml_tag_s_c 
xml_tag_ns_name                     ::= [ xml_schema ':'] xml_tag_name
xml_schema                          ::= xml_identifier
xml_tag_name                        ::= xml_identifier
xml_attribute                       ::= [ xml_schema ':' ] xml_attribute_name '=' xml_attribute_value
xml_attribute_name                  ::= xml_identifier
xml_attribute_value                 ::= string | number
xml_content                         ::= text 
xml_identifier                      ::= 'regexp:(\_|[a-zA-Z])[a-zA-Z0-9]\-\_\.*' /* _ or A followed by AN_.- */
xml_xml                             ::= xml_tag_s_a '?xml' (xml_attribute)* '?' xml_tag_s_b

xml_cdata                           ::= '<' '!' '[CDATA[' xml_cdata_text ']]' '>' /* special tag so not using xml_tag_s_a etc  and also spacing out as this is already stored in XML!*/
xml_cdata_text                      ::= 'NEED XML CDATA TEXT THAT READS UP TO END OF CDATA'

xdata_json                            ::= xdata_json_object | xdata_json_array | xdata_json_prim
xdata_json_object                     ::= '{' [ xdata_json_pair ( ',' xdata_json_pair )*] '}'
xdata_json_pair                       ::= json_string ':' xdata_json
xdata_json_prim                       ::= number | json_string | 'true' | 'false' | 'null' /* | ( '(' expression ')' ) */
xdata_json_array                      ::= '[' [ xdata_json_array_items ] ']'
xdata_json_array_items              ::= xdata_json (',' xdata_json)* 

json_string                         ::= 'NEED JSON STRING'

class_trigger                       ::= 'trigger' trigger_name [ trigger_attribute_list ] '{' [ trigger_code_block ] '}'
trigger_name                        ::= class_item_identifier
trigger_attribute_list              ::= '[' trigger_attribute ( ',' trigger_attribute )* ']'
trigger_attribute                   ::= attribute_CodeMode
                                        | attribute_Event
                                        | attribute_Final
                                        | attribute_ForEach
                                        | attribute_Internal
                                        | attribute_Language
                                        | attribute_NewTable
                                        | attribute_OldTable
                                        | attribute_Order
                                        | attribute_SQLName
                                        | attribute_Time
                                        | attribute_UpdateColumnList
trigger_code_block                  ::= cos_code_block_trigger


class_index                         ::= 'index' index_name [ 'on' index_property_expression_list ] [ index_attributes ] [ 'as' type_class_reference ]';'
index_name                          ::= class_item_identifier
index_property_expression_list      ::= index_property | index_property_list
index_property_list                 ::= '(' index_property ( ',' index_property )* ')'
index_property                      ::= fieldname ['(ELEMENTS)' | '(KEYS)' ] [ 'as' collation_type]
fieldname                           ::= property_reference
collation_type                      ::= 'exact' | 'mvr' | 'sqlstring' | ('sqlupper' [ '(' number ')' ] )| 'truncate' | 'plus' | 'minus' | 'alphaup' | 'string' | 'upper' | 'space'
index_attributes                    ::= '[' index_attribute ( ',' index_attribute )* ']'
index_attribute                     ::= attribute_Condition
                                        | attribute_Data
                                        | attribute_Extent
                                        | attribute_IdKey
                                        | attribute_Internal
                                        | attribute_PrimaryKey
                                        | attribute_SQLName
                                        | attribute_Type
                                        | attribute_Unique
                                        
/*
 * UDL attributes
 */
attribute_Abstract                  ::= 'abstract'

attribute_Aliases                   ::= 'aliases' '=' '{'  attribute_AliasList '}'
attribute_AliasList                 ::= attribute_OneAlias ( ',' attribute_OneAlias )*
attribute_OneAlias                  ::= alias_identifier

attribute_Calculated                ::= 'calculated'

attribute_Cardinality               ::= 'cardinality' '=' attribute_Cardinality_type
attribute_Cardinality_type          ::= 'one' | 'many' | 'parent' | 'children'

attribute_ClassType                 ::= 'classtype' '=' class_type_name
class_type_name                     ::= 'datatype' | 'persistent' | 'serial' | 'stream' | 'view' | 'index' | 'donotuse' | 'dynamic' | '""'

attribute_ClientDataType            ::= 'clientdatatype' '=' client_data_type_name
client_data_type_name               ::= 'bigint' | 'binary' | 'binarystream' | 'boolean' | 'characterstream' | 'currency' | 'date' | 'decimal' | 'double' | 'fdate' | 'ftimestamp'
                                        | 'handle' | 'integer' | 'list' | 'longvarchar' | 'numeric' | 'status' |  'timestamp' | 'time' |  'varchar' | 'MVDATE'

attribute_ClientName                ::= 'clientname' '=' attribute_ClientName_value
attribute_ClientName_value          ::= client_identifier        /* text is all charss to next , ] space tab or eol */

attribute_CodeMode                  ::= 'codemode' '=' attribute_CodeModeType
attribute_CodeModeType              ::= 'call' | 'code' | 'expression' | 'objectgenerator' | 'generator'

attribute_Condition                 ::= 'condition' '=' '{' expression '}'

attribute_Constraint                ::= 'constraint' '=' (number | string | identifier)

attribute_CompileAfter              ::= 'compileafter' '=' [class_reference_list | class_reference]  /* compileafter=, (nothing) is ok - odd */

attribute_Data                      ::= 'data' '=' ( one_data_attribute_value | (  '('  one_data_attribute_value ( ',' one_data_attribute_value )* ')'  ) )
one_data_attribute_value            ::= property_reference ['(ELEMENTS)' | '(KEYS)' ]

attribute_Deprecated                ::= 'deprecated'

attribute_DDLAllowed                ::= 'ddlallowed'

attribute_DependsOn                 ::= 'dependson' '=' (  class_reference_list | class_reference )

attribute_EmbeddedClass             ::= 'EmbeddedClass' '=' class_reference

attribute_Encoded                   ::= 'Encoded'

attribute_Event                     ::= 'event' '=' event_keyword
event_keyword                       ::= 'insert/update/delete' | 'insert/update' | 'insert/delete' | 'update/delete' | 'delete' | 'insert' | 'update' 

attribute_Extent                    ::= 'extent'

attribute_ExternalProcName          ::= 'externalprocname' '=' text // text is any character except ],\\\r\n \t()'"

attribute_Final                     ::= 'final'

attribute_Flags                     ::= 'flags' '=' ( 'enumedit' | 'enum' | 'list' )

attribute_ForceGenerate             ::= 'forcegenerate'

attribute_ForEach                   ::= 'foreach' '=' foreach_type
foreach_type                        ::= 'row' | 'row/object' | 'statement'

attribute_GenerateAfter             ::= 'generateafter' '=' ( method_reference | ( '(' method_reference ( ',' method_reference )* ')' ) )

attribute_GeneratedBy               ::= 'generatedby' '=' (class_reference | string | filename)

attribute_Hidden                    ::= 'hidden'

attribute_Identity                  ::= 'identity'

attribute_IdKey                     ::= 'idkey'

attribute_Internal                  ::= 'internal'

attribute_InitialExpression         ::= 'initialexpression' '=' initialexpression_value
initialexpression_value             ::= initial_expression_complex | initial_expression_simple
initial_expression_simple           ::= string | number
initial_expression_complex          ::= '{' expression '}'

attribute_Inheritance               ::= 'inheritance' '=' inheritance_direction
inheritance_direction               ::= 'left' | 'right'

attribute_Inverse                   ::= 'inverse' '=' identifier

attribute_Language                  ::= 'language' '=' class_language_name
class_language_name                 ::= 'cache' | 'basic' |  'javascript' | 'java' | 'mvbasic' | 'tsql' | 'cpp' | 'objectscript' | 'python' 

attribute_LegacyInstanceContext     ::= 'legacyinstancecontext'

attribute_MemberSuper               ::= 'MemberSuper' '=' ( ( '(' class_reference ( ',' class_reference )*')' ) | class_reference )

attribute_MimeType                  ::= 'mimetype' '=' identifier ('/' identifier)* /*mime_type*/
mime_type                           ::= 'regex:[a-zA-Z][a-zA-Z0-9]*\/[a-zA-Z][a-zA-Z0-9]*'

attribute_MultiDimensional          ::= 'multidimensional'

attribute_NewTable                  ::= 'newtable' '=' tablename
tablename                           ::= identifier

attribute_NoCheck                   ::= 'nocheck'

attribute_NoContext                  ::= 'nocontext'

attribute_NoExtent                  ::= 'noextent'

attribute_NotInheritable            ::= 'notinheritable'

attribute_OnDelete                  ::= 'ondelete' '=' attribute_OnAction_type
attribute_OnAction_type             ::= 'cascade' | 'noaction' | 'setdefault' | 'setnull'

attribute_OnUpdate                  ::= 'onupdate' '=' attribute_OnAction_type

attribute_ODBCType                  ::= 'odbctype' '=' ( 'bigint' | 'bit' | 'date' | 'double' | 'integer' | 'longvarbinary'
                                        | 'longvarchar' | 'numeric' | 'resultset' | 'smallint' | 'struct' | 'time'
                                        | 'timestamp' | 'tinyint' | 'varbinary' | 'varchar' | 'guid' | 'POSIXTIME')

attribute_OldTable                  ::= 'oldtable' '=' tablename

attribute_Order                     ::= 'order' '=' expression

attribute_Owner                     ::= 'owner' '=' ( string | number | '{' text_in_curly '}' ) /* Text is any char except space tab
}
*/

attribute_PlaceAfter                ::= 'placeafter' '=' method_reference ('(' ',' method_reference ')')* 

attribute_PrimaryKey                ::= 'primarykey'

attribute_Private                   ::= 'private'

attribute_ProcedureBlock            ::= 'procedureblock' [ '=' ( '0' | '1' ) ]

attribute_PropertyClass             ::= 'propertyclass' '=' class_reference ('(' ',' class_reference ')')* 

attribute_PublicList                ::= 'publiclist' '=' ( ('(' identifier (',' identifier )* ')' )  | identifier)

attribute_ReadOnly                  ::= 'readonly'

attribute_Required                  ::= 'required'

attribute_ReturnResultSets          ::= 'returnresultsets'

attribute_SchemaSpec                ::= 'schemaspec' '=' string

attribute_ServerOnly                ::= 'serveronly' '=' ( '0' | '1' )

attribute_SOAPAction                ::= 'soapaction' '=' (identifier | string)

attribute_SOAPBindingStyle          ::= 'SoapBindingStyle' '=' ( 'document' | 'rcp' )

attribute_SOAPBodyuse               ::= 'soapbodyuse' '=' ( 'literal' | 'encoded' )

attribute_SOAPMessageName           ::= 'soapmessagename' '=' ( string | soap_identifier ) 

attribute_SOAPNameSpace             ::= 'soapnamespace' '=' ( string | soap_identifier)

attribute_SOAPRequestMessage        ::= 'soaprequestmessage' '=' ( string | soap_identifier  )

attribute_SOAPTypeNamespace         ::= 'soaptypenamespace' '=' ( string | soap_identifier ) 

attribute_SQLCategory               ::= 'sqlcategory' '=' ( 'date' | 'double' | 'fmdate' | 'fmtimestamp' | 'integer' | 'mvdate' | 'name' | 'numeric' | 'string' | 'time' | 'timestamp' | 'POSIXTS' | 'VECTOR' )

attribute_SQLColumnNumber           ::= 'SqlColumnNumber' '=' number

attribute_SQLComputeCode            ::= 'sqlcomputecode' '=' '{'  cos_code_block_sql '}'

attribute_SQLComputed               ::= 'sqlcomputed'

attribute_SQLComputeOnChange        ::= 'sqlcomputeonchange' '=' property_reference  | ('('  property_reference (',' property_reference )* ')')

attribute_SQLFieldname              ::= 'sqlfieldname' '=' sql_field_name
sql_field_name                        ::= text /* any valid sql field name character */

attribute_SQLListDelimiter          ::= 'sqllistdelimiter' '=' expression

attribute_SQLListType               ::= 'sqllisttype' '=' ( 'list' | 'delimited' | 'subnode' )

attribute_SQLName                   ::= 'sqlname' '=' (sql_table_name | string  ) // text is any valid XML element name up to the next ' ] or whitespace

attribute_SQLProc                   ::= 'sqlproc'

attribute_SQLRowidName              ::= 'sqlrowidname' '=' ( '""' | string | sql_table_name ) // text is any valid XML element name up to the next ' ] or whitespace

attribute_SQLRowidPrivate           ::= 'sqlrowidprivate'

attribute_SQLTableName              ::= 'sqltablename' '=' ( '""' | sql_table_name )
sql_table_name                      ::= 'NEEDS SQL TABLE NAME'

attribute_SQLView                   ::= 'sqlview'

attribute_SQLViewname               ::= 'sqlviewname' '=' ( string | sql_table_name ) // text is any valid XML element name up to the next ' ] or whitespace

attribute_StorageStrategy           ::= 'storagestrategy' '=' ('""' | class_item_identifier)

attribute_System                    ::= 'system' '=' ( '0' | '1' | '2' | '3' | '4' )

attribute_Time                      ::= 'time' '=' time_value
time_value                          ::= 'after' | 'before'

attribute_Transient                 ::= 'transient'

attribute_Type                      ::= 'type' '=' ( 'bitmap' | 'bitslice' | 'index' |'key' | 'collatedkey' )

attribute_Unique                    ::= 'unique'

attribute_UpdateColumnList          ::= 'updatecolumnlist' '=' ( one_column_name | ( '('  one_column_name ( ',' one_column_name )* ')' ) )
one_column_name                     ::= string | text // Test continues to first break character

attribute_ViewQuery                 ::= 'viewquery' '=' '{' class_query_body '}' // Text ends at the next unbalanced }
attribute_WebMethod                 ::= 'webmethod'

attribute_XMLNamespace              ::= 'xmlnamespace' '=' (string | identifier)

attribute_ZenMethod                 ::= 'zenmethod'

number                              ::= ['-'] ('regexp:[0-9]*' [ '.' 'regexp:[0-9]+'] [ ('e' | 'E') 'regexp:[0-9]+']) | ('.' 'regexp:[0-9]+' [ ('e' | 'E') 'regexp:[0-9]+'])  

string                              ::= '""' | ('"' 'regexp:[^\"\r\n]*' '"')

alias_identifier                    ::= 'NEED ALIAS IDENT'
identifier                          ::= 'regexp:(\%|[a-zA-Z])[a-zA-Z0-9]*' /* % or A followed by AN* */
variable_identifier                 ::= 'regexp:(\%|[a-zA-Z])[a-zA-Z0-9]*' /* % or A followed by AN* */

class_identifier                    ::= 'regexp:(\%|[a-zA-Z])[a-zA-Z0-9\.]*' /* % or A followed by AN* */
soap_identifier                     ::= identifier

text                                ::= 'regexp:.*'
text_in_curly                       ::= 'NEEDS TEXT IN CURLY'

client_identifier                   ::= 'regexp:(\%|\_|[a-zA-Z])[a-zA-Z0-9]\_\.*' /* _ or A followed by AN_.- */
expression                          ::= 'NEEDS EXPRESSION'
cos_expression_sql                  ::= 'NEEDS COS EXPRESSION SQL'

cos_code_block                      ::= 'NEEDS COS CODE BLOCK'
cos_code_block_sql                  ::= 'NEEDS COS SQL CODE BLOCK'
cos_code_block_sql_storage          ::= 'NEEDS COS SQL CODE BLOCK'
cos_code_block_trigger              ::= 'NEEDS COS SQL CODE BLOCK'
javascript_code_block                      ::= 'NEEDS JS CODE BLOCK'
filename                            ::= 'NEEDS FILE NAME'

cos_expression_storage              ::= ('<!' '[CDATA[' cos_expression_sql ']]' '>') | cos_expression_sql
cos_code_block_storage              ::= ('<!' '[CDATA[' cos_code_block_sql_storage ']]' '>') | cos_code_block_sql_storage


    ]]> 

    </data></bnf>
}

}
