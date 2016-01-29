class UsersController < ApplicationController
	def index
		if session[:user_type]==1
			@users = User.all
		elsif session[:user_type]==2
			redirect_to controller: 'teachers', action: 'index'
		else
			redirect_to controller: 'students', action: 'index'
		end
	end
	def new
		@user = User.new
	end
	def create
		require 'digest'
		if session[:user_type]==1
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
		else
			render text: 'Acesso negado!'
		end
	end
	def show
		if session[:user_type]==1
			@user = User.find_by_id(params[:id])
		else
			render text: 'Acesso negado!'
		end
	end
	def update
		require 'digest'
		if session[:user_type]==1
			@user = User.find_by_id(params[:id])
			if params[:users]['password'].blank?
				params[:users].delete('password') 
			else
				params[:users]['password'] = Digest::SHA256.hexdigest params[:users].delete('password')
			end
			params[:users].each do |param, value|
				@user[param]=value
			end
			if @user.save
				redirect_to action: 'index'
			end
		else
			render text: 'Acesso negado!'
		end
	end
	def login
		require 'digest'
		user_email = params[:authentication_log]['email']
		password_login = Digest::SHA256.hexdigest params[:authentication_log]['password']
		access_type_login = params[:authentication_log]['access_type'].to_i

		if User.find_by_email_and_password_and_user_type(user_email,password_login,access_type_login)
			session[:logged] = 'd397ea1e0cc78fc241bb7132693375539d6f9ccaf02eddbe999b272b0e666cb2'
			session[:user_type] = access_type_login
			if session[:user_type]==1
				redirect_to controller: 'managers', action: 'index'
			elsif session[:user_type]==2
				redirect_to controller: 'teachers', action: 'index'
			else
				redirect_to controller: 'students', action: 'index'
			end
		else
			flash[:message] = "Usuário ou senha inválido"
	        flash[:type] = "alert-danger"
	        redirect_to controller: 'homes', action: 'index'
		end
	end
end
