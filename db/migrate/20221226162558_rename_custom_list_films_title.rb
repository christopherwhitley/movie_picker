class RenameCustomListFilmsTitle < ActiveRecord::Migration[6.1]
  def change
    rename_table :custom_lists_and_films, :custom_lists_films
  end
end
