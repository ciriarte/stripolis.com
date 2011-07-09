app_file = File.join(File.dirname(__FILE__), *%w[.. .. app.rb])
require app_file

require 'rspec/expectations'
require 'rack/test'
require 'webrat'

puts app_file

Webrat.configure do |config|
  config.mode = :rack
end

class MyWorld
  include Rack::Test::Methods
  include Webrat::Methods
  include Webrat::Matchers

  Webrat::Methods.delegate_to_session :response_code, :response_body

  def app
    App.new
  end
end

World{MyWorld.new}
