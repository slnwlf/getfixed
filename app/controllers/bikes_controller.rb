class BikesController < ApplicationController
	before_action :find_bike, except: [:index, :new, :create]
  before_action :authorize, except: [:index, :show]

	def index
		@bikes = Bike.all
	end

	def new
		@bike = Bike.new
	end

	def create
		@bike = current_user.bikes.new(bike_params)
		if @bike.save
			redirect_to bike_path(@bike)
		else
			flash[:error] = @bike.errors.full_messages.join(", ")
			redirect_to new_bike_path
		end
	end

	def show
		@comment = Comment.new # <<<< this is for comment form on bike
	end

	def edit
		unless current_user == @bike.user
			flash[:error] = "You can only edit your own bike."
			redirect_to bike_path(@bike)
		end
	end

	def update
		if current_user == @bike.user
			if @bike.update_attributes(bike_params)
				flash[:notice] = "Successfully edited a bike."
				redirect_to bike_path(@bike)
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
    params.require(:bike).permit(:name, :description, :location, :image, :slug)
  end

  def find_bike
    @bike = Bike.friendly.find(params[:id])
  end


end
