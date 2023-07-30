%{
	// roll : 1803067
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
	#include"symtab.c"
	void yyerror();
	extern int lineno;
	extern int yylex();

	/*

	void insert(char* name, int type)
	int idcheck(char* name)
	int gettype(char *name)
	int typecheck(int type1, int type2)
	
	
	UNDEF_TYPE
	INT_TYPE
	REAL_TYPE
	CHAR_TYPE
	typename[]
		
	*/

%}



%union
{
	char str_val[100];
	int int_val;
}



%token  DIM AS  FOR NEXT TO INT FLOAT ADDOP SUBOP MULOP
%token DIVOP EQUOP GT LT MOD COLON LPAREN RPAREN LBRACE RBRACE SEMI ASSIGN ICONST FCONST 

%token<str_val> ID 
%type<int_val>  data type exp
%type<str_val> forloopini 

%left LT GT  			/*LT GT has lowest precedence*/
%left ADDOP SUBOP
%left MULOP DIVOP
%left MOD 			/*MULOP has highest precedence*/
%left LPAREN RPAREN
%start code_


%%
code_ : code_ code | ;
code : def  | forloop | assignment  ; 
def : DIM ID AS type {  insert( $2 , $4 );   } ;
type : INT{$$=INT_TYPE;} | FLOAT {$$=REAL_TYPE;};
forloop : FOR forloopini code_ NEXT ID {   
	if(gettype($2) !=gettype($5))
	{ printf(" for loop initial-identifiter = '%s' and Next-identifier = '%s' is not same \n",$2,$5 ); }   }  ;
forloopini : ID ASSIGN data TO data 
{ 
	
	int z=gettype($1);
		if(typecheck(z , $3)==typecheck(z , $5)) 
		{ strcpy($$,$1);} 
	
};

assignment : ID ASSIGN exp { if(idcheck($1)){ typecheck(gettype($1),$3);} } ;
data : ICONST {$$=INT_TYPE;} | FCONST {$$=REAL_TYPE;} | ID { if(idcheck($1)){  $$=gettype($1); } } ;
exp : exp op data { $$=typecheck($1,$3); } | data {$$=$1;} ;
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
