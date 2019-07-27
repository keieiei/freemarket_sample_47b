class CreateBrandSmallCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :brand_small_categories do |t|
      t.references :brand, foreign_key: true
      t.references :small_category, foreign_key: true
      t.timestamps
    end
  end
end
