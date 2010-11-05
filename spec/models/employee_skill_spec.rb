require 'spec_helper'

describe EmployeeSkill do
  before(:each) do
    @employee_skill = Factory(:employee_skill)
  end

  context "should not be valid without" do
    %w{ employee_id skill_id }.each do |attr|
      it "#{attr} set" do
        @employee_skill.send("#{attr}=", nil)
        @employee_skill.should_not be_valid
      end
    end
  end

end
