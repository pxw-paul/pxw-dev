Class PXW.DEV.BNF.DEF.JS Extends PXW.DEV.BNF.Compilers.loader
{

/// This BNF is incomplete so do not project
Projection GEN As PXW.DEV.BNF.Compilers.projection(GenerateTo = "PXW.DEV.BNF.GEN.JS");

Parameter SubElementType = "PXW.DEV.BNF.Elements.JS";

/// https://github.com/antlr/grammars-v4/blob/master/javascript/javascript/JavaScriptParser.g4
/// with major fixes to make it work for me
XData file
{
<data><![CDATA[ 

/*program
    : HashBangLine? sourceElements? end_of_file
    ;
*/
OpenBracket                ::='['
CloseBracket               ::=']'
OpenParen                  ::= '('
CloseParen                 ::= ')'
OpenBrace                  ::= '{' /* {this.ProcessOpenBrace();}; */
--TemplateCloseBrace         ::=     {this.IsInTemplateString()}? '}' -> popMode;
CloseBrace                 ::= '}' /* {this.ProcessCloseBrace();}; */
SemiColon                  ::= ';'
Comma                      ::= ','
Assign                     ::= '='
QuestionMark               ::= '?'
QuestionMarkDot            ::= '?.'
Colon                      ::= ':'
Ellipsis                   ::= '...'
Dot                        ::= '.'
PlusPlus                   ::= '++'
MinusMinus                 ::= '--'
Plus                       ::= '+'
Minus                      ::= '-'
BitNot                     ::= '~'
Not                        ::= '!'
Multiply                   ::= '*'
Divide                     ::= '/'
Modulus                    ::= '%'
Power                      ::= '**'
NullCoalesce               ::= '??'
Hashtag                    ::= '#'
RightShiftArithmetic       ::= '>>'
LeftShiftArithmetic        ::= '<<'
RightShiftLogical          ::= '>>>'
LessThan                   ::= '<'
MoreThan                   ::= '>'
LessThanEquals             ::= '<='
GreaterThanEquals          ::= '>='
Equals                    ::= '=='
NotEquals                  ::= '!='
IdentityEquals             ::= '==='
IdentityNotEquals          ::= '!=='
BitAnd                     ::= '&'
BitXOr                     ::= '^'
BitOr                      ::= '|'
And                        ::= '&&'
Or                         ::= '||'
MultiplyAssign             ::= '*='
DivideAssign               ::= '/='
ModulusAssign              ::= '%='
PlusAssign                 ::= '+='
MinusAssign                ::= '-='
LeftShiftArithmeticAssign  ::= '<<='
RightShiftArithmeticAssign ::= '>>='
RightShiftLogicalAssign    ::= '>>>='
BitAndAssign               ::= '&='
BitXorAssign               ::= '^='
BitOrAssign                ::= '|='
PowerAssign                ::= '**='
NullishCoalescingAssign    ::= '??='
ARROW                      ::= '=>'

source_Element    ::= statement

statement         ::= block
    | variable_Statement
    | import_Statement
    | export_Statement
    | empty_Statement
    | class_Declaration
    | function_Declaration
    | if_Statement
    | iteration_Statement
    | continue_Statement
    | break_Statement
    | return_Statement
    | yield_Statement
    | with_Statement
    | labelled_Statement
    | switch_Statement
    | throw_Statement
    | try_Statement
    | debugger_Statement
    /*| assignment_statement*/
    | expression_Statement

/*
assignment_statement ::= identifier (member_expression_part)* '=' (function_Declaration | single_expression)
*/

block    ::= '{' [statement_List] '}'
    
statement_List           ::= statement*

/* mandatory statement list is used when we KNOW there is some js so if none is returned then its a problem */
statement_List_mandatory ::= statement+
    
import_Statement ::= "Import" import_From_Block
    
import_From_Block ::= [import_Default] (import_Namespace | import_Module_Items) import_From eos
    | String_Literal eos
    
import_Module_Items    ::= '{' import_Alias_Name (',' import_Alias_Name )*  '}'    

import_Alias_Name    ::= module_Export_Name [("As" imported_Binding)]

module_Export_Name    ::= identifier_Name
    | String_Literal
    
// yield and await are permitted as BindingIdentifier in the grammar
imported_Binding    ::= Identifier
    | "Yield"
    | "Await"
    
import_Default    ::= alias_Name ','
    
import_Namespace   ::= ('*' | identifier_Name) [("As" identifier_Name)]

import_From  ::= "From" String_Literal
    
alias_Name   ::= identifier_Name ["As" identifier_Name]


export_Statement    ::= ("Export" ["Default"] (export_From_Block | declaration) eos) /* # ExportDeclaration*/
                        | ("Export" "Default" single_Expression eos)                 /*# ExportDefaultDeclaration*/

export_From_Block    ::= (import_Namespace import_From eos)
    | (export_Module_Items [import_From] eos)
    
export_Module_Items ::= '{' export_Alias_Name (',' export_Alias_Name  )* '}'

export_Alias_name   ::= module_Export_Name [("As" module_Export_Name)]
    
declaration ::= variable_Statement
    | class_Declaration
    | function_Declaration

variable_Statement    ::= variable_Declaration_List eos
    
variable_Declaration_List ::= var_Modifier variable_Declaration (',' variable_Declaration)*
    
variable_Declaration    ::= assignable [('=' single_Expression)] 
    
empty_Statement ::= ';'
    
expression_Statement ::= /*{this.notOpenBraceAndNotFunction()}?*/ expression_Sequence eos
    
if_Statement ::= "If" '(' expression_Sequence ['in' expression_sequence] ')' statement [("Else" statement)]
    
iteration_Statement ::= ("Do" statement "While" '(' expression_Sequence ')' eos)                                             /*# DoStatement*/
    | ("While" '(' expression_Sequence ')' statement )                                                                           /*# WhileStatement*/
    | ( "for" "(" "var" Variable_Declaration ";" [ single_Expression ] ";" [ single_Expression ] ")" Statement )
    | ("For" '(' [variable_Declaration_List | expression_Sequence ] ';' [expression_Sequence] ';' [expression_Sequence] ')' statement ) /*# ForStatement*/
    | ("For" '(' (variable_Declaration_List | single_Expression ) "In" expression_Sequence ')' statement )                              /*# ForInStatement*/
    | ("For" ["Await"] '(' (variable_Declaration_List | single_Expression  ) "Of" expression_Sequence ')' statement )                       /*# ForOfStatement*/
    
var_Modifier     ::= "Var"
    | "let"
    | "Const"
    
continue_Statement    ::= "Continue" [/*{this.notLineTerminator()}?*/ identifier] eos
    
break_Statement ::= "Break" [is_not_Line_Terminator identifier] eos
    
return_Statement    ::= "Return" [/*{this.notLineTerminator()}?*/ expression_Sequence] eos

yield_Statement     ::= "Yield" [/*({this.notLineTerminator()}?*/ expression_Sequence] eos
    
with_Statement    ::= "With" '(' expression_Sequence ')' statement

switch_Statement   ::= "Switch" '(' expression_Sequence ')' case_Block
    
case_Block  ::= '{' [case_Clauses] [default_Clause [case_Clauses]] '}'

case_Clauses  ::= case_Clause*
    
case_Clause  ::= "Case" expression_Sequence ':' ( !'case' statement )* /* keep looping through statements while NOT a case */    /* [statement_List] */ 
    
default_Clause   ::= "Default" ':' ( !'case' statement )* /* keep looping through statements while NOT a case */    /* [statement_List] */ 

labelled_Statement ::= identifier ':' statement

throw_Statement   ::= "Throw" /*{this.notLineTerminator()}?*/ expression_Sequence eos

try_Statement ::= "Try" block ((catch_Production [finally_Production]) | finally_Production)
    
catch_Production    ::= "Catch" ['(' assignable? ')'] block
    
finally_Production    ::= "Finally" block
    
debugger_Statement    ::= "Debugger" eos
    
function_Declaration     ::=  ["Async"] "Function" ['*'] identifier '(' [formal_Parameter_List] ')' function_Body
    
class_Declaration    ::= "Class" identifier class_Tail
    
class_Tail    ::= ["Extends" single_Expression] '{' class_Element* '}'
    
/*class_Element
    : (Static | {this.n("static")}? identifier)? methodDefinition
    | (Static | {this.n("static")}? identifier)? fieldDefinition
    | (Static | {this.n("static")}? identifier) block
    | emptyStatement_
    */
class_Element    ::= ([["Static"] identifier] method_Definition)
    | ([["Static"] identifier] field_Definition)
    | ([["Static"] identifier] block)
    | empty_Statement
  
method_Definition    ::= (["Async" /*{this.notLineTerminator()}?*/] ['*'] class_Element_Name '(' [formal_Parameter_List ] ')' function_Body)
    | (['*'] getter '(' ')' function_Body)
    | (['*'] setter '(' formal_Parameter_List? ')' function_Body)
    
field_Definition    ::= class_Element_Name [initializer]
    
class_Element_Name    ::= property_Name
    | private_Identifier 
    
private_Identifier    ::= '#' identifier_Name
    
formal_Parameter_List    ::= (formal_Parameter_Arg (',' formal_Parameter_Arg)* [',' last_Formal_Parameter_Arg])
    | last_Formal_Parameter_Arg
    
formal_Parameter_Arg    ::= assignable ['=' single_Expression] /* ECMAScript 6: Initialization */
    
last_Formal_Parameter_Arg ::= Ellipsis single_Expression /* ECMAScript 6: Rest Parameter */

function_Body    ::= '{' [source_Elements] '}'

source_Elements    ::= source_Element*
    
array_Literal    ::= '[' element_List ']'
    
element_List    ::= [array_Element] (',' [array_Element])*  /* Yes, everything is optional */

array_Element    ::= [Ellipsis] single_Expression
 
property_Assignment ::= (property_Name ':' single_Expression )                                 /* PropertyExpressionAssignment */
    | ('[' single_Expression ']' ':' single_Expression)                      /*# ComputedPropertyExpressionAssignment*/
    | ([ "Async" ] ['*'] property_Name '(' [formal_Parameter_List] ')' function_Body ) /*# FunctionProperty*/
    | (getter '(' ')' function_Body )                                        /*# PropertyGetter*/
    | (setter '(' formal_Parameter_Arg ')' function_Body )                     /*# PropertySetter*/
    | ([Ellipsis] single_Expression )                                        /*# PropertyShorthand*/
    

property_Name   ::= identifier_Name
    | String_Literal
    | numeric_Literal
    | ('[' single_Expression ']')
    
arguments    ::= '(' [argument (',' argument)*] ')'

argument    ::= [Ellipsis] (single_Expression | identifier)

expression_Sequence ::= single_Expression (',' single_Expression)*

oldsingle_Expression    ::= anonymous_Function                                /* # FunctionExpression*/
    | ( 'Class' identifier? class_Tail )                     /* ClassExpression */
    | ( single_Expression '?.' single_Expression )            /* OptionalChainExpression */
    | ( single_Expression ['?.'] '[' expression_Sequence ']') /* MemberIndexExpression */
    | ( single_Expression ['?'] '.' ['#'] identifier_Name )     /* MemberDotExpression */
    /* Split to try `new Date()` first, then `new Date`. */
    | ( "New" identifier arguments)                                             /* NewExpression */
    | ( "New" single_Expression arguments)                                       /* NewExpression */
    | ( "New" single_Expression)                                                 /* NewExpression */
    | ( single_Expression arguments)                                           /* ArgumentsExpression */
    | ( "New" '.' identifier )                                                    /* MetaExpression // new.target */
    | ( single_Expression /*{this.notLineTerminator()}?*/ '++' )                    /* PostIncrementExpression */
    | ( single_Expression /*{this.notLineTerminator()}?*/ '--' )                   /* PostDecreaseExpression */
    | ( "Delete" single_Expression )                                             /* DeleteExpression */
    | ( "Void" single_Expression )                                               /* VoidExpression */
    | ( "Typeof" single_Expression )                                             /* TypeofExpression */
    | ('++' single_Expression )                                               /* PreIncrementExpression */
    | ('--' single_Expression )                                               /* PreDecreaseExpression */
    | ('+' single_Expression )                                                 /* UnaryPlusExpression */
    | ('-' single_Expression )                                                /* UnaryMinusExpression */
    | ('~' single_Expression )                                                /* BitNotExpression */
    | ('!' single_Expression )                                                /* NotExpression */
    | ("Await" single_Expression )                                               /* AwaitExpression */
    | (/*<assoc = right>*/ single_Expression '**' single_Expression )              /* PowerExpression */
    | ( single_Expression ('*' | '/' | '%') single_Expression )                 /* MultiplicativeExpression */
    | ( single_Expression ('+' | '-') single_Expression )                       /* AdditiveExpression */
    | ( single_Expression '??' single_Expression )                              /* CoalesceExpression */
    | ( single_Expression ('<<' | '>>' | '>>>') single_Expression )              /* BitShiftExpression */
    | ( single_Expression ('<' | '>' | '<=' | '>=') single_Expression )          /* RelationalExpression */
    | ( single_Expression "Instanceof" single_Expression )                         /* InstanceofExpression */
    | ( single_Expression "In" single_Expression )                                 /* InExpression */
    | ( single_Expression ('==' | '!=' | '===' | '!==') single_Expression )      /* EqualityExpression */
    | ( single_Expression '&' single_Expression )                                /* BitAndExpression */
    | ( single_Expression '^' single_Expression )                               /* BitXOrExpression */
    | ( single_Expression '|' single_Expression )                               /* BitOrExpression */
    | ( single_Expression '&&' single_Expression )                              /* LogicalAndExpression */
    | ( single_Expression '||' single_Expression )                               /* LogicalOrExpression */
    | ( single_Expression '?' single_Expression ':' single_Expression )          /* TernaryExpression */
    | (/*<assoc = right>*/ single_Expression '=' single_Expression )                /* AssignmentExpression */
    | (/*<assoc = right>*/ single_Expression assignment_Operator single_Expression ) /* AssignmentOperatorExpression */
    | ( "Import" '(' single_Expression ')' )                                      /* ImportExpression */
    /*| ( single_Expression template_String_Literal ) */                              /* TemplateStringExpression // ECMAScript 6 */
    | ( yield_Statement )                                                       /* YieldExpression          // ECMAScript 6 */
    | "This"                                                                 /* ThisExpression */
    | identifier                                                           /* IdentifierExpression */
    | "Super"                                                                /* SuperExpression */
    | literal                                                              /* LiteralExpression */
    | array_Literal                                                         /* ArrayLiteralExpression */
    | object_Literal                                                        /* ObjectLiteralExpression */
    | ('(' expression_Sequence ')')                                           /* ParenthesizedExpression */
 

single_expression                  ::= (factor ( dyadicop factor )* ) [ '--' | '++']

factor                              ::= ( monadicop )* primary [ '++' | '--'] /* can be any number of +- or ' */
monadicop                           ::= "++" | "--" | "+" | "-" | "~" | "!"

dyadicop                            ::= ('?' single_expression ':') | '===' | '>>>' | '!==' 
                                        | '**' |'??' | '<<' | '>>' | '<=' | '>=' | '==' | '!=' | '&&' | '||' | '+=' | '-=' | '*='
                                        | '*' | '/' | '%' | '+' | '-'  | '&' | '^' | '|' | '=' | '<' 
                                        | ('>' is_not_Line_Terminator) /* checking for > on its own at the end of embedded js */
                                        | cos_expression_runtime /* sometimes there is an expression for a operator, in particular < or >, EnsPortal.StartStopFrame */
                                        | "InstanceOf" /* | "In" */

primary ::= anonymous_Function 
    | cos_expression
    | ('[' expression_sequence ']'  (member_expression_part)*)
    | ( 'Class' identifier? class_Tail )                     /* ClassExpression */
    | ( "New" identifier arguments (member_expression_part)* )                                             /* NewExpression */
    | ( "New" single_Expression arguments)                                       /* NewExpression */
    | ( "New" single_Expression)                                                 /* NewExpression */
    | ( "New" '.' identifier )                                                    /* MetaExpression // new.target */
    | ( "Delete" single_Expression )                                             /* DeleteExpression */
    | ( "Void" single_Expression )                                               /* VoidExpression */
    | ( "Typeof" single_Expression )                                             /* TypeofExpression */
    | ("Await" single_Expression )                                               /* AwaitExpression */
    | ( "Import" '(' single_Expression ')' )                                      /* ImportExpression */
    | ( yield_Statement )                                                       /* YieldExpression          // ECMAScript 6 */
    | ("This" (member_expression_part)* )                                                               /* ThisExpression */
    | macro
    | (function (member_expression_part)* )                                                         /* IdentifierExpression */
    | (identifier (member_expression_part)* )                                                         /* IdentifierExpression */
    | "Super"                                                                /* SuperExpression */
    | literal                                                              /* LiteralExpression */
    | (array_Literal (member_expression_part)*)                                                        /* ArrayLiteralExpression */
    | object_Literal                                                       /* ObjectLiteralExpression */
    | ('(' expression_Sequence ')' (member_expression_part)*)                                           /* ParenthesizedExpression */

Member_Expression_Part	::=	( "[" single_Expression "]" )
   |	( ['?'] "." Identifier [( "(" [ expression_Sequence ] ")" )] )

macro   ::= '$$$' identifier ['(' expression_sequence ')']

function ::= identifier ['[' single_expression ']'] '(' [expression_sequence] ')'

initializer    ::= '=' single_Expression
    /* TODO: must be `= AssignmentExpression` and we have such label alredy but it doesn't respect the specification.
      See https://tc39.es/ecma262/multipage/ecmascript-language-expressions.html#prod-Initializer
    */

assignable    ::= identifier
    | array_Literal
    | object_Literal
    
object_Literal ::= '{' [property_Assignment (',' [property_Assignment])* ] '}' /* sometimes these are missing, is this valid or just poor coding? */

anonymous_Function    ::= (["Async"] "Function" ['*'] [ identifier ] /* optional identifier on anonymous?! */ '(' [formal_Parameter_List] ')' function_Body) /*# AnonymousFunctionDecl*/
  /* NOT SUPPORTING THIS FOR NOW => is confusing FOR statements a bit */  | (["Async"] arrow_Function_Parameters '=>' arrow_Function_Body )           /*# ArrowFunction*/

arrow_Function_Parameters    ::= identifier
    | ('(' [formal_Parameter_List] ')')
    
arrow_Function_Body    ::= single_Expression
    | function_Body

assignment_Operator    ::= '*='
    | '/='
    | '%='
    | '+='
    | '-='
    | '<<='
    | '>>='
    | '>>>='
    | '&='
    | '^='
    | '|='
    | '**='
    | '??='

literal    ::= Null_Literal
    | Boolean_Literal
    | (String_Literal (member_expression_part)*)
    | (Regular_Expression_Literal (member_expression_part)*)
    | numeric_Literal
    | bigint_Literal


numeric_Literal    ::= Decimal_Literal
    | Hex_Integer_Literal
    | Octal_Integer_Literal
    | Octal_Integer_Literal2
    | Binary_Integer_Literal
    

bigint_Literal    ::= Big_Decimal_Integer_Literal
    | Big_Hex_Integer_Literal
    | Big_Octal_Integer_Literal
    | Big_Binary_Integer_Literal
    
getter    ::= "get" /*{this.n("get")}?*/ identifier class_Element_Name
    
setter    ::= "set" /*{this.n("set")}?*/ identifier class_Element_Name
    

identifier_Name    ::= identifier
    | reserved_Word
    
/* don't understand this yet
identifier
    : Identifier
    | NonStrictLet
    | Async
    | As
    | From
    | Yield
    | Of
    ;
*/
identifier ::= "NEED IDENTIFIER"

reserved_Word    ::= keyword
    | Null_Literal
    | Boolean_Literal
    

keyword    ::= "Break"
    | "Do"
    | "Instanceof"
    | "Typeof"
    | "Case"
    | "Else"
    | "New"
    | "Var"
    | "Catch"
    | "Finally"
    | "Return"
    | "Void"
    | "Continue"
    | "For"
    | "Switch"
    | "While"
    | "Debugger"
    | "Function"
    | "This"
    | "With"
    | "Default"
    | "If"
    | "Throw"
    | "Delete"
    | "In"
    | "Try"
    | "Class"
    | "Enum"
    | "Extends"
    | "Super"
    | "Const"
    | "Export"
    | "Import"
    | "Implements"
    | "let"
    | "Private"
    | "Public"
    | "Interface"
    | "Package"
    | "Protected"
    | "Static"
    | "Yield"
    | "Async"
    | "Await"
    | "From"
    | "As"
    | "Of"
    

let    ::= "let"

eos    ::= SemiColon
    | end_of_file
    /*| {this.lineTerminatorAhead()}?
    | {this.closeBrace()}?
    */


Decimal_literal ::= 'NEED decimal_literal'
Hex_Integer_Literal ::= ('0x' | '0X')  ('0' | '1' | '2' | '3' | '4' | '5' | '6' | '7' | '8' | '9' | 'A' | 'B' | 'C' | 'D' | 'E' | 'F' )*
Octal_Integer_Literal ::= ('0o' | '0O')  ('0' | '1' | '2' | '3' | '4' | '5' | '6' | '7'  )* 
Octal_Integer_Literal2 ::= Octal_Integer_Literal
Binary_Integer_Literal::= ('0b' | '0B')  ('0' | '1' )* 

Big_Decimal_Integer_Literal ::= decimal_integer_literal 'n'
Big_Hex_Integer_Literal ::= ('0x' | '0X')  ('0' | '1' | '2' | '3' | '4' | '5' | '6' | '7' | '8' | '9' | 'A' | 'B' | 'C' | 'D' | 'E' | 'F' )* 'n'
Big_Octal_Integer_Literal ::= ('0o' | '0O')  ('0' | '1' | '2' | '3' | '4' | '5' | '6' | '7'  )* 'n'
Big_Binary_Integer_Literal::= ('0b' | '0B')  ('0' | '1' )* 'n'
null_literal    ::= 'null'
boolean_literal ::= 'true' | 'false'

decimal_integer_literal ::= 'NEED decimal_integer_literal'
end_of_file ::= 'NEED end_of_file'
string_literal ::= 'NEED string literal'
regular_expression_literal ::= 'NEED regex literal'


cos_expression                      ::= cos_expression_compiletime | cos_expression_runtime | cos_expression_other | cos_expression_server | cos_expression_call
cos_expression_compiletime          ::= '##(' cos_expression_body ')##'
cos_expression_runtime              ::= '#(' cos_expression_body ')#'
ocos_expression_server               ::= '#server(' '..' identifier '(' [ expression_sequence ]  ')' ')#'
ocos_expression_call                 ::= '#call(' '..' identifier '(' [ expression_sequence ]  ')' ')#'
cos_expression_server               ::= '#server(' cos_expression_body ')#'
cos_expression_call                 ::= '#call(' cos_expression_body ')#'
cos_expression_other                ::= '<%=' cos_expression_body '%>'
cos_expression_body                 ::= 'NEEDS COS EXPRESSION BODY'

is_not_Line_Terminator              ::= 'NEEDS is_not_Line_Terminator'

    ]]></data>
}

}
