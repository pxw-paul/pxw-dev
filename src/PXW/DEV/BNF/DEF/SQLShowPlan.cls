Class PXW.DEV.BNF.DEF.SQLShowPlan Extends PXW.DEV.BNF.Compilers.loader
{

Projection GEN As PXW.DEV.BNF.Compilers.projection(GenerateTo = "PXW.DEV.BNF.GEN.SQLShowPlan", GenerateToNew = "PXW.DEV.BNF.GEN.SQLShowPlan");

Parameter SubElementType = "PXW.DEV.BNF.Element";

/// Used by the code generator and passed onto the generated code
/// 1 alpha, possibly "/" and more alphas
/// Parameter KeywordPattern = "1.A.1""/"".A";
Parameter KeywordPattern = "1.A";

XData file
{
<bnf>
<data><![CDATA[

plans           ::= '<plans>' (!'</plans>' content)* '</plans>'

plan            ::= '<plan>' (!'</plan>' content)* '</plan>'
sql_section     ::= '<sql>' (!'</sql>' content)* '</sql>'
warning_section ::= '<warning>' (!'</warning>' content)* '</warning>'

subquery_section ::= '<subquery' attribute* '>' (!'</subquery>' content)* '</subquery>'
module_section   ::= '<module' attribute* '>' (!'</module>' content)* '</module>'
cost_section     ::= '<cost' attribute* '/>' 
frozen_section   ::= '<frozenPlan' attribute* '/>'
info_section     ::= '<info' attribute* '>' (!'</info>' content)* '</info>'

attribute  ::= identifier '=' STRING

content ::= newline
            | plan 
            | sql_section
            | warning_section
            | cost_section
            | frozen_section
            | info_section
            | for_each
            | subquery_section
            | module_section
            | read_index 
            | read_bitmap_index 
            | read_extent_bitmap
            | read_master_scan
            | read_master 
            | call_modules
            | call_module
            | call_subqueries
            | call_subquery
            | alias_property
            /* word and punctuation must be last */
            | word 
            | punctuation

/* THIS IS A HACK BECAUSE LINES ARE IMPORTANT IN PLANS
   SO MAKE SURE NEWLINE IS CHECKED IN THE RIGHT PLACES
   IF THERE IS AN INFINITE LOOP IS PROBABLY BECAUSE 
   NEWLINE HAS NOT BEEN CHECKED ENOUGH                  
*/
newline ::= "<NEWLINE>"

/* for each will stop at the outdent*/
for_each            ::= 'for' 'each' (word)* ':' for_each_content
for_each_content    ::= newline INDENT (!OUTDENT [ content ] )* 

read_index          ::= 'index' 'map' table_index 

read_bitmap_index   ::= 'bitmap' 'index' table_index 

read_extent_bitmap  ::= 'extent' 'bitmap' table_index 

read_master         ::= 'read' 'master' 'map' table_index
read_master_scan    ::= 'read' 'master' 'map' table_index ',' 'looping' 'on' 'ID'

call_module         ::= 'module' module_name
call_modules        ::= 'modules' module_name ( ',' ['and'] module_name )* ['and' module_name]

call_subquery       ::= 'subquery' subquery_name
call_subqueries     ::= 'subqueries' subquery_name ( ',' ['and'] subquery_name )* ['and' subquery_name]

table_index           ::=  schema_name '.'  table_name [ table_subscript_imply | table_subscript_alias ] '.' index_name
table_subscript_imply ::= '(' schema_name '.' table_name '.' (property_name '->')* ')'
table_subscript_alias ::= '(' alias_name ['.' ( property_name '->')* ] ')'

alias_property      ::= alias_name NOSPACE '.' NOSPACE property_name


alias_name      ::= IDENTIFIER
word            ::= WORD_REGEX
punctuation     ::= PUNCTUATION_REGEX
schema_name    ::= IDENTIFIER
table_name     ::= IDENTIFIER
index_name     ::= IDENTIFIER
property_name  ::= IDENTIFIER
module_name    ::= MODULE_IDENTIFIER
subquery_name  ::= MODULE_IDENTIFIER 

NOSPACE           ::= 'CODE THIS TO ENSURE NO SPACE'
INDENT            ::= 'CODE THIS TAKE NOTE OF CURRENT INDENT' 
OUTDENT           ::= 'CODE THIS TAKE NOTE OF CURRENT INDENT' 
STRING            ::= 'CODE THIS'
IDENTIFIER        ::= 'regexp:(\$|\%|[a-zA-Z])[a-zA-Z0-9\_]*'
MODULE_IDENTIFIER ::= 'regexp:(\%|[a-zA-Z0-9])[a-zA-Z0-9\_]*'
WORD_REGEX        ::= 'regexp:[\w]+' /* any word char includes underscore (odd) */
WORD_REGEX_old        ::= 'regexp:(\%|[a-zA-Z])[a-zA-Z0-9]*'
PUNCTUATION_REGEX ::= 'regexp:[^\w\s]']]> 

    </data></bnf>
}

}
