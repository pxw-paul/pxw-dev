Class PXW.DEV.BNF.DEF.COS Extends PXW.DEV.BNF.Compilers.loader
{

Projection GEN As PXW.DEV.BNF.Compilers.projection(GenerateTo = "PXW.DEV.BNF.GEN.COS", GenerateToNew = "PXW.DEV.BNF.GEN.COSnew");

Parameter SubElementType = "PXW.DEV.BNF.Elements.COS";

/// Used by the code generator and passed onto the generated code.
/// The check is done lots of times to keep building up a word until the test fails.
/// 
/// For COS this should really take into account $piece,##class etc but its not working properly.
/// I think to make this work it need the bnf rearranged a bit, which is too much for this evening. 
Parameter KeywordPattern = "1A.AN";

XData file
{
<bnf>
<data><![CDATA[
 
/*
 * COS grammar
 */ 

open_bracket                        ::= '('  /* this is a special check that should NOT remove whitespace so things like $p(x,a,2) works and $p (x,a,2) is a fail */
close_bracket                       ::= ')'

cos_code_block                      ::= one_cos_statement ( one_cos_statement )*
cos_code_block_sql                  ::= one_cos_Statement_sql ( one_cos_statement_sql)*
cos_code_block_sql_storage          ::= one_cos_Statement_sql ( one_cos_statement_sql)*
cos_code_block_trigger              ::= one_cos_statement ( one_cos_statement )*

/* this looks like it allows multiple labels per line but it has been overridden to deal with this properly, 
  this is really just a template definition */
one_cos_statement                   ::= [ label_definition ] ('.')* cos_command_or_macro
one_cos_statement_sql               ::= ('.')* cos_command_or_macro  /* in SQLCompute mode line labels are not allowed, and variables can be {*} or {field} */

label_definition                    ::= label_identifier [ label_formal_specification ] [ label_scope ] [ '{' [cos_code_block] '}']
label_formal_specification          ::= '(' [ label-formal-param-list ]  ')'
label-formal-param-list             ::= label-one-formal-param ( ',' label-one-formal-param )* ['...']
label-one-formal-param              ::= [ '&' ] label-param-name [ label-param-default-value ]
label-param-default-value           ::= '=' expression
label-param-name                    ::= variable_set /*identifier*/
label_scope                         ::= ( [ label_public_vars ] 'public' | 'private' | 'methodimpl'  )
label_public_vars                   ::= '[' label_public_vars_list? ']'
label_public_vars_list              ::= variable ( ',' variable )* 

label_reference                     ::= (( label_identifier  | simple_indirection ) [ '^' [routine_env] ( routine_identifier  | simple_indirection) ])  /* lab^rouine */
                                        | ('^' [routine_env] (routine_identifier | simple_indirection) ) /* ^routine -- no label */
label_identifier                    ::= [ '%' ] 'regexp:[0-9A-Za-z]+'
routine_identifier                  ::= 'regexp:(\%|[a-zA-Z])[a-zA-Z0-9]*' /* % or A followed by AN* */
routine_env                         ::= '|' [ expression ] '|' 
cos_directive                       ::= '#' ( cos_directive_define
                                        | cos_directive_dim
                                        | cos_directive_ifdef
                                        | cos_directive_ifndef
                                        | cos_directive_if
                                        | cos_directive_else
                                        | cos_directive_elseif
                                        | cos_directive_endif 
                                        | cos_directive_defonearg
                                        | cos_directive_include
                                        | cos_directive_undef
                                        | cos_directive_execute
                                        | cos_directive_sqlcompile
                                        | cos_directive_classcontext
                                        | cos_directive_generator
                                        | cos_directive_classmethod
                                        )

cos_directive_defonearg             ::= 'def1arg' cos_directive_define_name [ array_parameter_list ] [cos_directive_define_subst] /* text_to_eol_continue */
cos_directive_define                ::= 'define' cos_directive_define_name [ array_parameter_list ] [cos_directive_define_subst]  /*[ text_to_eol_continue]*/
cos_directive_define_name           ::= macro_identifier
cos_directive_define_subst          ::= [ command_list_eol_continue | expression_list ] text_to_eol_continue 
cos_directive_define_subst_old      ::= [command_list_eol | expression_list ] text_to_eol_continue 
cos_directive_dim                   ::= 'dim' cos_directive_dim_item (',' cos_directive_dim_item )* /*Studio and VSCode do not allow multiple dims on one line, but the compiler does not complain (unless there is an =) and some intersystems code has it! %Installer.Invoke  */
cos_directive_dim_item              ::= variable_set [(',' variable_set )*] [ 'as' [('array' | 'list') 'of'] class_reference ] [ '=' dim_expression ] 
cos_directive_else                  ::= 'else'
cos_directive_elseif                ::= 'elseif' expression
cos_directive_endif                 ::= 'endif'
cos_directive_execute               ::= 'execute' command_list_eol
cos_directive_if                    ::= 'if' expression 
cos_directive_ifdef                 ::= 'ifdef' macro_identifier 
cos_directive_ifndef                ::= 'ifndef' macro_identifier 
cos_directive_include               ::= 'include' (cos_directive_include_list | cos_directive_include_name)
cos_directive_sqlcompile            ::= 'sqlcompile' ( 
                                            ( 'select' '=' ('display' | 'logical' | 'odbc' | 'runtime' | 'text' | 'FDBMS') )
                                            | ( 'mode' '=' ('deferred') ) )
cos_directive_undef                 ::= 'undef' macro_identifier 

cos_directive_include_list          ::= '(' cos_directive_include_name ( ',' cos_directive_include_name )* ')'
cos_directive_include_name          ::= include_identifier
/* only seen these in MACs */
cos_directive_classcontext          ::= 'classcontext' class_reference
cos_directive_generator             ::= 'generator'
cos_directive_classmethod           ::= 'classmethod' object_member_identifier

include_identifier                  ::= 'regexp:(\%|[a-zA-Z])[a-zA-Z0-9\.]*'

dim_expression                      ::= expression

class_identifier                    ::= 'regexp:(\%|[a-zA-Z])[a-zA-Z0-9\.]*)' 

cos_command_or_macro                ::= cos_command | macrocall
cos_command                         ::=  set_command
                                         | if_command
                                         | quit_command
                                         | do_command
                                         | for_command
                                         | kill_command
                                         | break_command
                                         | continue_command
                                         | goto_command
                                         | else_command
                                         | hang_command /* hang must come before halt */
                                         | halt_command
                                         | job_command
                                         | sql_command
                                         | js_command
                                         | lock_command
                                         | merge_command
                                         | new_command
                                         | open_command
                                         | close_command
                                         | return_command
                                         | read_command
                                         | tcommit_command
                                         | throw_command
                                         | trollback_command
                                         | try_command
                                         | tstart_command
                                         | use_command
                                         | view_command
                                         | while_command
                                         | write_command
                                         | xecute_command
                                         /*| macrocall*/
                                         | cos_directive
                                         | zallocate_command
                                         | zbreak_command
                                         | zdeallocate_command
                                         | zinsert_command
                                         | zkill_command
                                         | zload_command
                                         | znspace_command
                                         | zprint_command
                                         | zquit_command
                                         | zremove_command
                                         | zsave_command
                                         | zsync_command
                                         | ztrap_command
                                         | zwrite_command
                                         | zzdump_command
                                         | zzwrite_command
                                         | html_command
                                         | print_command
                                         | mpv_command
                                         | ZZ_COMMAND

command_list                        ::= cos_command ( cos_command )*
command_list_eol                    ::= cos_command_or_macro ( cos_command_or_macro )* /* needs to stop at end of line */
/* continue version is only called from macro definition (rename?) so does not worry about macros too much */
command_list_eol_continue           ::= cos_command ( cos_command )* /* needs to stop at end of line and look for ##continue*/

comment                             ::= line_comment
                                        | block_comment

line_comment                        ::= ';' text_to_eol
                                         | '//' text_to_eol
                                         | '#;' text_to_eol
                                         | '##;' text_to_eol
block_comment                       ::= '/*' text '*/'

text_to_eol                         ::= 'regexp:[^\r\n]*'
text_to_eol_continue                 ::= 'regexp:[^\r\n]*' 

text                                ::= 'regexp:.*'

expression                          ::= factor ( pattern_match | (dyadicop factor ))*

factor                              ::= ( monadicop )* primary /* can be any number of +- or ' */
monadicop                           ::= "+" | "-" | "'" | "~" /* not sure what ~ is but its used in bitlogic */

/* THIS HAS BEEN HAND CODED IN THE RUN CLASS 
    COULD THE OPTIMISATION DONE THERE BE DONE AUTOMATICALLY?
*/
dyadicop                            ::= "+" 
                                          | "-" 
                                          | "\\" 
                                          | "/" | "\"
                                          | ">=" | ">" 
                                          | "'>=" | "'>" 
                                          | "<="  | "<" 
                                          | "'<=" | "'<" 
                                          | "=" 
                                          | "'=" 
                                          | "**" 
                                          | "*" 
                                          | "&&" 
                                          | "']]" | "]]" | "']" | "]"
                                          | "'["  | "["
                                          | "!" 
                                          | "||" 
                                          | "_" 
                                          | hash_op
                                          | amp_op

hash_op                             ::= '#' /* HASH is a special case and needs coding */
amp_op                              ::= '&' /* & is a special case and needs coding */

term                                ::= primary 

pattern_match                       ::= ( "?" | "'?" ) (pattern_match_combo )*
pattern_match_combo                 ::=  pattern_match_repeat ( pattern_match_code | pattern_match_alternating  ) 
pattern_match_alternating           ::= '(' ( pattern_match_combo ( ',' pattern_match_combo )*  )')'
pattern_match_repeat                ::= ('regexp:[0-9]*' [ '.' [ 'regexp:[0-9]*' ] ]) | ('.' ['regexp:[0-9]*'])
pattern_match_code                  ::= 'a' | 'c' | 'e' | 'l' | 'n' | 'p' | 'u' | 'b' | 'm' 
                                        | 'ZFWCHARZ' | 'ZHWKATAZ' 
                                        | string


macrocall                           ::= '$$$' macro_identifier [ macro_parameter_list | macro_parameter_text ] [ macro_parameter_list ]  [ object_chain ] /* PXW $$mac(1,2)(3,4) is valid, also calling .property etc is possible */
macro_parameter_list                ::= '(' [ [macro_parameter] ( ',' [macro_parameter] )* ] ')'
macro_parameter                     ::= ('.' variable_set ) | expression 
macro_parameter_text                ::= '(' any_text_upto_close_bracket  ')'
macro_identifier                    ::= [ '%' ] 'regexp:[0-9A-Za-z]+'
any_text_upto_close_bracket         ::= 'code this'

extrinsicfncall                     ::= '$$' label_reference  [extrinsicfncall_parameter_list ]
extrinsicfncall_parameter_list                ::= open_bracket [ [extrinsicfncall_parameter] ( ',' [extrinsicfncall_parameter] )* ] ['...'] close_bracket
extrinsicfncall_parameter                     ::= ('.' (this_object_direct_property | simple_indirection | variable )) | expression 

intrinsicfncall                     ::= '$' (special_intrinsic | general_intrinsic )
special_intrinsic                   ::= case_function_call
                                        | select_function_call
                                        | extract_function_call
                                        | piece_function_call
                                        | order_function_call
                                        | listitem_function_call
                                        | listupdate_function_call
                                        | increment_function_call
                                        | method_function_call
                                        | classmethod_function_call
                                        | zobjmethod_function_call
                                        | zobjclassmethod_function_call
                                        | text_function_call
                                        | query_function_call
                                        | bitlogic_function_call  
                                        | vector_function_call
general_intrinsic                   ::= any_keyword function_parameter_list  [ object_chain ]


intrinsicfncall_parameter_list      ::= open_bracket [expression] ( ',' [expression]  )*  close_bracket
intrinsicfncall_parameter           ::= expression

function_parameter_list             ::= open_bracket [ function_parameter? ( ',' function_parameter? )* ] ['...'] close_bracket
function_parameter_list_items       ::= [ function_parameter? ( ',' function_parameter? )* ] ['...']
function_parameter                  ::= ( '.' ( this_object_direct_property | simple_indirection | byref_variable )) | expression | empty_parameter
byref_variable                      ::= variable_set /* maybe set_value_expression would be better, but requires more careful check on analysis */
empty_parameter                     ::= 'SPECIAL'

intrinsicfncall_set                 ::= '$' (special_intrinsic_set | general_intrinsic_set )
special_intrinsic_set               ::= extract_function_call_set
                                        | piece_function_call_set
                                        | listitem_function_call_set
                                        | listbuild_function_call_set
                                        | vector_function_call_set
                                        | mv_function_set
general_intrinsic_set               ::= any_keyword function_parameter_list  [ object_chain ]
 

parameter_list                      ::= '(' [ parameter_values ] ')'
parameter_values                    ::= one_parameter_value ( ',' [ one_parameter_value ] )*
one_parameter_value                 ::= ( [ '.' ] variable ) | ( variable '...' ) | expression

macro_expression                    ::= expression_function_call | safeexpression_function_call

classexpr                           ::= super_expression | class_expression
super_expression                    ::= '##super' function_parameter_list
class_expression                    ::= '##class' '('  class_reference  ')' [ class_casting ] object_chain 
class_casting                       ::= ['(' ] ( '##this' | '$this' | variable_identifier ) [')'] 
class_reference                     ::= class_identifier

this_object                         ::= this_object_self | this_object_this
this_object_set                     ::= this_object_self | this_object_this
this_object_self                    ::= ('..' | 'i%' | 'r%' | 'm%' | 's%') [object_chain_no_dot] 
this_object_this                    ::= ('$this' | '##this') [ object_chain]
this_object_direct_property         ::= 'i%' object_chain_item  

system_object                       ::='$system.' object_chain_item [ object_chain ]

object_variable                     ::= variable_identifier [ array_parameter_list ] object_chain 

Indirection                         ::= Subscript_Indirection | Simple_Indirection 
Simple_Indirection                  ::= '@' term
Subscript_Indirection               ::= '@' term '@'  subscript_parameter_list 
subscript_parameter_list                ::= '(' expression ( ',' expression )*  ')'

global_ref_set                       ::= global_ref_naked | global_ref_full
global_ref                           ::= global_ref_macro | global_ref_special | global_ref_naked | global_ref_full 
global_ref_full                      ::= '^' [ global_ref_env  | global_ref_env_two ] (macrocall |  global_name ) [subscript_parameter_list]
global_ref_special                   ::= '^$' [ global_ref_env  | global_ref_env_two ] (macrocall |  global_name ) [subscript_parameter_list]
global_ref_macro                     ::= '^' macrocall [subscript_parameter_list]
global_ref_naked                     ::= '^' subscript_parameter_list
global_ref_env                       ::= '|' [ expression ] '|' 
global_ref_env_two                   ::= '[' primary [ ',' primary ] ']' /* for now we use primary, expression uses [] which confuse the expression (where ] is a valid operator) */
global_name                         ::= global_identifier

primary                             ::= number
                                          | string
                                          | macrocall
                                          | macro_expression /* not sure "primary" is the right place for this but we are not validating, just trying to make sense */
                                          | this_object
                                          | extrinsicfncall /* PXW $$lab() */
                                          | intrinsicfncall /* PXW $function() */
                                          | classexpr
                                          | variable
                                          | special_variable /* $h etc */
                                          | Indirection
                                          | global_ref
                                          | ( sub_expression [ object_chain ] ) /* a brackeded expression can return an object (x).prop */
                                          | (cos_json [ object_chain ])

sub_expression                      ::= '(' expression ')' 

special_variable                    ::= '$' ('DEVICE' -- Contains user-specified device status information.
                                          | 'ECODE' -- Contains the current error code string.
                                          | 'EC'
                                          | 'ESTACK' -- Contains the number of context frames saved on the call stack from a user-defined point.
                                          | 'ES'
                                          | 'ETRAP' -- Contains a string of ObjectScript commands to be executed when an error occurs.
                                          | 'ET'
                                          | 'HALT' -- Contains a halt trap routine call.
                                          | 'HOROLOG' -- Contains the local date and time for the current process.
                                          | 'H' -- Contains the local date and time for the current process.
                                          | 'IO' -- Contains the ID of the current input/output device.
                                          | 'I'
                                          | 'JOB' -- Contains the ID of the current process.
                                          | 'J' -- Contains the ID of the current process.
                                          | 'KEY' -- Contains the terminator character from the most recent READ.
                                          | 'MNV' -- no idea what this is
                                          | 'NAMESPACE' -- Contains the namespace for the current stack level.
                                          | 'PRINCIPAL' -- Contains the ID of the principal I/O device.
                                          | 'P'
                                          | 'QUIT' -- Contains a flag indicating what kind of QUIT is required to exit the current context.
                                          | 'Q'
                                          | 'ROLES' -- Contains the roles assigned to the current process.
                                          | 'STACK' -- Special variable that contains the number of context frames saved on the call stack.
                                          | 'STORAGE' -- Contains the number of bytes available for local variable storage.
                                          | python_import
                                          | ('SYSTEM' [ object_chain ])  -- Contains system information about system objects.
                                          | 'SY'
                                          | 'S' -- storage
                                          | 'TEST' -- Contains the truth value resulting from the last command using the timeout option.
                                          /*| ('THIS' [ object_chain ] )  -- Contains the current class context.*/
                                          | 'THIS'
                                          | 'THROWOBJ' -- Contains the OREF from an unsuccessful THROW.
                                          | 'TLEVEL' -- Contains the current nesting level for transaction processing.
                                          | 'Tl'
                                          | 'T' -- test 
                                          | 'USERNAME' -- Contains the username for the current process.
                                          | 'X' -- Contains the current horizontal position of the cursor.
                                          | 'Y' -- Contains the current vertical position of the cursor.
                                          | 'ZA' -- Contains the status of the last READ on the current device.
                                          | 'ZB' -- Contains status information for the current I/O device.
                                          | 'ZCHILD' -- Contains the ID of the last child process.
                                          | 'ZEOF' -- Contains flag indicating whether end-of-file has been reached.
                                          | 'ZEOS' -- Contains end-of-stream status when reading a compressed stream.
                                          | 'ZERROR' -- Contains the name and location of the last error.
                                          | 'ZE' -- Contains the name and location of the last error.
                                          | 'ZHOROLOG' -- Contains the number of seconds elapsed since InterSystems IRIS startup.
                                          | 'ZH' -- Contains the number of seconds elapsed since InterSystems IRIS startup.
                                          | 'ZIO' -- Contains information about the current terminal I/O device.
                                          | 'ZJOB' -- Contains job status information.
                                          | 'ZMODE' -- Contains current I/O device OPEN parameters.
                                          | 'ZNAME' -- Special variable that contains the current routine name.
                                          | 'ZNSPACE' -- Contains the current namespace name.
                                          | 'ZN'
                                          | 'ZORDER' -- Contains the value of the next global node.
                                          | 'ZPARENT' -- Contains the ID of the parent process of the current process.
                                          | 'ZPI' -- Contains the value of pi.
                                          | 'ZPOS' -- Contains the current file position during the reading of a sequential file.
                                          | 'ZREFERENCE' -- Contains the current global reference.
                                          | 'ZR'
                                          | 'ZSTORAGE' -- Contains the maximum available memory for a process.
                                          | 'ZS' -- Contains the maximum available memory for a process.
                                          | 'ZTIMESTAMP' -- Contains the current date and time in Coordinated Universal Time format.
                                          | 'ZTS'
                                          | 'ZTIMEZONE' -- Contains the time zone offset from the Greenwich meridian.
                                          | 'ZTRAP' -- Contains the location of the current error trap handler.
                                          | 'ZT' -- Contains the location of the current error trap handler.
                                          | 'ZUTIL' -- 
                                          | 'ZU' --
                                          | 'ZVERSION' -- Contains a string describing the current version of InterSystems IRIS.
                                          | 'ZV'
                                          | 'MVAM' | 'MVNV' | 'MVNAM' | 'MVANS' | 'MVCOMMAND' | 'MVCONV' | 'MVDATE' | 'MVDAY' | 'MVDICT' | 'MVFILENAME' 
                                          | 'MVFM' | 'MVFM' | 'MVFORMAT' | 'MVHEADER' | 'MVID' | 'MVLEVEL' | 'MVMONTH' | 'MVNB' | 'MVND' 
                                          | 'MVNI' | 'MVNS' | 'MVPARASENTENCE' | 'MVRECORD' | 'MVSELECTED' | 'MVSENTENCE' | 'MVSM' | 'MVSTDFIL'
                                          | 'MVSVM' | 'MVSYSRETCODE' | 'MVTIME' |'MVTM' | 'MVTTY' | 'MVUSERRETCODE' | 'MVVM' | 'MVYEAR'
                                          | 'MVERRORS' | 'MVFOOTER' | 'MVMORESUBVALUES' | 'MVMOREVALUES' | 'MVOPTIONS' | 'MVPROCERRORS'
                                          | 'MVPROCNAME' | 'MVPROCPIB' | 'MVPROCPIBOFF' | 'MVPROCPOB' | 'MVPROCSIB' | 'MVPROCSIBOFF' | 'MVPROCSOB'
                                          ) /* should this be just a general "read anything" ?*/

/* Special function that we want to deal with  - need to make it so we can extend this without changing this bnf - different apps may want to look for something else. */
python_import                       ::= 'system' '.' 'python' '.' 'import' '(' string ')' -- $ is already consumed by caller

variable                            ::= variable_identifier [ array_parameter_list ] [ object_chain ]
variable_set                        ::= variable_identifier [ array_parameter_list ] [ object_chain ]
variable_identifier                 ::= 'regexp:(\%|[a-zA-Z])[a-zA-Z0-9]*' /* % or A followed by AN* */
variable_identifier_pattern         ::= (['%'] | '?1A') '?AN'   /* EXPERIMENT % or A followed by AN* */
array_parameter_list                ::= open_bracket  expression ( ',' expression )*  close_bracket

object_chain99                        ::= '.' object_chain_item ( '.' object_chain_item )* 
object_chain                        ::= '.' object_member_identifier [ function_parameter_list ] [ object_chain ]
object_chain_no_dot                 ::= object_member_identifier [ function_parameter_list ] [ object_chain ]
object_dot                          ::= '.' /* this exists simply so that extra checks can be coded on the generated method to check for white*/
object_chain_item                   ::= object_member_identifier [ function_parameter_list ] 
object_member_identifier            ::= 'regexp:(\%|\#|[a-zA-Z])[a-zA-Z0-9\.]*'


number                              ::= ('regexp:[0-9]*' [ '.' 'regexp:[0-9]+'] [ ('e' | 'E' ) 'regexp:[0-9]+']) | ('.' 'regexp:[0-9]+' [ ('e' | 'E') 'regexp:[0-9]+'])  

string                              ::= '""' | ('"' 'regexp:[^\"\r\n]*' '"')

identifier                          ::= 'regexp:(((\%[a-zA-Z0-9])|(\$[a-zA-Z])|[a-zA-Z])[a-zA-Z0-9\.]*)'
global_identifier                   ::= 'regexp:(\%|\$|[a-zA-Z])[a-zA-Z0-9\.]*' /* % or $ or A followed by AN. */

post_conditional                    ::= ':' expression

expression_list                     ::= expression ( ',' expression )*

lvalue_expression                   ::= this_object_set
                                        | variable_set
                                        | intrinsicfncall_set /* $property, $list, $piece, $extract */
                                        | special_variable /* some can be set or newed ! */
                                        | macrocall
                                        | Indirection
                                        | global_ref_set


/**
 * COS commands
 */
break_command                       ::= ('break' | 'b') [ post_conditional ]  [ naked | ( break_extend | break_flag )]
break_extend                        ::= expression
break_flag                          ::= expression

close_command                       ::= ('close' | 'c') [ post_conditional ]  close_item (',' close_item)*
close_item                          ::= open_device [ ':' close_device_parameters ]
close_device                        ::= expression
close_device_parameters             ::= ( '(' close_device_parameter_list ')' ) | one_close_device_parameter
close_device_parameter_list         ::= ( one_close_device_parameter ( ':' one_close_device_parameter )* )
one_close_device_parameter          ::= expression

continue_command                    ::= 'continue' [ post_conditional ] 

do_command                          ::= ('do' | 'd') ( do_while | do_label ) 
do_label                            ::= [ post_conditional ] ( naked | do_item_list)
do_while                            ::= '{' [ cos_code_block ] '}' 'while' expression_list
do_item_list                        ::= do_item [ post_conditional] ( ',' do_item [ post_conditional] )*
do_item                             ::=  object_variable
                                          | this_object 
                                          | simple_indirection 
                                          | ( label_reference [ function_parameter_list ] ) 
                                          | system_object
                                          | macrocall
                                          | intrinsicfncall /* not all of these are "valid" but it should be ok here */
                                          | classexpr 
                                          | ( '(' expression ')' [ object_chain ])

for_command                         ::= ('for' | 'f') [ for_parameters ] for_loop_statement
for_loop_statement                  ::= ( '{' [ cos_command_or_macro ] [ cos_code_block ] '}' ) | (naked | command_list_eol )
for_parameters                      ::= for_parameter ( ',' for_parameter )*
for_parameter                       ::= lvalue_expression '=' for_loop_specifier_list
for_loop_specifier_list             ::= for_loop_specifier ( ',' for_loop_specifier )*
for_loop_specifier                  ::= for_start_value [ ':' for_increment_value [ ':' for_end_loop_value ] ]
for_start_value                     ::= expression
for_increment_value                 ::= expression
for_end_loop_value                  ::= expression

goto_command                        ::= ('goto' | 'g') [ post_conditional ]  goto_dest_list
goto_dest_list                      ::= goto_dest ( ',' goto_dest )*
goto_dest                           ::= goto_case_function_call | ( label_reference [ post_conditional ] )


halt_command                        ::= ('halt' | 'h') [ post_conditional ] naked

hang_command                        ::= ('hang' | 'h') [ post_conditional ] hangtime
hangtime                            ::= hang_value ( ',' hang_value )*
hang_value                          ::= expression

if_command                          ::= ('if' | 'i')  ( naked | expression_list) ( naked | [then_block] ) [ elseif_block_list ] [ else_block ] /* not sure what "if   set x=1 " means but no expression is possible */
then_block                          ::= ( '{'  [ cos_code_block ] '}' ) | command_list_eol
elseif_block_list                   ::= elseif_block ( elseif_block )*
elseif_block                        ::= 'elseif' expression_list ( ( '{' [ cos_code_block ] '}' ) | command_list_eol )
else_block                          ::= 'else' ( ( '{' [ cos_code_block ] '}' ) | command_list_eol )

else_command                        ::= ('else' | 'e') naked /* this happen in some situations like if x d .dotstructure else  d .otherdots */

job_command                         ::= ('job' | 'j') [ post_conditional ] job_arguments
job_arguments                       ::= job_argument ( ',' job_argument )*
job_argument                        ::= job_call [ job_process_parameters ] [ job_timeout_spec ]
job_call                            ::= ( label_reference [ function_parameter_list ] ) 
                                        | class_expression
                                        | this_object
                                        | ( '$' classmethod_function_call )
job_process_parameters              ::= ':' ( job_process_parameters_inbrackets | job_process_parameters_nobrackets )

job_process_parameters_inbrackets   ::= '('  ( job_nspace_param 
                                                [ ':' [ job_switch_param]
                                                [ ':' [ job_principal-input]
                                                [ ':' [ job_principal-output]
                                                [ ':' [ job_priority]
                                                [ ':' [ job_os-directory]
                                                [ ':' [job_process-name]
                                                ]
                                                ]
                                                ]
                                                ]
                                                ]
                                                ]
                                        ) ')' 
job_process_parameters_nobrackets   ::= [ job_nspace_param ]

job_nspace_param                    ::= [ expression ]
job_switch_param                    ::= [ expression ]
job_principal-input                 ::= [ expression ]
job_principal-output                ::= [ expression ]
job_priority                        ::= [ expression ]
job_os-directory                    ::= [ expression ]
job_process-name                    ::= [ expression ]
job_timeout_spec                    ::= ':' expression

kill_command                        ::= ( 'kill' | 'k') [ post_conditional ] ( naked | kill_parameter_list )
kill_parameter_list                 ::= kill_parameter ( ',' kill_parameter )*
kill_parameter                      ::= kill_exclusive_list | kill_item
kill_exclusive_list                 ::= '(' kill_item_list ')'
kill_item_list                      ::= kill_item ( ',' kill_item )*
kill_item                           ::= set_item_single /*this_object_set | variable_set| macrocall| Indirection| global_ref */
                                        
lock_command                        ::= ('lock' | 'l') [post_conditional ] ( naked | ( [ lock_parameter ( ',' lock_parameter)* ] [ else_block ] ) )
lock_parameter                      ::= [ '+' | '-' ] (lockname_list | lockname_list_item) [ lock_timeout ]
lockname_list                       ::= '(' lockname_list_item ( ',' lockname_list_item )* ')'
lockname_list_item                  ::= lockname [ lock_type ]
lock_type                           ::= hash_op expression
lock_timeout                        ::= ':' expression
lockname                            ::= global_ref | variable | macrocall | indirection

merge_command                       ::= ('merge' | 'm') [ post_conditional ] merge_list
merge_list                          ::= merge_item ( ',' merge_item )*
merge_item                          ::= lvalue_expression '=' expression

new_command                         ::= ('new' | 'n') [ post_conditional ] ( naked | new_item_list )
new_item_list                       ::= new_item ( ',' new_item )*
new_item                            ::= new_item_single | new_item_varlist
new_item_single                     ::= lvalue_expression
new_item_varlist                    ::= '(' new_item_single_list ')'
new_item_single_list                ::= new_item_single ( ',' new_item_single )*

naked                               ::= ' ' /* this is going to need some special code to recognise naked commands */

open_command                        ::= ('open' | 'o') [ post_conditional ] open_arguments
open_arguments                      ::= one_open_argument ( ',' one_open_argument )*
one_open_argument                   ::= open_device [ ':' [ ( '('  open_device_parameters ')' ) | expression ] ] [ ':' open_timeout ] [ ':' open_mnemonic_space ]
open_device                         ::= expression
open_device_parameters              ::= [one_open_device_parameter] ( ':'[ one_open_device_parameter] )*
one_open_device_parameter           ::= ('/' identifier [ '=' open_expression_list ] ) | expression    /* text */// text up to next : or )
open_timeout                        ::= expression
open_mnemonic_space                 ::= expression
open_expression_list                ::= (variable '...') | expression_list   /* this is for Open pDevice:(/COMMAND=pCmd:/ARGS=pCmdArgs...:/ENV=pEnvVars...:"R"):pTimeoutOpen */

print_command                       ::= 'print'  [ post_conditional ] [ lineref1 [ ':' lineref2 ] ]
lineref1                            ::= line_reference
lineref2                            ::= line_reference
line_reference                      ::= [ label ] [ [ offset_sign ] offset ]
label                               ::= 'regexp:[0-9A-Za-z]+'
offset_sign                         ::= '+' | '-'
offset                              ::= 'regexp:[0-9]+'

quit_command                        ::= ('quit' | 'q') [ post_conditional ] ( naked | [ quit_expression ])
quit_expression                     ::= expression

return_command                      ::= 'return' [ post_conditional ] [ naked | return_expression ] 
return_expression                     ::= expression

set_command                         ::= ('set' | 's') [ post_conditional ] set_item_list
set_item_list                       ::= set_item ( ',' set_item )*
set_item                            ::= (( set_value_expression | ('(' set_value_expression ( ',' set_value_expression )* ')'  )) '=' set_expression) | simple_indirection /* PXW deal with set @x */
set_item_single                     ::= lvalue_expression
set_item_varlist                    ::= '(' set_item_single_list ')'
set_item_single_list                ::= set_item_single ( ',' set_item_single )*
set_value_expression                   ::= this_object_set
                                        | variable_set
                                        | macrocall
                                        | Indirection
                                        | global_ref_set
                                        | intrinsicfncall_set /* $property, $list, $piece, $extract */
                                        | special_variable
                                        | ( '(' set_value_expression ')'  [ object_chain ] )
set_expression                      ::= expression

tcommit_command                     ::= ('tcommit' | 'tc') [ post_conditional ]

throw_command                       ::= 'throw' [ post_conditional ] [ naked | expression ]

trollback_command                   ::= 'trollback' [ post_conditional ] [ '1' ]

try_command                         ::= 'try' '{' [ cos_code_block ] '}'
                                        (cos_directive)* /* #dim between try and catch */
                                        'catch' [ variable | ( '(' variable ')' ) ] '{' [ cos_code_block ] '}'

tstart_command                      ::= ('tstart' | 'ts' ) [ post_conditional ]

use_command                         ::= ('use' | 'u') [ post_conditional ] use_arguments
use_arguments                       ::= one_use_argument ( ',' one_use_argument )*
one_use_argument                    ::= use_device [ ':' ( use_device_parameters_inbrackets | use_device_parameters)  ] [ ':' use_mnemonic_space ]
use_device                          ::= expression
use_device_parameters_inbrackets    ::=  '('  use_device_parameters ')'
use_device_parameters               ::= [one_use_device_parameter] ( ':' [one_use_device_parameter] )*
one_use_device_parameter            ::= ('/' identifier [ '=' expression ] ) | expression /* text // text up to next : or ) */
use_mnemonic_space                  ::= expression

view_command                        ::= ('view' | 'v') [ post_conditional ]  ( view_offset_form | view_block_form   )
view_block_form                     ::= expression
view_offset_form                    ::= view_offset ':' view_mode ':' view_length ':' view_newvalue
view_offset                         ::= expression
view_mode                           ::= expression
view_length                         ::= expression
view_newvalue                       ::= expression

while_command                       ::= 'while' expression_list '{'  [ cos_code_block ] '}' 

write_command                       ::= ('write' | 'w') [ post_conditional ] ( naked | write_argument_list )
write_argument_list                 ::= one_write_argument ( ',' one_write_argument)*
one_write_argument                  ::= expression | write_control_expression_list 
write_control_expression_list       ::= write_control_expression (write_control_expression)*
write_control_expression            ::= write_format_expression
                                        | write_device_expression
                                        | write_escape_expression
write_format_expression             ::= write_bang_expression
                                        | write_hash_expression
                                        | write_pos_expression
                                        | write_mnemonic_expression
write_bang_expression               ::= '!'
write_hash_expression               ::= '#'
write_pos_expression                ::= '?' expression
write_mnemonic_expression           ::= '/' identifier [ '('  mnemonic_arguments* ')' ]
write_escape_expression             ::= '*' expression
write_device_expression             ::= '*-' expression
mnemonic_arguments                  ::= expression ( ',' expression )*

mpv_command                         ::= ('mvprint' | 'mvp') [ post_conditional ] [ write_argument_list ] /* found in %Projection.MV */


read_command                        ::= ('read' | 'r') [ post_conditional ] read_argument ( ',' read_argument )*
read_argument                       ::= read_format_character /* _set PXW removed set */
                                        | read_prompt
                                        | read_single_char
                                        | read_length
read_format_character_set           ::= read_format_character+
read_format_character               ::= '!'
                                        | '#'
                                        | ('?' expression)
                                        | ('/' read_keyword [ '(' read_keyword_parameters ')' ])
read_keyword                        ::= text // to next (!#?,/"
read_keyword_parameters             ::= read_keyword_parameter ( ',' read_keyword_parameter )*
read_keyword_parameter              ::= text // to next ,)!#?/
read_prompt                         ::= string
read_single_char                    ::= '*' lvalue_expression [ ':' expression ]
read_length                         ::= lvalue_expression [ '#' expression ] [ ':' expression ]



xecute_command                      ::= ( 'xecute' | 'x') [ post_conditional ] xecute_args
xecute_args                         ::= one_xecute_arg ( ',' one_xecute_arg )*
my_one_xecute_arg                      ::= expression [ post_conditional] 
one_xecute_arg                      ::= ( xecute_arg_with_params | xecute_arg_no_params ) [ post_conditional ]
xecute_arg_with_params              ::= '(' xecute_command_text ',' xecute_param_list ')'
xecute_arg_no_params                ::= xecute_command_text
xecute_command_text                 ::= expression /*string*/
xecute_param_list                   ::= xecute_parameter ( ',' xecute_parameter )*
xecute_parameter                     ::= ('.' variable ) | expression 

zallocate_command                   ::= 'zallocate' [post_conditional ] [ zallocate_parameter ( ',' zallocate_parameter)* ] [ else_block ]
zallocate_parameter                 ::= [ '+' | '-' ] zallocatename_list [ zallocate_timeout ]
zallocatename_list                  ::= one_zallocatename ( ',' one_zallocatename )*
one_zallocatename                   ::= zallocatename [ zallocate_type ]
zallocate_type                      ::= '#' '"' ( 'S' | 'E' | 'I' | 'D' )+ '"'
zallocate_timeout                   ::= ':' expression
zallocatename                       ::= text // all to next , \t\r\n;#:

zbreak_command                      ::= ('zbreak' | 'zb') [ post_conditional ] [ (('/' identifier) | '$') [ ':' ( identifier | string ) [ ':' expression [ ':' expression ] ] ] ] /* much more possible and could do with naming, but are they used in real life? */

zdeallocate_command                 ::= 'zdeallocate' [post_conditional ] [ zdeallocate_parameter ( ',' zdeallocate_parameter)* ] [ else_block ]
zdeallocate_parameter               ::= [ '+' | '-' ] zdeallocatename_list [ zdeallocate_timeout ]
zdeallocatename_list                ::= one_zdeallocatename ( ',' one_zdeallocatename )*
one_zdeallocatename                 ::= zdeallocatename [ zdeallocate_type ]
zdeallocate_type                    ::= '#' '"' ( 'S' | 'E' | 'I' | 'D' )+ '"'
zdeallocate_timeout                 ::= ':' expression
zdeallocatename                     ::= text // all to next , \t\r\n;#:

zinsert_command                     ::= 'zinsert' // TODO

zkill_command                       ::= ('zkill' | 'zk') [ post_conditional ] [ kill_parameter_list ]

zload_command                       ::= 'zload' // TODO

znspace_command                     ::= ('znspace'|'zn') [ post_conditional ] expression

zprint_command                      ::= 'zprint'  [ post_conditional ] [ lineref1 [ ':' lineref2 ] ]

zquit_command                       ::= 'zquit' // TODO

zremove_command                     ::= 'zremove' // TODO

zsave_command                       ::= 'zsave' // TODO

zsync_command                       ::= 'zsync' [ post_conditional ]

ztrap_command                       ::= ('ztrap' | 'zt') [post_conditional ] [naked | expression]

zwrite_command                      ::= ( 'zwrite' | 'zw' ) [ post_conditional ] ( naked | zwrite_argument_list )

zwrite_argument_list                ::= zwrite_argument ( ',' zwrite_argument )*

zzdump_command                      ::= 'zzdump' [post_conditional] expression

zzwrite_command                     ::= 'zzwrite' [post_conditional] expression

ZZ_COMMAND                          ::= ZZ_COMMAND_WORD (naked | expression_list)
ZZ_COMMAND_WORD                     ::= 'ZZ'   -- this must be hand coded


html_command                        ::= '&html<' html_body '>'
html_body                           ::= 'NEED HTML BODY'

js_command                          ::= ('&javascript<' | '&js<') js_body '>'
js_body                             ::= 'NEED JS BODY'

sql_command                        ::= '&sql(' sql_body ')'
sql_body                           ::= 'NEED SQL BODY'


// TODO: zwrite argument is more restrictive than an expression
zwrite_argument                     ::= expression

case_function_call                  ::= 'case' open_bracket expression [ case_clauses ] [ case_clause_default ] close_bracket
case_clauses                        ::= (( ',' case_clause ))* /* BUG IN WHILE LOOP CONSTRUCTION FOR THIS CHECK - THE COMMA IS ADDED BUT THE CASE_CLAUSE MIGHT FAIL - ONLY THE CASE_CLAUSE IS ROLLED BACK THE COMMA IS COMMITTED */
case_clause_default                 ::= ',' ':' expression
case_clause                         ::= case_clause_case ':' case_clause_value
case_clause_case                    ::= expression
case_clause_value                   ::= expression

goto_case_function_call                  ::= '$case' open_bracket expression [ goto_case_clauses ] [ goto_case_clause_default ] close_bracket
goto_case_clauses                        ::= (( ',' goto_case_clause ))* /* BUG IN WHILE LOOP CONSTRUCTION FOR THIS CHECK - THE COMMA IS ADDED BUT THE CASE_CLAUSE MIGHT FAIL - ONLY THE CASE_CLAUSE IS ROLLED BACK THE COMMA IS COMMITTED */
goto_case_clause_default                 ::= ',' ':' label_reference
goto_case_clause                         ::= goto_case_clause_case ':' goto_case_clause_value
goto_case_clause_case                    ::= expression
goto_case_clause_value                   ::= label_reference



extract_function_call               ::= ('extract' | 'e') open_bracket expression [ ',' star_parameter [ ',' star_parameter ] ] close_bracket
extract_function_call_set           ::= ('extract' | 'e') open_bracket set_value_expression [ ',' star_parameter [ ',' star_parameter ] ] close_bracket
 
piece_function_call                 ::= ('piece' | 'p') open_bracket expression ',' expression [ ',' star_parameter [ ',' star_parameter ] ] close_bracket
piece_function_call_set             ::= ('piece' | 'p') open_bracket set_value_expression ',' expression [ ',' star_parameter [ ',' star_parameter ] ] close_bracket

listbuild_function_call             ::= ('listbuild' | 'lb') open_bracket  expression (',' expression)* close_bracket
listbuild_function_call_set         ::= ('listbuild' | 'lb') open_bracket  set_value_expression (',' variable_set)* close_bracket

listupdate_function_call            ::= ('listupdate' | 'lu') open_bracket  expression ',' expression (',' [ expression ':' expression] )* close_bracket

listitem_function_call              ::= ('listget' | 'list' | 'li' |'lg' ) open_bracket expression  [ ',' star_parameter [ ',' star_parameter ] ] close_bracket
listitem_function_call_set          ::= ('list' | 'li') open_bracket set_value_expression  [ ',' star_parameter [ ',' star_parameter ] ] close_bracket

bitlogic_function_call              ::= 'bitlogic' open_bracket bitlogic_expression [ ',' expression ] close_bracket
bitlogic_expression                  ::= (expression ('|' | '&' | '^' |'~')* )*

vector_function_call               ::= 'vector' open_bracket expression [ ',' star_parameter [ ',' star_parameter ] ] close_bracket
vector_function_call_set           ::= 'vector' open_bracket set_value_expression  ',' expression ',' expression close_bracket

order_function_call                 ::= ('order' | 'o') open_bracket expression [',' expression [ ',' variable_set ] ] close_bracket

text_function_call                  ::= ('text' | 't') open_bracket text_label_reference close_bracket
text_label_reference                ::= (( (label_identifier [ '+' expression ]) | ('+' expression) | simple_indirection ) [ '^' [routine_env] ( routine_identifier  | simple_indirection) ])  /* lab^rouine */
                                        | ('^' [routine_env] (routine_identifier | simple_indirection) ) /* ^routine -- no label */

query_function_call                 ::= ('query' | 'q') open_bracket expression [',' expression [ ',' variable_set ] ] close_bracket

star_parameter                      ::= ('*' [expression]) | expression

increment_function_call             ::= ('increment' | 'i') '(' (variable_set | global_ref_set) [',' expression ] ')'

method_function_call                ::= 'method' open_bracket classmethod_class ',' classmethod_method [ ',' function_parameter_list_items ] close_bracket [ object_chain ]
classmethod_function_call           ::= 'classmethod' open_bracket classmethod_class ',' classmethod_method [ ',' function_parameter_list_items ] close_bracket [ object_chain ]
classmethod_class                   ::= expression
classmethod_method                  ::= expression
zobjmethod_function_call            ::= 'zobjmethod' open_bracket classmethod_class ',' classmethod_method [ ',' function_parameter_list_items ] close_bracket [ object_chain ]
zobjclassmethod_function_call       ::= 'zobjclassmethod' open_bracket classmethod_class ',' classmethod_method [ ',' function_parameter_list_items ] close_bracket [ object_chain ]

select_function_call                ::= ('select' | 's') '(' select_clauses ')' [ object_chain ] /* who returns an object from a $s? */
select_clauses                      ::= select_clause ( ',' select_clause )*
select_clause_default               ::= '1' ':' expression
select_clause                       ::= expression ':' expression

    /* NO IDEA ABOUT MV, guessing!, from docs: SET $MV(dynval,-1::1)="" // appends 2nd delimiter */
mv_function_set                     ::= 'mv' open_bracket variable_set ',' expression [ '::' expression ] [ ',' expression [ ',' expression ] ] close_bracket

expression_function_call            ::= '##expression' function_parameter_list  /* function? or more similar to macro? */
safeexpression_function_call        ::= '##safeexpression' function_parameter_list  /* function? or more similar to macro? */

any_keyword                         ::= 'need any keyword'

cos_json                            ::= cos_json_object | cos_json_array | cos_json_prim
cos_json_object                     ::= '{' [ cos_json_pair ( ',' cos_json_pair )*] '}'
cos_json_pair                       ::= json_string ':' cos_json
cos_json_prim                       ::= number | json_string | 'true' | 'false' | 'null' | ( '(' expression ')' )
cos_json_array                      ::= '[' [ cos_json (',' cos_json)* ] ']' 

json_string                         ::= 'NEEDS JSON STRING'
    ]]>

    </data>
    </bnf>
}

}
