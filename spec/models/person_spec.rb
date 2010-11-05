require 'spec_helper'

describe Person do
  before(:each) do
    @person = Factory(:person)
  end

#  it "should not be valid with a employee that is in use" do
#    @person.save!
#    lambda { Factory(:person, :employee => @person.employee) }.should raise_error(ActiveRecord::RecordInvalid)
#  end

  context "should not be valid without " do
    
    %w{ last_name first_name 
        }.each do |attr|
      it "#{attr}" do
        @person.send("#{attr}=", nil)
        @person.valid?.should be_false
      end
    end

  end

end

