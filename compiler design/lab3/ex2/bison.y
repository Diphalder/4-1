%{
#include<stdio.h>
void yyerror(char *s);
int yylex();
%}


%token  f i intt floatt id asn semi
%start S

%%
S:A | S A
A: intt id asn i semi |  intt id semi | floatt id asn f semi | floatt id asn intt semi  | floatt id  semi ;
%%
int ff=1;

int main()
{
    yyparse();
    if(ff)
    {
        printf("Accepted\n");
    }
    return 0;
}

void yyerror(char *s)
{
    ff=0;
    fprintf(stderr, "<---- error: %s\n", s);
}