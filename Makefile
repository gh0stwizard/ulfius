#
# Ulfius Framework
#
# Makefile used to build all programs
#
# Copyright 2014-2017 Nicolas Mora <mail@babelouest.org>
#
# This program is free software; you can redistribute it and/or
# modify it under the terms of the MIT License
#
# This library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
#

LIBULFIUS_LOCATION=./src
EXAMPLES_LOCATION=./example_programs
UWSC_LOCATION=./tools/uwsc
TESTS_LOCATION=./test

all: library uwsc

library:
	$(MAKE) -C $(LIBULFIUS_LOCATION) $*

uwsc:
	$(MAKE) -C $(UWSC_LOCATION) $*

debug: debug-library debug-uwsc

debug-library:
	$(MAKE) -C $(LIBULFIUS_LOCATION) debug $*

debug-uwsc:
	$(MAKE) -C $(UWSC_LOCATION) debug $*

clean:
	$(MAKE) -C $(LIBULFIUS_LOCATION) clean
	$(MAKE) -C $(EXAMPLES_LOCATION) clean
	$(MAKE) -C $(UWSC_LOCATION) clean
	$(MAKE) -C $(TESTS_LOCATION) clean

examples:
	$(MAKE) -C $(EXAMPLES_LOCATION) $*

install: install-library install-uwsc

install-library: library
	$(MAKE) -C $(LIBULFIUS_LOCATION) install

static-install-library: library
	$(MAKE) -C $(LIBULFIUS_LOCATION) static-install

install-uwsc: uwsc
	$(MAKE) -C $(UWSC_LOCATION) install

uninstall:
	$(MAKE) -C $(LIBULFIUS_LOCATION) uninstall

check:
	$(MAKE) -C $(TESTS_LOCATION)

doxygen:
	doxygen doc/doxygen.cfg
