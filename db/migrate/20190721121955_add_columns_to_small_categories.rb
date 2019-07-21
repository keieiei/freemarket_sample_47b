class AddColumnsToSmallCategories < ActiveRecord::Migration[5.2]
  def change
    add_reference :small_categories, :brand_upper_category, foreign_key: true
    add_reference :small_categories, :size_type, foreign_key: true
    add_reference :middle_categories, :brand_upper_category, foreign_key: true
    add_reference :middle_categories, :size_type, foreign_key: true
    add_reference :brands, :brand_upper_category, foreign_key: true
    remove_column :brands, :brand_category_id, :integer
  end
end
