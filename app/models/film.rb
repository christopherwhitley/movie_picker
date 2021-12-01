class Film < ApplicationRecord
require 'api.rb'

  belongs_to :genre
  has_many :films
  has_and_belongs_to_many :people
  validates :title, presence: true, uniqueness: true

@allFilms = nil

def recommended_films
    @allFilms = Film.all
    api = ApiCall.new
    @myapi = []
    @titles = []
    film_genre_match = @allFilms.select { |movie| movie.genre_id == genre_id }
    film_genre_match.each do |film|
      results = api.api_call(film.title)
      titles = results.find { |movie| movie['title'] == film.title }
      @myapi << titles

    end
    return @myapi
end

def recommended_films_ids
  allfilms = Film.all
  film_genre_match = allfilms.select { |movie| movie.genre_id == genre_id }
  return film_genre_match
end

def get_recommended_film_poster(film_name)
  #Returns an array of Film objects

  @poster = nil
  response = recommended_films
  #For each film object in the array, find, in our api_call results, the first result that matches the title in the results with the title of our film object
  result = response.find { |movie| movie['title'] == film_name }
  @poster = result['poster_path']
  return @poster

  end

  def get_film_poster(film_name)
    @poster = nil
    api = ApiCall.new
    response = api.api_call(film_name)

    result = response.find {|movie| movie['title'] == film_name}
    @poster = result["poster_path"]
    return @poster
  end

  def get_film_description(film_name)
    api = ApiCall.new
    response = api.api_call(film_name)

    result = response.find {|movie| movie['title'] == film_name}
    description = result["overview"]
    return description
  end

  def get_film_release_date(film_name)
    api = ApiCall.new
    response = api.api_call(film_name)
    result = response.find {|movie| movie['title'] == film_name}
    release_date = result["release_date"]
    return release_date
  end

  def self.get_film_confirmation(film_name)
    api = ApiCall.new
    response = api.api_call(film_name)
    @results = response.select {|language| language['original_language'] == 'en'}
    return @results
  end

end
