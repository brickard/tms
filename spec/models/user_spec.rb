require 'spec_helper'

describe User do
  before(:each) do
    @user = Factory( :user )
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

    context "valid should return" do

      context "false when" do
        
        it "role is not in ROLES" do
          @user.role = 'this _is not IN RolEZez'
          @user.should_not be_valid
        end

        %w{ last_name first_name }.each do |attr|
          it "#{attr} is blank" do
            @user.send( "#{attr}=", nil )
            @user.should_not be_valid
          end
        end

      end

      context "true when" do

        it "role is in ROLES" do
          @user.role = User::ROLES[0]
          @user.should be_valid
        end

      end

    end

    context "scope named" do
    
      before(:all) do
        User.destroy_all
        10.times do
          Factory.create(:admin_user)
          Factory.create(:manager_user)
          Factory.create(:employee_user)
          Factory.create(:applicant_user)
        end
      end
      
      it "admins should have count of 11" do
        User.admins.count.should == 11
      end

      it "managers should have count of 10" do
        User.managers.count.should == 10
      end

      it "employees should have count of 10" do
        User.employees.count.should == 10
      end

      it "applicants should have count of 10" do
        User.applicants.count.should == 10
      end


    end
  end

  context "on step 1" do
    before(:each) do
      #@person.form_step = 1
    end

    %w{ address1 city state zipcode home_phone date_of_birth
        }.each do |attr|
      it "without #{attr}" do
        pending "Need to implement state machine for user"
        @user.send("#{attr}=", nil)
        @user.valid?.should be_false
      end
    end

  end
end

