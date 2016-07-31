.PHONY: all clean build run test

all: clean test 

clean: 
	rm -rf build

build:
	ponyc -p src -o build src
	mv build/src build/ponyray

run:
	./build/ponyray

test:
	ponyc -p src --debug -o build/math src/math/tests 
	./build/math/tests
