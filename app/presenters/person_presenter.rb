class PersonPresenter

  def initialize(person)
    @person = person
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
    Film.where.not(id: Watch.pluck(:film_id))
  end

  def films
    @person.get_person_films_list
  end
end