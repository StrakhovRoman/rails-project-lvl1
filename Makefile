install:
	gem install bundler -v 2.3.3
	bundle install

lint:
	bundle exec rubocop

test:
	bundle exec rake

lint-fix:
	bundle exec rubocop -A

