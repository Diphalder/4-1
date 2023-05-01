all:
	 gcc text.c -o newfile -std=c99

m1:
	g++ code.cpp -o code.exe
	g++ -E code.cpp > code.i
	g++ -S -masm=intel code.i
	g++ -c -o code.o code.cpp
	objdump -M  intel -d code.exe > code.dump
	code.exe
m2:
	gcc code.c -o code.exe
	gcc -E code.c > code.i
	gcc -S -masm=intel code.i
	gcc -c -o code.o code.c
	objdump -M  intel -d code.exe > code.dump
	code.exe