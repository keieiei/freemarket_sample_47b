class RemoveBrandUpperCategoryIdFromBrands < ActiveRecord::Migration[5.2]
  def change
    remove_foreign_key :brands, :brand_upper_categories
    remove_reference :brands, :brand_upper_category, index: true
  end
end
