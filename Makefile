PUB_JS_DIR=./public/js
PUB_CSS_DIR=./public/css
STYLUS=./node_modules/.bin/stylus

all: js css

js:
	coffee -o $(PUB_JS_DIR) -c countup.coffee

css:
	$(STYLUS) -o public/css stylus/all.styl

watch:
	coffee -w -o $(PUB_JS_DIR) -c countup.coffee

clean:
	rm $(PUB_JS_DIR)/*.js
