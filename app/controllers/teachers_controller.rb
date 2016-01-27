class TeachersController < ApplicationController
	def index
		case session[:user_type]
			when 1
				redirect_to controller: 'managers', action: 'index'
			when 2
				@teachers = Teacher.all
			when 3
				redirect_to controller: 'students', action: 'index'
		end
	end
end
