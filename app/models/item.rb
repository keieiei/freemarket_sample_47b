class Item < ApplicationRecord
  has_many :images,  dependent: :destroy, inverse_of: "item"
  accepts_nested_attributes_for :images
  with_options presence: true do
    validates :name, length: {maximum: 40}
    validates :detail, length: {maximum: 1000}
    validates :size
    validates :delivery_charge
    validates :delivery_prefecture
    validates :delivery_time
    validates :delivery_way
    validates :price, length: {maximum: 7,minimum: 3},numericality:{greater_than_or_equal_to: 300,less_than_or_equal_to: 9999999}
    validates :state
    validates :large_category
    validates :middle_category
    validates :small_category
  end
end
