source "https://rubygems.org"

gem "rails", "~> 8.1"

# Database
gem "pg", "~> 1.1"

# Server
gem "puma", ">= 5.0"

# Authentication
gem "sorcery", "~> 0.18"

# Asset
gem "sprockets-rails"
gem "importmap-rails"
gem "turbo-rails"
gem "stimulus-rails"
gem "tailwindcss-rails"

# JSON
gem "jbuilder"

# Form
gem "simple_form"

# Decorator
gem "draper"

# Enum
gem "enum_help", "0.0.19"

# I18n
gem "rails-i18n"

# Boot
gem "bootsnap", require: false

gem "tzinfo-data", platforms: %i[ windows jruby ]

group :development, :test do
  gem "debug", platforms: %i[ mri windows ], require: "debug/prelude"

  gem "brakeman", require: false
  gem "rubocop-rails-omakase", require: false

  gem "rspec-rails"
  gem "factory_bot_rails"
end

group :development do
  gem "web-console"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "shoulda-matchers"
end
