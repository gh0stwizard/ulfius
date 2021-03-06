#
# Example program
#
# Makefile used to build the software
#
# Copyright 2017 Nicolas Mora <mail@babelouest.org>
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the MIT License
#
# This library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#
CC=gcc
ULFIUS_LOCATION=../../src
ULFIUS_INCLUDE=../../include
EXAMPLE_INCLUDE=../include

orcania_INCLUDE ?= $(shell pkg-config --cflags liborcania)
orcania_LIBS ?= $(shell pkg-config --libs liborcania)

CFLAGS+=-c -Wall -I$(ULFIUS_INCLUDE) $(orcania_INCLUDE) -I$(EXAMPLE_INCLUDE) -D_REENTRANT $(ADDITIONALFLAGS)
LIBS=-L$(LIBYDER_LOCATION) -lc -lulfius $(orcania_LIBS) -L$(ULFIUS_LOCATION)

ifndef YDERFLAG
LIBS+= -lyder
endif

all: multiple_callbacks_example

clean:
	rm -f *.o multiple_callbacks_example valgrind.txt

debug: ADDITIONALFLAGS=-DDEBUG -g -O0

debug: multiple_callbacks_example

../../src/libulfius.so:
	cd $(ULFIUS_LOCATION) && $(MAKE) debug JANSSONFLAG=1 CURLFLAG=1 GNUTLSFLAG=1

multiple_callbacks_example.o: multiple_callbacks_example.c
	$(CC) $(CFLAGS) multiple_callbacks_example.c -DDEBUG -g -O0

multiple_callbacks_example: ../../src/libulfius.so multiple_callbacks_example.o
	$(CC) -o multiple_callbacks_example multiple_callbacks_example.o $(LIBS)

test: multiple_callbacks_example
	LD_LIBRARY_PATH=$(ULFIUS_LOCATION):${LD_LIBRARY_PATH} ./multiple_callbacks_example
