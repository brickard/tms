require 'spec_helper'

describe "uniform_orders/index.html.haml" do
  before(:each) do
    assign(:uniform_orders, [
      stub_model(UniformOrder,
        :employee_id => 1,
        :shirt_size => "Shirt Size",
        :shirt_count => 1,
        :hat_size => "Hat Size",
        :hat_count => 1
      ),
      stub_model(UniformOrder,
        :employee_id => 1,
        :shirt_size => "Shirt Size",
        :shirt_count => 1,
        :hat_size => "Hat Size",
        :hat_count => 1
      )
    ])
  end

  it "renders a list of uniform_orders" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Shirt Size".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Hat Size".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
