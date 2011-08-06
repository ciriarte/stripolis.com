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
        User.get(session[:user])
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
        cookie = request.cookies["rememberme"]
        if cookie
          user = User.get(cookie.to_s)
          if user
            session[:authorized] = true
          end
        else
          pass
        end
      end

      app.post '/register' do
        user = User.new(
          :username   => params[:stage_name],
          :email      => params[:email],
          :password   => params[:password],
          :firstname  => params[:first_name],
          :lastname   => params[:last_name],
          :birthday   => Date.civil(Integer(params[:year]),Integer(params[:month]),Integer(params[:day]))
        )

        if user.save
          session[:authorized] = true
          session[:user] = user.email
        else
          user.errors.each do |e|
            flash[:notice] = e
          end
        end
        redirect '/'
      end

      app.post '/login' do
        response.set_cookie("rememberme", { :value => params[:email], :path => "/" } )
        user = User.get(params[:email])
        if !user.nil? and params[:password] == user.password
          session[:authorized] = true
          session[:user] = user.email
          redirect '/'
        else
          session[:authorized] = false
          if params[:email]
            flash[:notice] = "Couldn't log you in as '" + params[:email] + "'"
          else
            flash[:notice] = "You must enter your email and password to log in"
          end
          redirect '/login'
        end
      end
    end
  end

  register SessionAuth
end
