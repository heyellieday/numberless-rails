class Message < ActiveRecord::Base
	attr_accessor :user_id
	
	belongs_to :conversation
  	belongs_to :user

  	validates_presence_of :body, :conversation_id, :user_id
end
