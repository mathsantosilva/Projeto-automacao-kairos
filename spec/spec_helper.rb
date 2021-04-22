require "capybara"
require "capybara/rspec"
require "selenium-webdriver"



RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end

  config.shared_context_metadata_behavior = :apply_to_host_groups
    config.include Capybara::DSL
    config.before(:example) do
      page.current_window.maximize
      @login = 'mat_santos21@hotmail.com'
      @senha = 'teste'
  end
    config.after(:example) do |e|
      nome = e.description.gsub(/[^A-Za-z0-9]/, '').tr(' ','_')
      page.save_screenshot('log/' + nome + '.png') if e.exception
  end
end

Capybara.configure do |config|
  config.default_driver = :selenium_chrome #_headless
  config.default_max_wait_time = 85
  config.app_host = 'https://www.dimepkairos.com.br'
end