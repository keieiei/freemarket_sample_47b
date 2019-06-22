class Item < ApplicationRecord
  with_options presence: true do
    validates :name
    validates :detail
    validates :size
    validates :delivery_charge
    validates :delivery_prefecture
    validates :delivery_time
    validates :delivery_way
    validates :price
    validates :state
    validates :large_category
    validates :middle_category
    validates :small_category
  end
end
