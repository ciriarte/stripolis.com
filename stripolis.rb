require 'sinatra/base'

class Stripolis < Sinatra::Base
  set :app_file, __FILE__
  set :public, Proc.new { File.join(root, "public") }
  set :views, Proc.new { File.join(root, "views") }

  get '/' do
    "Hello world, it's #{Time.now} at the server!"
  end
  
  run! if app_file == $0
end