require 'factory_bot'

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end

FactoryBot.define do
  factory :genre do
    name { "Action" }
    id { Faker::Number.number }
  end
end
