FactoryBot.define do
  factory :person do
    username { Faker::Name.name }
    email { Faker::Internet.email }
    password {}
  end
end
