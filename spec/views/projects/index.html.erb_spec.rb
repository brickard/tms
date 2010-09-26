require 'spec_helper'

describe "projects/index.html.erb" do
  before(:each) do
    assign(:projects, [
      stub_model(Project,
        :store_id => 1,
        :name => "Name"
      ),
      stub_model(Project,
        :store_id => 1,
        :name => "Name"
      )
    ])
  end

  it "renders a list of projects" do
    render
    rendered.should have_selector("tr>td", :content => 1.to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => "Name".to_s, :count => 2)
  end
end
