require "test_helper"

require "test_helper"
require_relative "support/interceptor"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  include Interceptor

  options = Selenium::WebDriver::Chrome::Options.new
  options.add_argument('--headless=new')

  driver = Capybara.register_driver :chrome_headless do |app|
    Capybara::Selenium::Driver.new(app, browser: :chrome, capabilities: [options])
  end

  driven_by :chrome_headless

  def after_setup
    start_intercepting
    super
  end

  def before_teardown
    stop_intercepting
    super
  end
end