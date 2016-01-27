class ManagersController < ApplicationController
	def index
		case session[:user_type]
			when 1
				@managers = Manager.all
			when 2
				redirect_to controller: 'teachers', action: 'index'
			when 3
				redirect_to controller: 'students', action: 'index'
		end
	end
end
