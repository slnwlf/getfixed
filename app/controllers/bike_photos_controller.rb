class BikePhotosController < ApplicationController
	def destroy
		@bike_photo = BikePhoto.find(params[:id])
		if current_user == @bike_photo.bike.user
			@bike_photo.destroy
			redirect_to :back
		else
			redirect_to root_path
		end
	end

end
