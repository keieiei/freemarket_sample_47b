class CreateItemSizes < ActiveRecord::Migration[5.2]
  def change
    create_table :item_sizes do |t|
      t.string :size
      t.references :size_type, foreign_key: true
      t.timestamps
    end
  end
end
