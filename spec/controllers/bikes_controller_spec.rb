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

  describe "POST #create" do
    it "should add a new bike to all_bikes" do
      post :create, bike: {title: "blah", description: "blah"}
      expect(response).to redirect_to new_bike_path
    end
  end

  describe "show page for a bike" do
    before do
      @bike = Bike.create(name: FFaker::Name.first_name, description: FFaker::Lorem.sentence)
      get :show, id: @bike.id
    end

    it "should find the id and assign to this instance of a bike" do
      expect(assigns(:bike)).to eq(@bike)
    end

    it "should render the page" do
      expect(response).to render_template(:show)
    end
  end

  describe "edit page for a bike" do
    before do
      @bike = Bike.create(name: FFaker::Name.first_name, description: FFaker::Lorem.sentence)
      get :edit, id: @bike.id
    end

    it "should get the bike its going to edit" do
      expect(assigns(:bike)).to eq(@bike)
    end

    it "should render the edit page" do
      expect(response).to render_template(:edit)
    end
  end

  describe "update test" do
    before do
      @bike = Bike.create(name: FFaker::Name.first_name, description: FFaker::Lorem.sentence)  
    end

    context "success" do
      before do
        @new_name = FFaker::Name.first_name
        @new_description = FFaker::Lorem.sentence
        put :update, id: @bike.id, bike: { name: @new_name, description: @new_description }
        @bike.reload
      end

      it "should update the bike in the bike db" do
        expect(@bike.name).to eq(@new_name)
        expect(@bike.description).to eq(@new_description)
      end
    end

    context "failure" do
      it "should redirect to edit bike path when update fails" do
        #update with failed bike params
        put :update, id: @bike.id, bike: { name: nil, description: nil }
        expect(response).to redirect_to(bike_path)
      end
    end

    # describe "destroy test" do
    #   before do
    #     @bike = Bike.create(name: FFaker::Name.first_name, description: FFaker::Lorem.sentence)  
    #     delete :destroy, id: @bike
    #   end 

    #   it "should get the bike it needs to delete" do
    #     expect(@bike).to eq(Bike.find_by_id(@bike))
    #   end

    #   it "should destroy this instance of the bike" do
    #     expect(@bike).to change(Bike,:count).by(-1)
    #   end

    #   it "should redirect to the bike#show page" do
    #     expect(response).to redirect_to(all_bikes)
    #   end
    # end
end
end