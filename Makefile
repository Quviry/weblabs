all:
	bundle exec rake

lint:
	bundle exec rubocop

update:
	bundle install


list:
	@find . -iname controls.rb

format:
	bundle exec rubocop -A
