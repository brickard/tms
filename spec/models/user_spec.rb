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

  end

  context "form step state_machine" do

    it "should respond to increment_step" do
      @user.should respond_to(:increment_step)
    end

    it "should respond to decrement_step" do
      @user.should respond_to(:decrement_step)
    end
   
    context "step0" do

      it "should be on step0" do
        @user.form_step.should == 'step0'
      end

    end

    context "step1" do

      before(:each) do
        @user.increment_step
      end

      it "should be on step1" do
        @user.form_step.should == 'step1'
      end

      %w{ address1 city state zipcode home_phone date_of_birth }.each do |attr|

        it "should not be valid without #{attr}" do
          @user.send("#{attr}=", nil)
          @user.should_not be_valid
        end

      end

    end

    context "step2" do

      before(:each) do
        2.times { @user.increment_step }
      end

      it "should be on step2" do
        @user.form_step.should == 'step2'
      end

      %w{ address1 city state zipcode home_phone date_of_birth
          needs_special_hours available_at has_reliable_vehicle 
          can_travel_long_term been_convicted ever_failed_drug_test
          applied_before drivers_license_valid agree_to_terms 
          emergency_contact_name emergency_contact_phone
          legal_us_worker
           }.each do |attr|

        it "should not be valid without #{attr}" do
          @user.send("#{attr}=", nil)
          @user.should_not be_valid
        end

      end

      %w{ needs_special_hours been_convicted applied_before 
          drivers_license_ever_suspended
           }.each do |attr|

        it "should not be valid when #{attr}_detail is blank and #{attr} is true" do
          @user.send("#{attr}=", true)
          @user.send("#{attr}_detail=", nil)
          @user.should_not be_valid
        end

      end
    end
  end
end

describe User do

  context "scope named" do
  
    before(:all) do
      User.destroy_all
      2.times do
        Factory.create(:admin_user)
        Factory.create(:manager_user)
        Factory.create(:employee_user)
        Factory.create(:applicant_user)
      end
    end
    
    it "admins should have count of 2" do
      User.admins.count.should == 2
    end

    it "managers should have count of 2" do
      User.managers.count.should == 2
    end

    it "employees should have count of 2" do
      User.employees.count.should == 2
    end

    it "applicants should have count of 2" do
      User.applicants.count.should == 2
    end

  end
end
