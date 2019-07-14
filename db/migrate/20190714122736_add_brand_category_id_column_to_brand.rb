class AddBrandCategoryIdColumnToBrand < ActiveRecord::Migration[5.2]
  def change
    add_column :brands, :brand_category_id, :integer
  end
end
