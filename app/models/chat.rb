class Chat < ApplicationRecord
  belongs_to :user
  belongs_to :trade
  after_create :notify_pusher, on: :create

  def notify_pusher
    Pusher.cluster="ap3"
    Pusher.trigger("trade-#{self.trade.id}-channel", 'send_message', {
      message: self.message,
      user: self.user,
      date: self.created_at.strftime("%y %b %d %I:%M %p")
      })
  end

  def self.notify_pusher_argv(send_params)
    Pusher.cluster="ap3"
    Pusher.trigger("trade-#{send_params["trade_id"]}-channel", 'send_message', {
      message: send_params["message"],
      user: {id:send_params["user_id"],name:send_params["user_name"]},
      date: Time.now.strftime("%y %b %d %I:%M %p")
      })
  end
end
