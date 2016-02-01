class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by_email(params[:email])
		# If the user actually exits AND the password matches the user
		if user && user.authenticate(params[:password])
			# Save the user id in a cookie.  This is how we keep the user
			# logged in when they are in a browser session on the site
			session[:user_id] = user.id
			flash[:notice] = "Successfully logged in."
			redirect_to root_path
		else
			#if the user attempts to login and it fails, send them back to /login
			flash[:error] = "Incorrect email or password."
			redirect_to login_path
		end
	end

	def destroy
		session[:user_id] = nil
		flash[:notice] = "Successfully logged out."
		redirect_to root_path
	end

	private

	def user_params
		params.require(:user).permit(:email, :password)
	end

end
