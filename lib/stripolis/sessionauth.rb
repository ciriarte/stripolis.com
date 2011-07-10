require 'sinatra/base'

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
    end

    def self.registered(app)
      app.helpers SessionAuth::Helpers

      app.set :sessions, true
      app.set :session_secret, "dirty_secret"

      app.get '/login' do
        "<html>" +
        "<head><title>Login</title></head>" +
        "<body>" +
        "<form method='POST' action='/login'>" +
        "<input type='text' name='email'>" +
        "<input type='text' name='pass'>" +
        "<input type='submit' />" +
        "</form>" +
        "</body>" +
        "</html>"
      end

      app.post '/login' do
        if params[:email] == options.email && params[:pass] == options.password
          session[:authorized] = true
          redirect '/'
        else
          session[:authorized] = false
          redirect '/login'
        end
      end
    end
  end

  register SessionAuth
end
