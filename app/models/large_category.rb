class LargeCategory < ApplicationRecord
  has_many :items
  has_many :middle_categories
end
