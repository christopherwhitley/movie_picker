require 'film'
require 'rails_helper'

RSpec.describe FilmsController do
  # Arrange
  let(:params) { { title: 'some title', description: 'some description', genre_id: 1, language: 'english' } }

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

  context 'when there are multiple film results' do
    it 'gets film confirmation' do
      expect(Film).to receive(:get_film_confirmation)

      post :multiple_film_results, params: { film: params }
    end
  end
end
