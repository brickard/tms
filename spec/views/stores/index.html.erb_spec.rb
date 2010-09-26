require 'spec_helper'

describe "stores/index.html.erb" do
  before(:each) do
    assign(:stores, [
      stub_model(Store,
        :client_id => 1,
        :region_id => 1,
        :manager_id => 1,
        :active => false,
        :name => "Name",
        :address1 => "Address1",
        :address2 => "Address2",
        :city => "City",
        :state => "State",
        :zipcode => "Zipcode"
      ),
      stub_model(Store,
        :client_id => 1,
        :region_id => 1,
        :manager_id => 1,
        :active => false,
        :name => "Name",
        :address1 => "Address1",
        :address2 => "Address2",
        :city => "City",
        :state => "State",
        :zipcode => "Zipcode"
      )
    ])
  end

  it "renders a list of stores" do
    render
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => false.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Name".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Address1".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Address2".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "City".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "State".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Zipcode".to_s, :count => 2)
  end
end
