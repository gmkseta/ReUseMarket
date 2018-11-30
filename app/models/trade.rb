class Trade < ApplicationRecord
  belongs_to :seller,class_name: :User
  belongs_to :customer,class_name: :User
  belongs_to :item
  has_many :chats
  enum status: ["거래 중","판매 완료","수령 완료","거래 완료","거래 취소"]
  def change_status(user_is)
    if user_is == self.seller
      case self.status
      when "거래 중"
        self.update(status: "판매 완료")
      when "수령 완료"
        self.update(status: "거래 완료")
      else
        puts "change status에러"
      end
    elsif user_is == self.customer
      case self.status
      when "거래 중"
        self.update(status: "수령 완료")
      when "판매 완료"
        self.update(status: "거래 완료")
      else
        puts "change status에러"
      end
    else
      puts "거래자가 아님"
    end
  end

  def self.cancel_trade
    self.update(status: "거래 취소")
  end
end
