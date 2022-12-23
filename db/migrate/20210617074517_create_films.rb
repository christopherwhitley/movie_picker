class CreateFilms < ActiveRecord::Migration[6.1]
  def change
    create_table(:films) do |t|
      t.text(:title)
      t.text(:description)
      t.references(:genre, null: false, foreign_key: true)

      t.timestamps
    end
  end
end
