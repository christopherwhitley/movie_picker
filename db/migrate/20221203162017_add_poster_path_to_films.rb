class AddPosterPathToFilms < ActiveRecord::Migration[6.1]
  def change
    add_column(:films, :poster_path, :string)
  end
end
