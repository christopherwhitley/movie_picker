class Person < ApplicationRecord
  has_many :films
  
  has_secure_password
  validates :username, :email, uniqueness: true

end
