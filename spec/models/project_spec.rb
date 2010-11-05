require 'spec_helper'

describe Project do
  before(:each) do
    @project = Factory(:project)
  end

  context "should not be valid without " do
    
    %w{ name store_id
        }.each do |attr|
      it "#{attr}" do
        @project.send("#{attr}=", nil)
        @project.valid?.should be_false
      end
    end

  end

end

