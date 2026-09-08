/// Generated on-line by google AI - not tested
Class PXW.DEV.BNF.DEF.MVBasic Extends %RegisteredObject
{

xdata file {
<bnf>
<data><![CDATA[
--    ebnf(* 1. High-Level Program Structure *)
program           ::= line*
line              ::= [ statement_label ] [ statement_list ] end_of_line
statement_list    ::= statement ( ";" statement )*
statement_label   ::= integer | identifier ":"
end_of_line       ::= "\n" | "\r\n"

--(* 2. Core Statements *)
statement         ::= assignment_stmt
                    | conditional_stmt
                    | loop_stmt
                    | io_stmt
                    | control_stmt
                    | comment

assignment_stmt   ::= variable_ref "=" expression
comment           ::= ( "*" | "!" | "REM" ) any_characters

--(* 3. MultiValue Conditionals & Loops *)
conditional_stmt  ::= "IF" expression "THEN" then_body [ "ELSE" else_body ]
then_body         ::= end_of_line line* "END" | statement_list
else_body         ::= end_of_line line* "END" | statement_list

loop_stmt         ::= for_loop | loop_until_while
for_loop          ::= "FOR" identifier "=" expression "TO" expression [ "STEP" expression ] end_of_line line* "NEXT" [ identifier ]
loop_until_while  ::= "LOOP" end_of_line line* ( "WHILE" | "UNTIL" ) expression "DO" end_of_line line* "REPEAT"

--(* 4. MultiValue Database & File I/O *)
io_stmt           ::= open_stmt | read_stmt | write_stmt | crt_stmt
open_stmt         ::= "OPEN" [ expression "," ] expression "TO" variable_ref ( "THEN" then_body | "ELSE" else_body )+
read_stmt         ::= ( "READ" | "READU" | "READV" ) variable_ref "FROM" variable_ref "," expression [ "THEN" then_body ] "ELSE" else_body
write_stmt        ::= ( "WRITE" | "WRITEU" | "WRITEV" ) expression ( "ON" | "TO" ) variable_ref "," expression
crt_stmt          ::= ( "CRT" | "PRINT" ) [ expression ] ( ( "," | ";" ) expression )*

--(* 5. Expressions & MultiValue Dynamic Arrays *)
expression        ::= term ( binary_operator term )*
term              ::= factor | variable_ref | literal | "(" expression ")" | function_call
variable_ref      ::= identifier [ "<" expression [ "," expression [ "," expression ] ] ">" ]
binary_operator   ::= "+" | "-" | "*" | "/" | ":" | "=" | "<" | ">" | "<=" | ">=" | "#" | "AND" | "OR" | "MATCH" | "MATCHES"
literal           ::= string_literal | numeric_literal
string_literal    ::= '"' any_except_quote* '"' | "'" any_except_apos>* "'"
numeric_literal   ::= digit+ [ "." digit+ ]

--(* 6. Control Flow, Subroutines & Functions *)
control_stmt      ::= "GOTO" statement_label
                    | "GOSUB" statement_label
                    | "RETURN"
                    | "CALL" identifier [ "(" expression_list ")" ]
                    | "STOP"
                    | "END"
expression_list   ::= expression ( "," expression )*
function_call     ::= identifier "(" [ expression_list ] ")"

--(* 7. Lexical Elements (Tokens) *)
identifier        ::= letter ( letter | digit | "." | "_" | "$" | "%" )*
integer           ::= digit+
letter            ::= [a-zA-Z]
digit             ::= [0-9]

  ]]></data></bnf>
}
}
