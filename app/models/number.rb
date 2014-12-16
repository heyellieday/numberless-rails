class Number < ActiveRecord::Base
	has_many :conversations, :foreign_key => :sender_id
  	has_many :messages, through: :conversations
end
