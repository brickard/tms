require 'spec_helper'

describe "people/index.html.erb" do
  before(:each) do
    assign(:people, [
      stub_model(Person,
        :user_id => 1,
        :last_name => "Last Name",
        :first_name => "First Name",
        :middle_name => "Middle Name",
        :address1 => "Address1",
        :address2 => "Address2",
        :city => "City",
        :state => "State",
        :zipcode => "Zipcode",
        :phone1 => "Phone1",
        :phone2 => "Phone2"
      ),
      stub_model(Person,
        :user_id => 1,
        :last_name => "Last Name",
        :first_name => "First Name",
        :middle_name => "Middle Name",
        :address1 => "Address1",
        :address2 => "Address2",
        :city => "City",
        :state => "State",
        :zipcode => "Zipcode",
        :phone1 => "Phone1",
        :phone2 => "Phone2"
      )
    ])
  end

  it "renders a list of people" do
    render
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Last Name".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "First Name".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Middle Name".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Address1".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Address2".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "City".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "State".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Zipcode".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Phone1".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Phone2".to_s, :count => 2)
  end
end
