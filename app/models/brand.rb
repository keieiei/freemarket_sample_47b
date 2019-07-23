class Brand < ApplicationRecord
  has_many :items
  belongs_to :brand_upper_category
end
