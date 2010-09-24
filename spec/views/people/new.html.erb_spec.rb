require 'spec_helper'

describe "people/new.html.erb" do
  before(:each) do
    assign(:person, stub_model(Person,
      :new_record? => true,
      :user_id => 1,
      :last_name => "MyString",
      :first_name => "MyString",
      :middle_name => "MyString",
      :address1 => "MyString",
      :address2 => "MyString",
      :city => "MyString",
      :state => "MyString",
      :zipcode => "MyString",
      :phone1 => "MyString",
      :phone2 => "MyString"
    ))
  end

  it "renders new person form" do
    render

    rendered.should have_selector("form", :action => people_path, :method => "post") do |form|
      form.should have_selector("input#person_user_id", :name => "person[user_id]")
      form.should have_selector("input#person_last_name", :name => "person[last_name]")
      form.should have_selector("input#person_first_name", :name => "person[first_name]")
      form.should have_selector("input#person_middle_name", :name => "person[middle_name]")
      form.should have_selector("input#person_address1", :name => "person[address1]")
      form.should have_selector("input#person_address2", :name => "person[address2]")
      form.should have_selector("input#person_city", :name => "person[city]")
      form.should have_selector("input#person_state", :name => "person[state]")
      form.should have_selector("input#person_zipcode", :name => "person[zipcode]")
      form.should have_selector("input#person_phone1", :name => "person[phone1]")
      form.should have_selector("input#person_phone2", :name => "person[phone2]")
    end
  end
end
