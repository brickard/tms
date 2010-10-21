require 'spec_helper'

describe "employers/edit.html.haml" do
  before(:each) do
    @employer = assign(:employer, stub_model(Employer,
      :new_record? => false,
      :employee_id => 1,
      :company_name => "MyString",
      :phone_number => "MyString",
      :job_title => "MyString",
      :supervisor_name => "MyString",
      :start_salary => "MyString",
      :end_salary => "MyString",
      :reason_for_leaving => "MyString"
    ))
  end

  it "renders the edit employer form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => employer_path(@employer), :method => "post" do
      assert_select "input#employer_employee_id", :name => "employer[employee_id]"
      assert_select "input#employer_company_name", :name => "employer[company_name]"
      assert_select "input#employer_phone_number", :name => "employer[phone_number]"
      assert_select "input#employer_job_title", :name => "employer[job_title]"
      assert_select "input#employer_supervisor_name", :name => "employer[supervisor_name]"
      assert_select "input#employer_start_salary", :name => "employer[start_salary]"
      assert_select "input#employer_end_salary", :name => "employer[end_salary]"
      assert_select "input#employer_reason_for_leaving", :name => "employer[reason_for_leaving]"
    end
  end
end
