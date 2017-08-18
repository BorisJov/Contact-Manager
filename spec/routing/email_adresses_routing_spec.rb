require "rails_helper"

RSpec.describe EmailAdressesController, type: :routing do
  describe "routing" do

    it "routes to #index" do
      expect(:get => "/email_adresses").to route_to("email_adresses#index")
    end

    it "routes to #new" do
      expect(:get => "/email_adresses/new").to route_to("email_adresses#new")
    end

    it "routes to #show" do
      expect(:get => "/email_adresses/1").to route_to("email_adresses#show", :id => "1")
    end

    it "routes to #edit" do
      expect(:get => "/email_adresses/1/edit").to route_to("email_adresses#edit", :id => "1")
    end

    it "routes to #create" do
      expect(:post => "/email_adresses").to route_to("email_adresses#create")
    end

    it "routes to #update via PUT" do
      expect(:put => "/email_adresses/1").to route_to("email_adresses#update", :id => "1")
    end

    it "routes to #update via PATCH" do
      expect(:patch => "/email_adresses/1").to route_to("email_adresses#update", :id => "1")
    end

    it "routes to #destroy" do
      expect(:delete => "/email_adresses/1").to route_to("email_adresses#destroy", :id => "1")
    end

  end
end
