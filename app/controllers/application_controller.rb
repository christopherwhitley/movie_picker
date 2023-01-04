class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  # before_action :authorized, except: [:new, :home]
  helper_method :current_user
  helper_method :logged_in?
  helper_method :api_call
  helper_method :supported_languages

  def current_user
    Person.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_user.nil?
  end

  def authorized
    redirect_to('/pages/login') unless logged_in?
  end

  def supported_languages
    @response = HTTParty.get('https://api.themoviedb.org/3/configuration/languages?api_key=b6ba0af499c6872471a982365c647f0e', format: :json)
    response = @response.parsed_response
    # puts @response
    @languages = response.each do |r|
      puts r['name']
    end
  end

  def api_call(title, lang)
    query = { 'query' => title }
    language = lang
    @response = HTTParty.get('https://api.themoviedb.org/3/search/movie?api_key=b6ba0af499c6872471a982365c647f0e', query: query, langauges: lang, format: :json)
    response = @response.parsed_response
    result = response['results']
    puts result
    poster_path = result[0]['poster_path']
    description = result[0]['overview']
    release_date = result[0]['release_date']
    @film.save_poster_path(poster_path, @film)
    @film.save_film_description(description, @film)
    @film.save_film_release_date(release_date, @film)
    @film.save_film_language(language, @film)
    [poster_path, description, release_date, language]
  end
end

def add_film_to_person(film_id)
  respond_to do |format|
    if logged_in?
      format.html { redirect_to(person_path(current_user.id)) }
      current_user.add_film_id_to_person(current_user, film_id)
    else
      format.html { redirect_to(people_url, notice: 'Need to login.') }
    end
  end

  def remove_film_id_from_person(id)
    respond_to do |format|
      format.html { redirect_to(people_url, notice: 'Film removed from person') }
      current_user.remove_film_id_from_person(id)
    end
  end
end
