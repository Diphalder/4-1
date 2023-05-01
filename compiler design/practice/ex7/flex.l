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
"main" {return(min);}
"(" {return(fbl);}
")" {return(fbr);}
"{" {return(sbl);}
"}" {return(sbr);}
"if" {return(iff);}
(">"|"<"|"=="|"<="|">="|"!=") {return(cop);}
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