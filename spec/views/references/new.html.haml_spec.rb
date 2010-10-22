require 'spec_helper'

describe "references/new.html.haml" do
  before(:each) do
    assign(:reference, stub_model(Reference,
      :employee_id => 1,
      :name => "MyString",
      :contact_info => "MyString",
      :relationship => "MyString"
    ).as_new_record)
  end

  it "renders new reference form" do
    render

    # Run the generator again with the --webrat-matchers flag if you want to use webrat matchers
    assert_select "form", :action => references_path, :method => "post" do
      assert_select "input#reference_employee_id", :name => "reference[employee_id]"
      assert_select "input#reference_name", :name => "reference[name]"
      assert_select "input#reference_contact_info", :name => "reference[contact_info]"
      assert_select "input#reference_relationship", :name => "reference[relationship]"
    end
  end
end
