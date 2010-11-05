require 'spec_helper'

describe Store do
  before(:each) do
    @store = Factory(:store)
  end

  it "should not be valid without a name" do
    @store.name = nil
    @store.valid?.should be_false
  end

  it "should not be valid without a client" do
    @store.client = nil
    @store.valid?.should be_false
  end

  it "should not be valid without a region" do
    @store.region = nil
    @store.valid?.should be_false
  end

  it "should not be valid without a manager" do
    @store.manager = nil
    @store.valid?.should be_false
  end

end
