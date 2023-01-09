require 'film'
require 'rails_helper'

describe 'Film' do
  # Arrange

  it 'checks attributes are added to film' do
    # Act
    film = Film.create(
      description: 'some description',
      title: "some title",
      genre_id: 1
    )

    # Assert
    expect(film.description).to eq('some description')
    expect(film.title).to eq('some title')
    expect(film.genre_id).to eq(1)
  end
end
