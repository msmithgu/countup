PUB_JS_DIR=./public/js
PUB_CSS_DIR=./public/css
STYLUS=./node_modules/.bin/stylus -c -o public/css
COFFEE=coffee -o $(PUB_JS_DIR) -c

all: js css

js:
	$(COFFEE) countup.coffee

css:
	$(STYLUS) stylus/all.styl

watch-js:
	$(COFFEE) -w countup.coffee

watch-css:
	$(STYLUS) -w stylus/all.styl

clean:
	rm $(PUB_JS_DIR)/*.js
