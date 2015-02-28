require "rails_helper"

describe "orders routing", type: :routing do
  it { expect(:get => "/").to route_to("orders#index") }
  it { expect(:get => "/orders").to route_to("orders#index") }
  it { expect(:post => "/orders").to route_to("orders#create") }
  it { expect(:get => "/orders/new").to route_to("orders#new") }
    
  describe "GET /orders/:id/edit" do
    it { expect(:get => "/orders/:id/edit").to_not be_routable }
  end
  
  describe "GET /orders/:id" do
    it { expect(:get => "/orders/:id").to_not be_routable }
  end
  
  describe "PATCH /orders/:id" do
    it { expect(:patch => "/orders/:id").to_not be_routable }
  end
  
  describe "PUT /orders/:id" do
    it { expect(:put => "/orders/:id").to_not be_routable }
  end
  
  describe "DELETE /orders/:id" do
    it { expect(:delete => "/orders/:id").to_not be_routable }
  end
end
