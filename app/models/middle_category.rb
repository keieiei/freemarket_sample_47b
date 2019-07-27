class MiddleCategory < ApplicationRecord
  has_many :items
  has_many :small_categories
  belongs_to :large_category
  belongs_to :brand_upper_category, optional: true
  belongs_to :size_type, optional: true
  has_many :brand_middle_categories
  has_many :brands, through: :brand_middle_categories
end
