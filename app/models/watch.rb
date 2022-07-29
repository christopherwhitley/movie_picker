class Watch < ApplicationRecord
  validates :film_id, uniqueness: {scope: :person_id}


  def self.film_watched(person_id, film_id)
    watched = Watch.where(:person_id => person_id, :film_id => film_id)
    watched.pluck(:watches).pop
  end
end
