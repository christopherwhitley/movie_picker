require 'watch'
require 'rails_helper'

describe 'Watch' do
  # Arrange

  it 'checks attributes are added to Watch' do
    # Act
    watch = Watch.create(
      film_id: 1,
      person_id: 2
    )

    # Assert
    expect(watch.film_id).to eq(1)
    expect(watch.person_id).to eq(2)
  end
end
