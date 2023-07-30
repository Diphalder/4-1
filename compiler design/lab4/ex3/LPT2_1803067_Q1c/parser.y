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



%token INT FLOAT CHAR
%token ADDOP SUBOP MULOP DIVOP EQUOP LT GT
%token LPAREN RPAREN LBRACE RBRACE SEMI ASSIGN FUNCTION RET BEG MOD COLON
%token FCONST END ICONST
%token CCONST  

%token<str_val> ID

%type<int_val> var ICONST FCONST CCONST exp assignment type dec code




%left LT GT  			/*LT GT has lowest precedence*/
%left ADDOP SUBOP
%left MULOP DIVOP
%left MOD 			/*MULOP has highest precedence*/

%start code

%%
code : code code_ | ;
code_ : FUNCTION ID LPAREN newdec RPAREN Z;
Z: BEG statement END ;
statement : statement statement_ SEMI| ;
statement_: dec | assignment | return_ ;
return_ : RET exp  ;
exp : exp op var {if(typecheck($1,$3)){ $$=$3;} } | var {$$=$1;} ;
var : ICONST {$$=INT_TYPE}| FCONST {$$=REAL_TYPE} | ID { if(idcheck($1)){$$=gettype($1);}} |CCONST {$$=CHAR_TYPE}   ;
op : ADDOP | SUBOP | MULOP | DIVOP | EQUOP | LT | GT | MOD ;
dec : type ID ASSIGN exp  { insert($2 , $1); if(typecheck($1,$4)){$$=$1;} } 
	| type ID   { insert($2 , $1);    } ;
type : INT {$$=INT_TYPE}| FLOAT {$$=REAL_TYPE}|CHAR {$$=CHAR_TYPE;};
assignment : ID ASSIGN exp  {if(idcheck($1)){if(typecheck(gettype($1),$3)){$$=$3;}} };
newdec : ID COLON type  {if(idcheck2($1)==0){insert($1 , $3);}};
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
