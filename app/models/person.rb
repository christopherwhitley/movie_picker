class Person < ApplicationRecord
  has_many :films
  serialize :film_id, Array

  after_initialize do |person|
      person.film_id = [] if person.film_id == nil
    end

  has_secure_password
  validates :username, :email, uniqueness: true

#MUST BE LOGGED IN FOR BELOW TO FUNCTION
  def self.add_film_id_to_person(id, person)
    @person = person
    if @person.film_id.exclude? id

        @person[:film_id] << (id.to_s)

        @person.save
    else
        return
    end
  end

end
