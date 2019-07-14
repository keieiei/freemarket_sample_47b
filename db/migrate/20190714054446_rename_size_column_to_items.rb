class RenameSizeColumnToItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :size, :item_size_id
    rename_column :items, :state, :item_state_id
    rename_column :items, :delivery_charge, :delivery_charge_id
    rename_column :items, :delivery_way, :delivery_way_id
    rename_column :items, :delivery_time, :delivery_time_id
  end
end
