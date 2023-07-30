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



%token INT IF ELSE WHILE CONTINUE BREAK PRINT DOUBLE CHAR
%token ADDOP SUBOP MULOP DIVOP EQUOP LT GT
%token LPAREN RPAREN LBRACE RBRACE SEMI ASSIGN

%token<str_val> ID
%token<int_val> ICONST
%token FCONST
%token CCONST

%type<int_val> type			/*return type of gettype() is int_val*/        
%type<int_val> factor		/*return type of gettype() is int_val*/  
%type<int_val> exp

%left LT GT 			/*LT GT has lowest precedence*/
%left ADDOP 
%left MULOP 			/*MULOP has highest precedence*/


%start code

%%
code : DEC code | ifst code |  DEC  | ifst  | assign_val | assign_val code;
DEC : type ID Z SEMI   { if(idcheck2($2)==0){insert($2 , $1);}};
Z : ASSIGN exp | ;
assign_val : ID ASSIGN exp SEMI;
type : INT {$$=INT_TYPE} | DOUBLE{$$=REAL_TYPE}  ;
exp : exp OP factor {if(typecheck($1,$3)){$$=$3;}} | factor {$$=$1; }  ;
OP :  ADDOP | condiop | SUBOP | DIVOP | MULOP ;
factor : ID { if(idcheck($1)){$$=gettype($1);}} | ICONST  {$$=INT_TYPE;} | FCONST   {$$=REAL_TYPE;};
ifst : IF LPAREN exp RPAREN LBRACE code RBRACE elsest ;
condiop : GT | LT | EQUOP ; 
elsest : ELSE LBRACE code RBRACE | ;
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
