# makefile for the buildhdr c single file header library utility

.POSIX:

.PHONY: clean all debug

BUILD_DIR = build

CC=clang
DFLAGS=-fsanitize=address -g3 -O0 -DDEBUG
CFLAGS=-Wall -pedantic-errors -O2 -std=c18
# LDFLAGS=-lm
LDFLAGS=

.PHONY: debug
debug: CFLAGS+=$(DFLAGS)
debug: all

all: buildhdr

clean:
	rm -rf $(BUILD_DIR)/*

buildhdr.o: buildhdr.c
	$(CC) $(CFLAGS) -o $(BUILD_DIR)/buildhdr.o -c buildhdr.c


buildhdr: buildhdr.o
	$(CC) $(CFLAGS) -o $(BUILD_DIR)/buildhdr $(BUILD_DIR)/buildhdr.o $(LDFLAGS)
