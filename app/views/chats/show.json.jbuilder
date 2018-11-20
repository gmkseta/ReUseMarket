json.extract! @chat, :id, :user, :message

json.url chat_url(@chat, format: :json)
