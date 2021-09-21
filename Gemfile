source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

gem 'rails', '~> 5.2.5'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'dotenv-rails'
gem 'devise'
gem 'devise-i18n'
gem 'omniauth','1.9.1'
gem 'omniauth-google-oauth2'

gem 'carrierwave'
gem 'mimemagic', '0.3.7'
gem 'mini_magick'

gem 'unicorn'
gem 'mini_racer', platforms: :ruby

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
gem 'rinku'
gem 'gon'
gem 'ransack'
gem 'rails_admin', '~> 2.0'
gem 'cancancan'
gem 'fog-aws'

gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'rspec-rails'
  gem 'spring-commands-rspec'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'launchy'
  gem 'seed_dump'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rbenv'
  gem 'capistrano3-unicorn'

  gem 'ed25519'
  gem 'bcrypt_pbkdf'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'webdrivers'
end

