require 'rails_helper'

RSpec.describe User, type: :model do

  before do
	  user_params = Hash.new
	  user_params[:name] = FFaker::Name.first_name
	  user_params[:email] = FFaker::Internet.email
	  user_params[:password] = FFaker::Lorem.words(2).join
	  @user = User.create(user_params)
  end
end
