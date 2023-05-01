%{
#include<stdio.h>
void yyerror(char *s);
int yylex();
%}

%token Z A
%start S

%%
S: S A Z | Z
%%

int main()
{
    yyparse();
    printf("Parsing Finished\n");
    return 0;
}

void yyerror(char *s)
{
    fprintf(stderr, "<---- error: %s\n", s);
}