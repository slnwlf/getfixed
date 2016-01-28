class BikesController < ApplicationController
	#display all bikes
	def index
		#get all bikes from db and save to instance variable
		@bikes = Bike.all 

		# render the index view - it must access the instance variable
		render :index
	end
end
