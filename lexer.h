#pragma once

#include <stdlib.h>
#include <iostream>
#include <string>


#define PRINT(var_) std::cout << #var_ << std::endl;
#define ERROR 1


namespace Lexer {
    class string_buf {
        std::string buf;
    public:
        void token_str();
        void append(char symb);
        void append(char *str);
    };
    enum token_type {
        VARIABLE,
        TYPE_ID,
        FLOAT_NUM,
        INT_NUM, 
        SPECIAL_SYMB,
        OP,
        KEYWORD,
        STRING,
    };

    enum token_val {
        ADD, 
        SUB,
        MUL,
        DIV,
        BITAND,
        AND,
        BITOR,
        OR,
        LBRAC,
        RBRAC,
        ASSIGMENT,
        EQ,
        NOTEQ,
        GREQ,
        LEQ,
        LESS, 
        GREATER,
        IF, 
        ELSE,
        LOOP,
        THEN, 
        WHILE,
        FALSE, 
        TRUE,
        NOT, 
        PRINT,
        PRINTLN,
        EOF1,
    };

    void token_op_key(token_type type, token_val val);
    void token_ind_num(token_type type, char *yytext);
    int  token_str(std::string str);
};



