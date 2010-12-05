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

  it "should not be valid without a manager that is a user with manager role" do
    @nonmanager = Factory.create(:admin_user)
    @store.manager = @nonmanager
    @store.should_not be_valid
  end

  it "should be valid with a manager that is a user with manager role" do
    @manager = Factory.create(:manager_user)
    @store.manager = @manager
    @store.should be_valid
  end
end
