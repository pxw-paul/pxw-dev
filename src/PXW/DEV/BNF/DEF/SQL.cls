Class PXW.DEV.BNF.DEF.SQL Extends PXW.DEV.BNF.Compilers.loader
{

Projection GEN As PXW.DEV.BNF.Compilers.projection(GenerateTo = "PXW.DEV.BNF.GEN.SQL");

Parameter SubElementType = "PXW.DEV.BNF.Elements.SQL";

XData file
{
<bnf>
<data><![CDATA[

sql_program					::= query_specification
								| call_command
								| insert_command
								| update_command
								| declare_command
								| open_command
								| fetch_command
								| close_command
								| delete_command
								| CHECKPRIV_command

query_specification         ::= [with_command ] select_command ( union select_command )*
subquery_specification 		::= select_command ( union select_command )*

with_command 				::= 'WITH' with_clause (',' with_clause)*
with_clause					::= alias_name 'AS' '(' select_command ')' 
 
select_command				::= 'SELECT' [ set_quantifier ] select_list [select_into] [ table_expression ]

set_quantifier              ::= ( ( 'DISTINCT' ['BY' '(' sql_expression ( ',' sql_expression )* ')' ] ) | 'ALL' | ('TOP' sql_expression) | '%NOFPLAN' | '%NOLOCK' | '%NORUNTIME' | ('%PROFILE' ['ALL']) )*
 
select_list                 ::= select_sublist ( ',' select_sublist )*

select_sublist              ::= derived_column | (qualifier  '.' '*')

derived_column              ::= sql_expression [ as_clause ] 

as_clause                   ::= [ 'AS' ] column_name

table_expression            ::= from_clause	[ where_clause ] [ group_by_clause ] [ having_clause ] [ order_by_clause ]

from_clause                 ::= 'FROM' [from_optimise_list] ( table_reference) [ ( ',' table_reference )* ] ( join )*
from_optimise_list			::= from_optimise ( from_optimise )*
from_optimise				::= ('%firsttable' [alias_name])
								| '%ALLINDEX'
								| '%STARTTABLE'
								| '%INORDER'
								| '%FULL'
								| '%NOFLATTEN'
								| '%NOMERGE'
								| '%NOREDUCE'
								| '%NOSVSO'
								| '%NOTOPOPT'
								| '%NOUNIONOROPT'
								| '%PARALLEL'
								| '%NOPARALLEL'
								| ('%IGNOREINDEX' index_reference_list )
								| ('%IGNOREINDICES' index_reference_list )

join 						::= [('INNER' | 'OUTER' | 'LEFT' | 'RIGHT' | 'CROSS' | 'NATURAL' |'FULL' )*] 'JOIN' table_reference [ join_on ]
join_on						::= 'ON' sql_expression 
	
table_reference             ::= stored_proc_table | direct_table | derived_table
direct_table				::= table_name [ table_as_clause ]

table_reference_noalias     ::= direct_table_noalias | derived_table_noalias
direct_table_noalias		::= table_name 

index_reference				::= [ table_reference_noalias '.' ] identifier
index_reference_list		::= index_reference ( ',' index_reference )*


table_as_clause                   ::= [ 'AS' ] alias_name

select_into				  	::= 'INTO' select_into_variable ( ',' select_into_variable)*
select_into_variable		::= [':'] sql_cos_variable /* it appears that on the INTO the : is not required */

derived_table               ::= table_subquery [ table_as_clause ]
derived_table_noalias       ::= table_subquery

table_subquery              ::= subquery

joined_table                ::= cross_join | qualified_join |  ('(' joined_table ')')

cross_join                  ::= table_reference 'CROSS' 'JOIN'  table_reference

qualified_join              ::= table_reference [ 'NATURAL' ] [ join_type ] 'JOIN' table_reference [ join_specification ]

join_type                   ::=	'INNER' |  (outer_join_type [ 'OUTER' ]) 

outer_join_type             ::= 'LEFT' | 'RIGHT' | 'FULL'

join_specification          ::= join_condition | named_columns_join

join_condition              ::= 'ON' sql_expression 

named_columns_join          ::= 'USING' '(' join_column_list ')'

join_column_list            ::= column_name_list

where_clause                ::= 'WHERE' sql_expression 

group_by_clause             ::= 'GROUP' 'BY' grouping_column_reference_list

grouping_column_reference_list ::=	grouping_column_reference  ( ',' grouping_column_reference )* 

grouping_column_reference   ::= sql_expression 

having_clause               ::= 'HAVING' sql_expression

order_by_clause             ::= 'ORDER' 'BY' ordering_column_reference_list

ordering_column_reference_list ::=	ordering_column_reference  ( ',' ordering_column_reference )* 

ordering_column_reference   ::= sql_expression [ 'ASC' | 'DESC']  


union						::= 'UNION' ('ALL' | '%PARALLEL')*

subquery ::= '(' query_expression ')'

query_expression ::= non_join_query_expression | joined_table

non_join_query_expression ::= non_join_query_term

non_join_query_term ::= non_join_query_primary 

non_join_query_primary ::= simple_table | ( '(' non_join_query_expression ')' )

simple_table ::= query_specification
 
column_name_list ::= column_name ( ',' column_name )*

table_name ::=  [ schema_name '.' ] qualified_identifier 

insert_command				::= 'INSERT' (update_keyword)* ['INTO'] direct_table insert_method
insert_method				::= insert_set_list | insert_values_list | insert_multirow
insert_set_list				::= 'SET' insert_set (',' insert_set)*
insert_values_list			::= update_columns 'VALUES' update_values
insert_multirow				::= [ update_columns ] select_command
insert_set					::= column_reference '=' sql_expression

update_command				::= 'UPDATE' (update_keyword)* direct_table ( ('SET' update_set (',' update_set)* ) 
																			 | ( update_columns (('VALUES' update_values) | select_command) )
																		   ) [where_clause]
update_set					::= column_reference '=' sql_expression

update_keyword				::= '%NOCHECK' | '%NOFPLAN' | '%NOINDEX' | '%NOJOURN' | '%NOLOCK' | '%NOTRIGGER' | '%PROFILE_ALL' | '%PROFILE_ALL'

update_columns				::= '(' column_name ( ',' column_name)*  ')'
update_values				::= '(' sql_expression ( ',' sql_expression )* ')'

declare_command 			::= 'DECLARE' cursor_name 'CURSOR' 'FOR' query_specification [ 'FOR' ('UPDATE' | ('READ' 'ONLY'))]
cursor_name					::= identifier

open_command				::= 'OPEN' cursor_name

fetch_command				::= 'FETCH' cursor_name [ select_into ]

close_command				::= 'CLOSE' cursor_name

delete_command              ::= 'DELETE' (update_keyword)* ['FROM'] direct_table [ where_clause ]

CHECKPRIV_command			::= '%CHECKPRIV' checkpriv_objpriv [ '(' column_name ( ',' column_name)* ')' ] 'ON' table_reference
checkpriv_objpriv			::= '%ALTER' | 'DELETE' | 'SELECT' | 'INSERT' | 'UPDATE' | 'EXECUTE' | 'REFERENCES'

call_command				::= 'CALL' stored_proc_call

sql_special_variable					::= 'NULL' | '?' | '$H'  | '$ZNSPACE' | '$NAMESPACE'
										  
/* expression */
sql_expression                       ::= sql_factor ( sql_dyadicop sql_factor )*  /* using star as an expression on its own not strictly correct but good enough?*/
sql_dyadicop                            ::=  "+" | "-" | "\\" | "/" | "<>" | ">=" | ">" | "!>" | "<=" |  "<" | "!<" 
                                        | "=" | "!=" | "**" | "*" | "&&" | "&" | "]]" | "]" | "[" | "'[" | "!" | "||" | "_" | "#" | '\'
										| "AND" | "OR" | "NOT=" 
										| "SIZE" | "ESCAPE" /* size and escape do not really belong here, but I am just using on already valid sql */
										| sql_predicate
										| ("NOT" sql_predicate)
sql_predicate						::= "%STARTSWITH" | "BETWEEN" | "IS" | "IN" | "%INLIST" | "LIKE" | "%PATTERN" | "%MATCHES"

sql_factor                       ::= [ sql_monadicop ] sql_term
sql_monadicop                    ::= "+" | "-" | "NOT" | "%NOINDEX"

sql_term                         ::= sql_primary 
sql_primary                      ::= sql_number
                                          | sql_string
										  | sql_case_expression
										  | sql_fn_function
										  | sql_function
										  | colon_sql_cos_variable
										  | stored_proc_call
										  | column_reference
										  | sql_special_variable
										  | macrocall
										  | ( '(' subquery_specification ')' )
										  | ( '(' sql_expression ( ',' sql_expression )* ')' ) /* for IN ( a,b,c) type expressions (IN is being treated like a +) this may cause more issues but a nice solution for now*/


sql_number								::= 'NEED NUMBER'
sql_string								::= 'NEED STRING'

colon_sql_cos_variable					::= ':' sql_cos_variable
sql_cos_variable						::= 'NEED COS VAR'

macrocall                           ::= '$$$' macro_identifier [ macro_parameter_list | macro_parameter_text ] 
macro_parameter_list                ::= '(' [ [macro_parameter] ( ',' [macro_parameter] )* ] ')'
macro_parameter                     ::= sql_expression 
macro_parameter_text                ::= '(' any_text_upto_close_bracket  ')'
macro_identifier                    ::= identifier /* [ '%' ] 'regexp:[0-9A-Za-z]+' */
any_text_upto_close_bracket         ::= 'code this'

sql_function						::= ('$' identifier '(' [ sql_expression ( ',' sql_expression)* ] ')')
										| ('%exact' sql_expression )
										| ('count' '(' ')' [ sql_window ] ) 
										| ('count' '(' ['distinct' | 'all' ] ('*' | sql_expression) [ '%FOREACH' '(' col_list ')' ] ')' [ sql_window ] ) 
										| ('min' '(' [ ( 'distinct' ['by' '(' col_list ')'] ) | 'all' ] ('*' | sql_expression) [ '%FOREACH' '(' col_list ')' ] ')' [ sql_window ] ) 
										| ('max' '(' [ ( 'distinct' ['by' '(' col_list ')'] ) | 'all' ] ('*' | sql_expression) [ '%FOREACH' '(' col_list ')' ] ')' [ sql_window ] ) 
										| ('sum' '(' [ ( 'distinct' ['by' '(' col_list ')'] ) | 'all' ] ('*' | sql_expression) [ '%FOREACH' '(' col_list ')' ] ')' [ sql_window ] ) 
										| ('avg' '(' [ ( 'distinct' ['by' '(' col_list ')'] ) | 'all' ] ('*' | sql_expression) [ '%FOREACH' '(' col_list ')' ] ')' [ sql_window ] ) 
										| ('cast' '('  sql_expression 'as' identifier ['(' sql_expression ( ',' sql_expression)* ')' ] ')' )
										| ('exists'  '(' subquery_specification ')' )
										| ('list' '(' [ ( 'distinct' ['by' '(' col_list ')'] ) | 'all' ] ('*' | sql_expression) [ '%FOREACH' '(' col_list ')' ] ')') 
										| ('%dlist' '(' [ ( 'distinct' ['by' '(' col_list ')'] ) | 'all' ] ('*' | sql_expression) [ '%FOREACH' '(' col_list ')' ] ')') 
										| ('FOR' 'SOME' '%ELEMENT' '(' sql_expression ')' sql_expression )
										| ('trim' '(' ['leading' | 'trailing' | 'both'] [(sql_expression 'from')] sql_expression  ')'  )
										| ('dateadd' '(' sql_function_datepart_part ',' sql_expression ',' sql_expression ')' )
										| ('datediff' '(' sql_function_datepart_part ',' sql_expression ',' sql_expression ')' )
										| ('datename' '(' sql_function_datepart_part ',' sql_expression ')' )
										| ('datepart' '(' sql_function_datepart_part ',' sql_expression ')' )
                                        | (identifier '(' [ '*' | (sql_expression ( ',' sql_expression)*) ] ')'  [ sql_window ] )
                                        /* need to code some of the functions to decide where * is valid? */

sql_fn_function						::= '{' 'fn' sql_function '}' /* too simple? */
sql_window							::= 'OVER' '(' [ sql_window_partition ] [ order_by_clause ]  [ (sql_window_rows_between | sql_window_rows ) ]  ')'
sql_window_partition 				::= 'PARTITION' 'BY' col_list
sql_window_rows						::= 'ROWS' sql_window_frame
sql_window_rows_between				::= 'ROWS' 'BETWEEN' sql_window_frame 'AND' sql_window_frame
sql_window_frame					::= ('UNBOUNDED' 'PRECEDING') | (sql_expression 'PRECEDING') | ('CURRENT' 'ROW') | ('UNBOUNDED' 'FOLLOWING') | (sql_expression 'FOLLOWING')

sql_function_datepart_part ::= sql_function_datepart_part_word
								| sql_string
								| colon_sql_cos_variable
sql_function_datepart_part_word ::= 'year' | 'yy' | 'yyyy'
									| 'quarter' | 'qq' | 'q'
									| 'month' | 'mm' | 'm'
									| 'week' | 'wk' | 'ww'
									| 'weekday' | 'dw' | 'w'
									| 'dayofyear' | 'dy' | 'y'
									| 'day' | 'dd' | 'd'
									| 'hour' | 'hh' | 'h'
									| 'minute' | 'mi' | 'n'
									| 'second' | 'ss' | 's'
									| 'millisecond' | 'ms'
									| 'sqltimestamp' | 'sts'
									
sql_case_expression					::= 'CASE' ( sql_case_expression1 | sql_case_expression2 ) [ sql_case_else ] sql_case_end
sql_case_expression1				::= sql_case_when  ( sql_case_when )* 
sql_case_expression2				::= sql_expression ( sql_case_when )* 
sql_case_when						::= 'WHEN' sql_expression 'THEN' sql_expression
sql_case_else						::= 'ELSE' sql_expression
sql_case_end						::= 'END'

col_list							::= column_reference ( ',' column_reference )*

column_reference 					::= [ alias_name '.' ] column_name [column_reference_implicit]
column_reference_implicit 			::= ('->' column_name)*

stored_proc_call	::=   stored_proc_name stored_proc_parameter_list
stored_proc_table	::=   stored_proc_name stored_proc_parameter_list [ table_as_clause ]
stored_proc_parameter_list                ::= '(' [ [stored_proc_parameter] ( ',' [stored_proc_parameter] )* ] ')'
stored_proc_parameter                     ::= sql_expression 
stored_proc_name    ::= [ schema_name '.' ] qualified_identifier
qualifier ::= table_name /* | <correlation name> */

number                              ::= ('regexp:[0-9]*' [ '.' 'regexp:[0-9]+'] [ ('e' | 'E') 'regexp:[0-9]+']) | ('.' 'regexp:[0-9]+' [ ('e' | 'E') 'regexp:[0-9]+'])  

schema_name ::= identifier
qualified_identifier ::= identifier
column_name ::= identifier 
alias_name ::= identifier
identifier                    ::= 'regexp:(((\%[a-zA-Z0-9])|(\$[a-zA-Z])|[a-zA-Z])[a-zA-Z0-9\.]*)' 

    ]]></data></bnf>
}

}
