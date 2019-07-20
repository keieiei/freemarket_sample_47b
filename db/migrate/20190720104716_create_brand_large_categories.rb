class CreateBrandLargeCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :brand_large_categories do |t|
      t.references :brand, foreign_key: true
      t.references :large_category, foreign_key: true
      t.timestamps
    end
  end
end
