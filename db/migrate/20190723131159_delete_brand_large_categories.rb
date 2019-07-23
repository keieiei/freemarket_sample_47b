class DeleteBrandLargeCategories < ActiveRecord::Migration[5.2]
  def change
    drop_table :brand_large_categories
    drop_table :brand_middle_categories
    drop_table :brand_small_categories
  end
end
