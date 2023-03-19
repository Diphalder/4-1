%option noyywrap


%{



%}


%%
"2" {printf("NUM =%s",yytext);}
"+" {printf("OP =%s",yytext);}
"I" {printf("noun =%s",yytext);}
"eat" {printf("verb =%s",yytext);}
"rice" {printf("obj =%s",yytext);}
"You" {printf("noun =%s",yytext);}
"love" {printf("verb =%s",yytext);}
"apple" {printf("obj =%s",yytext);}
"We" {printf("noun =%s",yytext);}
"mango" {printf("obj =%s",yytext);}
%%

int main()
{
    yylex();
    return 0;
}