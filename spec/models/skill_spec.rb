require 'spec_helper'

describe Skill do
  before(:each) do
    @skill = Factory(:skill)
  end

  context "should not be valid without" do
    %w{ name }.each do |attr|
      it "#{attr} set" do
        @skill.send("#{attr}=", nil)
        @skill.should_not be_valid
      end
    end
  end

end

