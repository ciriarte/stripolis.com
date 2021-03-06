ENV['RACK_ENV'] = 'test'

require 'capybara'
require 'capybara/cucumber'
require 'rspec'

app_file = File.join(File.dirname(__FILE__), *%w[.. .. app.rb])
require app_file

Capybara.app = App.new

class MyWorld
  include Capybara::DSL
  include RSpec::Expectations
  include RSpec::Matchers  
end

World{MyWorld.new}
