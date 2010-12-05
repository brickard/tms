require 'spec_helper'

describe ModelBehaviors::RolesBehavior do

  before(:all) { @model = Factory(:user) }

  context "creates constant named" do

    it "ROLES" do
      defined?(@model.class::ROLES).should be_true
    end
    
  end

  context "creates method named" do

    ::ModelBehaviors::RolesBehavior::ROLES.each do |role_name|
      it "#{role_name}?" do
        @model.respond_to?("#{role_name}?").should be_true
      end
    end

    it "role?" do
      @model.respond_to?("role?").should be_true
    end
    
    it "valid?" do
      @model.respond_to?("valid?").should be_true
    end
    
    
  end

  context "method named" do

    ::ModelBehaviors::RolesBehavior::ROLES.each do |role_name|

      it "role?(#{role_name}) should be true when role is #{role_name}" do
        @model.role = role_name
        @model.role?("#{role_name}").should be_true
      end

      it "role?(#{role_name}) should be false when role is not #{role_name}" do
        @model.role = nil
        @model.role?("#{role_name}").should be_false
      end

      it "#{role_name}? should be true when role is #{role_name}" do
        @model.role = role_name
        @model.send("#{role_name}?").should be_true
      end

      it "#{role_name}? should be false when role is not #{role_name}" do
        @model.role = nil
        @model.send("#{role_name}?").should be_false
      end
    end
    
  end

  it "should not allow role to be set to values not in ROLES" do
    @model.role = 'dogfood'
    @model.should_not be_valid
  end

end


