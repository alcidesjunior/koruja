class StudentsController < ApplicationController
	def index
		case session[:user_type]
			when 1
				redirect_to controller: 'managers', action: 'index'
			when 2
				redirect_to controller: 'teachers', action: 'index'
			when 3
				@students = Student.all
		end
	end
end
