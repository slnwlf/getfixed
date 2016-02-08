class UsersController < ApplicationController

	before_action :set_user, except: [:index, :new, :create]
	before_action :authorize, only: [:edit, :update, :destroy]

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
		end
	end

	# POST / users
	def create
    # don't let current_user create new account
    if current_user
      redirect_to user_path(current_user)
    else
      @user = User.new(user_params)
      if @user.save
        session[:user_id] = @user.id
        flash[:notice] = "Successfully signed up."
        redirect_to user_path(@user)
      else
        flash[:error] = @user.errors.full_messages.join(", ")
        redirect_to signup_path
      end
    end
  end

  def edit
		unless current_user == @user
			flash[:error] = "You can onlt edit your profile."
			redirect_to user_path(current_user)
		end
	end

	def update
		if current_user == @user
			if @user.update_attributes(user_params)
				flash[:notice] = "Successfully edit profile."
				redirect_to user_path(@user)
			else
				redirect_to edit_user_path(@user)
				flash[:error] = @user.errors.full_messages.join(", ")
			end
		end
	end

	def destroy
    # only let current_user delete their own account
    if current_user == @user
      @user.destroy
      session[:user_id] = nil
      flash[:notice] = "Successfully deleted profile."
      redirect_to root_path
    else
      redirect_to user_path(current_user)
    end
  end

private

	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation)
	end

	def set_user
		@user = User.find_by_id(params[:id])
	end

end

