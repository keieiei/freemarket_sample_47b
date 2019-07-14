class MiddleCategory < ApplicationRecord
  has_many :items
  has_many :small_categories
  belongs_to :large_category
end
