class RenameLargeCategoryColumnToItem < ActiveRecord::Migration[5.2]
  def change
    remove_column :items, :large_category, :integer
    remove_column :items, :middle_category, :integer
    remove_column :items, :small_category, :integer
    remove_column :items, :brand, :text
    add_reference :items, :large_category, foreign_key: true
    add_reference :items, :middle_category, foreign_key: true
    add_reference :items, :small_category, foreign_key: true
    add_reference :items, :brand, foreign_key: true
  end
end
