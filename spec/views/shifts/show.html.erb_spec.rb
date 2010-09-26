require 'spec_helper'

describe "shifts/show.html.erb" do
  before(:each) do
    @shift = assign(:shift, stub_model(Shift,
      :project_id => 1,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain(1.to_s)
    rendered.should contain("Name".to_s)
  end
end
