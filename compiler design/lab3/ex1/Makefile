main:
	bison -d bison.y 
	flex flex.l
	gcc bison.tab.c lex.yy.c
	a.exe <input.txt