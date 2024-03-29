%option noyywrap

%{
	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
	#include "parser.tab.h"

	/*
	"yytext"  contains the matched string or token.
	{printf("verb->%s\t",yytext);}
	
	"yylval"  store the semantic value of the token.
	 It is often used to pass additional information (e.g., token attributes)from the lexical analyzer to the parser.
	 %union
	{
	char str_val[100];
	int int_val;
	}
 	
	"str_val" is  represents the value  associated with an identifier token. 
	In this case, the identifier's value is being copied from "yytext" to "yylval.str_val"
	
	*/

	
	int lineno = 1; // initialize to 1
	void yyerror();
%}

alpha     [a-zA-Z_]
digit     [0-9]
alnum     {alpha}|{digit}
print     [ -~]


delim [ \t\n]
ws {delim}+


ID        {alpha}{alnum}*
ICONST    [0-9]{digit}*
FCONST    {digit}*"."{digit}+
CCONST    (\'{print}\')
%%
"//".*        { } 
"dim" { return DIM;}
"as" 	{ return AS ;}
"For" 	{ return FOR;}
"Next"	{ return NEXT;}
"To"	{ return TO;}
"integer"       { return INT; }
"float"    { return FLOAT; }
"+"       { return ADDOP; }
"-"       { return SUBOP; }
"*"       { return MULOP; }
"/"       { return DIVOP; }
"=="      { return EQUOP; }
">"       { return GT; }
"<"       { return LT; }
"%"		{ return MOD ;}

":"		 { return COLON;}

"("       { return LPAREN; }
")"       { return RPAREN; }
"{"       { return LBRACE; }
"}"       {return RBRACE; }
";"       { return SEMI; }
"="       { return ASSIGN; }

{ID}        {strcpy(yylval.str_val, yytext);  return ID;  }
{ICONST}    { return ICONST;}
{FCONST}    { return FCONST;}

"\n"        { lineno += 1; }
[ \t\r\f]+  

.       { }
%%