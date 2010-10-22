require 'spec_helper'

describe "references/edit.html.haml" do
  before(:each) do
    @reference = assign(:reference, stub_model(Reference,
      :new_record? => false,
      :employee_id => 1,
      :name => "MyString",
      :contact_info => "MyString",
      :relationship => "MyString"
    ))
  end

  it "renders the edit reference form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => reference_path(@reference), :method => "post" do
      assert_select "input#reference_employee_id", :name => "reference[employee_id]"
      assert_select "input#reference_name", :name => "reference[name]"
      assert_select "input#reference_contact_info", :name => "reference[contact_info]"
      assert_select "input#reference_relationship", :name => "reference[relationship]"
    end
  end
end
