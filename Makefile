install:
	gem install bundler -v 2.3.3
	bundle install

tests:
	bundle exec rake

lint:
	bundle exec rubocop

lint-fix:
	bundle exec rubocop -A

coverage:
	bundle exec rake
