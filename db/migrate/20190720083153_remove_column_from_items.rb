class RemoveColumnFromItems < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :seller_id, :integer, null: false
    remove_column :items, :buyer_id, :integer
    remove_foreign_key :items, :users
    remove_reference :items, :user, index: true
  end
end
