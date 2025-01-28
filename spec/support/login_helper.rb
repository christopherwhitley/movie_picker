module LoginHelper
  def log_in(person)
    visit pages_login_path
    fill_in 'username', with: person.username
    fill_in 'password', with: person.password
    puts "Logging in with username: #{person.username} and password: #{person.password}"
    click_button 'Submit'
    puts "Current path after login: #{current_path}"
  end
end

RSpec.configure do |config|
  config.include LoginHelper, type: :feature
end
