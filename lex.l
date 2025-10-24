%{
#include "y.tab.h"
#include <stdlib.h>
%}
%%
[0-9]+      { yylval.ival = atoi(yytext); return NUMBER; }
[ \t]+      ;
\n          { return 0; }
.           { return yytext[0]; }
%%
int yywrap() {
    return 1;
}
===== run =====
yacc -d calc.y
lex lex.l
gcc lex.yy.c y.tab.c -o calc
./calc