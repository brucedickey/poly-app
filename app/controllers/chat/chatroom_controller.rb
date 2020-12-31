
module Chat
  class ChatroomController < ApplicationController

    before_action :require_user

    def index 
      active_app("chat")

      @message  = Message.new
      @messages = Message.custom_display 
    end
    
    def new
    end
  end
end
