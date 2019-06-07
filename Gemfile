source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.3'

gem 'rails', '~> 5.2.2', '>= 5.2.2.1'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'dotenv-rails'
gem 'ransack'
gem 'kaminari'
gem 'devise'
gem 'rails-i18n'
gem 'file_validators'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'mini_racer', platforms: :ruby
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
gem 'shrine'
gem 'mini_magick'
gem 'image_processing'
gem 'seed-fu'
gem 'faker'
gem "aws-sdk-s3"
gem "unicorn"
gem 'bcrypt', '~> 3.1.7'
gem 'ed25519'
gem 'bcrypt_pbkdf'
gem 'listen', '>= 3.0.5', '< 3.2'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'factory_bot_rails'
  gem 'database_cleaner'
  gem 'capybara'
  gem 'spring-commands-rspec'
  gem 'capistrano', '3.6.0'
  gem 'capistrano-rails'
  gem 'capistrano-bundler'
  gem 'capistrano-rbenv'
  gem 'capistrano3-unicorn'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'pry-rails'
  gem 'bullet'
end

group :test do
  gem 'selenium-webdriver'
  gem 'rspec-rails'
  gem 'webdrivers'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
