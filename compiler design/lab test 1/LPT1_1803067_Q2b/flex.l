%option noyywrap

%{
#include "bison.tab.h"
%}



digit [0-9]
alpha [a-zA-Z]
id (_|{alpha})+(_|{digit}|{alpha})*
INT ({digit})+
float ({digit})*.({digit})+


%%
"I" {return(N);}
"eat" {return(V);}
"rice" {return(O);}
%%