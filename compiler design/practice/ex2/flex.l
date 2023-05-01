%option noyywrap


%{



%}

digit [0-9]
digits ({digit})+
alpha [a-zA-Z]
id (_|{alpha})+(_|{digit}|{alpha})*
float ("+"|"-"|"")({digits})("."({digits})|"")


%%
{id}     {printf("identifier =>%s\t",yytext);}


. {}
%%

int main()
{
    yylex();
    return 0;
}