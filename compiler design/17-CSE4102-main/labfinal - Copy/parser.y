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
    LD_INT,               gen_code(LD_INT, data);     push data at OP-stack
    LD_VAR,               gen_code(LD_VAR, address);  load from V-stack at address , push at OP-stack
    STORE,                gen_code(STORE, address);   Load operation stack top data , store varible stack at Address
    SCAN_INT_VALUE,       gen_code(SCAN_INT_VALUE, address);       Scan data, Store V-stack at address           
    PRINT_INT_VALUE,      gen_code(PRINT_INT_VALUE, address);      load data from V-stack at address , print 
    ADD,                  gen_code(ADD, -1)           pop 2 data from operation stack , ADD them , STORE operation-stack 
    SUB,                  gen_code(SUB, -1)
    MUL,                  gen_code(MUL, -1)
    GT_OP,                gen_code(GT_OP,gen_label());
    LT_OP,                gen_code(LT_OP,gen_label());
    
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
    
    gen_label()
    
    */
%}

%union
{
    char str_val[100];
    int int_val;
}

%token PRINT SCAN
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

//%type<int_val> exp assignment_print_scan

%start program

%%
program: {gen_code(START, -1); insert("buffer",INT_TYPE);} code {gen_code(HALT, -1);}
code:code stmnt | ;
stmnt: dec | assign | dec_assign | whileloop | ifelse | scanfun | printfun;
dec : INT ID SEMI {
    insert($2, $1);
};
dec_assign : INT ID ASSIGN exp SEMI 
{
    insert($2, $1);
    int address = idcheck($2);
    if(address!=-1)
    {
        gen_code(STORE,address);
    }
    else{
        yyerror ();
    }
};
assign: ID ASSIGN exp SEMI{
    int address = idcheck($1);
    if(address!=-1)
    {
        gen_code(STORE,address);
    }
    else{
        yyerror ();
    }
} ;
whileloop : WHILE {
        $1=gen_label();
        gen_code(WHILE_LABEL,$1);
    } LPAREN condi RPAREN {
        gen_code(WHILE_START,$1);
    } body {
        gen_code(WHILE_END,$1);
    } ;
ifelse : IF{  $1=gen_label();
    } LPAREN condi RPAREN {
        gen_code(IF_START,$1);
    } body ELSE 
    {
        gen_code(ELSE_START,$1);
    } body 
    {
        gen_code(ELSE_END,gen_label());
    } ;
body : LBRACE code RBRACE ;
exp :exp ADDOP exp { gen_code(ADD,-1);}
    |exp SUBOP exp{ gen_code(SUB,-1);}
    |exp MULOP exp{ gen_code(MUL,-1);}
    |T ;
condi : T GT T 
    {
        gen_code(GT_OP,gen_label());
    }
    | T LT T 
    {
        gen_code(LT_OP,gen_label());
    };
T : ID {
        int address = idcheck($1);
        if(address!=-1)
        {
            gen_code(LD_VAR,address);
        }
        else{
            yyerror ();
        }
    } 
    | ICONST{
        gen_code(LD_INT , $1);
    } ;
printfun : PRINT LPAREN ID RPAREN SEMI
    {   int address = idcheck($3);
        if(address!=-1)
        {
            gen_code(PRINT_INT_VALUE,address);
        }
        else{
            yyerror ();
        }
    }
    |PRINT LPAREN ICONST RPAREN SEMI
    {

        int address = idcheck("buffer");
        gen_code(LD_INT,$3);
        gen_code(STORE,address);
        gen_code(PRINT_INT_VALUE,address);

    };
scanfun: SCAN LPAREN ID RPAREN SEMI 
    {   int address = idcheck($3);
        if(address!=-1)
        {
            gen_code(SCAN_INT_VALUE,address);
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
