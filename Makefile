MAIN_PROGRAM=hello
CC=clang
LD=clang
CFLAGS=-O0 -pedantic
LDFLAGS=-O0 -lstdc++

OBJECT_FILES= main.o \
	      foo.o

All:	$(MAIN_PROGRAM)

%.o:	%.cpp
	$(CC) -x c++ -c $(CFLAGS) $<

$(MAIN_PROGRAM):	$(OBJECT_FILES)
	$(LD) $(LDFLAGS) $(OBJECT_FILES) -o $(MAIN_PROGRAM) 

test:	$(MAIN_PROGRAM)
	./$(MAIN_PROGRAM)
	
clean:
	rm -f $(OBJECT_FILES) $(MAIN_PROGRAM) *~

PROJECT_FOLDER=$(shell basename $(shell pwd))
backup:
	tar -czf \
	"../$(PROJECT_FOLDER)--$(shell date +%Y-%m-%d--%H-%M-%S).tar.gz" \
	-C ../ "$(PROJECT_FOLDER)"
