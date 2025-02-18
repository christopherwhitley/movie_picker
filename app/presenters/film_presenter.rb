class FilmPresenter
  
  def initialize(film_details)
    @film_details = film_details
  end

  def title
    @film_details['original_title']
  end

  def poster_path
    @film_details['poster_path']
  end

  def description
    @film_details['overview']
  end

  def release_date
    @film_details['release_date']
  end

  def directors
    directors = @film_details.dig('credits', 'crew')&.select { |crew| crew['job'] == 'Director' }
    director_names = directors&.map { |director| director['name'] }
    director_names&.join(', ')
  end
end