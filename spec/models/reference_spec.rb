require 'spec_helper'

describe Reference do
  before(:each) do
    @reference = Factory(:reference)
  end

  context "should not be valid without " do
    
    %w{ employee_id name contact_info relationship type_of_reference
        }.each do |attr|
      it "#{attr}" do
        @reference.send("#{attr}=", nil)
        @reference.valid?.should be_false
      end
    end

  end

end

