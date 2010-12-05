require 'spec_helper'

describe Person do
  before(:each) do
    @person = Factory(:person)
  end

#  it "should not be valid with a employee that is in use" do
#    @person.save!
#    lambda { Factory(:person, :employee => @person.employee) }.should raise_error(ActiveRecord::RecordInvalid)
#  end

  context "should not be valid " do
    
    %w{ last_name first_name 
        }.each do |attr|
      it "without #{attr}" do
        @person.send("#{attr}=", nil)
        @person.valid?.should be_false
      end
    end

    context "on step 1" do
      before(:each) do
        @person.form_step = 1
      end

      %w{ address1 city state zipcode home_phone date_of_birth
          }.each do |attr|
        it "without #{attr}" do
          pending "Need to implement state machine for user"
          @person.send("#{attr}=", nil)
          @person.valid?.should be_false
        end
      end

    end


  end

end

