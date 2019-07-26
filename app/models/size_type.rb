class SizeType < ApplicationRecord
  has_many :middle_categories
  has_many :small_categories
  has_many :item_sizes
end
