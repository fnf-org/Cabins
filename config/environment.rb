# Load the Rails application.
require_relative 'application'

Rails.logger = Logger.new(STDOUT)
Rails.logger.level = Logger::DEBUG

# Initialize the Rails application.
Rails.application.initialize!
