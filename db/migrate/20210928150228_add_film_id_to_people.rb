class AddFilmIdToPeople < ActiveRecord::Migration[6.1]
  def change
    add_column :people, :film_id, :text
  end
end
