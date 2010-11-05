require 'spec_helper'

describe Shift do
  before(:each) do
    @shift = Factory(:shift)
  end

  context "should not be valid without " do
    
    %w{ project_id name
        }.each do |attr|
      it "#{attr}" do
        @shift.send("#{attr}=", nil)
        @shift.valid?.should be_false
      end
    end

  end

end

