class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :items , dependent: :destroy
  has_many :seller_trades,class_name: :Trade, foreign_key: :seller_id , dependent: :destroy
  has_many :customer_trades,class_name: :Trade, foreign_key: :customer_id, dependent: :destroy
  has_many :singos, dependent: :destroy

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  mount_uploader :profile_img, ItemImageUploader
  validates :name, :presence => true
  validates :stu_num, :presence => true
  validates :phone_num, :presence => true

  validates_format_of :name, :with => /[가-힣]{2,10}/, :message => "알맞은 이름 양식을 사용하세요"
  validates_format_of :phone_num, :with => /01[0-9]{9}/, :message => "알맞은 핸드폰 번호 양식을 사용하세요"
  validates_format_of :stu_num, :with => /20[0-9]{8}/, :message => "알맞은 학번 양식을 사용하세요"

  def send_aligo()
    options = {
      key: "xdmb0bdi45ckjcuu2290oigq0kqma9px",
      user_id: "jake895",
      sender: ("01035115502"),
      receiver: "01055302795",
      msg: "test"
    }
    results = HTTParty.post("https://apis.aligo.in/send/", body: options)
    # return results
    # puts results["result_code"]
    result_hash = JSON.parse(results)
    puts result_hash
    # if result_hash["result_code"] == "1"
    #   self.messages.create(body: msg, user: user)
    # else
    #   return false
    # end
  end

end
