%{
#include <stdio.h>
int line = 0, word = 0, ch = 0;
%}

%%
[a-zA-Z0-9]+    { ch += yyleng; word++; }
[ \t]+          { /* skip spaces/tabs */ }
\n              { line++; }
.               { ch++; }
%%

int main() {
    printf("Enter text (press Ctrl+D or Ctrl+Z to end):\n");
    yylex();  // Reads from standard input (keyboard) by default
    printf("\nline = %d\n", line);
    printf("word = %d\n", word);
    printf("character = %d\n", ch);
    return 0;
}
===== run =====
nano char.l
lex char.l
gcc lex.yy.c -o char -ll
./char