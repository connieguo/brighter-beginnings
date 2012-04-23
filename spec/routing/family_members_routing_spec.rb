require "spec_helper"

describe FamilyMembersController do
  describe "routing" do

    it "routes to #index" do
      get("/family_members").should route_to("family_members#index")
    end

    it "routes to #new" do
      get("/family_members/new").should route_to("family_members#new")
    end

    it "routes to #show" do
      get("/family_members/1").should route_to("family_members#show", :id => "1")
    end

    it "routes to #edit" do
      get("/family_members/1/edit").should route_to("family_members#edit", :id => "1")
    end

    it "routes to #create" do
      post("/family_members").should route_to("family_members#create")
    end

    it "routes to #update" do
      put("/family_members/1").should route_to("family_members#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/family_members/1").should route_to("family_members#destroy", :id => "1")
    end
    it "routes to family details" do 
      get("/families/1/family_members").should route_to("family_members#index", :id=> "1")
    end
  end
end
