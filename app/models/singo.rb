class Singo < ApplicationRecord
  belongs_to :user
  belongs_to :item
  enum status: ["접수 전","접수 중","접수 완료"]

end
