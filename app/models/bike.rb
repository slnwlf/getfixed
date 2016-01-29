class Bike < ActiveRecord::Base
	belongs_to :user

	validates :name, presence: true
	validates :description, length: {minimum: 6}, on: :create
end
