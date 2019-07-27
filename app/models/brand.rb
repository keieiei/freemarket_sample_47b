class Brand < ApplicationRecord
  has_many :items
  has_many :brand_upper_categories, through: :brand_brand_upper_categories
  has_many :brand_brand_upper_categories
  has_many :brand_middle_categories
  has_many :middle_categories, through: :brand_middle_categories
  has_many :brand_small_categories
  has_many :middle_categories, through: :brand_small_categories
end
