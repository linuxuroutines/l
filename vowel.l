%{
#include <stdio.h>
int vow_count = 0;
int const_count = 0;
%}
%%
[aeiouAEIOU]             { vow_count++; }
[a-zA-Z]      { const_count++; }
.|\n                        { /* ignore other chars */ }
%%
int yywrap() {
    return 1;
}
int main() {
    printf("Enter the string of vowels and consonants:\n");
    yylex();
    printf("\nNumber of vowels are: %d\n", vow_count);
    printf("Number of consonants are: %d\n", const_count);
    return 0;
}
===== run =====
nano vowel.l
lex vowel.l
gcc lex.yy.c -o vowel -ll
./vowel