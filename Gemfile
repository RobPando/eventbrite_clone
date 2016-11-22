source 'https://rubygems.org'

ruby '2.3.1'

gem 'rails',          '5.0.0.1'
gem 'puma',           '~> 3.0'
gem 'sass-rails',     '~> 5.0'
gem 'uglifier',       '>= 1.3.0'
gem 'coffee-rails',   '~> 4.2'
gem 'jquery-rails'
gem 'turbolinks',     '~> 5'
gem 'jbuilder',       '~> 2.5'
gem 'bcrypt',         '~> 3.1.7'
gem 'bootstrap-datepicker-rails'
gem 'materialize-sass'

group :development, :test do
  gem 'sqlite3',      '1.3.11'
  gem 'rspec-rails',  '~> 3.5'
  gem 'rails-controller-testing'
  gem 'factory_girl_rails'
  gem 'capybara'
  gem 'byebug', platform: :mri
end

group :test do
  gem 'database_cleaner'
end

group :development do
  gem 'web-console'
  gem 'listen',                 '~> 3.0.5'
  gem 'spring'
  gem 'spring-watcher-listen',  '~> 2.0.0'
end
group :production do
  gem 'pg'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
