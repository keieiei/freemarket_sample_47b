class BrandSmallCategory < ApplicationRecord
  validates_with BrandSmallCategoryValidator, small_category_id: :small_category_id, brand_id: :brand_id

  belongs_to :brand
  belongs_to :small_category
end
