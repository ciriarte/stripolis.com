require 'sinatra/base'
require './lib/stripolis/sessionauth'

class App < Sinatra::Base
  register Sinatra::SessionAuth
  set :app_file, __FILE__
  set :public, Proc.new { File.join(root, "public") }
  set :views, Proc.new { File.join(root, "views") }
  set :email, 'beatrice@hell.com'
  set :password, 'dante'

  get '/' do
    if authorized?
      "Welcome to Stripolis!"
    else
      "Welcome. <a href='/login'>Please login</a>"
    end
  end

  run! if app_file == $0
end
