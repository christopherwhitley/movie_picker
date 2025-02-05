class AddExternalIdColumnToFilms < ActiveRecord::Migration[6.1]
  def up
    add_column :films, :external_id, :string
  end

  def down
    remove_column :films, :external_id, :string
  end
end
