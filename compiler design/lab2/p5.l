%option noyywrap

%{
#include "p5.tab.h"
%}


%%
"I"|"we"|"you"  {return(N);}
"i"             {return(N);}
"eat"|"love"    {return(V);}
"Eat"           {return(V);}
"rice"|"mango"|"apple"|"Apple" {return(O);}
"Rice" {return(O);}
"and" {return(C);}
. {}
%%
