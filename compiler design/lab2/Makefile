main:
	flex prog1.l
	gcc lex.yy.c
	a.exe <input.txt >output.txt
m1:
	flex prog2.l
	gcc lex.yy.c
	a.exe <input.txt >output.txt
m3:
	flex prog3.l
	gcc lex.yy.c
	a.exe 
m4:
	flex prog4.l
	gcc lex.yy.c
	a.exe
m5:
	flex p5.l
	gcc lex.yy.c
	a.exe 
m6:
	bison -d p5.y 
	flex p5.l
	gcc lex.yy.c p5.tab.c
	a.exe <input.txt