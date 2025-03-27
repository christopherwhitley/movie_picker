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
    return 0 unless watch_count.positive?

    watch_count
  end

  def unwatched_films
    return search_results if @search_params.present?

    Film.where.not(id: Watch.pluck(:film_id))
  end

  def search_results
    Person.search_unwatched_films(@person, @search_params)
  end

  def films
    @person.get_person_films_list
  end
end
