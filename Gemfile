source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'
gem 'rails', '~> 5.2.3'
gem 'mysql2', '>= 0.4.4', '< 0.6.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'

gem 'bootsnap', '>= 1.1.0', require: false
gem 'nokogiri', '>= 1.10.3'
gem 'ffi', '>= 1.11.1'
gem 'bootstrap', '~> 4.3.1'
gem 'jquery-rails'
gem 'bcrypt', '~> 3.1', '>= 3.1.13'
gem 'nio4r', '>= 2.4.0'
gem 'rails-controller-testing'
gem 'dotenv-rails'

# 検索機能
gem 'ransack'

# ページネーション機能
gem 'will_paginate'
gem 'will_paginate-bootstrap4'

# グラフ作成
gem "chartkick"
gem "groupdate"

# LINEbot連携
gem 'line-bot-api'

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails', '~> 3.7.0'
  gem 'factory_bot_rails'
  gem 'rubocop-rspec'
  gem 'pry'
  gem 'pry-doc'
  gem 'pry-byebug'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'spring-commands-rspec'
  gem 'bullet'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers', '~> 3.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
