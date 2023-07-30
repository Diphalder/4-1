%{
#include<stdio.h>
void yyerror(char *s);
int yylex();
%}

%token INTD ADD
%start S

%%
S: INTD | S ADD INTD {printf("%d + %d = %d \n",$1 , $3 , $1+$3)} ;
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