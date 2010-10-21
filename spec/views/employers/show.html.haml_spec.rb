require 'spec_helper'

describe "employers/show.html.haml" do
  before(:each) do
    @employer = assign(:employer, stub_model(Employer,
      :employee_id => 1,
      :company_name => "Company Name",
      :phone_number => "Phone Number",
      :job_title => "Job Title",
      :supervisor_name => "Supervisor Name",
      :start_salary => "Start Salary",
      :end_salary => "End Salary",
      :reason_for_leaving => "Reason For Leaving"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Company Name/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Phone Number/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Job Title/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Supervisor Name/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Start Salary/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/End Salary/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Reason For Leaving/)
  end
end
