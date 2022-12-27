class RemoveColumnFromFilms < ActiveRecord::Migration[6.1]
  def change
    remove_column :films, :custom_lists_id
  end
end
