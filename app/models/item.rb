class Item < ApplicationRecord
  belongs_to :user
  has_many :trades

  # has_many :item_images
  # accepts_nested_attributes_for :item_images
  mount_uploaders :item_images, ItemImageUploader
end
