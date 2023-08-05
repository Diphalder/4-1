input = input.txt
output = output.txt

main: lexer.l parser.y
	bison -d parser.y 
	flex lexer.l 
	gcc parser.tab.c lex.yy.c
	a <$(input) > output.txt

assembler:
	C:\masm32\bin\ml /c /coff /Cp dip.asm
	C:\masm32\bin\link -entry:main /subsystem:console dip.obj
	dip
	


