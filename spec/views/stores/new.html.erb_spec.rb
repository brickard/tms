require 'spec_helper'

describe "stores/new.html.erb" do
  before(:each) do
    assign(:store, stub_model(Store,
      :new_record? => true,
      :client_id => 1,
      :region_id => 1,
      :manager_id => 1,
      :active => false,
      :name => "MyString",
      :address1 => "MyString",
      :address2 => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zipcode => "MyString"
    ))
  end

  it "renders new store form" do
    render

    rendered.should have_selector("form", :action => stores_path, :method => "post") do |form|
      form.should have_selector("input#store_client_id", :name => "store[client_id]")
      form.should have_selector("input#store_region_id", :name => "store[region_id]")
      form.should have_selector("input#store_manager_id", :name => "store[manager_id]")
      form.should have_selector("input#store_active", :name => "store[active]")
      form.should have_selector("input#store_name", :name => "store[name]")
      form.should have_selector("input#store_address1", :name => "store[address1]")
      form.should have_selector("input#store_address2", :name => "store[address2]")
      form.should have_selector("input#store_city", :name => "store[city]")
      form.should have_selector("input#store_state", :name => "store[state]")
      form.should have_selector("input#store_zipcode", :name => "store[zipcode]")
    end
  end
end
