class ChangeCustomListsTable < ActiveRecord::Migration[6.1]
  def change
    change_table :custom_lists do |t|
      t.belongs_to :person, index: true
    end
  end
end
