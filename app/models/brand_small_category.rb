class BrandSmallCategory < ApplicationRecord
  validates :brand_id, :small_category_id, presence: true
  validates_with BrandSmallCategoryValidator, brand_id: :brand_id, small_category_id: :small_category_id
  belongs_to :brand
  belongs_to :small_category
end
