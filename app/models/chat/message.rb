module Chat
  class Message < ApplicationRecord
    self.table_name = "chat_messages"
    belongs_to :user
    validates :body, presence: true
    scope :custom_display, -> { order(:created_at).last(20) }
  end
end 
