class Item < ApplicationRecord
  belongs_to :user
  has_many :trades , dependent: :destroy
  mount_uploaders :item_images, ItemImageUploader
  validates :item_images, presence:{message:"이미지를 등록 해야합니다"}
end
