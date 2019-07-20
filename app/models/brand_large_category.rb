class BrandLargeCategory < ApplicationRecord
  validates :brand_id, :large_category_id, presence: true
  validates_with BrandLargeCategoryValidator, brand_id: :brand_id, large_category_id: :large_category_id
  belongs_to :brand
  belongs_to :large_category
end
