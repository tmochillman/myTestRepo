MAIN_PROGRAM=hello
CC=clang
#CC=g++
LD=clang
#LD=g++
CFLAGS=-O0 -pedantic
LDFLAGS=-O0 -lstdc++

OBJECT_FILES= \
	main.o \
	audio.o
	
EXTERNAL_INCLUDE_PATHS= \
	external/portaudio/include
EXTERNAL_LIBS_PATHS= \
	external/portaudio/lib
EXTERNAL_LIBS= \
	portaudio
EXTERNAL_LIBS_LDFLAGS=-lpthread -lm

All:	$(MAIN_PROGRAM)

%.cpp:	%.h
	touch $@
%.o:	%.cpp
	$(CC) -x c++ \
		$(patsubst %, -I%, $(EXTERNAL_INCLUDE_PATHS)) \
		-c $(CFLAGS) $<

$(MAIN_PROGRAM):	$(OBJECT_FILES)
	$(LD) $(OBJECT_FILES) \
		$(LDFLAGS) $(EXTERNAL_LIBS_LDFLAGS) \
	       	$(patsubst %, -L%, $(EXTERNAL_LIBS_PATHS)) \
		$(patsubst %, -l%, $(EXTERNAL_LIBS)) \
		-o $(MAIN_PROGRAM) 

test:	$(MAIN_PROGRAM)
	./$(MAIN_PROGRAM)
	
clean:
	rm -f $(OBJECT_FILES) $(MAIN_PROGRAM) *~

PROJECT_FOLDER=$(shell basename $(shell pwd))
backup:
	tar -czf \
	"../$(PROJECT_FOLDER)--$(shell date +%Y-%m-%d--%H-%M-%S).tar.gz" \
	-C ../ "$(PROJECT_FOLDER)"
