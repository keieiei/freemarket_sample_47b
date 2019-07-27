class BrandMiddleCategory < ApplicationRecord
  validates_with BrandMiddleCategoryValidator, middle_category_id: :middle_category_id, brand_id: :brand_id

  belongs_to :brand
  belongs_to :middle_category
end
