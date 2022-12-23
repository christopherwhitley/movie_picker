require 'httparty'
require 'json'

class PagesController < ApplicationController
#skip_before_action :authorized, only: [:login, :home]

  def home
  end

  def index
    p(params)
  end

  def api
    @filmname = "joker"

    query = {"query" => @filmname}
    @response = HTTParty.get("https://api.themoviedb.org/3/search/movie?api_key=b6ba0af499c6872471a982365c647f0e&language=en-US", :query => query, format: :json)

 end

 def destroy
   redirect_to('/')
   reset_session
   @current_user = nil
 end

 def login
   if params['username']
     user = Person.find_by_username(params['username'])
     if user.nil?
     flash.alert = 'Username or password incorrect!'
   else
      @valid = user.authenticate(params['password'])
      if @valid
        session[:user_id] = user.id
        redirect_to('/')
      else 
        flash.alert = 'Username or password incorrect!'
     end
   end
   end

 end
end
