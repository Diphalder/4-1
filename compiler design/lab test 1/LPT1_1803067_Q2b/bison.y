%{
#include<stdio.h>
void yyerror(char *s);
int yylex();
%}

%token  DIM AS  FOR NEXT TO INT FLOAT ADDOP SUBOP MULOP
%token DIVOP EQUOP GT LT MOD COLON LPAREN RPAREN LBRACE RBRACE SEMI ASSIGN ICONST FCONST 

%token<str_val> ID

%type<int_val> ICONST FCONST




%left LT GT  			/*LT GT has lowest precedence*/
%left ADDOP SUBOP
%left MULOP DIVOP
%left MOD 			/*MULOP has highest precedence*/
%left LPAREN RPAREN
%start code_


%%
code_ : code_ code | ;
code : def  | forloop | assignment  ; 
def : DIM ID AS type ;
type : INT | FLOAT ;
forloop : FOR ID ASSIGN data TO data code_ NEXT ID ;
assignment : ID ASSIGN exp ;
data : ICONST | FCONST ;
exp : exp ADDOP data | exp SUBOP data | exp MULOP data | exp DIVOP data | data ;
%%


int f=1;

int main()
{
      //roll : 1803067
      
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