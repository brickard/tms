require 'spec_helper'

describe "clients/index.html.erb" do
  before(:each) do
    assign(:clients, [
      stub_model(Client,
        :name => "Name",
        :active => false
      ),
      stub_model(Client,
        :name => "Name",
        :active => false
      )
    ])
  end

  it "renders a list of clients" do
    render
    rendered.should have_selector("tr>td", :content => "Name".to_s, :count => 2)
    rendered.should have_selector("tr>td", :content => false.to_s, :count => 2)
  end
end
