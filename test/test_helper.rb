# Configure Rails Environment
ENV["RAILS_ENV"] = "test"

require "codeclimate-test-reporter"
CodeClimate::TestReporter.start


require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require "rails/test_help"
require 'capybara/rails'

Rails.backtrace_cleaner.remove_silencers!

# Load support files
Dir["#{File.dirname(__FILE__)}/dummy/test/support/**/*.rb"].each { |f| require f }

# Load fixtures from the engine
if ActiveSupport::TestCase.method_defined?(:fixture_path=)
  ActiveSupport::TestCase.fixture_path = File.expand_path("../fixtures", __FILE__)
end

class ActionDispatch::IntegrationTest
  # Make the Capybara DSL available in all integration tests
  include Capybara::DSL
end
