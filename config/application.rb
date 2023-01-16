require_relative "boot"

require "rails"
require "active_model/railtie"
#require "active_job/railtie"
#require "action_controller/railtie"
require "action_mailer/railtie"
require 'action_cable/engine'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Cabins
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.host = ENV['CABINS_HOST']
    config.action_mailer.delivery_method = :smtp
    config.action_mailer.default_url_options = { host: config.host }
    config.action_mailer.smtp_settings = {
      address: ENV['SMTP_ADDRESS'],
      port: ENV['SMTP_PORT'] || 587,
      domain: ENV['SMTP_DOMAIN'],
      user_name: ENV['SMTP_USERNAME'],
      password: ENV['SMTP_PASSWORD'],
      authentication: :plain,
      enable_starttls_auto: true
    }
  end
end
