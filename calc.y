
%{
#include <stdio.h>
int flag = 0;
%}

%union {
    int ival;
}

%token <ival> NUMBER
%type <ival> E

%left '+' '-'
%left '*' '/' '%'

%%

ArithmeticExpression:
    E { printf("\nResult = %d\n", $1); }
;

E:
      E '+' E { $$ = $1 + $3; }
    | E '-' E { $$ = $1 - $3; }
    | E '*' E { $$ = $1 * $3; }
    | E '/' E { $$ = $1 / $3; }
    | E '%' E { $$ = $1 % $3; }
    | '(' E ')' { $$ = $2; }
    | NUMBER { $$ = $1; }
;

%%

int main() {
    printf("\n Enter any arithmetic expression \n");
    yyparse();
    if(flag == 0)
        printf("\nEntered arithmetic expression is Valid\n");
    return 0;
}

void yyerror(char *s) {
    printf("\nEntered arithmetic expression is Invalid\n");
    flag = 1;
}
