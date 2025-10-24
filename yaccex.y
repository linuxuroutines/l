%{
#include <stdio.h>
#include <stdlib.h>
int valid = 1;
int yylex();
int yyerror(char *s);
%}
%token num id
%left '+' '-'
%left '*' '/'
%%
E : E '+' E
  | E '-' E
  | E '*' E
  | E '/' E
  | '-' E
  | '(' E ')'
  | num
  | id
  ;
%%
int yyerror(char *s){
    valid = 0;
    printf("\nInvalid expression!\n");
    return 0;
}
int main(){
    printf("Enter the expression:\n");
    yyparse();
    if (valid)
        printf("\nValid expression!\n");
    return 0;
}