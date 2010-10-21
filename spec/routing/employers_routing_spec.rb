require "spec_helper"

describe EmployersController do
  describe "routing" do

    it "recognizes and generates #index" do
      { :get => "/employers" }.should route_to(:controller => "employers", :action => "index")
    end

    it "recognizes and generates #new" do
      { :get => "/employers/new" }.should route_to(:controller => "employers", :action => "new")
    end

    it "recognizes and generates #show" do
      { :get => "/employers/1" }.should route_to(:controller => "employers", :action => "show", :id => "1")
    end

    it "recognizes and generates #edit" do
      { :get => "/employers/1/edit" }.should route_to(:controller => "employers", :action => "edit", :id => "1")
    end

    it "recognizes and generates #create" do
      { :post => "/employers" }.should route_to(:controller => "employers", :action => "create")
    end

    it "recognizes and generates #update" do
      { :put => "/employers/1" }.should route_to(:controller => "employers", :action => "update", :id => "1")
    end

    it "recognizes and generates #destroy" do
      { :delete => "/employers/1" }.should route_to(:controller => "employers", :action => "destroy", :id => "1")
    end

  end
end
