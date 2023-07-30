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


%token  INT  FLOAT   INPUT_FUNC  PRINT_FUNC  IF  ELIF  ELSE  ADDOP  SUBOP  MULOP  DIVOP  EQUOP  GT  LT 
%token LPAREN  RPAREN  LBRACE  RBRACE  SEMI COLON ASSIGN  ID  ICONST  FCONST  STRING 

%left LT GT  			
%left ADDOP SUBOP
%left MULOP DIVOP

%type<str_val> ID 
%type<int_val> data  type exp condi

						

%start code_

%%
code_ : code_ code | ;
code : ifelse  | printfuc | dec | assignment ;
printfuc : PRINT_FUNC LPAREN STRING RPAREN ;
assignment : ID ASSIGN exp { typecheck(gettype($1) , $3) ;} ;
dec : type ID{ insert($2, $1);}  |type ID  ASSIGN exp { insert($2, $1) ;  typecheck($1,$4);  } | type ID ASSIGN  INPUT_FUNC LPAREN STRING RPAREN  { insert($2, $1) ; };
type : INT { $$ = INT_TYPE ;}| FLOAT  { $$ = REAL_TYPE ;};
exp : exp op data { $$ = typecheck( $1, $3) ;} | data { $$ = $1 ;} ;
op : MULOP | DIVOP | ADDOP |SUBOP ;
data : ICONST { $$ = INT_TYPE ;} | FCONST { $$ = REAL_TYPE ;} | ID { $$ = gettype($1) ;} ;
condi : condi cop data { $$ = typecheck( $1, $3) ;} | data { $$ = $1 ;}  ;
cop : EQUOP | GT | LT ;
ifelse : IF condi COLON  code_ | IF condi COLON  code_ ELSE COLON  code_ |  IF condi COLON  code_ ELIF condi COLON  code_ ELSE COLON  code_ ;
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
