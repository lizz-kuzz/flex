%{
#include "lexer.h"
%}
%option noyywrap 
%option yylineno 
%{
%} 
TAB         [ \t]
DIGITS      [0-9]
SYMS        [a-z]
SYMB        [A-Z]
SYMV        [a-z_A-Z0-9]
NUMBER      (0|-?[1-9]{DIGITS}*)
FLOAT       {NUMBER}\.{DIGITS}*
STRING      \".*\"
TYPE_ID     {SYMB}{SYMV}*
VARIABLE    {SYMS}{SYMV}*
FALSE       f(?i:alse)
TRUE        t(?i:rue)
IF          (?i:if)
ELSE        (?i:else)
WHILE       (?i:while)
LOOP        (?i:loop) 
THEN        (?i:then) 
NOT         (?i:not)
PRINT       (?i:print)
PRINTLN     (?i:println)
LONGCOMMENT     \/\*([^*]|(\*+[^*\/]))*\*+\/
%%
"+"             { Lexer::token_op_key(Lexer::token_type::OP, Lexer::token_val::ADD);}
"-"             { Lexer::token_op_key(Lexer::token_type::OP, Lexer::token_val::SUB);}
"*"             { Lexer::token_op_key(Lexer::token_type::OP, Lexer::token_val::MUL);}
"/"             { Lexer::token_op_key(Lexer::token_type::OP, Lexer::token_val::DIV);}
"&"             { Lexer::token_op_key(Lexer::token_type::OP, Lexer::token_val::BITAND);}
"&&"            { Lexer::token_op_key(Lexer::token_type::OP, Lexer::token_val::AND);}
"|"             { Lexer::token_op_key(Lexer::token_type::OP, Lexer::token_val::BITOR);}
"||"            { Lexer::token_op_key(Lexer::token_type::OP, Lexer::token_val::OR);}
"("             { Lexer::token_op_key(Lexer::token_type::OP, Lexer::token_val::LBRAC);}
")"             { Lexer::token_op_key(Lexer::token_type::OP, Lexer::token_val::RBRAC);}
"="             { Lexer::token_op_key(Lexer::token_type::OP, Lexer::token_val::ASSIGMENT);}
"=="            { Lexer::token_op_key(Lexer::token_type::OP, Lexer::token_val::EQ);}
"!="            { Lexer::token_op_key(Lexer::token_type::OP, Lexer::token_val::NOTEQ);}
">="            { Lexer::token_op_key(Lexer::token_type::OP, Lexer::token_val::GREQ);}
"<="            { Lexer::token_op_key(Lexer::token_type::OP, Lexer::token_val::LEQ);}
"<"             { Lexer::token_op_key(Lexer::token_type::OP, Lexer::token_val::LESS);}
">"             { Lexer::token_op_key(Lexer::token_type::OP, Lexer::token_val::GREATER);}
{IF}            { Lexer::token_op_key(Lexer::token_type::KEYWORD, Lexer::token_val::IF);}
{ELSE}          { Lexer::token_op_key(Lexer::token_type::KEYWORD, Lexer::token_val::ELSE);}
{LOOP}          { Lexer::token_op_key(Lexer::token_type::KEYWORD, Lexer::token_val::LOOP);}
{THEN}          { Lexer::token_op_key(Lexer::token_type::KEYWORD, Lexer::token_val::THEN);}
{WHILE}         { Lexer::token_op_key(Lexer::token_type::KEYWORD, Lexer::token_val::WHILE);}
{FALSE}         { Lexer::token_op_key(Lexer::token_type::KEYWORD, Lexer::token_val::FALSE);}
{TRUE}          { Lexer::token_op_key(Lexer::token_type::KEYWORD, Lexer::token_val::TRUE);}
{NOT}           { Lexer::token_op_key(Lexer::token_type::KEYWORD, Lexer::token_val::NOT);}
{PRINT}         { Lexer::token_op_key(Lexer::token_type::KEYWORD, Lexer::token_val::PRINT);}
{PRINTLN}       { Lexer::token_op_key(Lexer::token_type::KEYWORD, Lexer::token_val::PRINTLN);}
<<EOF>>         { Lexer::token_op_key(Lexer::token_type::SPECIAL_SYMB, Lexer::token_val::EOF1); yyterminate();}
\n              { std::cout << std::endl;}
{STRING}        { if (Lexer::token_str(yytext) == ERROR) {
                    yyterminate();
                  }}
{TAB}           { /* ignore whitespace */ }
{VARIABLE}      { Lexer::token_ind_num(Lexer::token_type::VARIABLE, yytext); }
{TYPE_ID}       { Lexer::token_ind_num(Lexer::token_type::TYPE_ID, yytext); }
{FLOAT}         { Lexer::token_ind_num(Lexer::token_type::FLOAT_NUM, yytext);}
{NUMBER}        { Lexer::token_ind_num(Lexer::token_type::INT_NUM, yytext); }
{LONGCOMMENT}   {/* ignore comments */}
(--).*\n?       {/* ignore comments */}
.               { std::cout << "Undefined character:" << yytext; }
%%


