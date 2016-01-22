class Student < ActiveRecord::Base
	has_many :subjects
	has_many :grades
	has_many :teachers
end
