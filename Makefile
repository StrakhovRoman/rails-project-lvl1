install:
	gem install bundler -v 2.3.3
	bundle install

lint:
	bundle exec rubocop

lint-fix:
	bundle exec rubocop -A