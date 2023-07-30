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



%token INT FLAOT CHAR INCOP
%token ADDOP SUBOP MULOP DIVOP EQUOP LT GT ID
%token LPAREN RPAREN LBRACE RBRACE SEMI ASSIGN FUNCTION RET BEG MOD COLON
%token FCONST END ICONST
%token CCONST  

%type<str_val> ID

%type<int_val> type  T exp
 



%left LT GT  			/*LT GT has lowest precedence*/
%left ADDOP SUBOP
%left MULOP DIVOP
%left MOD 			/*MULOP has highest precedence*/

%start code

%%
code : code code_ | ;
code_ : dec SEMI | assignment SEMI ;
dec : type ID ASSIGN exp { insert($2 , $1 ); typecheck ( gettype($2) ,$1 ) ; } 
	| type ID { insert($2 , $1 ); } ;
exp : exp op T { $$= typecheck( $1 , $3) ;  } 
	| exp INCOP { $$ = $1 ;} 
	| T { $$ = $1 ; } ;
T : ID  { $$ = gettype($1) ;} 
	| ICONST  { $$ = INT_TYPE ;} 
	| FCONST  { $$ = REAL_TYPE ;}  
	| CCONST { $$ = CHAR_TYPE ;};  
op : ADDOP | SUBOP | MULOP |DIVOP ;
assignment : ID ASSIGN exp { typecheck( gettype($1) , $3 ) ;  } 
	| exp INCOP  ;
type : INT { $$ = INT_TYPE ;} 
	| CHAR  { $$ = CHAR_TYPE ;}
	| FLAOT { $$ = REAL_TYPE ;} ;

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
