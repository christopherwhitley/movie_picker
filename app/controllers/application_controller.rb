class ApplicationController < ActionController::Base

  protect_from_forgery with: :exception

  before_action :authorized
  helper_method :current_user
  helper_method :logged_in?

  def current_user
    Person.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def authorized
    redirect_to '/pages/login' unless logged_in?
  end
end
