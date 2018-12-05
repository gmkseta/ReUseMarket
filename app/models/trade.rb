class Trade < ApplicationRecord
  belongs_to :seller,class_name: :User
  belongs_to :customer,class_name: :User
  belongs_to :item
  has_many :chats , dependent: :destroy
  enum status: ["거래 중","판매 완료","수령 완료","거래 완료","거래 취소"]
  # after_create :send_sms, on: :create
  after_update :cal_score, on: :update

  def self.update_item_status
    self.all.each do |t|
      if t.status == "거래 완료"
        t.item.update(status:1)
        puts("change"+t.item.name)
      end
    end
  end

  def cal_score
    if self.status =="거래 완료"
      self.seller.update(Trade.connection.select_one("select AVG(score) score from trades where seller_id=#{self.seller_id} and status=3"))
      self.item.update(status:1)
    end
  end

  def send_sms
    if self.item.name==self.item.name[0..4]
      content = self.item.name
    else
      content = self.item.name[0..4]+".."
    end

    uri = URI.parse('https://api.bluehouselab.com/smscenter/v1.0/sendsms')
    http = Net::HTTP.new(uri.host, uri.port)
    http.use_ssl = true
    req = Net::HTTP::Post.new(uri.request_uri, initheader={'Content-Type' =>'application/json; charset=utf-8'})
    req.basic_auth ENV["SMS_APPID"], ENV["SMS_APIKEY"]
    req.body = {
      sender: ENV["SMS_SENDER"],
      receivers: [self.seller.phone_num.to_s],
      content: "ReUseMarket \n '#{content}' 물품을 \n #{self.customer.name}님께서 거래요청 하셨습니다."
    }.to_json

    puts req.body
    resp = http.request(req)
    puts resp.code
  end


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

  def cancel_trade
    self.update(status: "거래 취소")
  end
end
