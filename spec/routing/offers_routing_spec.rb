require "spec_helper"

describe OffersController do
  describe "routing" do

    it "routes to #index" do
      get("/offers").should route_to("offers#index")
    end

    it "routes to #create" do
      post("/offers").should route_to("offers#create")
    end

  end
end
