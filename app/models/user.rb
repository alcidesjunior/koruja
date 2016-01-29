class User < ActiveRecord::Base
	validates :email, presence: true
	validates :name, presence: true
	validates :last_name, presence: true
	validates :password, presence: true
	validates :user_type, presence: true
end
