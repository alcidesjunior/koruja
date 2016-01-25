class UsersController < ApplicationController
	def index
		@users = User.all
	end
	def new
		@user = User.new
	end
	def create
		require 'digest'
		@user = User.new
		params[:users].each do |param,value|
			@user[param]=value
		end
		@user[:password] = Digest::SHA256.hexdigest params[:users]['password']
		if @user.save
		  redirect_to controller: 'users',action: 'index'
		else
		  render 'new'
		end
	end
	def show
		
	end
	def login
		require 'digest'
		user_login = params[:authentication_log]['login']
		password_login = Digest::SHA256.hexdigest params[:authentication_log]['password'].to_s
		access_type_login = params[:authentication_log]['access_type'].to_i

		if User.find_by_login_and_password_and_user_type(user_login,password_login,access_type_login)
			session[:logged] = 'd397ea1e0cc78fc241bb7132693375539d6f9ccaf02eddbe999b272b0e666cb2'
			redirect_to controller: 'homes', action: 'home'
		else
			flash[:message] = "Usuário ou senha inválido"
	        flash[:type] = "alert-danger"
	        redirect_to controller: 'homes', action: 'index'
		end
	end
end
