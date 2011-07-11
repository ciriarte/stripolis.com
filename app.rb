require 'sinatra/base'
require 'data_mapper'
require 'slim'
require './lib/stripolis/sessionauth'

class App < Sinatra::Base
  register Sinatra::SessionAuth
  set :app_file, __FILE__
  set :public, Proc.new { File.join(root, "public") }
  set :views, Proc.new { File.join(root, "views") }
  set :logging, true

  get '/' do
    if authorized?
      puts current_user.inspect
      slim :index, :locals => {:page_title => 'The Stage', :current_user => current_user}
    else
      slim :register, :locals => {:page_title => 'Stripolis'}
    end
  end

  run! if app_file == $0
end
