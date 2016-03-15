class User < ActiveRecord::Base
	extend FriendlyId
	friendly_id :name, use: [:slugged, :finders]

	# def should_generate_new_friendly_id?
	# 	new_record?
	# end

	has_secure_password
	has_many :bikes, dependent: :destroy
	has_many :comments, dependent: :destroy
	
	validates :name, 
			presence: true,
			uniqueness: true
	validates :email,
			presence: true,
			uniqueness: true
	validates :password, length: {minimum: 6}, on: :create 
end
