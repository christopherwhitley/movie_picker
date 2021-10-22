require "./test/test_helper.rb"

class PagesControllerTest < ActionDispatch::IntegrationTest

setup do

end

test "login success" do
  create_person
  post pages_login_url, params: {username: 'cw', email: 'c.w@gmail.com', password: 'secret'}
  assert_redirected_to root_path
end
end
