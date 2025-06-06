source "https://rubygems.org"

ruby "3.3.7"

# Bundle edge Rails instead: gem "rails", github: "rails/rails", branch: "main"
gem "rails", "~> 7.1.3", ">= 7.1.3.2"

# The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
# gem "sprockets-rails"
gem "auto_increment"
gem 'onesignal', '~> 1.0.1'
gem 'twilio-ruby', '~> 7.2.0'
gem 'rack-cors'
gem "aws-sdk-s3", require: false

# Use postgresql as the database for Active Record
gem "pg", "~> 1.1"
gem 'fcm' 
gem 'rest-client'
# Use the Puma web server [https://github.com/puma/puma]
gem "puma", ">= 5.0"

# Use JavaScript with ESM import maps [https://github.com/rails/importmap-rails]
gem "importmap-rails"

# Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]
# gem "turbo-rails"

# Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
# gem "stimulus-rails"

# Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jbuilder"
gem 'active_model_serializers', '~> 0.10.0'

# Use Redis adapter to run Action Cable in production
gem "redis", ">= 4.0.1"
gem 'bcrypt', '~> 3.1', '>= 3.1.12'
# Use Kredis to get higher-level data types in Redis [https://github.com/rails/kredis]
# gem "kredis"
gem 'truemail'
# Use Active Model has_secure_password [https://guides.rubyonrails.org/active_model_basics.html#securepassword]
# gem "bcrypt", "~> 3.1.7"
gem 'rack-attack'

gem 'opencage-geocoder'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem "tzinfo-data", platforms: %i[ windows jruby ]

# Reduces boot times through caching; required in config/boot.rb
gem "bootsnap", require: false
gem 'securerandom'
# Use Active Storage variants [https://guides.rubyonrails.org/active_storage_overview.html#transforming-images]
gem "image_processing", "~> 1.2"
gem 'net-http', '~> 0.4.1'

group :development, :test do
  # See https://guides.rubyonrails.org/debugging_rails_applications.html#debugging-with-the-debug-gem
  gem "debug", platforms: %i[ mri windows ]
    gem 'byebug'

end


# gem 'dotenv-rails', '~> 2.1', '>= 2.1.1'
group :development do
  # Use console on exceptions pages [https://github.com/rails/web-console]
  gem "web-console"

  # Add speed badges [https://github.com/MiniProfiler/rack-mini-profiler]
  # gem "rack-mini-profiler"

  # Speed up commands on slow machines / big apps [https://github.com/rails/spring]
  # gem "spring"
end




# Move dotenv-rails out of the development/test group
gem 'dotenv-rails'

group :development, :test do
  # other development gems...
end









gem 'acts_as_tenant'
gem 'cancancan'
gem 'mailtrap'

gem 'jwt'
gem 'webauthn'



# Use hiredis to get better performance than the "redis" gem
gem 'hiredis'

group :test do
  # Use system testing [https://guides.rubyonrails.org/testing.html#system-testing]
  gem "capybara"
  gem "selenium-webdriver"
end

gem "sidekiq", "~> 7.3"
gem "sidekiq-scheduler", "~> 5.0"
