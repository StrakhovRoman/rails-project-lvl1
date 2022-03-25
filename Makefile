install:
	gem install bundler -v 2.3.3
	bundle install

test:
	bundle exec rake

lint:
	bundle exec rubocop

lint-fix:
	bundle exec rubocop -A
