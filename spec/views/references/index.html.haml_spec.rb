require 'spec_helper'

describe "references/index.html.haml" do
  before(:each) do
    assign(:references, [
      stub_model(Reference,
        :employee_id => 1,
        :name => "Name",
        :contact_info => "Contact Info",
        :relationship => "Relationship"
      ),
      stub_model(Reference,
        :employee_id => 1,
        :name => "Name",
        :contact_info => "Contact Info",
        :relationship => "Relationship"
      )
    ])
  end

  it "renders a list of references" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Contact Info".to_s, :count => 2
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Relationship".to_s, :count => 2
  end
end
