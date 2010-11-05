require 'spec_helper'

describe Role do
  before(:each) do
    Role.destroy_all
    @role = Factory(:role)
  end

  it "should not be valid with a name that is in use" do
    @role.save!
    lambda { Factory(:role, :name => @role.name) }.should raise_error(ActiveRecord::RecordInvalid)
  end


  context "should not be valid without " do
    
    %w{ name
        }.each do |attr|
      it "#{attr}" do
        @role.send("#{attr}=", nil)
        @role.valid?.should be_false
      end
    end

  end

end

