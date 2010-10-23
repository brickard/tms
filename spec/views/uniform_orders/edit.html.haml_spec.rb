require 'spec_helper'

describe "uniform_orders/edit.html.haml" do
  before(:each) do
    @uniform_order = assign(:uniform_order, stub_model(UniformOrder,
      :new_record? => false,
      :employee_id => 1,
      :shirt_size => "MyString",
      :shirt_count => 1,
      :hat_size => "MyString",
      :hat_count => 1
    ))
  end

  it "renders the edit uniform_order form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => uniform_order_path(@uniform_order), :method => "post" do
      assert_select "input#uniform_order_employee_id", :name => "uniform_order[employee_id]"
      assert_select "input#uniform_order_shirt_size", :name => "uniform_order[shirt_size]"
      assert_select "input#uniform_order_shirt_count", :name => "uniform_order[shirt_count]"
      assert_select "input#uniform_order_hat_size", :name => "uniform_order[hat_size]"
      assert_select "input#uniform_order_hat_count", :name => "uniform_order[hat_count]"
    end
  end
end
