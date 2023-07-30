%option noyywrap


%{

// roll : 1803067

%}
alpha     [a-zA-Z_]
digit     [0-9]
alnum     {alpha}|{digit}
print     [ -~]

ID        {alpha}{alnum}*
ICONST    [0-9]{digit}*
FCONST    {digit}*"."{digit}+
CCONST    (\'{print}\')
%%
"//".*        { } 
"dim" {printf("%s -> DIM  \n",yytext) ;  }
"as" 	{printf("%s ->  AS \n",yytext) ; }
"For" 	{printf("%s -> 	FOR   \n",yytext) ; }
"Next"	{printf("%s ->  NEXT \n",yytext) ; }
"To"	{printf("%s ->  TO \n",yytext) ; }
"integer"       {printf("%s -> INT   \n",yytext) ;  }
"float"    {printf("%s ->  FLOAT  \n",yytext) ;  }
"+"       {printf("%s -> ADDOP  \n",yytext) ; }
"-"       {printf("%s -> SUBOP  \n",yytext) ; }
"*"       {printf("%s -> MULOP  \n",yytext) ;}
"/"       {printf("%s -> DIVOP  \n",yytext) ; }
"=="      {printf("%s -> EQUOP  \n",yytext) ; }
">"       {printf("%s ->  GT  \n",yytext) ;  }
"<"       {printf("%s ->  LT \n",yytext) ;  }
"%"		{printf("%s ->  MOD \n",yytext) ;}

":"		 {printf("%s ->  COLON \n",yytext) ; }

"("       {printf("%s ->  LPAREN \n",yytext) ;}
")"       {printf("%s -> RPAREN  \n",yytext) ;  }
"{"       {printf("%s ->  LBRACE \n",yytext) ;  }
"}"       {printf("%s ->  RBRACE \n",yytext) ;}
";"       {printf("%s ->  SEMI \n",yytext) ;  }
"="       {printf("%s -> ASSIGN  \n",yytext) ;  }

{ID}        {printf("%s ->  ID \n",yytext) ;  }
{ICONST}    {printf("%s ->  ICOSNT \n",yytext) ; }
{FCONST}    {printf("%s ->  FCONST \n",yytext) ;}
"\n"        {  }
[ \t\r\f]+  
.       { }
%%

int main()
{
    yylex();
    return 0;
}