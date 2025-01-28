require 'rails_helper'

RSpec.describe 'Show film', type: :feature, js: true do
  let!(:person) { create(:person, email: 'test@example.com', password: 'password123') }
  let!(:film) { create(:film) }

  before do
    log_in(person)
  end

  describe 'show page' do
    it 'shows the save watch button' do
      visit film_path(film)
      expect(page).to have_button('Mark as seen')
    end
  end
end
