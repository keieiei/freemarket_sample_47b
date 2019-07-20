class MiddleCategory < ApplicationRecord
  has_many :items
  has_many :small_categories
  belongs_to :large_category
  has_many :brands, through: :brand_middle_categories
  has_many :brand_middle_categories
end
