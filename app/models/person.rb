class Person < ApplicationRecord
  has_many :films
  has_many :custom_lists
  has_many :film_ids

  has_secure_password
  validates :password, length: { in: 8..20 }, presence: true, on: :create
  validates :username, :email, uniqueness: true

  def get_person_films_list
    myfilmslist = Film.where(id: film_id)
    myfilms = myfilmslist.map(&:title)

    myfilms.each do |film|
      object = Film.where(title: [film.to_s])
      id = object.pluck(:id)
      title = object.pluck(:title)
      title = title.join
    end
  end

  def get_watched_films
    my_watches = Watch.where(person_id: id)
    film_list = []
    my_watches.each do |w|
      film_list << Film.find(w.film_id)
    end
    film_list
  end

  def get_unwatched_films
    watched_film_ids = Watch.where(person_id: id).pluck(:film_id)
    Film.where.not(id: watched_film_ids)
  end

  def self.search_unwatched_films(person, search)
    if search
       unwatched_films = person.get_unwatched_films
       unwatched_films.select { |film| film.title.downcase.include?(search.downcase.rstrip) }
    else
      @unwatched_films = Person.get_unwatched_films
    end
  end

  def remove_film_id_from_person(id)
    id = id.to_s
    if film_id.include?(id)
      film_id.delete(id)
      save
      "film id deleted"
    else
      "id not found"
    end
  end

  def add_film_id_to_person(person, id)
    if person.film_id.exclude?(id)
      person.film_id << id
      person.save!
    else
      flash.alert = 'Film not saved'
    end
  end
end
