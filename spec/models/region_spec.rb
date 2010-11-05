require 'spec_helper'

describe Region do
  before(:each) do
    @region = Factory(:region)
  end

  it "should not be valid without a name" do
    @region.name = nil
    @region.valid?.should be_false
  end

  it "should not be valid without a client" do
    @region.client = nil
    @region.valid?.should be_false
  end

end
