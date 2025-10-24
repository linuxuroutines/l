%{
#include <stdio.h>
int i;
%}
%%
[a-zA-Z]+ {
    for(i = 0; i < yyleng - 2; i++) {
        if(yytext[i] == 'a' && yytext[i+1] == 'b' && yytext[i+2] == 'c') {
            yytext[i] = 'A';
            yytext[i+1] = 'B';
            yytext[i+2] = 'C';
        }}
    printf("%s", yytext);
}
.*   { ECHO; }
\n   { printf("\n"); exit(0); }
%%
int main() {
    printf("Enter a string: ");
    yylex();
    return 0;
}
int yywrap() {
    return 1;
}
===== run =====
nano abc.l
lex abc.l
gcc lex.yy.c -o abc -ll
./abc