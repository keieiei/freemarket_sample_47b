class CreateBrandBrandUpperCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :brand_brand_upper_categories do |t|
      t.references :brand, foreign_key: true
      t.references :brand_upper_category, foreign_key: true
      t.timestamps
    end
  end
end
