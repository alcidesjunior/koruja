class UsersController < ApplicationController
	def index
		@users = User.all
	end
	def new
		@user = User.new
	end
	def create
		@user = User.new(user_params)
		if @user.save
		  redirect_to controller: 'users',action: 'index'
		else
		  render 'new'
		end

	end
	private
	def user_params
		require 'digest'
		params[:password] = Digest::SHA256.hexdigest params[:password].to_s
		params.require(:users).permit(:login,:name,:last_name,:password,:user_type)
	end
end
