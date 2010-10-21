require 'spec_helper'

describe "employers/index.html.haml" do
  before(:each) do
    assign(:employers, [
      stub_model(Employer,
        :employee_id => 1,
        :company_name => "Company Name",
        :phone_number => "Phone Number",
        :job_title => "Job Title",
        :supervisor_name => "Supervisor Name",
        :start_salary => "Start Salary",
        :end_salary => "End Salary",
        :reason_for_leaving => "Reason For Leaving"
      ),
      stub_model(Employer,
        :employee_id => 1,
        :company_name => "Company Name",
        :phone_number => "Phone Number",
        :job_title => "Job Title",
        :supervisor_name => "Supervisor Name",
        :start_salary => "Start Salary",
        :end_salary => "End Salary",
        :reason_for_leaving => "Reason For Leaving"
      )
    ])
  end

  it "renders a list of employers" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Company Name".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Phone Number".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Job Title".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Supervisor Name".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Start Salary".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "End Salary".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Reason For Leaving".to_s, :count => 2
  end
end
