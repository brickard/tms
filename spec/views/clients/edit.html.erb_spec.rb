require 'spec_helper'

describe "clients/edit.html.erb" do
  before(:each) do
    @client = assign(:client, stub_model(Client,
      :new_record? => false,
      :name => "MyString",
      :active => false
    ))
  end

  it "renders the edit client form" do
    render

    rendered.should have_selector("form", :action => client_path(@client), :method => "post") do |form|
      form.should have_selector("input#client_name", :name => "client[name]")
      form.should have_selector("input#client_active", :name => "client[active]")
    end
  end
end
