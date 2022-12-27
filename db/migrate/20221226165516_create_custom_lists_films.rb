class CreateCustomListsFilms < ActiveRecord::Migration[6.1]
  def change
    create_table :custom_lists_films do |t|
      t.references :custom_list, null: false, foreign_key: true
      t.references :film, null: false, foreign_key: true

      t.timestamps
    end
  end
end
