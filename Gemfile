# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "~> 2.6"

gem "active_elastic_job"
gem "aws-sdk", "~> 2" # https://github.com/tawan/active-elastic-job/pull/95
gem "elasticsearch"
gem "elasticsearch-model"
gem "elasticsearch-persistence"
gem "jbuilder", "~> 2.11"
gem "puma", "~> 5.2"
gem "rails"
gem "sanitize"
gem "htmlentities"
gem "charlock_holmes"
gem "iso_country_codes"


# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", ">= 1.4.2", require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
# gem 'rack-cors'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem "byebug", platforms: [:mri, :mingw, :x64_mingw]
  gem "rspec-rails", "~> 4.0"
end

group :development do
  gem "listen", ">= 3.0.5", "< 3.5"
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "rubocop-rails_config"
end

group :test do
  gem "shoulda-matchers"
  gem "webmock"
  gem "simplecov", require: false
end
