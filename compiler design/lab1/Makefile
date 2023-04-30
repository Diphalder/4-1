all:
	 gcc text.c -o newfile -std=c99

m1:
	g++ hi.cpp -o hi.exe
	g++ -E hi.cpp > hi.i
	g++ -S -masm=intel hi.i
	g++ -c -o hi.o hi.cpp
	objdump -M  intel -d hi.exe > hi.dump