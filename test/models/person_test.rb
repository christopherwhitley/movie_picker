require "test_helper"

class PersonTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "person_count" do
    assert_equal 2, Person.count
  end

  test "person_factory" do
    user5 = create(:person, :password => "123")
    user6 = create(:person, :password => "987")
    assert_equal 4, Person.count
  end

  test "user_delete" do
    user5 = create(:person, :password => "123")
    user6 = create(:person, :password => "987")
    Person.first.destroy()
    assert_equal 3, Person.count
  end


#Rails::logger.debug Person.pluck(:email)

end
