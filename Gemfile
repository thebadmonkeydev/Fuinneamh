source 'https://rubygems.org'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.0.3'

# Use sqlite3 for the database for Active Record
group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'guard-rspec'
  gem 'pry'
  gem 'spork-rails'
  gem 'guard-spork'
  gem 'guard-bundler'
  gem 'guard-shell'
  gem 'childprocess'
end

group :development do
  gem 'rails_layout'
end

group :test do
  gem 'selenium-webdriver'
  gem 'capybara', '2.1.0'

  gem 'rb-notifu'
  #gem 'win32console'
  gem 'wdm'

  gem 'factory_girl_rails'
end

# Use SCSS for stylesheets
gem 'sass-rails', '~> 4.0.0'
gem 'bcrypt-ruby'
gem 'bootstrap-sass'

# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'

# Use CoffeeScript for .js.coffee assets and views
gem 'coffee-rails', '~> 4.0.0'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby

# Use jquery as the JavaScript library
gem 'jquery-rails'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 1.2'

group :doc do
  # bundle exec rake doc:rails generates the API under doc/api.
  gem 'sdoc', require: false
end

gem 'nokogiri'
gem 'prawn_rails'
gem 'delayed_job_active_record'
gem 'paypal-sdk-buttonmanager'
gem 'paypal-sdk-adaptivepayments'

group :production do
  gem 'pg', '0.15.1'
  gem 'rails_12factor', '0.0.2'
  gem 'rails_serve_static_assets'
end

gem 'mailchimp-api'

