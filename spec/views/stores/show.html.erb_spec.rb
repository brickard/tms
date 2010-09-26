require 'spec_helper'

describe "stores/show.html.erb" do
  before(:each) do
    @store = assign(:store, stub_model(Store,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain(1.to_s)
    rendered.should contain(1.to_s)
    rendered.should contain(1.to_s)
    rendered.should contain(false.to_s)
    rendered.should contain("Name".to_s)
    rendered.should contain("Address1".to_s)
    rendered.should contain("Address2".to_s)
    rendered.should contain("City".to_s)
    rendered.should contain("State".to_s)
    rendered.should contain("Zipcode".to_s)
  end
end
