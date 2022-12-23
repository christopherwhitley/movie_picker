class AddReleaseDateToFilms < ActiveRecord::Migration[6.1]
  def change
    add_column(:films, :release_date, :string)
  end
end
