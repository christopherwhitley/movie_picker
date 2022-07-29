class ChangeWatchedTableName < ActiveRecord::Migration[6.1]
  def change
    rename_table :watched_tables, :watches
  end
end
