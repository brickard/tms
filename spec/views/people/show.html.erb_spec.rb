require 'spec_helper'

describe "people/show.html.erb" do
  before(:each) do
    @person = assign(:person, stub_model(Person,
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
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain(1.to_s)
    rendered.should contain("Last Name".to_s)
    rendered.should contain("First Name".to_s)
    rendered.should contain("Middle Name".to_s)
    rendered.should contain("Address1".to_s)
    rendered.should contain("Address2".to_s)
    rendered.should contain("City".to_s)
    rendered.should contain("State".to_s)
    rendered.should contain("Zipcode".to_s)
    rendered.should contain("Phone1".to_s)
    rendered.should contain("Phone2".to_s)
  end
end
