require 'spec_helper'

describe UniformOrder do
  before(:each) do
    @uniform_order = Factory(:uniform_order)
  end

  it "should not be valid with a user that is in use" do
    @uniform_order.save!
    lambda { Factory(:uniform_order, :user => @uniform_order.user) }.should raise_error(ActiveRecord::RecordInvalid)
  end

  context "should not be valid without " do
    
    %w{ user shirt_size shirt_count hat_size hat_count
        }.each do |attr|
      it "#{attr}" do
        @uniform_order.send("#{attr}=", nil)
        @uniform_order.valid?.should be_false
      end
    end

  end

end

