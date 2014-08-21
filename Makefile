JADE=./node_modules/.bin/jade
PAGE_SRC = views/index.jade \
           views/downloads.jade \
           views/contest.jade

PAGE = $(patsubst views/%.jade, public/%.html, $(PAGE_SRC))
JADE_OPTS = --path views/ --out public/

.PHONY: css clean js fontcustom html watch-html

html: $(PAGE)

watch-html:
	$(JADE) watch $(JADE_OPTS) $(PAGE_SRC)

public/%.html: views/%.jade
	$(JADE) $(JADE_OPTS) $<

js:
	@cp \
		bower_components/jquery/dist/jquery.min.js \
		bower_components/jQuery.mmenu/src/js/jquery.mmenu.min.js \
		public/js-vendor/

css: public/css/main.css

public/css/main.css: fontcustom
	@bundle exec compass compile public

fontcustom: public/sass/_fontcustom.scss

public/sass/_fontcustom.scss: fontcustom.yml public/svg
	@bundle exec fontcustom compile -c $<
	@mv public/sass/fontcustom.css $@
	@echo 'build fontcustom done'

clean:
	@rm -rf \
		public/.sass-cache \
		.fontcustom-manifest.json \
		public/css/main.css \
		$(PAGE)
