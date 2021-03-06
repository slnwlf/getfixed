require 'rails_helper'

RSpec.describe Bike, type: :model do

	before do
    bike_params = Hash.new
    bike_params[:name] = FFaker::Name.first_name
    bike_params[:description] = FFaker::BaconIpsum.phrase

    @bike = Bike.create(bike_params)
  end

	describe "test validation" do

		it "validates that a bike has a name" do
			expect(@bike.name).to eq("#{@bike.name}")
		end

		it "validates that the bike has a description" do
			expect(@bike.description).to eq("#{@bike.description}")
		end
	end

end
