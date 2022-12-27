class DropCustomListsFilmsTable < ActiveRecord::Migration[6.1]
  def change
    drop_table :custom_lists_films
  end
end
