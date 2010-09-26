require 'spec_helper'

describe "regions/new.html.erb" do
  before(:each) do
    assign(:region, stub_model(Region,
      :new_record? => true,
      :client_id => 1,
      :name => "MyString"
    ))
  end

  it "renders new region form" do
    render

    rendered.should have_selector("form", :action => regions_path, :method => "post") do |form|
      form.should have_selector("input#region_client_id", :name => "region[client_id]")
      form.should have_selector("input#region_name", :name => "region[name]")
    end
  end
end
