source 'http://rubygems.org'

gem 'rails', '3.1.1'

gem 'sqlite3'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   '~> 3.1.4'
  gem 'coffee-rails', '~> 3.1.1'
  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'
gem 'client_side_validations'

# UUID
gem 'uuidtools'
gem 'activeuuid'

# To use ActiveModel has_secure_password
gem 'bcrypt-ruby', '~> 3.0.0', :require => 'bcrypt'

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
end

group :production do
  # gems specifically for Heroku go here
  gem "pg"
  gem 'therubyracer-heroku'
end


