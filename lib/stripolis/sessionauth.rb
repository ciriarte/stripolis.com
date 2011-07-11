require 'sinatra/base'
require './models/user.rb'

module Sinatra
  module SessionAuth

    module Helpers
      def authorized?
        !! session[:authorized]
      end

      def authorize!
        redirect '/login' unless authorized?
      end

      def logout!
        session[:authorized] = false
      end

      def current_user
        session[:user]
      end
    end

    def self.registered(app)
      app.helpers SessionAuth::Helpers

      app.set :sessions, true
      app.set :session_secret, "dirty_secret"

      app.get '/login' do
        slim :login, :locals => {:page_title => 'Stripolis - Login'}
      end

      app.post '/login' do
        user = User.get(params[:email])
        if user.nil? or params[:password] == user.password
          session[:authorized] = true
          session[:user] = user
          redirect '/'
        else
          session[:authorized] = false
          redirect 'login/'
        end
      end
    end
  end

  register SessionAuth
end
