class SmallCategory < ApplicationRecord
  has_many :items
  belongs_to :middle_category
end
