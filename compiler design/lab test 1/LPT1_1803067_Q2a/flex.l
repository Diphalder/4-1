%option noyywrap


%{



%}


digit [0-9]
alpha [a-zA-Z]
id (_|{alpha})+(_|{digit}|{alpha})*
INT ({digit})+
float ({digit})*.({digit})+


%%
"2"     {printf("NUM =>%s\t",yytext);}
"+"     {printf("OP =>%s\t",yytext);}
"I"     {printf("noun =>%s\t",yytext);}
"eat"   {printf("verb =>%s\t",yytext);}
"rice"  {printf("obj =>%s\t",yytext);}
"You"   {printf("noun =>%s\t",yytext);}
"love"  {printf("verb =>%s\t",yytext);}
"apple" {printf("obj =>%s\t",yytext);}
"We"    {printf("noun =>%s\t",yytext);}
"mango" {printf("obj =>%s\t",yytext);}
%%

int main()
{
    yylex();
    return 0;
}