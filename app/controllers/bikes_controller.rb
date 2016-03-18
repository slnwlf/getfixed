class BikesController < ApplicationController
	before_action :find_bike, except: [:index, :new, :create]
  before_action :authorize, except: [:index, :show]

	def index
		@bikes = Bike.all
	end

	def new
		@bike = Bike.new
		3.times { @bike.bike_photos.build }
	end

	def create
		@bike = current_user.bikes.new(bike_params)
		if @bike.save
			flash[:notice] = "Successfully added a bike."
			redirect_to bike_path(@bike)
		else
			flash[:error] = @bike.errors.full_messages.join(", ")
			redirect_to new_bike_path
		end
	end

	def show
		@additional_photos = @bike.bike_photos
		@comment = Comment.new # <<<< this is for comment form on bike
	end

	def edit
		unless current_user == @bike.user
			flash[:error] = "You can only edit your own bike."
			redirect_to bike_path(@bike)
		end
	end

	def update
		# @bike.update_attributes(bike_params) won't work with nested attributes
		# below is a hack way to update for a moment

		# get bike param without nested attributes
		bike_params_without_nested_attrinutes = params.require(:bike).permit(:name, :description, :location, :image, :slug)
		if current_user == @bike.user
			# set update bike_photo (additonal photos beside main photo) as false
			update_additional_photo_successful = false
			# loop through bike_photo_attribute
			bike_params[:bike_photos_attributes].each do |key, value|
				# if there is image key, meaning user just update new image
				if value.has_key?("image")
					# user updating image pass validation, set update_additional_photo_successful = true
					if @bike.bike_photos[key.to_i].update_attributes(bike_params[:bike_photos_attributes][key])
						update_additional_photo_successful = true
					# when fail image validation, break loop update_additional_photo_successful = false
					else
						return update_additional_photo_successful = false
					end
				# if there isn't image key, meaning user just want keep old image
				# so set update_additional_photo_successful = true for below logic
				else
					update_additional_photo_successful = true 
				end 
			end
			# if pass all validations
			if @bike.update_attributes(bike_params_without_nested_attrinutes) and update_additional_photo_successful
				flash[:notice] = "Successfully edited a bike."
				redirect_to bike_path(@bike)
			# fail any of validation
			else
				flash[:error] = @bike.errors.full_messages.join(", ")
				redirect_to edit_bike_path
			end
		else
			redirect_to bike_path(@bike)
		end
	end

	def destroy
		if current_user == @bike.user
			@bike.destroy
			flash[:notice] = "Successfully deleted a bike."
			redirect_to bikes_path
		else
			flash[:error] = "You can only delete your own bike."
			redirect_to bike_path(@bike)
		end
	end

	def upvote
		# Only allow logged in users to vote
		if @bike.upvote_by current_user
			redirect_to :back
		else
			#throw error that they are not logged in
			flash[:error] = "You must be logged in to vote"
			redirect_to :back
		end
	end


private

  def bike_params
    params.require(:bike).permit(:name, :description, :location, :image, :slug, bike_photos_attributes: [:user_id, :image])
  end

  def find_bike
    @bike = Bike.friendly.find(params[:id])
  end


end
