class Message < ActiveRecord::Base

	belongs_to :conversation
  	belongs_to :number

  	validates_presence_of :body, :conversation_id, :number_id
end
