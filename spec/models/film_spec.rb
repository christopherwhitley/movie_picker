require 'film'
require 'rails_helper'

describe Film do
  it 'checks description is added to film' do
    # Arrange
    film = Film.new
    description = "some description"

    # Act
    film.save_film_description(description, film)

    # Assert
    expect(film.description).to eq(description)
  end
end
