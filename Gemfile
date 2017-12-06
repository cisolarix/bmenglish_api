source 'https://gems.ruby-china.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.4'
# Use postgresql as the database for Active Record
# gem 'pg', '~> 0.18'
gem 'mysql2', '~> 0.4.10'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1', '>= 3.1.11'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

gem 'active_type', '~> 0.7.4'

gem 'awesome_print', '~> 1.8'

gem 'kaminari', '~> 1.1', '>= 1.1.1'

gem 'ransack', '~> 1.8', '>= 1.8.4'

gem 'faker', '~> 1.8', '>= 1.8.4'

gem 'figaro', '~> 1.1', '>= 1.1.1'

gem 'paranoia', '~> 2.4'

gem 'jquery-rails', '~> 4.3', '>= 4.3.1'

gem 'webpacker', github: 'rails/webpacker'

# Strategies for cleaning databases. Can be used to ensure a clean state for testing.
gem 'database_cleaner', '~> 1.6', '>= 1.6.2'

# 树形图
gem 'ancestry', '~> 3.0', '>= 3.0.1'

# Rails variables in JS
gem 'gon', '~> 6.2'

# Object oriented authorization for Rails applications
gem 'pundit', '~> 1.1'

# 异常通知
gem 'exception_notification', '~> 4.2', '>= 4.2.2'
gem 'bearychat-notifier', '~> 0.0.6'

gem 'shrine', '~> 2.8'
