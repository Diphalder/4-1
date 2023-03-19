%option noyywrap


%{
%}


digit [0-9]
letter [A-Za-z]

%%
"int" {printf("data type ->%s\t",yytext);} 
("_"|[A-Za-z])+|("_"|[A-Za-z]|{digit})*  {printf("id ->%s\t",yytext);}
(1|2|3|4|5|6|7|8|9|0)+ {printf("integer number ->%s\t",yytext);}
"=" {printf("assignment ->%s\t",yytext);} 

";" {printf("semicolon ->%s\t",yytext);} 

. {}
%%

int main()
{
    // want to detect integer number
    yylex();
    return 0;
}