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

    LOOP_INI
    LOOP_START
    LOOP_END            


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
%token ADDOP SUBOP MULOP DIVOP EQUOP LT GT DO WHILE
%token LPAREN RPAREN LBRACE RBRACE SEMI ASSIGN ELSE 
%token<str_val> ID
%token ICONST
%token  INT SINGLE  IF AS FOR TO NEXT THEN ENDIF DIM
%type <int_val> INT SINGLE IF FOR type ICONST DO


%left LT GT /*LT GT has lowest precedence*/
%left ADDOP 
%left MULOP /*MULOP has lowest precedence*/


%start program

%%
program: {gen_code(START, -1);} code {gen_code(HALT, -1);}
code:code stmnt | ;
stmnt : dec | assign |  ifelse |printfun |forlp  | dowhile;
dec : DIM ID AS type {
    insert($2,$4);
} ;
type : SINGLE {$$=$1;} | INT{$$=$1;} ;
assign : ID ASSIGN exp {

    int address=idcheck($1);
    if(address!=-1)
    {
        gen_code(STORE,address);
    }
    else{
        yyerror();
    }
};
exp : exp ADDOP exp {gen_code(ADD,-1);}
    |exp SUBOP exp {gen_code(SUB,-1);}
    | T ;

T : ICONST {
    gen_code(LD_INT,$1);
}| ID {
    int address=idcheck($1);
    if(address!=-1)
    {
        gen_code(LD_VAR,address);
    }
    else{
        yyerror();
    }
};
ifelse: IF {$1=gen_label();} condi THEN { gen_code(IF_START,$1);} code ENDIF { gen_code(ELSE_START,$1); gen_code(ELSE_END,$1);}  ;
condi : T GT T {
    gen_code(GT_OP,gen_label());
} |T LT T {
    gen_code(LT_OP,gen_label());
}
; 
printfun : PRINT LPAREN ID RPAREN {

        int address=idcheck($3);
        if(address!=-1)
        {
            gen_code(PRINT_INT_VALUE,address);
        }
        else{
            yyerror();
        }

} ;
forlp : FOR ID ASSIGN ICONST TO ICONST
    { 
        $1=gen_label();
        int address=idcheck($2);
        if(address!=-1)
        {
            gen_code(LD_INT,$4);
            gen_code(STORE,address);
            gen_code(LOOP_INI,$1);
	        gen_code(LD_VAR,address);
            gen_code(LD_INT,$6);
            gen_code(LTE_OP,address);
	        gen_code(LOOP_START,$1);
        }
        else{
            yyerror();
        }
    } code NEXT ID {
        int address=idcheck($2);
        if(address!=-1)
        {   gen_code(LD_INT,1);
            gen_code(LD_VAR,address);
            gen_code(ADD,-1);
 	        gen_code(STORE,address);
        }
        else{
            yyerror();
        }
            gen_code(LOOP_END,$1);
    }  ;

dowhile: DO { $1 = gen_label() ; gen_code(LOOP_INI,$1);} code WHILE LPAREN condi RPAREN {   gen_code(LOOP_START,$1) ; gen_code(LOOP_END,$1) ;}  ;
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
