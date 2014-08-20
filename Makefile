
.PHONY: css clean js fontcustom

js:
	@cp \
		bower_components/jquery/dist/jquery.min.js \
		bower_components/jQuery.mmenu/src/js/jquery.mmenu.min.js \
		public/js-vendor/

css: fontcustom
	@bundle exec compass compile public

fontcustom: public/sass/_fontcustom.scss

public/sass/_fontcustom.scss: fontcustom.yml
	@bundle exec fontcustom compile -c $<
	@mv public/sass/fontcustom.css $@
	@echo 'build fontcustom done'

clean:
	@rm -rf \
		public/.sass-cache \
		.fontcustom-manifest.json
