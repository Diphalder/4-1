%option noyywrap

%{
	#define UNDEF_TYPE 0
	#define INT_TYPE 1
	#define REAL_TYPE 2
	#define CHAR_TYPE 3
	#define SINGLE_TYPE 4
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
	#include "parser.tab.h"
	
	int lineno = 1; // initialize to 1
	void yyerror();
%}

alpha     [a-zA-Z]
digit     [0-9]
alnum     {alpha}|{digit}
print     [ -~]

ID        {alpha}{alnum}*
ICONST    [0-9]{digit}*
%%

"//".*        { } 

"INT"       {yylval.int_val=INT_TYPE; return INT; }
"SUB"			{ return RETTYPE; }
"suru"			{ return SURU ;}
"sesh"			{ return SESH ;}
"-->"			{  return CIN ;}
"<--"			{ return COUT; }


"jog"       { return ADDOP; }
"-"       { return SUBOP; }
"*"       { return MULOP; }
"/"       { return DIVOP; }
"=="      { return EQUOP; }
">"       { return GT; }
"<"       { return LT; }

"("       { return LPAREN; }
")"       { return RPAREN; }
"{"       { return LBRACE; }
"}"       { return RBRACE; }
";"       { return SEMI; }
"soman"       { return ASSIGN; }
"print"       { return PRINT; }
"scan"       { return SCAN; }

{ID}        {strcpy(yylval.str_val, yytext); return ID;}
{ICONST}    {yylval.int_val=atoi(yytext); return ICONST;}

"\n"        { lineno += 1; }
[ \t\r\f]+  

.       { yyerror("Unrecognized character"); }
