class Film < ApplicationRecord
require 'api.rb'

  belongs_to :genre
  has_many :films
  has_and_belongs_to_many :people
  validates :title, presence: true, uniqueness: true

def recommended_films
    allFilms = Film.all
    api = ApiCall.new
    @myapi = []
    #@titles = []
    film_genre_match = allFilms.select { |movie| movie.genre_id == genre_id }
    #recommended_results = nil
    film_genre_match.each do |film|
      results = api.api_call(film.title)
      titles = results.find { |movie| movie['title'] }
      @myapi << titles
      puts 'execute loop'
    end

    return @myapi
end

end
