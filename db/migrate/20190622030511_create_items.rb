class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :detail, null: false
      t.integer :size, null: false
      t.integer :delivery_charge, null: false
      t.integer :delivery_prefecture, null: false
      t.integer :delivery_time, null: false
      t.integer :delivery_way, null: false
      t.integer :price, null: false
      t.integer :state, null: false
      t.integer :large_category, null: false
      t.integer :middle_category, null: false
      t.integer :small_category, null: false
      t.text :brand
      t.timestamps
    end
  end
end
