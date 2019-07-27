class BrandBrandUpperCategory < ApplicationRecord
  validates_with BrandBrandUpperCategoryValidator, brand_upper_category_id: :brand_upper_category_id, brand_id: :brand_id

  belongs_to :brand
  belongs_to :brand_upper_category
end
