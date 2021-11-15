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

def add_film_to_person(film_id)
  respond_to do |format|
    if logged_in?
      format.html { redirect_to people_path }
      current_user.add_film_id_to_person(film_id)
  else
    format.html { redirect_to people_url, notice: "Need to login." }
  end
end

def remove_film_id_from_person(id)
  respond_to do |format|
    format.html { redirect_to people_url, notice: "Film removed from person"}
    current_user.remove_film_id_from_person(id)
  end
end

end
