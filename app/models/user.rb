class User < ActiveRecord::Base
  include DeviseTokenAuth::Concerns::User

  attr_accessor :id

  has_many :genders
  has_many :pronouns
  has_many :numbers

end
