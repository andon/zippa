BIN=node_modules/.bin

MOCHA_ARGS= --compilers js:babel-register
MOCHA_TARGET=src/**/test*.js

clean:
	rm -rf lib

build: clean
	$(BIN)/babel src --out-dir lib
	webpack --optimize-minimize

test: lint
	NODE_ENV=test $(BIN)/mocha $(MOCHA_ARGS) $(MOCHA_TARGET) --prof

test-watch: lint
	NODE_ENV=test $(BIN)/mocha $(MOCHA_ARGS) -w $(MOCHA_TARGET) --max-old-space-size=4000 --prof

lint:
	$(BIN)/eslint src


PHONY: build clean test test-watch lint