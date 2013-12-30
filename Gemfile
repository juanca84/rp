source 'http://rubygems.org'

ruby '1.9.3'

gem 'rails', '3.2.13'

#for database adapter postgres
gem 'pg'
#for database adapter oracle
#gem 'activerecord-oracle_enhanced-adapter', '~> 1.4.0'
#gem 'ruby-oci8', '~> 2.1.0'

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'
  gem 'uglifier', '>= 1.0.3'
  gem 'haml_coffee_assets'
  gem 'execjs'
end

gem "jquery-rails", "~> 3.0.0"
gem "simple_form", "~> 2.1.0"
gem 'anjlab-bootstrap-rails', '~> 3.0.2.0', :require => 'bootstrap-rails'
gem "haml", "~> 4.0.4"
gem "rails-backbone"

#authentication/authorizations
gem "devise", "~> 3.2.0"
gem "rego-devise-lastseenable", "~> 0.1.0"
gem "cancan"
gem 'rolify'

#for administrador
gem 'activeadmin', github: 'gregbell/active_admin'

#for staging in heroku
gem 'rails_12factor', group: :production

group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request'
  gem "haml-rails", "~> 0.4"
  gem "debugger", "~> 1.6.2"
end

#for documentation
group :development, :test do
  gem "rails-erd"
end
