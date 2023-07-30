%option noyywrap

%{
#include "bison.tab.h"
%}


letter [a-zA-Z]
digit [0-9]
digits ({digit})+
id (_|{letter})+(_|{digit}|{letter})*
float {digits}*[.]{digits}



%%
{float} {return(f);}
{digits} {return(i);}
"int" {return(intt);}
"float" {return(floatt);}
{id} {return(id);}
"=" {return(asn);}
";" {return(semi);}
[ \n\t] {}
. {}
%%