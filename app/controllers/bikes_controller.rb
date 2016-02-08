class BikesController < ApplicationController
	before_action :set_user
	# before_action :bike_find, only: [:upvote]

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
		bike_params = params.require(:bike).permit(:name, :description, :image, :slug)

		#create a new bike from 'bike_params'
		# bike = Bike.new(bike_params)

		# associate user with bike - so username can appear on bike index
		bike = current_user.bikes.new(bike_params)

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
		@bike = Bike.friendly.find(bike_id)
		@comment = Comment.new
	end

	def edit
		#get the bike ID from params
		bike_id = params[:id]

		# use the bike ID to find the bike in the database
 	  # and save it to an instance variable
		@bike = Bike.friendly.find(bike_id)
	end

	def update
		#get the bike id so it can be edited
		bike_id = params[:id]

		#edit bike
		bike = Bike.friendly.find(bike_id)

		#whitelist params and save them to a variable
		bike_params = params.require(:bike).permit(:name, :description, :image, :slug)

		#update the bike associated with that ID
		bike.update_attributes(bike_params)

		#redirect to that bike's show page
		redirect_to bike_path(bike)
	end

	def destroy
		#get the bike ID
		bike_id = params[:id]

		#use the bike ID to find the bike in the db
		bike = Bike.friendly.find(bike_id)

		# destroy the bike
		bike.destroy

		# redirect to the bikes#show page
		redirect_to "/bikes"
	end

	def upvote

		# get the bike id so it can be edited
		bike_id = params[:id]

		# edit bike
		bike = Bike.friendly.find(bike_id)
		
		# Only allow logged in users to vote
		if bike.upvote_by current_user
			redirect_to :back
		else
			#throw error that they are not logged in
			flash[:error] = "You must be logged in to vote"
			redirect_to :back
		end
		
		
	end



private

	def set_user
		@user = current_user
	end

	# def bike_find
	# 	@bike = Bike.friendly.find(bike_id)
	# end
		

end
