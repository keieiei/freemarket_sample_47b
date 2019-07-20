class BrandMiddleCategory < ApplicationRecord
  validates :brand_id, :middle_category_id, presence: true
  validates_with BrandMiddleCategoryValidator, brand_id: :brand_id, middle_category_id: :middle_category_id
  belongs_to :brand
  belongs_to :middle_category
end
