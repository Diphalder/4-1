%{
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



%token  INT FLOAT DIM AS ASSIGN FOR TO NEXT ICONST FCONST
%token<str_val> ID
%type<int_val>  ICONST FCONST type data

%start code

%%
code: code code_ | ;
code_ : dec | forloop ;
dec : DIM ID AS type {if(idcheck2($2)==0){ insert($2, $4); } } ;
type : INT { $$ = INT_TYPE ;} | FLOAT { $$ = REAL_TYPE ;};
forloop : FOR ID ASSIGN data TO data code NEXT ID   { if(idcheck($2)){  typecheck(gettype($2), $4) ; typecheck(gettype($2), $6) ;} if(strcmp($2,$9)){ printf(" variable->%s and %s are not same \n",$2,$9);}  idcheck($9); } ;
data : ICONST{ $$ = INT_TYPE ;} | FCONST{ $$ = REAL_TYPE ;} ; 
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
