fmt:
	for file in ./src/**/*.[ch] ; do \
		clang-format -i --sort-includes $${file} ; \
	done

test-all:
	echo "TBD"

build: build-client build-node build-orch

build-client:
	mkdir -p bin
	gcc src/client/client.c -g -Wall -o bin/client

build-node:
	mkdir -p bin
	gcc src/node/node.c -g -Wall -o bin/node

build-orch:
	mkdir -p bin
	gcc -D_GNU_SOURCE src/orch/orch.c src/orch/controller.c -g -Wall -o bin/orch `pkg-config --cflags --libs libsystemd`
