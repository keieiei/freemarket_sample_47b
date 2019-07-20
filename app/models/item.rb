class Item < ApplicationRecord
  validates :name, :detail, :item_size_id, :delivery_charge_id, :prefecture_id, :delivery_time_id, :delivery_way_id, :price, :item_state_id, :large_category_id, :middle_category_id, :small_category_id, presence: true
  validates :name, length: { maximum: 40 }
  validates :detail, length: { maximum: 1000 }
  validates :price, numericality: { greater_than_or_equal_to: 300,less_than_or_equal_to: 9999999 }

  has_many :images,  dependent: :destroy, inverse_of: "item"
  accepts_nested_attributes_for :images
  belongs_to :buyer, class_name: 'User', foreign_key: 'buyer_id', optional: true
  belongs_to :seller, class_name: 'User', foreign_key: 'seller_id'
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
