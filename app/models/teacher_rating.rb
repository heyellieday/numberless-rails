class TeacherRating < ActiveRecord::Base
	belongs_to :user
	belongs_to :teacher
end
