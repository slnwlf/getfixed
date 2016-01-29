require 'rails_helper'

RSpec.describe BikesController, type: :controller do

  describe "GET #index" do

  	it "should assign @bikes" do
  		all_bikes = Bike.all
      get :index
  		expect(assigns(:bikes)).to eq(all_bikes)
  	end

  	it "should render the :index view" do
  		get :index
  		expect(response).to render_template(:index)
  	end
  end

  describe "GET #new" do
    it "should assign @bike - so it creates a new bike" do
      get :new
      expect(assigns(:bike)).to be_instance_of(Bike)
    end

    it "should render the :new view" do
      get :new
      expect(response).to render_template(:new)
    end
  end



end