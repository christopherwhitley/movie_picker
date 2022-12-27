class CustomList < ApplicationRecord
  belongs_to :person, optional: true
  has_and_belongs_to_many :films
  accepts_nested_attributes_for :films
end
