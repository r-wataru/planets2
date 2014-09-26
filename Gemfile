source 'https://rubygems.org'

ruby '2.1.0'

gem "rails", "~> 4.1.5"

gem 'mysql2', '~> 0.3.16'
gem "json", "~> 1.8.1"
gem 'jquery-rails'
gem 'rails-i18n'
gem 'will_paginate'
gem "omniauth", "~> 1.2.2"
gem 'omniauth-facebook', '~> 2.0.0'
gem 'rmagick', '~> 2.13.3', :require => 'RMagick'
gem "nokogiri", "~> 1.6.3.1"

group :assets do
  gem 'sass-rails',   '~> 4.0.3'
  gem 'coffee-rails', '~> 4.0.1'
  gem 'therubyracer', :platforms => :ruby
  gem 'uglifier', '>= 1.3.0'
  gem 'bootstrap-sass', '~> 3.2.0.2'
end

group :development do
  gem 'annotate', '~> 2.6.5'
  gem 'thin', '~> 1.5.0'
  gem 'spring', require: false
  gem 'spring-commands-rspec', require: false
end

group :test do
  gem 'rspec', '~> 3.1.0'
  gem 'rspec-rails', '~> 3.1.0'
  gem 'rspec-given', '~> 3.5.4'
  gem 'launchy'
  gem 'mocha', require: false
  gem 'rspec-rails-mocha', '~> 0.3.2', require: false
  gem 'bourne', '~> 1.5.0'
  gem 'capybara', '~> 2.4.3'
  gem 'capybara-webkit', '~> 1.3.0'
  gem 'connection_pool', '~> 2.0.0'
  gem "simplecov", "~> 0.9.1", require: false
  gem 'i18n-spec'
end

group :development, :test do
  gem 'timecop', '~> 0.7.1'
end

group :development, :test, :staging, :demo, :production do
  gem 'factory_girl_rails', '~> 4.4.1'
end

group :development, :staging, :demo, :production do
  gem 'database_cleaner', '~> 1.3.0'
end

group :staging do
  gem 'newrelic_rpm'
end
