class Trade < ApplicationRecord
  belongs_to :seller,class_name: :User
  belongs_to :customer,class_name: :User
  belongs_to :item
  has_many :chats
end
