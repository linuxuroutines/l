%{
#include "y.tab.h"
%}
%%
[a-zA-Z_][a-zA-Z0-9_]*    { return IDENTIFIER; }
[0-9][a-zA-Z0-9_]*        { return INVALID; }
[ \t]+                   { /* skip whitespace */ }
[\n]                     { return 0; }
.                        { return INVALID; }
%%
int yywrap() {
    return 1;
}\
