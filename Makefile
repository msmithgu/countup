PUB_JS_DIR=./public/js

all: coffee

coffee:
	coffee -o $(PUB_JS_DIR) -c countup.coffee

watch:
	coffee -w -o $(PUB_JS_DIR) -c countup.coffee

clean:
	rm $(PUB_JS_DIR)/*.js
