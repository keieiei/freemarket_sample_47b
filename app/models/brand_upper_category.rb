class BrandUpperCategory < ApplicationRecord
  has_many :brand_brand_upper_categories
  has_many :brands, through: :brand_brand_upper_categories
  has_many :small_categories
  has_many :middle_categories
end
