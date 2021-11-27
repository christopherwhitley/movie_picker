class Person < ApplicationRecord
  has_many :films
  serialize :film_id, Array

  after_initialize do |person|
      person.film_id = [] if person.film_id == nil
    end

  has_secure_password
  validates :username, :email, uniqueness: true

#Method of a Class
  #def self.add_film_id_to_person(id, person)
  #  @person = person
    #if @person.film_id.exclude? id
      #  @person[:film_id] << (id.to_s)
      #  @person.save

  def get_person_films_list
    myfilmslist = Film.where(id: film_id)
    myfilms = myfilmslist.map(&:title)

    myfilms.each do |film|
        object = Film.where(title: [film.to_s])
        id = object.pluck(:id)
        title = object.pluck(:title)
        title = title.join()
      end
  end

  def remove_film_id_from_person(id)
    id = id.to_s
    if film_id.include? id
      film_id.delete(id)
      save
      return "film id deleted"
    else
      return "id not found"
    end
  end

  def add_film_id_to_person(id)
    if film_id.exclude? id
        film_id << (id.to_s)
        save
    else
        return
    end
  end

end
