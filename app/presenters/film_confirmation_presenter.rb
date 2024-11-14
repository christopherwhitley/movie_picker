class FilmConfirmationPresenter
  def initialize(response)
    @response = response
  end

  def formatted_movies
    @response.map do |movie|
      {
        id: movie['id'],
        title: movie['title'],
        poster_path: poster_present?(movie['poster_path']) ? movie['poster_path'].to_s : nil,
        release_date: movie['release_date'],
        description: movie['overview']
      }
    end
  end

  def poster_base_url
    'https://image.tmdb.org/t/p/w185'
  end

  private

  def poster_present?(poster_path)
    poster_path.to_s.strip.present?
  end
end
