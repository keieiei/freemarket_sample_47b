class SmallCategory < ApplicationRecord
  has_many :items
  belongs_to :middle_category
  belongs_to :brand_upper_category, optional: true
  belongs_to :size_type, optional: true
end
