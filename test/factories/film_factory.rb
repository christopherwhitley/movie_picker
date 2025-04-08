FactoryBot.define do
  factory :film do
    sequence(:title, 1) { |n| "some title#{n}" }
    sequence(:id, 1) { |n| n }
    genre_id { Faker::Number.number }
    association :genre
    external_id { Faker::Number.number }
  end
end
