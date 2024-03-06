%{
#include <stdlib.h>
#include <iostream>
#include <string>
#define ERROR 1
%}
%option noyywrap 
%option yylineno 
%{
int yylval;
int token_str(std::string str);
%} 
TAB         [ \t]
DIGITS      [0-9]
SYMS        [a-z]
SYMB        [A-Z]
SYMV        [a-z_A-Z0-9]
NUMBER      ({DIGITS}*)
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
"+"             { std::cout << "Token class: OP,       Token value: ADD" << std::endl; }
"-"             { std::cout << "Token class: OP,       Token value: SUB" << std::endl; }
"*"             { std::cout << "Token class: OP,       Token value: MUL" << std::endl; }
"/"             { std::cout << "Token class: OP,       Token value: DIV" << std::endl; }
"&"             { std::cout << "Token class: OP,       Token value: BITAND" << std::endl; }
"&&"            { std::cout << "Token class: OP,       Token value: AND" << std::endl; }
"|"             { std::cout << "Token class: OP,       Token value: BITOR" << std::endl; }
"||"            { std::cout << "Token class: OP,       Token value: OR" << std::endl; }
"("             { std::cout << "Token class: OP,       Token value: LBRAC" << std::endl; }
")"             { std::cout << "Token class: OP,       Token value: RBRAC" << std::endl; }
"="             { std::cout << "Token class: OP,       Token value: ASSIGMENT" << std::endl; }
"=="            { std::cout << "Token class: OP,       Token value: EQ" << std::endl; }
"!="            { std::cout << "Token class: OP,       Token value: NOTEQ" << std::endl; }
">="            { std::cout << "Token class: OP,       Token value: GREQ" << std::endl; }
"<="            { std::cout << "Token class: OP,       Token value: LEQ" << std::endl; }
"<"             { std::cout << "Token class: OP,       Token value: LESS" << std::endl; }
">"             { std::cout << "Token class: OP,       Token value: GREATER" << std::endl; }
{IF}            { std::cout << "Token class: KEYWORD,  Token value: IF" << std::endl; }
{ELSE}          { std::cout << "Token class: KEYWORD,  Token value: ELSE" << std::endl; }
{LOOP}          { std::cout << "Token class: KEYWORD,  Token value: LOOP" << std::endl; }
{THEN}          { std::cout << "Token class: KEYWORD,  Token value: THEN" << std::endl; }
{WHILE}         { std::cout << "Token class: KEYWORD,  Token value: WHILE" << std::endl; }
{FALSE}         { std::cout << "Token class: KEYWORD,  Token value: FALSE" << std::endl; }
{TRUE}          { std::cout << "Token class: KEYWORD,  Token value: TRUE" << std::endl; }
{NOT}           { std::cout << "Token class: KEYWORD,  Token value: NOT" << std::endl; }
{PRINT}         { std::cout << "Token class: KEYWORD,  Token value: PRINT" << std::endl; }
PRINTLN         { std::cout << "Token class: KEYWORD,  Token value: PRINTLN" << std::endl; }
<<EOF>>         { std::cout << "EOF" << std::endl; yyterminate();}
\n              { std::cout << std::endl;}
{STRING}        { if (token_str(yytext) == ERROR) {
                    yyterminate();
                }}
{TAB}           { /* ignore whitespace */ }
{VARIABLE}      { std::cout << "Token class: VARIABLE, Token value: " << yytext << std::endl; }
{TYPE_ID}       { std::cout << "Token class: TYPE_ID,  Token value: " << yytext << std::endl; }
{NUMBER}        { yylval = atoi(yytext); 
                  std::cout << "Token class: NUMBER,   Token value: " << yylval << std::endl; }
{LONGCOMMENT}   {/* ignore comments */}
(--).*\n?       {/* ignore comments */}
.               { std::cout << "Undefined character:" << yytext; }
%%

int token_str(std::string str) {
    if (str.find("\\0") != std::string::npos || str.find(EOF) != std::string::npos) {
        std::cout << "ERROR: you use invalid character \\0  or EOF in string" << std::endl;
        return ERROR;
    }
    std::cout << "Token class: STRING,   Token value: " << yytext << std::endl; 
    return 0;
}
int main(int argc, char **argv)
{
    yylineno = 1;
    if (argc > 1) {
        if (!(yyin = fopen(argv[1], "r"))) {
            std::cout << "error" << argv[1] << std::endl;
            return ERROR;
        }
    } 
    yylex();
    std::cout << "lines = " << yylineno << std::endl; 
}