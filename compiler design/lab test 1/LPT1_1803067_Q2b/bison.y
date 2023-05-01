%{
#include<stdio.h>
void yyerror(char *s);
int yylex();
%}

%token N V O
%start S

%%
S: N V O ;
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