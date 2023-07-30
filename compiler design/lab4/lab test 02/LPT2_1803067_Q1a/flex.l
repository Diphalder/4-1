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
STRING    \"{print}*\"
%%

"//".*        { } 

"int"       { printf("INT ->  %s \n",yytext); }
"double"    {printf("DOUBLE ->  %s \n",yytext); }
"char"		{printf("CHAR ->  %s \n",yytext);  }

"if"		{printf("IF ->  %s \n",yytext);;}
"else"		{printf("ELSE ->  %s \n",yytext);}

"+"       {printf("ADDOP ->  %s \n",yytext);  }
"-"       {printf("SUBOP ->  %s \n",yytext); }
"*"       {printf("MULOP ->  %s \n",yytext);  }
"/"       {printf("DIVOP ->  %s \n",yytext);  }
"=="      {printf("EQUOP ->  %s \n",yytext);  }
">"       {printf("GT ->  %s \n",yytext); }
"<"       {printf("LT ->  %s \n",yytext); }

"("       {printf("LPAREN ->  %s \n",yytext); }
")"       {printf("RPAREN ->  %s \n",yytext);  }
"{"       {printf("LBRACE ->  %s \n",yytext); }
"}"       {printf("RBRACE ->  %s \n",yytext);  }
";"       {printf("SEMI ->  %s \n",yytext); }
"="       { printf("ASSIGN ->  %s \n",yytext);}

{ID}        {printf("ID ->  %s \n",yytext);  } // {strcpy(yylval.str_val, yytext);  return ID; }
{ICONST}    {printf("ICONST ->  %s \n",yytext); }
{FCONST}    {printf("FCONST ->  %s \n",yytext); }
{CCONST}    { printf("CCONST ->  %s \n",yytext);}
{STRING}    {printf("STRING ->  %s \n",yytext);}

"\n"        {  }
[ \t\r\f]+  

.       { printf("Unrecognized character"); }
%%

int main()
{
    yylex();
    return 0;
}