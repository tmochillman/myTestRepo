MAIN_PROGRAM=helloportaudio
BUILD_DIR=_build
BIN=$(BUILD_DIR)/$(MAIN_PROGRAM)

All:	$(BIN)

$(BUILD_DIR)/CMakeCache.txt:
	@test -d $(BUILD_DIR) || mkdir $(BUILD_DIR)
	@echo "invoking cmake..."
	@(	cd $(BUILD_DIR); \
	       	cmake -G Ninja -DCMAKE_BUILD_TYPE=DEBUG ../ \
	)

$(BIN):	$(BUILD_DIR)/CMakeCache.txt
	@echo "building program"
	@cmake --build $(BUILD_DIR)

release:	$(BIN)
	@echo reconfiguring with release-flags
	cmake -DCMAKE_BUILD_TYPE=Release $(BUILD_DIR)
	@echo "rebuilding programm"
	cmake --build $(BUILD_DIR)

run:	$(BIN)
	./$(BIN)

test:	$(BIN)
	@cmake --build $(BUILD_DIR) --target test
	
clean:
	rm -f *~ .*~
	rm -rf $(BUILD_DIR)

PROJECT_FOLDER=$(shell basename $(shell pwd))
backup:
	tar -czf \
	"../$(PROJECT_FOLDER)--$(shell date +%Y-%m-%d--%H-%M-%S).tar.gz" \
	-C ../ "$(PROJECT_FOLDER)"
