Class PXW.DEV.BNF.Compilers.BNF2 Extends PXW.DEV.BNF.Compilers.loader
{

/// This will generate into PXW.DEV.BNF.GEN.BNF2 but that class is not used.
/// The code will need to be copied from PXW.DEV.BNF.GEN.BNF2 to PXW.DEV.BNF.Compilers.BNF2safe
Projection GEN As PXW.DEV.BNF.Compilers.projection(GenerateTo = "PXW.DEV.BNF.GEN.BNF2");

XData file
{
<bnf>
<data><![CDATA[

# e1 e2
#   Match e1, then match e2.
# e1 | e2
#   Match e1 or e2.
#   The first alternative can also appear on the line after the rule name for
#   formatting purposes. In that case, a | must be used before the first
#   alternative, like so:
#       rule_name[return_type]:
#            | first_alt
#            | second_alt
# ( e )
#   Match e (allows also to use other operators in the group like '(e)*')
# [ e ] or e?
#   Optionally match e.
# e*
#   Match zero or more occurrences of e.
# e+
#   Match one or more occurrences of e.
# s.e+
#   Match one or more occurrences of e, separated by s. The generated parse tree
#   does not include the separator. This is otherwise identical to (e (s e)*).
# &e
#   Succeed if e can be parsed, without consuming any input.
# !e
#   Fail if e can be parsed, without consuming any input.
# ~
#   Commit to the current alternative, even if it fails to parse.
#

file            ::= definition*
definition      ::= IDENTIFIER EQUALS rules
rules           ::= rule* or_rules*
rule            ::= repeat_sep | repeat_zero | repeat_one | optional_single | KEYWORD | subrule | optional_group | call | look_ahead | not_rule | force
or_rules        ::= '|' rule*
repeat          ::= repeat_zero | repeat_one
repeat_zero     ::= repeatable_rule '*'            # 0 or more items 
repeat_one      ::= repeatable_rule '+'            # 1 or more items 
repeatable_rule ::= KEYWORD | subrule | call

subrule         ::= '(' rules ')'
optional_group  ::= '[' rules ']'                  # something in [], [ item ] means item is optional, [ item | other ] means either item or other can be there 

optional_single ::= optionalable_rule '?'          # rule::=command post_conditional? -- post_conditional is optional 
optionalable_rule ::= KEYWORD | subrule | call

call            ::= IDENTIFIER 

repeat_sep      ::= repeat_sep_separator '.' repeat_sep_rule '+'   # s.e+ 
repeat_sep_separator ::= KEYWORD | subrule | call 
repeat_sep_rule ::= KEYWORD | subrule | call 

look_ahead      ::= '&' look_ahead_rule
look_ahead_rule ::=  KEYWORD | subrule | call 

not_rule        ::= '!' notable_rule
notable_rule    ::= KEYWORD | subrule | call 

force           ::= "~" # NOT SURE WHAT THIS IS


IDENTIFIER ::= 'NEEDS IDENTIFIER'
KEYWORD ::= 'NEEDS STRING'
EQUALS ::= 'NEEDS EQUALS'    ]]>

    </data></bnf>
}

}
