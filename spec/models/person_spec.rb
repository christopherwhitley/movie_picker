require 'person'
require 'rails_helper'

describe Person do
  it 'check film id added to film_id array' do
    # Arrange
    person = Person.new
    film_id = 789

    # Act
    person.add_film_id_to_person(person, film_id)

    # Assert
    expect(person.film_id).to include(film_id)
  end
end
