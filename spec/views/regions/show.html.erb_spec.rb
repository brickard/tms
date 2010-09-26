require 'spec_helper'

describe "regions/show.html.erb" do
  before(:each) do
    @region = assign(:region, stub_model(Region,
      :client_id => 1,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    rendered.should contain(1.to_s)
    rendered.should contain("Name".to_s)
  end
end
