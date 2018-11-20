class AddTradeToChat < ActiveRecord::Migration[5.2]
  def change
    add_reference :chats, :trade, foreign_key: true
  end
end
