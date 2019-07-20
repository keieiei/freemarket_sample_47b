class SmallCategory < ApplicationRecord
  has_many :items
  belongs_to :middle_category
  has_many :brands, through: :brand_small_categories
  has_many :brand_small_categories
end
