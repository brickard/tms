require 'spec_helper'

describe UserSkill do
  before(:each) do
    @user_skill = Factory(:user_skill)
  end

  context "should not be valid without" do
    %w{ user_id skill_id }.each do |attr|
      it "#{attr} set" do
        @user_skill.send("#{attr}=", nil)
        @user_skill.should_not be_valid
      end
    end
  end

end
