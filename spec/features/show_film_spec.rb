require 'rails_helper'

RSpec.describe 'Show film', type: :feature, js: true do
  let!(:person) { create(:person, email: 'test@example.com', password: 'password123') }
  let!(:film) { create(:film) }
  let(:film_details) do
    {
      'title' => 'LeBatman',
      'original_title' => 'Batman',
      'poster_path' => '/some_path.jpg',
      'overview' => 'A man dresses like a bat',
      'release_date' => '1989-06-21',
      'runtime' => 126,
      'credits' => {
        'crew' => [{
          'name' => 'Bill McBillson',
          'job' => 'Director'
        }]
      }
    }
  end

  before do
    log_in(person)
    allow_any_instance_of(FilmsController).to receive(:fetch_movie_details).and_return(film_details)
  end

  context 'when the film has not been marked as watched' do
    it 'shows the save watch button' do
      visit film_path(film)
      expect(page).to have_button('Mark as seen')
    end
  end

  context 'when the film has been marked as watched' do
    let(:watch) { instance_double(Watch, watched: true, film_id: film.id, person_id: person.id) }

    before do
      allow(Watch).to receive(:find_by).with(person_id: person.id, film_id: film.id).and_return(watch)
    end

    it 'shows the remove watch button' do
      visit film_path(film)
      expect(page).to have_button('Mark as unseen')
    end
  end
end
