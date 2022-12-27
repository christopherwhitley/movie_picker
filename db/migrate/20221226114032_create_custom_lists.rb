class CreateCustomLists < ActiveRecord::Migration[6.1]
  def change
    create_table :custom_lists do |t|
      t.timestamps
      t.string :name
      add_reference :films, :custom_lists,
                    null: true,
                    foreign_key: { to_table: :films }
    end
  end
end
