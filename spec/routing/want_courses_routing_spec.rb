require "spec_helper"

describe WantCoursesController do
  describe "routing" do

    it "routes to #index" do
      get("/want_courses").should route_to("want_courses#index")
    end

    it "routes to #new" do
      get("/want_courses/new").should route_to("want_courses#new")
    end

    it "routes to #show" do
      get("/want_courses/1").should route_to("want_courses#show", :id => "1")
    end

    it "routes to #edit" do
      get("/want_courses/1/edit").should route_to("want_courses#edit", :id => "1")
    end

    it "routes to #create" do
      post("/want_courses").should route_to("want_courses#create")
    end

    it "routes to #update" do
      put("/want_courses/1").should route_to("want_courses#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/want_courses/1").should route_to("want_courses#destroy", :id => "1")
    end

  end
end
