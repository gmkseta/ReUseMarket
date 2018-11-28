class ChatsController < ApplicationController
  def index
     @chats = Chat.all
     @chat = Chat.new
   end

   def new
     @chat = Chat.new
   end

   def create
     # @chat = Chat.new(chat_params)
     # respond_to do |format|
       # begin
       # if @chat.save
         # puts "========================================="
         Chat.connection.insert("
           INSERT INTO `chats` (`message`, `user_id`, `trade_id`, `created_at`, `updated_at`) VALUES\
         (\
           '#{chat_params['message'].gsub("'"){"\\'"}}',\
           #{chat_params['user_id']},\
           #{chat_params['trade_id']},\
            '#{Time.now.getlocal("+00:00").strftime "%Y-%m-%d %H:%M:%S"}',\
            '#{Time.now.getlocal("+00:00").strftime "%Y-%m-%d %H:%M:%S"}'\
         )\
         ")

         Chat.notify_pusher_argv(chat_params)

         # format.html { redirect_to @chat, notice: 'Message was successfully posted.' }
         # format.json { render :show, status: :created, location: @chat }
       # rescue
       #   format.html { render :new }
       #   format.json { render json: @chat.errors, status: :unprocessable_entity }
       # end
     # end
   end

   def create2
     @chat = Chat.new(chat_params)
     respond_to do |format|
       if @chat.save
         format.html { redirect_to @chat, notice: 'Message was successfully posted.' }
         format.json { render :show, status: :created, location: @chat }
       else
         format.html { render :new }
         format.json { render json: @chat.errors, status: :unprocessable_entity }
       end
     end

   end

   private
     def chat_params
       params.require(:chat).permit(:message,:trade_id,:user_id,:user_name)
     end
end
