class AddLanguageToFilms < ActiveRecord::Migration[6.1]
  def change
    add_column :films, :language, :string
  end
end
