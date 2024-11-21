Class PXW.DEV.BNF.DEF.CSP Extends PXW.DEV.BNF.Compilers.loader
{

Projection GEN As PXW.DEV.BNF.Compilers.projection(GenerateTo = "PXW.DEV.BNF.GEN.CSP");

XData file
{
<data><![CDATA[
  
csp_tag_s_a                         ::= '<'
csp_tag_s_b                         ::= '>' 
csp_tag_s_c                         ::= '/>'
csp_tag_e_a                         ::= '</'
csp_tag_e_b                         ::= '>'

csp_page                            ::= (csp_xml | csp_element | csp_end_tag | csp_content )*      /* <tag> or </tag> could be the START! in a &html */
/* mandatory page is where we KNOW there is some code to parse so if this returns 0 elements there is a problem to recover */
csp_page_mandatory                  ::= (csp_xml | csp_element | csp_end_tag | csp_content )+      /* + means there must be one or more */


csp_element                         ::= csp_special_tag | (csp_start_tag ( csp_element | csp_content)* [csp_end_tag]) | csp_empty_tag /* end tag is optional  */
csp_start_tag                       ::= csp_tag_s_a csp_tag_ns_name (csp_attribute )* csp_tag_s_b                    /* <tag attributes> */
csp_end_tag                         ::= csp_tag_e_a csp_tag_ns_name csp_tag_e_b
csp_empty_tag                       ::= csp_tag_s_a csp_tag_ns_name (csp_attribute )* csp_tag_s_c 
csp_tag_ns_name                     ::= [ csp_schema ':'] csp_tag_name
csp_schema                          ::= csp_identifier | cos_expression 
csp_tag_name                        ::= csp_identifier | cos_expression 
csp_attribute                       ::= ( [ csp_schema ':' ] csp_identifier ['=' ( string | ( number ['%'] ) | ( js_expression ';') | cos_expression | ('#' [text_no_space] ) | csp_identifier | text_no_space) ] )  | cos_expression /* # needed for href=# */
csp_content                         ::= text
csp_identifier                      ::= identifier
csp_xml                             ::= csp_tag_s_a '?xml' ['-' 'stylesheet'] (csp_attribute)* '?' csp_tag_s_b


csp_special_tag                     ::= csp_doctype | csp_javascript | csp_javascript_text | csp_javascript_both | csp_javascript_bothopp | csp_javascript_by_default | cos_expression 

csp_doctype                         ::= '<!DOCTYPE' csp_attribute ['PUBLIC' string string]'>'

csp_javascript                      ::= csp_tag_s_a 'script' 'language' '=' ('javascript' | '"javascript"' | "'javascript'" ) csp_tag_s_b  javascript_body csp_tag_e_a 'script' csp_tag_e_b  /* <script language="javascript"> */
csp_javascript_text                 ::= csp_tag_s_a 'script' 'type' '=' ('"text/javascript"') csp_tag_s_b  javascript_body csp_tag_e_a 'script' csp_tag_e_b 
csp_javascript_both                 ::= csp_tag_s_a 'script' 'language' '=' ('javascript' | '"javascript"' | "'javascript'") 'type' '=' ('"text/javascript"') csp_tag_s_b  javascript_body csp_tag_e_a 'script' csp_tag_e_b 
csp_javascript_bothopp              ::= csp_tag_s_a 'script' 'type' '=' ('"text/javascript"') 'language' '=' ('javascript' | '"javascript"' | "'javascript'" ) csp_tag_s_b  javascript_body csp_tag_e_a 'script' csp_tag_e_b 
csp_javascript_by_default           ::= csp_tag_s_a 'script' csp_tag_s_b  javascript_body csp_tag_e_a 'script' csp_tag_e_b 

javascript_body                     ::= 'NEEDS JS BODY'
js_expression                       ::= 'NEEDS JS EXPRESSION'
cos_expression                      ::= cos_expression_compiletime | cos_expression_runtime | cos_expression_other
cos_expression_compiletime          ::= '##(' cos_expression_body ')##'
cos_expression_runtime              ::= '#(' cos_expression_body ')#'
cos_expression_other                ::= '<%=' cos_expression_body '%>'
cos_expression_body                 ::= 'NEEDS COS EXPRESSION BODY' 

string                              ::= 'NEEDS STRING'
number                              ::= 'NEEDS NUMBER'
text                                ::= 'NEEDS TEXT'
identifier                          ::= 'NEEDS IDENTIFIER'
text_no_space                       ::= 'NEEDS TEXT'

    ]]>

    </data>
}

}
