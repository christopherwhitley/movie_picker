ENV['RAILS_ENV'] ||= 'test'
require_relative "../config/environment"
require "rails/test_help"

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors, with: :threads)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all
  include FactoryBot::Syntax::Methods
  # Add more helper methods to be used by all tests here...
  parallelize(workers: 2)
end

class ActionDispatch::IntegrationTest
  def create_person
    post(people_path, params: { person: {username: "cw", email: "c.w@gmail.com", password: 'secret'} })
  end
  
  def get_bill
    @person = people(:bill)
  end
end
