PROGRAM_FILE=hello
OBJECT_FILES= main.o \
	      foo.o

All:	$(PROGRAM_FILE)

%.o:	%.cpp
	clang++ -c -pedantic $<

$(PROGRAM_FILE):	$(OBJECT_FILES)
	clang++ -o $(PROGRAM_FILE) $(OBJECT_FILES)

test:	$(PROGRAM_FILE)
	./$(PROGRAM_FILE)
	
clean:
	rm -f $(OBJECT_FILES) $(PROGRAM_FILE) *~
