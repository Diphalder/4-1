%option noyywrap


%{



%}

digit [0-9]
alpha [a-zA-Z]
id (_|{alpha})+(_|{digit}|{alpha})*
INT ({digit})+
float ({digit})*.({digit})+

%%
{id}     {printf("identifier =>%s\t",yytext);}
{INT}    {printf("integer =>%s\t",yytext);}
{float}    {printf("float =>%s\t",yytext);}
";"         {printf("semicolon =>%s\t",yytext);}
. {}
%%

int main()
{
    yylex();
    return 0;
}