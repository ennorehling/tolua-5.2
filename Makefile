# makefile for tolua hierarchy

tolua:
	mkdir -p lib
	cd src/lib; make all
	cd src/bin; make all

tests:
	cd src/tests; make all

all clean:
	cd src/lib; make $@
	cd src/bin; make $@
	cd src/tests; make $@

debug:
	cd src/bin; make debug

