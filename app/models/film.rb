class Film < ApplicationRecord
  require 'api'
  require 'i18n_data'

  has_one :film_id

  belongs_to :genre
  has_and_belongs_to_many :custom_lists
  has_many :films
  has_many :watches
  has_and_belongs_to_many :people
  validates :title, presence: true, uniqueness: true

  @allFilms = nil

  def recommended_films
    @allFilms = Film.all
    api = ApiCall.new
    @myapi = []
    @titles = []
    film_genre_match = @allFilms.select { |movie| movie.genre_id == genre_id }
    film_genre_match.first(5).each do |film|
      results = api.api_call(film.title)
      titles = results.find { |movie| movie['title'] == film.title }
      @myapi << titles
    end
    @myapi
  end

  def recommended_films_ids
    allfilms = Film.all
    film_genre_match = allfilms.select { |movie| movie.genre_id == genre_id }
    film_genre_match.first(5)
  end

  def film_watched?(person_id)
    watched = Watch.find_by(person_id: person_id, film_id: id)
    if watched === nil
      false
    else
      true
    end
  end

  def get_recommended_film_poster(film_name)
    # Returns an array of Film objects
    response = recommended_films
    # For each film object in the array, find, in our api_call results, the first result that matches the title in the results with the title of our film object
    result = response.find { |movie| movie['title'] == film_name }
    result["poster_path"]
  end

  def get_film_poster(film_name)
    @film = Film.find_by(title: film_name)
    if (@film.poster_path = '')

      api = ApiCall.new
      response = api.api_call(film_name)

      result = response.find { |movie| movie['title'] == film_name }
      #puts(result)
      @poster = result["poster_path"]
      @film.save_poster_path(@poster, @film)
      @poster

    else
      @film.poster_path
    end
  end

  def self.get_film_confirmation(film_name, lang)
    api = ApiCall.new
    langu = I18nData.language_code(lang)
    response = api.api_call(film_name, langu)
    response.select { |language| language['original_language'] == langu.downcase }
  end
end
