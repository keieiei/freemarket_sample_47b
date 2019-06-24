class Item < ApplicationRecord
  has_many :images,  dependent: :destroy, inverse_of: "item"
  accepts_nested_attributes_for :images
  with_options presence: true do
    validates :name
    validates :detail
    validates :size
    validates :delivery_charge
    validates :delivery_prefecture
    validates :delivery_time
    validates :delivery_way
    validates :price, length: {maximum: 7}
    validates :state
    validates :large_category
    validates :middle_category
    validates :small_category
  end
end
