require 'spec_helper'

describe User do
  before(:each) do
    @user = Factory(:user)
  end

  it "should not be valid with a email that is in use" do
    @user.save!
    lambda { Factory(:user, :email => @user.email) }.should raise_error(ActiveRecord::RecordInvalid)
  end

  context "should have a " do
    
    %w{ email password role
        }.each do |attr|
      it "#{attr} set after save when input is nil" do
        @user.send("#{attr}=", nil)
        @user.save!.should be_true
        @user.send("#{attr}").should_not be_blank
      end
    end

    context "should not be valid when" do
      
      it "role is nil" do
        @user.role = nil
        @user.should_not be_valid
      end

    end
  end
end

