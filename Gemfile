source 'https://rubygems.org'

gem 'rails', '3.2.13'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

group :development do
  gem 'sqlite3'
  gem "better_errors"
  gem 'debugger'
  gem 'foreman'
end


group :production do
  gem 'pg'
end

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'simple_form'
gem 'jquery-rails'
gem 'jquery-ui-rails'
gem 'devise'
gem 'newrelic_rpm'

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0'

group :test do
  gem "shoulda-matchers"
  gem 'factory_girl'
  gem "database_cleaner"
end

# `rspec-rails` needs to be in the development group so that Rails generators work.
group :development, :test do
  gem "rspec-rails", "~> 2.12"
  gem 'factory_girl_rails'
end

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
gem 'acts_as_relation', '~> 0.1'