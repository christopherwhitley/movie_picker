class CreateCustomListsAndFilms < ActiveRecord::Migration[6.1]
  def change
    create_table :custom_lists_and_films, id: false do |t|
      t.belongs_to :custom_lists, index: true
      t.belongs_to :films, index: true
    end
  end
end
