MAIN_PROGRAM=hello
BUILD_DIR=_build

All:	$(MAIN_PROGRAM)

$(MAIN_PROGRAM):	$(BUILD_DIR)
	@echo "invoking cmake..."
	cd $(BUILD_DIR) && cmake -G Ninja ../

$(BUILD_DIR):
	mkdir $(BUILD_DIR)

test:	$(MAIN_PROGRAM)
	./$(MAIN_PROGRAM)
	
clean:
	rm -f $(MAIN_PROGRAM) *~ .*~
	rm -rf $(BUILD_DIR)

PROJECT_FOLDER=$(shell basename $(shell pwd))
backup:
	tar -czf \
	"../$(PROJECT_FOLDER)--$(shell date +%Y-%m-%d--%H-%M-%S).tar.gz" \
	-C ../ "$(PROJECT_FOLDER)"
