class LargeCategory < ApplicationRecord
  has_many :items
  has_many :middle_categories
  has_many :brands, through: :brand_large_categories
  has_many :brand_large_categories
end
