require 'rails_helper'

RSpec.describe Bike, type: :model do

	before do
		bike_params = Hash.new
		bike_params[:name] = FFaker::Name.first_name
		bike_params[:description] = FFaker::Baconlpsum.phrase
		@bike = Bike.create(bike_params)

  	pending "add some examples to (or delete) #{__FILE__}"
  end
end
