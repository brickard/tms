require "spec_helper"

describe StoresController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/stores" }.should route_to(:controller => "stores", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/stores/new" }.should route_to(:controller => "stores", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/stores/1" }.should route_to(:controller => "stores", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/stores/1/edit" }.should route_to(:controller => "stores", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/stores" }.should route_to(:controller => "stores", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/stores/1" }.should route_to(:controller => "stores", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/stores/1" }.should route_to(:controller => "stores", :action => "destroy", :id => "1")
    end

  end
end
