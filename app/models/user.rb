class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :items , dependent: :destroy
  has_many :seller_trades,class_name: :Trade, foreign_key: :seller_id
  has_many :customer_trades,class_name: :Trade, foreign_key: :customer_id
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :name, :presence => true
  validates :stu_num, :presence => true
  validates :phone_num, :presence => true
  validates_format_of :name, :with => /[가-힣]{2,10}/, :message => "알맞은 이름 양식을 사용하세요"

  validates_format_of :phone_num, :with => /01[0-9]{9}/, :message => "알맞은 핸드폰 번호 양식을 사용하세요"
  validates_format_of :stu_num, :with => /20[0-9]{8}/, :message => "알맞은 학번 양식을 사용하세요"
end
