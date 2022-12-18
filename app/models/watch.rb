class Watch < ApplicationRecord
  validates :film_id, uniqueness: {scope: :person_id}

  def self.film_watched(person_id, film_id)
    watched = Watch.where(:person_id => person_id, :film_id => film_id)
    watched.pluck(:watches).pop
  end

  def self.find_watched_film(film_id)
    thing = Watch.find_by(film_id: film_id)
    if thing != nil
      puts 'true'
      return true 
    else
      puts 'false'
      return false
    end
  end
end
