%{
#include<stdio.h>
void yyerror(char *s);
int yylex();
%}

%token uni series roll dept id
%start S

%%
S: A | A S
A: id | roll | uni dept series | uni ;
%%

int f=1;

int main()
{
    yyparse();
    if(f)
    {
        printf("Accepted\n");
    }
    return 0;
}

void yyerror(char *s)
{
    f=0;
    fprintf(stderr, "<---- error: %s\n", s);
}