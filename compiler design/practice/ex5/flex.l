%option noyywrap


%{



%}

digit [0-9]
alpha [a-zA-Z]
id (_|{alpha})+(_|{digit}|{alpha})*
INT ({digit})+
float ({digit})*.({digit})+

%%
"RUET"|"CUET"|"BUET"|"University of "("Dhaka"|"Rajshahi"|"Chittagong")   {printf("[university_name] =>%s\t",yytext);}
"CSE"|"EEE"   {printf("[dept_name] =>%s\t",yytext);}
1[7-9]   {printf("[series] =>%s\t",yytext);}
(20|19|18|17|16)(10|0[0-9])(180|1[0-7][0-9]|0[1-9][0-9]|00[1-9])    {printf("[roll] =>%s\t",yytext);}

. {}
%%

int main()
{
    yylex();
    return 0;
}