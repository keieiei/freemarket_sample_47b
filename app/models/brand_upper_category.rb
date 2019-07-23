class BrandUpperCategory < ApplicationRecord
  has_many :brands
  has_many :middle_categories
  has_many :large_categories
end
