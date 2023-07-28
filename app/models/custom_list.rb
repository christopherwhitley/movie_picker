class CustomList < ApplicationRecord
  belongs_to :person, optional: true
  has_and_belongs_to_many :films
  accepts_nested_attributes_for :films


  def self.random_custom_list_films(id)
    custom_list = CustomList.find_by(id: id)
    # fail custom_list.films.inspect
    custom_list.films.order(Arel.sql('RANDOM()'))
  end

end