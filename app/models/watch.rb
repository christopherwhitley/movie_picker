class Watch < ApplicationRecord
  validates :watched_film_id, uniqueness: {scope: :watched_person_id}
end
