%{
#include<stdio.h>
void yyerror(char *s);
int yylex();
%}


%token min fbl fbr sbl sbr iff cop f i intt floatt id asn semi
%start S

%%
S: min fbl fbr sbl A sbr  | min fbl fbr sbl sbr ;
A: A ini semi | A iff fbl k cop k fbr sbl A sbr | ini semi |  iff fbl k cop k fbr sbl A sbr |  iff fbl k cop k fbr sbl sbr | A iff fbl k cop k fbr sbl sbr   ;
k: id|i|f ; 
ini: intt id asn i |   intt id | floatt id asn f | floatt id asn intt | floatt id  ;
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