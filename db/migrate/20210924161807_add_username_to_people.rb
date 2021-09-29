class AddUsernameToPeople < ActiveRecord::Migration[6.1]
  def change
    add_column :people, :username, :string
  end
end
