class AddPasswordToPeople < ActiveRecord::Migration[6.1]
  def change
    add_column :people, :password_digest, :string
  end
end
