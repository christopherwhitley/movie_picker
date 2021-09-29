class AddEmailToPeople < ActiveRecord::Migration[6.1]
  def change
    add_column :people, :email, :string
  end
end
