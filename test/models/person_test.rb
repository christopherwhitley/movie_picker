require "test_helper"

class PersonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "person_count" do
    assert_equal 2, Person.count
    user5 = create(:person, :password => "123")
    assert_equal 3, Person.count
    user6 = create(:person, :password => "987")
    Rails::logger.debug Person.pluck(:email)
  end
end
