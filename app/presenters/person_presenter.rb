class PersonPresenter

  def initialize(person, search_params: nil)
    @person = person
    @search_params = search_params
  end

  def attributes
    {
      watch_count: watch_count,
      films: films,
      unwatched_films: unwatched_films
    }
  end

  def watch_count
    watch_count = Watch.where(person_id: @person.id, created_at: Time.current.all_year).count
    return 0 unless watch_count > 0
    watch_count
  end

  def unwatched_films
    if @search_params.present?
      return search_results
    else
      Film.where.not(id: Watch.pluck(:film_id))
    end
  end

  def search_results
    Person.search_unwatched_films(@person, @search_params)
  end

  def films
    @person.get_person_films_list
  end
end