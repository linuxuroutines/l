%{
#include "y.tab.h"
%}
%%
[0-9]+                { return num; }
[a-zA-Z_][a-zA-Z_0-9]* { return id; }
[+\-*/()]             { return yytext[0]; }
[ \t\n]               ;
.                     { return yytext[0]; }
%%
int yywrap() { return 1; }

===== run =====
nano yaccex.l
nano yaccex.y
yacc -d yaccex.y
lex yaccex.l
gcc y.tab.c lex.yy.c -o yaccex -ll -ly
./yaccex