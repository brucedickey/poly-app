module Chat
  class MessagesController < ApplicationController

    before_action :require_user

    def create
      # Chat user has submitted a new message.
      message = current_user.messages.build(message_params)
      if message.save 
        puts "About to broadcast"
        ActionCable.server.broadcast "chatroom_channel", mod_message: message_render(message)
        puts "After broadcast"
      end
    end

    private

    def message_params  
      #params.require(:message).permit(:body)
      params.require(:chat_message)
      params[:chat_message].require(:body)
      { "body" => params[:chat_message][:body] }
    end

    def message_render(message)
      render(partial: 'message', locals: {message: message})
    end

  end
end 
