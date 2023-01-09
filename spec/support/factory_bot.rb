require 'factory_bot'

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end

FactoryBot.define do
  factory :genre do
    name { "Action" }
    id { 1 }
  end
end

FactoryBot.define do
  factory :film do
    sequence(:title, 1) { |n| "some title#{n}" }
    sequence(:id, 1) { |n| n }
    genre_id { 1 }
  end
end
