%option noyywrap


%{
%}

digit [0-9]
letter [A-Za-z]


%%
({digit})+ {printf("INT ->%s\t",yytext);} 
"+" {printf("ADD ->%s\t",yytext);} 
. {}
%%

int main()
{
    yylex();
    return 0;
}