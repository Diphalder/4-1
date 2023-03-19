%{
#include<stdio.h>
void yyerror(char *s);
int yylex();
%}

%token N V C O
%start S

%%
S: N V O C O;
S: N V O;
%%

int main()
{
    yyparse();
    printf("Parsing Finished\n");
    return 0;
}

void yyerror(char *s)
{
    fprintf(stderr, "error: %s\n", s);
}