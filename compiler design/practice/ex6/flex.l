%option noyywrap

%{
#include "bison.tab.h"
%}

%%
"RUET"|"CUET"|"BUET"|"University of "("Dhaka"|"Rajshahi"|"Chittagong")   {return(uni);}
"CSE"|"EEE"   {return(dept);}
1[7-9]   {return(series);}
(180|1[0-7][0-9]|0[1-9][0-9]|00[1-9])    {return(roll);}
(20|19|18|17|16)(10|0[0-9])(180|1[0-7][0-9]|0[1-9][0-9]|00[1-9])    {return(id);}
[ \n\t] {}
. {}
%%

