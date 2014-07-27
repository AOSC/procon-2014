
.PHONY: css clean

css:
	@bundle exec compass compile public

clean:
	@rm -rf public/.sass-cache
