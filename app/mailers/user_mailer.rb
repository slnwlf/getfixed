class UserMailer < ApplicationMailer
	def welcome(user)
		@user = user
		mail( to: @user.email, subject: "Thanks for signing up for Fixed Gear Nation!")
	end
end
