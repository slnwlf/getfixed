class UsersController < ApplicationController

	before_filter :set_user, except: [:index, :new, :create]
	before_filter :authorize, only: [:edit, :update, :destroy]

	# GET /users
	def index
		@users = User.all
	end

	# GET /users/id

	def show
		@user = User.find(params[:id])
		@bikes = @user.bikes
	end

	def new
		# don't let current users see the sign up view
		if current_user
			redirect_to user_path(current_user)
		else
			@user = User.new
			render :new
		end
	end

	def edit
		@user = current_user
	end

	# POST / users
	def create
		user = User.new(user_params)
		puts user
		if user.save
			session[:user_id] = user.id 
			redirect_to '/'
		else
			flash[:notice] = user.errors.map{ |k,v| "#{k} #{v}".capitalize }
			redirect_to '/signup'
		end
	end

	def update
		@user = current_user
		user_params = params.require(:user).permit(:name, :email)
		puts user_params
		puts @user.update_attributes(user_params)
		if @user.update_attributes(user_params)
			redirect_to edit_user_path
		end
	end

	def destroy
		@user.destroy
		respond_to do |format|
			format.html { redirect_to users_url, notice: "User was successfully deleted." }
		end
	end

private

	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end

end

