m3:
	flex prog1.l
	gcc lex.yy.c
	a.exe

m4:
	bison -d prog2.y 
	flex prog2.l
	gcc prog2.tab.c lex.yy.c
	a.exe <input.txt