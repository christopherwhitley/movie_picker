require 'custom_list'
require 'rails_helper'

describe 'Custom list' do
  # Arrange
  let(:genre) { FactoryBot.create(:genre) }
  let(:film) { FactoryBot.create_list(:film, 3, genre_id: genre.id) }

  it 'checks attributes are added to custom list' do
    # Act
    custom_list = CustomList.create(
      name: 'My custom list',
      person_id: "1",
      film_ids: [film.first.id]
    )
    puts film.inspect

    # Assert
    expect(custom_list.name).to eq('My custom list')
    expect(custom_list.person_id).to eq(1)
    expect(custom_list.film_ids).to eq([1])
  end

  it 'returns random film' do
    # Act
    custom_list = CustomList.create(
      name: 'My custom list',
      person_id: "1",
      film_ids: film.pluck(:id)
    )

    film = custom_list.films.order(Arel.sql('RANDOM()')).first

    # Assert
    expect(film.id).to be_between(1, 1000).inclusive
  end
end
