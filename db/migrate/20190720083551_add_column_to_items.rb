class AddColumnToItems < ActiveRecord::Migration[5.2]
  def change
    add_reference :items, :sell, foreign_key: { to_table: :users }
    add_reference :items, :buy, foreign_key: { to_table: :users }
  end
end
