require 'sinatra/base'

class App < Sinatra::Base
  set :app_file, __FILE__
  set :public, Proc.new { File.join(root, "public") }
  set :views, Proc.new { File.join(root, "views") }

  get '/' do
    "Welcome to Stripolis!"
  end
  
  run! if app_file == $0
end
