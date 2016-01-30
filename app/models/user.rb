class User < ActiveRecord::Base
	has_secure_password
	has_many :bikes, dependent: :destroy
	
	validates :name, presence: true
	validates :email,
			presence: true,
			uniqueness: true
	validates :password, length: {minimum: 6}, on: :create 
end
