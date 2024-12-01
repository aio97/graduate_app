RSpec.configure do |config|
  Webdrivers::Chromedriver.required_version = '131.0.6778.85'
  config.before(:each, type: :system) do
    driven_by :selenium, using: :headless_chrome, options: {
    browser: :remote,
    url: 'http://selenium_chrome:4444/wd/hub'
    }
    Capybara.server_host = 'web'
  end
end