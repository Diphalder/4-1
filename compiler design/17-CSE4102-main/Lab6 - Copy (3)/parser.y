%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
    #include "symtab.c"
    #include "codeGen.c"
	void yyerror();
	extern int lineno;
	extern int yylex();
    /*
    START, 
    HALT, 
    LD_INT, 
    LD_VAR, 
    STORE, 
    SCAN_INT_VALUE, 
    PRINT_INT_VALUE, 
    ADD,
    MUL
    GT_OP,
    LT_OP,
    IF_START,
    ELSE_START,
    ELSE_END,
    WHILE_LABEL,
    WHILE_START,
    WHILE_END


    UNDEF_TYPE 0
    INT_TYPE 1
    REAL_TYPE 2
    CHAR_TYPE 3

    void insert(char* name, int type);
    list_t* search(char *name);
    int idcheck(char* name);
    int gettype(char *name);
    int typecheck(int type1, int type2); 
    
    */
%}

%union
{
    char str_val[100];
    int int_val;
}

%token INPUT OUTPUT
%token ADDOP SUBOP MULOP DIVOP EQUOP LT GT
%token LPAREN RPAREN LBRACE RBRACE SEMI ASSIGN ELSE 
%token<str_val> ID
%token<int_val> ICONST
%token<int_val> INT
%token<int_val> IF
%token<int_val> WHILE

%left LT GT /*LT GT has lowest precedence*/
%left ADDOP 
%left MULOP /*MULOP has lowest precedence*/

%type<int_val> exp 

%start program

%%
program: {gen_code(START, -1); insert("buffer" , INT_TYPE) ;} code {gen_code(HALT, -1);}
code: code st | st;
st : dec | scan | print ;
dec : INT ID ASSIGN exp
    {
        insert($2,$1);
        int path = idcheck($2);
        if(path!=-1)
        {
            gen_code(STORE,path);
        }
        else
        {
        yyerror ();

        }



    } ;
exp : exp ADDOP exp {
     gen_code(ADD,-1) ;}
    | exp SUBOP exp  { gen_code(SUB,-1) ;}
    | scan 
    | ICONST {
        gen_code(LD_INT, $1);
    }
    | ID {
        int path = idcheck($1);
        if(path!=-1)
        {
            gen_code(LD_VAR,path);

        }else{
              yyerror ();

        }

    };
scan : INPUT LPAREN RPAREN {
    gen_code(SCAN_INT_VALUE,idcheck("buffer"));
    gen_code(LD_VAR,idcheck("buffer"));
};
print : OUTPUT LPAREN ID RPAREN 
    {
        int path = idcheck($3);
        if(path!=-1)
        {
            gen_code(PRINT_INT_VALUE,path);
        }
        else{
            yyerror ();
        }
    };

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
