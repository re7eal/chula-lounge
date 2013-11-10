require "spec_helper"

describe HaveCoursesController do
  describe "routing" do

    it "routes to #index" do
      get("/have_courses").should route_to("have_courses#index")
    end

    it "routes to #new" do
      get("/have_courses/new").should route_to("have_courses#new")
    end

    it "routes to #show" do
      get("/have_courses/1").should route_to("have_courses#show", :id => "1")
    end

    it "routes to #edit" do
      get("/have_courses/1/edit").should route_to("have_courses#edit", :id => "1")
    end

    it "routes to #create" do
      post("/have_courses").should route_to("have_courses#create")
    end

    it "routes to #update" do
      put("/have_courses/1").should route_to("have_courses#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/have_courses/1").should route_to("have_courses#destroy", :id => "1")
    end

  end
end
