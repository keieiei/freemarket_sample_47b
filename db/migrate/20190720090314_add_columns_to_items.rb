class AddColumnsToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :item_condition_id, :integer, null: false
  end
end
