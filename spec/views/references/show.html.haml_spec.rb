require 'spec_helper'

describe "references/show.html.haml" do
  before(:each) do
    @reference = assign(:reference, stub_model(Reference,
      :employee_id => 1,
      :name => "Name",
      :contact_info => "Contact Info",
      :relationship => "Relationship"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Name/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Contact Info/)
    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    rendered.should match(/Relationship/)
  end
end
