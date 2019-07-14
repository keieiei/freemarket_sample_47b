class RenameDeliveryPrefectureColumnToItems < ActiveRecord::Migration[5.2]
  def change
    rename_column :items, :delivery_prefecture, :prefecture_id
  end
end
