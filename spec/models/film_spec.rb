require 'film'
require 'rails_helper'

describe Film do
  it 'checks description is added to film' do
    # Arrange
    film = Film.new(film_params)

    # Act
    film.save_film_description(description, film)

    # Assert
    expect(film.description).to eq(results[film])
  end
end
