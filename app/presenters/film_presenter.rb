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

  def runtime
    calculate_runtime(@film_details['runtime'])
  end

  def directors
    directors = @film_details.dig('credits', 'crew')&.select { |crew| crew['job'] == 'Director' }
    director_names = directors&.map { |director| director['name'] }
    director_names&.join(', ')
  end

  private

  def calculate_runtime(minutes)
    hours = minutes / 60
    mins = minutes % 60
    "#{hours} hours and #{mins} minutes"
  end
end
