class Item < ApplicationRecord
  belongs_to :user
  has_many :trades , dependent: :destroy
  mount_uploaders :item_images, ItemImageUploader
end
