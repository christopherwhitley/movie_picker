require 'person.rb'
require 'rails_helper'

describe Person do
  it 'test' do
    #Arrange
    person = Person.new
    #Act

    #Assert
    expect(person.name)
  end

end
