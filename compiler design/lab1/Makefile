all:
	 gcc text.c -o newfile -std=c99

m1:
	g++ hi.cpp -o hi.exe
	g++ -E hi.cpp > hi.i
	g++ -S -masm=intel hi.i
	g++ -c -o hi.o hi.cpp
	objdump -M  intel -d hi.exe > hi.dump
	hi.exe
m2:
	gcc text.c -o text.exe
	gcc -E text.c > text.i
	gcc -S -masm=intel text.i
	gcc -c -o text.o text.c
	objdump -M  intel -d text.exe > text.dump
	text.exe