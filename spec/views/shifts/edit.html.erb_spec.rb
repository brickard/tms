require 'spec_helper'

describe "shifts/edit.html.erb" do
  before(:each) do
    @shift = assign(:shift, stub_model(Shift,
      :new_record? => false,
      :project_id => 1,
      :name => "MyString"
    ))
  end

  it "renders the edit shift form" do
    render

    rendered.should have_selector("form", :action => shift_path(@shift), :method => "post") do |form|
      form.should have_selector("input#shift_project_id", :name => "shift[project_id]")
      form.should have_selector("input#shift_name", :name => "shift[name]")
    end
  end
end
