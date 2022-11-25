class ChangePersonFilmColumnType < ActiveRecord::Migration[6.1]
  def change
    change_column_default(:people, :film_id, nil)
    change_column :people, :film_id, :integer, array: true, default: [], using: 'ARRAY[film_id]::INTEGER[]'
  end
end
