#include "lexer.h"

extern int yylineno;
extern FILE* yyin;
void yylex();

int main(int argc, char **argv)
{
    yylineno = 1;
    if (argc > 1) {
        if (!(yyin = fopen(argv[1], "r"))) {
            std::cout << "error " << argv[1] << std::endl;
            return 1;
        }
    } 
    yylex();
    std::cout << "lines = " << yylineno << std::endl; 
}