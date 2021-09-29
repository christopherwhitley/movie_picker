class RemoveColumnFromPeople < ActiveRecord::Migration[6.1]
  def change
    remove_column :people, :film_id
  end
end
