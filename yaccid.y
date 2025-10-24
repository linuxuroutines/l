
===== yacc_ident.y =====
%{
#include <stdio.h>
#include <stdlib.h>
%}
%token IDENTIFIER
%token INVALID
%%
input:
    IDENTIFIER { printf("Valid identifier\n"); }
    | INVALID  { printf("Invalid identifier\n"); } ;
%%
int main() {
    printf("Enter an identifier: ");
    yyparse();
    return 0;
}
int yyerror(const char* s) {
    return 0;
}


===== run =====
nano yaccid.l
nano yaccid.y
yacc -d yaccid.y
lex yaccide.l
gcc y.tab.c lex.yy.c -o yaccid -ll -ly
./yaccid