# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

gem 'bootsnap', '>= 1.4.2', require: false
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 4.1'
gem 'rails', '~> 6.0.3'
gem 'rubocop-rspec'
gem 'silvercop', '~> 1.0'

group :development, :test do
  gem 'factory_bot_rails', '~> 5.0'
  gem 'ffaker', '~> 2.11'
  gem 'pry-plus-byebug'
  gem 'pry-rails'
  gem 'rspec-rails', '~> 3.8'
  gem 'shoulda-matchers', '~> 4.0'
end

group :development do
  gem 'listen', '~> 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
