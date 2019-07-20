class Brand < ApplicationRecord
  has_many :items
  has_many :large_categories, through: :brand_large_categories
  has_many :middle_categories, through: :brand_middle_categories
  has_many :small_categories, through: :brand_small_categories
  has_many :brand_large_categories
  has_many :brand_middle_categories
  has_many :brand_small_categories
  belongs_to_active_hash :brand_category
end
