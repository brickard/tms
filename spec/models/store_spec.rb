require 'spec_helper'

describe Store do
  before(:each) do
    @store = Factory(:store)
  end

  it "should not be valid without a name" do
    @store.name = nil
    @store.should_not be_valid
  end

  it "should not be valid without a client" do
    @store.client = nil
    @store.should_not be_valid
  end

  it "should not be valid without a region" do
    @store.region = nil
    @store.should_not be_valid
  end

  it "should not be valid without a manager" do
    @store.manager = nil
    @store.should_not be_valid
  end

end
