class CreateFilms < ActiveRecord::Migration[6.1]
  def change
    create_table :films do |t|
      t.string :title
      t.string :description
      t.references :genre, null: false, foreign_key: true

      t.timestamps
    end
  end
end
