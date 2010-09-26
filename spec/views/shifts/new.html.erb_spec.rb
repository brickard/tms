require 'spec_helper'

describe "shifts/new.html.erb" do
  before(:each) do
    assign(:shift, stub_model(Shift,
      :new_record? => true,
      :project_id => 1,
      :name => "MyString"
    ))
  end

  it "renders new shift form" do
    render

    rendered.should have_selector("form", :action => shifts_path, :method => "post") do |form|
      form.should have_selector("input#shift_project_id", :name => "shift[project_id]")
      form.should have_selector("input#shift_name", :name => "shift[name]")
    end
  end
end
