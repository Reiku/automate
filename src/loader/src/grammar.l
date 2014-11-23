%{
#include <string>
#include "node.h"
#include "parser.hpp"
#define SAVE_GRAMMAR yylval.string = new std::string(yytext, yyleng)
#define GRAMMAR(g) (yylval.grammar = g)
extern "C" int yywrap() { }
%}

%%

[ \t\n]                 ;
[a-zA-Z0-9_]*           SAVE_GRAMMAR; return T_STATE;
"&"                     return GRAMMAR(T_AND);
"|"                     return GRAMMAR(T_OR);
"!"                     return GRAMMAR(T_NOT);
"="                     return GRAMMAR(T_EQUAL);
":"                     return GRAMMAR(T_ASSIGN);
"("                     return GRAMMAR(T_LPAREN);
")"                     return GRAMMAR(T_RPAREN);
"=>"                    return GRAMMAR(T_RULE);
.                       printf("Unknown GRAMMAR!\n"); yyterminate();

%%