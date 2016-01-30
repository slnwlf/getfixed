class BikesController < ApplicationController
	#display all bikes
	def index
		#get all bikes from db and save to instance variable
		@bikes = Bike.all 

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
			# should this be 'bike' or 'Bike' ??
		else
			flash[:error] = bike.errors.full_messages.join(", ")
			redirect_to new_bike_path
		end
	end

	def show
		# get the bike id from the url params
		bike_id = params[:id]
	  #use 'bike id' to find the bike in the database
	  #and save it to an instance variable
		@bike = Bike.find_by_id(bike_id)
	end

	def edit
		#get the bike ID from params
		bike_id = params[:id]

		# use the bike ID to find the bike in the database
 	  # and save it to an instance variable
		@bike = Bike.find_by_id(bike_id)
	end

	def update
		#get the bike id so it can be edited
		bike_id = params[:id]

		#edit bike
		bike = Bike.find_by_id(bike_id)

		#whitelist params and save them to a variable
		bike_params = params.require(:bike).permit(:name, :description)

		#update the bike associated with that ID
		bike.update_attributes(bike_params)

		#redirect to that bike's show page
		redirect_to bike_path(bike)
	end

	# def destroy
	# 	#get the bike ID
	# 	bike_id = params[:id]

	# 	#use the bike ID to find the bike in the db
	# 	bike = Bike.find_by_id(bike_id)

	# 	# destroy the creature
	# 	bike.destroy

	# 	# redirect to the bikes#show page
	# 	redirect_to "/bikes"
	# end

end
