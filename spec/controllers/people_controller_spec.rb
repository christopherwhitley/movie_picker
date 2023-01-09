require 'person'
require 'rails_helper'

describe 'Person' do
  # Arrange

  it 'checks attributes are added to person' do
    # Act
    person = Person.create(
      username: 'testuser',
      password: "123",
      email: 'test@email.com'
    )

    # Assert
    expect(person.username).to eq('testuser')
    expect(person.password).to eq('123')
    expect(person.email).to eq('test@email.com')
  end
end
