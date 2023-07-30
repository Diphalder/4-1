%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
    #include "symtab.c"
    #include "codeGen.c"
	void yyerror();
	extern int lineno;
	extern int yylex();

    //START, HALT, LD_INT, LD_VAR, STORE, SCAN_INT_VALUE, PRINT_INT_VALUE, ADD,SUB
    //gen_code(enum code_ops op, int arg)
    //void insert(char* name, int type);
    //list_t* search(char *name);
    //int idcheck(char* name);
    //int gettype(char *name);
    //int typecheck(int type1, int type2);

%}

%union
{
    char str_val[100];
    int int_val;
}

%token PRINT SCAN
%token ADDOP SUBOP MULOP DIVOP EQUOP LT GT
%token LPAREN RPAREN LBRACE RBRACE SEMI ASSIGN
%token<str_val> ID
%token<int_val> ICONST
%token<int_val> INT

%left LT GT /*LT GT has lowest precedence*/
%left ADDOP 
%left MULOP /*MULOP has lowest precedence*/

%type<int_val> type 

%start program

%%
program :{ gen_code(START,-1) ;} code { gen_code(HALT,-1);} ;
code : code  stmnt | ;
stmnt : assign SEMI | dec SEMI | print SEMI| scan SEMI ;
dec : type ID { insert($2,$1);} | type ID ASSIGN ICONST { insert($2,$1); int add = idcheck($2); if(add!=-1){gen_code(LD_INT,$4); gen_code(STORE ,add);}else{ yyerror () ;}   };
type : INT { $$=$1 ;};  
exp: exp ADDOP exp { gen_code(ADD,-1); } 
    | exp SUBOP exp { gen_code(SUB,-1);}  
    | T  ;

T : ID {  int ad = idcheck($1);
    if(ad!=-1)
    {
        gen_code(LD_VAR,ad);
    }
    else
    {
        yyerror ();
    }
     } | ICONST { gen_code(LD_INT,$1);}  ;

assign : ID ASSIGN exp { int add = idcheck($1); if(add!=-1){gen_code(STORE ,add);}else{ yyerror () ;}   }; ;
print : PRINT  LPAREN ID RPAREN {  if(idcheck($3)!=-1)
{
    gen_code(PRINT_INT_VALUE, idcheck($3));
  

}
  else
    {
        yyerror ();

    } };
scan : SCAN LPAREN ID RPAREN
{
    if(idcheck($3)!=-1)
{
    gen_code(SCAN_INT_VALUE, idcheck($3));
    

}
else
    {
        yyerror ();

    }

}  ;
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

    printf("============= INTERMEDIATE CODE===============\n");
    print_code();

    printf("============= ASM CODE===============\n");
    print_assembly();

	return 0;
}
