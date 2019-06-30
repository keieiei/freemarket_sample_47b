class Image < ApplicationRecord
  belongs_to :item, optional: true
  mount_uploader :image, ImageUploader
  with_options presence: true do
    validates :image
  end
end
