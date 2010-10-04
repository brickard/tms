require 'spec_helper'

describe "employees/show.html.haml" do
  before(:each) do
    @employee = assign(:employee, stub_model(Employee,
      :person_id => 1,
      :needs_special_hours => false,
      :needs_special_hours_detail => "MyText",
      :has_reliable_vehicle => false,
      :can_travel_long_term => false,
      :been_convicted => false,
      :been_convicted_detail => "MyText",
      :ever_failed_drug_test => false,
      :legal_us_worker => false,
      :applied_before => "",
      :applied_before_detail => "MyText",
      :drivers_license_valid => false,
      :drivers_license_state => "Drivers License State",
      :drivers_license_number => "Drivers License Number",
      :drivers_license_ever_suspended => false,
      :drivers_license_ever_suspended_detail => "MyText",
      :agree_to_terms => false
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain(1.to_s)
    rendered.should contain(false.to_s)
    rendered.should contain("MyText".to_s)
    rendered.should contain(false.to_s)
    rendered.should contain(false.to_s)
    rendered.should contain(false.to_s)
    rendered.should contain("MyText".to_s)
    rendered.should contain(false.to_s)
    rendered.should contain(false.to_s)
    rendered.should contain("".to_s)
    rendered.should contain("MyText".to_s)
    rendered.should contain(false.to_s)
    rendered.should contain("Drivers License State".to_s)
    rendered.should contain("Drivers License Number".to_s)
    rendered.should contain(false.to_s)
    rendered.should contain("MyText".to_s)
    rendered.should contain(false.to_s)
  end
end
