
.PHONY: css clean js

js:
	@cp \
		bower_components/jquery/dist/jquery.min.js \
		bower_components/jQuery.mmenu/src/js/jquery.mmenu.min.js \
		public/js-vendor/

css:
	@bundle exec compass compile public

clean:
	@rm -rf public/.sass-cache
