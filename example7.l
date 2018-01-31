%{
#include <stdio.h>
#include <string.h>
#include "y.tab.h"
%}
%%
[0-9]+              yylval.number=atoi(yytext);return NUMBER;
heater              return TOKHEATER;
heat                return TOKHEAT;
on|off              yylval.number=!strcmp(yytext,"on");return STATE;
target              return TOKTARGET;
temperature         return TOKTEMPERATURE;
[a-z0-9]+           yylval.string=strdup(yytext);return WORD;
\n                  /* ignore end of line */;
[ \t]+              /* ignore whitespace */;
%%