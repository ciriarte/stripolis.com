require 'sinatra/base'
require 'data_mapper'
require 'slim'
require './lib/stripolis/sessionauth'
require 'rack-flash'

class App < Sinatra::Base
  use Rack::Flash
  set :app_file, __FILE__
  set :public, Proc.new { File.join(root, "public") }
  set :views, Proc.new { File.join(root, "views") }
  set :logging, true
  set Slim::Engine.set_default_options :pretty => true
  set :env, (ENV['RACK_ENV'] ? ENV['RACK_ENV'].to_sym : :development)
  register Sinatra::SessionAuth

  configure :test do
    puts 'Running in test mode'
    DataMapper.setup(:default, 'sqlite::memory:')
  end

  configure :development do
    # If you want the logs displayed you have to do this before the call to setup
    DataMapper::Logger.new($stdout, :debug)

    puts 'Running in development mode'
    db_file = File.join(File.join('sqlite://', File.dirname(__FILE__), 'database.db'))
    DataMapper.setup(:default, db_file)
  end

  DataMapper.finalize

  DataMapper.auto_upgrade!

  get '/' do
    if authorized?
      slim :index, :locals => {:page_title => 'The Stage', :current_user => current_user}
    else
      slim :register, :layout => :splash,:locals => {:page_title => 'Stripolis'}
    end
  end

  run! if app_file == $0
end
