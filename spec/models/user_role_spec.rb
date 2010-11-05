require 'spec_helper'

describe UserRole do
  before(:each) do
    @user_role = Factory(:user_role)
  end

  context "should not be valid without " do
    
    %w{ user_id role_id
        }.each do |attr|
      it "#{attr}" do
        @user_role.send("#{attr}=", nil)
        @user_role.valid?.should be_false
      end
    end

  end

end

