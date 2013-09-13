require 'spec_helper'

describe FriendsController do

  describe "GET #index" do
    it "populates an array of friends" do
      friend = FactoryGirl.create(:friend)
      get :index
      assigns(:friends).should eq([friend])
    end

    it "renders the :index view" do
      get :index
      response.should render_template :index
    end
  end

  describe "GET #show" do
    it "assigns the selected friend to @friend" do
      friend = FactoryGirl.create(:friend)
      get :show, id: friend
      assigns(:friend).should eq(friend)
    end

    it "renders the :show view" do
      get :show, id: FactoryGirl.create(:friend)
      response.should render_template :show
    end
  end

  describe "GET #new " do
    it "assigns a family and children to a friend" do
      friend = FactoryGirl.build(:friend)
      family = Family.new
      get :new

      
      assigns(:contact).family.should eq(:family)
    end

    it "renders the :new view" do
      get :new
      response.should render_template :new
    end
  end
end
