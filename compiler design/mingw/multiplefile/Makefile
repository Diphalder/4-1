m1:
	gcc -o hw hw.c
m2:
	gcc -c -o hellomake.o hellomake.c
	gcc -c -o hellofun.o hellofun.c
	gcc -o hello hellomake.o hellofun.o
clean:
	rm -f *.o
m3:
	gcc -c -o ./lib/hellomake.o ./src/hellomake.c -I./include
	gcc -c -o ./lib/hellofun.o ./src/hellofun.c -I./include
	gcc -o .built/hello ./lib/hellomake.o ./lib/hellofun.o -I./include
