%option noyywrap

%{
#include "bison.tab.h"
%}

digit [0-9]


%%
({digit})+  {return(Z);}
"+" {return(A);}
. {}
%%