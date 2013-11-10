require "spec_helper"

describe TradeMessagesController do
  describe "routing" do

    it "routes to #index" do
      get("/trade_messages").should route_to("trade_messages#index")
    end

    it "routes to #new" do
      get("/trade_messages/new").should route_to("trade_messages#new")
    end

    it "routes to #show" do
      get("/trade_messages/1").should route_to("trade_messages#show", :id => "1")
    end

    it "routes to #edit" do
      get("/trade_messages/1/edit").should route_to("trade_messages#edit", :id => "1")
    end

    it "routes to #create" do
      post("/trade_messages").should route_to("trade_messages#create")
    end

    it "routes to #update" do
      put("/trade_messages/1").should route_to("trade_messages#update", :id => "1")
    end

    it "routes to #destroy" do
      delete("/trade_messages/1").should route_to("trade_messages#destroy", :id => "1")
    end

  end
end
