require "spec_helper"

describe UniformOrdersController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/uniform_orders" }.should route_to(:controller => "uniform_orders", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/uniform_orders/new" }.should route_to(:controller => "uniform_orders", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/uniform_orders/1" }.should route_to(:controller => "uniform_orders", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/uniform_orders/1/edit" }.should route_to(:controller => "uniform_orders", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/uniform_orders" }.should route_to(:controller => "uniform_orders", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/uniform_orders/1" }.should route_to(:controller => "uniform_orders", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/uniform_orders/1" }.should route_to(:controller => "uniform_orders", :action => "destroy", :id => "1")
    end

  end
end
