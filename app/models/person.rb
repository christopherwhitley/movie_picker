class Person < ApplicationRecord
  has_many :films
  serialize :film_id, Array

  after_initialize do |person|
      person.film_id = [] if person.film_id == nil
    end

  has_secure_password
  validates :username, :email, uniqueness: true

end
