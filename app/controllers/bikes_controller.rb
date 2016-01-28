class BikesController < ApplicationController
	#display all bikes
	def index
		#get all bikes from db and save to instance variable
		@bikes = Bike.all 

		# render the index view - it must access the instance variable
		render :index
	end

	#show the new bike form
	def new
		@bike = Bike.new
		render :new
	end

	def create
		#whitelist params and save them to a variable
		bike_params = params.require(:bike).permit(:name, :description)

		#create a new bike from 'bike_params'
		bike = Bike.new(bike_params)

		#if bike saves, redirect to route that displays all bikes
		if bike.save
			redirect_to bike_path(bike)
			# equivalent to "/bikes"
		end
	end

	def show
		# get the bike id from the url params
		bike_id = params[:id]
		#use 'bike id' to find the bike in the database
		#and save it to an instance variable
		@bike = Bike.find_by_id(bike_id)
		render :show
	end

end
