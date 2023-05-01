%option noyywrap


%{
%}

digit [0-9]
letter [A-Za-z]


%%
("+"|"-"|"")({digit})*(".")({digit})+ {printf("FLOAT ->%s\t",yytext);}
("+"|"-"|"")({digit})* {printf("INT ->%s\t",yytext);} 
. {}
%%

int main()
{
    // want to detect integer number
    yylex();
    return 0;
}