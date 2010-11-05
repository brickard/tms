require 'spec_helper'

describe Client do
  before(:each) do
    Client.destroy_all
    @client = Factory(:client)
  end

  it "should not be valid without a name" do
    @client.name = nil
    @client.valid?.should be_false
  end

  it "should not be valid with a name that is in use" do
    @client.save!
    lambda { Factory(:client, :name => @client.name) }.should raise_error(ActiveRecord::RecordInvalid)
  end

end
