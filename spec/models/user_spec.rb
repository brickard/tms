require 'spec_helper'

describe User do
  before(:each) do
    @user = Factory(:user)
  end

  it "should not be valid with a email that is in use" do
    @user.save!
    lambda { Factory(:user, :email => @user.email) }.should raise_error(ActiveRecord::RecordInvalid)
  end

  context "should not be valid without " do
    
    %w{ email password
        }.each do |attr|
      it "#{attr}" do
        @user.send("#{attr}=", nil)
        @user.valid?.should be_false
      end
    end

  end

end

