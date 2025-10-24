%{
#include <stdio.h>
int cnt1 = 0, cnt2 = 0, cnt3 = 0;
%}

%%
\(     { cnt1++; }
\)     { cnt1--; }
\[     { cnt2++; }
\]     { cnt2--; }
\{     { cnt3++; }
\}     { cnt3--; }
[a-zA-Z] {}
\n {
    if (cnt1 == 0 && cnt2 == 0 && cnt3 == 0)
        printf("matching\n");
    else
        printf("not matching\n");

    cnt1 = cnt2 = cnt3 = 0;
}
. {}
%%

int main() {
    printf("Enter input (Press Ctrl+D or Ctrl+Z to end):\n");
    yylex();
    return 0;
}

===== run =====
nano paren.l
lex paren.l
gcc lex.yy.c -o paren -ll
./paren