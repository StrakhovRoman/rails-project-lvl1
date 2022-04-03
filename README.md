# Form Generator

Create forms in site templates
***
[![CI](https://github.com/StrakhovRoman/rails-project-lvl1/actions/workflows/main.yml/badge.svg)](https://github.com/StrakhovRoman/rails-project-lvl1/actions/workflows/main.yml)
[![hexlet-check](https://github.com/StrakhovRoman/rails-project-lvl1/actions/workflows/hexlet-check.yml/badge.svg)](https://github.com/StrakhovRoman/rails-project-lvl1/actions/workflows/hexlet-check.yml)
[![Maintainability](https://api.codeclimate.com/v1/badges/2d0b028433e3cc094c78/maintainability)](https://codeclimate.com/github/StrakhovRoman/rails-project-lvl1/maintainability)
[![Test Coverage](https://api.codeclimate.com/v1/badges/2d0b028433e3cc094c78/test_coverage)](https://codeclimate.com/github/StrakhovRoman/rails-project-lvl1/test_coverage)
[![Ruby Style Guide](https://img.shields.io/badge/code_style-rubocop-brightgreen.svg)](https://github.com/rubocop-hq/rubocop)
***

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'hexlet_code'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install hexlet_code

## Usage
```ruby
User = Struct.new(:id, :name, :job)

user = User.new

html = HexletCode.form_for user, url: '/users' do |f|
  f.input :name
  f.input :job, as: :text
  f.submit
end

puts html
# Will be displayed:
# <form action="/users" method="post">
#   <label for="name">Name</label>
#   <input name="name" value="" type="text">
#   <label for="job">Job</label>
#   <textarea cols="20" rows="40" name="job"></textarea>
#   <input type="submit" value="Create">
# </form>
```

