require "spec_helper"

describe ShiftsController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/shifts" }.should route_to(:controller => "shifts", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/shifts/new" }.should route_to(:controller => "shifts", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/shifts/1" }.should route_to(:controller => "shifts", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/shifts/1/edit" }.should route_to(:controller => "shifts", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/shifts" }.should route_to(:controller => "shifts", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/shifts/1" }.should route_to(:controller => "shifts", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/shifts/1" }.should route_to(:controller => "shifts", :action => "destroy", :id => "1")
    end

  end
end
