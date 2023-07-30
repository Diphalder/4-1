%option noyywrap


%{


%}
alpha     [a-zA-Z]
digit     [0-9]
alnum     {alpha}|{digit}
print     [ -~]

ID        {alpha}{alnum}*
ICONST    [0-9]{digit}*
FCONST    {digit}*"."{digit}+
CCONST    (\'{print}\')
%%

"//".*        { } 
"function"	{printf("function ");}
"end"	{printf("end ");}
"return"	{printf("return ");}
"begin"		{printf("begin ");}
"int"       {printf("int ");}
"float"    {printf("float ");}
"char"      {printf("char ");}


"+"       {printf("+ ");}
"-"        {printf("- ");}
"*"        {printf("* ");}
"/"        {printf("/ ");}
"=="       {printf("== ");}
">"        {printf("> ");}
"<"        {printf("< ");}
"%"		 {printf("mod ");}
":"		 {printf("colon ");}
"("        {printf(") ");}
")"       {printf("( ");}
";"        {printf("semi ");}
"="        {printf("= ");}
"\'"		{ printf("quote ");}
{ID}         {printf("id ");}
{ICONST}     {printf("intdata ");}
{FCONST}     {printf("fdat ");}
{CCONST}     {printf("cdata ");}
({alpha}|{digit})?   {printf("char ");}
.       {}
%%

int main()
{
    yylex();
    return 0;
}