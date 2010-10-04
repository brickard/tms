require 'spec_helper'

describe "employees/edit.html.haml" do
  before(:each) do
    @employee = assign(:employee, stub_model(Employee,
      :new_record? => false,
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
      :drivers_license_state => "MyString",
      :drivers_license_number => "MyString",
      :drivers_license_ever_suspended => false,
      :drivers_license_ever_suspended_detail => "MyText",
      :agree_to_terms => false
    ))
  end

  it "renders the edit employee form" do
    render

    rendered.should have_selector("form", :action => employee_path(@employee), :method => "post") do |form|
      form.should have_selector("input#employee_person_id", :name => "employee[person_id]")
      form.should have_selector("input#employee_needs_special_hours", :name => "employee[needs_special_hours]")
      form.should have_selector("textarea#employee_needs_special_hours_detail", :name => "employee[needs_special_hours_detail]")
      form.should have_selector("input#employee_has_reliable_vehicle", :name => "employee[has_reliable_vehicle]")
      form.should have_selector("input#employee_can_travel_long_term", :name => "employee[can_travel_long_term]")
      form.should have_selector("input#employee_been_convicted", :name => "employee[been_convicted]")
      form.should have_selector("textarea#employee_been_convicted_detail", :name => "employee[been_convicted_detail]")
      form.should have_selector("input#employee_ever_failed_drug_test", :name => "employee[ever_failed_drug_test]")
      form.should have_selector("input#employee_legal_us_worker", :name => "employee[legal_us_worker]")
      form.should have_selector("input#employee_applied_before", :name => "employee[applied_before]")
      form.should have_selector("textarea#employee_applied_before_detail", :name => "employee[applied_before_detail]")
      form.should have_selector("input#employee_drivers_license_valid", :name => "employee[drivers_license_valid]")
      form.should have_selector("input#employee_drivers_license_state", :name => "employee[drivers_license_state]")
      form.should have_selector("input#employee_drivers_license_number", :name => "employee[drivers_license_number]")
      form.should have_selector("input#employee_drivers_license_ever_suspended", :name => "employee[drivers_license_ever_suspended]")
      form.should have_selector("textarea#employee_drivers_license_ever_suspended_detail", :name => "employee[drivers_license_ever_suspended_detail]")
      form.should have_selector("input#employee_agree_to_terms", :name => "employee[agree_to_terms]")
    end
  end
end
