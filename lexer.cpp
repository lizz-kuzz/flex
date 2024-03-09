#include "lexer.h"

void Lexer::token_op_key(token_type type, token_val val) { 
    if (type == OP) {
        std::cout << "Token class: OP,\t\t";
        switch (val)
        {
        case ADD:
            std::cout << "Token value: ADD" << std::endl;
            break;
        case SUB:
            std::cout << "Token value: SUB" << std::endl;
            break;
        case MUL:
            std::cout << "Token value: MUL" << std::endl;
            break;
        case DIV:
            std::cout << "Token value: DIV" << std::endl;
            break;
        case BITAND:
            std::cout << "Token value: BITAND" << std::endl;
            break;
        case AND:
            std::cout << "Token value: AND" << std::endl;
            break;
        case BITOR:
            std::cout << "Token value: BITOR" << std::endl;
            break;
        case OR:
            std::cout << "Token value: OR" << std::endl;
            break;
        case LBRAC:
            std::cout << "Token value: LBRAC" << std::endl;
            break;        
        case RBRAC:
            std::cout << "Token value: RBRAC" << std::endl;
            break;
        case ASSIGMENT:
            std::cout << "Token value: ASSIGMENT" << std::endl;
            break;
        case EQ:
            std::cout << "Token value: EQ" << std::endl;
            break;
        case NOTEQ:
            std::cout << "Token value: NOTEQ" << std::endl;
            break;
        case GREQ:
            std::cout << "Token value: GREQ" << std::endl;
            break;
        case LEQ:
            std::cout << "Token value: LEQ" << std::endl;
            break;
        case LESS:
            std::cout << "Token value: LESS" << std::endl;
            break;
        case GREATER:
            std::cout << "Token value: GREATER" << std::endl;
            break;
        default:
            break;
        }
    } else if (type == KEYWORD) {
        std::cout << "Token class: KEYWORD,\t\t";
        switch (val)
        {
        case IF:
            std::cout << "Token value: IF" << std::endl;
            break;
        case ELSE:
            std::cout << "Token value: ELSE" << std::endl;
            break;
        case LOOP:
            std::cout << "Token value: LOOP" << std::endl;
            break;
        case THEN:
            std::cout << "Token value: THEN" << std::endl;
            break;
        case WHILE:
            std::cout << "Token value: WHILE" << std::endl;
            break;
        case FALSE:
            std::cout << "Token value: FALSE" << std::endl;
            break;
        case TRUE:
            std::cout << "Token value: TRUE" << std::endl;
            break;
        case NOT:
            std::cout << "Token value: NOT" << std::endl;
            break;
        case PRINT:
            std::cout << "Token value: PRINT" << std::endl;
            break;
        case PRINTLN:
            std::cout << "Token value: PRINTLN" << std::endl;
            break;
        default:
            break;
        }
    } else if (type == SPECIAL_SYMB) {
        std::cout << "Token class: SPECIAL_SYMB,\t";
        if (val == EOF1) {
            std::cout << "Token value: EOF" << std::endl;
        } 
    }
}

void Lexer::token_ind_num(token_type type, char *yytext) {
    double yylvald;
    int yylvali;
    switch (type)
    {
    case VARIABLE:
        std::cout << "Token class: VARIABLE,\t\tToken value: " << yytext << std::endl; 
        break;
    case TYPE_ID:
        std::cout << "Token class: TYPE_ID,\t\tToken value: " << yytext << std::endl; 
        break;
    case FLOAT_NUM:
        yylvald = atof(yytext);
        std::cout << "Token class: FLOAT_NUM,\t\tToken value: " << yylvald << std::endl; 
        break;
    case INT_NUM:
        yylvali = atoi(yytext); 
        std::cout << "Token class: INT_NUM,\t\tToken value: " << yylvali << std::endl;
        break;
    default:
        break;
    }
}

void Lexer::string_buf::token_str() {
    std::cout << "Token class: STRING,\t\tToken value: \"" << buf << "\""<< std::endl; 
}

void Lexer::string_buf::append(char symb) {
    buf.push_back(symb);
}

void Lexer::string_buf::append(char* str) {
    buf.append(str);
}



