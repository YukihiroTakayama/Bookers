# frozen_string_literal: true

source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.7'

gem 'bootsnap', '>= 1.1.0', require: false
gem 'bootstrap-sass', '~> 3.3.6'
gem 'coffee-rails', '~> 4.2'
gem 'devise'
gem 'dotenv-rails'
gem 'jbuilder', '~> 2.5'
gem 'jp_prefecture'
gem 'jquery-rails'
gem 'mysql2'
gem 'puma', '~> 3.11'
gem 'rails', '~> 5.2.4', '>= 5.2.4.1'
gem 'refile', require: 'refile/rails', github: 'manfe/refile'
gem 'refile-mini_magick'
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
gem 'uglifier', '>= 1.3.0'

group :development, :test do
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
  gem 'rubocop'
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'rspec-rails'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end
