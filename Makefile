install:
	bundle install

lint:
	rubocop .

	.PHONY: test