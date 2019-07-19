class AddColumnToItem < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :seller_id, :integer, null: false
    add_column :items, :buyer_id, :integer
  end
end
