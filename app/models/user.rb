class User < ActiveRecord::Base
	has_many :bikes
	has_secure_password
	validates_presence_of :email, :notice => "Need an email"
	validates_uniqueness_of :email, :notice => "Email is already taken"
	validates_presence_of :name, :notice => "Need a name"
	validates_uniqueness_of :name, :notice => "Name is already taken"
end
