class CreateLargeCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :large_categories do |t|
      t.string :name
      t.integer :order_number
      t.timestamps
    end
  end
end
