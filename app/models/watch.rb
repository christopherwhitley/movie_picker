class Watch < ApplicationRecord
  validates :watched_film_id, uniqueness: {scope: :watched_person_id}


  def self.film_watched(person_id, film_id)
    watched = Watch.where(:watched_person_id => person_id, :watched_film_id => film_id)
    watched.pluck(:watched).pop
  end
end
