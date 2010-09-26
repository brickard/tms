require 'spec_helper'

describe "regions/edit.html.erb" do
  before(:each) do
    @region = assign(:region, stub_model(Region,
      :new_record? => false,
      :client_id => 1,
      :name => "MyString"
    ))
  end

  it "renders the edit region form" do
    render

    rendered.should have_selector("form", :action => region_path(@region), :method => "post") do |form|
      form.should have_selector("input#region_client_id", :name => "region[client_id]")
      form.should have_selector("input#region_name", :name => "region[name]")
    end
  end
end
