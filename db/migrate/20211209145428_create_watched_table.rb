class CreateWatchedTable < ActiveRecord::Migration[6.1]
  def change
    create_table :watched_tables do |t|
      t.belongs_to :film
      t.belongs_to :person
      t.boolean :watched

      t.timestamps
    end
  end
end
