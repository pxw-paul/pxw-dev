/// <p>Going to get a bit weird here, a bnf definition of bnf that is written to decode itself and regerate the decoder!</p>
Class PXW.DEV.BNF.Compilers.BNF1 Extends PXW.DEV.BNF.Compilers.loader
{

/// This will generate into PXW.DEV.BNF.GEN.BNF2 but that class is not used.
/// The code will need to be copied from PXW.DEV.BNF.GEN.BNF2 to PXW.DEV.BNF.Compilers.BNF2safe
Projection GEN As PXW.DEV.BNF.Compilers.projection(GenerateTo = "PXW.DEV.BNF.GEN.BNF1");

XData file
{
<bnf>
<data><![CDATA[

/*
 eg
    
*/

file            ::= definition*
definition      ::= IDENTIFIER EQUALS rules
rules           ::= rule*
rule            ::= repeat_sep | repeat_zero | repeat_one | optional_single | KEYWORD | or | subrule | optional_group | call | look_ahead | not_rule
or              ::= '|'
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



IDENTIFIER ::= 'NEEDS IDENTIFIER'
KEYWORD ::= 'NEEDS STRING'
EQUALS ::= 'NEEDS EQUALS'
    ]]>

    </data></bnf>
}

}
