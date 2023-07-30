%option noyywrap

%{
    //roll : 1803067
#include "bison.tab.h"
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
"dim" {printf("%s -> DIM  \n") ;  return DIM;}
"as" 	{printf("%s ->  AS \n") ; return AS ;}
"For" 	{printf("%s -> 	FOR   \n") ; return FOR;}
"Next"	{printf("%s ->  NEXT \n") ; return NEXT;}
"To"	{printf("%s ->  TO \n") ; return TO;}
"integer"       {printf("%s -> INT   \n") ; return INT; }
"float"    {printf("%s ->  FLOAT  \n") ; return FLOAT; }
"+"       {printf("%s -> ADDOP  \n") ; return ADDOP; }
"-"       {printf("%s -> SUBOP  \n") ; return SUBOP; }
"*"       {printf("%s -> MULOP  \n") ; return MULOP; }
"/"       {printf("%s -> DIVOP  \n") ; return DIVOP; }
"=="      {printf("%s -> EQUOP  \n") ; return EQUOP; }
">"       {printf("%s ->  GT  \n") ; return GT; }
"<"       {printf("%s ->  LT \n") ; return LT; }
"%"		{printf("%s ->  MOD \n") ; return MOD ;}

":"		 {printf("%s ->  COLON \n") ; return COLON;}

"("       {printf("%s ->  LPAREN \n") ; return LPAREN; }
")"       {printf("%s -> RPAREN  \n") ; return RPAREN; }
"{"       {printf("%s ->  LBRACE \n") ; return LBRACE; }
"}"       {printf("%s ->  RBRACE \n") ; return RBRACE; }
";"       {printf("%s ->  SEMI \n") ; return SEMI; }
"="       {printf("%s -> ASSIGN  \n") ; return ASSIGN; }

{ID}        {printf("%s ->  ID \n") ; strcpy(yylval.str_val, yytext);  return ID;  }
{ICONST}    {printf("%s ->  ICOSNT \n") ; return ICONST;}
{FCONST}    {printf("%s ->  FCONST \n") ; return FCONST;}

"\n"        { lineno += 1; }
[ \t\r\f]+  

.       { }
%%