%option noyywrap

%{
#include "bison.tab.h"
%}

%%
"I" {return(N);}
"eat" {return(V);}
"rice" {return(O);}
%%