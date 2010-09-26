require 'spec_helper'

describe "shifts/index.html.erb" do
  before(:each) do
    assign(:shifts, [
      stub_model(Shift,
        :project_id => 1,
        :name => "Name"
      ),
      stub_model(Shift,
        :project_id => 1,
        :name => "Name"
      )
    ])
  end

  it "renders a list of shifts" do
    render
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Name".to_s, :count => 2)
  end
end
