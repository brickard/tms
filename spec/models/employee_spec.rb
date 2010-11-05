require 'spec_helper'

describe Employee do
  before(:each) do
    @employee = Factory(:employee)
  end

  it "should not be valid with a person that is in use" do
    @employee.save!
    lambda { Factory(:employee, :person => @person) }.should raise_error(ActiveRecord::RecordInvalid)
  end

  context "should not be valid without " do
    
    %w{ person needs_special_hours available_at has_reliable_vehicle 
        can_travel_long_term been_convicted ever_failed_drug_test legal_us_worker
        applied_before drivers_license_valid drivers_license_ever_suspended
        agree_to_terms
        }.each do |attr|
      it "#{attr}" do
        @employee.send("#{attr}=", nil)
        @employee.valid?.should be_false
      end
    end

  end

end

