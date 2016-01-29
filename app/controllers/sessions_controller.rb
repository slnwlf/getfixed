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
			redirect_to '/'
		else
			#if the user attempts to login and it fails, send them back to /login
			redirect_to '/login'
		end
	end

	def destroy
		session[:user_id] = nil
		redirect_to '/login'
	end

end
