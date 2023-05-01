%option noyywrap

%{
#include "bison.tab.h"
%}


digit [0-9]
alpha [a-zA-Z]
id (_|{alpha})+(_|{digit}|{alpha})*


%%
"int"   {return(type);}
{id} {return(id);}
";"     {return(semi);}
({digit})+ {return(data);}
"=" {return(assign);}
[ \t\n] {}
. {}
%%