class AddReferenceToItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :item_size_id, :integer
    add_reference :items, :item_size, foreign_key: true
  end
end
