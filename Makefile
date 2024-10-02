# makefile for the buildhdr c single file header library utility

.POSIX:

.PHONY: clean all run


CC=clang
# CFLAGS=-Wall -g3 -std=c18
# CFLAGS=-fsanitize=address -Wall -g3 -O0 -std=c18
CFLAGS=-Wall -O2 -std=c18
# LDFLAGS=-lm
LDFLAGS=


clean:
	rm -rf *.o *.dSYM/ buildhdr 


all: buildhdr


buildhdr.o: buildhdr.c
	$(CC) $(CFLAGS) -c buildhdr.c


buildhdr: buildhdr.o
	$(CC) $(CFLAGS) -o buildhdr buildhdr.o $(LDFLAGS)
