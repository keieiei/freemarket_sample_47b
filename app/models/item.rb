class Item < ApplicationRecord
  with_options presence: true do
    validates :name, length: {maximum: 40}
    validates :detail, length: {maximum: 1000}
    validates :item_size_id
    validates :delivery_charge_id
    validates :prefecture_id
    validates :delivery_time_id
    validates :delivery_way_id
    validates :price,numericality:{greater_than_or_equal_to: 300,less_than_or_equal_to: 9999999}
    validates :item_state_id
    validates :large_category_id
    validates :middle_category_id
    validates :small_category_id
  end

  has_many :images,  dependent: :destroy, inverse_of: "item"
  accepts_nested_attributes_for :images
  belongs_to :large_category
  belongs_to :middle_category
  belongs_to :small_category
  belongs_to :brand
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :item_size
  belongs_to_active_hash :item_state
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :delivery_way
  belongs_to_active_hash :delivery_time
end
