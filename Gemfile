source 'http://rubygems.org'

gem 'rails', '3.1.1'

gem 'jquery-rails'
gem 'mysql2'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.4'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

# Use passenger as the web server
gem 'passenger'

# Deploy with Capistrano
gem 'capistrano'

group :development do
  gem 'guard-livereload'
  gem 'rb-fsevent', :require => false if RUBY_PLATFORM =~ /darwin/i
end

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
end

group :production do
  gem 'therubyracer'
end