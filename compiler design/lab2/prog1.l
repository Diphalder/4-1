%option noyywrap


%{
%}


%%
"I"|"we"|"you" {printf("noun->%s\t",yytext);}
"i" {printf("noun->%s\t",yytext);}
"eat"|"love" {printf("verb->%s\t",yytext);}
"Eat" {printf("verb ->%s\t",yytext);}
"rice"|"mango"|"Mango"|"apple"|"Apple" {printf("obj =%s\t",yytext);}
"Rice" {printf("obj ->%s\t",yytext);}

"RUET"|"KUET" {printf("University ->%s\t",yytext);}
"CSE"|"EEE" {printf("Dept. ->%s\t",yytext);}
"18"|"17" {printf("Series ->%s\t",yytext);}
. {}
%%

int main()
{
    yylex();
    return 0;
}