%option noyywrap

%{
#include "bison.tab.h"
%}

letter [a-zA-Z]
digit [0-9]

%%
({digit})+ {yylval = atoi(yytext); return(INTD);}
"+" {return(ADD);}
%%