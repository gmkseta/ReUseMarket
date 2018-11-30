class Item < ApplicationRecord
  belongs_to :user
  has_many :trades , dependent: :destroy
  mount_uploaders :item_images, ItemImageUploader
  validates :item_images, presence:{message:"이미지를 등록 해야합니다."}
  validates :price, presence:{message:"가격을 등록해야합니다."}
  enum category: ["도서", "의류", "전자기기", "신발", "스포츠용품", "가전제품", "사무용품", "기타"]
  validates :category, presence:{message:"카테고리를 등록해야합니다."}
  validates :name, presence:{message:"물품명을 등록해야합니다."}

end
