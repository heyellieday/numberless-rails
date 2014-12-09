class Teacher < ActiveRecord::Base
	has_many :teacher_ratings
	has_many :users, through: :teacher_ratings
end
