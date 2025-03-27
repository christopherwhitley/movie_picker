require 'film_presenter'
require 'rails_helper'

RSpec.describe FilmPresenter do
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
  let(:subject) { FilmPresenter.new(film_details) }

  describe '#title' do
    it 'returns the original title of the film' do
      expect(subject.title).to eq('Batman')
    end
  end

  describe '#poster_path' do
    it 'returns the poster_path' do
      expect(subject.poster_path).to eq('/some_path.jpg')
    end
  end

  describe '#description' do
    it 'returns the overview' do
      expect(subject.description).to eq('A man dresses like a bat')
    end
  end

  describe '#release_date' do
    it 'returns the release date' do
      expect(subject.release_date).to eq('1989-06-21')
    end
  end

  describe '#directors' do
    it 'returns all crew members with the job "Director"' do
      expect(subject.directors).to eq('Bill McBillson')
    end
  end

  describe '#runtime' do
    it 'returns a calculated runtime' do
      expect(subject.runtime).to eq('2 hours and 6 minutes')
    end
  end
end
