require 'spec_helper'

describe "uniform_orders/show.html.haml" do
  before(:each) do
    @uniform_order = assign(:uniform_order, stub_model(UniformOrder,
      :employee_id => 1,
      :shirt_size => "Shirt Size",
      :shirt_count => 1,
      :hat_size => "Hat Size",
      :hat_count => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Shirt Size/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Hat Size/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
