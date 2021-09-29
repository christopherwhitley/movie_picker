class Film < ApplicationRecord
  belongs_to :genre
  has_many :films
  validates :title, presence: true, uniqueness: true
end
