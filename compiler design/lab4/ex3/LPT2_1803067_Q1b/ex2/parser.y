%{
	// roll : 1803067
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
	#include"symtab.c"
	void yyerror();
	extern int lineno;
	extern int yylex();


%}



%union
{
	char str_val[100];
	int int_val;
}



%token  DIM AS  FOR NEXT TO INT FLOAT ADDOP SUBOP MULOP
%token DIVOP EQUOP GT LT MOD COLON LPAREN RPAREN LBRACE RBRACE SEMI ASSIGN ICONST FCONST ID


%start code_


%%
code_ : code_ code | ;
code : def  | forloop | assignment  ; 
def : DIM ID AS type ;
type : INT | FLOAT ;
forloop : FOR forloopini code_ NEXT ID  ;
forloopini : ID ASSIGN data TO data ;

assignment : ID ASSIGN exp  ;
data : ICONST | FCONST  | ID ;
exp : exp op data  | data ;
op : ADDOP | SUBOP | MULOP | DIVOP ;
%%

void yyerror ()
{
	printf("Syntax error at line %d\n", lineno);
	exit(1);
}

int main (int argc, char *argv[])
{
	yyparse();
	printf("Parsing finished!\n");	
	return 0;
}
