%{
#include<stdio.h>
void yyerror(char *s);
int yylex();
%}

%token id type data semi assign
%start S

%%
S: type id assign data semi |  type id semi ;
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