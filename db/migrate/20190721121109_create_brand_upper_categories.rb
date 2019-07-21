class CreateBrandUpperCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :brand_upper_categories do |t|
      t.string :name
      t.timestamps
    end
  end
end
