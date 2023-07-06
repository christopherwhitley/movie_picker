class CustomList < ApplicationRecord
  belongs_to :person, optional: true
  has_and_belongs_to_many :films
  accepts_nested_attributes_for :films
end

def random_custom_list_film
  custom_list = CustomList.find(params[:id])
  custom_list.films.order(Arel.sql('RANDOM()')).first
end
