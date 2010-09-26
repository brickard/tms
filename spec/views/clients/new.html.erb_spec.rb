require 'spec_helper'

describe "clients/new.html.erb" do
  before(:each) do
    assign(:client, stub_model(Client,
      :new_record? => true,
      :name => "MyString",
      :active => false
    ))
  end

  it "renders new client form" do
    render

    rendered.should have_selector("form", :action => clients_path, :method => "post") do |form|
      form.should have_selector("input#client_name", :name => "client[name]")
      form.should have_selector("input#client_active", :name => "client[active]")
    end
  end
end
