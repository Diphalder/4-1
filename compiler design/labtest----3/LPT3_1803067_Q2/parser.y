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

%token PRINT SCAN LET AS
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

//%type<int_val> T 

%start program

%%
program: {gen_code(START, -1); insert("buffer",INT_TYPE); } code {gen_code(HALT, -1);}
code: code st |;
st : dec SEMI | print SEMI ;
dec : LET ID AS INT ASSIGN exp 
    { insert( $2,$4) ;

    int address=idcheck($2) ;
    if(address!=-1)
    {
        gen_code(STORE,address);
    }
    else{
        yyerror ();
    }

     };
exp : scan {


    int address=idcheck("buffer") ;
    if(address!=-1)
    {
        gen_code(SCAN_INT_VALUE,address);
        gen_code(LD_VAR,address);
    }
    else{
        yyerror ();
    }

}  
    | exp ADDOP exp { gen_code(ADD,-1);} 
    | exp SUBOP exp { gen_code(SUB,-1);} 
    | T; 
print : PRINT LPAREN ID RPAREN 
{
    int address=idcheck($3) ;
    if(address!=-1)
    {
        gen_code(PRINT_INT_VALUE,address);
    }
    else{
        yyerror ();
    }

}|PRINT LPAREN ICONST RPAREN 
{
    gen_code(LD_INT ,$3);
    int address=idcheck("buffer") ;
    if(address!=-1)
    {
        gen_code(STORE,address);
        gen_code(PRINT_INT_VALUE,address);

    }
    else{
        yyerror ();
    }
    
}

;
scan : SCAN LPAREN RPAREN ;
T : ID { 
    int address=idcheck($1) ;
    if(address!=-1)
    {
        gen_code(LD_VAR,address);
    }
    else{
        yyerror ();
    }

}| ICONST { 
    gen_code( LD_INT ,$1);
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
