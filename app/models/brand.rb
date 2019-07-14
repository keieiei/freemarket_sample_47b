class Brand < ApplicationRecord
  has_many :items
  belongs_to_active_hash :brand_category
end
