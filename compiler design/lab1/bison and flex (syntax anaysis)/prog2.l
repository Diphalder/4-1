%option noyywrap

%{
#include "prog2.tab.h"
%}

%%
"I" {return(N);}
"eat" {return(V);}
"rice" {return(O);}
%%