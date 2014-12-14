class User < ActiveRecord::Base
  include DeviseTokenAuth::Concerns::User

  attr_accessor :id

  has_many :genders
  has_many :pronouns
  has_many :numbers
  has_many :conversations, :foreign_key => :sender_id
  has_many :messages, through: :conversations

end
