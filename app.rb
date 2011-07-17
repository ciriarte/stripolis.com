require 'sinatra/base'
require 'data_mapper'
require 'slim'
require './lib/stripolis/sessionauth'
require 'rack-flash'

class App < Sinatra::Base
  use Rack::Flash
  register Sinatra::SessionAuth
  set :app_file, __FILE__
  set :public, Proc.new { File.join(root, "public") }
  set :views, Proc.new { File.join(root, "views") }
  set :logging, true
  set Slim::Engine.set_default_options :pretty => true

  get '/' do
    if authorized?
      slim :index, :locals => {:page_title => 'The Stage', :current_user => current_user}
    else
      slim :register, :layout => :splash,:locals => {:page_title => 'Stripolis'}
    end
  end

  run! if app_file == $0
end
