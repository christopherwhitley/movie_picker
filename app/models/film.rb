class Film < ApplicationRecord
  belongs_to :genre
  has_many :films
  has_and_belongs_to_many :people
  validates :title, presence: true, uniqueness: true
end
