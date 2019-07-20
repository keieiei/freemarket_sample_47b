class AddColumnsToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :item_condition_id, :integer, null: false
    rename_column :items, :sell_id, :seller_id
    rename_column :items, :buy_id, :buyer_id
  end
end
