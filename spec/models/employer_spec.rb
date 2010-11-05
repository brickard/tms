require 'spec_helper'

describe Employer do
  before(:each) do
    @employer = Factory(:employer)
  end

  it "should not be valid with a employee that is in use" do
    @employer.save!
    lambda { Factory(:employer, :employee => @employer.employee) }.should raise_error(ActiveRecord::RecordInvalid)
  end

  context "should not be valid without " do
    
    %w{ employee company_name start_date end_date job_title supervisor_name 
        start_salary end_salary reason_for_leaving
        }.each do |attr|
      it "#{attr}" do
        @employer.send("#{attr}=", nil)
        @employer.valid?.should be_false
      end
    end

  end

end

