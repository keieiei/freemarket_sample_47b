class RenameColumnsToItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :sell_id, :seller_id
    rename_column :items, :buy_id, :buyer_id
  end
end
