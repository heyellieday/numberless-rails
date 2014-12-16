class Number < ActiveRecord::Base
	attr_accessor :user_id
	has_many :conversations, :foreign_key => :sender_id
  	has_many :messages, through: :conversations
end
